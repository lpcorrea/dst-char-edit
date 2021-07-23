require("stategraphs/commonstates")

local events=
{    
    EventHandler("death", function(inst) inst.sg:GoToState("death") end),
    EventHandler("doattack", function(inst, target)
	if inst.ammo ~= 0 then
            if not inst.components.health:IsDead() and (inst.sg:HasStateTag("hit") or not inst.sg:HasStateTag("busy")) then 
            	inst.sg:GoToState("attack") 
	    end
	end
    end),
    CommonHandlers.OnDeath(),
    EventHandler("attacked", function(inst) 
        if not inst.components.health:IsDead() and not 
            inst.sg:HasStateTag("attack") then
            inst.sg:GoToState("hit") 
        end 
    end)
}

local states=
{   
    State{
        name = "idle",
        tags = {"idle", "canrotate"},
        onenter = function(inst)
	    if inst:HasTag("lvl1") then
		inst.AnimState:PlayAnimation("idle_loop", true)
	    end
	    if inst:HasTag("lvl2") then
		inst.AnimState:PlayAnimation("idle_loop_2", true)
	    end
	    if inst:HasTag("lvl3") then
		inst.AnimState:PlayAnimation("idle_loop_3", true)
	    end
        end, 
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },
    
	State{
        name = "death",
        tags = {"busy"},
        
        onenter = function(inst)  
        inst.components.lootdropper:DropLoot(Vector3(inst.Transform:GetWorldPosition()))
	    local fx = SpawnPrefab("collapse_small")
	    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
	    fx:SetMaterial("metal")
	    inst:Remove()
        end,

        timeline = 
        {
            TimeEvent(17*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/spark") end)
        },
    },    
        
    State{
        name = "hit",
        tags = {"hit"},
        
        onenter = function(inst)
	    if inst:HasTag("lvl1") then
		inst.AnimState:PlayAnimation("hit", true)
	    end
	    if inst:HasTag("lvl2") then
		inst.AnimState:PlayAnimation("hit2", true)
	    end
	    if inst:HasTag("lvl3") then
		inst.AnimState:PlayAnimation("hit3", true)
	    end
	end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },        
    },

    State
    { 
        name = "attack",
        tags = {"attack", "canrotate"},
        onenter = function(inst, target)
            inst.components.lighttweener:StartTween(nil, 0, .65, .7, nil, 0, function(inst, light) if light then light:Enable(true) end end)
            inst.components.lighttweener:StartTween(nil, 3.5, .9, .9, nil, .66, inst.dotweenin)
	    if inst:HasTag("lvl1") then
		inst.AnimState:PlayAnimation("atk", true)
	    end
	    if inst:HasTag("lvl2") then
		inst.AnimState:PlayAnimation("atk2", true)
	    end
	    if inst:HasTag("lvl3") then
		inst.AnimState:PlayAnimation("atk3", true)
	    end
        end,
       
        timeline=
        {
            TimeEvent(2*FRAMES, function(inst)
	        if inst.ammo ~= 0 and inst.components.combat.target and (inst:HasTag("lvl1") or inst:HasTag("lvl2") or inst:HasTag("lvl3")) then
		    inst:PushEvent("checkwep")
                    inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_bullet")
                    inst.components.combat:DoAttack()
	    	    inst.ammo = inst.ammo - 1
		    inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
	        end
            end),
            TimeEvent(4*FRAMES, function(inst)
	        if inst.ammo ~= 0 and inst.components.combat.target and (inst:HasTag("lvl2") or inst:HasTag("lvl3")) then
		    inst:PushEvent("checkwep")
                    inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_bullet")
		    inst.components.combat:DoAttack()
	    	    inst.ammo = inst.ammo - 1
		    inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
		end
            end),
            TimeEvent(6*FRAMES, function(inst)
	        if inst.ammo ~= 0 and inst.components.combat.target and (inst:HasTag("lvl1") or inst:HasTag("lvl2") or inst:HasTag("lvl3")) then
		    inst:PushEvent("checkwep")
                    inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_bullet")
                    inst.components.combat:DoAttack()
	    	    inst.ammo = inst.ammo - 1
		    inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
	        end
            end),
            TimeEvent(8*FRAMES, function(inst)
	        if inst.ammo ~= 0 and inst.components.combat.target and (inst:HasTag("lvl2") or inst:HasTag("lvl3")) then
		    inst:PushEvent("checkwep")
                    inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_bullet")
                    inst.components.combat:DoAttack()
	    	    inst.ammo = inst.ammo - 1
		    inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
	        end
	    end),
            TimeEvent(10*FRAMES, function(inst)
	        if inst.ammo ~= 0 and inst.components.combat.target and (inst:HasTag("lvl1") or inst:HasTag("lvl2") or inst:HasTag("lvl3")) then
		    inst:PushEvent("checkwep")
                    inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_bullet")
                    inst.components.combat:DoAttack()
	    	    inst.ammo = inst.ammo - 1
		    inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
	        end
	    end),
            TimeEvent(12*FRAMES, function(inst)
	        if inst.ammo ~= 0 and inst.components.combat.target and (inst:HasTag("lvl2") or inst:HasTag("lvl3")) then
		    inst:PushEvent("checkwep")
                    inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_bullet")
                    inst.components.combat:DoAttack()
	    	    inst.ammo = inst.ammo - 1
		    inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
	        end
	    end),
            TimeEvent(14*FRAMES, function(inst)
	    	if inst.ammo >= 2 and inst.components.combat.target and inst:HasTag("rocketsready") then
		    inst.AnimState:PlayAnimation("atk3_rockets", true)
		    inst:PushEvent("checkwep")
                    inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_rocket")
                    inst.components.combat:DoAttack()
	    	    inst.ammo = inst.ammo - 2
		    inst:RemoveTag("rocketsready")
		    inst:PushEvent("rocketsshot")
		    inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
		    inst:DoTaskInTime(2*FRAMES, function(inst)
		        inst:PushEvent("checkwep")
                        inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_rocket")
                        inst.components.combat:DoAttack()
		        inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
		    end)
		    inst:DoTaskInTime(4*FRAMES, function(inst)
		        inst:PushEvent("checkwep")
                        inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_rocket")
                        inst.components.combat:DoAttack()
		        inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
		    end)
		    inst:DoTaskInTime(6*FRAMES, function(inst)
		        inst:PushEvent("checkwep")
                        inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.weapon:SetProjectile("esentry_rocket")
                        inst.components.combat:DoAttack()
		        inst.SoundEmitter:PlaySound("dontstarve/creatures/rocklobster/explode")
		    end)
	        end
	    end),
            TimeEvent(13*FRAMES, function(inst)
		if inst:HasTag("lvl1") then
		    inst.AnimState:PlayAnimation("idle_loop", true)
		    inst.components.named:SetName("Sentry Gun lvl 1".."\n"..inst.ammo.." Rounds Remaining".."\n".."Current Health "..inst.components.health.currenthealth )
		end
		if inst:HasTag("lvl2") then
		    inst.AnimState:PlayAnimation("idle_loop_2", true)
		    inst.components.named:SetName("Sentry Gun lvl 2".."\n"..inst.ammo.." Rounds Remaining".."\n".."Current Health "..inst.components.health.currenthealth )
		end
		if inst:HasTag("lvl3") then
		    inst.AnimState:PlayAnimation("idle_loop_3", true)
		    inst.components.named:SetName("Sentry Gun lvl 3".."\n"..inst.ammo.." Rounds Remaining".."\n".."Current Health "..inst.components.health.currenthealth )
		end
	    end),
            TimeEvent(20*FRAMES, function(inst)
		if inst:HasTag("lvl1") then
		    inst.AnimState:PlayAnimation("idle_loop", true)
		    inst.components.named:SetName("Sentry Gun lvl 1".."\n"..inst.ammo.." Rounds Remaining".."\n".."Current Health "..inst.components.health.currenthealth )
		end
		if inst:HasTag("lvl2") then
		    inst.AnimState:PlayAnimation("idle_loop_2", true)
		    inst.components.named:SetName("Sentry Gun lvl 2".."\n"..inst.ammo.." Rounds Remaining".."\n".."Current Health "..inst.components.health.currenthealth )
		end
		if inst:HasTag("lvl3") then
		    inst.AnimState:PlayAnimation("idle_loop_3", true)
		    inst.components.named:SetName("Sentry Gun lvl 3".."\n"..inst.ammo.." Rounds Remaining".."\n".."Current Health "..inst.components.health.currenthealth )
		end
		inst:DoTaskInTime(SENTRY_ROF, function(inst)
		    inst.sg:GoToState("idle")
		end)
	    end),
        },

    },   
}
    
return StateGraph("esentry", states, events, "idle")