
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
    Asset("ANIM", "anim/player_idles_winona.zip"),
    Asset("ANIM", "anim/white_bone_hidehair.zip"),
}
local prefabs = {}

-- 初始物品
local start_inv = {
	'boneshard', 'boneshard', 'boneshard', 'boneshard',
	'nightmarefuel', 'nightmarefuel', 'nightmarefuel', 'nightmarefuel',
	'livinglog', 'livinglog',"bone_mirror",
}

local function _GetBuild(inst, isbeauty)
	local base = inst.components.skinner and inst.components.skinner:GetClothing().base
	if base == 'white_bone_none' then
		return isbeauty and 'white_bone_beautiful' or 'white_bone'
	elseif base == 'white_bone_white' then
		return isbeauty and 'white_bone_beautiful' or 'white_bone_white'
	elseif base == 'white_bone_opera' then
		return isbeauty and 'white_bone_opera_beautiful' or 'white_bone_opera'
	else
		return isbeauty and "white_bone_beautiful" or "white_bone"
	end
end

local function pleaseattackme(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 20,{ "_combat"},{"player","playerghost","INLIMBO","companion"})

    for i, v in ipairs(ents) do
        if v and v:IsValid()
            and not (v.components.health ~= nil and
                    v.components.health:IsDead())
            and v.components.combat:CanAttack(inst) then
			v.components.combat:SuggestTarget(inst)
        end
    end
end

local function SetBuild(inst)
	inst.AnimState:SetBuild(_GetBuild(inst, inst._isbeauty:value()))
end

local function SetNewState(inst) --设置两个形态下的不同的属性
	if inst._isbeauty:value() == false then
		inst:AddTag("monster")
		inst:AddTag("wb_monster")
		inst.components.locomotor:SetExternalSpeedMultiplier(inst, "white_bone_speed", 1.083)
		if inst.sanity_aura_ent then
			inst.sanity_aura_ent.components.sanityaura.aura = -10/60
		end
		if inst.components.white_bone_cloak then
			inst.components.white_bone_cloak:Apply()
		end
	else
		inst.components.locomotor:SetExternalSpeedMultiplier(inst, "white_bone_speed", 1)
		if inst.sanity_aura_ent then
			inst.sanity_aura_ent.components.sanityaura.aura = 0
		end
		inst.components.health.externalabsorbmodifiers:SetModifier(inst, 0)
		inst:RemoveTag("monster")
		inst:RemoveTag("wb_monster")
		if inst.components.white_bone_cloak then
			inst.components.white_bone_cloak:Clear()
		end
	end
	SetBuild(inst)
end

local function ondeath(inst)
	inst._isbeauty:set(false)
	inst.components.bone_pets:DespawnAllPets(true)
end

local function dropequpitem(inst)
	if inst.components.inventory then
		for k, v in pairs(inst.components.inventory.equipslots) do
			if k ~= "hands" then
				inst.components.inventory:DropItem(v, true, true)
			end
		end		
	end
end

local function OnHitOther(inst) --美人形态攻击变身
	if inst._isbeauty:value() == true  then 
		inst._isbeauty:set(false)
		SpawnPrefab("white_bone_changefx").Transform:SetPosition(inst.Transform:GetWorldPosition())
		SetBuild(inst)
		pleaseattackme(inst)
	end
end

local function OnHungerChange(inst)--饱食度不够变身
	if inst.components.hunger.current <= 50 and inst._isbeauty:value() == true  then 
		inst._isbeauty:set(false)
		SpawnPrefab("white_bone_changefx").Transform:SetPosition(inst.Transform:GetWorldPosition())
		SetBuild(inst)
		pleaseattackme(inst)		
	end
end

local notags = {'FX', 'INLIMBO', 'hostile', 'monster', 'player', 'notarget', 'werepig', 'guard'}
local function CanShareTarget(dude) --非敌对生物
	for _, tag in ipairs(notags) do
		if dude:HasTag(tag) then return false end
	end
	return dude.components.health and not dude.components.health:IsDead()
end

local function OnAttacked(inst, data)
	if inst._isbeauty:value() == true and data and data.attacker then
		inst.components.combat:ShareTarget(data.attacker, 20, CanShareTarget, 50)
	end	
end

local function onusebh(inst)
	local fog = SpawnPrefab("white_bone_fog" )
	if fog then
		if inst.components.white_bone_cloak and inst.components.white_bone_cloak:GetSkin() == "wb_armorfog" then
			fog.scoperange = 40
		end
		fog:SetOwner(inst)
		fog.Transform:SetPosition(inst:GetPosition():Get())
		if TheWorld.components.white_bone_fog then 
			TheWorld.components.white_bone_fog:AddFog(fog)
		end
	end
end

local function onworlddeath(inst,stop)
	if stop then
		if  inst.white_bone_death ~= nil then
			inst.white_bone_death:Cancel()
			inst.white_bone_death = nil 
		end
		if inst.white_bone_leavel then
			inst.white_bone_leavel:Cancel()
			inst.white_bone_leavel = nil 
		end
	end

	inst:AddTag("NOCLICK")
	inst.white_bone_killed = false
	if inst.components.lootdropper then
		inst.components.lootdropper:DropLoot()
	end
	ErodeAway(inst)
end

local function _isboss(inst)
	local pf = inst and inst.prefab
	local t = {'dragonfly', 'minotaur', 'beequeen', 'antlion', 'beefalo',}
	for _, v in ipairs(t)do if pf == v then return true end end
end

local function _nocorpse(inst)
	local tgs = {'hive', 'houndmound', 'player', 'shadow', 'shadowminion', 'shadowchesspiece',
	'wall', 'chess', 'veggie', 'birchnutdrake'}
	if inst then
		for _, v in ipairs(tgs)do
			if inst:HasTag(v) then return true end
		end
	end
end

local function onbecamehuman(inst)
	SetNewState(inst)
	inst:ListenForEvent("onhitother", OnHitOther)
	inst:ListenForEvent("hungerdelta", OnHungerChange)
	inst:ListenForEvent("attacked", OnAttacked)
	
	inst:ListenForEvent("entity_death", inst._OnEntityDeath,TheWorld)	
	OnHungerChange(inst)
end

local function onbecameghost(inst)
	if inst.player_classified  and inst.player_classified.MapExplorer then
		inst.player_classified.MapExplorer:EnableUpdate(true)
	end
    --inst.components.sanityaura.aura = -20/60
    if inst.sanity_aura_ent then
		inst.sanity_aura_ent.components.sanityaura.aura = -20/60
	end
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "white_bone_speed", 1.3)
	inst:RemoveEventCallback("onhitother", OnHitOther)
	inst:RemoveEventCallback("hungerdelta", OnHungerChange)
	inst:RemoveEventCallback("attacked", OnAttacked)
	inst:RemoveEventCallback("entity_death", inst._OnEntityDeath,TheWorld)	
end

local function OnEat(inst,data)
	if data and data.food then
		if data.food.prefab == "reviver" then
			inst.components.talker:Say("这人心真是赛那八珍玉食!")
		end
	end
end

local function onloadbuild(inst)
	SetBuild(inst)
end

local function onload(inst,data)
    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
		onloadbuild(inst)
    end
end

local function onnewspawn(inst)
	onload(inst, {})
end

local function onpreload(inst, data)
    if data ~= nil and data._isbeauty ~= nil then
        inst._isbeauty:set(true)
    end
end

local function onsave(inst, data)
    data._isbeauty = inst._isbeauty:value() == true and true or nil
end

local function CreateSanityAura() --创建透明实体, 制造噩梦光环
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()

	inst:AddTag("NOBLOCK")
	inst:AddComponent('sanityaura')
	--白骨不受影响
	local old_get = inst.components.sanityaura.GetAura
	inst.components.sanityaura.GetAura = function(self, ob, ...)
		if ob and ob.prefab == 'white_bone' and ob.sanity_aura_ent == self.inst then
			return 0
		else
			return old_get(self, ob, ...)
		end
	end

	inst.persists = false

	return inst
end
local function ShouldAcceptItem(inst, item)
    if inst:HasTag("playerghost") then
        return false
    else
        return item.components.inventoryitem ~= nil
    end
end

local function getpetsdelta(inst)
	return inst.components.bone_pets and (-5* inst.components.bone_pets.numpets) or 0
end

local function killpet(inst,pet)
	if pet and pet.components.health and not pet.components.health:IsDead() then
		pet.timedone = true
		pet.components.health:Kill()
	end
end

local function onbuiltfn_flyskill(inst)
	if inst:HasTag("w_b_fog") and inst.components.white_bone_cloak and inst.components.white_bone_cloak:GetSkin() == "wb_armorfog" then
		inst.components.sanity:DoDelta(25)
	end
end

local function NoHoles(pt)
    return not TheWorld.Map:IsGroundTargetBlocked(pt)
end

local function ReticuleTargetFn(inst)
    local rotation = inst.Transform:GetRotation() * DEGREES
    local pos = inst:GetPosition()
    pos.y = 0
    for r = 13, 4, -.5 do
        local offset = FindWalkableOffset(pos, rotation, r, 1, false, true, NoHoles)
        if offset ~= nil then
            pos.x = pos.x + offset.x
            pos.z = pos.z + offset.z
            return pos
        end
    end
    for r = 13.5, 16, .5 do
        local offset = FindWalkableOffset(pos, rotation, r, 1, false, true, NoHoles)
        if offset ~= nil then
            pos.x = pos.x + offset.x
            pos.z = pos.z + offset.z
            return pos
        end
    end
    pos.x = pos.x + math.cos(rotation) * 13
    pos.z = pos.z - math.sin(rotation) * 13
    return pos
end

local function GetPointSpecialActions(inst, pos, useitem, right)
	local weapon =inst.replica.combat:GetWeapon()
    if right and weapon and weapon.prefab == "bone_blade" and weapon:HasTag("can_use_infog") 
		and inst:HasTag("wear_wb_armorfog") and inst:HasTag("w_b_fog") then
        local rider = inst.replica.rider
        if rider == nil or not rider:IsRiding() then
            return { ACTIONS.BLINK }
        end
    end
    return {}
end

local function OnSetOwner(inst)
    if inst.components.playeractionpicker ~= nil then
        inst.components.playeractionpicker.mythpointspecialactionsfn = GetPointSpecialActions
    end
end


local function IsValidVictim(inst,victim)
	if not (victim and victim.components.combat) then  --有血有肉的目标攻击才会触发保护
		return false
	elseif not inst.components.wb_health_redirect:CanRedirect() then--有披风有cd
		return false
	end	
	return true
end

local function NoPlayersOrHoles(pt)
    return not TheWorld.Map:IsPointNearHole(pt)
end
local function getWalkablepos(x, y, z,radius)
    local pt = Vector3(x, y, z)
    local angle = math.random() * 2 * PI
    local offset = FindWalkableOffset(pt, angle, radius, 20, false, true, NoPlayersOrHoles) or
		FindWalkableOffset(pt, angle, radius+1, 20, false, true, NoPlayersOrHoles) or
		FindWalkableOffset(pt, angle, radius+2, 20, false, true, NoPlayersOrHoles)
	return offset
end

local function tele(inst,victim)
	if not (victim and victim.Transform) then
		return
	end
	local x, y, z = victim.Transform:GetWorldPosition() 
	local x2, y2, z2 = inst.Transform:GetWorldPosition() 
	local facing_angle = victim.Transform:GetRotation() * DEGREES
	local x1, y1, z1 = x + 8 * math.cos(facing_angle),0,z - 6 * math.sin(facing_angle)
	if TheWorld.Map:IsAboveGroundAtPoint(x1, y1, z1) then
		inst.Transform:SetPosition(x1, y1, z1)
		return 
	end
	local land = getWalkablepos(x2, y2, z2,4)
	if land ~= nil then 
		x2 = x2 + land.x
		z2 = z2 + land.z
		inst.Transform:SetPosition(x2, y2, z2)
		return
	end

	local land = getWalkablepos(x, y, z,4)
	if land ~= nil then 
		x = x + land.x
		z = z + land.z
		inst.Transform:SetPosition(x, y, z)
		return
	end

	local land = getWalkablepos(x1, y1, z1,2)
	if land ~= nil then 
		x1 = x1 + land.x
		z1 = z1 + land.z
		inst.Transform:SetPosition(x1, y1, z1)
		return 
	end
	--找不到陆地 等死吧！
end

local function redirectfunction(inst, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
	local self = inst.components.health
	if not IsValidVictim(inst,afflicter) then
		return false 
	end
	if not ignore_invincible and (self:IsInvincible() or self.inst.is_teleporting) then
		return true
    elseif amount < 0 and not ignore_absorb then
		amount = amount * math.clamp(1 - (self.playerabsorb ~= 0 and afflicter ~= nil and afflicter:HasTag("player") and self.playerabsorb + self.absorb or self.absorb), 0, 1) * math.clamp(1 - self.externalabsorbmodifiers:Get(), 0, 1)
		if self.currenthealth > 0 and self.currenthealth + amount <= 0 then
			local old_percent = self:GetPercent()
			self:SetVal(5)
			self.inst:PushEvent("healthdelta", { oldpercent = old_percent, newpercent = self:GetPercent(), overtime = overtime, cause = cause, afflicter = afflicter, amount = amount })
			SpawnPrefab("white_bone_changefx").Transform:SetPosition(inst.Transform:GetWorldPosition())
			inst.components.wb_health_redirect:CD()
			tele(inst,afflicter)
			return true
		end
	end
	return false
end

--DebugSpawn"wilson".components.mk_flyer:SetFlying(true)

--ThePlayer._isredirecthealth:set(true) ThePlayer._isredirecthealth:set(false)
local common_postinit = function(inst) 
	inst.soundsname = "sfx"
	inst.talker_path_override = 'WhiteBone/'

	inst._isbeauty = net_bool(inst.GUID, "white_bone.isbeauty", "white_bonebeautifuldirty")
	inst._isredirecthealth = net_bool(inst.GUID, "white_bone.isredirecthealth", "white_boneisredirecthealthdirty")

	inst.MiniMapEntity:SetIcon( "white_bone.tex" )
	inst:AddTag("white_bone")
	inst:AddTag("insomniac")

	inst.BIANHUAN_STR = "WB_BIANHUAN"

	if inst.components.playervision then
		inst.components.playervision.SetGhostVision = function() end
	end
	
    inst:ListenForEvent("setowner", OnSetOwner)

    inst:AddComponent("reticule")
    inst.components.reticule.targetfn = ReticuleTargetFn
    inst.components.reticule.ease = true

	inst:DoTaskInTime(0,function()
		if inst.components.playeractionpicker ~= nil then--成就mod使用覆盖的 所以为了兼容它还要写一个自己的 唉
			local old = inst.components.playeractionpicker.GetPointSpecialActions
			inst.components.playeractionpicker.GetPointSpecialActions = function(self,pos, useitem, right)
				return self.mythpointspecialactionsfn ~= nil and self:SortActionList(self.mythpointspecialactionsfn(self.inst, pos, useitem, right), pos) or old(self,pos, useitem, right)
			end
		end

		if inst.replica.builder then
			local old_CanBuild = inst.replica.builder.CanBuild	
			inst.replica.builder.CanBuild = function(self,recname,...)
				if recname and (recname == "reviver"  or recname == "resurrectionstatue" ) then
					return false
				end
				return old_CanBuild(self,recname,...)
			end
		end
	end)
end

local master_postinit = function(inst)
	
    inst.components.health:SetMaxHealth(TUNING.WHITE_BONE_HEALTH)
    inst.components.hunger:SetMax(TUNING.WHITE_BONE_HUNGER)
    inst.components.sanity:SetMax(TUNING.WHITE_BONE_SANITY)
	inst.components.health.redirect = redirectfunction

	inst.components.foodaffinity:AddPrefabAffinity("reviver", TUNING.AFFINITY_15_CALORIES_HUGE)
	
	inst.components.sanity.night_drain_mult = 0

	inst.components.temperature.mintemp = 36
	inst.components.temperature.maxtemp = 37
	
	inst.sanity_aura_ent = CreateSanityAura()
	inst.sanity_aura_ent.entity:SetParent(inst.entity)
	
	inst.customidleanim = "idle_winona"

	inst:AddComponent("wb_health_redirect")

	inst:AddComponent("mk_bh")
	inst.components.mk_bh.onusefn = onusebh
	inst.components.mk_bh:SetTime(120)
	
	inst:AddComponent("bone_pets")
	inst:AddComponent("white_bone_cloak")
	--eater
	inst.components.eater:Wb_modfn()

	inst.components.eater.DoFoodSanityEffects = function(self,food)
		return (food.components.edible and food.components.edible.foodtype ~= FOODTYPE.MEAT)
	end
	
	local old_eat = inst.components.eater.Eat
	inst.components.eater.Eat = function(self, food, ...)
		if self:PrefersToEat(food) and food.components.edible then
			if food.components.stackable then
				food = food.components.stackable:Get()
			end
			local edible = food.components.edible
			
			if (food:HasTag('preparedfood') and edible.foodtype == 'MEAT')  or   food.prefab == "meat_dried"  then
				edible.healthvalue = 0
			elseif food:HasTag('meat') or food:HasTag("smallmeat") then
				local israw = food.components.cookable ~= nil
				if israw and edible.hungervalue > 0 then
					edible.hungervalue = edible.hungervalue* 1.2
				end
				local sanity = (israw and 0.5 or 0.0)* edible.hungervalue
				local health = (israw and 0.5 or 0.0)* edible.hungervalue
				edible.healthvalue = israw and math.max(edible.healthvalue, health) or 0
				edible.sanityvalue = math.max(sanity, edible.sanityvalue)
			elseif edible.foodtype == "WB_HEART" then
				--
			else
				edible.sanityvalue = math.min(edible.sanityvalue, 0)
				edible.healthvalue = math.min(edible.healthvalue, 0)
				local hunger_mult = (edible.foodtype == 'VEGGIE' or edible.foodtype == 'SEEDS') and 0.2 or 1
				if edible.hungervalue > 0 then
					edible.hungervalue = edible.hungervalue* hunger_mult
				end
			end
			edible.hungervalue = math.max(edible.hungervalue + getpetsdelta(inst) , 0)
		end
		return old_eat(self, food, ...)
	end
	
	--inventory
	local oldaa = inst.components.inventory.Equip
	inst.components.inventory.Equip = function(self,item, old_to_active,...) 
		if item == nil or item.components.equippable == nil or not item:IsValid() or item.components.equippable:IsRestricted(self.inst) then
			return
		end
		if inst._isbeauty:value() == false and item.components.equippable.equipslot ~= EQUIPSLOTS.HANDS  and not item:HasTag("wb_can_equip")   then --如果物品不是手部装备
			item.prevslot = self:GetItemSlot(item)
			if item.prevslot == nil then
				if item.components.inventoryitem and item.components.inventoryitem.cangoincontainer then
					self:GiveItem(item)
				else
					self:DropItem(item, true, true)
				end
			end
			return
		end
		oldaa(self, item, old_to_active, ...)
	end
	local old_ApplyDamage = inst.components.inventory.ApplyDamage
	inst.components.inventory.ApplyDamage = function(self,damage, attacker, weapon,...)
		if attacker and (attacker:HasTag("shadow") or attacker:HasTag("shadowminion") or attacker:HasTag("shadowchesspiece") ) then
			if inst.components.hunger then
				inst.components.hunger:DoDelta(-damage)
			end
			return 0
		end
		return old_ApplyDamage(self,damage, attacker, weapon,...)
	end
	
	--damage
    inst.components.combat.damagemultiplier = 1

	--hunger
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	
	if  inst.components.trader then
		inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	end
	
	---events
	inst:ListenForEvent("white_bonebeautifuldirty", SetNewState)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)
	inst:ListenForEvent("death", ondeath)
	inst:ListenForEvent("oneat", OnEat)
	inst:ListenForEvent('wb_becomemonster', function(inst)
		if inst._isbeauty and inst._isbeauty:value() and not inst:HasTag('playerghost')
			and not (inst.sg and inst.sg:HasStateTag('white_bone_change')) then
			inst._isbeauty:set(false)
			SpawnPrefab('lightning').Transform:SetPosition(inst:GetPosition():Get())
			if inst.components.inventory then
		        for k, v in pairs(inst.components.inventory.equipslots) do
					if k ~= "hands" then
						inst.components.inventory:DropItem(v, true, true)
					end
				end		
			end
		end
	end)
	
	inst._OnEntityDeath = function(world,data)
		if data and data.inst and data.afflicter ~= nil  and  data.afflicter == inst and not _nocorpse(data.inst) then --是白骨造成的击杀
			local health = data.inst.components.health
			local mubiao = data.inst
			if health and health:GetMaxWithPenalty() >= 50  and (_isboss(mubiao) or not health.nofadeout) then
				local time = inst.components.white_bone_cloak:GetSkin() == "wb_armorgreed" and 60 or 10
				health.destroytime = time
				if mubiao.hivebase ~= nil then
					mubiao.hivebase.queenkilled = true
				end
				mubiao:AddTag("white_bone_killed")
				mubiao.white_bone_killed = true
				mubiao._killer_player = inst
				mubiao:AddTag("NOCLICK")
				mubiao.persists = false
				health.nofadeout = true	--不触发原版的ErodeAway
				mubiao:DoTaskInTime(0,function()
					health.nofadeout = false --重置回去
				end)
				mubiao.white_bone_death = mubiao:DoTaskInTime(health.destroytime, onworlddeath)
				mubiao.white_bone_leavel = mubiao:DoPeriodicTask(1/3, function(aa)
					if aa.white_bone_killed then
						aa:RemoveTag("NOCLICK")
					end
					if not (aa._killer_player and aa._killer_player:IsValid()) or ( aa:IsValid() and aa:GetDistanceSqToInst(aa._killer_player)) > 256  then
						onworlddeath(aa,true)
					end
				end)
			end
		end
	end

	SetNewState(inst)
	
	inst.OnBuiltFn_Flyskill = onbuiltfn_flyskill
	inst.OnLoad = onload
	inst.OnNewSpawn = onnewspawn
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
	
end

return MakePlayerCharacter("white_bone", prefabs, assets, common_postinit, master_postinit, start_inv)
