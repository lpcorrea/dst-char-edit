local assets = {
    Asset("ANIM", "anim/skyhound_build.zip"),
    Asset("ANIM", "anim/skyhound_build_black.zip"),
    Asset("ANIM", "anim/skyhound_build_dao.zip"),
    Asset("ANIM", "anim/skyhound_build_gold.zip"),
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

-- 天狗食月
local function OnHoundEatDirty(inst)
    if TheWorld.ismastersim then
        if TheNet:IsDedicated() then
            return
        end
    end
    if inst._hound_eat_moon:value() then
        TheWorld:PushEvent("moonphasechanged2", {moonphase = "new", waxing = true})
    end
end

local function can_morph(inst)
    if not inst:HasTag("skyhound_warg")
		and TheWorld.state.isfullmoon 
    then
        return true
    end
end

local function transition(inst)
    inst._hound_eat_moon:set_local(false)  -- 天狗食月
    inst._hound_eat_moon:set(true)
    inst.sg:GoToState("transition")
end

-- 震慑猎狗
local function frighten_hound(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local dist = TUNING.SKYHOUND_VALUE.range_startle
    local hounds = TheSim:FindEntities(x, y, z, dist, { "hound" }, {"warg"})
    for _, hound in ipairs(hounds) do
        if hound ~= nil and hound.components.follower ~= nil
        and hound.components.combat then
            hound.components.combat:SetTarget(nil)
            hound:PushEvent("startle", {source=inst})
        end
    end
end

local function spawn_skyhound_warg(inst)
    if inst.components.inventory then
        inst.components.inventory:DropEverything()
    end
    if inst.components.follower then
        local leader = inst.components.follower:GetLeader()
        if leader and leader.components.skyhoundleash then
            local pt = inst:GetPosition()
            frighten_hound(inst)
            inst:Remove()
            local pet = leader.components.skyhoundleash:SpawnWargAt(pt:Get())
            -- 猎狗友好
            leader:AddTag("houndfriend")
        end
    end
end

local function morph2warg(inst)
    inst:AddTag("skyhound_warg")
    -- inst.AnimState:SetBank("claywarg")
    -- inst.AnimState:SetBuild("claywarg")
    inst.AnimState:SetBank("skyhound_moon_build")
    inst.AnimState:SetBuild("skyhound_moon_build")
    inst.Transform:SetSixFaced()
    inst.DynamicShadow:SetSize(2.5, 1.5)
    if not inst:HasTag("skyhound_warg_hunger") then
        inst.Transform:SetScale(.6, .6, .6)
    end
    inst:SetStateGraph("SGskyhound_warg")
    if inst.components.skyhoundwarg then
        inst.components.skyhoundwarg:Trigger(true)
    end
    if inst.components.crittertraits then
        inst:RemoveComponent("crittertraits")
    end
end

-- 移除相关标签
local function on_timerdone(inst, data)
    if data.name then
        inst:RemoveTag(data.name)
    end
end
-- 冰冻周围的生物
local function frozen_target(target)
    if not target:IsValid() then
        return
    end

    if target.components.sleeper ~= nil and target.components.sleeper:IsAsleep() then
        target.components.sleeper:WakeUp()
    end

    if target.components.burnable ~= nil then
        if target.components.burnable:IsBurning() then
            target.components.burnable:Extinguish()
        elseif target.components.burnable:IsSmoldering() then
            target.components.burnable:SmotherSmolder()
        end
    end

    if target.components.freezable ~= nil then
        target.components.freezable:AddColdness(10)
        target.components.freezable:SpawnShatterFX()
    end
end

--[[
 座狼状态下死亡，召唤一只新的宠物哮天犬，继承之前的饥饿值
 普通状态下死亡，冰冻周围生物
]]
local function on_death(inst, data)
    if inst:HasTag("skyhound_warg") then
    else
        local x, y, z = inst:GetPosition():Get()
        local targets = TheSim:FindEntities(x, y, z, 5, nil, {"player"})
        for _, v in pairs(targets) do
            frozen_target(v)
        end
    end
    local leader = get_leader(inst)
    if leader and leader.components.skyhoundleash then
        leader.components.skyhoundleash:TriggerHUD(false)
    end
    if inst.components.inventory then
        inst.components.inventory:DropEverything()
    end
end

local function on_pet_event(inst, data)
    if data and data.petter then
        local leader = get_leader(inst)
        if data.petter == leader then
            inst:RemoveTag("skyhound_pick")
            inst:AddTag("skyhound_no_eat")
            if inst.components.inventory then
                local item = inst.components.inventory:GetItemInSlot(1)
                if item and item.prefab == "rabbit" then
                    local rabbit = inst.components.inventory:RemoveItemBySlot(1)
                    if data.petter.components.inventory then
                        data.petter.components.inventory:GiveItem(rabbit, nil, inst:GetPosition())
                    end
                else
                    inst.components.inventory:DropEverything()
                end
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
    if inst.components.inventory
    and inst.components.inventory:IsFull() then
        inst.AnimState:PlayAnimation("emote_pet")
        inst.components.inventory:DropEverything()
    end
end

local function OnLoadPostPass(inst)
end

local function OnPreLoad(inst, data)
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
------------------------------------------------------
local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()
    inst.entity:AddMiniMapEntity()

    inst.DynamicShadow:SetSize(1, .33)

    inst.Transform:SetFourFaced(inst)
    inst.AnimState:SetBank("pupington")
    -- inst.AnimState:SetBuild("pupington_build")
    -- inst.AnimState:SetBank("skyhound_build")
    inst.AnimState:SetBuild("skyhound_build")
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

    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.prefab = "skyhound"
    inst.components.myth_itemskin.character = "yangjian"
    inst.components.myth_itemskin:SetData{
        default = {
            anim = {build = "skyhound_build"},
        },
        black = {
            anim = {build = "skyhound_build_black"},
        },
        dao = {
            anim = {build = "skyhound_build_dao"},
        },
        gold = {
            anim = {build = "skyhound_build_gold"},
        },
    }

    -- 测试用
    -- inst:AddComponent("talker")
    -- inst.components.talker.fontsize = 30
    -- inst.components.talker.font = TALKINGFONT
    -- inst.components.talker.colour = Vector3(133/255, 140/255, 167/255)
    -- inst.components.talker.offset = Vector3(0, -400, 0)
    -- inst.components.talker:MakeChatter()
    -- inst:AddComponent("spawnfader")

    -- 改变月相
    inst._hound_eat_moon = net_bool(inst.GUID, "skyhound_warg._hound_eat_moon", "skyhound_eat_moondirty")
    inst:ListenForEvent("skyhound_eat_moondirty", OnHoundEatDirty)

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

    inst.favoritefood = "monsterlasagna"
    inst.IsAffectionate = IsAffectionate
    inst.GetPeepChance = GetPeepChance
    inst.IsSuperCute = IsSuperCute
    inst.IsPlayful = IsPlayful
    inst.playmatetags = {"critter"}

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
    inst:AddComponent("skyhoundpet")

    inst:AddComponent("crittertraits")
    inst:AddComponent("lootdropper")
    --inst.components.lootdropper:SetLoot({"skyhound_tooth"})

    inst:ListenForEvent("timerdone", on_timerdone)
    inst:ListenForEvent("critter_on_pet", on_pet_event)
    inst:ListenForEvent("death", on_death)
    
    inst:SetBrain(require "brains/skyhoundbrain")
    inst:SetStateGraph("SGskyhound")

    inst.spawn_warg = spawn_skyhound_warg
    inst.can_morph = can_morph
    inst.transition = transition

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad
    inst.OnPreLoad = OnPreLoad
    inst.OnLoadPostPass = OnLoadPostPass

    return inst
end

return Prefab("skyhound", fn, assets)