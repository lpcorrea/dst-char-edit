require("stategraphs/commonstates")

local actionhandlers =
{
}

local events =
{
    CommonHandlers.OnDeath(),
}

local states =
{
    State{
        name= "idle",
        tags = {"idle"},
        
        onenter = function(inst)
            inst.AnimState:PlayAnimation("anim")
        end,      
    },

    State{
        name = "death",
        tags = { "busy" },

        onenter = function(inst)
            inst.AnimState:PlayAnimation("death")
        end,
    },
}

return StateGraph("scppigcorpse", states, events, "idle", actionhandlers)