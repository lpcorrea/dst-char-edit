local assets=
{
	Asset("ANIM", "anim/totooriastaff.zip"),
	Asset("ANIM", "anim/swap_totooriastaff.zip"),
	Asset("ATLAS", "images/inventoryimages/totooriastaff2.xml"),
}

local prefabs = {
}

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_totooriastaff", "swap_totooriastaff")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
end

local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork() 
	
    anim:SetBank("totooriastaff")
    anim:SetBuild("totooriastaff")
    anim:PlayAnimation("idle")
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	--多用工具
	inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.CHOP, 2.5)
    inst.components.tool:SetAction(ACTIONS.MINE, 2)
    inst.components.tool:SetAction(ACTIONS.HAMMER,1)
    inst.components.tool:SetAction(ACTIONS.DIG,2)
	
	inst:AddComponent("weapon")

	inst.components.weapon:SetDamage(34)

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/totooriastaff2.xml"
	
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	--inst.components.equippable.dapperness = TUNING.CRAZINESS_MED /6
    
    return inst
end


return Prefab( "common/inventory/totooriastaff2", fn, assets, prefabs) 
