local assets = {
    Asset("ANIM", "anim/skyhound_moon_build.zip"),
    Asset("ANIM", "anim/skyhound_moon_build_gold.zip"),
}

local SKYHOUND_VALUE = TUNING.SKYHOUND_VALUE

local function get_leader(inst)
    local leader = nil
    if inst.components.follower then
        leader = inst.components.follower:GetLeader() 
    elseif inst.replica.follower then
        leader = inst.replica.follower:GetLeader()
    end
    return leader
end

local function morph2pet(inst)
    --inst:RemoveTag("skyhound_warg")
    inst.AnimState:SetBank("pupington")
    -- inst.AnimState:SetBuild("pupington_build")
    -- inst.AnimState:SetBank("skyhound_build")
    inst.AnimState:SetBuild("skyhound_build")
    inst:SetStateGraph("SGskyhound")
    inst.Transform:SetFourFaced()
    if not inst:HasTag("skyhound_warg_hunger") then
        inst.Transform:SetScale(1, 1, 1)
    end
    if inst.components.skyhoundwarg then
        inst.components.skyhoundwarg:Trigger(false)
    end
end

-- local function retarget_fn(inst)
-- end

local RETARGET_MUST_TAGS = { "_combat" }
local RETARGET_CANT_TAGS = { "playerghost", "INLIMBO" }
local function retarget_fn(inst)
    --Find things attacking leader
    local leader = inst.components.follower:GetLeader()
    return leader ~= nil
        and FindEntity(
            leader,
            TUNING.SHADOWWAXWELL_TARGET_DIST,
            function(guy)
                return guy ~= inst
                    and (guy.components.combat:TargetIs(leader) or
                        guy.components.combat:TargetIs(inst))
                    and inst.components.combat:CanTarget(guy)
            end,
            RETARGET_MUST_TAGS, -- see entityreplica.lua
            RETARGET_CANT_TAGS
        )
        or nil
end

local function keeptargetfn(inst, target)
    --Is your leader nearby and your target not dead? Stay on it.
    --Match KEEP_WORKING_DIST in brain
    return inst.components.follower:IsNearLeader(14)
        and inst.components.combat:CanTarget(target)
		and target.components.minigame_participator == nil
end
--[[
local function keep_target_fn(inst, target)
    if target and target.components.combat 
    and target.components.health 
    and not target.components.health:IsDead() 
    and not (inst.components.follower
    and inst.components.follower.leader == target
    or inst.components.follower:IsLeaderSame(target)) then 
        return true
    end
end]]

local function on_attacked(inst, data)
    local attacker = data.attacker
    inst:ClearBufferedAction()
    if attacker then
        inst.components.combat:SetTarget(attacker)
    end
end

-- 移除相关标签
local function on_timerdone(inst, data)
    if data.name then
        inst:RemoveTag(data.name)
    end
end

-- 改变饥饿速率
local function on_skyhound_wait(inst, data)
    local rate = data.wait and SKYHOUND_VALUE.hunger_wait_rate or SKYHOUND_VALUE.hunger_rate

end
local function IsPlayful(inst)
    return true
end

local function IsAffectionate(inst)
    return true
end

local function IsSuperCute(inst)
    return true
end
local function GetPeepChance(inst)
    return 0
end
--[[
 座狼状态下死亡，召唤一只新的宠物哮天犬，继承之前的饥饿值
 普通状态下死亡，冰冻周围生物
]]
local function on_death(inst, data)
    if inst:HasTag("skyhound_warg") then
        if inst.components.locomotor ~= nil then
            inst.components.locomotor:StopMoving()
        end
            if inst.components.follower then
                if inst.components.inventory then
                    inst.components.inventory:DropEverything()
                end
                local leader = inst.components.follower:GetLeader()
                if leader and leader.components.skyhoundleash then
                    leader.components.skyhoundleash:LosePet()
                    leader:RemoveTag("houndfriend")
                    local pt = inst:GetPosition()
                    local pet = leader.components.skyhoundleash:SpawnPetAt(pt.x, pt.y, pt.z, true)
                end
            end

            inst:AddTag("NOCLICK")
            inst.persists = false
            inst:StopBrain()
            inst.sg:Stop()
            inst:DoTaskInTime( 0.7, ErodeAway)
            inst.AnimState:PlayAnimation("death")
            RemovePhysicsColliders(inst)
            inst:DoTaskInTime(0, function()
                inst.SoundEmitter:PlaySound("dontstarve/common/destroy_pot")
                inst.SoundEmitter:PlaySoundWithParams("dontstarve/creatures/together/antlion/sfx/ground_break", { size = .1 })
                inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/together/claywarg/death")
            end)
    end
end

-- 抚摸后吐出物品
local function on_pet_event(inst, data)
    if data and data.petter then
        local leader = get_leader(inst)
        if data.petter == leader then
            inst:RemoveTag("skyhound_pick")
            inst:AddTag("skyhound_no_eat")
            if inst.components.inventory then
                inst.components.inventory:DropEverything()
            end
            if inst.components.timer then
                inst.components.timer:StartTimer("skyhound_no_eat", TUNING.SKYHOUND_VALUE.time_no_eat)
            end
            if inst.components.skyhoundpet then
                inst.components.skyhoundpet:SetItemString(nil)
            end
        end
    end
end

local function OnSave(inst, data)
end

local function OnLoad(inst, data)
    -- 吐出物品
    if inst.components.inventory
    and inst.components.inventory:IsFull() then
        inst.AnimState:PlayAnimation("shake")
        inst.components.inventory:DropEverything()
    end
end

local function OnLoadPostPass(inst)
end

local function OnPreLoad(inst, data)
end

------------------------------------------------------
local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()
    inst.entity:AddMiniMapEntity()

    inst.DynamicShadow:SetSize(2.5, 1.5)

    inst.Transform:SetSixFaced()
    inst.AnimState:SetBank("skyhound_moon_build")
    inst.AnimState:SetBuild("skyhound_moon_build")
    inst.Transform:SetScale(.6, .6, .6)
    inst.AnimState:PlayAnimation("idle_loop")

    inst.MiniMapEntity:SetIcon("skyhound.tex")
	inst.MiniMapEntity:SetCanUseCache(false)

    MakeCharacterPhysics(inst, 1, .5)
    local phys = inst.Physics
    phys:ClearCollisionMask()
    phys:CollidesWith(COLLISION.WORLD)

    inst:AddTag("scarytoprey")
    inst:AddTag("critter")  -- 小动物
    inst:AddTag("companion")  -- 同伴
    inst:AddTag("notraptrigger")  -- 不触发陷阱
    inst:AddTag("noauradamage")  -- 不受范围伤害？
    inst:AddTag("small_livestock")  -- 小牲畜
    inst:AddTag("NOBLOCK")
    inst:AddTag("skyhound")
    inst:AddTag("skyhound_warg")

    -- 测试用
    -- inst:AddComponent("talker")
    -- inst.components.talker.fontsize = 30
    -- inst.components.talker.font = TALKINGFONT
    -- inst.components.talker.colour = Vector3(133/255, 140/255, 167/255)
    -- inst.components.talker.offset = Vector3(0, -400, 0)
    -- inst.components.talker:MakeChatter()
    inst:AddComponent("spawnfader")

    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.prefab = "skyhound_warg"
    inst.components.myth_itemskin.character = "yangjian"
    inst.components.myth_itemskin:SetData{
        default = {
            anim = {build = "skyhound_moon_build"},
        },
        gold = {
            anim = {build = "skyhound_moon_build_gold"},
        },
    }

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    
    inst.GetPeepChance = GetPeepChance
    inst.IsAffectionate = IsAffectionate
    inst.IsSuperCute = IsSuperCute
    inst.IsPlayful = IsPlayful

    inst:AddComponent("inspectable")
    inst:AddComponent("leader")
    inst:AddComponent('follower')
    inst.components.follower:KeepLeaderOnAttacked()
    inst.components.follower.keepdeadleader = true
    inst.components.follower.keepleaderduringminigame = true
    inst:AddComponent("sleeper")

    local standard_diet = { FOODGROUP.OMNI }
    inst:AddComponent("eater")
    inst.components.eater:SetDiet(standard_diet, standard_diet)

    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = SKYHOUND_VALUE.speed
    inst.components.locomotor.runspeed = SKYHOUND_VALUE.speed_run
    inst.components.locomotor:SetAllowPlatformHopping(true)
    inst:AddComponent("embarker")  -- 上船者
    inst.components.embarker.embark_speed = SKYHOUND_VALUE.speed
    inst:AddComponent("drownable")  -- 淹死
    inst:AddComponent("timer")

    inst:AddComponent("inventory")
    inst.components.inventory.maxslots = 1

    inst:AddComponent("skyhoundwarg")
    inst.components.skyhoundwarg:Trigger(true)
    inst:AddComponent("skyhoundpet")

    inst:AddComponent("combat")
    inst.components.combat:SetDefaultDamage(SKYHOUND_VALUE.dmg)
    inst.components.combat:SetRange(SKYHOUND_VALUE.range_attack)
    inst.components.combat:SetAttackPeriod(SKYHOUND_VALUE.attack_period)
    inst.components.combat:SetRetargetFunction(3, retarget_fn)
    inst.components.combat:SetKeepTargetFunction(keeptargetfn)
    
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.MINE)
    inst.components.workable:SetWorkLeft(5)
    inst.components.workable:SetOnFinishCallback(on_death)

    --inst.components.workable:SetOnWorkCallback(onhit) 

    inst:AddComponent("lootdropper")
    --inst.components.lootdropper:SetLoot({"skyhound_tooth"})

    inst:ListenForEvent("timerdone", on_timerdone)
    inst:ListenForEvent("critter_on_pet", on_pet_event)
    
    inst:SetBrain(require "brains/skyhoundbrain")
    inst:SetStateGraph("SGskyhound_warg")

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad
    inst.OnPreLoad = OnPreLoad
    inst.OnLoadPostPass = OnLoadPostPass

    return inst
end

return Prefab("skyhound_warg", fn, assets)