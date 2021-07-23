require("stategraphs/commonstates")
local SKYHOUND_VALUE = TUNING.SKYHOUND_VALUE

local actionhandlers = {
	ActionHandler(ACTIONS.PICKUP, "do_action"),
	ActionHandler(ACTIONS.SKYHOUND_HUNT, "do_action"),
	ActionHandler(ACTIONS.EAT, "eat"),
    --ActionHandler(ACTIONS.SKYHOUND_BITE, "bite")
}

local events = {
	EventHandler("oneat", function(inst) 
		if not inst.sg:HasStateTag("busy") then
			inst.sg:GoToState("eat")
		end
	end),
    EventHandler("critter_on_pet", function(inst)
        if not inst.sg:HasStateTag("busy") then
            inst.sg:GoToState("do_action5")
        end
    end),
    EventHandler("skyhound_pick", function(inst)
        if not inst.sg:HasStateTag("busy") then
            inst.sg:GoToState("do_action3")
        end
    end),
    EventHandler("skyhound_wait", function(inst)
        if not inst.sg:HasStateTag("busy") then
            if inst:HasTag("skyhound_wait") then
                inst.sg:GoToState("do_action2")
            elseif inst.AnimState:IsCurrentAnimation("statue") then
                inst.sg:GoToState("do_action4")
            else
                inst.sg:GoToState("do_action3")
            end
        end
    end),
    CommonHandlers.OnSleep(),
	CommonHandlers.OnLocomote(true, false),
    --CommonHandlers.OnAttack(),
    CommonHandlers.OnAttacked(),
    CommonHandlers.OnDeath(),
    CommonHandlers.OnHop(),
    CommonHandlers.OnSink(),
    EventHandler("doattack", function(inst)
        if not inst.sg:HasStateTag("busy") then
            inst.sg:GoToState("attack")
        end
    end),
}

local sounds_clay =
{
    idle = "dontstarve_DLC001/creatures/together/claywarg/idle",
    howl = "dontstarve_DLC001/creatures/together/claywarg/howl",
    hit = "dontstarve_DLC001/creatures/together/claywarg/hit",
    attack = "dontstarve_DLC001/creatures/together/claywarg/attack",
    death = "dontstarve_DLC001/creatures/together/claywarg/death",
    sleep = "dontstarve_DLC001/creatures/together/claywarg/sleep",
    alert = "dontstarve_DLC001/creatures/together/claywarg/alert",
}

local function ShowEyeFX(inst)
    if inst._eyeflames ~= nil then
        inst._eyeflames:set(true)
    end
end

local function HideEyeFX(inst)
    if inst._eyeflames ~= nil then
        inst._eyeflames:set(false)
    end
end

local function PlayClayShakeSound(inst)
    inst.SoundEmitter:PlaySound("dontstarve/creatures/together/clayhound/stone_shake")
end

local function PlayClayFootstep(inst)
    inst.SoundEmitter:PlaySound("dontstarve/creatures/together/clayhound/footstep")
end

local function sleeponanimover(inst)
    if inst.AnimState:AnimDone() then
        inst.sg:GoToState("sleeping")
    end
end

local function onwakeup(inst)
    if not inst.sg:HasStateTag("nowake") then
        inst.sg:GoToState("wake")
    end
end

local function onentersleeping(inst)
    inst.AnimState:PlayAnimation("statue")
end

local function idleonanimover(inst)
    if inst.AnimState:AnimDone() then
        inst.sg:GoToState("idle")
    end
end

local function DoWashAshore(inst, skip_splash)
    if not skip_splash then
        SpawnPrefab("splash_green").Transform:SetPosition(inst.Transform:GetWorldPosition())
    end
    
    inst.sg.statemem.isteleporting = true
    inst:Hide()
    inst.components.drownable:WashAshore()
end

local states = {
    State{
        name = "idle",
        tags = {"idle", "canrotate"},
        onenter = function(inst, pushanim)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            if inst:HasTag("skyhound_wait") then
                inst.AnimState:PlayAnimation("statue")
            else
                inst.AnimState:PlayAnimation("idle_loop", true)
            end
        end,
        events = {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        }
    },

    State
    {
        name = "hungry",
        tags = {"idle"},
        
        onenter = function(inst)
            inst.AnimState:PlayAnimation("howl")  -- 饥饿提示
            inst.SoundEmitter:PlaySound("dontstarve/creatures/hound/hurt")
        end,

        events=
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    },

    State{
        name = "do_action",
        tags = {"busy"},
        onenter = function(inst, pushanim)
            if inst.components.locomotor then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("atk")
        end,
        timeline =
        {
            TimeEvent(10 * FRAMES, function(inst)
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
        name = "eat",
        tags = {"busy"},
        onenter = function(inst, target)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("atk")
        end,
        timeline = {
            TimeEvent(10 * FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
        },
        events = {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    },

    State{
        name = "bite",
        tags = {"attack", "busy"},
        onenter = function(inst, target)
            
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("atk")
        end,
        timeline = {
            TimeEvent(10 * FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
            TimeEvent(13 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("attack")
                inst.sg:RemoveStateTag("busy")
                inst:AddTag("skyhound_no_bite")
                inst.components.timer:StartTimer("skyhound_no_bite", TUNING.SKYHOUND_VALUE.time_no_bite)
            end),
        },
        events = {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    },

    State
    {
        name = "reanimatestatue",
        tags = { "busy", "noattack", "statue" },

        onenter = function(inst, target)
            ShowEyeFX(inst)
            inst.AnimState:PlayAnimation("statue_pst")
            inst.SoundEmitter:PlaySound("dontstarve/music/clay_resurrection")
        end,

        timeline =
        {
            TimeEvent(1 * FRAMES, PlayClayShakeSound),
            TimeEvent(3 * FRAMES, PlayClayShakeSound),
            TimeEvent(5 * FRAMES, PlayClayShakeSound),
            TimeEvent(7 * FRAMES, PlayClayShakeSound),
            TimeEvent(21 * FRAMES, PlayClayShakeSound),
            TimeEvent(23 * FRAMES, PlayClayShakeSound),
            TimeEvent(25 * FRAMES, PlayClayShakeSound),
            TimeEvent(29 * FRAMES, PlayClayShakeSound),
            TimeEvent(32 * FRAMES, PlayClayShakeSound),
            TimeEvent(34 * FRAMES, PlayClayShakeSound),
            TimeEvent(36 * FRAMES, PlayClayShakeSound),
            TimeEvent(38 * FRAMES, PlayClayShakeSound),
            TimeEvent(39 * FRAMES, PlayClayShakeSound),
            TimeEvent(41 * FRAMES, PlayClayFootstep),
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
        name = "hop_pre",
        tags = { "doing", "nointerrupt", "busy", "jumping", "autopredict", "nomorph", "nosleep" },

        onenter = function(inst)
            local embark_x, embark_z = inst.components.embarker:GetEmbarkPosition()
            inst:ForceFacePoint(embark_x, 0, embark_z)
            -- inst.AnimState:PlayAnimation("jump_pre", false)
            inst.AnimState:PlayAnimation("run_pre", false)
        end,

        ontimeout = function(inst)
            inst.sg.statemem.collisionmask = inst.Physics:GetCollisionMask()
            inst.Physics:SetCollisionMask(COLLISION.GROUND)
            if not TheWorld.ismastersim then
                inst.Physics:SetLocalCollisionMask(COLLISION.GROUND)
            end
            inst.components.embarker:StartMoving()
        end,

        events =
        {
            EventHandler("animover", 
                function(inst) 
                    inst.sg.statemem.not_interrupted = true
                    inst.sg:GoToState("hop_loop", {queued_post_land_state = inst.sg.statemem.queued_post_land_state, collisionmask = inst.sg.statemem.collisionmask})
                end),
        },

        onexit = function(inst)
            if not inst.sg.statemem.not_interrupted then
                if data.start_embarking_pre_frame ~= nil then
                    inst.Physics:ClearLocalCollisionMask()
                    if inst.sg.statemem.collisionmask ~= nil then
                        inst.Physics:SetCollisionMask(inst.sg.statemem.collisionmask)
                    end
                end
                inst.components.embarker:Cancel()
            end
        end,
    },

    State{
        name = "hop_loop",
        tags = { "doing", "nointerrupt", "busy", "jumping", "autopredict", "nomorph", "nosleep" },

        onenter = function(inst, data)
            inst.sg.statemem.queued_post_land_state = nil
            -- inst.AnimState:PlayAnimation("jump_loop", true)
            -- inst.AnimState:PlayAnimation("run_loop", true)
            inst.sg.statemem.collisionmask = inst.Physics:GetCollisionMask()
            inst.Physics:SetCollisionMask(COLLISION.GROUND)
            if not TheWorld.ismastersim then
                inst.Physics:SetLocalCollisionMask(COLLISION.GROUND)
            end
            inst.components.embarker:StartMoving()
            inst:AddTag("ignorewalkableplatforms")
        end,

        events =
        {
            EventHandler("done_embark_movement", function(inst)
                local px, _, pz = inst.Transform:GetWorldPosition()
                inst.sg.statemem.not_interrupted = true
                inst.sg:GoToState("hop_pst", {landed_in_water = not TheWorld.Map:IsPassableAtPoint(px, 0, pz), queued_post_land_state = inst.sg.statemem.queued_post_land_state} )
            end),
        },

        onexit = function(inst)
            inst.Physics:ClearLocalCollisionMask()
            if inst.sg.statemem.collisionmask ~= nil then
                inst.Physics:SetCollisionMask(inst.sg.statemem.collisionmask)
            end
            inst:RemoveTag("ignorewalkableplatforms")
            if not inst.sg.statemem.not_interrupted then
                inst.components.embarker:Cancel()
            end

            inst:RemoveTag("busy")
            if inst.components.locomotor.isrunning then
                inst:PushEvent("locomote")
            end
        end,
    },

    State{
        name = "hop_pst",
        tags = { "doing", "nointerrupt", "jumping", "autopredict", "nomorph", "nosleep" },

        onenter = function(inst, data)
            -- inst.AnimState:PlayAnimation("jump_pst", false)
            inst.AnimState:PlayAnimation("run_pst", false)

            inst.components.embarker:Embark()
            inst:RemoveTag("busy")

            local nextstate = "hop_pst_complete"
            inst.sg.statemem.nextstate = nextstate
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState(inst.sg.statemem.nextstate)
            end),
        },
    },

    State{
        name = "hop_pst_complete",
        tags = {"autopredict", "nomorph", "nosleep" },

        onenter = function(inst)
            if inst.components.locomotor.isrunning then
                inst:DoTaskInTime(0,
                    function()
                        if inst.sg.currentstate.name == "hop_pst_complete" then
                            inst.sg:GoToState("idle")
                        end
                    end)
            else
                inst.sg:GoToState("idle")
            end
        end,
    },

    State{
        name = "sink",
        tags = { "busy", "nopredict", "nomorph", "drowning", "nointerrupt", "nowake" },

        onenter = function(inst, data)
            inst:ClearBufferedAction()

            inst.components.locomotor:Stop()
            inst.components.locomotor:Clear()

            inst.sg.statemem.collisionmask = inst.Physics:GetCollisionMask()
            inst.Physics:SetCollisionMask(COLLISION.GROUND)

            inst.components.drownable:OnFallInOcean()

            if inst.DynamicShadow ~= nil then
                inst.DynamicShadow:Enable(false)
            end

            if inst.brain ~= nil then
                inst.brain:Stop()
            end

            DoWashAshore(inst)
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.sg.statemem.has_anim and inst.AnimState:AnimDone() then
                    DoWashAshore(inst)
                end
            end),

            EventHandler("on_washed_ashore", function(inst)
                inst.sg:GoToState("washed_ashore")
            end),
        },        

        onexit = function(inst)
            if inst.sg.statemem.collisionmask ~= nil then
                inst.Physics:SetCollisionMask(inst.sg.statemem.collisionmask)
            end

            if inst.sg.statemem.isteleporting then
                inst:Show()
            end

            if inst.DynamicShadow ~= nil then
                inst.DynamicShadow:Enable(true)
            end

            if inst.components.herdmember ~= nil then
                inst.components.herdmember:Leave()
            end

            if inst.components.combat ~= nil then
                inst.components.combat:DropTarget()
            end

            if inst.brain ~= nil then
                inst.brain:Start()
            end
        end,
    },

    State{
        name = "washed_ashore",
        tags = { "doing", "busy", "nopredict", "silentmorph" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("statue")
            inst.AnimState:PushAnimation("statue_pst", false)

            if inst.brain ~= nil then
                inst.brain:Stop()
            end

            if inst.components.drownable ~= nil then
                inst.components.drownable:TakeDrowningDamage()
            end

            local x, y, z = inst.Transform:GetWorldPosition()
            SpawnPrefab("washashore_puddle_fx").Transform:SetPosition(x, y, z)
            SpawnPrefab("splash_green").Transform:SetPosition(x, y, z) 
        end,

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            if inst.brain ~= nil then
                inst.brain:Start()
            end
        end,
    },

    State
    {
        name = "sleep",
        tags = { "busy", "sleeping" },

        onenter = function(inst)
            HideEyeFX(inst)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("statue_pre")  -- 没有睡觉动画，就变沙雕吧
        end,

        events =
        {
            EventHandler("animover", sleeponanimover),
            EventHandler("onwakeup", onwakeup),
        },
    },

    State
    {
        name = "sleeping",
        tags = { "busy", "sleeping" },

        onenter = function(inst)
            HideEyeFX(inst)
            inst.AnimState:PlayAnimation("statue")
        end,

        timeline = {
            --TimeEvent(0 * FRAMES, function(inst) inst.SoundEmitter:PlaySound(sounds_clay.sleep) end),
        },

        events =
        {
            EventHandler("animover", sleeponanimover),
            EventHandler("onwakeup", onwakeup),
        },
    },

    State
    {
        name = "wake",
        tags = { "busy", "waking" },

        onenter = function(inst)        
            ShowEyeFX(inst)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("statue_pst")
            if inst.components.sleeper ~= nil 
            and inst.components.sleeper:IsAsleep() then
                inst.components.sleeper:WakeUp()
            end
        end,

        events =
        {
            EventHandler("animover", idleonanimover),
        },
    },

    State{
        name = "death",
        tags = { "busy" },

        onenter = function(inst)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("death")
            RemovePhysicsColliders(inst)
        end,

        timeline = {
            TimeEvent(0 * FRAMES, function(inst)
                inst.sg.statemem.clay = true
                HideEyeFX(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/destroy_pot")
                inst.SoundEmitter:PlaySoundWithParams("dontstarve/creatures/together/antlion/sfx/ground_break", { size = .1 })
                inst.SoundEmitter:PlaySound(sounds_clay.death)
            end),
            TimeEvent(4 * FRAMES, function(inst)
                if inst.sg.statemem.clay then
                    PlayClayFootstep(inst)
                end
            end),
            TimeEvent(6 * FRAMES, function(inst)
                if inst.sg.statemem.clay then
                    PlayClayFootstep(inst)
                end
            end),
        },
    },

    State{
        name = "attack",
        tags = { "attack", "busy" },

        onenter = function(inst, target)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("atk")
            inst.components.combat:StartAttack()
            inst.sg.statemem.target = target
        end,

        timeline = {
            TimeEvent(0 * FRAMES, function(inst) 
                inst.SoundEmitter:PlaySound(sounds_clay.attack) 
            end),
            TimeEvent(12 * FRAMES, function(inst) 
                inst.components.combat:DoAttack()
                inst.sg:RemoveStateTag("attack")
                inst.sg:RemoveStateTag("busy")
            end),
        },

        events =
        {
            EventHandler("animover", idleonanimover),
        },
    },
}

-- CommonStates.AddSimpleActionState(states, "do_action", "atk", 10, {"busy"})
CommonStates.AddSimpleState(states, "do_action2", "statue_pre", {"busy"})
CommonStates.AddSimpleState(states, "do_action3", "howl", {"busy"})
CommonStates.AddSimpleState(states, "do_action4", "statue_pst", {"busy"})
CommonStates.AddSimpleState(states, "do_action5", "shake", {"busy"})
CommonStates.AddHitState(states, {
    TimeEvent(0 * FRAMES, function(inst) inst.SoundEmitter:PlaySound(sounds_clay.hit) end),
})
CommonStates.AddRunStates(states,
{
    starttimeline = {},
    runtimeline =
    {
        TimeEvent(5 * FRAMES, function(inst)
            PlayClayFootstep(inst)
            inst.SoundEmitter:PlaySound(sounds_clay.idle)
        end),
    },
    endtimeline = {},
})

return StateGraph("SGskyhound_warg", states, events, "reanimatestatue", actionhandlers)