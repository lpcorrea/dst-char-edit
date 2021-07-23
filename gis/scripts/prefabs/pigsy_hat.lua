
local assets=
{
	Asset("ANIM", "anim/pigsy_hat.zip"),
	Asset("ATLAS", "images/inventoryimages/pigsy_hat.xml"),
}

local prefabs =
{
}

local function onunequiphat(inst, owner)
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
    
    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end
end

local function opentop_onequip(inst, owner) 
    -- owner.AnimState:OverrideSymbol("swap_hat", "pigsy_hat", "swap_hat")
    inst.components.myth_itemskin:OverrideSymbol(owner, "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
        
    owner.AnimState:Show("HEAD")
    owner.AnimState:Hide("HEAD_HAIR")
  
end


local function fn(Sim)
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("pigsy_hat")
    inst.AnimState:SetBuild("pigsy_hat")
    inst.AnimState:PlayAnimation("idle_none")

	inst:AddTag("hat")
	inst:AddTag("hide")

    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.prefab = 'pigsy_hat'
    inst.components.myth_itemskin.character = "pigsy"
    inst.components.myth_itemskin:SetDefaultData{'marry'}
    	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable")
		
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "pigsy_hat"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/pigsy_hat.xml"
       
	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD 
    inst.components.equippable:SetOnUnequip( onunequiphat )
    inst.components.equippable:SetOnEquip(opentop_onequip)
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY
    
	inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(60)
		
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0.2)
	
    inst:AddComponent("armor")
    inst.components.armor:InitCondition(400, 0.6)
	
    inst:AddComponent("tradable")
	
	MakeHauntableLaunch(inst)
    return inst
end 
    
return Prefab( "pigsy_hat", fn, assets, prefabs) 