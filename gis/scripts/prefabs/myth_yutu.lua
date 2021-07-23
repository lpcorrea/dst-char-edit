
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}


local start_inv = {
	"medicine_pestle_myth",
}

local BEAVERVISION_COLOURCUBES =
{
    day = "images/colour_cubes/beaver_vision_cc.tex",
    dusk = "images/colour_cubes/beaver_vision_cc.tex",
    night = "images/colour_cubes/beaver_vision_cc.tex",
    full_moon = "images/colour_cubes/beaver_vision_cc.tex",
}

local function FlyActionFilter(inst, action)
    return action == ACTIONS.MYTHBIANHUAN
end

local allowstate = {
	idle = true,
	underground_idle = true,
	underground_jumpout = true,
	underground_jumpin = true,
	run = true,
	run_start = true,
	run_stop = true,
	underground_walk = true,
	underground_walk_pre = true,
	underground_walk_pst = true,
	item_hat = true,
	item_in = true,
}

local function stopunderground(inst,data)
	if data and not allowstate[data.statename] then
		inst._underground:set(false)
	end
end

local function OnTaskTick(inst)
	if TheWorld.state.iswet then
		inst.components.moisture:DoDelta(0.5)
	end
end

local function Empty()
end

local function SetBeaverVision(inst, enable)
    local enable = inst._underground:value()
	if enable then
		inst.DynamicShadow:Enable(false)
		inst:AddTag("myth_yutu_underground")
		inst:AddTag("notarget")
		inst.AnimState:OverrideSymbol("wormmovefx", "mole_build", "wormmovefx")
		if inst.components.inventory then
			inst.components.inventory:Close()
		end
        if inst.components.playercontroller ~= nil then
            inst.components.playercontroller.actionbuttonoverride = Empty
        end
		if inst.components.catcher ~= nil then
			inst.components.catcher:SetEnabled(false)
		end
		if inst.components.playeractionpicker ~= nil then
			inst.components.playeractionpicker:PushActionFilter(FlyActionFilter, 666)
		end
		if inst.components.grue ~= nil then
			inst.components.grue:AddImmunity("under_ground")
		end			
		if inst.components.talker ~= nil then
			inst.components.talker:IgnoreAll("under_ground")
		end
		if inst.components.firebug ~= nil then
			inst.components.firebug:Disable()
		end	
        if inst.components.hunger ~= nil then
            inst.components.hunger.burnratemodifiers:SetModifier("under_ground", 1.4)
        end
        if inst.components.sanity ~= nil then
            inst.components.sanity.dapperness = -10/60
        end
		
		if inst.components.health ~= nil then
			inst.components.health.externalfiredamagemultipliers:SetModifier("under_ground", 1 - TUNING.ARMORDRAGONFLY_FIRE_RESIST)
		end
		
        inst.components.playervision:ForceNightVision(true)
        inst.components.playervision:SetCustomCCTable(BEAVERVISION_COLOURCUBES)
		
		if  TheWorld.ismastersim then
			inst:ListenForEvent("newstate", stopunderground)
			inst._underhungertask = inst:DoPeriodicTask(1, OnTaskTick, 1)
		end
    else
		inst.DynamicShadow:Enable(true)
		inst.AnimState:ClearOverrideSymbol("wormmovefx")
		inst.SoundEmitter:KillSound("move_underground") --强制取消音效
		if inst.components.inventory then
			inst.components.inventory:Open()
		end
		inst:RemoveTag("myth_yutu_underground")
		inst:RemoveTag("notarget")
        if inst.components.playercontroller ~= nil then
            inst.components.playercontroller.actionbuttonoverride = nil
        end
		if inst.components.catcher ~= nil then
			inst.components.catcher:SetEnabled(true)
		end
		if inst.components.playeractionpicker ~= nil then
			inst.components.playeractionpicker:PopActionFilter(FlyActionFilter)
		end
		if inst.components.grue ~= nil then
			inst.components.grue:RemoveImmunity("under_ground")
		end	
		if inst.components.firebug ~= nil then
			inst.components.firebug:Enable()
		end
		if inst.components.talker ~= nil then
			inst.components.talker:StopIgnoringAll("under_ground")
		end
        if inst.components.hunger ~= nil then
            inst.components.hunger.burnratemodifiers:RemoveModifier("under_ground")
        end	
		if inst.components.health ~= nil then
			inst.components.health.externalfiredamagemultipliers:RemoveModifier("under_ground")
		end
        if inst.components.sanity ~= nil then
            inst.components.sanity.dapperness = 0
        end	
        inst.components.playervision:ForceNightVision(false)
        inst.components.playervision:SetCustomCCTable(nil)
		
		if  TheWorld.ismastersim then
			inst:RemoveEventCallback("newstate", stopunderground)
			local fx = SpawnPrefab("groundpound_fx")
			fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
		end
		if inst._underhungertask  ~= nil then
			inst._underhungertask:Cancel()
			inst._underhungertask  = nil
		end	
    end
end

local function WatchWorld(inst)
    if inst._onrabbitkilled == nil then
        inst._onrabbitkilled = function(src, data)
            if data == nil then
            elseif data.pos ~= nil then
                local distsq = inst:GetDistanceSqToPoint(data.pos)
                if distsq < 400 then
                    inst.components.sanity:DoDelta(-5)
                end
            end
        end
        inst:ListenForEvent("rabbitkilled", inst._onrabbitkilled, TheWorld)
    end
end

local function StopWatchingWorld(inst)
    if inst._onrabbitkilled ~= nil then
        inst:RemoveEventCallback("rabbitkilled", inst._onrabbitkilled, TheWorld)
        inst._onrabbitkilled = nil
    end
end

local function Ondeath(inst,data)
    if inst._underground:value() then
		inst._underground:set(false)
	end
end

local function onusebh(inst)
	if not inst._underground:value() then
		if not inst.components.health:IsDead() then
			inst.sg:GoToState("underground_jumpin")
		end
	else
		if not inst.components.health:IsDead() then
			inst.sg:GoToState("underground_jumpout")
		end	
	end
	return true
end

local function OnStarve(inst,data)
    if inst._underground:value() and not inst.components.health:IsDead() then
		onusebh(inst)
	end
end

local function onbecamehuman(inst)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "myth_yutu_speed", 1)
	inst:ListenForEvent("death", Ondeath)
	inst:ListenForEvent("startstarving", OnStarve)	
	WatchWorld(inst)
end

local function onbecameghost(inst)
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "myth_yutu_speed")
   inst:RemoveEventCallback("death", Ondeath)
   inst:RemoveEventCallback("startstarving", OnStarve)	
   StopWatchingWorld(inst)
end

local fruits = {
	carrot_cooked = true,
	carrot = true,
	carrot_seeds = true,	
}

local function OnEat(inst,data)
	if data and data.food then
		if  fruits[data.food.prefab] ~= nil then
			inst.components.sanity:DoDelta(5)
		end
		if data.food.prefab == "carrot" then
			--inst.components.talker:Say("")
		end
	end
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

local function CLIENT_HostileTest(inst, target)
    return target:HasTag("hostile")
        and (not target:HasTag("rabbit"))
        and (not target:HasTag("manrabbit"))
end

local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "myth_yutu.tex" )
	inst:AddTag("myth_yutu")
	
	inst.talker_path_override = 'Myth_Gourd/'
	inst.soundsname = "sfx"
	inst.OnUseBh = onusebh
	inst._underground = net_bool(inst.GUID, "yutu._underground", "undergrounddirty")
	inst:ListenForEvent("undergrounddirty", SetBeaverVision)
	
	inst.HostileTest = CLIENT_HostileTest
	inst.BIANHUAN_STR = "IN_GROUND"

	inst:DoTaskInTime(0,function()
		if inst.replica.builder then
			local old_CanBuild = inst.replica.builder.CanBuild	
			inst.replica.builder.CanBuild = function(self,recname,...)
				if recname and recname == "earmuffshat" then
					return false
				end
				return old_CanBuild(self,recname,...)
			end
 			local old_HasCharacterIngredient = inst.replica.builder.HasCharacterIngredient	
			inst.replica.builder.HasCharacterIngredient = function(self,ingredient,...)
				if ingredient.type == CHARACTER_INGREDIENT.MYTH_HUNGER then
					local hunger = self.inst.replica.hunger
					if hunger ~= nil then
						local current = math.ceil(hunger:GetCurrent())
						return current >= ingredient.amount, current
					end	
				end
				return old_HasCharacterIngredient(self,ingredient,...)
			end	
		end	
	end)
end
 
local master_postinit = function(inst)

	inst.components.health:SetMaxHealth(TUNING.MYTH_YUTU_HEALTH)
	inst.components.hunger:SetMax(TUNING.MYTH_YUTU_HUNGER)
	inst.components.sanity:SetMax(TUNING.MYTH_YUTU_SANITY)
	
    inst.components.combat.damagemultiplier = 1
    inst.components.sanity.night_drain_mult = TUNING.WENDY_SANITY_MULT
    inst.components.sanity.neg_aura_mult = TUNING.WENDY_SANITY_MULT
	
	inst:AddComponent("mk_bh")
	inst.components.mk_bh.onusefn = onusebh
	
	inst.components.sanity.EnableLunacy = function(self,enable, sorce)
		self.mode = SANITY_MODE_INSANITY
	end
	
	inst.components.foodaffinity:AddPrefabAffinity("carrot", TUNING.AFFINITY_15_CALORIES_HUGE)
	
    inst:AddComponent("itemaffinity")
    inst.components.itemaffinity:AddAffinity("rabbit", nil, TUNING.DAPPERNESS_MED, 1)
	
    if inst.components.eater ~= nil then
        inst.components.eater:SetDiet({ FOODGROUP.VEGETARIAN }, { FOODGROUP.VEGETARIAN })
    end
	
 	local old_HasCharacterIngredient = inst.components.builder.HasCharacterIngredient	
	inst.components.builder.HasCharacterIngredient = function(self,ingredient,...)
		if ingredient.type == CHARACTER_INGREDIENT.MYTH_HUNGER then
			local hunger = self.inst.components.hunger
			if hunger ~= nil then
				local current = math.ceil(self.inst.components.hunger.current)
				return current >= ingredient.amount, current
			end	
		end
		return old_HasCharacterIngredient(self,ingredient,...)
	end
	
	inst.components.locomotor:SetFasterOnGroundTile(GROUND.METEOR, true)
	
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	inst.components.temperature.inherentinsulation = 60
	
	inst:ListenForEvent("oneat", OnEat)
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("myth_yutu", prefabs, assets, common_postinit, master_postinit, start_inv)
