require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/esentry.zip"),
    Asset("ANIM", "anim/swap_engie_building.zip"),
    Asset("ANIM", "anim/esentry_item.zip"),
}

local prefabs =
{
    "esentry_bullet",
    "esentry_rocket",
    "scrap",
    "gunpowder",
}

local brain = require "brains/eyeturretbrain" --borrow

local function OnHealthDelta(inst, data)
    if inst:HasTag("lvl1") then
	inst.components.named:SetName("Sentry Gun lvl 1".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
    end
    if inst:HasTag("lvl2") then
	inst.components.named:SetName("Sentry Gun lvl 2".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
    end
    if inst:HasTag("lvl3") then
	inst.components.named:SetName("Sentry Gun lvl 3".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
    end
end

local function EquipWeapon(inst)
    if inst.components.inventory and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
        local weapon = CreateEntity()
        --[[Non-networked entity]]
        weapon.entity:AddTransform()
        weapon:AddComponent("weapon")
	if inst:HasTag("lvl1") then
            weapon.components.weapon:SetDamage(SENTRY_DAMAGE)
	end
	if inst:HasTag("lvl2") then
            weapon.components.weapon:SetDamage(SENTRY_DAMAGE + 4)
	end
	if inst:HasTag("lvl3") then
            weapon.components.weapon:SetDamage(SENTRY_DAMAGE + 6)
	end
        weapon.components.weapon:SetRange(inst.components.combat.attackrange, inst.components.combat.attackrange+4)
	    weapon.components.weapon:SetProjectile("esentry_bullet")
        weapon:AddComponent("inventoryitem")
        weapon.persists = false
        weapon.components.inventoryitem:SetOnDroppedFn(weapon.Remove)
        weapon:AddComponent("equippable")
        inst.components.inventory:Equip(weapon)
    end
end

local function retargetfn(inst)
    EquipWeapon(inst)
    local playertargets = {}
    for i, v in ipairs(AllPlayers) do
        if v.components.combat.target ~= nil then
            playertargets[v.components.combat.target] = true
        end
    end

    if SENTRY_FF == "noff" then
----------friendly fire OFF--------------
    return FindEntity(inst, SENTRY_RANGE,
        function(guy)
            return not guy:HasTag("player") and inst.components.combat:CanTarget(guy)
                and (playertargets[guy] or guy:HasTag("hostile") or
                    (guy.components.combat.target ~= nil and guy.components.combat.target:HasTag("player") or 
		     guy.components.combat.target ~= nil and guy.components.combat.target:HasTag("esentry")))
        end,
        { "_combat" },
        { "INLIMBO", "engie", "esentry", "wall", }
    )
----------friendly fire ON--------------
    elseif SENTRY_FF == "yesff" then
    return FindEntity(inst, SENTRY_RANGE,
        function(guy)
            return inst.components.combat:CanTarget(guy)
                and (playertargets[guy] or guy:HasTag("hostile") or
                    (guy.components.combat.target ~= nil and guy.components.combat.target:HasTag("player") or 
		     guy.components.combat.target ~= nil and guy.components.combat.target:HasTag("esentry")))
        end,
        { "_combat" },
        { "INLIMBO", "engie", "esentry", "wall", }
    )
	end
end

local function shouldKeepTarget(inst, target)
    return target ~= nil
        and target:IsValid()
        and target.components.health ~= nil
        and not target.components.health:IsDead()
        and inst:IsNear(target, SENTRY_RANGE)
end

local function OnAttacked(inst, data)
    local attacker = data ~= nil and data.attacker or nil
    local attackerID = attacker.engieID or nil

    if SENTRY_FF == "noff" then
    if attacker ~= nil and not attacker:HasTag("player") and (attackerID == nil or attackerID ~= inst.turretID) then
	EquipWeapon(inst)
        inst.components.combat:SetTarget(attacker)
    end
    elseif SENTRY_FF == "yesff" then
    if attacker ~= nil and (attackerID == nil or attackerID ~= inst.turretID) then
	EquipWeapon(inst)
        inst.components.combat:SetTarget(attacker)
    end
    end

end

local function lighttweencb(inst, light)
    if light ~= nil then
        light:Enable(false)
    end
end

local function dotweenin(inst, l)
    inst.components.lighttweener:StartTween(nil, 0, .65, .7, nil, 0.15, lighttweencb)
end

local function onbuilt(inst, builder)
	if builder and builder.engieID then
		print(builder.engieID)
		inst.turretID = builder.engieID
		builder:PushEvent("engiebuilding")
	end
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle_loop", true)
    inst.components.named:SetName("Sentry Gun lvl 1".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
end

local function upgrade(inst)
    local item = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil
    if inst.upgradelevel < 30 then
	inst.components.named:SetName("Sentry Gun lvl 1".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
    end
    if inst.upgradelevel >= 30 and inst.upgradelevel < 70 then
	inst:AddTag("lvl2")
	inst:RemoveTag("lvl1")
	inst.components.named:SetName("Sentry Gun lvl 2".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
	inst.components.health:SetMaxHealth(SENTRY_HEALTH * 2)
	inst.AnimState:PlayAnimation("upgrade2")
	inst.AnimState:PushAnimation("idle_loop_2", true)

	if item ~= nil then
	    inst.components.inventory:DropItem(item)
	    EquipWeapon(inst)
	end
    end
    if inst.upgradelevel >= 70 then
	inst:AddTag("lvl3")
	inst:AddTag("rocketsready")
	inst:RemoveTag("lvl1")
	inst:RemoveTag("lvl2")
	inst.components.named:SetName("Sentry Gun lvl 3".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
	inst.components.health:SetMaxHealth(SENTRY_HEALTH * 3)
	inst.AnimState:PlayAnimation("upgrade3")
	inst.AnimState:PushAnimation("idle_loop_3", true)
	if item ~= nil then
	    inst.components.inventory:DropItem(item)
	    EquipWeapon(inst)
	end
    end
end

local function onsave(inst, data)
    data.upgradelevel = inst.upgradelevel
    data.ammo = inst.ammo
	data.turretID = inst.turretID
end

local function onload(inst, data)
    inst.upgradelevel = data.upgradelevel
    inst.ammo = data.ammo
	inst.turretID = data.turretID
    upgrade(inst)
end

local function IsScrap(item)
    return item.prefab == "scrap"
end

local function IsGunpowder(item)
    return item.prefab == "gunpowder"
end

local function workup(inst, worker)
    local scrapstack = worker.components.inventory:FindItem(IsScrap)
    if scrapstack ~= nil then
	worker.components.inventory:ConsumeByName("scrap", 1)
	inst.upgradelevel = inst.upgradelevel + 1
	if inst.upgradelevel == 30 or inst.upgradelevel == 70 then
	    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
	    upgrade(inst)
	end
    end
end

local function onhammered(inst)
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
    for k,v in pairs(Ents) do
	if v and v.engieID == inst.turretID then
		v:PushEvent("engiebuilding")
	end
    end
end

local function onhit(inst, worker)
    if not (worker:HasTag("engie") or worker:HasTag("spy")) then
	inst.components.workable:SetWorkLeft(4)
	return
    end

    if inst:HasTag("lvl1") then
	inst.AnimState:PlayAnimation("hit")
    end
    if inst:HasTag("lvl2") then
	inst.AnimState:PlayAnimation("hit2")
    end
    if inst:HasTag("lvl3") then
	inst.AnimState:PlayAnimation("hit3")
    end

    if worker.replica.inventory ~= nil and worker.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) ~= nil and worker.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).prefab == "tf2wrench" then
	worker.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS).components.finiteuses:Use(1)
	inst.components.workable:SetWorkLeft(4)
        local gpstack = worker.components.inventory:FindItem(IsGunpowder)
        local scrapstack = worker.components.inventory:FindItem(IsScrap)

	if inst.components.health.currenthealth ~= inst.components.health.maxhealth then
	    if scrapstack ~= nil then
		worker.components.inventory:ConsumeByName("scrap", 1)
		inst.components.health.currenthealth = inst.components.health.currenthealth + 5
		if inst.components.health.currenthealth >= inst.components.health.maxhealth then
		    inst.components.health.currenthealth = inst.components.health.maxhealth
		end
		inst.components.named:SetName("Sentry Gun lvl 1".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
	    end
	end

	if gpstack ~= nil then
	    if inst:HasTag("lvl1") and inst.ammo < 100 then
	        worker.components.inventory:ConsumeByName("gunpowder", 1)
		inst.ammo = inst.ammo + 10
	    	inst.SoundEmitter:PlaySound("dontstarve/common/birdcage_craft")
		if inst.ammo >= 100 then
		    inst.ammo = 100
		end
		inst.components.named:SetName("Sentry Gun lvl 1".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health "  )
		return
	    end
	    if inst:HasTag("lvl2") and inst.ammo < 200 then
	        worker.components.inventory:ConsumeByName("gunpowder", 1)
		inst.ammo = inst.ammo + 20
	    	inst.SoundEmitter:PlaySound("dontstarve/common/birdcage_craft")
		if inst.ammo >= 200 then
		    inst.ammo = 200
		end
		inst.components.named:SetName("Sentry Gun lvl 2".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
		return
	    end
	    if inst:HasTag("lvl3") and inst.ammo < 300 then
	        worker.components.inventory:ConsumeByName("gunpowder", 1)
		inst.ammo = inst.ammo + 30
	    	inst.SoundEmitter:PlaySound("dontstarve/common/birdcage_craft")
		if inst.ammo >= 300 then
		    inst.ammo = 300
		end
		inst.components.named:SetName("Sentry Gun lvl 3".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
		return
	    end
	end

	if scrapstack ~= nil then
	    if inst:HasTag("lvl1") and inst.ammo < 100 then
	        worker.components.inventory:ConsumeByName("scrap", 1)
		inst.ammo = inst.ammo + 5
	    	inst.SoundEmitter:PlaySound("dontstarve/common/birdcage_craft")
		if inst.ammo >= 100 then
		    inst.ammo = 100
		end
		inst.components.named:SetName("Sentry Gun lvl 1".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
		return
	    end
	    if inst:HasTag("lvl2") and inst.ammo < 200 then
	        worker.components.inventory:ConsumeByName("scrap", 1)
		inst.ammo = inst.ammo + 10
	    	inst.SoundEmitter:PlaySound("dontstarve/common/birdcage_craft")
		if inst.ammo >= 200 then
		    inst.ammo = 200
		end
		inst.components.named:SetName("Sentry Gun lvl 2".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
		return
	    end
	    if inst:HasTag("lvl3") and inst.ammo < 300 then
	        worker.components.inventory:ConsumeByName("scrap", 1)
		inst.ammo = inst.ammo + 15
	    	inst.SoundEmitter:PlaySound("dontstarve/common/birdcage_craft")
		if inst.ammo >= 300 then
		    inst.ammo = 300
		end
		inst.components.named:SetName("Sentry Gun lvl 3".."\n"..inst.ammo.." Rounds Remaining".."\n"..inst.components.health.currenthealth.." Health " )
		return
	    end
	end
	if not inst:HasTag("lvl3") then
	    inst.tick = 0
            while inst.tick ~= 5 and not inst:HasTag("lvl3") do
               workup(inst, worker)
	       inst.tick = inst.tick + 1
            end
	end
    end
end

local function resetrockets(inst)
    if inst.rockettask == nil then
	inst.rockettask = inst:DoTaskInTime(5, function(inst)
	    inst:AddTag("rocketsready")
	    inst.rockettask:Cancel()
	    inst.rockettask = nil
	end)
    end
end

local function ondeath(inst)
    for k,v in pairs(Ents) do
	    if v and v.engieID == inst.turretID then
	    v:PushEvent("engiebuilding")
		if v.components.sanity ~= nil then
		v.components.sanity:DoDelta(-TUNING.ENGIE_BUILDINGLOSS)--TUNING.SANITY_LARGE
		end
        v.components.talker:Say(GetString(v, "ANNOUNCE_SENTRY_DOWN"))
	    end
    end
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
	
    if owner.components.health ~= nil and
    not owner.components.health:IsDead() then
	owner.components.talker:Say(GetString(owner, "ANNOUNCE_REPLANTING"))
	end
end

local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_body", "swap_engie_building", "swap_body")

	owner.components.talker:Say(GetString(owner, "ANNOUNCE_PACKINGUP"))
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLight()
    inst.entity:AddNetwork()
    MakeObstaclePhysics(inst, 1)

    inst.no_wet_prefix = true

    inst.MiniMapEntity:SetIcon("esentry.tex")

    inst.AnimState:SetBank("esentry")
    inst.AnimState:SetBuild("esentry")
    inst.AnimState:PlayAnimation("idle_loop", true)

    inst:AddTag("structure")
    inst:AddTag("eyeturret")
    inst:AddTag("companion")
    inst:AddTag("esentry")
    inst:AddTag("lvl1")
    inst:AddTag("ebuild")
	inst:AddTag("nonpotatable")
    inst:AddTag("heavy")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventory")
    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
    inst:AddComponent("named")

    inst:AddComponent("engieworkable")
    inst.components.engieworkable:SetWorkAction(ACTIONS.ENGIEWORKABLE)

    inst:AddComponent("lighttweener")
    inst.components.lighttweener:StartTween(inst.Light, 0, .65, .7, {251/255, 234/255, 234/255}, 0, lighttweencb)

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(SENTRY_HEALTH)
    inst.components.health.canheal = false

    local modname = KnownModIndex:GetModActualName("The Engineer")
    local sentryhregen = GetModConfigData("sentryh_regen", modname)
    if sentryhregen == "y" then
	inst.components.health:StartRegen(20, 1)
    end

    inst:AddComponent("combat")
    inst.components.combat:SetRange(SENTRY_RANGE)
    inst.components.combat:SetDefaultDamage(SENTRY_DAMAGE)
    inst.components.combat:SetAttackPeriod(SENTRY_ROF)
    inst.components.combat:SetRetargetFunction(0, retargetfn)
    inst.components.combat:SetKeepTargetFunction(shouldKeepTarget)

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetMaxWork(4)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
    inst.components.workable.destroyed = "NODESTROY" --Hack to prevent workable:Destroy() only

    MakeHauntableFreeze(inst)

    inst:SetStateGraph("SGesentry")
    inst:SetBrain(brain)

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnBuiltFn = onbuilt

    inst:ListenForEvent("attacked", OnAttacked)
    inst:ListenForEvent("rocketsshot", resetrockets)
    inst:ListenForEvent("checkwep", EquipWeapon)
    inst:ListenForEvent("healthdelta", OnHealthDelta)
	inst:ListenForEvent("death", ondeath)
	inst:ListenForEvent("onsink", onhammered) --Cheat

    inst.dotweenin = dotweenin
    inst.upgradelevel = 0
    inst.ammo = 100
    inst.checkammo = inst:DoPeriodicTask(.1, function(inst)
	if inst.ammo == 0 then
	    if math.random() > .90 then
	        local x,y,z = inst.Transform:GetWorldPosition()
	        SpawnPrefab("sparks").Transform:SetPosition(x + math.random(), 1.75, z + math.random())
	    end
	end
    end)
	---------------------------------------
	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem:SetSinks(true)
	inst.components.inventoryitem.imagename = "esentry_item"	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/esentry_item.xml"

	inst:AddComponent("heavyobstaclephysics")
    inst.components.heavyobstaclephysics:SetRadius(1)
    inst.components.heavyobstaclephysics:MakeSmallObstacle()

	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.walkspeedmult = TUNING.TOOLBOX_SPEED_MULT--HEAVY_SPEED_MULT
	inst.components.equippable.restrictedtag = "engie"
    ---------------------------------------
    return inst
end


return Prefab("common/esentry", fn, assets, prefabs)--,
--	MakePlacer("common/esentry_placer", "esentry_item", "esentry_item", "idle")