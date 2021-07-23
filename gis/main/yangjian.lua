
--不使用魔法
local function builder(self)
	local old_canbuild = self.CanBuild
	function self:CanBuild(recname, ...)
		local recipe = GetValidRecipe(recname)
		if recipe == nil then
			return false
		elseif self.inst.prefab == "yangjian" and recipe.tab  == RECIPETABS.MAGIC then
			return false
		end
		return old_canbuild(self,recname, ...)
	end
end
AddComponentPostInit('builder', builder)
AddClassPostConstruct('components/builder_replica', builder)
local function nomagic(self)
	if self.owner and self.owner.prefab == "yangjian" then
		self.owner:DoTaskInTime(0.1, function()
			for k,v in pairs(self.tabbyfilter) do 
				if k.str == "MAGIC" then 
					v:Hide() 
					break
				end 
			end	
		end)
	end
end
AddClassPostConstruct('widgets/crafttabs', nomagic)

--修复客户端的属性显示mod
local laterfn = {}
function AddLaterFn(fn)
	if fn and type(fn) == "function" then
		table.insert(laterfn,fn)
	end
end
local function trytofuckicey()
	if rawget(GLOBAL, "MOD_ITEMINFO")~= nil then 
		if softresolvefilepath("scripts/widgets/iteminfo_desc.lua") then
			local info = require("widgets/iteminfo_desc")
			info.GetWeaponDamage = function(self,base_inst, inst)
				local damage = 0
				if inst.prefab ~= "hambat" then
					if type(base_inst.components.weapon.damage) == "function" then
					else
						damage = base_inst.components.weapon.damage
					end
				else
					damage = TUNING.HAMBAT_DAMAGE * self:GetPerishFreshness(inst)
					damage = Remap(damage, 0, TUNING.HAMBAT_DAMAGE, TUNING.HAMBAT_MIN_DAMAGE_MODIFIER * TUNING.HAMBAT_DAMAGE, TUNING.HAMBAT_DAMAGE)
				end
				local damagemult = self:GetPlayerDamageModifier()
				damage = damage * damagemult
				return damage			
			end
		end
	end
end
AddLaterFn(trytofuckicey)

local oldTranslateStringTable = TranslateStringTable
GLOBAL.TranslateStringTable = function(...)
	for k,v in pairs(laterfn) do
		if v  and type(v) == "function" then
			v()
		end
	end
	return oldTranslateStringTable(...)
end


GLOBAL.YANGJIANFEIIXNG_ITEM = {}

local needtoshow = {
"bluemooneye",
"greenmooneye",
"redmooneye",
"orangemooneye",
"purplemooneye",
"yellowmooneye",
"sentryward",
"moonrockseed",
"myth_yylp",
"moondial",
"townportal"
} 
for _,v in ipairs(needtoshow) do
	AddPrefabPostInit(v, function(inst)
		--inst:AddTag("yangjianfeixing_item")
		table.insert(GLOBAL.YANGJIANFEIIXNG_ITEM, inst)
	end)
end

--飞天
local function SetFlyingState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:AddImmunity("flying")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:IgnoreAll("flying")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Disable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(false)
        inst.components.playercontroller:Enable(false)
    end
	if inst.components.health then
		inst.components.health:SetInvincible(true)
	end
    inst.components.inventory:Hide()
    inst:PushEvent("ms_closepopups")
    inst:ShowActions(false)
	inst.DynamicShadow:Enable(false)
end

local function SetFlyOutState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:RemoveImmunity("flying")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:StopIgnoringAll("flying")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Enable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(true)
        inst.components.playercontroller:Enable(true)
    end
	
	if inst.components.health then
		inst.components.health:SetInvincible(false)
	end
    inst.components.inventory:Show()
    inst:ShowActions(true)
	inst.DynamicShadow:Enable(true)
end


GLOBAL.Myth_YangJian_Mapinfo_Player = {}
GLOBAL.Myth_YangJian_Mapinfo_Items = {}

local function getmapinfo(mapinfo1,mapinfo2)
	if mapinfo1 and type(mapinfo1) == "string" then
		local success, b = pcall(json.decode,mapinfo1)
		if success and b and type(b) == "table" then
			GLOBAL.Myth_YangJian_Mapinfo_Player = b
		end
	end
	if mapinfo2 and type(mapinfo2) == "string" then
		local success, b = pcall(json.decode,mapinfo2)
		if success and b and type(b) == "table" then
			GLOBAL.Myth_YangJian_Mapinfo_Items = b
		end
	end
end

local flysky = require "screens/yj_flysky"
local function xiaofly(playerinfo)
	if ThePlayer ~= nil and ThePlayer.HUD ~= nil and playerinfo and type(playerinfo) == "string"  then
		TheFrontEnd:PushScreen(flysky(ThePlayer,playerinfo))
	end
end

AddClientModRPCHandler("yangjian_fly_map","fly_map",getmapinfo)
AddClientModRPCHandler("yangjian_fly_map","fly_xtj",xiaofly)

local function getpos(inst,needitem)
	local str = {}
	local str1 = {}
	--玩家
	for i, v in ipairs(AllPlayers) do
		if  v ~= inst then
			local x1,y1,z1  = v.Transform:GetWorldPosition()
			table.insert(str,{v.GUID,v.prefab, math.floor(x1),math.floor(z1)})
		end
	end
	--其他物品就只显示10个
	if needitem then	
		local num = 0
		for k = 1, #GLOBAL.YANGJIANFEIIXNG_ITEM do
			if num > 9 then 
				break
			end
			local item = GLOBAL.YANGJIANFEIIXNG_ITEM[k]
			if item ~= nil and item:IsValid() and not item:HasTag("INLIMBO") then
				local x1,y1,z1  = item.Transform:GetWorldPosition()
				table.insert(str1,{ item.GUID, item.prefab, math.floor(x1),math.floor(z1)})
				num = num + 1
			end
		end
	end
	if needitem then
		local success1,a1  = pcall(json.encode,str)
		local success2,a2  = pcall(json.encode,str1)
		if success1 and success2 then
			SendModRPCToClient(CLIENT_MOD_RPC["yangjian_fly_map"]["fly_map"],inst.userid,a1,a2)
		end
	else
		local success1,a1  = pcall(json.encode,str)
		if success1 then
			SendModRPCToClient(CLIENT_MOD_RPC["yangjian_fly_map"]["fly_map"],inst.userid,a1)
		end
	end
end

local function ShowMap(inst)
    local pt = Vector3(inst.Transform:GetWorldPosition())
	pt.y = 0
    local theta = math.random() * 2 * PI
    local radius = 50
    local circ = 2*PI*radius
    local numitems = 60
    for i = 1, numitems do
        local offset = Vector3(radius * math.cos( theta ), 0, -radius * math.sin( theta ))
        local wander_point = pt + offset
		if inst.player_classified ~= nil then
			inst.player_classified.MapExplorer:RevealArea(wander_point.x ,0, wander_point.z)
		end				
        theta = theta - (2 * PI / numitems)
    end
end

AddStategraphState("wilson", State{
    name = "yangjian_eagle_up",
    tags ={"busy","flying", "notalking", "nopredict","nomorph"},
    onenter = function(inst)
        inst.components.locomotor:Stop()
		SetFlyingState(inst)

		local base = "yj_eagle_anim"
		if inst.AnimState:GetBuild() ==  "yangjian_black" then
			base = "yj_eagle_black"
		elseif inst.AnimState:GetBuild() ==  "yangjian_gold" then
			base = "yj_eagle_gold"
		end
		inst.AnimState:AddOverrideBuild(base)

        inst.AnimState:PlayAnimation("yj_eagle_1") 
    end,
    onupdate= function(inst)
		if inst.flyover then
			local pt = Point(inst.Transform:GetWorldPosition())
			if pt.y <= 33.8 then
				inst.Physics:Teleport(pt.x,33.8,pt.z)
			end
		end
    end,
    timeline =
    {
        TimeEvent(0.4, function(inst)
            inst.SoundEmitter:PlaySound("Xiao/sfx/hawk")
        end),
        TimeEvent(0.6, function(inst)
            SpawnAt("yangjian_smoke",inst)
        end),
        TimeEvent(0.83, function(inst)
            inst.Physics:SetMotorVel(0,30,0)
			inst.MiniMapEntity:SetEnabled(false)
        end),
        TimeEvent(1.5, function(inst)
			inst._yjgetplayerpos = inst:DoPeriodicTask(1, getpos,1)
            getpos(inst,true)
			inst._skyminimap:set_local(false)
			inst._skyminimap:set(true)
        end),
        TimeEvent(2, function(inst)
            inst.Physics:Stop()
			inst.flyover = true
			inst.AnimState:PlayAnimation("yj_eagle_2",true)
        end),
        TimeEvent(4.2, function(inst)
			ShowMap(inst)
			inst.MiniMapEntity:SetEnabled(true)
        end),
        TimeEvent(35, function(inst)
            inst.sg:GoToState("yangjian_eagle_down")
        end),
    },
	onexit = function(inst)
		if not inst.flyover then
			SetFlyOutState(inst)
		end
		inst.flyover = false
		if inst._yjgetplayerpos ~= nil then
			inst._yjgetplayerpos:Cancel()
			inst._yjgetplayerpos = nil
		end
		--inst._skyplayer:set("")
	end,
    events= {
        EventHandler("yangjian_eagle_down", function(inst) inst.sg:GoToState("yangjian_eagle_down") end),
    },
})


AddStategraphState("wilson", State{
    name = "yangjian_eagle_down",
    tags ={"busy","flying"},
    onenter = function(inst)
        inst.Physics:Stop()
		inst.Physics:SetMotorVel(0,-30,0)
		inst.AnimState:PlayAnimation("yj_eagle_3")
    end,
    onupdate= function(inst)
        inst.Physics:SetMotorVel(0,-30,0)
        local pt = Point(inst.Transform:GetWorldPosition())

        if pt.y <= .1 or inst:IsAsleep() then
            pt.y = 0
            inst.Physics:Stop()
            inst.Physics:Teleport(pt.x,pt.y,pt.z)
			inst._skyminimap:set(false)
			SetFlyOutState(inst)
			inst.AnimState:ClearOverrideBuild("yj_eagle_anim")
			inst.AnimState:ClearOverrideBuild("yj_eagle_black")
			inst.AnimState:ClearOverrideBuild("yj_eagle_gold")
			SpawnAt("yangjian_smoke",inst)
			ShakeAllCameras(CAMERASHAKE.VERTICAL, .7, .015, .8, inst, 20)
			inst.sg:GoToState("idle")
        end
    end,	
    timeline =
    {
        TimeEvent(0, function(inst)
            inst.SoundEmitter:PlaySound("Xiao/sfx/hawk")
        end),
        TimeEvent(5, function(inst)
			local pt = Point(inst.Transform:GetWorldPosition())
			inst.Physics:Stop()
			inst.Physics:Teleport(pt.x,0,pt.z)
			inst.sg:GoToState("idle")
        end),
    },
	onexit = function(inst)
		inst.AnimState:ClearOverrideBuild("yj_eagle_anim")
		inst.AnimState:ClearOverrideBuild("yj_eagle_black")
		inst.AnimState:ClearOverrideBuild("yj_eagle_gold")
		SetFlyOutState(inst)
		inst:SetCameraDistance() 
		inst._skyminimap:set(false)
		if inst.cantfly_yangjian then
			inst.components.talker:Say(STRINGS.NAMES.YANGJIAN_TRACK_NOHUNGER)  
			inst.cantfly_yangjian  = false
		else
			inst.components.hunger:DoDelta(-75)
		end
		local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		if weapon ~= nil  and inst.components.inventory then
			inst.components.inventory:Unequip(EQUIPSLOTS.HANDS)
			inst:DoTaskInTime(0,function()
				inst.components.inventory:Equip(weapon)
			end)
		end
	end,	
})

local function Fly(inst,a,b,c)
	if a ~= nil and type(a) == "number"then
		local num = math.floor(a)
		if num == 1 then 
			--咩咩咩
		elseif num == 2 then 
			if b ~= nil and type(b) == "number" and c ~= nil and type(c) == "number" then
				--if san ~= nil then
				--	inst.components.sanity:DoDelta(-25)
				--end
				if inst.components.hunger.current < 75 then
					inst.cantfly_yangjian = true
					return
				end
				local pos = Vector3(b,0,c)
				local offset = FindWalkableOffset(pos, math.random() * 2 * PI, 4, 10)
				if offset ~= nil then
					b = b + offset.x
					c = c + offset.z	
				end
				inst.Physics:Teleport(b, 33.8, c)
			end
		elseif num == 3 then
			inst:PushEvent("yangjian_eagle_down")
		elseif num == 4 and b ~= nil and type(b) == "number" and c ~= nil and type(c) == "number" then
			if inst.yangjian_buzzard and inst.yangjian_buzzard:IsValid() then
				inst.yangjian_buzzard.sg:GoToState("songhuo",{b,c})
			end
		end
	end
end

AddModRPCHandler("yangjian", "flyfly", Fly)

---
local function HasYjSpear(owner)
	local chance = nil
	if owner and owner:IsValid() and owner.components and owner.components.inventory then
		local wuqi = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		if wuqi and wuqi:HasTag("yj_spear") then
			if wuqi.ElecEnabled then
				chance = 0.6
			else
				chance = 1			
			end
		end
	end
	return chance
end

AddComponentPostInit("playerlightningtarget",function(self)
	local old_GetHitChance = self.GetHitChance
	self.GetHitChance = function(self,...)
		return HasYjSpear(self.inst)  or old_GetHitChance(self,...)
	end
end)

--ApplyDamage
AddComponentPostInit("inventory",function(self)
	local old_ApplyDamage = self.ApplyDamage
	self.ApplyDamage = function(self,damage,attacker, weapon,...)
		local ret = old_ApplyDamage(self,damage,attacker, weapon,...)

		return (weapon and weapon:HasTag("yj_spear_elec")) and damage or ret
	end
end)

AddStategraphPostInit("wilson", function(sg)
    local old_CASTAOE = sg.actionhandlers[ACTIONS.CASTAOE].deststate
    sg.actionhandlers[ACTIONS.CASTAOE].deststate = function(inst, action)
		local weapon = action.invobject
		if weapon then 
        	if weapon:HasTag("yj_spear") then 
        		if weapon:HasTag("yj_spear_elec") then 
        			return "yj_spear_elec_dash"
        		else
        			return "yj_spear_elec_dash_no"
        		end
        	end
		end 
        return old_CASTAOE(inst, action)
    end
end)
AddStategraphPostInit("wilson_client", function(sg)
    local old_CASTAOE = sg.actionhandlers[ACTIONS.CASTAOE].deststate
    sg.actionhandlers[ACTIONS.CASTAOE].deststate = function(inst, action)
		local weapon = action.invobject
		if weapon then 
        	if weapon:HasTag("yj_spear") then 
        		if weapon:HasTag("yj_spear_elec") then 
        			return "yj_spear_elec_dash"
        		else
        			return "yj_spear_elec_dash_no"
        		end
        	end
		end 
        return old_CASTAOE(inst, action)
    end
end)

AddStategraphState("wilson", 
	State{
		name = "yj_spear_elec_dash_no",
        tags = { "aoe", "doing", "busy", "nointerrupt", "nomorph" },
		onenter = function(inst)
			inst.sg.statemem.action = inst.bufferedaction
			inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("multithrust_yell")
			local action = inst:GetBufferedAction()
			local action = inst:GetBufferedAction()
			local pos = action and action:GetActionPoint() or nil
			if pos then
				TheWorld:PushEvent("ms_sendlightningstrike", pos)
				TheWorld:PushEvent("ms_deltamoisture", 50)
				if action.invobject ~= nil and action.invobject.components.rechargeable ~= nil then
					action.invobject.components.rechargeable:StartRecharging()
				end
				if inst.components.talker then
					inst.components.talker:Say(STRINGS.NAMES.YJ_SPEAR_NEDDTHUNDER)
				end
			end
		end,
		timeline =
		{
			TimeEvent(20 * FRAMES, function(inst)
				inst.sg:GoToState("idle")
			end),
		},
        events =
        {
            --EventHandler("animover", function(inst)
            --    if inst.AnimState:AnimDone() then
            --        inst.sg:GoToState("idle")
            --    end
            --end),
        },
        onexit = function(inst)
            if inst.bufferedaction == inst.sg.statemem.action then
                inst:ClearBufferedAction()
            end
        end,
	}
)

AddStategraphState("wilson_client", 
	State{
		name = "yj_spear_elec_dash_no",
        tags = { "aoe", "doing", "busy", "nointerrupt", "nomorph" },
		onenter = function(inst)
			inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("multithrust_yell")
            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(1.2)
		end,
        timeline =
        {
            TimeEvent(10 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
        },
        onupdate = function(inst)
            if inst:HasTag("doing") then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.sg:GoToState("idle", true)
            end
        end,
        ontimeout = function(inst)
            inst:ClearBufferedAction()
            inst.AnimState:PlayAnimation("build_pst")
            inst.sg:GoToState("idle", true)
        end,
	}
)

AddStategraphState("wilson", 
	State{
		name = "yj_spear_elec_dash",
        tags = { "aoe", "doing", "busy", "nointerrupt", "nomorph" },
		onenter = function(inst)
			inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("multithrust_yell")
			local action = inst:GetBufferedAction()
		end,
		timeline =
		{
			TimeEvent(0 * FRAMES, function(inst)
				if TheWorld:HasTag("cave") then
					if not TheWorld.state.israining then
						TheWorld:PushEvent("ms_forceprecipitation",true)
					end			
				end
			end),		
		
			TimeEvent(5 * FRAMES, function(inst)
				if not inst.noyinlei then
					local fire = SpawnPrefab("yj_spear_elec_preparefx")
					local weapon = inst.components.inventory:GetEquippedItem("hands")
					if weapon and weapon.components.myth_itemskin and weapon.components.myth_itemskin.skin:value() == "gold" then
						fire.AnimState:SetBuild("yj_spear_elec_preparefx_gold")
					end
					fire.entity:AddFollower()
					fire.Follower:FollowSymbol(inst.GUID, "swap_object", 0, -110, 0)
					inst.SoundEmitter:PlaySoundWithParams("dontstarve/rain/thunder_close", {intensity= 0.7})
				end
			end),
			TimeEvent(15 * FRAMES, function(inst)
				if not inst.noyinlei then
					inst.AnimState:PlayAnimation("atk_pre")
					inst.AnimState:PushAnimation("atk",false)
					inst.sg:GoToState("idle",true)
					inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
					inst:PerformBufferedAction()
				end
            end),
			TimeEvent(20 * FRAMES, function(inst)
				if inst.noyinlei then
					inst.noyinlei = false
					inst.sg:GoToState("idle",true)
				end
            end),
		},
	}
)

AddStategraphState("wilson_client", 
	State{
		name = "yj_spear_elec_dash",
        tags = { "aoe", "doing", "busy", "nointerrupt", "nomorph" },
		onenter = function(inst)
			inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("multithrust_yell")
			inst:PerformPreviewBufferedAction()
		end,
		timeline =
		{
			TimeEvent(15 * FRAMES, function(inst)
				inst.AnimState:PlayAnimation("atk_pre")
				inst.AnimState:PushAnimation("atk",false)
				inst.sg:GoToState("idle",true)
            end),
		},
		onexit = function(inst)
			inst:ClearBufferedAction()
		end,
	}
)

AddPrefabPostInit("shadowchanneler", function(inst)
	if inst.replica.combat then
		local old = inst.replica.combat.CanBeAttacked
		inst.replica.combat.CanBeAttacked = function(self,attacker)
			if attacker ~= nil and attacker.prefab == "yangjian" then
				return ( attacker._skyeye ~= nil and attacker._skyeye:value())
			end
			return old(self,attacker)
		end
	end
end)
