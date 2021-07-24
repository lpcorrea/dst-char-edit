
--neza sg
local function NewAoeSg(sg)
    local old_castaoe = sg.actionhandlers[ACTIONS.CASTAOE].deststate
    sg.actionhandlers[ACTIONS.CASTAOE].deststate = function(inst, action)
            if action.invobject and action.invobject:HasTag("nzaoeweapon_leap")  then
				return "nzcombat_superjump_start"

            elseif action.invobject and action.invobject:HasTag("pigsy_rake")  then
                return "pigsy_parry_pre"
			end
			return old_castaoe(inst, action)
    end
end
AddStategraphPostInit("wilson", NewAoeSg)
AddStategraphPostInit("wilson_client", NewAoeSg)

local function OnRemoveCleanupTargetFX(inst)
    if inst.sg.statemem.targetfx.KillFX ~= nil then
        inst.sg.statemem.targetfx:RemoveEventCallback("onremove", OnRemoveCleanupTargetFX, inst)
        inst.sg.statemem.targetfx:KillFX()
    else
        inst.sg.statemem.targetfx:Remove()
    end
end

local function ToggleOffPhysics(inst)
    inst.sg.statemem.isphysicstoggle = true
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.GROUND)
end
local function ToggleOnPhysics(inst)
    inst.sg.statemem.isphysicstoggle = nil
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    inst.Physics:CollidesWith(COLLISION.GIANTS)
end


AddStategraphState('wilson',

    State{
        name = "nzcombat_superjump_start",
        tags = { "aoe", "doing", "busy", "nointerrupt", "nomorph","nz_busy" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
			inst.components.health:SetInvincible(true)
			inst.AnimState:PlayAnimation("superjump_pre")
            local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if weapon ~= nil and weapon.components.aoetargeting ~= nil and weapon.components.aoetargeting.targetprefab ~= nil then
                local buffaction = inst:GetBufferedAction()
                if buffaction ~= nil and buffaction.pos ~= nil then
                    inst.sg.statemem.targetfx = SpawnPrefab(weapon.components.aoetargeting.targetprefab)
                    if inst.sg.statemem.targetfx ~= nil then
                        inst.sg.statemem.targetfx.Transform:SetPosition(buffaction.pos:Get())
                        inst.sg.statemem.targetfx:ListenForEvent("onremove", OnRemoveCleanupTargetFX, inst)
                    end
                end
            end
        end,

        events =
        {
            EventHandler("nzcombat_superjump", function(inst, data)
                inst.sg.statemem.superjump = true
                inst.sg:GoToState("nz_combat_superjump", {
                    targetfx = inst.sg.statemem.targetfx,
                    data = data,
                })
            end),
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    if inst.AnimState:IsCurrentAnimation("superjump_pre") then
                        inst.AnimState:PlayAnimation("superjump_lag")
                        inst:PerformBufferedAction()
                    else
                        inst.sg:GoToState("idle")
                    end
                end
            end),
        },

        onexit = function(inst)
            if not inst.sg.statemem.superjump then
                inst.components.health:SetInvincible(false)
                if inst.sg.statemem.targetfx ~= nil and inst.sg.statemem.targetfx:IsValid() then
                    OnRemoveCleanupTargetFX(inst)
                end
            end
        end,
    }
)

AddStategraphState('wilson',
    State{
        name = "nz_combat_superjump",
        tags = { "aoe", "doing", "busy", "nointerrupt", "nopredict", "nomorph" },

        onenter = function(inst, data)
            if data ~= nil then
                inst.sg.statemem.targetfx = data.targetfx
                inst.sg.statemem.data = data
                data = data.data
                if data ~= nil and
                    data.targetpos ~= nil and
                    data.weapon ~= nil and
                    data.weapon.components.aoeweapon_leap ~= nil and
                    inst.AnimState:IsCurrentAnimation("superjump_lag") then
                    ToggleOffPhysics(inst)
                    inst.AnimState:PlayAnimation("superjump")
					--inst:Hide()
                    inst.AnimState:SetMultColour(.8, .8, .8, 1)
                    inst.components.colouradder:PushColour("superjump", .1, .1, .1, 0)
                    inst.sg.statemem.data.startingpos = inst:GetPosition()
                    inst.sg.statemem.weapon = data.weapon
                    if inst.sg.statemem.data.startingpos.x ~= data.targetpos.x or inst.sg.statemem.data.startingpos.z ~= data.targetpos.z then
                        inst:ForceFacePoint(data.targetpos:Get())
                    end
                    inst.SoundEmitter:PlaySound("dontstarve/movement/bodyfall_dirt", nil, .4)
                    inst.SoundEmitter:PlaySound("dontstarve/common/deathpoof")
                    inst.sg:SetTimeout(0.5)
                    return
                end
            end
            --Failed
            inst.sg:GoToState("idle", true)
        end,

        onupdate = function(inst)
            if inst.sg.statemem.dalpha ~= nil and inst.sg.statemem.alpha > 0 then
                inst.sg.statemem.dalpha = math.max(.1, inst.sg.statemem.dalpha - .1)
                inst.sg.statemem.alpha = math.max(0, inst.sg.statemem.alpha - inst.sg.statemem.dalpha)
                inst.AnimState:SetMultColour(0, 0, 0, inst.sg.statemem.alpha)
            end
        end,

        timeline =
        {
            TimeEvent(FRAMES, function(inst)
                inst.DynamicShadow:Enable(false)
                inst.sg:AddStateTag("noattack")
                inst.components.health:SetInvincible(true)
                --inst.AnimState:SetMultColour(.5, .5, .5, 1)
                --inst.components.colouradder:PushColour("superjump", .3, .3, .2, 0)
                inst:PushEvent("dropallaggro")
                if inst.sg.statemem.weapon ~= nil and inst.sg.statemem.weapon:IsValid() then
                    inst.sg.statemem.weapon:PushEvent("superjumpstarted", inst)
                end
            end),
            TimeEvent(2 * FRAMES, function(inst)
                --inst.AnimState:SetMultColour(0, 0, 0, 1)
                --inst.components.colouradder:PushColour("superjump", .6, .6, .4, 0)
            end),
            TimeEvent(3 * FRAMES, function(inst)
                inst.sg.statemem.alpha = 1
                inst.sg.statemem.dalpha = .5
            end),
            TimeEvent(1 - 7 * FRAMES, function(inst)
                if inst.sg.statemem.targetfx ~= nil then
                    if inst.sg.statemem.targetfx:IsValid() then
                        OnRemoveCleanupTargetFX(inst)
                    end
                    inst.sg.statemem.targetfx = nil
                end
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                --if inst.AnimState:AnimDone() then
                    --inst:Hide()
                    --inst.Physics:Teleport(inst.sg.statemem.data.data.targetpos.x, 0, inst.sg.statemem.data.data.targetpos.z)
                --end
            end),
        },

        ontimeout = function(inst)
			inst.Physics:Teleport(inst.sg.statemem.data.data.targetpos.x, 0, inst.sg.statemem.data.data.targetpos.z)
            inst.sg.statemem.superjump = true
            inst.sg.statemem.data.isphysicstoggle = inst.sg.statemem.data.isphysicstoggle
            inst.sg.statemem.data.targetfx = nil
            inst.sg:GoToState("nzcombat_superjump_pst", inst.sg.statemem.data)
        end,

        onexit = function(inst)
            if not inst.sg.statemem.superjump then
                inst.components.health:SetInvincible(false)
                if inst.sg.statemem.isphysicstoggle then
                    ToggleOnPhysics(inst)
                end
                inst.components.colouradder:PopColour("superjump")
                inst.AnimState:SetMultColour(1, 1, 1, 1)
                inst.DynamicShadow:Enable(true)
                if inst.sg.statemem.weapon ~= nil and inst.sg.statemem.weapon:IsValid() then
                    inst.sg.statemem.weapon:PushEvent("superjumpcancelled", inst)
                end
            end
            if inst.sg.statemem.targetfx ~= nil and inst.sg.statemem.targetfx:IsValid() then
                OnRemoveCleanupTargetFX(inst)
            end
            inst:Show()
        end,
    }
)

AddStategraphState('wilson_client',
    State
    {
        name = "nzcombat_superjump_start",
        tags = { "doing", "busy", "nointerrupt","nz_busy" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("superjump_pre")
            inst.AnimState:PushAnimation("superjump_lag", false)

            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(1)
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
)

AddStategraphState('wilson',
    State{
        name = "nzcombat_superjump_pst",
        tags = { "aoe", "doing", "busy", "noattack", "nopredict", "nomorph","nz_busy" },

        onenter = function(inst, data)
            if data ~= nil then
                inst.sg.statemem.targetfx = data.targetfx --nil
                inst.sg.statemem.data = data
                data = data.data
                if data ~= nil and
                    data.targetpos ~= nil and
                    data.weapon ~= nil and
                    data.weapon.components.aoeweapon_leap ~= nil then 
					inst.sg.statemem.weapon = data.weapon
                    inst.AnimState:PlayAnimation("superjump_land")
                    inst.AnimState:SetMultColour(.4, .4, .4, .4)
                    inst.sg.statemem.targetpos = data.targetpos
                    inst.sg.statemem.flash = 0
                    if not inst.sg.statemem.isphysicstoggle then
                        ToggleOffPhysics(inst)
                    end
                    inst.Physics:Teleport(data.targetpos.x, 0, data.targetpos.z)
                    inst.components.health:SetInvincible(true)
                    inst.sg:SetTimeout(22 * FRAMES)
                    return
                end
            end
            --Failed
            inst.sg:GoToState("idle", true)
        end,

        onupdate = function(inst)
            if inst.sg.statemem.flash > 0 then
                inst.sg.statemem.flash = math.max(0, inst.sg.statemem.flash - .1)
                local c = math.min(1, inst.sg.statemem.flash)
                inst.components.colouradder:PushColour("superjump", c, c, 0, 0)
            end
        end,

        timeline =
        {
            TimeEvent(FRAMES, function(inst)
				inst.SoundEmitter:PlaySound("dontstarve/movement/bodyfall_dirt")
                inst.AnimState:SetMultColour(.7, .7, .7, .7)
                inst.components.colouradder:PushColour("superjump", .1, .1, 0, 0)
            end),
            TimeEvent(2 * FRAMES, function(inst)
                inst.AnimState:SetMultColour(.9, .9, .9, .9)
                inst.components.colouradder:PushColour("superjump", .2, .2, 0, 0)
            end),
            TimeEvent(3 * FRAMES, function(inst)
                inst.AnimState:SetMultColour(1, 1, 1, 1)
                inst.components.colouradder:PushColour("superjump", .4, .4, 0, 0)
                inst.DynamicShadow:Enable(true)
            end),
            TimeEvent(4 * FRAMES, function(inst)
                inst.components.colouradder:PushColour("superjump", 1, 1, 0, 0)
                inst.components.bloomer:PushBloom("superjump", "shaders/anim.ksh", -2)
                ToggleOnPhysics(inst)
                ShakeAllCameras(CAMERASHAKE.VERTICAL, .7, .015, .8, inst, 20)
                inst.sg.statemem.flash = 1.3
                inst.sg:RemoveStateTag("noattack")
                inst.components.health:SetInvincible(false)
                if inst.sg.statemem.weapon:IsValid() then
                    inst.sg.statemem.weapon.components.aoeweapon_leap:DoLeap(inst, inst.sg.statemem.startingpos, inst.sg.statemem.targetpos)
                    inst.sg.statemem.weapon = nil
                end
            end),
            TimeEvent(8 * FRAMES, function(inst)
                inst.components.bloomer:PopBloom("superjump")
				local fx = SpawnPrefab("nz_lance_fx")
				if fx then
					fx.entity:SetParent(inst.entity)
                    fx.AnimState:SetBuild(inst.AnimState:GetBuild())
                    --if inst.AnimState:GetBuild() == 'neza_green' then
                    --    fx.AnimState:SetBuild("neza_green")
                    --end
				end
            end),
            TimeEvent(12*FRAMES,function(inst)
                ShakeAllCameras(CAMERASHAKE.VERTICAL, .7, .015, .8, inst, 20)
                local pos = inst:GetPosition()
					local x, y, z = inst.Transform:GetWorldPosition()
					SpawnPrefab("fx_boat_pop").Transform:SetPosition(x, y, z)
					SpawnPrefab("winona_battery_high_shatterfx").Transform:SetPosition(x, y, z)
                local ents = TheSim:FindEntities(pos.x,pos.y,pos.z,4,{"_combat", }, { "playerghost", "INLIMBO", "player","companion","wall" })
   				local damage = 70
				if inst.components.debuffable and inst.components.debuffable:HasDebuff("condensed_pill_buff") then
					damage = 100
				end                
			   for _,v in pairs(ents)do
                    if v and v.components.health and not v.components.health:IsDead() then
                        v.components.combat:GetAttacked(inst,damage,nil,'nz_lance')
						if v.sg and not v.sg:HasStateTag("flight") and  v.sg:HasState("hit") and not v.sg:HasStateTag("noouthit") then
							v.sg:GoToState('hit')
						end
                    end
                end
            end),
            TimeEvent(16* FRAMES,function(inst)
				local fx = SpawnPrefab("nz_lance_fx")
				if fx then
					fx.entity:SetParent(inst.entity)
                    fx.AnimState:SetBuild(inst.AnimState:GetBuild())
				end
            end),
			
            TimeEvent(19 * FRAMES,function(inst)
                ShakeAllCameras(CAMERASHAKE.VERTICAL, .7, .015, .8, inst, 20)
				PlayFootstep(inst)
                local pos = inst:GetPosition()
				local x, y, z = inst.Transform:GetWorldPosition()
				SpawnPrefab("fx_boat_pop").Transform:SetPosition(x, y, z)
				SpawnPrefab("winona_battery_high_shatterfx").Transform:SetPosition(x, y, z)
                local ents = TheSim:FindEntities(pos.x,pos.y,pos.z,4,{"_combat", }, { "playerghost", "INLIMBO", "player","companion","wall" })
  				local damage = 70
				if inst.components.debuffable and inst.components.debuffable:HasDebuff("condensed_pill_buff") then
					damage = 100
				end              
				for _,v in pairs(ents)do
                    if v and v.components.health and not v.components.health:IsDead() then
                            v.components.combat:GetAttacked(inst,damage,nil,'nz_lance')
							--if v.sg and not v.sg:HasStateTag("flight") and  v.sg:HasState("hit") then
							--	v.sg:GoToState('hit')
							--end
                    end
                end
			end),	
        },

        ontimeout = function(inst)
            inst.sg:GoToState("idle", true)
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
            if inst.sg.statemem.isphysicstoggle then
                ToggleOnPhysics(inst)
            end
            inst.AnimState:SetMultColour(1, 1, 1, 1)
            inst.DynamicShadow:Enable(true)
            inst.components.health:SetInvincible(false)
            inst.components.bloomer:PopBloom("superjump")
            inst.components.colouradder:PopColour("superjump")
            if inst.sg.statemem.weapon ~= nil and inst.sg.statemem.weapon:IsValid() then
                inst.sg.statemem.weapon:PushEvent("superjumpcancelled", inst)
            end
        end,
    }
)


local sp_recipi = {
    yangjian_track = 'myth_sg_pre',
    yangjian_buzzard_spawn = 'myth_sg_pre',
    yt_rabbithole = 'myth_yutu_dig_start',
    yt_moonbutterfly = 'summon_butterfly',
    yt_daoyao = 'myth_sg_pre',
    myth_lotus_flower = 'form_log2',
    mk_jgb_rec = 'mk_summonjgb',
    mk_dsf = 'mk_dsf',
}

local function RecipePostInit(sg)
    local old_handler = sg.actionhandlers[ACTIONS.BUILD].deststate
    sg.actionhandlers[ACTIONS.BUILD].deststate = function(inst, action)
        if not inst.sg:HasStateTag('busy') then

            if action.recipe and sp_recipi[action.recipe] ~= nil  then
                return  sp_recipi[action.recipe]
            else
                return old_handler(inst, action)
            end
        end
    end
end

local LogState = State{
    name = 'form_log2',
    tags = {"doing", "busy"},
        
    timeline=
    {
        TimeEvent(24*FRAMES, function( inst )
            inst:PerformBufferedAction()
            inst.sg:RemoveStateTag("busy")
        end),
    },
        
    onenter = function(inst, timeout)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("emoteXL_bonesaw")
        inst.sg:SetTimeout(25*FRAMES)
    end,

    events=
    {
        EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
    },        
    
}
local LogStateclient = State{
    name = 'form_log2',
    tags = {"doing", "busy"},
        
    onenter = function(inst, timeout)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("emoteXL_bonesaw")
        inst.sg:SetTimeout(25*FRAMES)
		inst:PerformPreviewBufferedAction()
		
    end,
	
    timeline=
    {
        TimeEvent(24*FRAMES, function( inst )
            inst:PerformBufferedAction()
            inst.sg:RemoveStateTag("busy")
        end),
    },
    ontimeout = function(inst)
        inst:ClearBufferedAction()
        inst.sg:GoToState("idle", true)
    end,        
}
AddStategraphPostInit("wilson", RecipePostInit)
AddStategraphPostInit("wilson_client", RecipePostInit)
AddStategraphState('wilson',LogState)
AddStategraphState('wilson_client',LogStateclient)

--from the mod Womp . Thanks very much!
AddPrefabPostInit("bearger", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return
	end
	local listeners = inst.event_listeners.onhitother
	if listeners ~= nil then
		local listener_fns = listeners[inst]
		local old = listener_fns[1]
		listener_fns[1] = function(inst, data)
			local other = data.target
			if other and (other.prefab == "monkey_king" or  (other.prefab == "neza"  and  other.sg 
				and other.sg:HasStateTag("nz_busy")) )then
				return
			end
			return old(inst, data)
		end
	end
end)

AddStategraphPostInit("moose", function(sg)
	if sg.states and sg.states.disarm then
        local disarm_state = sg.states.disarm
        local old = disarm_state.timeline[5].fn
	    if old ~= nil then
		    disarm_state.timeline[5].fn = function(inst)
			    local target = inst.components.combat.target
			    if target and (target.prefab == "monkey_king" or  (target.prefab == "neza"  and  target.sg 
				    and target.sg:HasStateTag("nz_busy")) )then
				    inst.CanDisarm = false
				    return	
			    end
			    old(inst)
		    end
        end
	end
end)

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
    return (inst:HasTag("beaver") and "item_in")
        or (data.eslot ~= EQUIPSLOTS.HANDS and "item_hat")
        or (not data.slip and "item_in")
        or (data.item ~= nil and data.item:IsValid() and "tool_slip")
        or "toolbroke"
        , data.item
end

local function lookforskyeye(inst)
	local x,y,z = inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x, y, z, 24, {"player","skyeye"})
	return  next(ents) ~= nil
end

local miaoskin = {
    monkey_king_ear = "mk_miao_ear",
}
AddStategraphState('wilson',
    State{
        name = "mkhide",
        tags = { "hiding", "notalking", "nomorph", "busy", "nopredict", "nodangle" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
			inst:AddTag("mk_miao")
            local build = miaoskin[inst.AnimState:GetBuild()] or "mk_miao"
			inst.AnimState:OverrideSymbol("swap_hat", build, "swap_hat")
			inst.AnimState:Show("HAT")
			inst.AnimState:Show("HAIR_HAT")
			inst.AnimState:Hide("HAIR_NOHAT")
			inst.AnimState:Hide("HAIR")
            inst.AnimState:Hide("HEAD")
            inst.AnimState:Show("HEAD_HAT")
        
            inst.AnimState:PlayAnimation("hide")
            inst.AnimState:PushAnimation("hide_idle", false)
            inst.SoundEmitter:PlaySound("dontstarve/movement/foley/hidebush")
        end,

        timeline =
        {
            TimeEvent(24 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
                inst.sg:RemoveStateTag("nopredict")
                inst.sg:AddStateTag("idle")
            end),
            TimeEvent(1, function(inst)
                inst.cancheckoutsky = true
            end),
        },
        onupdate = function(inst)
            if inst.cancheckoutsky and lookforskyeye(inst) then
				inst.sg:GoToState("idle")
				inst.components.talker:Say("好狠的三只眼！”")
            end
        end,
        events =
        {
            EventHandler("ontalk", function(inst)
                inst.AnimState:PushAnimation("hide_idle", false)

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
			inst.AnimState:ClearOverrideSymbol("swap_hat")
			inst.AnimState:Hide("HAT")
			inst.AnimState:Hide("HAIR_HAT")
			inst.AnimState:Show("HAIR_NOHAT")
			inst.AnimState:Show("HAIR")
            inst.AnimState:Show("HEAD")
            inst.AnimState:Hide("HEAD_HAT")
            if inst.sg.statemem.talktask ~= nil then
                inst.sg.statemem.talktask:Cancel()
                inst.sg.statemem.talktask = nil
                StopTalkSound(inst)
            end
			inst.cancheckoutsky = false
			inst:RemoveTag("mk_miao")
			local hat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
			if hat ~=nil  and inst.components.inventory then
				inst.components.inventory:Equip(hat)
			end
        end,
    }
)



local function playzhu(inst,anim,loop)
    local onwater = inst:IsOnOcean(false)
    if onwater then
        inst.AnimState:HideSymbol("hound_maw")
        inst.AnimState:PlayAnimation("pigsy_water_"..anim,loop)
    else
        inst.AnimState:ShowSymbol("hound_maw")
        inst.AnimState:PlayAnimation("pigsy_"..anim,loop)
    end
end
local function mandatoryattackme(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 20,{ "_combat"},{"player","playerghost","INLIMBO","companion","pig"})
    for i, v in ipairs(ents) do
        if v and v:IsValid()
            and not (v.components.health ~= nil and
                    v.components.health:IsDead()) and  (GetTime() - (inst.mandatoryattacks[v] or -10) > 10 ) then
            v.components.combat:SetTarget(inst)
            inst.mandatoryattacks[v] = GetTime()
        end
    end
end

AddStategraphState('wilson',
    State{
        name = "pigsy_ridicule",
        tags = { "busy", "howling","notalking", "nomorph", "nopredict", "pig_zhuzhu"},

        onenter = function(inst, count)
            inst.Physics:Stop()
            playzhu(inst,"howl")
        end,

        timeline =
        {
            TimeEvent(0, function(inst) inst.SoundEmitter:PlaySound("myth_pigsound/sound/pig_grunt") end),
            TimeEvent(0.4, function(inst) 
                mandatoryattackme(inst)
            end),
        },
        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("pig_zhuzhu_idle")
            end),
        },
    }
)