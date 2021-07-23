local assets =
{
	Asset("ANIM", "anim/lotus.zip"),
}

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)

    anim:SetBank("lotus")
    anim:SetBuild("lotus")
    anim:PlayAnimation("idle")

    inst:AddTag("cattoy")
    inst:AddTag("billfood")
	
	MakeInventoryFloatable(inst)
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end 

    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
                
    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_TINY
    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = TUNING.SANITY_TINY or 0      
    inst.components.edible.foodtype = FOODTYPE.VEGGIE
	local old_GetSanity = inst.components.edible.GetSanity
	
	inst.components.edible.GetSanity = function(self,eater)
		if  eater and eater:HasTag("neza") then
			return 0
		end
		return old_GetSanity(self,eater)
	end
	local old_GetHunger = inst.components.edible.GetHunger
	
	inst.components.edible.GetHunger = function(self,eater)
		if  eater and eater:HasTag("neza") then
			return 0
		end
		return old_GetHunger(self,eater)
	end

	local old_GetHealth = inst.components.edible.GetHealth
	
	inst.components.edible.GetHealth = function(self,eater)
		if  eater and eater:HasTag("neza") then
			return 0
		end
		return old_GetHealth(self,eater)
	end

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(10*480)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"
     
        
    inst:AddComponent("cookable")
    inst.components.cookable.product = "lotus_flower_cooked"

    inst:AddComponent("bait")
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/monkey_king_item.xml"
    inst:AddComponent("tradable")

    return inst
end

local function fncooked(Sim)
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
  	inst.entity:AddNetwork()  
    inst:AddTag("cattoy")
    inst:AddTag("billfood")   
	
    anim:SetBank("lotus")
    anim:SetBuild("lotus")
    anim:PlayAnimation("cooked")
	
	MakeInventoryFloatable(inst)
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end    
    -----------------
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
   
                
    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_TINY
    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = TUNING.SANITY_MED or 0      
    inst.components.edible.foodtype = FOODTYPE.VEGGIE
	local old_GetSanity = inst.components.edible.GetSanity
	
	inst.components.edible.GetSanity = function(self,eater)
		if  eater:HasTag("neza") then
			return 0
		end
		return old_GetSanity(self,eater)
	end
	local old_GetHunger = inst.components.edible.GetHunger
	
	inst.components.edible.GetHunger = function(self,eater)
		if  eater:HasTag("neza") then
			return 0
		end
		return old_GetHunger(self,eater)
	end

	local old_GetHealth = inst.components.edible.GetHealth
	
	inst.components.edible.GetHealth = function(self,eater)
		if  eater:HasTag("neza") then
			return 0
		end
		return old_GetHealth(self,eater)
	end
	
    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(10*480)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"
    
    inst:AddComponent("inspectable")

    inst:AddComponent("bait")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/monkey_king_item.xml"
    inst:AddComponent("tradable")
	
    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)    
	
    return inst
end

return Prefab( "lotus_flower", fn, assets), 
       Prefab( "lotus_flower_cooked", fncooked, assets) 
