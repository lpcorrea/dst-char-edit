local assets=
{ 
    Asset("ANIM", "anim/pigcorpse_fx.zip"),
}
local prefabs = 
{
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.Transform:SetFourFaced()

    inst.AnimState:SetBank("pigcorpse_fx")
    inst.AnimState:SetBuild("pigcorpse_fx")
    inst.AnimState:PlayAnimation("anim", false)

    inst.persists = true
    inst.entity:SetPristine()

    inst.lifetime = 21

    inst:AddTag("scppigcorpse")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:SetStateGraph("SGscppigcorpse")
    inst.sg:GoToState("idle")

    inst:AddComponent("scpinteractioncomponent")

    inst:DoPeriodicTask(1, function()
        inst.components.scpinteractioncomponent.lifetime = inst.components.scpinteractioncomponent.lifetime - 1
        if inst.components.scpinteractioncomponent.lifetime == 0 then
            inst:AddComponent("health")
            inst.components.health:SetMaxHealth(1)
            inst.components.health:Kill()
        end
    end)

    return inst
end

return Prefab( "custom_pigcorpse_fx", fn, assets, prefabs) 