
local MakePlayerCharacter = require "prefabs/player_common"
local easing = require("easing")

local BEAVERVISION_COLOURCUBES =
{
    day = "images/colour_cubes/beaver_vision_cc.tex",
    dusk = "images/colour_cubes/beaver_vision_cc.tex",
    night = "images/colour_cubes/beaver_vision_cc.tex",
    full_moon = "images/colour_cubes/beaver_vision_cc.tex",
}

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
    Asset("IMAGE", "images/colour_cubes/beaver_vision_cc.tex"),
}

local prefabs = {
	"mk_jgb",
	"mk_striker",
	"peach",
	"mk_striker_fx",
}


local start_inv = {
	"mk_jgb",
}

if rawget(_G, "MK_MOD_LANGUAGE_SETTING")~= nil then
	table.insert(start_inv,"peach")
	table.insert(start_inv,"peach")
	table.insert(start_inv,"peach")
	table.insert(start_inv,"peach")
	table.insert(start_inv,"peach")
end

local function SetBeaverVision(inst, enable)
    local enable = inst._mknightvision:value()
	if enable then
        inst.components.playervision:ForceNightVision(true)
        inst.components.playervision:SetCustomCCTable(BEAVERVISION_COLOURCUBES)
    else
        inst.components.playervision:ForceNightVision(false)
        inst.components.playervision:SetCustomCCTable(nil)
    end
end
local fruits = {
	pomegranate = true,
	pomegranate_cooked = true,
	dragonfruit = true,
	dragonfruit_cooked = true,
	cave_banana = true,
	cave_banana_cooked = true,
	durian = true,
	durian_cooked = true,
	watermelon = true,
	watermelon_cooked = true,
	peach = true,
	peach_cooked = true,	
}
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
     and not inst.components.playervision:HasGoggleVision()  and inst._mknightvision:value() == true then
		inst._mknightvision:set(false)
		if inst.fireeyetask ~= nil then
			inst.fireeyetask:Cancel()
			inst.fireeyetask = nil		
		end
		inst:RemoveTag("fireeye")
	end
end

local function sandstormlevel(inst,data)
	if data and data.level  >= TUNING.SANDSTORM_FULL_LEVEL and inst.components.playervision
     and not inst.components.playervision:HasGoggleVision()  and inst._mknightvision:value() == true then
		inst._mknightvision:set(false)
		if inst.fireeyetask ~= nil then
			inst.fireeyetask:Cancel()
			inst.fireeyetask = nil		
		end
		inst:RemoveTag("fireeye")
	end
end

local fxskin = {
    monkey_king_ear = "ear",
}


local function lunge(inst,target)
	local x,y,z = target.Transform:GetWorldPosition()
	local r = 6
	local du = math.random(180)
	inst:StartThread(function()
        for k = 1, 4 do  
			local g = du + k* 90 
			local striker = SpawnPrefab("mk_striker")
			if striker then
				striker.Transform:SetPosition(x+ r*math.cos(2*math.pi/360*g),0,z+r*math.sin(2*math.pi/360*g))
				striker.AnimState:SetBuild(inst.AnimState:GetBuild())

                local fx = SpawnPrefab("mk_striker_fx")
                fx.Transform:SetPosition(striker.Transform:GetWorldPosition())
                if fxskin[inst.AnimState:GetBuild()] ~= nil then
                    fx:SetSkinBuild(fxskin[inst.AnimState:GetBuild()])
                    striker.AnimState:AddOverrideBuild("monkey_king_lunge_ear")
                end
				striker:ForceFacePoint(x, 0, z)
				if striker.Attack then
					striker:Attack(inst,target)
				end
	            Sleep(.15)
	        end
		end
    end)
end

local function onhitotherfn(inst, target,damage, stimuli)
	if stimuli and (stimuli == "mk_striker" or stimuli == "bramblefx_mk" )then
		return
	end
	if not target:IsValid() then
		return
	end
	if not target.monkey_kinghit then
		target.monkey_kinghit = 1
	elseif target.monkey_kinghit == 5 then
		lunge(inst,target)
		target.monkey_kinghit = 0
	else
		target.monkey_kinghit = target.monkey_kinghit + 1
	end
end

local function onusebh(inst)
	inst.sg:GoToState("mkhide")
	return true
end

local function Ondeath(inst,data)
    if inst._mknightvision:value() == true then
		inst._mknightvision:set(false)
		if inst.fireeyetask ~= nil then
			inst.fireeyetask:Cancel()
			inst.fireeyetask = nil
		end
		inst:RemoveTag("fireeye")
	end
end

local function DropWeapon(inst, data)
	if data and data.stimuli and (data.stimuli == "mk_striker" or data.stimuli == "bramblefx_mk")  then
		return
	end
	if inst.replica.rider ~= nil and inst.replica.rider:IsRiding() then
		return	
	end
    local tool = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
    if tool ~= nil  and not tool:HasTag("mk_nodrop")  and math.random() < 0.5 then
        local projectile =
            data and data.weapon ~= nil and
            data.projectile == nil and
            (data.weapon.components.projectile ~= nil or data.weapon.components.complexprojectile ~= nil)

        if projectile then
            local num = data.weapon.components.stackable ~= nil and data.weapon.components.stackable:StackSize() or 1
            if num <= 1 then
               return
            end
            inst.components.inventory:Unequip(EQUIPSLOTS.HANDS)
            tool = data.weapon.components.stackable:Get(num - 1)
            tool.Transform:SetPosition(inst.Transform:GetWorldPosition())
           if tool.components.inventoryitem ~= nil then
                tool.components.inventoryitem:OnDropped()
            end
        else
            inst.components.inventory:Unequip(EQUIPSLOTS.HANDS)
            inst.components.inventory:DropItem(tool)
        end

        if tool.Physics ~= nil then
            local x, y, z = tool.Transform:GetWorldPosition()
            tool.Physics:Teleport(x, .3, z)
            local angle = (math.random() * 20 - 10) * DEGREES
            if data.target ~= nil and data.target:IsValid() then
                local x1, y1, z1 = inst.Transform:GetWorldPosition()
                x, y, z = data.target.Transform:GetWorldPosition()
                angle = angle + (
                    (x1 == x and z1 == z and math.random() * 2 * PI) or
                    (projectile and math.atan2(z - z1, x - x1)) or
                    math.atan2(z1 - z, x1 - x)
                )
            else
                angle = angle + math.random() * 2 * PI
            end
            local speed = projectile and 2 + math.random() or 3 + math.random() * 2
            tool.Physics:SetVel(math.cos(angle) * speed, 10, math.sin(angle) * speed)
        end
		inst.components.talker:Say(STRINGS.MKDROPWEAPON)
    end
end

local function sanityfn(inst)
    local x, y, z = inst.Transform:GetWorldPosition() 
    local delta = 0
	local eyesanity = 0 
	local num  = inst.replica.inventory ~= nil and (
		inst.replica.inventory:EquipHasTag("golden_hat_mk") or
		inst.replica.inventory:EquipHasTag("xzhat_mk"))
		and 0.5 or 1
	local moisture_delta = easing.inSine(inst.components.moisture:GetMoisture(), 0, TUNING.MOISTURE_SANITY_PENALTY_MAX, inst.components.moisture:GetMaxMoisture()) 
	local max_rad = 8
    local ents = TheSim:FindEntities(x, y, z, max_rad, nil, {"campfire"} , { "renewable", "burnt", "bush","tree","peachtree"} )
    for i, v in ipairs(ents) do
        if v and  ( v.components.burnable ~= nil and  v.components.burnable:IsBurning()  or v:HasTag("burnt") ) then
            delta = delta + 10 / 60
        end
    end
	if inst._mknightvision:value() == true and not inst.components.inventory:EquipHasTag('golden_hat_mk') then
		eyesanity = -15/60 * num
	else 
		eyesanity = 0
	end
	return moisture_delta - delta + eyesanity
end

local function OnEquip(inst,data)
	if data and data.item and data.item.prefab == "eyebrellahat" then
        inst.AnimState:Show("HAT")
        inst.AnimState:Show("HAIR_HAT")
        inst.AnimState:Hide("HAIR_NOHAT")
        inst.AnimState:Hide("HAIR")
	end
end

local function onbecamehuman(inst)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "monkey_king_speed", 1.1)
	inst:ListenForEvent("gogglevision", gogglevision)
	inst:ListenForEvent("sandstormlevel", sandstormlevel)
	inst:ListenForEvent("onhitother", DropWeapon)
	inst:ListenForEvent("death", Ondeath)
	inst:ListenForEvent("equip", OnEquip)
end

local function onbecameghost(inst)
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "monkey_king_speed")
	inst:RemoveEventCallback("gogglevision", gogglevision)
	inst:RemoveEventCallback("sandstormlevel", sandstormlevel)
	inst:RemoveEventCallback("onhitother", DropWeapon)
	inst:RemoveEventCallback("death", Ondeath)
	inst:RemoveEventCallback("equip", OnEquip)
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

local common_postinit = function(inst)
	inst.soundsname = "sfx"
	inst.talker_path_override = 'MK/' 
	inst.MiniMapEntity:SetIcon( "monkey_king.tex" )
	inst.BIANHUAN_STR = "MK_BIANHUAN"
	inst:AddTag("monkey_king")
	
	inst._mknightvision = net_bool(inst.GUID, "monkey.nightvision", "monkeynightvisiondirty")
	inst:ListenForEvent("monkeynightvisiondirty", SetBeaverVision)

end

local function OnEat(inst,data)
	if data and data.food then
		if  fruits[data.food.prefab] ~= nil then
			inst.components.sanity:DoDelta(6)
		end
		if  data.food.components.edible and data.food.components.edible.foodtype == FOODTYPE.MEAT then
			inst.components.talker:Say(STRINGS.MKONEATMEAT)
		end		
		if data.food.prefab == "peach_banquet" then
			inst.components.talker:Say("这一回让俺老孙吃个尽兴！")
		end
	end
end

local master_postinit = function(inst)

	--inst.customidleanim = "look"
    inst.components.health:SetMaxHealth(TUNING.MONKEY_KING_HEALTH)
    inst.components.hunger:SetMax(TUNING.MONKEY_KING_HUNGER)
    inst.components.sanity:SetMax(TUNING.MONKEY_KING_SANITY)
	
	inst.components.foodaffinity:AddPrefabAffinity("peach_banquet", TUNING.AFFINITY_15_CALORIES_HUGE)
	
	inst.components.sanity.custom_rate_fn = sanityfn
	
    inst.components.combat.damagemultiplier = 1
	inst.components.combat.onhitotherfn = onhitotherfn
	
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	inst:AddComponent("mk_bh")
	inst.components.mk_bh.onusefn = onusebh
	
	local old_PrefersToEat = inst.components.eater.PrefersToEat
	inst.components.eater.PrefersToEat = function (self, food)
		if food.prefab == "wb_heart" then
			return false
		end
		return old_PrefersToEat(self, food)
	end
	inst:ListenForEvent("oneat", OnEat)
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("monkey_king", prefabs, assets, common_postinit, master_postinit, start_inv)
