
--quickpick
local function quickpick(sg)
    local old_pick = sg.actionhandlers[ACTIONS.PICK].deststate
    sg.actionhandlers[ACTIONS.PICK].deststate = function(inst, action)
        if action.target ~= nil and action.target.components.uppickable ~= nil then
			if inst.components.inventory:EquipHasTag("myth_ruyi") then
				return "dojostleaction"
			else
				return "doupaction"
			end
        end
        if inst:HasTag("pigsy") and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) == nil and inst.replica.hunger:GetCurrent() >= 50 then
            return action.target ~= nil
                and action.target.components.pickable ~= nil
                and (   (action.target.components.pickable.jostlepick and "dojostleaction") or
                    "doshortaction"  )
                or nil
        end
        return old_pick(inst, action)
    end
    local old_harvest = sg.actionhandlers[ACTIONS.HARVEST].deststate
    sg.actionhandlers[ACTIONS.HARVEST].deststate = function(inst, action)
        if inst:HasTag("pigsy") and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) == nil and inst.replica.hunger:GetCurrent() >= 50 then
			return "doshortaction"
		end
		return old_harvest(inst, action)
    end

    local old_interact = sg.actionhandlers[ACTIONS.INTERACT_WITH].deststate
    sg.actionhandlers[ACTIONS.INTERACT_WITH].deststate = function(inst, action)
        if inst:HasTag("pigsy") and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) == nil and inst.replica.hunger:GetCurrent() >= 50 then
			return "doshortaction"
		end
		return old_interact(inst, action)
    end
end

local function quickpick_client(sg)
    local old_pick = sg.actionhandlers[ACTIONS.PICK].deststate
    sg.actionhandlers[ACTIONS.PICK].deststate = function(inst, action)
        if action.target ~= nil and action.target:HasTag("uppick") then
            if action.target:HasTag("uppickable") then
				if inst.replica.inventory:EquipHasTag("myth_ruyi") then
					return "dojostleaction"
				else
					return "doupaction"
				end
            end
            return nil --防止无法采集桃树时却跳到原本的采集sg去
        end
        if inst:HasTag("pigsy") and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) == nil and inst.replica.hunger:GetCurrent() >= 50 then
            return (action.target:HasTag("jostlepick") and "dojostleaction")
                or "doshortaction"
        end
        return old_pick(inst, action)
    end
    local old_harvest = sg.actionhandlers[ACTIONS.HARVEST].deststate
    sg.actionhandlers[ACTIONS.HARVEST].deststate = function(inst, action)
        if inst:HasTag("pigsy") and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) == nil and inst.replica.hunger:GetCurrent() >= 50 then
			return "doshortaction"
		end
		return old_harvest(inst, action)
    end
end
AddStategraphPostInit("wilson", quickpick)
AddStategraphPostInit("wilson_client", quickpick_client)

--longbuild
AddStategraphState('wilson',
    State
    {
        name = "dopigsybuild",

        onenter = function(inst)
			inst.sg:GoToState("dolongaction", 1.5)
        end,
    }
)
local function longbuild(sg)
    local old_build = sg.actionhandlers[ACTIONS.BUILD].deststate
    sg.actionhandlers[ACTIONS.BUILD].deststate = function(inst, action)
        if inst:HasTag("pigsy") and not ( action.recipe and action.recipe:find("myth_flyskill")) then
			return "dopigsybuild"
		end
		return old_build(inst, action)
    end
end
--client不需要
AddStategraphPostInit("wilson", longbuild)

local function sleepbed(sg)
	sg.events['pigsyyawn'] = EventHandler('pigsyyawn', function(inst,data)
        if not (inst.components.health:IsDead() or
                inst.sg:HasStateTag("sleeping") or
                (inst.components.freezable ~= nil and inst.components.freezable:IsFrozen()) or
                (inst.components.pinnable ~= nil and inst.components.pinnable:IsStuck())) then
            inst.sg:GoToState("pigsyyawn", data)
        end	
	end)
end
AddStategraphPostInit("wilson", sleepbed)


local function DoYawnSound(inst)
    if inst.yawnsoundoverride ~= nil then
        inst.SoundEmitter:PlaySound(inst.yawnsoundoverride)
    elseif not inst:HasTag("mime") then
        inst.SoundEmitter:PlaySound((inst.talker_path_override or "dontstarve/characters/")..(inst.soundsname or inst.prefab).."/yawn")
    end
end

local function SetSleeperSleepState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:AddImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:IgnoreAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Disable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(false)
        inst.components.playercontroller:Enable(false)
    end
    inst:OnSleepIn()
    inst.components.inventory:Hide()
    inst:PushEvent("ms_closepopups")
    inst:ShowActions(false)
end

local function SetSleeperAwakeState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:RemoveImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:StopIgnoringAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Enable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(true)
        inst.components.playercontroller:Enable(true)
    end
    inst:OnWakeUp()
    inst.components.inventory:Show()
    inst:ShowActions(true)
end

AddStategraphState('wilson',
    State{
        name = "pigsy_wakeup",
        tags = { "busy", "waking", "nomorph", "nodangle","nopredict" },
        onenter = function(inst)
            if inst.components.playercontroller ~= nil then
                inst.components.playercontroller:Enable(false)
            end
            if inst.AnimState:IsCurrentAnimation("bedroll") or
                inst.AnimState:IsCurrentAnimation("bedroll_sleep_loop") then
                inst.AnimState:PlayAnimation("bedroll_wakeup")
            elseif not (inst.AnimState:IsCurrentAnimation("bedroll_wakeup") or
                        inst.AnimState:IsCurrentAnimation("wakeup")) then
                inst.AnimState:PlayAnimation("wakeup")
            end
        end,
        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
        onexit = function(inst)
            if inst.components.playercontroller ~= nil then
                inst.components.playercontroller:Enable(true)
            end
        end
    }
)

local IsFlying = function(inst) return inst and inst.components.mk_flyer and inst.components.mk_flyer:IsFlying()end

AddStategraphState('wilson', --制作之后触发这个sg
    State{
        name = "pigsyyawn",   
        tags = { "busy", "yawn", "pausepredict" },

        onenter = function(inst, data)
            inst.components.locomotor:Stop()
            if inst.components.playercontroller ~= nil then
                inst.components.playercontroller:RemotePausePrediction()
            end
            inst.AnimState:PlayAnimation("yawn") --先打哈欠
			inst.AnimState:PushAnimation("insomniac_dozy") --然后在慢慢躺下去
			inst.sg:SetTimeout(3.3)
			if not IsFlying(inst) then
				local fx = SpawnPrefab("pigsy_sleepbed_fx") --脚下生成一个特效
				inst:AddChild(fx)
				inst.sleepfx = fx
			end
        end,

        timeline =
        {
            TimeEvent(15 * FRAMES, function(inst)
                DoYawnSound(inst)
            end),
            TimeEvent(2, function(inst)
				SetSleeperSleepState(inst)
            end),
            TimeEvent(3.2, function(inst)
				inst.sg:AddStateTag("gotosleep")
            end),
        },
        ontimeout = function(inst)
            if inst.sg:HasStateTag("gotosleep") then
			   inst.sg.statemem.pigsleep = true
               inst.sg:GoToState("pigsyyawn_loop", { duration = inst.sg.statemem.parrytime, pauseframes = 30, talktask = talktask })
            else
				inst.AnimState:PlayAnimation("wakeup")
                inst.sg:GoToState("idle", true)
				SetSleeperAwakeState(inst)
            end
        end,
        onexit = function(inst)
			if not inst.sg.statemem.pigsleep then
				if inst.sleepfx  ~= nil then
					inst.sleepfx:Remove()
					inst.sleepfx = nil
				end
			end
        end,
    }
)

local function onsleeptick(sleeper)
    local isstarving = false

    if sleeper.components.hunger ~= nil then
        sleeper.components.hunger:DoDelta(TUNING.SLEEP_HUNGER_PER_TICK*1.5, true, true)
        isstarving = sleeper.components.hunger:IsStarving()
    end

    if sleeper.components.sanity ~= nil and sleeper.components.sanity:GetPercentWithPenalty() < 1 then
        sleeper.components.sanity:DoDelta(TUNING.SLEEP_SANITY_PER_TICK*1.5, true)
    end

    if not isstarving and sleeper.components.health ~= nil then
        sleeper.components.health:DoDelta(TUNING.SLEEP_HEALTH_PER_TICK*1.5, true, "bedroll", true)
    end

    if sleeper.components.temperature ~= nil then
        if sleeper.components.temperature:GetCurrent() < TUNING.SLEEP_TARGET_TEMP_BEDROLL_FURRY then
            sleeper.components.temperature:SetTemperature(sleeper.components.temperature:GetCurrent() + TUNING.SLEEP_TEMP_PER_TICK)
        elseif sleeper.components.temperature:GetCurrent() > TUNING.SLEEP_TARGET_TEMP_BEDROLL_FURRY * 1.5 then
            sleeper.components.temperature:SetTemperature(sleeper.components.temperature:GetCurrent() - TUNING.SLEEP_TEMP_PER_TICK)
        end
    end

    if isstarving  and not sleeper.components.health:IsDead() then
        sleeper.sg:GoToState("wakeup")
    end
end

AddStategraphState('wilson',
    State{
        name = "pigsyyawn_loop",
        tags = { "notalking", "nomorph","busy"},

        onenter = function(inst, data)
            inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("sleep_loop",true) --播放持续睡觉的sg
			SetSleeperSleepState(inst)
			if inst.pigsleeptask ~= nil then
				inst.pigsleeptask:Cancel()
            end
			if inst.sleepsound ~= nil then
				inst.sleepsound:Cancel()
            end

            inst.pigsleeptask = inst:DoPeriodicTask(TUNING.SLEEP_TICK_PERIOD, onsleeptick) --回血扣饥饿
            
            inst.sleepsound = inst:DoPeriodicTask(2, function()
                inst.SoundEmitter:PlaySound("grotto/creatures/mole_bat/sleep")
            end) 
        end,
        timeline =
        {
            TimeEvent(0.1, function(inst)
				inst.sg:RemoveStateTag("busy")--0.1秒之后可控制
                if inst.components.playercontroller ~= nil then
                    inst.components.playercontroller:Enable(true)
                end
            end),
        },
        events =
        {
            EventHandler("firedamage", function(inst)
                inst.sg:GoToState("wakeup")
            end),
            EventHandler("animover", function(inst)

            end),
        },
        onexit = function(inst)
			if inst.sleepfx  ~= nil then
				inst.sleepfx:Remove()
				inst.sleepfx = nil
            end
			if inst.sleepsound  ~= nil then
				inst.sleepsound:Cancel()
				inst.sleepsound = nil
            end
			if inst.pigsleeptask ~= nil then
				inst.pigsleeptask:Cancel()
			end
            SetSleeperAwakeState(inst)
        end,
    }	
)
--招架
local function IsWeaponEquipped(inst, weapon)
    return weapon ~= nil
        and weapon.components.equippable ~= nil
        and weapon.components.equippable:IsEquipped()
        and weapon.components.inventoryitem ~= nil
        and weapon.components.inventoryitem:IsHeldBy(inst)
end

local function DoTalkSound(inst)
    if inst.talksoundoverride ~= nil then
        inst.SoundEmitter:PlaySound(inst.talksoundoverride, "talk")
        return true
    elseif not inst:HasTag("mime") then
        inst.SoundEmitter:PlaySound((inst.talker_path_override or "dontstarve/characters/")..(inst.soundsname or inst.prefab).."/talk_LP", "talk")
        return true
    end
end

local function StopTalkSound(inst, instant)
    if not instant and inst.endtalksound ~= nil and inst.SoundEmitter:PlayingSound("talk") then
        inst.SoundEmitter:PlaySound(inst.endtalksound)
    end
    inst.SoundEmitter:KillSound("talk")
end

local function GetUnequipState(inst, data)
    return (inst:HasTag("wereplayer") and "item_in")
        or (data.eslot ~= EQUIPSLOTS.HANDS and "item_hat")
        or (not data.slip and "item_in")
        or (data.item ~= nil and data.item:IsValid() and "tool_slip")
        or "toolbroke"
        , data.item
end

local function oncombatparry(inst, data)
    inst.sg:AddStateTag("parrying")
        if data ~= nil then
            if data.direction ~= nil then
                inst.Transform:SetRotation(data.direction)
            end
            inst.sg.statemem.parrytime = data.duration
            inst.sg.statemem.item = data.weapon
            if data.weapon ~= nil then
                inst.components.combat.redirectdamagefn = function(inst, attacker, damage, weapon, stimuli)
                    return IsWeaponEquipped(inst, data.weapon)
                    and data.weapon.components.pigsy_rake ~= nil
					and data.weapon.components.pigsy_rake:TryParry(inst, attacker, damage, weapon, stimuli)
                    and data.weapon
                     or nil
            end
        end
    end
end


AddStategraphState('wilson_client',
    State{
    name = "pigsy_parry_pre",
    tags = { "preparrying", "busy" },

    onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("parry_pre")
        inst.AnimState:PushAnimation("parry_loop", true)

        inst:PerformPreviewBufferedAction()
        inst.sg:SetTimeout(2)
    end,

    onupdate = function(inst)
        if inst:HasTag("busy") then
            if inst.entity:FlattenMovementPrediction() then
                inst.sg:GoToState("idle", "noanim")
            end
        elseif inst.bufferedaction == nil then
            inst.AnimState:PlayAnimation("parry_pst")
            inst.sg:GoToState("idle")
        end
    end,

    ontimeout = function(inst)
        inst:ClearBufferedAction()
        inst.AnimState:PlayAnimation("parry_pst")
        inst.sg:GoToState("idle", true)
    end,
    })

AddStategraphState('wilson',
    State{
        name = "pigsy_parry_pre",
        tags = { "preparrying", "busy", "nomorph" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("parry_pre")
            inst.AnimState:PushAnimation("parry_loop", true)
            inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())

            inst:ListenForEvent("pigsy_combat_parry", oncombatparry)
			local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) 
			if equip ~= nil and equip.components.pigsy_rake ~= nil then
				local direction = inst.Transform:GetRotation()
				inst:PushEvent("pigsy_combat_parry",{duration = 3, weapon = equip ,direction = direction})
			end
            inst:PerformBufferedAction()
            inst:RemoveEventCallback("pigsy_combat_parry", oncombatparry)
        end,

        events =
        {
            EventHandler("ontalk", function(inst)
                if inst.sg.statemem.talktask ~= nil then
                    inst.sg.statemem.talktask:Cancel()
                    inst.sg.statemem.talktask = nil
                    StopTalkSound(inst, true)
                end
                if DoTalkSound(inst) then
                    inst.sg.statemem.talktask =
                        inst:DoTaskInTime(1.5 + math.random() * .5,
                            function()
                                inst.sg.statemem.talktask = nil
                                StopTalkSound(inst)
                            end)
                end
            end),
            EventHandler("donetalking", function(inst)
                if inst.sg.statemem.talktalk ~= nil then
                    inst.sg.statemem.talktask:Cancel()
                    inst.sg.statemem.talktask = nil
                    StopTalkSound(inst)
                end
            end),
            EventHandler("unequip", function(inst, data)
                inst.sg:GoToState(GetUnequipState(inst, data))
            end),
        },

        ontimeout = function(inst)
            if inst.sg:HasStateTag("parrying") then
                inst.sg.statemem.parrying = true
                local talktask = inst.sg.statemem.talktask
                inst.sg.statemem.talktask = nil
                inst.sg:GoToState("pigsy_parry_idle", { duration = inst.sg.statemem.parrytime, pauseframes = 30, talktask = talktask })
            else
                inst.AnimState:PlayAnimation("parry_pst")
                inst.sg:GoToState("idle", true)
            end
        end,

        onexit = function(inst)
            if inst.sg.statemem.talktask ~= nil then
                inst.sg.statemem.talktask:Cancel()
                inst.sg.statemem.talktask = nil
                StopTalkSound(inst)
            end
            if not inst.sg.statemem.parrying then
                inst.components.combat.redirectdamagefn = nil
            end
        end,
    }
)

AddStategraphState('wilson',
    State{
        name = "pigsy_parry_idle",
        tags = { "notalking", "parrying", "nomorph" },

        onenter = function(inst, data)
            inst.components.locomotor:Stop()

            if data ~= nil and data.duration ~= nil then
                if data.duration > 0 then
                    inst.sg.statemem.task = inst:DoTaskInTime(data.duration, function(inst)
                        inst.sg.statemem.task = nil
                        inst.AnimState:PlayAnimation("parry_pst")
                        inst.sg:GoToState("idle", true)
                    end)
                else
                    inst.AnimState:PlayAnimation("parry_pst")
                    inst.sg:GoToState("idle", true)
                    return
                end
            end

            if not inst.AnimState:IsCurrentAnimation("parry_loop") then
                inst.AnimState:PushAnimation("parry_loop", true)
            end

            inst.sg.statemem.talktask = data ~= nil and data.talktask or nil

            if data ~= nil and (data.pauseframes or 0) > 0 then
                inst.sg:AddStateTag("busy")
                inst.sg:AddStateTag("pausepredict")

                if inst.components.playercontroller ~= nil then
                    inst.components.playercontroller:RemotePausePrediction(data.pauseframes <= 7 and data.pauseframes or nil)
                end
                inst.sg:SetTimeout(data.pauseframes * FRAMES)
            else
                inst.sg:AddStateTag("idle")
            end
        end,

        ontimeout = function(inst)
            inst.sg:RemoveStateTag("busy")
            inst.sg:RemoveStateTag("pausepredict")
            inst.sg:AddStateTag("idle")
        end,

        events =
        {
            EventHandler("ontalk", function(inst)
                if inst.sg.statemem.talktask ~= nil then
                    inst.sg.statemem.talktask:Cancel()
                    inst.sg.statemem.talktask = nil
                    StopTalkSound(inst, true)
                end
                if DoTalkSound(inst) then
                    inst.sg.statemem.talktask =
                        inst:DoTaskInTime(1.5 + math.random() * .5,
                            function()
                                inst.sg.statemem.talktask = nil
                                StopTalkSound(inst)
                            end)
                end
            end),
            EventHandler("donetalking", function(inst)
                if inst.sg.statemem.talktalk ~= nil then
                    inst.sg.statemem.talktask:Cancel()
                    inst.sg.statemem.talktask = nil
                    StopTalkSound(inst)
                end
            end),
            EventHandler("unequip", function(inst, data)
                if not inst.sg:HasStateTag("idle") then
                    inst.sg:GoToState(GetUnequipState(inst, data))
                end
            end),
        },

        onexit = function(inst)
            if inst.sg.statemem.task ~= nil then
                inst.sg.statemem.task:Cancel()
                inst.sg.statemem.task = nil
            end
            if inst.sg.statemem.talktask ~= nil then
                inst.sg.statemem.talktask:Cancel()
                inst.sg.statemem.talktask = nil
                StopTalkSound(inst)
            end
            if not inst.sg.statemem.parrying then
                inst.components.combat.redirectdamagefn = nil
            end
        end,
    }
)

--猪猪房子不要害怕我
AddPrefabPostInit("pighouse", function(inst)
	if inst.components.playerprox then	
		local old_onnear = inst.components.playerprox.onnear
		inst.components.playerprox.onnear = function(house,player)
			if player and player.prefab == "pigsy" then
				return
			end
			if  old_onnear ~= nil then
				old_onnear(house,player)
			end
		end
	end
end)

if TUNING.FARM_PLANT_DRINK_LOW ~= nil then
	AddComponentPostInit("farmtiller", function(self)
		local old_Till = self.Till
		function self:Till(pt, doer,...)
			if self.inst.prefab == "pigsy_rake" then
				local pt1 = Point( TheWorld.Map:GetTileCenterPoint(pt:Get()) )
				local p2 = pt1 - pt
				local p3 = Point( (p2.x + 0.5) - (p2.x + 0.5)%1.333, 0, (p2.z + 0.5) - (p2.z + 0.5)%1.333 )
				pt = pt1 - p3	
			end
			return old_Till(self,pt, doer,...)
		end
	end)
end

--猪猪加油一直吃
AddPrefabPostInit("pigman", function(inst)
	if inst.components.trader then	
		local old_test = inst.components.trader.test
		inst.components.trader.test = function(inst,item, giver)
			if giver and giver.prefab == "pigsy" and inst.components.eater:CanEat(item) and item.components.edible.foodtype == FOODTYPE.VEGGIE then
				return true
			elseif old_test ~= nil then
				return old_test(inst,item, giver)
			end
		end
		local old_onaccept = inst.components.trader.onaccept
		inst.components.trader.onaccept = function(inst, giver, item)
			if giver and giver.prefab == "pigsy" and item.components.edible ~= nil and  item.components.edible.foodtype == FOODTYPE.VEGGIE then
				if giver.components.leader ~= nil and not (inst:HasTag("guard") or giver:HasTag("monster") or giver:HasTag("merm")) then
					if giver.components.minigame_participator == nil then
						giver:PushEvent("makefriend")
						giver.components.leader:AddFollower(inst)
					end
					inst.components.follower:AddLoyaltyTime(item.components.edible:GetHunger() * TUNING.PIG_LOYALTY_PER_HUNGER * 0.5)
					inst.components.follower.maxfollowtime = TUNING.PIG_LOYALTY_MAXTIME * 0.5
				end
			elseif old_onaccept ~= nil then
				return old_onaccept(inst, giver, item)
			end
		end
	end
end)


local function launchitem(item, angle)
    local speed = math.random() * 4 + 2
    angle = (angle + math.random() * 60 - 30) * DEGREES
    item.Physics:SetVel(speed * math.cos(angle), math.random() * 2 + 8, speed * math.sin(angle))
end

local function ontradeforgold(inst, item, giver)
    local x, y, z = inst.Transform:GetWorldPosition()
    y = 4.5

    local angle
    if giver ~= nil and giver:IsValid() then
        angle = 180 - giver:GetAngleToPoint(x, 0, z)
    else
        local down = TheCamera:GetDownVec()
        angle = math.atan2(down.z, down.x) / DEGREES
        giver = nil
    end

    for k = 1, item.components.tradable.goldvalue do
        local nug = SpawnPrefab("goldnugget")
        nug.Transform:SetPosition(x, y, z)
        launchitem(nug, angle)
    end
end

--猪王再来一份
AddPrefabPostInit("pigking", function(inst)
	if inst.components.trader then	
		local old_onaccept = inst.components.trader.onaccept
		inst.components.trader.onaccept = function(inst, giver, item)
			old_onaccept(inst, giver, item)
			if giver and giver.prefab == "pigsy" and math.random() < 0.2 and item.components.tradable ~=  nil and item.components.tradable.goldvalue > 0  then
				inst:DoTaskInTime(2 / 3, ontradeforgold, item, giver)
			end
		end
	end
end)

--不掉sanity
AddComponentPostInit("edible", function(self)
	local old_GetSanity = self.GetSanity  --脑残
	function self:GetSanity(eater,...)
		local old = old_GetSanity(self,eater,...)
		if eater and eater.prefab == "pigsy" then  --八戒
			return (old > 0 and old or 0)
		else
			return old
		end
	end
end)

--照料植物可以恢复sanity
AddComponentPostInit("farmplanttendable", function(self)
	local old_TendTo= self.TendTo  --脑残
    function self:TendTo(doer,...)
		local old = old_TendTo(self,doer,...)
		if old and doer and doer.prefab == "pigsy" then  --八戒
			doer.components.sanity:DoDelta(5)
        end
        return old
	end
end)

AddPrefabPostInit("petals_evil", function(inst)
	if inst.components.edible and inst.components.edible.oneaten ~= nil then
		local old = inst.components.edible.oneaten
		inst.components.edible.oneaten = function(inst, eater)
			if eater and eater.prefab == "pigsy" then
				return
			end
			return old(inst, eater)
		end
	end
end)

require "prefabs/veggies"
if GLOBAL.VEGGIES then
	for veggiename,veggiedata in pairs(GLOBAL.VEGGIES) do
	AddPrefabPostInit(veggiename.."_oversized", function(inst)
		if inst.components.workable and inst.components.workable.onfinish ~= nil then
			local old = inst.components.workable.onfinish
			inst.components.workable.onfinish = function(inst, worker)
				if worker and worker.prefab == "pigsy" then
					if inst.components.lootdropper and math.random() < 0.75 then
						inst.components.lootdropper:SpawnLootPrefab(math.random() < 0.75 and veggiename or veggiename.."_seeds" )
					end
				end
				return old(inst, worker)
			end
		end
	end)
	end
end

AddComponentPostInit("edible", function(self)
	local old_GetHunger = self.GetHunger
	function self:GetHunger(eater,...)
		local old = old_GetHunger(self,eater,...)
		if eater and (eater.prefab == "pigsy" or eater.prefab == "monkey_king") and self.foodtype == FOODTYPE.MEAT then 
			return old *(self.inst:HasTag("preparedfood") and 0.8 or 0.2)	
		else
			return old
		end
	end
end)


AddComponentPostInit("farmplantstress", function(self)
	local old_GetStressDescription = self.GetStressDescription
	function self:GetStressDescription(viewer,...)
		if viewer and viewer.prefab == "pigsy"then 
			if self.inst == viewer then
				return
			elseif not CanEntitySeeTarget(viewer, self.inst) then
				return GetString(viewer, "DESCRIBE_TOODARK")
			elseif self.inst.components.burnable ~= nil and self.inst.components.burnable:IsSmoldering() then
				return GetString(viewer, "DESCRIBE_SMOLDERING")
			end
	
			local stressors = {}
			for stressor, testfn in pairs(self.stressors_testfns) do
				if testfn(self.inst, self.stressors[stressor], false) then
					table.insert(stressors, stressor)
				end
			end

			if #stressors == 0 then
				return GetString(viewer, "DESCRIBE_PLANTHAPPY")
			elseif viewer:HasTag("pigsy") or (viewer.replica.inventory and viewer.replica.inventory:EquipHasTag("detailedplanthappiness")) then
				local stressor = shuffleArray(stressors)[1]
				return GetString(viewer, "DESCRIBE_PLANTSTRESSOR"..string.upper(stressor))
			else
				if #stressors >= 5 then
					return GetString(viewer, "DESCRIBE_PLANTVERYSTRESSED")
				else --if #stressors <= 4 then
					return GetString(viewer, "DESCRIBE_PLANTSTRESSED")
				end
			end	
		else
			return old_GetStressDescription(self,viewer,...)
		end
	end
end)

AddComponentAction("SCENE", "plantresearchable" , function(inst, doer, actions, right)
    if not right and doer:HasTag("pigsy")and (inst:HasTag("farmplantstress") or inst:HasTag("weedplantstress")) then
        table.insert(actions, ACTIONS.ASSESSPLANTHAPPINESS)
    end
end)
AddComponentAction("SCENE", "fertilizerresearchable" , function(inst, doer, actions, right)
    if not right and doer:HasTag("pigsy")and (inst:HasTag("farmplantstress") or inst:HasTag("weedplantstress")) then
        PlantRegistryResearch(inst, doer, actions)
    end
end)

AddComponentAction("INVENTORY", "plantresearchable" , function(inst, doer, actions, right)
    if not right and doer:HasTag("pigsy")and (inst:HasTag("farmplantstress") or inst:HasTag("weedplantstress")) then
        table.insert(actions, ACTIONS.ASSESSPLANTHAPPINESS)
    end
end)
AddComponentAction("INVENTORY", "fertilizerresearchable" , function(inst, doer, actions, right)
    if not right and doer:HasTag("pigsy")and (inst:HasTag("farmplantstress") or inst:HasTag("weedplantstress")) then
        PlantRegistryResearch(inst, doer, actions)
    end
end)

AddBrainPostInit("pigbrain", function(self)
	--谢谢咸鱼鱼鱼鱼鱼鱼
	for k, v in ipairs(self.bt.root.children) do
		if v and v.name == "Parallel" and v.children  ~= nil and v.children[1] ~= nil and  v.children[1].name ~= nil then
			if v.children[1].name == "IsDay" then
				if v.children[2] ~= nil and v.children[2].children ~= nil and v.children[2].children[6] ~= nil and
					v.children[2].children[6].children ~= nil and v.children[2].children[6].children[1] ~= nil and
					v.children[2].children[6].children[1].name ~= nil and v.children[2].children[6].children[1].name == "RunAway" then
				local hunternotags = v.children[2].children[6].children[1].hunternotags
				if hunternotags ~= nil and type(hunternotags) == "table" then
					table.insert(hunternotags, "pigsy")
				else
					v.children[2].children[6].children[1].hunternotags = {"pigsy"}
				end	
				end
			end
			if v.children[1].name == "IsNight" then
				if v.children[2] ~= nil and v.children[2].children ~= nil and v.children[2].children[3] ~= nil and 
					v.children[2].children[3].name == "RunAway" then
					local hunternotags = v.children[2].children[3].hunternotags
					if hunternotags ~= nil and type(hunternotags) == "table" then
						table.insert(hunternotags, "pigsy")
					else
						v.children[2].children[3].hunternotags = {"pigsy"}
					end	
				end
			end
		end
	end
end)