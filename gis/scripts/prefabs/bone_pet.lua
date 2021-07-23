local prefabs =
{
    "white_bone_raisefx",
    "white_bone_changefx",
}

local brain = require "brains/bone_pet"

SetSharedLootTable( 'bone_pet',
{
    {'boneshard',             1.00},
    {'boneshard',             1.00},
})

local function OnTimer(inst, data)
    if data.name == "timeover" then
		if not inst.components.health:IsDead() then
			inst.timedone = true
			inst.components.health:Kill()
		end
    end	
end

local function OnAttacked(inst, data)
    if data.attacker ~= nil then
        if data.attacker.components.bone_pets ~= nil and
            data.attacker.components.bone_pets:IsPet(inst) then
				inst.timedone = true
				inst.components.health:Kill()
		elseif data.attacker.components.combat ~= nil then
            inst.components.combat:SuggestTarget(data.attacker)
        end
    end
end

local function retargetfn(inst)
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
            { "_combat" }, -- see entityreplica.lua
            { "playerghost", "INLIMBO" }
        )
        or nil
end

local function keeptargetfn(inst, target)
    return inst.components.follower:IsNearLeader(14)
        and inst.components.combat:CanTarget(target)
		and target.components.minigame_participator == nil
end


local function nokeeptargetfn(inst)
    return false
end

local function noncombatantfn(inst)
    inst.components.combat:SetKeepTargetFunction(nokeeptargetfn)
end

local my_work = {
	CHOP = true,
	DIG = true,
	MINE = true,
}

local function ShouldAcceptItem(inst, item)
    if item.components.equippable ~= nil then
        if item.components.equippable.equipslot == EQUIPSLOTS.HANDS  then
            for k, v in pairs(my_work) do
                if item:HasTag(k.."_tool") then
                    return true
                end
            end
        else
            return true
        end
    end
	return false
end

local function OnGetItemFromPlayer(inst, giver, item)
    if item.components.equippable ~= nil  then
        local current = inst.components.inventory:GetEquippedItem(item.components.equippable.equipslot)
        if current ~= nil then
            inst.components.inventory:DropItem(current)
        end
        inst.components.inventory:Equip(item)
        if not inst.get_tools and item.components.equippable.equipslot == EQUIPSLOTS.HANDS then
            inst.get_tools = true
            local timrleft = inst.components.timer:GetTimeLeft("timeover")
            inst.components.timer:SetTimeLeft("timeover", timrleft/2)
        end
    end
end

local function onload(inst, data)
    if data ~= nil and data.get_tools ~= nil then
        inst.get_tools = data.get_tools
    end
end

local function onsave(inst, data)
    data.get_tools = inst.get_tools
end

local function MakeMinion(prefab, master_postinit)
    local assets =
    {
        Asset("ANIM", "anim/bone_pet.zip"),
        Asset("SOUND", "sound/wilton.fsb"),
		Asset("ANIM", "anim/bone_pet_actions.zip"),
    }

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()
		inst.entity:AddDynamicShadow()

        MakeGhostPhysics(inst, 1, 0.5)
		inst.DynamicShadow:SetSize(1.3, .6)

        inst.Transform:SetFourFaced(inst)

        inst.AnimState:SetBank("wilson")
        inst.AnimState:SetBuild("bone_pet")
        inst.AnimState:PlayAnimation("idle")

        inst.AnimState:Hide("ARM_carry")
		
        inst:AddTag("scarytoprey")
        inst:AddTag("NOBLOCK")
		inst:AddTag("trader")
        inst:AddTag("bone_pet")
		inst:AddTag("companion")
		
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.get_tools = false

        inst:AddComponent("locomotor")
        inst.components.locomotor.runspeed = TUNING.SHADOWWAXWELL_SPEED
        inst.components.locomotor.pathcaps = { ignorecreep = true }
        inst.components.locomotor:SetSlowMultiplier(.6)

        inst:AddComponent("health")
        inst.components.health:SetMaxHealth(75)
        inst.components.health.nofadeout = true

        inst:AddComponent("combat")
        inst.components.combat.hiteffectsymbol = "torso"
        inst.components.combat:SetRange(2)
		inst.components.combat:SetDefaultDamage(30)
		inst.components.combat:SetAttackPeriod(0.5)
		inst.components.combat:SetRetargetFunction(2, retargetfn)
		inst.components.combat:SetKeepTargetFunction(keeptargetfn)

        local CalcDamage = inst.components.combat.CalcDamage
        inst.components.combat.CalcDamage = function(self,target, weapon, multiplier)
            weapon = nil
            return CalcDamage(self,target, weapon, multiplier)
        end

        inst:AddComponent("follower")
        inst.components.follower:KeepLeaderOnAttacked()
        inst.components.follower.keepdeadleader = true
        inst.components.follower.keepleaderduringminigame = true
		
		inst:AddComponent("inventory")
		
		inst:AddComponent("trader")
		inst.components.trader:SetAcceptTest(ShouldAcceptItem)
		inst.components.trader.onaccept = OnGetItemFromPlayer
		inst.components.trader.deleteitemonaccept = false
		
		inst:AddComponent("efficientuser")
        inst.components.efficientuser:AddMultiplier(ACTIONS.CHOP,   1.5, inst)
        inst.components.efficientuser:AddMultiplier(ACTIONS.MINE,   1.5, inst)
        inst.components.efficientuser:AddMultiplier(ACTIONS.HAMMER, 1.5, inst)
	    inst.components.efficientuser:AddMultiplier(ACTIONS.ATTACK, 0, inst)

		inst:AddComponent("inspectable")
        inst:SetBrain(brain)
        inst:SetStateGraph("SGbone_pet")
		
		inst:AddComponent("lootdropper")
		inst.components.lootdropper:SetChanceLootTable("bone_pet")

        inst:ListenForEvent("attacked", OnAttacked)
		
		inst:AddComponent("timer")
		inst.components.timer:StartTimer("timeover", 480*2)
		inst:ListenForEvent("timerdone", OnTimer)

        inst.OnSave = onsave
        inst.OnLoad = onload

        return inst
    end

    return Prefab(prefab, fn, assets, prefabs)
end

return MakeMinion("bone_pet")

