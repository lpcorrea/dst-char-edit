local assets =
{ 
    Asset("ANIM", "anim/ehardhat.zip"),
    Asset("ANIM", "anim/ehardhat_swap.zip"), 
	Asset("ANIM", "anim/ehardhat_large_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/ehardhat.xml"),
    Asset("IMAGE", "images/inventoryimages/ehardhat.tex"),
}

local RESISTANCES =
{
    "quakedebris",
    "caveindebris",
}

local function OnEquip(inst, owner) 
    for i, v in ipairs(RESISTANCES) do
        inst.components.resistance:AddResistance(v)
    end

    if owner.prefab == "engineer" or owner.prefab == "spy" or owner.prefab == "tf2scout" 
	or owner.prefab == "wickerbottom" or owner.prefab == "wolfgang" or owner.prefab == "woodie" 
	or owner.prefab == "wx78" or owner.prefab == "wes" or owner.prefab == "waxwell" or owner.prefab == "wilbur" then
    owner.AnimState:OverrideSymbol("swap_hat", "ehardhat_swap", "swap_hat")
	else
	owner.AnimState:OverrideSymbol("swap_hat", "ehardhat_large_swap", "swap_hat")
	end

    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAIR_HAT")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
    end
end

local function OnUnequip(inst, owner)

    for i, v in ipairs(RESISTANCES) do
        inst.components.resistance:RemoveResistance(v)
    end

    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end
end

local function OnResistDamage(inst)
    inst.components.armor:SetCondition(inst.components.armor.condition - 10)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("ehardhat")
    inst.AnimState:SetBuild("ehardhat")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("hat")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")
    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "ehardhat"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/ehardhat.xml"
    MakeInventoryFloatable(inst, "med", nil, 0.6)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(TUNING.ARMOR_EHARDHAT, TUNING.ARMOR_HARDHAT_ABSORPTION)

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL)

	inst:AddComponent("resistance")
    inst.components.resistance:SetOnResistDamageFn(OnResistDamage)

    MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("ehardhat", fn, assets, prefabs)