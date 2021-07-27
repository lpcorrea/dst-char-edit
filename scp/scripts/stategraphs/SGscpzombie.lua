require("stategraphs/commonstates")

local actionhandlers =
{
    ActionHandler(ACTIONS.CHOP, "chop"),
    ActionHandler(ACTIONS.PICKUP, "pickup"),
    ActionHandler(ACTIONS.EQUIP, "pickup"),
    ActionHandler(ACTIONS.ADDFUEL, "pickup"),
    ActionHandler(ACTIONS.TAKEITEM, "pickup"),
    ActionHandler(ACTIONS.UNPIN, "pickup"),
}

local events =
{
    CommonHandlers.OnStep(),
    CommonHandlers.OnLocomote(true, true),
    CommonHandlers.OnFreeze(),
    CommonHandlers.OnAttack(),
    CommonHandlers.OnAttacked(true),
    CommonHandlers.OnDeath(),
    EventHandler("doaction", function(inst, data)
        if data.action == ACTIONS.CHOP and not (inst.sg:HasStateTag("busy") or inst.components.health:IsDead()) then
            inst.sg:GoToState("chop", data.target)
        end
    end),
}

local states =
{
        State{
        name= "funnyidle",
        tags = {"idle"},
        
        onenter = function(inst)
            inst.Physics:Stop()

            if inst.prefab == "scp035host" then
                inst.AnimState:PlayAnimation("idle_happy")
            else
                inst.AnimState:PlayAnimation("idle_loop")
            end
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },        
    },


    State{
        name= "funnyidle",
        tags = {"idle"},
        
        onenter = function(inst)
            inst.Physics:Stop()

            if inst.prefab == "scp035host" then
                inst.AnimState:PlayAnimation("idle_happy")
            else
                inst.AnimState:PlayAnimation("idle_loop")
            end
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("funnyidle") end ),
        },        
    },

    State{
        name = "death",
        tags = { "busy", "dead"},

        onenter = function(inst)
            if inst.prefab == "scp035host" then
                inst.SoundEmitter:PlaySound("dontstarve/characters/scp035/death_voice")
            else
                inst.SoundEmitter:PlaySound("dontstarve/pig/grunt")
            end
            inst.AnimState:PlayAnimation("death")
            inst.Physics:Stop()
            RemovePhysicsColliders(inst)
            inst.components.lootdropper:DropLoot(inst:GetPosition())
            --inst.components.lootdropper:SetLoot(nil)
        end,
    },

    State{
        name = "attack",
        tags = { "attack", "busy" },

        onenter = function(inst)
            if inst.prefab == "scp035host" then
                --inst.SoundEmitter:PlaySound("dontstarve/characters/scp035/death_voice")
            else
                inst.SoundEmitter:PlaySound("dontstarve/pig/attack")
            end
            inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
            inst.components.combat:StartAttack()
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("atk")
        end,

        timeline =
        {
            TimeEvent(13 * FRAMES, function(inst)
                inst.components.combat:DoAttack()
                inst.sg:RemoveStateTag("attack")
                inst.sg:RemoveStateTag("busy")
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State{
        name = "chop",
        tags = { "chopping" },

        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("atk")
        end,

        timeline =
        {
            TimeEvent(13 * FRAMES, function(inst)
                inst:PerformBufferedAction()
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State{
        name = "hit",
        tags = { "busy" , "hit"},

        onenter = function(inst)
            if inst.prefab == "scp035host" then
                inst.SoundEmitter:PlaySound("dontstarve/characters/scp035/hurt")
            else
                inst.SoundEmitter:PlaySound("dontstarve/pig/oink")
            end
            inst.AnimState:PlayAnimation("hit")
            inst.Physics:Stop()
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
}

CommonStates.AddWalkStates(states,
{
    walktimeline =
    {
        TimeEvent(0, PlayFootstep),
        TimeEvent(12 * FRAMES, PlayFootstep),
    },
})

CommonStates.AddRunStates(states,
{
    runtimeline =
    {
        TimeEvent(0, PlayFootstep),
        TimeEvent(10 * FRAMES, PlayFootstep),
    },
})
CommonStates.AddIdle(states,"funnyidle")
CommonStates.AddFrozenStates(states)
CommonStates.AddSimpleActionState(states, "pickup", "pig_pickup", 10 * FRAMES, { "busy" })

return StateGraph("pig", states, events, "idle", actionhandlers)
