local assets =
{
    Asset("ANIM", "anim/ds_pig_basic.zip"),
    Asset("ANIM", "anim/ds_pig_actions.zip"),
    Asset("ANIM", "anim/ds_pig_attacks.zip"),
    Asset("ANIM", "anim/scpzombie.zip"),
    Asset("SOUND", "sound/pig.fsb"),
}

local prefabs =
{
    "spoiled_food",
}

local MAX_TARGET_SHARES = 5
local SHARE_TARGET_DIST = 30
--[[
local function ontalk(inst, script)
    inst.SoundEmitter:PlaySound("dontstarve/pig/grunt")
end
]]

local function ShouldAcceptItem(inst, item)
    if item.components.equippable ~= nil and item.components.equippable.equipslot == EQUIPSLOTS.HEAD then
        return true
    end
end

local function OnGetItemFromPlayer(inst, giver, item)
    if item.components.equippable ~= nil and item.components.equippable.equipslot == EQUIPSLOTS.HEAD then
        local current = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if current ~= nil then
            inst.components.inventory:DropItem(current)
        end
        inst.components.inventory:Equip(item)
        inst.AnimState:Show("hat")
    end
end

local function OnAttackedByDecidRoot(inst, attacker)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, SpringCombatMod(SHARE_TARGET_DIST) * .5, { "_combat", "_health", "scpzombie" }, { "INLIMBO" }) --
    local num_helpers = 0
    for i, v in ipairs(ents) do
        if v ~= inst and not v.components.health:IsDead() then
            v:PushEvent("suggest_tree_target", { tree = attacker })
            num_helpers = num_helpers + 1
            if num_helpers >= MAX_TARGET_SHARES then
                break
            end
        end
    end
end

local function onattackother(inst, data)

    local v = data.target
    local runspeed

    if v and v.components.locomotor and not (v:HasTag("veggie") or v:HasTag("structure") or v:HasTag("wall")) then

        if v:HasTag("scpslowed") then
            if v.scpslowtask then
                v.scpslowtask:Cancel()
                v.scpslowtask = nil
            end

            local runspeed = v.components.locomotor.runspeed
            local walkspeed = v.components.locomotor.walkspeed

            v.scpslowtask = v:DoTaskInTime(5, function() 
                v.components.locomotor.runspeed = runspeed * 4
                v.components.locomotor.walkspeed = walkspeed * 4
                v:RemoveTag("scpslowed")
            end)

            v:AddTag("scpslowed")
        else
            local runspeed = v.components.locomotor.runspeed
            local walkspeed = v.components.locomotor.walkspeed

            v.components.locomotor.runspeed = runspeed * 0.25
            v.components.locomotor.walkspeed = walkspeed * 0.25

            v.scpslowtask = v:DoTaskInTime(5, function() 
                v.components.locomotor.runspeed = runspeed
                v.components.locomotor.walkspeed = walkspeed
                v:RemoveTag("scpslowed")
            end)
            v:AddTag("scpslowed")
        end
    end
end

--local function IsScpZombie(dude)
--    return dude:HasTag("scpzombie")
--end

local function OnAttacked(inst, data)
    --print(inst, "OnAttacked")
    local attacker = data.attacker
    inst:ClearBufferedAction()

    if attacker.prefab == "deciduous_root" and attacker.owner ~= nil then 
        OnAttackedByDecidRoot(inst, attacker.owner)
    elseif attacker.prefab ~= "deciduous_root" then
        inst.components.combat:SetTarget(attacker)
        --inst.components.combat:ShareTarget(attacker, SHARE_TARGET_DIST, IsScpZombie, MAX_TARGET_SHARES)
    end
end

local function killed(inst, data)
    local v = data.victim

    if v:HasTag("pig") and not v:HasTag("zombie") then -- and inst.components.scpcomponent:CanSpawn()

        local x,y,z = v.Transform:GetWorldPosition()
        local rot = v.Transform:GetRotation()

        inst:DoTaskInTime(1.3, function()

            local corpse = SpawnPrefab("custom_pigcorpse_fx")
            corpse.Transform:SetRotation(rot)
            corpse:DoTaskInTime(0.1, function()
                corpse.Transform:SetPosition(x, y, z)
            end)
        end)
    end 
end

local function NormalKeepTargetFn(isnt, target)
    return target and target:IsValid()
end

local function NormalRetargetFn(inst)
    return FindEntity(inst, TUNING.PIG_TARGET_DIST,
        function(guy)
            if not guy.LightWatcher or guy.LightWatcher:IsInLight() then
                return guy:HasTag("monster") and guy.components.health and not guy.components.health:IsDead() and inst.components.combat:CanTarget(guy) and not 
                (inst.components.follower.leader ~= nil and guy:HasTag("abigail"))
            end
        end)
end

local function SuggestTreeTarget(inst, data)
    if data ~= nil and data.tree ~= nil and inst:GetBufferedAction() ~= ACTIONS.CHOP then
        inst.tree_target = data.tree
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    MakeCharacterPhysics(inst, 50, .5)

    inst.DynamicShadow:SetSize(1.5, .75)
    inst.Transform:SetFourFaced()

    --inst:AddTag("pig")
    inst:AddTag("scarytoprey")
    inst:AddTag("companion")
    inst:AddTag("scpzombie")

    inst.AnimState:SetBank("pigman")
    inst.AnimState:SetBuild("scpzombie")
    inst.AnimState:PlayAnimation("idle_loop", true)
    inst.AnimState:Hide("hat")
    inst.AnimState:PlayAnimation("sleep_pst")

    --Sneak these into pristine state for optimization

    inst:AddTag("trader")

    inst.lifetime = 2880

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
    inst.components.locomotor.runspeed = TUNING.PIG_RUN_SPEED --5
    inst.components.locomotor.walkspeed = TUNING.PIG_WALK_SPEED --3

    inst:AddComponent("bloomer")
    ------------------------------------------
    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(TUNING.PIG_HEALTH)
    ------------------------------------------
    inst:AddComponent("combat")
    inst.components.combat.hiteffectsymbol = "pig_torso"
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.combat:SetDefaultDamage(TUNING.PIG_DAMAGE)
    inst.components.combat:SetAttackPeriod(TUNING.PIG_ATTACK_PERIOD)
    inst.components.combat:SetKeepTargetFunction(NormalKeepTargetFn)
    inst.components.combat:SetRetargetFunction(3, NormalRetargetFn)
    inst.components.combat:SetTarget(nil)
    inst.components.combat.hiteffectsymbol = "pig_torso"
    ------------------------------------------
    MakeMediumBurnableCharacter(inst, "pig_torso")
    ------------------------------------------
    inst:AddComponent("follower")
    ------------------------------------------
    inst:AddComponent("inventory")
    inst.components.inventory.maxslot = 1
    ------------------------------------------
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot({})
    inst.components.lootdropper:AddRandomLoot("spoiled_food",1)
    inst.components.lootdropper.numrandomloot = 2
    ------------------------------------------
    inst:AddComponent("knownlocations")
    ------------------------------------------
    inst:AddComponent("trader")
    inst.components.trader:Enable()
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    ------------------------------------------
    MakeMediumFreezableCharacter(inst, "pig_torso")
    ------------------------------------------
    inst:AddComponent("inspectable")
    ------------------------------------------
    inst:ListenForEvent("attacked", OnAttacked)
    inst:ListenForEvent("suggest_tree_target", SuggestTreeTarget)

    inst:ListenForEvent("onattackother", onattackother)
    inst:ListenForEvent("killed", killed)

    local brain = require"brains/scpzombiebrain"
    inst:SetBrain(brain)
    inst:SetStateGraph("SGscpzombie")

    inst:DoPeriodicTask(0.5, function() 
        inst.lifetime = inst.lifetime - 1
        if not inst.sg:HasStateTag("dead") and inst._killtask == nil then
            if inst.lifetime <= 0 then
                inst._killtask = inst:DoTaskInTime(math.random(), inst.components.health:Kill())
            elseif inst.components.follower.leader == nil then
                inst._killtask = inst:DoTaskInTime(math.random(), inst:Remove())
            end
        end
    end)

    return inst
end

return Prefab("scpzombie", fn, assets, prefabs)