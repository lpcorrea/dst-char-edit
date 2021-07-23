
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
	Asset( "ANIM", "anim/pigsy.zip" ),
	Asset( "ANIM", "anim/pig_zhuzhu_basic.zip" ),
	Asset( "ANIM", "anim/pig_zhuzhu_water.zip" ),
	Asset( "ANIM", "anim/ghost_pigsy_build.zip" ),
}
local prefabs = {}

local start_inv = {
	"pigsy_rake",
}

local function Empty()
end

local function FlyActionFilter(inst, action)
    return action == ACTIONS.MYTHBIANHUAN 
end

local allowstate = {
	idle = true,
	pig_zhuzhu_idle = true,

	run = true,
	run_start = true,
	run_stop = true,

	hit = true,
	pig_zhuzhu_hit = true,

	pig_zhuzhu_walk = true,
	pig_zhuzhu_walk_pre = true,
	pig_zhuzhu_walk_pst = true,
	pigsy_ridicule = true,
	myth_sg_pre = true,
	item_hat = true,
	item_in = true,
}

local function stopunderground(inst,data)
	if data and not allowstate[data.statename] and inst._becomehpig:value() then
		inst._becomehpig:set(false)
	end
end

local function pleaseattackme(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 20,{ "_combat"},{"player","playerghost","INLIMBO","companion","pig"})

    for i, v in ipairs(ents) do
        if v and v:IsValid()
            and not (v.components.health ~= nil and
                    v.components.health:IsDead()) then
            --and v.components.combat:CanAttack(inst) then
			v.components.combat:SuggestTarget(inst)
        end
    end
end

--ThePlayer.canbecomehpig = true ThePlayer._canbecomehpig:set(true)
--ThePlayer._canbecomehpig:set(true)

local function OnTaskTick(inst)
	if inst:IsOnOcean(false) then
		--inst.components.hunger.burnratemodifiers:SetModifier("pig_zhuzhu", 3)
		inst.components.locomotor.runspeed = 7.5 
		inst.components.moisture:DoDelta(1)
	else
		--inst.components.hunger.burnratemodifiers:SetModifier("pig_zhuzhu", 1.5)
		inst.components.locomotor.runspeed = 9
	end
end

local function SetDrowning(inst, mode)
    if inst.components.drownable ~= nil then
        if mode then
            if inst.components.drownable.enabled ~= false then
                inst.components.drownable.enabled = false
                inst.Physics:ClearCollisionMask()
                inst.Physics:CollidesWith(COLLISION.GROUND)
                inst.Physics:CollidesWith(COLLISION.OBSTACLES)
                inst.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
                inst.Physics:CollidesWith(COLLISION.CHARACTERS)
                inst.Physics:CollidesWith(COLLISION.GIANTS)
                inst.Physics:Teleport(inst.Transform:GetWorldPosition())
            end
        elseif inst.components.drownable.enabled == false then
            inst.components.drownable.enabled = true
            if not inst:HasTag("playerghost") then
                inst.Physics:ClearCollisionMask()
                inst.Physics:CollidesWith(COLLISION.WORLD)
                inst.Physics:CollidesWith(COLLISION.OBSTACLES)
                inst.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
                inst.Physics:CollidesWith(COLLISION.CHARACTERS)
                inst.Physics:CollidesWith(COLLISION.GIANTS)
                inst.Physics:Teleport(inst.Transform:GetWorldPosition())
            end
        end
    end
end

local function SetZhuZhu(inst, enable)
    local enable = inst._becomehpig:value()
	if enable then

		inst:AddTag("pig_zhuzhu")
		inst.AnimState:AddOverrideBuild("pig_zhuzhu_water")

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
			inst.components.playeractionpicker:PushActionFilter(FlyActionFilter, 665)
		end
		if inst.components.grue ~= nil then
			inst.components.grue:AddImmunity("pig_zhuzhu")
		end			
		if inst.components.talker ~= nil then
			inst.components.talker:IgnoreAll("pig_zhuzhu")
		end
        if inst.components.hunger ~= nil then
            inst.components.hunger.burnratemodifiers:SetModifier("pig_zhuzhu", 2)
        end
        if inst.components.health ~= nil then
			inst.components.health:SetAbsorptionAmount(0.9)
			inst.components.health:StartRegen(0.5, 1)
		end
		if inst.components.locomotor ~= nil then
			inst.components.locomotor:SetAllowPlatformHopping(false)
		end
		if  TheWorld.ismastersim then
			SetDrowning(inst, true)
			pleaseattackme(inst)
			if inst.sg and not inst.sg:HasStateTag("pig_zhuzhu") then
				inst.sg:GoToState("idle")
			end
			local fx = SpawnPrefab("collapse_small")
			fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
			inst:ListenForEvent("newstate", stopunderground)
			inst._underhungertask = inst:DoPeriodicTask(0.5, OnTaskTick, 0.5)
            if inst._zhulight == nil or not inst._zhulight:IsValid() then
                inst._zhulight = SpawnPrefab("minerhatlight")
				inst._zhulight.Light:SetFalloff(0.7)
				inst._zhulight.Light:SetIntensity(.5)
				inst._zhulight.Light:SetRadius(0.5)
				inst._zhulight.Light:SetColour(237/255, 237/255, 209/255)
				inst._zhulight.entity:SetParent(inst.entity)
            end
		elseif inst.sg then
			inst.sg:GoToState("idle")
		end
    else
		inst.AnimState:ClearOverrideBuild("pig_zhuzhu_water")
		if inst.components.inventory then
			inst.components.inventory:Open()
		end
		inst:RemoveTag("pig_zhuzhu")

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
			inst.components.grue:RemoveImmunity("pig_zhuzhu")
		end	
		if inst.components.firebug ~= nil then
			inst.components.firebug:Enable()
		end
		if inst.components.talker ~= nil then
			inst.components.talker:StopIgnoringAll("pig_zhuzhu")
		end
        if inst.components.hunger ~= nil then
            inst.components.hunger.burnratemodifiers:RemoveModifier("pig_zhuzhu")
        end
		if inst.components.locomotor then
			inst.components.locomotor:SetAllowPlatformHopping(true)
			inst.components.locomotor.runspeed = 6
		end
		if inst.components.health then 
			inst.components.health:StopRegen()
		end
		
		if  TheWorld.ismastersim then
			SetDrowning(inst, false)
			if inst.sg and inst.sg:HasStateTag("pig_zhuzhu") then
				inst.sg:GoToState("pigsy_wakeup")
			end
			local fx = SpawnPrefab("collapse_small")
			fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
			inst:RemoveEventCallback("newstate", stopunderground)
			if inst._zhulight ~= nil then
				if inst._zhulight:IsValid() then
					inst._zhulight:Remove()
				end
				inst._zhulight = nil
			end
		end
		if inst._underhungertask  ~= nil then
			inst._underhungertask:Cancel()
			inst._underhungertask  = nil
		end	
    end
end

local function become(inst, strength,scale,absorb,damage,dapperness,tag,talk)
    if inst.strength == strength then
        return
    end
	inst:ApplyScale("zhuzhuhunger", scale)
	inst.components.health:SetAbsorptionAmount(inst:HasTag("pig_zhuzhu") and 0.9 or absorb)
	inst.components.combat.damagemultiplier =  damage
	inst.components.sanity.dapperness = inst:HasTag("pig_zhuzhu") and -10/60 or dapperness
	if tag then
		inst:AddTag("bajieele")
		inst.components.locomotor:SetExternalSpeedMultiplier(inst, "bajieele", 0.6)
	else
		inst:RemoveTag("bajieele")
		inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "bajieele")
	end
	if talk ~= nil and not inst:HasTag("pig_zhuzhu") then
		inst.components.talker:Say(talk)
	end
    inst.strength = strength
end

local function onhungerchange(inst, data)
    if inst:HasTag("playerghost") or
        inst.components.health:IsDead() then
        return
    end
	if inst.components.hunger.current > 250 then
		become(inst, 5,1.1,0.5,1,0,false,STRINGS.PIGSY250)
	elseif inst.components.hunger.current > 150 then
		become(inst, 4,1,0.25,1,0,false)
	elseif inst.components.hunger.current > 75 then
		become(inst, 3,1,0,1,0,false,STRINGS.PIGSY75)
	elseif inst.components.hunger.current > 50 then
		become(inst, 2,1,0,0.75,0,false)
	else
		if inst._becomehpig:value() and not inst.components.health:IsDead() then
			inst._becomehpig:set(false)
		end
		become(inst, 1,1,0,0.5,-15/60,true,STRINGS.PIGSY50)
	end
end

local function CanShareTarget(dude)
    return dude:HasTag("pig") 
        and not dude:IsInLimbo()
		and not (dude:HasTag("werepig") or dude:HasTag("guard") )
        and not (dude.components.health:IsDead() or dude:HasTag("player"))
end

local function OnAttacked(inst, data)
	if  data and data.attacker then
		inst.components.combat:ShareTarget(data.attacker, 30, CanShareTarget, 50)
	end	
end

local function OnHitOther(inst,data)
	if data and data.target and not (data.target.components.health and data.target.components.health:IsDead()) then
		if data.target.components.combat then
			data.target.components.combat:SetTarget(inst)
		end
	end
end

local function OnEat(inst,data)
	if data and data.food then
		if  data.food.components.edible and data.food.components.edible.foodtype == FOODTYPE.MEAT then
			inst.components.talker:Say(STRINGS.PGONEATMEAT or "佛祖心中留。")
		end
		if data.food.prefab == "watermelon" then
			inst.components.talker:Say("好甜的瓜！让俺一人独享！")
		end
	end
end

local function onusebh(inst)
	if inst._becomehpig:value()  and not inst.components.health:IsDead() then
		inst.sg:GoToState("pigsy_ridicule")
	end
end

local function onbecamehuman(inst)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "pigsy_speed_mod", 1)
    inst:ListenForEvent("hungerdelta", onhungerchange)
	inst:ListenForEvent("attacked", OnAttacked)
	inst:ListenForEvent("onhitother", OnHitOther)
	onhungerchange(inst)
end

local function onbecameghost(inst)
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "pigsy_speed_mod")
    inst:RemoveEventCallback("hungerdelta", onhungerchange)
	inst:RemoveEventCallback("attacked", OnAttacked)
	inst:RemoveEventCallback("onhitother", OnHitOther)
end

local function setstate(inst)
	inst.components.hunger:SetPercent(75/300)
	inst.components.health:SetPercent(50/250)
	inst.components.sanity:SetPercent(50/100)
end

local function onload(inst,data)
    inst:ListenForEvent("ms_respawnedfromghost", function(inst) onbecamehuman(inst) setstate(inst) end)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
	if data then 
		if data.zhuzhu then
			inst._becomehpig:set(true)
		end
		if data.can then
			inst.canbecomehpig = true
			inst._canbecomehpig:set(true)
		end
	end
end

local function onsave(inst, data)
    data.zhuzhu = inst._becomehpig:value()
	data.can = inst.canbecomehpig
end

local function OnPick(inst,data)
	if data.object and data.object:HasTag("farm_plant") and data.object.plant_def and not data.object.is_oversized then
		if data.object.plant_def.product ~= nil and  data.object.plant_def.seed ~= nil then
			local crop = math.random() < 0.75 and data.object.plant_def.product or data.object.plant_def.seed
			if math.random() < 0.75 and type(crop) == "string" then
				local drop = SpawnPrefab(crop)
				if drop then
					inst.components.inventory:GiveItem(drop,nil,inst:GetPosition())
				end
			end
		end
	end
end

local function onlearn(inst)
	if not inst.canbecomehpig then
		inst.canbecomehpig = true
		inst._canbecomehpig:set(true)
	end
end

local common_postinit = function(inst)
	inst.soundsname = "sfx"
	inst.talker_path_override = 'Drum/' 
	inst:AddTag("pigsy")
	inst:AddTag("quagmire_farmhand")
	inst.MiniMapEntity:SetIcon( "pigsy.tex" )
	inst.BIANHUAN_STR = "PIG_BIANHUAN"
	inst._canbecomehpig = net_bool(inst.GUID, "pigsy._canbecomehpig", "canbecomehpigdirty")
	inst._becomehpig = net_bool(inst.GUID, "pigsy._becomehpig", "becomehpigdirty")
	inst:ListenForEvent("becomehpigdirty", SetZhuZhu)
end
--ThePlayer._canbecomehpig:set(true)

local master_postinit = function(inst)
	inst.strength = 0
	inst.canbecomehpig = false

	inst.mandatoryattacks = {}
	inst.Myth_Learn_Skill = onlearn

    inst.components.health:SetMaxHealth(TUNING.PIGSY_HEALTH)
    inst.components.hunger:SetMax(TUNING.PIGSY_HUNGER)
    inst.components.sanity:SetMax(TUNING.PIGSY_SANITY)

	inst:AddComponent("mk_bh")
	inst.components.mk_bh.onusefn = onusebh

	inst.components.foodaffinity:AddPrefabAffinity("watermelon", TUNING.AFFINITY_15_CALORIES_HUGE)
	
	inst.components.hunger.current = 200
	inst.components.eater:SetCanEatRaw()
	
    inst.components.combat.damagemultiplier = 1
	
	inst.components.hunger.hungerrate = 1.25 * TUNING.WILSON_HUNGER_RATE
	
	--builder
	local old_CanBuild = inst.components.builder.CanBuild	
	inst.components.builder.CanBuild = function(self,recname,...)
		if recname and  recname == "resurrectionstatue"  then
			return false
		end
		return old_CanBuild(self,recname,...)
	end
	
	local old_DoBuild = inst.components.builder.DoBuild	
	inst.components.builder.DoBuild = function(self,recname, pt, rotation, skin,...)
		if recname == "pigsy_sleepbed" then
			if inst.replica.rider:IsRiding() then
				return false,"NOSLEEPWHENRIDER"
			elseif inst.replica.hunger:GetCurrent() < 50 then
				return false,"NOSLEEPWHENSTARVE"			
			end
		end
		return old_DoBuild(self,recname, pt, rotation, skin,...)
	end
	
	inst:ListenForEvent("oneat", OnEat)
	inst:ListenForEvent("picksomething", OnPick)
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	inst.OnSave = onsave
	
end

return MakePlayerCharacter("pigsy", prefabs, assets, common_postinit, master_postinit, start_inv)
