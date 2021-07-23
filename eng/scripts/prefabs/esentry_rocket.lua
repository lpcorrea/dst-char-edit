local assets =
{}

local function OnHit(inst, attacker, other)
    SpawnPrefab("explode_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
    SpawnPrefab("impact").Transform:SetPosition(inst.Transform:GetWorldPosition())

    local modname = KnownModIndex:GetModActualName("The Engineer")
    local rocketsplashdmg = GetModConfigData("rocketsplashdmg", modname)

    if rocketsplashdmg == "y" then
    FindEntity(inst, 5, function(other) --Add range config option later
        if other.components.combat ~= nil and not (other.components.health ~= nil and other.components.health:IsDead()) and not other:HasTag("eyeturret") and not other:HasTag("player") and not other:HasTag("wall") then
           other.components.combat:GetAttacked(inst, 5, nil) --Damage
        end
    end)
    end

    inst.pufftask:Cancel()
    inst.pufftask = nil
    inst:Remove()
end

local function OnThrown(inst)
    inst.pufftask = inst:DoPeriodicTask(0, function(inst)
    	local x, y, z = inst.Transform:GetWorldPosition()
    	local fx = SpawnPrefab("lucy_transform_fx")
	fx.Transform:SetScale(.5, .5, .5)
    	fx.Transform:SetPosition(x, y+1.35, z)
	fx.persists = false
    end)
    inst:DoTaskInTime(10, function(inst)
        SpawnPrefab("explode_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
        SpawnPrefab("impact").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.pufftask:Cancel()
	inst.pufftask = nil
        inst:Remove()
    end)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.entity:AddLight()

    MakeInventoryPhysics(inst)
    inst.entity:AddPhysics()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.Transform:SetTwoFaced()

    inst.AnimState:SetBank("projectile")
    inst.AnimState:SetBuild("staff_projectile")
    inst.AnimState:PlayAnimation("fire_spin_loop", true)

    inst.Light:SetFalloff(0.7)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(0.5)
    inst.Light:SetColour(237/255, 237/255, 209/255)

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(30)
    inst.components.projectile:SetHoming(true)
    inst.components.projectile:SetHitDist(1)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnMissFn(inst.Remove)
    inst.components.projectile:SetOnThrownFn(OnThrown)
    inst.components.projectile:SetLaunchOffset(Vector3(math.random(-2,2), math.random(0,1), 0))

    inst:AddTag("projectile")
    inst:AddTag("NOCLICK")
    inst:AddTag("FX")
    inst.persists = false

    return inst
end

return Prefab("common/inventory/esentry_rocket", fn, assets)