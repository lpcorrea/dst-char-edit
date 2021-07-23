require("stategraphs/commonstates")

local actionhandlers = 
{
	
}

   
local events=
{
    CommonHandlers.OnAttacked(),
    CommonHandlers.OnAttack(),
    CommonHandlers.OnDeath(),
}

local function DoEmoteFX(inst, prefab)
    local fx = SpawnPrefab(prefab)
    if fx ~= nil then
        if inst.components.rider and inst.components.rider:IsRiding() then
            fx.Transform:SetSixFaced()
        end
        fx.entity:SetParent(inst.entity)
        fx.entity:AddFollower()
        fx.Follower:FollowSymbol(inst.GUID, "emotefx", 0, 0, 0)
    end
end

local fxskin = {
    monkey_king_ear = "ear",
}


local states = {

    State{
        name = "idle",
        tags = { "idle", "canrotate" },

        onenter = function(inst, pushanim)
            inst.Physics:Stop()
            if pushanim then
                if type(pushanim) == "string" then
                    inst.AnimState:PlayAnimation(pushanim)
                end
                inst.AnimState:PushAnimation("idle_loop",false)
            else
                inst.AnimState:PlayAnimation("idle_loop")
            end

            if inst.WantToRemove then 
                inst.sg:GoToState("remove")
            end
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },

    State{
        name = "spawn",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("wortox_portal_jumpout")
            inst.DynamicShadow:Enable(false)
        end,
        
        timeline = {
            TimeEvent(1*FRAMES, function(inst) 
                local fx = SpawnPrefab("mk_striker_fx")
                fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
                if fxskin[inst.AnimState:GetBuild()] ~= nil then
                    fx:SetSkinBuild(fxskin[inst.AnimState:GetBuild()])
                end
                inst.SoundEmitter:PlaySound("dontstarve/characters/wortox/soul/hop_out")
            end),
        },

        onexit = function(inst)
            inst.DynamicShadow:Enable(true)
        end,

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    },

    -- State{
    --     name = "taunt",
    --     tags = {"busy","notalking"},
        
    --     onenter = function(inst)
    --         local tauntanim = {
    --             "emote_fistshake",
    --         }
    --         inst.Physics:Stop()
    --         inst.AnimState:PlayAnimation(tauntanim[math.random(1,#tauntanim)])
    --         DoEmoteFX(inst, "emote_fx")
    --         inst.SoundEmitter:PlaySound(inst.sounds.emote)
    --     end,

    --     events =
    --     {
    --         EventHandler("animover", function(inst)
    --             if inst.AnimState:AnimDone() then
    --                 inst.sg:GoToState("idle")
    --             end
    --         end),
    --     },
    -- },

	State{
        name = "remove",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.Physics:Stop()
            inst.components.health:SetInvincible(true)
            inst.AnimState:PlayAnimation("wortox_portal_jumpin_pre")
            inst.AnimState:PushAnimation("wortox_portal_jumpin",false)
            inst.DynamicShadow:Enable(false)
        end,
		
		timeline = {
			TimeEvent(8*FRAMES, function(inst) 
				inst.SoundEmitter:PlaySound("dontstarve/creatures/together/toad_stool/infection_post", nil, .7)
                inst.SoundEmitter:PlaySound("dontstarve/characters/wortox/soul/spawn", nil, .5)
			end),

            TimeEvent(12*FRAMES, function(inst) 
                local fx = SpawnPrefab("mk_striker_fx")
                fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
                if fxskin[inst.AnimState:GetBuild()] ~= nil then
                    fx:SetSkinBuild(fxskin[inst.AnimState:GetBuild()])
                end
            end),            
		},

		events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst:Remove()
                end
            end),
        },
    },

    State{
        name = "attack_hop",
        tags = { "attack", "busy" },

        onenter = function(inst, target)
            if inst.components.locomotor ~= nil then
                inst.components.locomotor:StopMoving()
            end
            inst.AnimState:PlayAnimation("atk_leap")
            inst.SoundEmitter:PlaySound("dontstarve/common/deathpoof")
            inst.components.combat:StartAttack()
            inst.sg.statemem.target = target

            inst.sg:SetTimeout(30 * FRAMES)
        end,

        timeline = {
            TimeEvent(10 * FRAMES, function(inst)
                ShakeAllCameras(CAMERASHAKE.VERTICAL, .7, .015, .8, inst, 20)
                -- inst.components.combat:DoAreaAttack(inst,2.5,nil, nil, nil, { "INLIMBO","companion" })
                local x,y,z = inst:GetPosition():Get()
                for k,v in pairs(TheSim:FindEntities(x,y,z,4,{"_combat"},{"INLIMBO","companion"})) do 
                    if inst.owner and inst.owner.components.combat:CanTarget(v) then 
                        local damage = inst.owner.components.inventory:EquipHasTag("golden_hat_mk") and 150 or 100
						if inst.owner.components.debuffable and inst.owner.components.debuffable:HasDebuff("condensed_pill_buff") then
							damage = damage + 50
						end
						v.components.combat:GetAttacked(inst,damage)
                    end
                end
                inst.SoundEmitter:PlaySound("dontstarve/common/destroy_smoke",nil,nil,true)
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
    },
}


CommonStates.AddCombatStates(states, {
	attacktimeline = {
		TimeEvent(0 * FRAMES, function(inst)
			inst.AnimState:PushAnimation("atk", false)
            inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_whoosh")
        end),

        TimeEvent(8 * FRAMES, function(inst)
            inst.components.combat:DoAttack()
        end),
	},
	deathtimeline = {
		TimeEvent(0 * FRAMES, function(inst)
			-- inst.SoundEmitter:PlaySound(inst.sounds.death)
            inst.sg:GoToState("remove")
        end),
	}
}, 
{
	attack = "atk_pre",
})

return StateGraph("SGmk_phantom", states, events, "attack_hop", actionhandlers)