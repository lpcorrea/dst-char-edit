require("stategraphs/commonstates")
require("stategraphs/SGcritter_common")

local actionhandlers = {
	ActionHandler(ACTIONS.PICKUP, "do_action"),
	ActionHandler(ACTIONS.SKYHOUND_HUNT, "do_action"),
	ActionHandler(ACTIONS.EAT, "eat"),
	--ActionHandler(ACTIONS.SKYHOUND_BITE, "bite"),
}

local events = {
	EventHandler("oneat", function(inst) 
		if not inst.sg:HasStateTag("busy") then
			inst.sg:GoToState("eat")
		end
	end),
	EventHandler("skyhound_wait", function(inst)
		if not inst.sg:HasStateTag("busy") then
			inst.sg:GoToState("do_action2")
		end
	end),
	EventHandler("skyhound_pick", function(inst)
		if not inst.sg:HasStateTag("busy") then
			inst.sg:GoToState("do_action3")
		end
	end),
	SGCritterEvents.OnAvoidCombat(),
	SGCritterEvents.OnTraitChanged(),

	CommonHandlers.OnLocomote(false,true),
	CommonHandlers.OnSleepEx(),
    CommonHandlers.OnWakeEx(),
    CommonHandlers.OnAttacked(),
    CommonHandlers.OnHop(),
    CommonHandlers.OnSink(),
    CommonHandlers.OnDeath(),
}

local function idleonanimover(inst)
    if inst.AnimState:AnimDone() then
        inst.sg:GoToState("idle")
    end
end

local states = {
	State{
		name = "do_action",
		tags = {"busy"},
		onenter = function(inst, pushanim)
			if inst.components.locomotor then
				inst.components.locomotor:StopMoving()
			end
			inst.AnimState:PlayAnimation("eat_pre")
            -- inst.AnimState:PushAnimation("eat_loop", false)
            inst.AnimState:PushAnimation("eat_pst", false)
		end,
		timeline =
        {
            TimeEvent(5 * FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
        },
		events = {
			EventHandler("animqueueover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("idle")
				end
			end),
		}
	},
	
	State{
		name = "bite",
        tags = { "attack", "busy" },
        onenter = function(inst, target)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("eat_pre")
            -- inst.AnimState:PushAnimation("eat_loop", false)
            -- inst.AnimState:PushAnimation("eat_pst", false)
        end,

        timeline = {
			TimeEvent(13 * FRAMES, function(inst)
				inst:PerformBufferedAction()
                inst.sg:RemoveStateTag("attack")
                inst.sg:RemoveStateTag("busy")
       			inst:AddTag("skyhound_no_bite")
       			inst.components.timer:StartTimer("skyhound_no_bite", TUNING.SKYHOUND_VALUE.time_no_bite)
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
	},

	State{
		name = "transition",
		tags = {"busy"},
		onenter = function(inst)
			inst.Physics:Stop()
			inst.skyhound_light = SpawnPrefab("chesterlight")
            inst.skyhound_light.Transform:SetPosition(inst:GetPosition():Get())
            inst.skyhound_light:TurnOn()

            -- inst.AnimState:PlayAnimation("eat_pst")
            -- inst.AnimState:PushAnimation("eat_loop", false)
            inst.AnimState:PlayAnimation("emote_pet")
            inst.AnimState:PushAnimation("emote_pet")
			local fx = SpawnPrefab("skyhound_fx")
			inst:AddChild(fx)
			fx.Transform:SetPosition(0, 0, 0)
		end,
		timeline = {
			TimeEvent(10*FRAMES, function(inst)
	            inst.SoundEmitter:PlaySound("dontstarve/sanity/transform/two")
			end),
			TimeEvent(20*FRAMES, function(inst)
	            if inst.components.spawnfader then
	            	inst.components.spawnfader:FadeIn()
	            end
			end),
			TimeEvent(30*FRAMES, function(inst)
	            inst.SoundEmitter:PlaySound("dontstarve/sanity/transform/two")
			end),
			TimeEvent(50*FRAMES, function(inst)
	            if inst.components.spawnfader then
	            	inst.components.spawnfader:FadeIn()
	            end
	            inst.SoundEmitter:PlaySound("dontstarve/sanity/transform/two")
			end),
			TimeEvent(70*FRAMES, function(inst)
	            -- SpawnPrefab("spawn_fx_small").Transform:SetPosition(inst:GetPosition():Get())
			end),
			TimeEvent(80*FRAMES, function(inst)
	            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
	            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
				if inst.skyhound_light then
	                inst.skyhound_light:TurnOff()
	            end
				if inst.spawn_warg then
					inst.spawn_warg(inst)
				end
			end),
		},
		events = {
			EventHandler("animqueueover", function(inst) 
				-- inst.sg:GoToState("reanimatestatue")
			end ),
		},
	},

	State{
		name = "death",
        tags = { "busy" },

        onenter = function(inst)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("emote_play_dead")
            RemovePhysicsColliders(inst)
			inst.components.lootdropper:SetLoot({"skyhound_tooth"})
            inst.components.lootdropper:DropLoot(inst:GetPosition())
        end,
	},
}

CommonStates.AddSimpleState(states, "do_action2", "emote_pet", {"busy"})
CommonStates.AddSimpleState(states, "do_action3", "emote_nuzzle", {"busy"})

CommonStates.AddHitState(states, nil, "distress")
SGCritterStates.AddEat(states, {
            TimeEvent(5 * FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
        })
SGCritterStates.AddWalkStates(states,
	{
		starttimeline = 
		{
	        TimeEvent(0*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/bark") end),
		},
		walktimeline =
		{
			TimeEvent(1*FRAMES, function(inst) PlayFootstep(inst, 0.25) end),
			TimeEvent(4*FRAMES, function(inst) PlayFootstep(inst, 0.25) end),
		},
	}, true)
CommonStates.AddSleepExStates(states,
	{
		starttimeline = 
		{
			TimeEvent(6*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/growl") end),
		},
		sleeptimeline = 
		{
			TimeEvent(14*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/sleep") end),
		},
	})
CommonStates.AddHopStates(states, true)
CommonStates.AddSinkAndWashAsoreStates(states)
-- Critters
local emotes =
{
	{ anim="emote_scratch",
      timeline=
 		{
			TimeEvent(15*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/emote_scratch") end),
			TimeEvent(26*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/emote_scratch") end),
			TimeEvent(35*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/emote_scratch") end),
			TimeEvent(45*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/emote_scratch") end),
			TimeEvent(55*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/emote_scratch") end),
		},
	},
	{ anim="emote_play_dead",
      timeline=
 		{
			TimeEvent(20*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant") end),
			TimeEvent(48*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant") end),
			TimeEvent(76*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/bark") end),
		},
	},
}

SGCritterStates.AddIdle(states, #emotes,
	{
        --TimeEvent(7*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant") end),
	})
SGCritterStates.AddRandomEmotes(states, emotes)
SGCritterStates.AddEmote(states, "cute", 
	{
		TimeEvent(10*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/sheepington/stallion") end),
		TimeEvent(14*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/sheepington/stallion") end),
		TimeEvent(19*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/sheepington/stallion") end),
		TimeEvent(22*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/sheepington/stallion") end),
		TimeEvent(25*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/sheepington/stallion") end),
		TimeEvent(29*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/sheepington/stallion") end),
		TimeEvent(34*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/sheepington/stallion") end),
	})
SGCritterStates.AddPetEmote(states, 
	{
		TimeEvent(8*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/tail") end),
		TimeEvent(12*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/tail") end),
		TimeEvent(16*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/tail") end),
		TimeEvent(24*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/tail") end),
	})
SGCritterStates.AddCombatEmote(states,
	{
		pre =
		{
			TimeEvent(9*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/bark") end),
		},
		loop =
		{
			TimeEvent(9*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/bark") end),
			TimeEvent(26*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant") end),
			TimeEvent(34*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant") end),
			TimeEvent(48*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/bark") end),
		},
	})
SGCritterStates.AddPlayWithOtherCritter(states, events,
	{
		active =
		{
			TimeEvent(3*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/growl") end),
			TimeEvent(13*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/growl") end),
		},
		passive = 
		{
			TimeEvent(5*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant") end),
			TimeEvent(14*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/pant") end),
		},
	})
SGCritterStates.AddHungry(states,
    {
        TimeEvent(0*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/bark") end),
    })
SGCritterStates.AddNuzzle(states, actionhandlers,
    {
        TimeEvent(13*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/emote_scratch") end),
        TimeEvent(13*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/sleep") end),
        TimeEvent(35*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/emote_scratch") end),
        TimeEvent(36*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/pupington/sleep") end),
    })

return StateGraph("SGskyhound", states, events, "idle", actionhandlers)