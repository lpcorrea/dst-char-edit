
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
    Asset( "ANIM", "anim/yangjian.zip" ),
	Asset( "ANIM", "anim/yangjian_eye.zip" ),
	Asset( "ANIM", "anim/ghost_yangjian_build.zip" ),
	Asset( "ANIM", "anim/yangjian_eye_black.zip"),
	Asset( "ANIM", "anim/yangjian_eye_dao.zip"),
}
local prefabs = {}

local start_inv = {
	"yj_spear",
	"skyhound_tooth_start",
}

local BEAVERVISION_COLOURCUBES =
{
    day = resolvefilepath("images/colour_cubes/yangjian_fullmoon_cc.tex"),
    dusk = resolvefilepath("images/colour_cubes/yangjian_fullmoon_cc.tex"),
    night = resolvefilepath("images/colour_cubes/yangjian_fullmoon_cc.tex"),
    full_moon = resolvefilepath("images/colour_cubes/yangjian_fullmoon_cc.tex"),
}

local yangjianeye = {
	yangjian_black = "yangjian_eye_black",
	yangjian_dao = "yangjian_eye_dao",
	yangjian_gold = "yangjian_gold",
}
local function SetBeaverVision(inst, enable)
    local enable = inst._skyeye:value()
	
    if enable then
        inst.components.playervision:ForceNightVision(true)
        inst.components.playervision:SetCustomCCTable(BEAVERVISION_COLOURCUBES)
		if  TheWorld.ismastersim then
			local build =  yangjianeye[inst.components.skinner:GetClothing().base] or  "yangjian_eye"
			inst.AnimState:OverrideSymbol("headbase", build, "headbase")
			inst.AnimState:OverrideSymbol("headbase_hat", build, "headbase_hat")

			if inst.components.sanity then
				local oldpercent = inst.components.sanity:GetPercent()
				inst._oldsanityercent = oldpercent
				inst.components.sanity.yj_change = true
				inst.components.sanity:SetPercent(0.16)
				inst.components.sanity.yj_change = false
				inst.components.sanity.redirect =  function(...) end --锁定不会改变
			end
		end
    else
        inst.components.playervision:ForceNightVision(false)
        inst.components.playervision:SetCustomCCTable(nil)
		if  TheWorld.ismastersim then
			inst.AnimState:ClearOverrideSymbol("headbase")
			inst.AnimState:ClearOverrideSymbol("headbase_hat")
			if inst.components.sanity then
				inst.components.sanity.redirect =  nil
				if inst._oldsanityercent ~= nil then
					inst.components.sanity.yj_change = true
					inst.components.sanity:SetPercent(inst._oldsanityercent)
					inst.components.sanity.yj_change = false
					inst._oldsanityercent = nil
				end
			end
		end
    end
end

local function GetSandstormLevel(inst)
	--if inst.GetSandstormLevel ~= nil then
	--	return inst:GetSandstormLevel()
	if inst.GetStormLevel ~= nil then
		return inst:GetStormLevel()
	end
	return 0
end

local function gogglevision (inst,data)
    if GetSandstormLevel(inst) >= TUNING.SANDSTORM_FULL_LEVEL and inst.components.playervision
     and not inst.components.playervision:HasGoggleVision()  and inst._skyeye:value() == true then
		inst._skyeye:set(false)
		if inst.skyeyetask ~= nil then
			inst.skyeyetask:Cancel()
			inst.skyeyetask = nil		
		end
		inst:RemoveTag("skyeye")
	end
end

local function sandstormlevel(inst,data)
	if data and data.level  >= TUNING.SANDSTORM_FULL_LEVEL and inst.components.playervision
     and not inst.components.playervision:HasGoggleVision()  and inst._skyeye:value() == true then
		inst._skyeye:set(false)
		if inst.skyeyetask ~= nil then
			inst.skyeyetask:Cancel()
			inst.skyeyetask = nil		
		end
		inst:RemoveTag("skyeye")
	end
end

local function Ondeath(inst,data)
    if inst._skyeye:value() == true then
		inst._skyeye:set(false)
		if inst.skyeyetask ~= nil then
			inst.skyeyetask:Cancel()
			inst.skyeyetask = nil
		end
		inst:RemoveTag("skyeye")
	end
end

local function sanityfn(inst)
	local eyesanity = 0 
	if inst.components.skyhoundleash  and not inst.components.skyhoundleash:IsFull() then
		eyesanity = -10/60
	end
	return eyesanity
end

local function onsanitychange(inst,data)
	if inst._skyeye:value() then
		return
	end
	if inst.components.sanity.current < 32 then
		inst.components.sanity.current = 32
	end
end

local function OnEat(inst,data)
	if data and data.food then
		if data.food.prefab == "perogies" then
			inst.components.talker:Say("好吃不过饺子!")
		end
	end
end

local function onbecamehuman(inst)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "yangjian_speed_mod", 1)
	inst:ListenForEvent("gogglevision", gogglevision)
	inst:ListenForEvent("sandstormlevel", sandstormlevel)
	inst:ListenForEvent("sanitydelta", onsanitychange)
	inst:ListenForEvent("death", Ondeath)
end
local function onbecameghost(inst)
	inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "yangjian_speed_mod")
	inst:RemoveEventCallback("gogglevision", gogglevision)
	inst:RemoveEventCallback("sandstormlevel", sandstormlevel)
	inst:ListenForEvent("sanitydelta", onsanitychange)
	inst:RemoveEventCallback("death", Ondeath)
end

local function onload(inst,data)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
	if data and data._oldsanityercent ~= nil then
		inst.components.sanity:SetPercent(data._oldsanityercent)
	end
end

local function onsave(inst, data)
    data._oldsanityercent = inst._oldsanityercent or nil
end

local sky = require "screens/yj_mapscreen"
local function OnOpenMap(inst)
	if inst._skyminimap:value() then
		inst.MiniMapEntity:SetIcon( "yj_eagle.tex" )
		if  ThePlayer ~= nil and inst == ThePlayer then
			TheFrontEnd:PushScreen(sky(ThePlayer))
		end
	else
		inst.MiniMapEntity:SetIcon( "yangjian.tex" )
	end
end

local common_postinit = function(inst)
    inst:AddTag("yangjian")
	inst.talker_path_override = 'Xiao/'
	inst.soundsname = "sfx"
	inst.MiniMapEntity:SetIcon( "yangjian.tex" )

    inst._skyeye = net_bool(inst.GUID, "yangjian.skyeye", "skyeye_dirty")
    inst:ListenForEvent("skyeye_dirty", SetBeaverVision)
	
	inst._skyminimap = net_bool(inst.GUID, "yangjian.skyminimap", "skyminimap_dirty")
	--inst._skyplayer = net_string(inst.GUID, "yangjian.skyplayer", "skyplayer_dirty")
    
	if not TheNet:IsDedicated() then
        inst:ListenForEvent("skyminimap_dirty", OnOpenMap)
    end
	local old = inst.OnEntityReplicated
	inst.OnEntityReplicated = function(inst) 
		if inst.replica.sanity then
			inst.replica.sanity.IsCrazy = function(...) return false end
		end
		if old ~= nil then
			old(inst)
		end	
	end
end
local IsFlying = function(inst) return inst and inst.components.mk_flyer and inst.components.mk_flyer:IsFlying()end
local master_postinit = function(inst)

    inst.components.health:SetMaxHealth(TUNING.YANGJIAN_HEALTH)
    inst.components.hunger:SetMax(TUNING.YANGJIAN_HUNGER)
    inst.components.sanity:SetMax(TUNING.YANGJIAN_SANITY)
	inst.components.sanity.custom_rate_fn = sanityfn	
	
	inst.components.foodaffinity:AddPrefabAffinity("myth_food_sj", TUNING.AFFINITY_15_CALORIES_HUGE)

    inst.components.combat.damagemultiplier = 1
	
	inst.components.sanity.SetInducedInsanity = function(self,src, val)
		inst.components.talker:Say("区区邪物休想干扰杨戬")
		return 
	end
	
	inst.components.petleash.IsFull = function(self) return true end
	
	inst.components.builder:UnlockRecipe("book_myth")
	inst:ListenForEvent("oneat", OnEat)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	
    inst:DoTaskInTime(0.2, function()
        local my_x, my_y, my_z = inst.Transform:GetWorldPosition()
		if my_y > 1 and not IsFlying(inst) then
			inst.Physics:Teleport(my_x, 0, my_z)
		end
    end)
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	inst.OnSave = onsave
	
end

return MakePlayerCharacter("yangjian", prefabs, assets, common_postinit, master_postinit, start_inv)
