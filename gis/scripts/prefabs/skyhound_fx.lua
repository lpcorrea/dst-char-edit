assets = {
	Asset("ANIM", "anim/skyhound_fx.zip"),
}

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    -- MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("shadow_knight")
    -- inst.AnimState:SetBank("skyhound_fx")
    inst.AnimState:SetBuild("skyhound_fx")
    inst.AnimState:PlayAnimation("transform")

    inst:AddTag("CLASSIFIED")
    inst.persists = false
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst:ListenForEvent("animover", function()
    	inst:Remove()
    end)

    return inst
end

return Prefab("skyhound_fx", fn, assets)