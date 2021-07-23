local easing = require("easing")
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}

local start_inv = {

	"nz_lance",
	"nz_damask",
	"nz_ring",
	
}
local function HealFromWater(inst)
	local moisture = inst.components.moisture.moisture or 0
	local heal_per_minute = 0
	if moisture >= 95 then
		heal_per_minute = 60
	elseif moisture >= 75 then
		heal_per_minute = 30		
	elseif moisture >= 50 then
		heal_per_minute = 15
	end
	if heal_per_minute > 0 and not inst.components.health:IsDead() then
		inst.components.health:DoDelta(heal_per_minute/60,true)
	end
end

local function OnKill(inst,data)
	local victim = data.victim
	if victim and not victim:HasTag('monster') and not victim:HasTag('hostile') and not victim:HasTag('wall') then
		inst.components.sanity:DoDelta(-2)
	end
	if victim and victim:HasTag('monster') and math.random()< 0.15 then
		inst.components.sanity:DoDelta(10)
	end
	if victim and victim:HasTag('epic') then
		inst.components.sanity:DoDelta(30)
	end
end

local function onbecamehuman(inst)
	inst:ListenForEvent('killed',OnKill)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "neza_speed_mod", 1)
	if inst.waterheal == nil then
		inst.waterheal = inst:DoPeriodicTask(1,HealFromWater,1)
	end
end

local function onbecameghost(inst)
	inst:RemoveEventCallback('killed',OnKill)
    if inst.waterheal ~= nil then
        inst.waterheal:Cancel()
        inst.waterheal = nil
    end
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "neza_speed_mod")
end


local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

local function sanityfn(inst)
	local moisture_delta = easing.inSine(inst.components.moisture:GetMoisture(), 0, TUNING.MOISTURE_SANITY_PENALTY_MAX, inst.components.moisture:GetMaxMoisture())
    
	for k, v in pairs(inst.components.inventory.equipslots) do
        if v.components.equippable ~= nil and v:GetIsWet() then
            moisture_delta = moisture_delta + TUNING.WET_ITEM_DAPPERNESS
        end
    end	
	
	return  - moisture_delta
end

local fireboss = { 
	dragonfly = true,
	firehound = true,
	deer_red = true,
	rhino3_red= true,
	lavae= true,
}

local function bonusdamagefn(inst, target, damage, weapon)
	if not target then  return 0 end
	if not weapon or weapon.prefab ~= "nz_lance" then  return 0 end
	if fireboss[target.prefab] or (target.prefab == "fruitdragon" and target._is_ripe) or (target.components.burnable ~= nil and target.components.burnable:IsBurning() ) then
		return (damage or 0 )
	else
		return 0
	end
end


local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "neza.tex" )
	inst:AddTag("neza")
	inst:AddTag("stronggrip")
	inst.soundsname = "sfx"
	inst.talker_path_override = 'Nezha/'
end
local function OnEat(inst,data)
	if data and data.food then
		if data.food.prefab == "fishmeat" then
			inst.components.talker:Say("浩荡东海鱼味鲜，妙哉！")
		end
	end
end
local master_postinit = function(inst)
	
    inst.components.health:SetMaxHealth(TUNING.NEZA_HEALTH)
    inst.components.hunger:SetMax(TUNING.NEZA_HUNGER)
    inst.components.sanity:SetMax(TUNING.NEZA_SANITY)
	
	inst.components.foodaffinity:AddPrefabAffinity("fishmeat", TUNING.AFFINITY_15_CALORIES_HUGE)
	
	inst.components.sanity.custom_rate_fn = sanityfn
	inst.components.sanity.neg_aura_mult = .5
	
	inst.components.combat.bonusdamagefn = bonusdamagefn
    inst.components.combat.damagemultiplier = 1
	
	local old_PrefersToEat = inst.components.eater.PrefersToEat
	inst.components.eater.PrefersToEat = function (self, food)
		if food.prefab == "wb_heart" then
			return false
		end
		return old_PrefersToEat(self, food)
	end
	inst:ListenForEvent("oneat", OnEat)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
end

return MakePlayerCharacter("neza", prefabs, assets, common_postinit, master_postinit, start_inv)
