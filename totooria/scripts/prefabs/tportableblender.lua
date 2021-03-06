require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/portable_blender.zip"),
}
local prefabs_item =
{
    "portableblender",
}

---------------------------------------------------------------
---------------- Inventory Portable Blender -------------------
---------------------------------------------------------------

local function ondeploy(inst, pt, deployer)
    local blender = SpawnPrefab("portableblender")--转换到原厨具
    if blender ~= nil then
        blender.Physics:SetCollides(false)
        blender.Physics:Teleport(pt.x, 0, pt.z)
        blender.Physics:SetCollides(true)
        blender.AnimState:PlayAnimation("place")
        blender.AnimState:PushAnimation("idle", false)
        blender.SoundEmitter:PlaySound("dontstarve/common/together/portable/blender/place")
        inst:Remove()
        PreventCharacterCollisionsWithPlacedObjects(blender)
    end
end

local function on_start_float(inst)
    inst.AnimState:HideSymbol("shadow_ground")
end

local function on_stop_float(inst)
    inst.AnimState:ShowSymbol("shadow_ground")
end

local function itemfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("portable_blender")
    inst.AnimState:SetBuild("portable_blender")
    inst.AnimState:PlayAnimation("idle_ground")

    inst:AddTag("portableitem")

    MakeInventoryFloatable(inst, nil, 0.05, 0.7)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages1.xml"
    inst.components.inventoryitem.imagename = "portableblender_item"

    inst:AddComponent("deployable")
    inst.components.deployable.restrictedtag = "masterchef"
    inst.components.deployable.ondeploy = ondeploy
    --inst.components.deployable:SetDeployMode(DEPLOYMODE.ANYWHERE)
    --inst.components.deployable:SetDeploySpacing(DEPLOYSPACING.NONE)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    MakeMediumBurnable(inst)
    MakeSmallPropagator(inst)

    inst:ListenForEvent("floater_startfloating", on_start_float)
    inst:ListenForEvent("floater_stopfloating", on_stop_float)

    return inst
end

return MakePlacer("tportableblender_item_placer", "portable_blender", "portable_blender", "idle"),
    Prefab("tportableblender_item", itemfn, assets, prefabs_item)
