local assets=
{ 
    Asset("ANIM", "anim/max_fx.zip"),
}
local prefabs = 
{
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("max_fx")
    inst.AnimState:SetBuild("max_fx")
    inst.AnimState:PlayAnimation("anim", false)

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")

    inst.persists = false
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:ListenForEvent("animover", function() inst:Remove() end)

    return inst
end

return Prefab( "custom_max_fx", fn, assets, prefabs) 