--白骨部分

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

local L = MK_MOD_LANGUAGE_SETTING
---不能使用除了蚊子血袋的 治疗药物
AddComponentPostInit("healer",function(self)
	local old = self.Heal
	self.Heal = function(self,target)
		if target:HasTag("white_bone") and target.components.health ~= nil  and not target.components.health:IsDead() then
			if  self.inst.prefab ~= "mosquitosack" then
				return false
			end
			target.components.health:DoDelta(self.health*2, false, self.inst.prefab)
			if self.inst.components.stackable ~= nil and self.inst.components.stackable:IsStack() then
				self.inst.components.stackable:Get():Remove()
			else
				self.inst:Remove()
			end
			return true
		end
		return old(self,target)
	end
end)

AddComponentPostInit("equippable",function(self)
	local old = self.IsRestricted
	function self:IsRestricted(target)
		if self.equipslot ~= EQUIPSLOTS.HANDS and target and target.prefab == "white_bone" and target._isbeauty:value() == false and not self.inst:HasTag("wb_can_equip") then
			return true
		end
		return old(self,target)
	end
end)


AddComponentPostInit("attunable",function(self)
	local old = self.LinkToPlayer
	function self:LinkToPlayer(player,...)
		if player and player.prefab == "white_bone" then
			return false
		end
		return old(self,player,...)
	end
end)
AddComponentPostInit("freezable",function(self)
	local old = self.AddColdness
	function self:AddColdness(coldness, freezetime, nofreeze,...)
		if self.qingyuan then
			if coldness and coldness > 0 then coldness = coldness * 0.5 end
			if freezetime then freezetime = freezetime * 0.5 end
		end
		return old(self,coldness, freezetime, nofreeze,...)
	end
	local oldoff = self.StartWearingOff
	function self:StartWearingOff(wearofftime,...)
		if self.qingyuan then
			wearofftime = TUNING.PLAYER_FREEZE_WEAR_OFF_TIME*0.5
		end
		return oldoff(self,wearofftime,...)
	end
end)

local function spawn_leif(target)
    local leif = SpawnPrefab("leif")
    leif.AnimState:SetMultColour(target.AnimState:GetMultColour())
    local st = target.components.growable.stage
    local leifscale = st == 1 and 0.7 or st == 2 and 1 or st == 3 and 1.25 or 1
    leif:SetLeifScale(leifscale)

    if target.chopper ~= nil then
        leif.components.combat:SuggestTarget(target.chopper)
    end

    local x, y, z = target.Transform:GetWorldPosition()
    target:Remove()

    leif.Transform:SetPosition(x, y, z)
    leif.sg:GoToState("spawn")
end

--作祟骨架复活
local gamemode = TheNet:GetServerGameMode()
AddComponentPostInit("hauntable",function(self)
	local old_DoHaunt = self.DoHaunt
	function self:DoHaunt(doer,...)
		if doer and doer.prefab == "white_bone" then
			if self.onhaunt ~= nil then
				self.haunted = self.onhaunt(self.inst, doer)
				if self.haunted then
				if doer ~= nil then
						if GetPortalRez(gamemode) and self.hauntvalue == TUNING.HAUNT_INSTANT_REZ and doer:HasTag("playerghost") then 
							doer:PushEvent("respawnfromghost", { source = self.inst })
						end
						if (self.inst.prefab == "skeleton" or self.inst.prefab == "skeleton_player" ) and doer:HasTag("playerghost") then
							doer:PushEvent("respawnfromghost", { source = self.inst })
						end
						
						if self.inst.prefab == "pigman" and self.inst.components.werebeast and not self.inst.components.werebeast:IsInWereState() then 
							local remainingtime = TUNING.TOTAL_DAY_TIME * (1 - TheWorld.state.time)
							local mintime = TUNING.SEG_TIME
							self.inst.components.werebeast:SetWere(math.max(mintime, remainingtime) + math.random() * TUNING.SEG_TIME)
							self.hauntvalue = TUNING.HAUNT_LARGE							
						end
						--if self.inst.prefab == "deciduoustree" and self.inst.StartMonster ~= nil  then
						--	self.inst.StartMonster(self.inst,true)
						--end	
						if self.inst.prefab == "evergreen" and self.inst.anims and self.inst.anims.idle ~= "idle_old" then
							spawn_leif(self.inst)
						end												
						if not self.no_wipe_value then
							self.hauntvalue = nil
						end
					end
					if self.cooldown_on_successful_haunt then
						self.cooldowntimer = self.cooldown or TUNING.HAUNT_COOLDOWN_MEDIUM
						self:StartFX(true)
						self:StartShaderFx()
						self.inst:StartUpdatingComponent(self)
					end
				else
					self.haunted = true
					self.cooldowntimer = self.cooldown or TUNING.HAUNT_COOLDOWN_SMALL
					self:StartFX(true)
					self:StartShaderFx()
					self.inst:StartUpdatingComponent(self)
				end
			end
		elseif doer and doer.prefab == "pigsy" then
			if  self.inst.prefab == "pighouse" and not( self.inst:HasTag("burnt") or (self.inst.components.burnable ~= nil and self.inst.components.burnable:IsBurning()))  and doer:HasTag("playerghost") then
					local fx = SpawnPrefab("collapse_big")
					fx.Transform:SetPosition(self.inst.Transform:GetWorldPosition())
					fx:SetMaterial("wood")
					self.inst:Remove()
					doer.Transform:SetPosition(self.inst.Transform:GetWorldPosition())
					doer:PushEvent("respawnfromghost", { source = self.inst })
				return
			end
			if self.onhaunt ~= nil then
				self.haunted = self.onhaunt(self.inst, doer)
				if self.haunted then
				if doer ~= nil then
						if GetPortalRez(gamemode) and self.hauntvalue == TUNING.HAUNT_INSTANT_REZ and doer:HasTag("playerghost") then 
							doer:PushEvent("respawnfromghost", { source = self.inst })
						end					
						if not self.no_wipe_value then
							self.hauntvalue = nil
						end
					end
					if self.cooldown_on_successful_haunt then
						self.cooldowntimer = self.cooldown or TUNING.HAUNT_COOLDOWN_MEDIUM
						self:StartFX(true)
						self:StartShaderFx()
						self.inst:StartUpdatingComponent(self)
					end
				else
					self.haunted = true
					self.cooldowntimer = self.cooldown or TUNING.HAUNT_COOLDOWN_SMALL
					self:StartFX(true)
					self:StartShaderFx()
					self.inst:StartUpdatingComponent(self)
				end
			end
		else
			old_DoHaunt(self,doer,...)
		end
	end

end)


local function ShouldAcceptItem(inst, item)
    return item and item.prefab == "nightmarefuel" and not inst.ihaveitem
end

local function OnGetItemFromPlayer(inst, giver, item)
	inst.ihaveitem = true
    if giver and giver.components.bone_pets then
		local x,y,z = inst:GetPosition():Get()
        if not giver.components.bone_pets:IsFull() then
			SpawnPrefab("white_bone_raisefx" ).Transform:SetPosition(x,y,z)
			giver:DoTaskInTime(1.5,function()
			inst:Remove()
			giver.components.bone_pets:SpawnPetAt(x, 0, z, "bone_pet",true)	
			end)
		else
			giver.components.talker:Say(STRINGS.BONEPETSFULL)
		end
    end
end

AddPrefabPostInit("skeleton", function(inst)
	local function OnHaunt(inst, haunter)
		return true
	end
	inst:AddTag("trader")
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("hauntable")
    inst.components.hauntable:SetOnHauntFn(OnHaunt)
	
    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer
	
end)
AddPrefabPostInit("skeleton_player", function(inst)
	local function OnHaunt(inst, haunter)
		return true
	end
	inst:AddTag("trader")
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("hauntable")
    inst.components.hauntable:SetOnHauntFn(OnHaunt)
	
    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer
end)


--吃噩梦燃料
local FOODTYPE = GLOBAL.FOODTYPE
FOODTYPE.NIGHTMAREFUEL = "NIGHTMAREFUEL"
FOODTYPE.WB_HEART = "WB_HEART"

AddPrefabPostInit("nightmarefuel", function(inst)
    if not TheWorld.ismastersim then
        return inst
    end
	if  not inst.components.edible then
		inst:AddComponent("edible")
		inst.components.edible.foodtype = "NIGHTMAREFUEL"
	    inst.components.edible.healthvalue = 0
	    inst.components.edible.hungervalue = 25
	    inst.components.edible.sanityvalue = 0
	end
end)

AddPrefabPostInit("reviver", function(inst)
    if not TheWorld.ismastersim then
        return inst
    end
	inst:AddComponent("edible")
	inst.components.edible.foodtype = "WB_HEART"
	inst.components.edible.healthvalue = 50
	inst.components.edible.hungervalue = 50
	inst.components.edible.sanityvalue = 0
end)

AddPrefabPostInit("shadowheart", function(inst)
    if not TheWorld.ismastersim then
        return inst
    end
	inst:AddComponent("edible")
	inst.components.edible.foodtype = "WB_HEART"
	inst.components.edible.healthvalue = 0
	inst.components.edible.hungervalue = 50
	inst.components.edible.sanityvalue = 0
	inst.components.edible.oneaten = function(inst,eater)
		if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
			not (eater.components.health ~= nil and eater.components.health:IsDead()) and
			not eater:HasTag("playerghost") then
				eater.components.debuffable:AddDebuff("wb_shadowheart_buff", "wb_shadowheart_buff")
		end
	end
end)

AddPrefabPostInit("boneshard", function(inst)
    if not TheWorld.ismastersim then
        return inst
    end
	inst:AddComponent("repair_bone")
	inst:AddComponent("white_bone_healer")
	inst.components.white_bone_healer:SetHealthAmount(20)
end)

AddComponentPostInit("eater", function(self)
	self.Wb_modfn = function(self)
		--噩梦燃料
	    table.insert(self.preferseating, "NIGHTMAREFUEL")
	    table.insert(self.caneat, "NIGHTMAREFUEL")
	    self.inst:AddTag("NIGHTMAREFUEL_eater")
		--心脏
	    table.insert(self.preferseating, "WB_HEART")
	    table.insert(self.caneat, "WB_HEART")
	    self.inst:AddTag("WB_HEART_eater")
	end
end)

local old_ero = ErodeAway
function GLOBAL.ErodeAway(inst, ...)
	if inst and inst.white_bone_killed then
		return false
	else
		return old_ero(inst, ...)
	end
end


local function changechance(self,rate)
    if self.chanceloot then
        for k,v in pairs(self.chanceloot) do
			v.chance =  v.chance *rate
        end
    end
    if self.chanceloottable then
        local loot_table = GLOBAL.LootTables[self.chanceloottable]
        if loot_table then
            for i, entry in ipairs(loot_table) do
				if entry[2] ~= nil and type(entry[2]) == "number" then
					entry[2] = entry[2]*rate
				end
            end
        end
    end
end

AddComponentPostInit("lootdropper",function(self)
	local  old_GenerateLoot = self.GenerateLoot
	self.GenerateLoot = function(self,...)

		local greed =  self.inst._killer_player ~= nil and self.inst._killer_player.components.white_bone_cloak ~= nil and 
		self.inst._killer_player.components.white_bone_cloak:GetSkin() == "wb_armorgreed"

		local largecreature = self.inst:HasTag("largecreature")

		local loots
		if  not largecreature and greed then
			changechance(self,2)
			loots = old_GenerateLoot(self,...)
			changechance(self,0.5)
		else
			loots = old_GenerateLoot(self,...)
		end
		
		if self.inst.white_bone_right then
			for i, v in ipairs(loots) do 
				if loots[i] ~= nil then
					loots[i] = "nightmarefuel"
				end
			end
		elseif self.inst.white_bone_left then
			if largecreature then
				table.insert(loots, "boneshard")
			end
			local big = greed and 0.7 or 0.5
			local small = greed and 0.4 or 0.2

			if math.random() < (largecreature and big or small )then 
				table.insert(loots, "boneshard")
			end
			local onemore =	greed and 0.2 or 0.1
			if math.random() < onemore then 
				table.insert(loots, "boneshard")
			end
		end
		return loots
	end
	
	local old = self.DropLoot
	self.DropLoot = function(self,pt,...)
		if self.inst.white_bone_killed then
			do return end
			if self.inst.white_bone_right or self.inst.white_bone_left then
				old(self,pt,...)
			end
			return
		end
		old(self,pt,...)
	end
end)

AddComponentPostInit("combat",function(self)
	local old_TryRetarget = self.TryRetarget
	function self:TryRetarget(...)
		if self.inst.inwbfog  then
			if self.targetfn ~= nil
				and not (self.inst.components.health ~= nil and
						self.inst.components.health:IsDead())
				and not (self.inst.components.sleeper ~= nil and
						self.inst.components.sleeper:IsInDeepSleep()) then

				local newtarget, forcechange = self.targetfn(self.inst)
				if newtarget ~= nil and newtarget ~= self.target and not newtarget:HasTag("notarget") then
					if newtarget.prefab == "white_bone" then
						return
					end
					if forcechange then
						self:SetTarget(newtarget)
					elseif self.target ~= nil and self.target:HasTag("structure") and not newtarget:HasTag("structure") then
						self:SetTarget(newtarget)
					else
						self:SuggestTarget(newtarget)
					end
				end
			end
		else
			old_TryRetarget(self,...)
		end
	end
	
	local old_ShareTarget = self.ShareTarget
	function self:ShareTarget(target,...)
		if self.inst.inwbfog and target and target.prefab == "white_bone" then
			return
		end
		old_ShareTarget(self,target,...)
	end
end)

if ACTIONS.BLINK.strfn ~= nil then
	local oldstr = ACTIONS.BLINK.strfn
	ACTIONS.BLINK.strfn = function(act)
		if act.invobject == nil and act.doer ~= nil and act.doer:HasTag("w_b_fog") then
			return "WUYIN"
		end
		return oldstr(act)
	end
	STRINGS.ACTIONS.BLINK.WUYIN = STRINGS.WHITE_BONE_BLINK
end

local oldfn =  ACTIONS.BLINK.fn
ACTIONS.BLINK.fn = function(act)
	if act.invobject == nil and act.doer ~= nil and act.doer.prefab == "white_bone"  and act.doer:HasTag("w_b_fog") then
		local act_pos = act:GetActionPoint()
		local weapon  = act.doer.components.combat:GetWeapon()
		if weapon and weapon.components.wb_blinkstaff ~= nil then
			return weapon.components.wb_blinkstaff:Blink(act_pos, act.doer)
		end
	end
	return oldfn(act)
end

local WHITE_BONE_RIGHT = Action({ priority=1, mount_valid=false })	
WHITE_BONE_RIGHT.id = "WHITE_BONE_RIGHT"
WHITE_BONE_RIGHT.str = STRINGS.WHITE_BONE_RIGHT
WHITE_BONE_RIGHT.fn = function(act)
    if act and act.target ~= nil then
		if not act.target.white_bone_killed then 
			return
		else
			act.target.white_bone_killed = nil
		end
		if act.target.white_bone_death ~= nil then
			act.target.white_bone_death:Cancel()
			act.target.white_bone_death = nil 
		end
        act.target.white_bone_right = true
		if act.target.components.lootdropper then
			act.target.components.lootdropper:DropLoot()
		end
		if act.doer and act.doer.components.sanity then
			act.doer.components.sanity:DoDelta(-5)
		end
		act.target:AddTag("NOCLICK")
		act.target:DoTaskInTime(0.1, ErodeAway)
		return true
    end
end
AddAction(WHITE_BONE_RIGHT)

local WHITE_BONE_LEFT = Action({ priority=1, mount_valid=false })	
WHITE_BONE_LEFT.id = "WHITE_BONE_LEFT"
WHITE_BONE_LEFT.str = STRINGS.WHITE_BONE_LEFT
WHITE_BONE_LEFT.fn = function(act)
    if act and act.target ~= nil then
		if not act.target.white_bone_killed then 
			return
		else
			act.target.white_bone_killed = nil
		end
		if act.target.white_bone_death ~= nil then
			act.target.white_bone_death:Cancel()
			act.target.white_bone_death = nil 
		end
        act.target.white_bone_left = true
		if act.target.components.lootdropper then
			act.target.components.lootdropper:DropLoot()
		end
		if act.doer and act.doer.components.sanity then
			act.doer.components.sanity:DoDelta(5)
		end
		act.target:AddTag("NOCLICK")
		act.target:DoTaskInTime(0.1, ErodeAway)
		return true
    end
end
AddAction(WHITE_BONE_RIGHT)
AddAction(WHITE_BONE_LEFT)

AddComponentAction("SCENE", "lootdropper" , function(inst, doer, actions, right)
    if inst:HasTag("white_bone_killed") and doer:HasTag("white_bone") then
		if right then
			table.insert(actions, ACTIONS.WHITE_BONE_RIGHT)
		else
			table.insert(actions, ACTIONS.WHITE_BONE_LEFT)		
		end
    end
end) 
AddStategraphActionHandler("wilson",ActionHandler(ACTIONS.WHITE_BONE_RIGHT, "dolongaction"))
AddStategraphActionHandler("wilson_client",ActionHandler(ACTIONS.WHITE_BONE_RIGHT, "dolongaction"))
AddStategraphActionHandler("wilson",ActionHandler(ACTIONS.WHITE_BONE_LEFT, "dolongaction"))
AddStategraphActionHandler("wilson_client",ActionHandler(ACTIONS.WHITE_BONE_LEFT, "dolongaction"))


--骨片治疗？？
local WHITE_BONE_HEAL = Action()	
WHITE_BONE_HEAL.id = "WHITE_BONE_HEAL"
WHITE_BONE_HEAL.str = STRINGS.ACTIONS.HEAL.GENERIC
WHITE_BONE_HEAL.fn = function(act)
    local target = act.target or act.doer
    if target ~= nil and act.invobject ~= nil and target.components.health ~= nil and not (target.components.health:IsDead() or target:HasTag("playerghost")) then
        if act.invobject.components.white_bone_healer ~= nil then
            return act.invobject.components.white_bone_healer:Heal(target)
        end
    end
end
AddAction(WHITE_BONE_HEAL)

AddComponentAction("INVENTORY", "white_bone_healer" , function(inst, doer, actions, right)
	if doer:HasTag("white_bone") and doer.replica.health ~= nil and doer.replica.health:CanHeal() then
		table.insert(actions, ACTIONS.WHITE_BONE_HEAL)
	end
end)
AddStategraphActionHandler("wilson",ActionHandler(ACTIONS.WHITE_BONE_HEAL, "white_bone_heal"))


---
local REPAIR_BONE = Action({ mount_valid=true, encumbered_valid=true })	
REPAIR_BONE.id = "REPAIR_BONE"
REPAIR_BONE.str = STRINGS.REPAIR_BONE
REPAIR_BONE.fn = function(act)
    if act.target ~= nil and act.target.components.finiteuses ~= nil and act.invobject  then
		act.target.components.finiteuses:Use(act.target.components.finiteuses.repairnum or 0 )
		if act.invobject.components.stackable ~= nil then
			act.invobject.components.stackable:Get():Remove()
		else
			act.invobjectm:Remove()
		end
		return true
    end
end

AddAction(REPAIR_BONE)
AddComponentAction("USEITEM", "repair_bone" , function(inst, doer, target, actions, right)
    if right then
        if target and target:HasTag("repairable_bone") then
			table.insert(actions, ACTIONS.REPAIR_BONE)
        end
	end
end)
AddStategraphActionHandler("wilson",ActionHandler(ACTIONS.REPAIR_BONE, "dolongaction"))
AddStategraphActionHandler("wilson_client",ActionHandler(ACTIONS.REPAIR_BONE, "dolongaction"))

local function DefaultRangeCheck(doer, target)
    if target == nil then
        return
    end
    local target_x, target_y, target_z = target.Transform:GetWorldPosition()
    local doer_x, doer_y, doer_z = doer.Transform:GetWorldPosition()
    local dst = distsq(target_x, target_z, doer_x, doer_z)
    return dst <= 16
end
local my_work = {
	CHOP = true,
	DIG = true,
	MINE = true,
}

local MYTH_GIVE = Action({ priority = 1,mount_valid=true, canforce=true, rangecheckfn=DefaultRangeCheck })	
MYTH_GIVE.id = "MYTH_GIVE"
MYTH_GIVE.str = STRINGS.ACTIONS.GIVE.GENERIC
MYTH_GIVE.fn = function(act)
    if act.target ~= nil then
        if act.target.components.trader ~= nil then
            local able, reason = act.target.components.trader:AbleToAccept(act.invobject, act.doer)
            if not able then
                return false, reason
            end
            act.target.components.trader:AcceptGift(act.doer, act.invobject)
            return true
		end
    end
end
AddAction(MYTH_GIVE)
AddComponentAction("USEITEM", "tool" , function(inst, doer, target, actions, right)
	for k, v in pairs(my_work) do
		if inst:HasTag(k.."_tool") and not inst:HasTag("weapon_syf") and target and target:HasTag("bone_pet") then
			table.insert(actions, ACTIONS.MYTH_GIVE)
		end
	end
end)
AddStategraphActionHandler("wilson",ActionHandler(ACTIONS.MYTH_GIVE, "give"))
AddStategraphActionHandler("wilson_client",ActionHandler(ACTIONS.MYTH_GIVE, "give"))

AddComponentPostInit("playercontroller", function(self)
	local old = self.DoActionAutoEquip
	function self:DoActionAutoEquip(buffaction,...)
    	if buffaction and buffaction.action == ACTIONS.MYTH_GIVE then
			return
		end
		return old(self,buffaction,...)
	end
end)

AddBrainPostInit("rabbitbrain", function(self)
	local table1 = self.bt.root.children[3].hunternotags or nil
	if table1 ~= nil then
		table.insert(table1,"w_b_fog")
		table.insert(table1,"myth_yutu")
	end
	local table2 = self.bt.root.children[4].hunternotags or nil
	if table2 ~= nil then
		table.insert(table2,"w_b_fog")
		table.insert(table2,"myth_yutu")
	end	
end)

local function ShouldRunAway(guy)
    return guy:HasTag("character") and not guy:HasTag("notarget") and not guy:HasTag("w_b_fog")
end

AddBrainPostInit("koalefantbrain", function(self)	
	if self.bt.root.children[4] ~= nil and self.bt.root.children[4].children[2] ~= nil then
		self.bt.root.children[4].children[2].hunterfn = ShouldRunAway
	end
end)
AddBrainPostInit("perdbrain", function(self)	
	local  hunternotags = self.bt.root.children[5] ~= nil and self.bt.root.children[5].hunternotags or nil
	if hunternotags ~= nil then
		table.insert(hunternotags,"w_b_fog")
	end
end)

local function MakeBirdNotAfraid(brain)
	local inst = brain.bt.inst
	local function ShouldFlyAway(inst)
		return not (inst.sg:HasStateTag("sleeping") or
					inst.sg:HasStateTag("busy") or
					inst.sg:HasStateTag("flight"))
			and (TheWorld.state.isnight or
				(inst.components.health ~= nil and inst.components.health.takingfiredamage and not (inst.components.burnable and inst.components.burnable:IsBurning())) or
				FindEntity(inst, inst.flyawaydistance, nil, nil, {"w_b_fog", "notarget", "INLIMBO" }, { "player", "monster", "scarytoprey" }) ~= nil)
	end

	for i,node in ipairs(brain.bt.root.children) do
		if node.name == "Sequence" and node.children[1].name ==	"Threat Near"  then
			node.children[1].fn = function() return ShouldFlyAway(inst) end
			break
		end
	end
end
AddBrainPostInit("birdbrain",MakeBirdNotAfraid)

 --禁止的装备格子
local Image = require("widgets/image")
AddClassPostConstruct("widgets/equipslot", function(self)
	if self.owner.prefab == "white_bone" and self.owner._isbeauty ~= nil then
		self.owner:DoTaskInTime(0.1, function(inst)
			if inst._isbeauty:value() == false then
				if self.equipslot and self.equipslot ~= "hands" then
					local pt = self:GetPosition()
					if self.boneimage == nil and pt.x ~= 0 then
						self.boneimage = self:AddChild(Image("images/hud/bone_inventorysolt.xml", "bone_inventorysolt.tex"))
					end
				end
			end
		end)
	
		self.owner:ListenForEvent("white_bonebeautifuldirty", function(inst)
			if inst._isbeauty:value() == false then
				if self.equipslot and self.equipslot ~= "hands" then
					local pt = self:GetPosition()
					if self.boneimage == nil and pt.x ~= 0 then
						self.boneimage = self:AddChild(Image("images/hud/bone_inventorysolt.xml", "bone_inventorysolt.tex"))
					end
				end			
			else
				if self.boneimage ~= nil then
					self.boneimage:Kill()
					self.boneimage = nil
				end
			end
		end)
	end
	
	local oldOnControl = self.OnControl
	function self:OnControl(control, down)
		if self.owner and self.owner.prefab == "white_bone" and self.owner._isbeauty:value() == false and
			self.equipslot ~= "hands" then
			return true
		end
		return oldOnControl(self,control, down)
	end
end)

--ui 相关 包含猴子的
local white_boneui = require("widgets/white_boneui")
local function Addwhite_boneui(self) 
	if self.owner and (self.owner:HasTag("white_bone") 
		or self.owner:HasTag("monkey_king") or self.owner:HasTag("yangjian") or self.owner:HasTag("pigsy")
		) then

		self.white_boneui = self:AddChild(white_boneui(self.owner))	
		
		--调节
		if not GetModConfigData('Skillbadge') then
			self.white_boneui:Hide()
			return
		end
		self.owner:DoTaskInTime(0.5, function()
			local x1 ,y1,z1 = self.stomach:GetPosition():Get()
			local x2 ,y2,z2 = self.brain:GetPosition():Get()		
			local x3 ,y3,z3 = self.heart:GetPosition():Get()		
			if y2 == y1 or  y2 == y3 then --开了三维mod
				self.white_boneui:SetPosition(self.stomach:GetPosition() + Vector3(x1-x2, 0, 0))
				self.boatmeter:SetPosition(self.moisturemeter:GetPosition() + Vector3(x1-x2, 0, 0))
			else
				self.white_boneui:SetPosition(self.stomach:GetPosition() + Vector3(x1-x3, 0, 0))
			end
		end)

	end
	
	local old_SetGhostMode = self.SetGhostMode
	function self:SetGhostMode(ghostmode,...)
		old_SetGhostMode(self,ghostmode,...)
		if ghostmode then		
			if self.white_boneui ~= nil then 
				self.white_boneui:Hide()
			end	
		else
			if self.white_boneui ~= nil then
				self.white_boneui:Show()
			end
		end
	end
end
AddClassPostConstruct("widgets/statusdisplays", Addwhite_boneui)


local function OnEffigyDeactivated(inst)
    if inst.AnimState:IsCurrentAnimation("effigy_deactivate") then
        inst.widget:Hide()
    end
end

local function changewhitehealth(self)
	if self.owner._isredirecthealth:value() == false then
		self:HidewhitehealthEffigy()
	else
		self:ShowwhitehealthEffigy()
	end
end
local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"
AddClassPostConstruct("widgets/healthbadge", function(self)
	if self.owner and self.owner:HasTag("white_bone") then
		function self:ShowwhitehealthEffigy()
			if not self.whitehealtheffigy then
				self.whitehealtheffigy = true
				self.whitehealthyanim:GetAnimState():PlayAnimation("effigy_activate")
				self.whitehealthyanim:GetAnimState():PushAnimation("effigy_idle", false)
				self.whitehealthyanim:Show()
			end
		end
		function self:HidewhitehealthEffigy()
			if self.whitehealtheffigy then
				self.whitehealtheffigy = false
				self.whitehealthyanim:GetAnimState():PlayAnimation("effigy_deactivate")
			end
		end
		self.whitehealthyanim = self.underNumber:AddChild(UIAnim())
		self.whitehealthyanim:GetAnimState():SetBank("status_health")
		self.whitehealthyanim:GetAnimState():SetBuild("wb_redirect_health")
		self.whitehealthyanim:GetAnimState():PlayAnimation("effigy_deactivate")
		self.whitehealthyanim:SetPosition(-7, 50)

		self.whitehealthyanim:Hide()
		self.whitehealthyanim:SetClickable(false)
		self.whitehealthyanim.inst:ListenForEvent("animover", OnEffigyDeactivated)
		self.whitehealtheffigy = false

		self.inst:ListenForEvent("white_boneisredirecthealthdirty", function(inst)
			changewhitehealth(self)
		end,self.owner)
		changewhitehealth(self)
	end
end)

--雾气
local function AddFog(self)
	local FogOver = require "widgets/white_bonefogover"
	
	local old_CreateOverlays = self.CreateOverlays
	function self:CreateOverlays(owner,...)
		old_CreateOverlays(self,owner,...)
		self.white_bonefogover = self.overlayroot:AddChild(FogOver(owner))
		self.white_bonefogover:Hide()
	end
end
AddClassPostConstruct("screens/playerhud", AddFog)


--人物变身sg
local function DoEmoteSound(inst, soundoverride, loop)
    loop = loop and soundoverride ~= nil and "emotesoundloop" or nil
    local soundname = soundoverride or "emote"
    local emotesoundoverride = soundname.."soundoverride"
    if inst[emotesoundoverride] ~= nil then
        inst.SoundEmitter:PlaySound(inst[emotesoundoverride], loop)
    elseif not inst:HasTag("mime") then
        inst.SoundEmitter:PlaySound((inst.talker_path_override or "dontstarve/characters/")..(inst.soundsname or inst.prefab).."/"..soundname, loop)
    end
end

local function pleaseattackme(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 12,{ "_combat"},{"player","playerghost","INLIMBO"})

    for i, v in ipairs(ents) do
        if v and v:IsValid()
            and not (v.components.health ~= nil and
                    v.components.health:IsDead())
            and v.components.combat:CanAttack(inst) then
			v.components.combat:SuggestTarget(inst)
        end
    end
end

AddStategraphState('wilson',

    State{
        name = "white_bone_change",
        tags = { "busy", "white_bone_change", "pausepredict"},
		
        onenter = function(inst, data)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("emote_strikepose", false)
			DoEmoteSound(inst, "pose", nil)
			if inst.components.playercontroller ~= nil then
                inst.components.playercontroller:RemotePausePrediction()
            end
		end,
			
		timeline =
			{
				TimeEvent(1.5, function(inst)
					inst.sg:RemoveStateTag("pausepredict")
					inst:SpawnChild("white_bone_changefx")
					if inst._isbeauty ~= nil then
						inst._isbeauty:set(not inst._isbeauty:value())
						inst.AnimState:SetBuild(_GetBuild(inst, inst._isbeauty:value()))
						if inst._isbeauty:value() == false then
							pleaseattackme(inst)
						end
					end
				end),
		},

		events =
			{
				EventHandler("animover", function(inst)
					if inst.AnimState:AnimDone() then
						inst.sg:GoToState("idle")
					end
				end),
		},
	}
)
AddStategraphState('wilson',

    State{
        name = "white_bone_frog",
        tags = { "white_bone_frog","busy","doing", "nodangle" },
		
        onenter = function(inst, data)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("emote_slowclap")
		end,		
		timeline =
		{
           	TimeEvent(4 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
			TimeEvent(1.8, function(inst)
				inst:PerformBufferedAction()
			end),
		},
		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("idle")
				end
			end),
		},
	}
)

AddStategraphState('wilson_client',

    State{
        name = "white_bone_frog",
        tags = { "white_bone_frog","doing","busy"},
		
        onenter = function(inst, data)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("emote_slowclap", false)
            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(2)
		end,		
        timeline =
        {
            TimeEvent(4 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
        },
        onupdate = function(inst)
            if inst:HasTag("doing") then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.sg:GoToState("idle")
            end
        end,
        ontimeout = function(inst)
            inst:ClearBufferedAction()
            inst.sg:GoToState("idle")
        end,
	}
)

AddStategraphState('wilson',

    State{
        name = "white_bone_rebirth",
        tags = { "busy", "nopredict", "silentmorph" },
		
        onenter = function(inst)
            if inst.components.playercontroller ~= nil then
                inst.components.playercontroller:Enable(false)
            end
            inst.AnimState:PlayAnimation("death2_idle")
           
			inst.components.health:SetInvincible(true)
            inst:ShowHUD(false)
            inst:SetCameraDistance(14)
        end,
		
        timeline =
        {
            TimeEvent(2, function(inst)
                inst.AnimState:PlayAnimation("corpse_revive")
			end),
        },
        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() and inst.AnimState:IsCurrentAnimation("corpse_revive") then
                    inst.sg:GoToState("idle")
                end
            end),
        },
        onexit = function(inst)
            inst:ShowHUD(true)
            inst:SetCameraDistance()
            if inst.components.playercontroller ~= nil then
                inst.components.playercontroller:Enable(true)
            end
            inst.components.health:SetInvincible(false)
			inst.components.health:SetPercent(100/150)
			inst.components.hunger:SetPercent(100/150)
			inst.components.sanity:SetPercent(100/250)
            SerializeUserSession(inst)
        end,
	}
)

AddStategraphState('wilson',
    State{
        name = "white_bone_heal",
        tags = { "doing", "busy", "nodangle","nopredict" },
		
        onenter = function(inst, data)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("idle_winona")
			print(inst.AnimState:GetCurrentAnimationLength())
			inst.SoundEmitter:PlaySound("dontstarve/wilson/make_trap", "make")
		end,		
		timeline =
		{
           	TimeEvent(4 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
            end),
			TimeEvent(1.2, function(inst)
				inst.SoundEmitter:KillSound("make")
				inst:PerformBufferedAction()
			end),
		},
		events =
		{
			EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("idle")
				end
			end),
		},
        onexit = function(inst)
            inst.SoundEmitter:KillSound("make")
        end,
	}
)

--死亡不掉落骨架
local ex_fns = require "prefabs/player_common_extensions"
local old_Ghost  = ex_fns.OnMakePlayerGhost
local old_ConfigurePlayerLocomotor  = ex_fns.ConfigurePlayerLocomotor
local old_ConfigurePlayerActions  = ex_fns.ConfigurePlayerActions

ex_fns.OnMakePlayerGhost = function(inst,data)
	if inst and inst.prefab == "white_bone" then
		if data and data.skeleton and not inst.wb_bone  then
			data.skeleton = nil
		end
		inst.wb_bone = false
		old_Ghost(inst,data)
		inst.Network:RemoveUserFlag(USERFLAGS.IS_GHOST)
		TheWorld:DoTaskInTime(0.2, function()
		TheWorld:PushEvent("ms_playercounts",
            {
                total = TheWorld.shard.components.shard_players:GetNumPlayers(),
                ghosts = TheWorld.shard.components.shard_players:GetNumGhosts(),
                alive = TheWorld.shard.components.shard_players:GetNumAlive(),
            })
		end)
	else
		old_Ghost(inst,data)
	end
end
AddComponentPostInit("shard_players",function(self)
	local old_ghost = self.GetNumGhosts
	function self:GetNumGhosts(...)
		local old = old_ghost(self,...)
        for i, v in ipairs(AllPlayers) do
            if v:HasTag("playerghost") and v:HasTag("white_bone") then --是白骨就-1
                old = old - 1
            end
        end
		return old
	end
	local old_alive = self.GetNumAlive	
	function self:GetNumAlive(...)
		local old = old_alive(self,...)
        for i, v in ipairs(AllPlayers) do
            if v:HasTag("playerghost") and v:HasTag("white_bone") then --是白骨就+1
                old = old + 1
            end
        end
		return old
	end
end)

local function CommonActualRez(inst)
    inst.player_classified.MapExplorer:EnableUpdate(true)

    if inst.components.revivablecorpse ~= nil then
        inst.components.inventory:Show()
    else
        inst.components.inventory:Open()
        inst.components.age:ResumeAging()
    end

    inst.components.health.canheal = true
    if not GetGameModeProperty("no_hunger") then
        inst.components.hunger:Resume()
    end
    if not GetGameModeProperty("no_temperature") then
        inst.components.temperature:SetTemp()
    end
    inst.components.frostybreather:Enable()

    MakeMediumBurnableCharacter(inst, "torso")
    inst.components.burnable:SetBurnTime(TUNING.PLAYER_BURN_TIME)
    inst.components.burnable.nocharring = true

    MakeLargeFreezableCharacter(inst, "torso")
    inst.components.freezable:SetResistance(4)
    inst.components.freezable:SetDefaultWearOffTime(TUNING.PLAYER_FREEZE_WEAR_OFF_TIME)

    inst:AddComponent("grogginess")
    inst.components.grogginess:SetResistance(3)
    inst.components.grogginess:SetKnockOutTest(ShouldKnockout)

    inst.components.moisture:ForceDry(false, inst)

    inst.components.sheltered:Start()

    inst.components.debuffable:Enable(true)

    inst.components.sanity.ignore = GetGameModeProperty("no_sanity")

    old_ConfigurePlayerLocomotor(inst)
    old_ConfigurePlayerActions(inst)

    if inst.rezsource ~= nil then
        local announcement_string = GetNewRezAnnouncementString(inst, inst.rezsource)
        if announcement_string ~= "" then
            TheNet:AnnounceResurrect(announcement_string, inst.entity)
        end
        inst.rezsource = nil
    end
    inst.remoterezsource = nil
end

local function DoActualRez(inst, source, item)
    local x, y, z
    if source ~= nil then
        x, y, z = source.Transform:GetWorldPosition()
    else
        x, y, z = inst.Transform:GetWorldPosition()
    end

    local diefx = SpawnPrefab("lavaarena_player_revive_from_corpse_fx")
    if diefx and x and y and z then
        diefx.Transform:SetPosition(x, y, z)
    end

    inst.AnimState:Hide("HAT")
    inst.AnimState:Hide("HAIR_HAT")
    inst.AnimState:Show("HAIR_NOHAT")
    inst.AnimState:Show("HAIR")
    inst.AnimState:Show("HEAD")
    inst.AnimState:Hide("HEAD_HAT")

    inst:SetStateGraph("SGwilson")

    inst.Physics:Teleport(x, y, z)

	inst:DoTaskInTime(2.7,function()
		inst:Show()
		inst.player_classified:SetGhostMode(false)
		if source ~= nil then
			source:Remove()
			inst.DynamicShadow:Enable(true)
			inst.AnimState:SetBank("wilson")
			inst.components.skinner:SetSkinMode("normal_skin")
			inst.components.bloomer:PopBloom("playerghostbloom")
			inst.AnimState:SetLightOverride(0)
			inst.sg:GoToState("white_bone_rebirth", item)
		else
			inst.AnimState:SetBank("wilson")
			inst.components.skinner:SetSkinMode("normal_skin")
			inst.sg:GoToState("reviver_rebirth", item)
		end
 
		inst.Light:SetIntensity(.8)
		inst.Light:SetRadius(.5)
		inst.Light:SetFalloff(.65)
		inst.Light:SetColour(255 / 255, 255 / 255, 236 / 255)
		inst.Light:Enable(false)

		MakeCharacterPhysics(inst, 75, .5)

		CommonActualRez(inst, source, item)

		inst:RemoveTag("playerghost")
		inst.Network:RemoveUserFlag(USERFLAGS.IS_GHOST)

		inst:PushEvent("ms_respawnedfromghost")
	end)
end

local function OnRespawnFromGhost(inst, data)
    if not inst:HasTag("playerghost") then
        return
    end
    inst.deathclientobj = nil
    inst.deathcause = nil
    inst.deathpkname = nil
    inst.deathbypet = nil
    inst:ShowHUD(false)
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:Enable(false)
    end
    if inst.components.talker ~= nil then
        inst.components.talker:ShutUp()
    end
    inst.sg:AddStateTag("busy")

	inst:DoTaskInTime(0, DoActualRez,data.source )
    inst.rezsource =
        data ~= nil and (
            (data.source ~= nil and data.source.prefab ~= "reviver" and data.source:GetBasicDisplayName()) or
            (data.user ~= nil and data.user:GetDisplayName())
        ) or
        STRINGS.NAMES.SHENANIGANS

    inst.remoterezsource =
        data ~= nil and
        data.source ~= nil and
        data.source.components.attunable ~= nil and
        data.source.components.attunable:GetAttunableTag() == "remoteresurrector"
end

local old_Ghost  = ex_fns.OnRespawnFromGhost
ex_fns.OnRespawnFromGhost = function(inst,data)
	if inst and inst.prefab == "white_bone" then
		if data and  data.source  and (data.source.prefab == "skeleton" or data.source.prefab == "skeleton_player") then
			return OnRespawnFromGhost(inst,data)
		end
		return
	end
	old_Ghost(inst,data)
end


AddComponentPostInit("wardrobe",function(self)
	local old_ApplySkins = self.ApplySkins
	function self:ApplySkins(doer, diff)
		old_ApplySkins(self,doer, diff)
		if doer and doer.prefab == "white_bone" and doer._isbeauty ~= nil then
			doer.AnimState:SetBuild(_GetBuild(doer, doer._isbeauty:value()))
		end	
	end
end)
	
--白骨镜子升级的配方

TUNING.WB_BONE_MIRROR_RECIPR = {
	[2] = {
		{"redgem", 3},
		{"boneshard", 6},
	},

	[3] = {
		{"purplegem", 4},
		{"boneshard", 8},
	},
}