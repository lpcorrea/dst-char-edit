
local assets=
{
	Asset("ANIM", "anim/golden_hat_mk.zip"),
	Asset("ATLAS", "images/inventoryimages/golden_hat_mk.xml"),
}


local swap_hat_skin = {
	opera = true,
	ear = true,
}

local function onequiphat(inst, owner)
    if owner.prefab == "monkey_king"  then
    	if swap_hat_skin[inst.components.myth_itemskin.skin:value()] then
			inst.components.myth_itemskin:OverrideSymbol(owner, "swap_hat")
		else
			inst.components.myth_itemskin:OverrideSymbol(owner, "hair")
		end
		owner.AnimState:Show("HAT")
        owner.AnimState:Show("HAIR_HAT")
        -- owner.AnimState:Hide("HAIR_NOHAT")
        -- owner.AnimState:Hide("HAIR")
		if inst._owner ~= nil then
			inst:RemoveEventCallback("killed", inst._onkilled, inst._owner)
		end
		inst._owner = owner
		inst:ListenForEvent("killed", inst._onkilled, owner)
		if not inst.task then
			inst.task = inst:DoPeriodicTask(0.1, inst._chechfireeye)
		end
	
	else
		owner:DoTaskInTime(0, function()
		local inventory = owner.components.inventory 
		if inventory then
			inventory:DropItem(inst)
		end
		--local talker = owner.components.talker 
		--if talker then
		--	talker:Say(STRINGS.MJ_JGB)
		--end
		end)	
	end
end

local function onunequiphat(inst, owner)
	if owner.prefab == "monkey_king"  then
	    owner.AnimState:ClearOverrideSymbol("hair")
	    owner.AnimState:ClearOverrideSymbol("swap_hat")
	    owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAIR_HAT")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

	    if inst._owner ~= nil then
	        inst:RemoveEventCallback("killed", inst._onkilled, inst._owner)
	        inst._owner = nil
	    end	
	    if inst.task then
	    	inst.task:Cancel()
	    	inst.task = nil
	    end
	end
end

local function onpercent(inst)
	if inst.components.fueled and inst.components.fueled:IsEmpty() then  
		inst:RemoveTag('golden_hat_mk')
	else
		inst:AddTag('golden_hat_mk')
	end
end

local function checkfireeye(inst)
	if inst.components.equippable.isequipped then
	    local owner = inst.components.inventoryitem:GetGrandOwner()
	    if owner and owner.prefab == 'monkey_king' and owner._mknightvision:value() then
	        inst.components.fueled:DoDelta(-0.1)
	    end
	end
end

local function fn(Sim)

	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	-- inst.AnimState:SetBank("golden_hat_mk")
	-- inst.AnimState:SetBuild("golden_hat_mk")
	-- inst.AnimState:PlayAnimation("anim")

	inst:AddTag("hat")

	inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'monkey_king'
    inst.components.myth_itemskin.prefab = 'golden_hat_mk'
    inst.components.myth_itemskin:SetDefaultData{"opera","ear","fire"}
	
	MakeInventoryFloatable(inst)
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("tradable")
	
    inst:AddComponent("inspectable")
		
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/golden_hat_mk.xml"
	
	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable:SetOnEquip( onequiphat )
	inst.components.equippable:SetOnUnequip( onunequiphat )
	
    inst:AddComponent("fueled")
    inst.components.fueled:InitializeFuelLevel(480*5)
    inst._onkilled = function(owner, data)
        if inst.components.fueled:IsEmpty()then
			return
		end
		if data and  data.victim and data.victim:HasTag("monster") and   owner.components.sanity ~= nil and owner.components.health and not owner.components.health:IsDead() then
			owner.components.sanity:DoDelta(10)
		end
    end
	inst:ListenForEvent("onfueldsectionchanged", onpercent)
	inst:DoTaskInTime(0, onpercent) --读档后检查是否移除标签

	inst._chechfireeye = checkfireeye
	-- inst:DoPeriodicTask(0.1, checkfireeye)
	
	return inst
end 

return Prefab( "golden_hat_mk", fn, assets)