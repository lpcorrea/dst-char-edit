
--火眼金睛

local function hungerdelate(inst)
    if (inst.components.health and not inst.components.health:IsDead())
    and (inst.components.hunger and inst.components.hunger.current > 1 )then
		local num  = inst.replica.inventory ~= nil and(
		inst.replica.inventory:EquipHasTag("golden_hat_mk") and 0
		or inst.replica.inventory:EquipHasTag("xzhat_mk") and 0.5 
		or 1)
        inst.components.hunger:DoDelta(-0.6 * num ,true)
    end
end

local function downdown(self)
	--等哪天别人也改了这个我在写兼容吧~~~~~~
	self.OnUpdate = function(dt)
	local down = self.owner ~= nil and self.owner.replica.hunger ~= nil and
        self.owner.replica.hunger:GetPercent() > 0 and
        (self.owner:HasTag("sleeping") or 
		(self.owner:HasTag("fireeye") and not self.owner.replica.inventory:EquipHasTag('golden_hat_mk')) or
		(self.owner:HasTag("skyeye") and not self.owner.replica.inventory:EquipHasTag('yangjian_hair'))		
		)
        
	local anim = down and "arrow_loop_decrease" or "neutral"
	if self.arrowdir ~= anim then
		self.arrowdir = anim
		self.hungerarrow:GetAnimState():PlayAnimation(anim, true)
	end
	end
end
AddClassPostConstruct( "widgets/hungerbadge", downdown)

local function GetSandstormLevel(inst)
	--if inst.GetSandstormLevel ~= nil then
	--	return inst:GetSandstormLevel()
	if inst.GetStormLevel ~= nil then
		return inst:GetStormLevel()
	end
	return 0
end

local function Fireeye(inst)
	if inst:HasTag("playerghost") or not inst:HasTag("monkey_king") then return end

	if inst.eyecdin then return end

	if not (inst.components.playercontroller and inst.components.playercontroller:IsEnabled()) then return end

	if GetSandstormLevel(inst) >= TUNING.SANDSTORM_FULL_LEVEL and inst.components.playervision
		and not inst.components.playervision:HasGoggleVision()	 then
			inst.components.talker:Say(STRINGS.MKINSANDSTORM)
		return
	end

	if inst._mknightvision:value() == true then --turn off
		inst._mknightvision:set(false)
		if inst.fireeyetask ~= nil then
			inst.fireeyetask:Cancel()
			inst.fireeyetask = nil
		end
		inst:RemoveTag("fireeye")
	else  --turn on
		inst:SpawnChild("halloween_firepuff_3")
		inst._mknightvision:set(true)
		inst:AddTag("fireeye")
		inst.fireeyetask = inst:DoPeriodicTask(1, hungerdelate, 1)
	end

	inst.eyecdin = true
	inst:DoTaskInTime(0.2, function() inst.eyecdin = false end)

	return true
end

local function Changebuild(inst)

	if inst:HasTag("playerghost") or not inst:HasTag("white_bone") then return end

	if not inst.sg or inst.sg:HasStateTag("white_bone_change") or inst.sg:HasStateTag("busy") then return end

	if not (inst.components.playercontroller and inst.components.playercontroller:IsEnabled()) then return end
	
	if not inst._isbeauty then return end
	if not inst._isbeauty:value() then
		inst.sg:GoToState("white_bone_change")
	else
		inst:PushEvent('wb_becomemonster')
	end
end

local function yghungerdelate(inst)
    if (inst.components.health and not inst.components.health:IsDead())
    and (inst.components.hunger and inst.components.hunger.current > 1 )then
		local num  = inst.replica.inventory ~= nil and(
		inst.replica.inventory:EquipHasTag("yangjian_hair") and 0
		or 1)
        inst.components.hunger:DoDelta(-0.8 * num ,true)
    end
end
local function YJSkyeye(inst)
	if inst:HasTag("playerghost") or not inst:HasTag("yangjian") then return end

	if inst.eyecdin then return end

	if not (inst.components.playercontroller and inst.components.playercontroller:IsEnabled()) then return end

	if GetSandstormLevel(inst) >= TUNING.SANDSTORM_FULL_LEVEL and inst.components.playervision
		and not inst.components.playervision:HasGoggleVision()	 then
			inst.components.talker:Say(STRINGS.YJINSANDSTORM)
		return
	end

	if inst._skyeye:value() == true then --turn off
		inst._skyeye:set(false)
		if inst.skyeyetask ~= nil then
			inst.skyeyetask:Cancel()
			inst.skyeyetask = nil
		end
		inst:RemoveTag("skyeye")
	else  --turn on
		inst:SpawnChild("yangjian_firebird")
		inst:DoTaskInTime(0.1,function()
			inst._skyeye:set(true)
			inst:AddTag("skyeye")
			inst.skyeyetask = inst:DoPeriodicTask(1, yghungerdelate, 1)
		end)
	end
	inst.eyecdin = true
	inst:DoTaskInTime(0.2, function() inst.eyecdin = false end)

	return true
end

local IsFlying = function(inst) return inst and inst.components.mk_flyer and inst.components.mk_flyer:IsFlying()end

local function PigPig(inst)
    if inst:HasTag("playerghost") or not inst:HasTag("pigsy") then return end

    if inst.eyecdin then return end

    if IsFlying(inst) then return end

    if not (inst.components.playercontroller and inst.components.playercontroller:IsEnabled()) then return end

    if inst.sg and inst.sg:HasStateTag("busy") then
        return false
    end
    if inst.components.hunger.current < 50 then return end  
    
    if inst._becomehpig:value() == true then --turn off
        inst._becomehpig:set(false)
    else
        if inst.components.inventory then
            local inv = inst.components.inventory
            for k,v in pairs(inv.equipslots) do
                inv:GiveItem(inv:Unequip(k)) 
             end
        end
        inst._becomehpig:set(true)
    end
    inst.eyecdin = true
    inst:DoTaskInTime(0.2, function() inst.eyecdin = false end)
end

local function myth_transform(inst,num)
    if type(num) =="number" then
        if num == 1 then
            Fireeye(inst)
        elseif num == 2  then
            Changebuild(inst)
        elseif num == 3 then
            YJSkyeye(inst)
        elseif num == 4 then
            PigPig(inst)
        end
    end
end
AddModRPCHandler("myth_transform", "myth_transform", myth_transform)

AddPlayerPostInit(function(inst)
	inst._inwbfog = net_bool(inst.GUID, "player._inwbfog", "inwbfogdirty")
end)

local PlayerAvatarPopup = require("widgets/playeravatarpopup")
local EquipSlot = require("equipslotutil")
local DEFAULT_IMAGES =
{
    hands = "unknown_hand.tex",
    head = "unknown_head.tex",
    body = "unknown_body.tex",
}

RegisterInventoryItemAtlas("images/inventoryimages/golden_armor_mk.xml","golden_armor_mk_none.tex")
RegisterInventoryItemAtlas("images/inventoryimages/golden_hat_mk.xml","golden_hat_mk_none.tex")
RegisterInventoryItemAtlas("images/inventoryimages/yangjian_hair.xml","yangjian_hair_none.tex")
RegisterInventoryItemAtlas("images/inventoryimages/yangjian_armor.xml","yangjian_armor_none.tex")

local mk_items = 
{
	--"cassock",
	--"kam_lan_cassock",
	"golden_armor_mk",
	"mk_jgb",
	"mk_jgb",
	"nz_damask",
	"golden_hat_mk",
	"nz_lance",
	"nz_ring",
	"xzhat_mk",
	"bone_wand",
	"bone_blade",
	"bone_whip",
	"bone_spike",
}

local Old_UpdateEquipWidgetForSlot = PlayerAvatarPopup.UpdateEquipWidgetForSlot
function PlayerAvatarPopup:UpdateEquipWidgetForSlot(image_group, slot, equipdata,...)
	Old_UpdateEquipWidgetForSlot(self,image_group, slot, equipdata,...)
	local name = equipdata ~= nil and equipdata[EquipSlot.ToID(slot)] or nil
	name = name ~= nil and #name > 0 and name or "none"
	local default = DEFAULT_IMAGES[slot] or "trinket_5.tex"
	if table.contains(mk_items,name) then
		local image = "images/monkey_king_item.xml"
		image_group._image:SetTexture(image,name..".tex", default)
	end
end


FUELTYPE.LOTUS_FLOWER = "LOTUS_FLOWER"

AddPrefabPostInit("lotus_flower", function(inst)
	if not TheWorld.ismastersim then
		return inst
	end
	inst:AddComponent("lotusplant")
    inst:AddComponent("fuel")
    inst.components.fuel.fueltype = FUELTYPE.LOTUS_FLOWER
    inst.components.fuel.fuelvalue = 10
end)

AddPrefabPostInit("world", function(inst)
    inst:AddComponent("white_bone_fog")
end)

local function candig(pt)
	if math.abs(pt.z) > 1500 then 
		return false
	end
	return true
end
local MYTHBIANHUAN = Action({ priority=2,encumbered_valid= true,under_ground = true})
MYTHBIANHUAN.id = "MYTHBIANHUAN"
MYTHBIANHUAN.strfn = function(act)
    local target = act.invobject or act.target
    if target and target:HasTag("myth_yutu_underground") then
        return "OUT_GROUND"
    else
        return  target and target.BIANHUAN_STR or "USE"
    end
end
MYTHBIANHUAN.fn = function(act)
    if act.doer and act.doer.components.mk_bh  then
		act.doer.components.mk_bh:OnChange()
		return true
	end
	return false
end
AddAction(MYTHBIANHUAN)
AddComponentAction("SCENE", "mk_bh" , function(inst, doer, actions, right)
    if right  and not IsFlying(inst) and inst == doer then
		if doer:HasTag("monkey_king") and not inst:HasTag("mk_miao")
			and inst.replica.inventory and inst.replica.inventory:GetActiveItem() == nil and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) == nil
			and not (inst.replica.rider ~= nil and inst.replica.rider:IsRiding()) and doer:HasTag("cansuemk_bh") then
			table.insert(actions, ACTIONS.MYTHBIANHUAN)
		elseif doer:HasTag("white_bone")
			and not (inst.replica.rider ~= nil and inst.replica.rider:IsRiding()) and doer:HasTag("cansuemk_bh") then
				table.insert(actions, ACTIONS.MYTHBIANHUAN)
		elseif doer:HasTag("myth_yutu") and not (inst.replica.rider ~= nil and inst.replica.rider:IsRiding()) and inst:IsOnValidGround()then
			local pt = doer:GetPosition()
			if inst:HasTag("myth_yutu_underground") or candig(pt) then
				table.insert(actions, ACTIONS.MYTHBIANHUAN)
			end
        elseif doer:HasTag("pig_zhuzhu") then
            table.insert(actions, ACTIONS.MYTHBIANHUAN)
		end
    end
end) 
AddStategraphActionHandler("wilson",ActionHandler(ACTIONS.MYTHBIANHUAN, function(inst, action)
    if action and action.target ~= nil then
        if action.target:HasTag("white_bone") then
            return "white_bone_frog"
        end
    end
    return "myth_sg_pre"
end))
AddStategraphActionHandler("wilson_client",ActionHandler(ACTIONS.MYTHBIANHUAN, function(inst, action)
    if action and action.target ~= nil then
        if action.target:HasTag("white_bone") then
            return "white_bone_frog"
        end
    end
    return "myth_sg_pre"
end))

STRINGS.ACTIONS.MYTHBIANHUAN = {
    IN_GROUND = STRINGS.YTBIANHUAN,
    OUT_GROUND = STRINGS.YTBIANHUAN_OUT,
    MK_BIANHUAN = STRINGS.MKBIANHUAN,
    USE = STRINGS.MKBIANHUAN,
    WB_BIANHUAN = STRINGS.WBBIANHUAN,
    PIG_BIANHUAN = STRINGS.PIGBIANHUAN,
}

local pick = Action({priority = 2, distance = 2})
pick.id = "MYTH_PICKUP_PILLAR"
pick.str = STRINGS.MYTH_PICKUP_PILLAR
pick.fn = function(act)
	local skin = act.target.skin
    if act.target.is_picked then
        return false
    else
        act.target.is_picked = true
    end
    act.target.persists = false
	act.target.AnimState:PlayAnimation("pillar_pick")
	act.target:ListenForEvent("animover", function(inst)
		SpawnPrefab("collapse_small").Transform:SetPosition(inst:GetPosition():Get())
		inst:Remove()
	end)
	local j = SpawnPrefab("mk_jgb")
	j.components.myth_itemskin:ChangeSkin(skin)
	act.doer.components.inventory:GiveItem(j)
	return true
end

AddAction(pick)

AddComponentAction("SCENE", "mk_jgb_pillar", function(inst, doer, actions, right)
	if doer.prefab == 'monkey_king' then
		table.insert(actions, pick)
	end
end)

AddStategraphActionHandler("wilson", ActionHandler(pick, "mk_pick_pillar"))
-- AddStategraphActionHandler("wilson_client", ActionHandler(pick, "mk_pick_pillar"))

AddStategraphState('wilson', State{
    name = "mk_pick_pillar",
    tags = { "busy", "pausepredict"},
	
    onenter = function(inst, data)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("construct_pre")
        inst.AnimState:PushAnimation("construct_loop")
		if inst.components.playercontroller ~= nil then
            inst.components.playercontroller:RemotePausePrediction()
        end
        inst.sg:SetTimeout(1)
	end,

	ontimeout = function(inst)
		inst.sg:RemoveStateTag("pausepredict")
		inst:PerformBufferedAction()
		inst.sg:GoToState("idle")
	end,
})

AddStategraphState("wilson", State{
    name = "mk_summonjgb",
    tags ={"idle"},
    onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("research")
    end,

    timeline = {
        TimeEvent(1*FRAMES, function(inst)inst:PerformBufferedAction() end)
     },

    events= {
        EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
    },
})

AddStategraphState("wilson", State{
    name = "mk_dsf",
    tags ={"idle"},
    onenter = function(inst)
        inst.components.locomotor:Stop()
		inst.components.health:SetInvincible(true)
        inst.AnimState:PlayAnimation("research")
    end,

    timeline = {
        TimeEvent(1*FRAMES, function(inst)inst:PerformBufferedAction() end)
     },

    events= {
        EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
    },
	onexit = function(inst)
		inst.components.health:SetInvincible(false)
	end,
})

AddStategraphState("wilson_client", State{
    name = "mk_summonjgb",
    tags ={"idle"},
    onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("research")
    end,

    timeline = {
    	TimeEvent(1*FRAMES, function(inst)inst:PerformPreviewBufferedAction() end),
    	TimeEvent(2, function(inst)inst:ClearBufferedAction()end),
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

    events= {
        EventHandler("animqueneover", function(inst) inst.sg:GoToState("idle") end),
    },
})

AddStategraphState("wilson_client", State{
    name = "mk_dsf",
    tags ={"idle"},
    onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("research")
    end,

    timeline = {
    	TimeEvent(1*FRAMES, function(inst)inst:PerformPreviewBufferedAction() end),
    	TimeEvent(2, function(inst)inst:ClearBufferedAction()end),
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

    events= {
        EventHandler("animqueneover", function(inst) inst.sg:GoToState("idle") end),
    },
})

AddStategraphState("wilson", 
    State{
        name = "mk_jgb_teleport_out",
        tags = { "aoe", "doing", "busy", "nointerrupt", "nomorph" },
        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("wortox_portal_jumpout")
        end,
        
        timeline =
        {
            TimeEvent(FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/characters/wortox/soul/hop_out") end),
            TimeEvent(7 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/movement/bodyfall_dirt")
            end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    }
)

AddStategraphState("wilson_client", 
    State{
        name = "mk_jgb_teleport_out",
        tags = { "aoe", "doing", "busy", "nointerrupt", "nomorph" },
        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("wortox_portal_jumpout")
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    }
)

AddPrefabPostInit("bird_mutant", function(inst) 
	if inst.components.combat then
		local old = inst.components.combat.StopTrackingTarget
		inst.components.combat.StopTrackingTarget = function(self,...)
			if not self.losetargetcallback then
				return
			end
			old(self,...)
		end
	end
end)

--定身术相关 小豪牛逼
-- 延时任务
AddGlobalClassPostConstruct("scheduler", "Periodic", function(self)
    function self:AddTick()
        if not self.nexttick or not scheduler.attime[self.nexttick] then
            return
        end
        local thislist = scheduler.attime[self.nexttick]
        self.nexttick = self.nexttick + 1
        if not scheduler.attime[self.nexttick] then
            scheduler.attime[self.nexttick] = {}
        end
        local nextlist = scheduler.attime[self.nexttick]
        thislist[self] = nil
        nextlist[self] = true
        self.list = nextlist
    end
end)

-- 状态
AddGlobalClassPostConstruct("stategraph", "StateGraphInstance", function(self)

    local old_gotostate = self.GoToState
    function self:GoToState(newstate, p, ...)
        local state = self.sg.states[newstate]      
        if not state then 
            return old_gotostate(self, newstate, p, ...)
        end
		if self:HasStateTag('white_bone_killed') then 
			return 
		end
		if self.inst:HasTag("myth_dingshenshu") and self.inst.components.mk_hold_animal then
			self.inst.components.mk_hold_animal:Stop()
		end
		return old_gotostate(self, newstate, p, ...)
    end

    local old_update = self.Update
    function self:Update(...)
        local sleep_time = old_update(self, ...)
        if not sleep_time then
            self.myth_nextupdatetick = nil
        else
            local sleep_ticks = sleep_time/GetTickTime()
            sleep_ticks = sleep_ticks == 0 and 1 or sleep_ticks
            self.myth_nextupdatetick = math.floor(sleep_ticks + GetTick())+1
        end

        return sleep_time
    end

    function self:AddMythTick(dt)
        dt = dt or GetTickTime()
        self.statestarttime = self.statestarttime + dt
        if self.myth_nextupdatetick then
            local thislist = SGManager.tickwaiters[self.myth_nextupdatetick]
            if not thislist then return end
            self.myth_nextupdatetick = self.myth_nextupdatetick + 1
            if not SGManager.tickwaiters[self.myth_nextupdatetick]then
                SGManager.tickwaiters[self.myth_nextupdatetick] = {}
            end
            local nextlist = SGManager.tickwaiters[self.myth_nextupdatetick]
            thislist[self] = nil
            nextlist[self] = true
        end
    end
end)

-- AI
AddGlobalClassPostConstruct("behaviourtree", "BT", function(self)
    local old_update = self.Update
    function self:Update(...)
        if self.inst:HasTag("myth_dingshenshu") then
            return
		end
		return old_update(self, ...)
    end
end)