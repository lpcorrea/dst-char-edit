require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/panic"
require "behaviours/chaseandattack"
-- require "behaviours/doaction"

local SKYHOUND_VALUE = TUNING.SKYHOUND_VALUE

local TARGET_FOLLOW_DIST = 4
local MAX_FOLLOW_DIST = 4.5

local MAX_CHASE_TIME = 4
local MAX_CHASE_DIST = 15
-- critters
local COMBAT_TOO_CLOSE_DIST = 5                 -- distance for find enitities check
local COMBAT_TOO_CLOSE_DIST_SQ = COMBAT_TOO_CLOSE_DIST * COMBAT_TOO_CLOSE_DIST
local COMBAT_SAFE_TO_WATCH_FROM_DIST = 8        -- will run to this distance and watch if was too close
local COMBAT_SAFE_TO_WATCH_FROM_MAX_DIST = 12   -- combat is quite far away now, better catch up
local COMBAT_SAFE_TO_WATCH_FROM_MAX_DIST_SQ = COMBAT_SAFE_TO_WATCH_FROM_MAX_DIST * COMBAT_SAFE_TO_WATCH_FROM_MAX_DIST
local COMBAT_TIMEOUT = 6

local MAX_PLAYFUL_FIND_DIST = 4
local MAX_PLAYFUL_KEEP_DIST_FROM_OWNER = 6
local MAX_DOMINANTTRAIT_PLAYFUL_FIND_DIST = 6
local MAX_DOMINANTTRAIT_PLAYFUL_KEEP_DIST_FROM_OWNER = 9
local PLAYFUL_OFFSET = 2

local function GetOwner(inst)
    return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower.leader == target
end

local function OwnerIsClose(inst)
    local owner = GetOwner(inst)
    return owner ~= nil and owner:IsNear(inst, MAX_FOLLOW_DIST)
end

local function LoveOwner(inst)
    if inst.sg:HasStateTag("busy") then
        return nil
    end

    local owner = GetOwner(inst)
    return owner ~= nil
        and not owner:HasTag("playerghost")
        and (GetTime() - (inst.sg.mem.prevnuzzletime or 0) > TUNING.CRITTER_NUZZLE_DELAY) 
        and math.random() < 0.05
        and BufferedAction(inst, owner, ACTIONS.NUZZLE)
        or nil
end

-------------------------------------------------------------------------------
--  Play With Other Critters

local function PlayWithPlaymate(self)
    self.inst:PushEvent("critterplayful", {target=self.playfultarget})
end

local function FindPlaymate(self)
    local owner = GetOwner(self.inst)

    local is_playful = self.inst.components.crittertraits:IsDominantTrait("playful")
    local max_dist_from_owner = is_playful and MAX_DOMINANTTRAIT_PLAYFUL_KEEP_DIST_FROM_OWNER or MAX_PLAYFUL_KEEP_DIST_FROM_OWNER

    local can_play = self.inst:IsPlayful() and self.inst:IsNear(owner, max_dist_from_owner)

    -- Try to keep the current playmate
    if self.playfultarget ~= nil and self.playfultarget:IsValid() and can_play then
        return true
    end

    local find_dist = is_playful and MAX_DOMINANTTRAIT_PLAYFUL_FIND_DIST or MAX_PLAYFUL_FIND_DIST

    -- Find a new playmate
    local we_fly = self.inst:HasTag("flying")
    self.playfultarget = can_play and
        not owner.components.locomotor:WantsToMoveForward() and
        FindEntity(self.inst, find_dist, 
            function(v)
                return (v.IsPlayful == nil or v:IsPlayful()) and v:IsNear(owner, max_dist_from_owner) and (we_fly or v:IsOnPassablePoint())
            end, nil, nil, self.inst.playmatetags)
        or nil

    return self.playfultarget ~= nil
end

-------------------------------------------------------------------------------
--  Combat Avoidance

local function _avoidtargetfn(self, target)
    if target == nil or not target:IsValid() then
        return false
    end

    local owner = self.inst.components.follower.leader
    local owner_combat = owner ~= nil and owner.components.combat or nil
    local target_combat = target.components.combat
    if owner_combat == nil or target_combat == nil then
        return false
    elseif target_combat:TargetIs(owner)
        or (target.components.grouptargeter ~= nil and target.components.grouptargeter:IsTargeting(owner)) then
        return true
    end

    local distsq = owner:GetDistanceSqToInst(target)
    if distsq >= COMBAT_SAFE_TO_WATCH_FROM_MAX_DIST_SQ then
        -- Too far
        return false
    elseif distsq < COMBAT_TOO_CLOSE_DIST_SQ and target_combat:HasTarget() then
        -- Too close to any combat
        return true
    end

    -- Is owner in combat with target?
    -- Are owner and target both in any combat?
    local t = GetTime()
    return  (   (owner_combat:IsRecentTarget(target) or target_combat:HasTarget()) and
                math.max(owner_combat.laststartattacktime or 0 , owner_combat.lastdoattacktime or 0) + COMBAT_TIMEOUT > t
            ) or
            (   owner_combat.lastattacker == target and
                owner_combat:GetLastAttackedTime() + COMBAT_TIMEOUT > t
            )
end

local function CombatAvoidanceFindEntityCheck(self)
    return function(ent)
            if _avoidtargetfn(self, ent) then
                self.inst:PushEvent("critter_avoidcombat", {avoid=true})
                self.runawayfrom = ent
                return true
            end
            return false
        end
end

local function ValidateCombatAvoidance(self)
    if self.runawayfrom == nil then
        return false
    end

    if not self.runawayfrom:IsValid() then
        self.inst:PushEvent("critter_avoidcombat", {avoid=false})
        self.runawayfrom = nil
        return false
    end

    if not self.inst:IsNear(self.runawayfrom, COMBAT_SAFE_TO_WATCH_FROM_MAX_DIST) then
        return false
    end

    if not _avoidtargetfn(self, self.runawayfrom) then
        self.inst:PushEvent("critter_avoidcombat", {avoid=false})
        self.runawayfrom = nil
        return false
    end

    return true
end

----------------- SkyHound Action
local function IsState(inst, tags, no_tags, full)
    if tags then
        for _, v in pairs(tags) do
            if not inst:HasTag(v) then
                return false
            end
        end
    end
    if no_tags then
        for _, v in pairs(no_tags) do
            if inst:HasTag(v) then
                return false
            end
        end
    end
    if full == false then
        return not inst.components.inventory:IsFull()
    elseif full == true then
        return inst.components.inventory:IsFull()
    elseif full == nil then
        return true
    end
end

local function IsAnger(inst)
    return false --IsState(inst, {"skyhound_very_hunger"}, {"skyhound_no_bite"})
end

local function CanBite(item, inst)
    if not item:IsValid() then
        return
    end
    if item:IsInLimbo() then
        return
    end
    if not item.components.health or item.components.health:IsDead() then
        return
    end
    -- if not item.components.combat or not inst.components.combat:CanTarget(item) then
    --     return
    -- end
    if not item:IsOnPassablePoint() then
        return
    end
    if inst.components.follower and inst.components.follower.leader == item then
        return
    end
    if item then
        if item:HasTag("skyhound_bite") and item:HasTag("player") then
            return true
        end
        if not item.components.combat or not inst.components.combat:CanTarget(item) then
            return
        end
        return true
    end
end

local function BiteOther(inst)
    if not IsAnger(inst) then
        return
    end
    if inst.sg:HasStateTag("busy") then return end
    local target = FindEntity(inst, SKYHOUND_VALUE.range_bite, 
        CanBite, nil, {"walll"})
    if target then
        return BufferedAction(inst, target, ACTIONS.SKYHOUND_BITE)
    end
end

local function IsHunger(inst)
    return false --IsState(inst, {"skyhound_hunger"},  {"skyhound_no_eat"})
end


local function IsFood(item, inst)
    return inst.components.eater
        and item:IsOnPassablePoint()
        and inst.components.eater:CanEat(item)
        and not inst:HasTag("skyhound_no_eat")
		and not item.prefab == "powcake"
		and not item.prefab == "mandrake"
		and not item.prefab == "pigskin"
end

local function FindFood(inst)
    if not IsHunger(inst) then
        return
    end
    if inst.sg:HasStateTag("busy") then return end
    local target = FindEntity(inst, SKYHOUND_VALUE.range_food, 
        IsFood, nil, nil)
    if target then
        return BufferedAction(inst, target, ACTIONS.EAT)
    end
end

local function IsHuntState(inst)
    return IsState(inst, nil,
        {"skyhound_pick","skyhound_no_hunt"}, false)
end

local function CanHunt(item, inst)
    return item.prefab == "rabbit"
        and item:IsOnPassablePoint()
end

local function GoToHunt(inst)
    if not IsHuntState(inst) then
        return
    end
    local target = FindEntity(inst, SKYHOUND_VALUE.range_hunt, 
        CanHunt, nil, nil)
    if target then
        return BufferedAction(inst, target, ACTIONS.SKYHOUND_HUNT)
    end
end

local function IsPickState(inst)
    return IsState(inst, {"skyhound_pick"}, {}, nil)
end

local function CanPick(item, inst)
    if item.components.inventoryitem then
    if inst.components.skyhoundleash then
        local pet = inst.components.skyhoundleash:GetPet()
        local invitem = pet.components.inventory:GetItemInSlot(1)
    if pet and pet.components.skyhoundpet then
    if invitem == nil 
    or invitem.prefab == pet.components.skyhoundpet:GetItemString() then
    if item.prefab == pet.components.skyhoundpet:GetItemString() then
        if item.components.stackable and pet.components.inventory then
            if invitem then
                if invitem.components.stackable then
                    local size =  item.components.stackable.stacksize
                    local size2 = invitem.components.stackable.stacksize
                    if size + size2 <= invitem.components.stackable.maxsize then
                        return true
                    end
                end
            else
                return true
            end
        end
    end
    end
    end
    end
    end
end

local function GoToPick(inst)
    if not IsPickState(inst) then
        return
    end
    local find_target = inst.components.inventory:GetItemInSlot(1)
    if find_target and (find_target.components.stackable == nil
    or find_target.components.stackable:IsFull()) then
        inst:RemoveTag("skyhound_pick")
        return
    end
    if not (inst.components.skyhoundpet
    and inst.components.skyhoundpet:GetItemString()) then
        return
    end
    if find_target then
        inst.skyhound_pick_prefab = find_target.prefab
    end
    local owner = GetOwner(inst)
    local target = FindEntity(owner, SKYHOUND_VALUE.range_pick, 
        CanPick, nil, nil)
    if target then
        return BufferedAction(inst, target, ACTIONS.PICKUP)
    end
end

-------------------------------------------------------------------------------
--  Brain

local SkyHoundBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

function SkyHoundBrain:OnStart()
    local root =
    PriorityNode({
        WhileNode( function() 
            return self.inst.components.follower.leader
                and not self.inst.components.follower.leader:HasTag("playerghost")
                and not self.inst:HasTag("skyhound_wait") 
                and not self.inst:HasTag("skyhound_should_wait")
        end, "Has Owner",
            PriorityNode{
                WhileNode(function()
                    return self.inst:HasTag("skyhound_warg")
                end, "fightning",
                    ChaseAndAttack(self.inst, MAX_CHASE_TIME, MAX_CHASE_DIST) 
                 ),

                DoAction(self.inst, GoToPick, "go to pick", true),
                DoAction(self.inst, GoToHunt, "go to hunt", true),
                --DoAction(self.inst, FindFood, "find food", true),
                --DoAction(self.inst, BiteOther, "bite other", true),
                WhileNode(function()
                    return not self.inst:HasTag("skyhound_warg")
                end, "I'm pet",
                    PriorityNode{
                    -- Combat Avoidance
                        PriorityNode{
                            RunAway(self.inst, {tags={"_combat", "_health"}, notags={"wall", "INLIMBO"}, fn=CombatAvoidanceFindEntityCheck(self)}, COMBAT_TOO_CLOSE_DIST, COMBAT_SAFE_TO_WATCH_FROM_DIST),
                            WhileNode( function() return ValidateCombatAvoidance(self) end, "Is Near Combat",
                                FaceEntity(self.inst, GetOwner, KeepFaceTargetFn)
                                ),
                        },

                        WhileNode(function() return FindPlaymate(self) end, "Playful",
                            SequenceNode{
                                WaitNode(6),
                                PriorityNode{
                                    Leash(self.inst, function() return self.playfultarget:GetPosition() end, PLAYFUL_OFFSET, PLAYFUL_OFFSET),
                                    ActionNode(function() PlayWithPlaymate(self) end),
                                    StandStill(self.inst),
                                },
                            }),
                        Follow(self.inst, function() return self.inst.components.follower.leader end, 0, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
                        FailIfRunningDecorator(FaceEntity(self.inst, GetOwner, KeepFaceTargetFn)),
                        WhileNode(function() return OwnerIsClose(self.inst) and self.inst:IsAffectionate() end, "Affection",
                            SequenceNode{
                                WaitNode(4),
                                DoAction(self.inst, LoveOwner),
                            }),
                        StandStill(self.inst),
                    }),
                Follow(self.inst, function() 
                    return self.inst.components.follower.leader 
                end, 0, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
                FaceEntity(self.inst, GetOwner, KeepFaceTargetFn),
            }),

        StandStill(self.inst),
    }, .25)
    self.bt = BT(self.inst, root)
end

return SkyHoundBrain
