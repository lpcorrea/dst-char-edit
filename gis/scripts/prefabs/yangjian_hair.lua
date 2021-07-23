
local assets =
{
	Asset("ANIM", "anim/yangjian_hair.zip"),
	Asset( "ATLAS", "images/inventoryimages/yangjian_hair.xml" ),
	Asset( "IMAGE", "images/inventoryimages/yangjian_hair.tex" ),
}

local function onequip(inst, owner)
	if inst.components.myth_itemskin.skin:value() == "gold" then
		owner.AnimState:OverrideSymbol("swap_hat", "yangjian_hair", owner._skyeye ~= nil and owner._skyeye:value() and "swap_gold_eye" or "swap_gold")

        owner.AnimState:Show("HAT")
        owner.AnimState:Hide("HAIR_HAT")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")

        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
	else
		inst.components.myth_itemskin:OverrideSymbol(owner, "hair")
	end
	-- owner.AnimState:OverrideSymbol("hair", "yangjian_hair", "hair")
	if inst._owner ~= nil then
		inst:RemoveEventCallback("killed", inst._onkilled, inst._owner)
	end
	inst._owner = owner
	inst:ListenForEvent("killed", inst._onkilled, owner)
	inst:ListenForEvent("skyeye_dirty", inst._onskyeye, owner)

	if not inst.task then
		inst.task = inst:DoPeriodicTask(0.1, inst._chechfireeye)
	end
end

local function onunequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("hair")
	owner.AnimState:ClearOverrideSymbol("swap_hat")

	if inst.components.myth_itemskin.skin:value() == "gold" then
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAIR_HAT")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

        if owner:HasTag("player") then
            owner.AnimState:Show("HEAD")
            owner.AnimState:Hide("HEAD_HAT")
        end
	end

	if inst._owner ~= nil then
		inst:RemoveEventCallback("killed", inst._onkilled, inst._owner)
		inst:RemoveEventCallback("skyeye_dirty", inst._onskyeye, inst._owner)
		inst._owner = nil
	end	
	if inst.task then
		inst.task:Cancel()
		inst.task = nil
	end
end

local function onpercent(inst)
	if inst.components.fueled and inst.components.fueled:IsEmpty() then  
		inst:RemoveTag('yangjian_hair')
	else
		inst:AddTag('yangjian_hair')
	end
end

local function checkfireeye(inst)
	if inst.components.equippable.isequipped then
	    local owner = inst.components.inventoryitem:GetGrandOwner()
	    if owner and owner.prefab == 'yangjian' and owner._skyeye:value() then
	        inst.components.fueled:DoDelta(-0.1)
	    end
	end
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("yangjian_hair")
	inst.AnimState:SetBuild("yangjian_hair")
	inst.AnimState:PlayAnimation("idle_none")

	inst.MiniMapEntity:SetIcon("yangjian_hair.tex")

	inst:AddTag("hat")
	inst:AddTag("yangjian_hair")
	
	MakeInventoryFloatable(inst, "small", 0.2, 0.80)

	inst:AddComponent("myth_itemskin")
	inst.components.myth_itemskin.prefab = "yangjian_hair"
	inst.components.myth_itemskin.character = "yangjian"
	inst.components.myth_itemskin:SetDefaultData{"black", "gold"}
	
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("tradable")
	
	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = 'yangjian_hair'
	inst.components.inventoryitem.atlasname = "images/inventoryimages/yangjian_hair.xml"
	
	inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "yangjian"
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("fueled")
    inst.components.fueled:InitializeFuelLevel(480*5)
    inst._onkilled = function(owner, data)
        if inst.components.fueled:IsEmpty()then
			return
		end
		if data and  data.victim and data.victim:HasTag("monster") and   owner.components.sanity ~= nil and owner.components.health and not owner.components.health:IsDead() then
			owner.components.sanity:DoDelta(5)
		end
    end
    inst._onskyeye = function(owner)
    	if owner and owner._skyeye then
    		if inst.components.myth_itemskin.skin:value() == "gold" then
    			owner.AnimState:OverrideSymbol("swap_hat", "yangjian_hair", 
    				"swap_gold".. (owner._skyeye:value() and "_eye" or ""))
    		end
    	end
    end

	inst:ListenForEvent("onfueldsectionchanged", onpercent)
	inst:DoTaskInTime(0, onpercent)

	inst._chechfireeye = checkfireeye
	MakeHauntableLaunch(inst)

	return inst
end

return Prefab('yangjian_hair', fn, assets)