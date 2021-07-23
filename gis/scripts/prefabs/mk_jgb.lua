local assets =
{
    Asset("ANIM", "anim/mk_jgb.zip"),
    Asset("ATLAS", "images/inventoryimages/mk_jgb.xml"),
}

local fxassets =
{
    Asset("ANIM", "anim/lavaarena_staff_smoke_fx.zip"),
}

local smokeassets =
{
    Asset("ANIM", "anim/lavaarena_shadow_lunge.zip"),
    Asset("ANIM", "anim/monkey_king_lunge_new.zip"),
    Asset("ANIM", "anim/monkey_king_lunge_ear.zip"),
}

local prefabs =
{
    "reticuleline",
    "reticulelineping",
    "mk_jgb_fx",
}

local function onequip(inst, owner)
    inst.components.myth_itemskin:OverrideSymbol(owner, "swap_object")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function ReticuleTargetFn()
  local player = ThePlayer
  local ground = TheWorld.Map
  local pos = Vector3()
  --Cast range is 8, leave room for error
  --4 is the aoe range
  for r = 7, 0, -.25 do
    pos.x, pos.y, pos.z = player.entity:LocalToWorldSpace(r, 0, 0)
    if ground:IsPassableAtPoint(pos:Get()) and not ground:IsGroundTargetBlocked(pos) then
      return pos
    end
  end
  return pos
end

local function ReticuleMouseTargetFn(inst, mousepos)
    if mousepos ~= nil then
        local x, y, z = inst.Transform:GetWorldPosition()
        local dx = mousepos.x - x
        local dz = mousepos.z - z
        local l = dx * dx + dz * dz
        if l <= 0 then
            return inst.components.reticule.targetpos
        end
        l = 6.5 / math.sqrt(l)
        return Vector3(x + dx * l, 0, z + dz * l)
    end
end

local function ReticuleUpdatePositionFn(inst, pos, reticule, ease, smoothing, dt)
    local x, y, z = inst.Transform:GetWorldPosition()
    reticule.Transform:SetPosition(x, 0, z)
    local rot = -math.atan2(pos.z - z, pos.x - x) / DEGREES
    if ease and dt ~= nil then
        local rot0 = reticule.Transform:GetRotation()
        local drot = rot - rot0
        rot = Lerp((drot > 180 and rot0 + 360) or (drot < -180 and rot0 - 360) or rot0, rot, dt * smoothing)
    end
    reticule.Transform:SetRotation(rot)
end

local function lungefn(inst,doer, pos, targetpos)
    local hat = doer and doer.replica.inventory and doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    if hat and hat.prefab == 'golden_hat_mk' and hat.components.fueled then
        hat.components.fueled:DoDelta(-24)
    end

    doer.Transform:SetPosition(targetpos:Get())
    doer.components.bloomer:PopBloom("lunge")
    doer.components.colouradder:PopColour("lunge")
    doer:DoTaskInTime(1*FRAMES,function()
        
        local fx = SpawnPrefab("mk_jgb_teleportsmoke")
        fx.Transform:SetPosition(doer.Transform:GetWorldPosition())
        if inst.components.myth_itemskin.skin:value() == "ear" then
            fx.AnimState:AddOverrideBuild("monkey_king_lunge_ear")
        end
        fx.Transform:SetRotation(doer.Transform:GetRotation())

        doer.components.bloomer:PopBloom("lunge")
        doer.components.colouradder:PopColour("lunge")
    end)
    doer.sg:GoToState("mk_jgb_teleport_out")
end

local function Lunge(inst, doer, pos)
    SpawnAt("weaponsparks",pos)
	if doer.components.hunger ~= nil and not doer.replica.inventory:EquipHasTag('golden_hat_mk') then
		doer.components.hunger:DoDelta(-10)
	end
	inst.components.rechargeable:StartRecharging()
    
    SpawnAt("mk_phantom",doer):SetOwner(doer,inst.components.myth_itemskin:Default("swap"))
    lungefn(inst,doer, pos, pos)
end


local function onpickupfn(inst, pickupguy)
	if pickupguy and pickupguy:HasTag("player") and pickupguy.prefab ~= "monkey_king"then
		if pickupguy.components.inventory then
			pickupguy:DoTaskInTime(0, function()
				pickupguy.components.inventory:DropItem(inst, true, true)
			end)
		end
	end
end

local function rechargerate(inst)
	local rate = 1
	local owner = inst.components.inventoryitem:GetGrandOwner()
	if owner ~= nil and owner.replica.inventory ~= nil and owner.replica.inventory:EquipHasTag("golden_hat_mk") then
		rate = 0.85
	end	
	return rate 
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("mk_jgb.tex")
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("mk_jgb")
    inst.AnimState:SetBuild("mk_jgb")
    inst.AnimState:PlayAnimation("idle_none")

    inst:AddTag("sharp")
    inst:AddTag("pointy")
    inst:AddTag("mk_jgb")
    inst:AddTag("mk_nodrop")
    inst:AddTag("myth_removebydespwn")

    inst:AddTag("aoeweapon_lunge")
    inst:AddTag("rechargeable")
	
    inst:AddComponent("aoetargeting")
    inst.components.aoetargeting.reticule.reticuleprefab = "reticuleaoesmall"
    inst.components.aoetargeting.reticule.pingprefab = "reticuleaoesmallping"
    inst.components.aoetargeting.reticule.targetfn = ReticuleTargetFn
    inst.components.aoetargeting.reticule.validcolour = { 1, .75, 0, 1 }
    inst.components.aoetargeting.reticule.invalidcolour = { .5, 0, 0, 1 }
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true
    inst.components.aoetargeting:SetRange(15)

    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'monkey_king'
    inst.components.myth_itemskin.prefab = 'mk_jgb'
    local atlas = "images/inventoryimages/mk_jgb.xml"
    inst.components.myth_itemskin:SetData{
        sea = {
            swap = {build = "mk_jgb", folder = "swap_sea"},
            icon = {atlas = atlas, image = "mk_jgb_sea"},
            anim = {bank = "mk_jgb", build = "mk_jgb", anim = "idle_sea"},
        },
        fire = {
            swap = {build = "mk_jgb", folder = "swap_fire"},
            icon = {atlas = atlas, image = "mk_jgb_fire"},
            anim = {bank = "mk_jgb", build = "mk_jgb", anim = "idle_fire"},
        },
        opera = {
            swap = {build = 'mk_jgb', folder = "swap_opera"},
            icon = {atlas = atlas, image = "mk_jgb_opera"},
            anim = {bank = "mk_jgb", build = "mk_jgb", anim = "idle_opera"},
        },
        ear = {
            swap = {build = 'mk_jgb', folder = "swap_ear"},
            icon = {atlas = atlas, image = "mk_jgb_ear"},
            anim = {bank = "mk_jgb", build = "mk_jgb", anim = "idle_ear"},
        },
        default = {
            swap = {build = "mk_jgb", folder = "swap_none"},
            icon = {atlas = atlas, image = "mk_jgb_none"},
            anim = {bank = "mk_jgb", build = "mk_jgb", anim = "idle_none"},
        },
    }
	
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(59.5)
	inst.components.weapon:SetRange(0.9, 0.9)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "mk_jgb"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/mk_jgb.xml"
	inst.components.inventoryitem.onpickupfn = onpickupfn

    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "monkey_king"
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

	inst:AddComponent("myth_aoespell")
    inst.components.aoespell = inst.components.myth_aoespell
	inst.components.aoespell:SetSpellFn(Lunge)
	inst:RegisterComponentActions("aoespell")
	
	inst:AddComponent("myth_rechargeable")
    inst.components.rechargeable = inst.components.myth_rechargeable
	inst.components.rechargeable:SetRechargeTime(15)
	inst.components.rechargeable:SetRechargeRate(rechargerate)
	inst:RegisterComponentActions("rechargeable")

    MakeHauntableLaunch(inst)

    return inst
end

local RADIUS = 1.0

local function DoDamage(inst, targets, doer, weapon)
	local x, y, z = inst.Transform:GetWorldPosition()
    if inst.AnimState ~= nil then
		inst.AnimState:PlayAnimation("idle")
		inst:Show()
		inst:DoTaskInTime(0.7 + 2 * FRAMES, inst.Remove)
    else
        inst:DoTaskInTime(2 * FRAMES, inst.Remove)
	end
    for i, v in ipairs(TheSim:FindEntities(x, 0, z, RADIUS + 3, {"_combat", }, { "playerghost", "INLIMBO", "player","companion","wall" })) do
        if not targets[v] and v:IsValid() and not v:IsInLimbo() and not (v.components.health ~= nil and v.components.health:IsDead()) then
            local vradius = v:GetPhysicsRadius(.5)
            local range = RADIUS + vradius
            if v:GetDistanceSqToPoint(x, y, z) < range * range then
                if doer ~= nil and doer:IsValid() and doer.components.combat and doer.components.combat:CanTarget(v) then
                    targets[v] = true
					doer:PushEvent("onareaattackother", { target = v, weapon = weapon or nil, stimuli = "mk_jgb" })
					local num = doer and doer.replica.inventory ~= nil and doer.replica.inventory:EquipHasTag("golden_hat_mk") and 1.5 or 1
					v.components.combat:GetAttacked(doer, 100*num, weapon, "mk_jgb")
                end
            end
        end
    end
end

local function Trigger(inst, delay, targets,doer,weapon)
    if inst.task ~= nil then
        inst.task:Cancel()
        if (delay or 0) > 0 then
            inst.task = inst:DoTaskInTime(delay, DoDamage, targets or {}, doer, weapon)
        else
            DoDamage(inst, targets or {}, doer, weapon)
        end
    end
end

local function fxfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	inst:AddTag("FX")
	inst:AddTag("NOCLICK")

	inst.AnimState:SetBank("lavaarena_staff_smoke_fx")
	inst.AnimState:SetBuild("lavaarena_staff_smoke_fx")
	inst.AnimState:SetAddColour(1, 1, 0, 0)
	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
	inst:Hide()
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	inst.persists = false
	
	inst.task = inst:DoTaskInTime(0, inst.Remove)
	inst.Trigger = Trigger  
	return inst
end

-----------------------------------------------------------------------------
local brain = require "brains/eyeturretbrain"
local fxskin = {
    monkey_king_ear = "ear",
}

local function PhantomLunge(inst,target)
    local x,y,z = target.Transform:GetWorldPosition()
    local r = 6
    local du = math.random(180)
    inst:StartThread(function()
        for k = 1, 4 do  
            local g = du + k* 90 
            local striker = SpawnPrefab("mk_striker")
            if striker then
                striker.Transform:SetPosition(x+ r*math.cos(2*math.pi/360*g),0,z+r*math.sin(2*math.pi/360*g))
                striker.AnimState:SetBuild(inst.AnimState:GetBuild())
                local fx = SpawnPrefab("mk_striker_fx")
                fx.Transform:SetPosition(striker.Transform:GetWorldPosition())
                if fxskin[inst.AnimState:GetBuild()] ~= nil then
                    fx:SetSkinBuild(fxskin[inst.AnimState:GetBuild()])
                end
                striker:ForceFacePoint(x, 0, z)
                if striker.Attack then
                    striker:Attack(inst,target)
                end
                Sleep(.15)
            end
        end
    end)
end

local function PhantomHitOtherFn(inst, target,damage, stimuli)
    if stimuli and (stimuli == "mk_striker" or stimuli == "bramblefx_mk" )then
        return
    end
    if not target:IsValid() then
        return
    end
    if not target.monkey_kinghit then
        target.monkey_kinghit = 1
    elseif target.monkey_kinghit == 5 then
        PhantomLunge(inst,target)
        target.monkey_kinghit = 0
    else
        target.monkey_kinghit = target.monkey_kinghit + 1
    end
end

local function PhantomRetargetFn(inst)
    local owner = inst.owner
    local owner_target = owner and owner.components.combat.target

    return FindEntity(inst, 20,
        function(guy)
            return inst.components.combat:CanTarget(guy)
                and guy ~= owner
                and (
                        (owner_target ~= nil and guy == owner_target) or
                        (guy.components.combat.target ~= nil and guy.components.combat.target == owner) or 
                        (not guy:HasTag("player") and guy.components.combat.target ~= nil and guy.components.combat.target == inst)
                    )
        end,
        { "_combat" }, --see entityreplica.lua
        { "INLIMBO"}
    )
end

local function PhantomShouldKeepTarget(inst, target)
    return target ~= nil
        and target:IsValid()
        and target ~= inst.owner
        and target.components.health ~= nil
        and not target.components.health:IsDead()
        and inst:IsNear(target, 8)
end

local function phantomfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()

    MakeCharacterPhysics(inst, 75, .5)

    inst.DynamicShadow:SetSize(1.3, .6)

    --inst.nameoverride = "monkey_king"

    inst:AddTag("scarytoprey")
    inst:AddTag("character")
    inst:AddTag("companion")
	inst:AddTag("notraptrigger")

    inst.Transform:SetFourFaced()

    inst.AnimState:SetBank("wilson")
    inst.AnimState:SetBuild("monkey_king")
    inst.AnimState:PlayAnimation("idle")

    inst.AnimState:Hide("HAT")
    inst.AnimState:Hide("HAIR_HAT")
    inst.AnimState:Show("HAIR_NOHAT")
    inst.AnimState:Show("HAIR")
    inst.AnimState:Show("HEAD")
    inst.AnimState:Hide("HEAD_HAT")

    inst.AnimState:OverrideSymbol("fx_wipe", "wilson_fx", "fx_wipe")
    inst.AnimState:OverrideSymbol("fx_liquid", "wilson_fx", "fx_liquid")
    inst.AnimState:OverrideSymbol("shadow_hands", "shadow_hands", "shadow_hands")
    inst.AnimState:OverrideSymbol("snap_fx", "player_actions_fishing_ocean_new", "snap_fx")

    --Additional effects symbols for hit_darkness animation
    inst.AnimState:AddOverrideBuild("player_hit_darkness")
    inst.AnimState:AddOverrideBuild("player_receive_gift")
    inst.AnimState:AddOverrideBuild("player_actions_uniqueitem")
    inst.AnimState:AddOverrideBuild("player_wrap_bundle")
    inst.AnimState:AddOverrideBuild("player_lunge")
    inst.AnimState:AddOverrideBuild("player_attack_leap")
    inst.AnimState:AddOverrideBuild("player_superjump")
    inst.AnimState:AddOverrideBuild("player_multithrust")
    inst.AnimState:AddOverrideBuild("player_parryblock")
    inst.AnimState:AddOverrideBuild("player_emote_extra")
    inst.AnimState:AddOverrideBuild("player_boat")
    inst.AnimState:AddOverrideBuild("player_boat_plank")
    inst.AnimState:AddOverrideBuild("player_boat_net")        
    inst.AnimState:AddOverrideBuild("player_boat_sink")
    inst.AnimState:AddOverrideBuild("player_oar")
    inst.AnimState:AddOverrideBuild("player_peruse")

    inst.AnimState:AddOverrideBuild("player_actions_fishing_ocean_new")

    -- inst.AnimState:OverrideSymbol("swap_object", "mk_jgb",inst.components.myth_itemskin:Default("swap"))
    inst.AnimState:Show("ARM_carry")
    inst.AnimState:Hide("ARM_normal")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst.persists = false

    inst:AddComponent("lootdropper")

    inst:AddComponent("follower")

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(250)

    inst:AddComponent("combat")
    inst.components.combat:SetDefaultDamage(59)
    inst.components.combat:SetRetargetFunction(1, PhantomRetargetFn)
    inst.components.combat:SetKeepTargetFunction(PhantomShouldKeepTarget)
    inst.components.combat:SetAttackPeriod(0.33)
    inst.components.combat:SetRange(2.9)

    inst.components.combat.onhitotherfn = PhantomHitOtherFn
    inst.components.combat.hiteffectsymbol = "torso"
    inst.components.combat.pvp_damagemod = TUNING.PVP_DAMAGE_MOD 

    inst:AddComponent("inspectable")

    inst:SetStateGraph("SGmk_phantom")
    inst:SetBrain(brain)

    inst.SetOwner = function(self,owner,swaphandbuild)
        self.owner = owner
        self.AnimState:OverrideSymbol("swap_object", "mk_jgb",swaphandbuild)
        inst.AnimState:SetBuild(owner.AnimState:GetBuild())
        inst.components.health:SetMaxHealth(owner.components.health.maxhealth)
        inst.components.health:SetCurrentHealth(owner.components.health.currenthealth)
    end

    inst.TauntTask = inst:DoPeriodicTask(0.2,function()
        local x,y,z = inst.Transform:GetWorldPosition()
        for k,v in pairs(TheSim:FindEntities(x,y,z,20,{"_combat"},{"bird_mutant"})) do 
            if v:HasTag("hostile") or (inst.owner and v.components.combat.target and v.components.combat.target == inst.owner) then 
                v.components.combat:SetTarget(inst)
            end
        end
    end)

    inst:DoTaskInTime(0,function()
        if not (inst.owner and inst.owner:IsValid()) then 
            inst.WantToRemove = true
            if inst.TauntTask then 
                inst.TauntTask:Cancel()
                inst.TauntTask = nil 
            end 
        end
    end)

    inst:DoTaskInTime(3,function()
        inst.WantToRemove = true
        if inst.TauntTask then 
            inst.TauntTask:Cancel()
            inst.TauntTask = nil 
        end 
    end)

    inst.sounds = {
        hit = "MK/sfx/hurt",
        death = "MK/sfx/death_voice",
        emote = "MK/sfx/emote",
    }

    return inst
end

local function smokefn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddPhysics()
    inst.entity:AddNetwork()

    inst.Transform:SetFourFaced()

    inst.AnimState:SetBank("lavaarena_shadow_lunge")
    inst.AnimState:SetBuild("monkey_king")
    inst.AnimState:PlayAnimation("lunge_pst")

    inst.AnimState:SetTime(2 * FRAMES)
        

    inst.AnimState:AddOverrideBuild("monkey_king_lunge_new")
    
    inst.AnimState:OverrideSymbol("swap_object", "mk_jgb", "swap_none")
    inst.AnimState:Hide("HAT")
    inst.AnimState:Hide("HAIR_HAT")
    
    inst.AnimState:Hide("HAIR_NOHAT")
    inst.AnimState:Hide("HAIR")
    inst.AnimState:Hide("HEAD")
    inst.AnimState:Show("HEAD_HAT")

    inst.Physics:SetMass(1)
    inst.Physics:SetFriction(0)
    inst.Physics:SetDamping(5)
    inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.GROUND)
    inst.Physics:SetCapsule(.5, 1)

    inst:AddTag("scarytoprey")
    inst:AddTag("NOBLOCK")

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
    
    inst.persists = false
    inst:ListenForEvent("animover", inst.Remove)

    return inst
end

return Prefab("mk_jgb", fn, assets,prefabs),
		Prefab("mk_jgb_fx", fxfn, fxassets),
        Prefab("mk_phantom", phantomfn, assets),
        Prefab("mk_jgb_teleportsmoke",smokefn,smokeassets)