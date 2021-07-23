
 L = rawget(GLOBAL, 'MK_MOD_LANGUAGE_SETTING')
local english = L == "ENGLISH" and true or false

GLOBAL.SKYHOUND_STRINGS = {
	eu = {
		names = {  -- 名字
			SKYHOUND = "Sky hound",  -- 哮天犬
			SKYHOUND_TOOTH = "Sky hound's tooth",  -- 天狗幼齿
			SKYHOUND_WARG = "Moon Sky hound",
		},
		descs = {  -- 普通角色描述
			SKYHOUND = {
				PET = "It's sky hound",  -- 宠物哮天犬
				WARG = "It's moon sky hound",  -- 月石哮天犬
			},
			SKYHOUND_TOOTH = "It's sky hound's tooth",  -- 天狗幼齿
		},
		action = {  -- 动作
			SKYHOUND_WHISTLE = "Whistle",  -- 吹口哨
			SKYHOUND_REBIRTH = "Rebirth",  -- 复活（哮天犬）
			SKYHOUND_SMELL = "Smell",
			SKYHOUND_FONDLE = "Pet",
			SKYHOUND_WAIT = "Wait",
			SKYHOUND_EVALUTE = "Evalate",
		},
		talks = {
			SKYHOUND_NO_FULLMOON = "Not yet",
			SKYHOUND_NO_FULLMOON2 = "Also for ready",
		},
	},
	zh = {
		names = {
			SKYHOUND = "哮天犬",
			SKYHOUND_WARG = "月石哮天犬",
			SKYHOUND_TOOTH = "天狗幼齿",
		},
		descs = {
			SKYHOUND = {
				PET = "这是哮天犬",
				WARG = "这是月石哮天犬",
			},
			SKYHOUND_TOOTH = "这是天狗幼齿",
		},
		action = {
			SKYHOUND_WHISTLE = "吹口哨",
			SKYHOUND_REBIRTH = "复活",
			SKYHOUND_SMELL = "嗅",
			SKYHOUND_FONDLE = "抚摸",
			SKYHOUND_WAIT = "等待",
			SKYHOUND_EVALUTE = "进化",
		},
		talks = {
			SKYHOUND_NO_FULLMOON = "还不是个时候",
			SKYHOUND_NO_FULLMOON2 = "还为就绪",
		},
	},
}

GLOBAL.SKYHOUND_SPEECH = english and GLOBAL.SKYHOUND_STRINGS.eu or GLOBAL.SKYHOUND_STRINGS.zh
local lang = GLOBAL.SKYHOUND_SPEECH
local names = STRINGS.NAMES
local descs = STRINGS.CHARACTERS.GENERIC.DESCRIBE
names.SKYHOUND = lang.names.SKYHOUND
names.SKYHOUND_WARG = lang.names.SKYHOUND_WARG
names.SKYHOUND_TOOTH = lang.names.SKYHOUND_TOOTH
descs.SKYHOUND = lang.descs.SKYHOUND.PET
descs.SKYHOUND_WARG = lang.descs.SKYHOUND.WARG
descs.SKYHOUND_TOOTH = lang.descs.SKYHOUND_TOOTH
	
local SKYHOUND_VALUE = TUNING.SKYHOUND_VALUE

local function spawn_skyhound(inst)
	if inst.components.skyhoundleash then
		inst.components.skyhoundleash:SpawnAround()
	end
end
AddModRPCHandler("skyhound", "spawn_skyhound", spawn_skyhound)

local function wait_skyhound(inst)
	if not inst:HasTag("playerghost")
	and inst.components.skyhoundleash then
		local pet = inst.components.skyhoundleash:GetPet()
		if pet then
			if not pet:HasTag("skyhound_wait") then
				inst.components.skyhoundleash:Wait()
			end
		end
	end
end
AddModRPCHandler("skyhound", "wait_skyhound", wait_skyhound)



local function OnSpawnPet(inst, pet)
end

local function OnDespawnPet(inst, pet)
end

local function get_skyhound(inst)
	inst:AddTag("skyhound_master")

	if not TheWorld.ismastersim then
		return inst
	end
	inst:AddComponent("skyhoundleash")
    inst.components.skyhoundleash.onspawnfn = OnSpawnPet
	inst.components.skyhoundleash.ondespawnfn = OnDespawnPet
	
	inst:DoTaskInTime(0.1,function() --避免有些人以前死了狗。。没了
		if not inst.components.skyhoundleash.pet then
			local pt = inst:GetPosition()
			inst.components.skyhoundleash:SpawnPetAt(pt.x, pt.y, pt.z, true)
		end
	end)
end

AddPrefabPostInit("yangjian", get_skyhound)

local function moonrocknugget_fix(inst)
	inst:AddTag("skyhound_evalute_item")
	if not TheWorld.ismastersim then
		return inst
	end
	inst:AddComponent("skyhoundevaluteitem")
end
AddPrefabPostInit("moonrocknugget", moonrocknugget_fix)

local function resurrectionstone_fix(inst)
	inst:AddTag("skyhound_touchstone")
end
AddPrefabPostInit("resurrectionstone", resurrectionstone_fix)


local skyhound_whistle = Action()  -- 吹口哨
skyhound_whistle.id = "SKYHOUND_WHISTLE"
skyhound_whistle.str = lang.action.SKYHOUND_WHISTLE
skyhound_whistle.fn = function(act)
	local doer = act.doer
	if doer and doer.components.skyhoundleash
	and doer.components.skyhoundleash:GetPet() then
		doer.components.skyhoundleash:Call()
		return true
	end
end
AddAction(skyhound_whistle)

local function whistle_test(inst, doer, actions, right)
	--if right and (inst == ThePlayer or TheWorld.ismastersim) then
	if right and doer:HasTag("skyhound_master") 
		and not inst:HasTag("playerghost")
		and inst.replica.inventory ~= nil 
		and inst.replica.inventory:GetActiveItem() == nil 
		and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) == nil
		and not (inst.replica.rider ~= nil 
		and inst.replica.rider:IsRiding()) then
			table.insert(actions, ACTIONS.SKYHOUND_WHISTLE)
	end
end
AddComponentAction("SCENE", "skyhoundleash", whistle_test)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.SKYHOUND_WHISTLE, "whistle_skyhound"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.SKYHOUND_WHISTLE, "whistle_skyhound"))

local function OnTimeout(inst)
    inst._task = nil
    if inst.AnimState:IsCurrentAnimation("resurrect") or
        inst.AnimState:IsCurrentAnimation("idle_broken") then
        inst.AnimState:PlayAnimation("repair")
        inst.AnimState:PushAnimation("idle_activate", false)
        inst.SoundEmitter:PlaySound("dontstarve/common/resurrectionstone_activate")
        inst._enablelights:set(true)
    end
end

local function OnHaunt(target)
	local TIMEOUT = 10
	if target._task == nil
	and target.AnimState:IsCurrentAnimation("idle_activate") then
        target.AnimState:PlayAnimation("resurrect")
        target.AnimState:PushAnimation("idle_broken", false)
        target.SoundEmitter:PlaySound("dontstarve/common/resurrectionstone_break")
        target._enablelights:set(false)
        target._task = target:DoTaskInTime(TIMEOUT, OnTimeout)
    end
end

local function OnActivateResurrection(target, doer)
	if target._task ~= nil then
	    target._task:Cancel()
	    target._task = nil
	end
	TheWorld:PushEvent("ms_sendlightningstrike", target:GetPosition())
	target.SoundEmitter:PlaySound("dontstarve/common/resurrectionstone_break")
	target.components.lootdropper:SetLoot({"skyhound_tooth"})
	target.components.lootdropper:DropLoot()
	target.components.cooldown:StartCharging()
	doer:PushEvent("usedtouchstone", target)
end


local skyhound_smell = Action({priority=10})
skyhound_smell.id = "SKYHOUND_SMELL"
skyhound_smell.str = lang.action.SKYHOUND_SMELL
skyhound_smell.fn = function(act)
	local doer = act.doer
	local target = act.target
	local invobject = act.invobject
	if doer and target and invobject
	and invobject.components.inventoryitem
	and not invobject.components.inventoryitem.canbepickedalive 
	and target.components.inventory
	and not target.components.inventory:IsFull() then
		if target.components.skyhoundpet then
			target.components.skyhoundpet:SetItemString(invobject.prefab)
		end
		target:AddTag("skyhound_pick")
		target:PushEvent("skyhound_pick")
		return true
	end
end
AddAction(skyhound_smell)

local function smell_test(inst, doer, target, actions, right)
	--if right and (doer == ThePlayer or TheWorld.ismastersim)
	if right and doer:HasTag("skyhound_master")
	and target:HasTag("skyhound")
	and not target.replica.inventory:IsFull() then
		table.insert(actions, ACTIONS.SKYHOUND_SMELL)
	end
end
AddComponentAction("USEITEM", "inventoryitem", smell_test)
AddComponentAction("USEITEM", "edible", smell_test)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.SKYHOUND_SMELL, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.SKYHOUND_SMELL, "give"))

local skyhound_fondle = Action()
skyhound_fondle.id = "SKYHOUND_FONDLE"
skyhound_fondle.str = lang.action.SKYHOUND_FONDLE
skyhound_fondle.fn = function(act)
	local doer = act.doer
	local target = act.target
	if doer and target and doer:HasTag("skyhound_master")
	and doer.components.skyhoundleash
	and doer.components.skyhoundleash:GetPet() == target
	and target:HasTag("skyhound")
	and target.components.inventory then
		target:PushEvent("critter_on_pet", {petter = doer})
		return true
	end
end
AddAction(skyhound_fondle)

local skyhound_hunt = Action()  -- 狩猎兔子hunt
skyhound_hunt.id = "SKYHOUND_HUNT"
skyhound_hunt.str = "SKYHOUND_HUNT"
skyhound_hunt.fn = function(act)
	if act.doer and act.target then
		local loot = SpawnPrefab(act.target.prefab)
		if act.doer.components.inventory then
			act.doer.components.inventory:GiveItem(loot)
		end
		act.target:Remove()
		act.doer:AddTag("skyhound_no_hunt")
		act.doer:AddTag("skyhound_handin")
		if act.doer.components.timer then
			act.doer.components.timer:StartTimer("skyhound_no_hunt", TUNING.SKYHOUND_VALUE.time_no_hunt)
		end
		return true
	end
end
AddAction(skyhound_hunt)

local skyhound_wait = Action({instant=true})
skyhound_wait.id = "SKYHOUND_WAIT"
skyhound_wait.str = lang.action.SKYHOUND_WAIT
skyhound_wait.fn = function(act)
	local doer = act.doer
	local target = act.target
	if doer.components.skyhoundleash then
		local pet = doer.components.skyhoundleash:GetPet()
		if pet == target and not target:HasTag("skyhound_wait") then
			doer.components.skyhoundleash:Wait()
			return true
		end
	end
end
AddAction(skyhound_wait)

local function fondle_wait_test(inst, doer, actions, right)
	if inst:HasTag("skyhound") and doer:HasTag("skyhound_master") then
		if right and not inst:HasTag("skyhound_wait") then
			if doer.replica.inventory
			and doer.replica.inventory:GetActiveItem() == nil 
			and doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) == nil
			and not (doer.replica.rider 
			and doer.replica.rider:IsRiding()) then
			table.insert(actions, ACTIONS.SKYHOUND_WAIT)
			end
		elseif inst:HasTag("skyhound_warg") then
			table.insert(actions, ACTIONS.SKYHOUND_FONDLE)
		end
	end
end
AddComponentAction("SCENE", "skyhoundpet", fondle_wait_test)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.SKYHOUND_FONDLE, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.SKYHOUND_FONDLE, "dolongaction"))

local skyhound_evalute = Action()
skyhound_evalute.id = "SKYHOUND_EVALUTE"
skyhound_evalute.str = lang.action.SKYHOUND_EVALUTE
skyhound_evalute.fn = function(act)
	local doer = act.doer
	local target = act.target
	local invobject = act.invobject
	if doer and target and invobject
	and invobject.components.inventoryitem then
		if target.can_morph and target.can_morph(target) then
			local stackable = invobject.components.stackable
			if stackable then
				if stackable.stacksize > 1 then
					stackable:SetStackSize(stackable.stacksize - 1)
				else
					invobject:Remove()
				end
			end
			if target.transition then
				target.transition(target)
			end
			return true
		else
			if doer.components.talker then
				local str = lang.talks.SKYHOUND_NO_FULLMOON
				if math.random() < 0.5 then
					str = lang.talks.SKYHOUND_NO_FULLMOON2
				end
				doer.components.talker:Say(str)
			end
			return true
		end
	end
end
AddAction(skyhound_evalute)

local function evalute_test(inst, doer, target, actions, right)
	--if not right and (doer == ThePlayer or TheWorld.ismastersim)
	if not right and doer:HasTag("skyhound_master")
	and target:HasTag("skyhound")
	and not target:HasTag("skyhound_warg") then
		table.insert(actions, ACTIONS.SKYHOUND_EVALUTE)
	end
end
AddComponentAction("USEITEM", "skyhoundevaluteitem", evalute_test)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.SKYHOUND_EVALUTE, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.SKYHOUND_EVALUTE, "give"))

local state = State{
	name = "whistle_skyhound",
	tags = { "doing", "playing" },

    onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("action_uniqueitem_pre")
        inst.AnimState:PushAnimation("whistle", false)
        inst.AnimState:Show("ARM_normal")
    end,

    timeline =
    {
        TimeEvent(20 * FRAMES, function(inst)
            inst:PerformBufferedAction()
			inst.SoundEmitter:PlaySound("Xiao/sfx/whistle")
        end),
    },

    events =
    {
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
        if inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
            inst.AnimState:Show("ARM_carry")
            inst.AnimState:Hide("ARM_normal")
        end
    end,
}
local state2 = State
    {
        name = "whistle_skyhound",
        tags = { "doing", "playing" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("action_uniqueitem_lag", false)

            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(2)
        end,

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
AddStategraphState("wilson", state)
AddStategraphState("wilson_client", state2)

-- 抚摸
local function crittertraits_fix(self)
	local old_OnPet = self.OnPet
	function self:OnPet(petter, ...)
		old_OnPet(self, petter, ...)
		self.inst:PushEvent("critter_on_pet", {petter = petter})
	end
end
AddComponentPostInit("crittertraits", crittertraits_fix)