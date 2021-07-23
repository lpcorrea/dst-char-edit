local assets = {
    Asset("ANIM", "anim/wb_heart.zip")
}

local function creatarmor(name)

    local assets = {
        Asset("ANIM", "anim/"..name..".zip"),
        Asset("ATLAS", "images/inventoryimages/"..name..".xml"),
    }  
    local function fn(Sim)
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("wb_armorblood")
        inst.AnimState:SetBuild(name)
        inst.AnimState:PlayAnimation("idle")

        MakeInventoryFloatable(inst)

        inst:AddTag("wb_armor")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inspectable")

        inst:AddComponent("tradable")

        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/"..name..".xml"

        return inst
    end

    return Prefab(name, fn, assets)
end
return creatarmor("wb_armorblood"),
    creatarmor("wb_armorbone"),
    creatarmor("wb_armorfog"),
    creatarmor("wb_armorgreed"),
    creatarmor("wb_armorlight"),
    creatarmor("wb_armorstorage")
