local assets=
{
	Asset("ANIM", "anim/wb_heart.zip"),
}


local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddDynamicShadow()
	
    MakeInventoryPhysics(inst)
	
    inst.AnimState:SetBank("wb_heart")
    inst.AnimState:SetBuild("wb_heart")
    inst.AnimState:PlayAnimation("idle", true)
	
	MakeInventoryFloatable(inst)
	
	inst:AddTag("preparedfood")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
    inst:AddComponent("tradable")
	
    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.MEAT
    inst.components.edible.healthvalue = 0
    inst.components.edible.sanityvalue = -30
    inst.components.edible.hungervalue = 25
	inst.components.edible.oneaten = function(inst,eater)
		if eater:HasTag("player") and not eater:HasTag("wormwood") and
		not (eater.components.health ~= nil and eater.components.health:IsDead()) then
			eater.wb_bone = true
			eater.components.health.minhealth = 0
			eater.components.health:Kill()
		end
	end
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/monkey_king_item.xml"

    return inst
end

return Prefab( "wb_heart", fn, assets) 
