local assets =
{
    Asset("ANIM", "anim/pigsy_sleepbed.zip"),
	Asset("ATLAS", "images/inventoryimages/pigsy_sleepbed.xml"),
}

local function builder_onbuilt(inst, builder)
	if builder then 
		builder:PushEvent("pigsyyawn")
    end
end

local function fn()

    local inst = CreateEntity()

    inst.entity:AddTransform()

    inst:AddTag("CLASSIFIED")

    inst.persists = false

    inst:DoTaskInTime(0, inst.Remove)

    if not TheWorld.ismastersim then
        return inst
    end

    inst.OnBuiltFn = builder_onbuilt
    return inst
end

local function fxfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.entity:AddPhysics()
    inst.Physics:ClearCollisionMask()
    inst.Physics:SetSphere(1)
    inst.AnimState:SetBank("pigsy_sleepbed")
    inst.AnimState:SetBuild("pigsy_sleepbed")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetLayer(LAYER_WORLD_BACKGROUND)
	inst.Transform:SetScale(1.2, 1.2, 1.2)
    inst:AddTag("fx")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	inst.persists = false
    return inst
end

return Prefab("pigsy_sleepbed", fn),
Prefab("pigsy_sleepbed_fx", fxfn, assets)
