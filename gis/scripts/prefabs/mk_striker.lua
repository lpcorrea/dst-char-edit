local assets =
{
    Asset("ANIM", "anim/lavaarena_shadow_lunge.zip"),
    Asset("ANIM", "anim/monkey_king.zip"),
    -- Asset("ANIM", "anim/monkey_king_lunge.zip"),
    Asset("ANIM", "anim/monkey_king_lunge_new.zip"),
    Asset("ANIM", "anim/mk_jgb.zip"),
}
local fxassets =
{
    Asset("ANIM", "anim/die.zip"),
    Asset("ANIM", "anim/mk_striker_disappearfx.zip"),
    Asset("ANIM", "anim/mk_striker_disappearfx_ear.zip"),
}
local prefabs =
{
    "statue_transition_2",
    "shadowstrike_slash_fx",
    "shadowstrike_slash2_fx",
    "weaponsparks",
}

local function doattack(inst,owner,target)
	if target and target:IsValid() and not target:IsInLimbo() and not (target.components.health ~= nil and target.components.health:IsDead()) then
		local fx  = SpawnPrefab( math.random() < 0.5 and "shadowstrike_slash_fx" or "shadowstrike_slash2_fx")
		if fx then
			fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
			fx.Transform:SetRotation(inst.Transform:GetRotation())
		end
		
		local fx2 = SpawnPrefab("weaponsparks")
        if  fx2 then
			if target:HasTag("largecreature") then
				fx2.Transform:SetScale(2, 2, 2)
			elseif not target:HasTag("smallcreature") then
				fx2.Transform:SetScale(1.5, 1.5, 1.5)
			--else
			end
			if target.components.combat and target.components.combat.hiteffectsymbol then
				fx2.entity:AddFollower()
				fx2.Follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0)
			else
                target:AddChild(fx2)
                fx2.Transform:SetPosition(0, 0, 0)
			end
		end
		if target.components.combat ~= nil then
			target.components.combat:GetAttacked(owner, 50, nil, "mk_striker")
		end
		inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon", nil, nil, true)
	end
end

local function Dolunge(inst,owner,target)
	inst.AnimState:PlayAnimation("lunge_loop")
	inst.Physics:SetMotorVel(25, 0, 0) --start
	inst:DoTaskInTime(7.2*FRAMES, function(inst)
		doattack(inst,owner,target)
	end)
	inst:DoTaskInTime(14.4*FRAMES, function(inst)
		inst.Physics:ClearMotorVelOverride()
		inst.AnimState:PlayAnimation("lunge_pst")
		inst:ListenForEvent("animover", inst.Remove)
	end)
end

local function attack(inst , owner, target )
    if inst.task ~= nil then
        inst.task:Cancel()
		inst:Show()
		inst.AnimState:PlayAnimation("lunge_pre")
		inst:DoTaskInTime(inst.AnimState:GetCurrentAnimationLength(), Dolunge, owner, target)
	end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddPhysics()
    inst.entity:AddNetwork()

    inst.Transform:SetFourFaced(inst)

    inst.AnimState:SetBank("lavaarena_shadow_lunge")
    inst.AnimState:SetBuild("monkey_king")
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

    inst:Hide()

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Attack = attack
	inst.persists = false
	inst.task = inst:DoTaskInTime(0, inst.Remove)

    return inst
end

local function setskinbuild(inst,build)
    inst.AnimState:SetBuild("mk_striker_disappearfx_"..build)
end

local function fxfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("die_fx")
    inst.AnimState:SetBuild("mk_striker_disappearfx")
	inst.AnimState:PlayAnimation("small")
	-- inst.AnimState:SetMultColour(1, 208/255, 80/255, .5)
	inst:AddTag("fx")

    inst:AddTag("NOBLOCK")

    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	inst.SoundEmitter:PlaySound("dontstarve/common/deathpoof")
	inst.persists = false
    inst.SetSkinBuild = setskinbuild
	inst:ListenForEvent("animover", inst.Remove)
    return inst
end
return Prefab("mk_striker", fn, assets, prefabs),
    --for compatibility with gem core mod ???
    --not understand
    Prefab("mk_striker_fx", fxfn, fxassets)
