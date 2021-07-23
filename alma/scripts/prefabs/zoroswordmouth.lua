local assets =
{ 
    Asset("ANIM", "anim/zoroswordmouth.zip"),
    Asset("ANIM", "anim/zoroswordmouth_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/zoroswordmouth.xml"),
    Asset("IMAGE", "images/inventoryimages/zoroswordmouth.tex"),
}

local prefabs = 
{
	"zoro"
}

local function onattack_shusui(inst, attacker, target)

    if attacker and attacker.components.hunger and attacker.components.health then
        attacker.components.hunger:DoDelta(-1)
		attacker.components.health:DoDelta(-0)
    end
end

local function storeincontainer(inst, container)
    if container ~= nil and container.components.container ~= nil then
        inst:ListenForEvent("onputininventory", inst._oncontainerownerchanged, container)
        inst:ListenForEvent("ondropped", inst._oncontainerownerchanged, container)
        inst._container = container
    end
end

local function unstore(inst)
    if inst._container ~= nil then
        inst:RemoveEventCallback("onputininventory", inst._oncontainerownerchanged, inst._container)
        inst:RemoveEventCallback("ondropped", inst._oncontainerownerchanged, inst._container)
        inst._container = nil
    end
end

local function topocket(inst, owner)
    if inst._container ~= owner then
        unstore(inst)
        storeincontainer(inst, owner)
    end
end

local function toground(inst)
    unstore(inst)
end

local function OnEquip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_hat", "zoroswordmouth_swap", "swap_hat")

    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAT_HAIR")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
    end
end

local function OnUnequip(inst, owner) 
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end
end

local function fn()

    local inst = CreateEntity()
    
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("zoroswordmouth")
    inst.AnimState:SetBuild("zoroswordmouth")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("hat")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
	
	inst._container = nil
	
    inst._oncontainerownerchanged = function(container)
        topocket(inst, container)
    end

    inst._oncontainerremoved = function()
        unstore(inst)
    end
	
	inst:AddComponent("chosenzoro")
    inst:ListenForEvent("onputininventory", topocket)
    inst:ListenForEvent("ondropped", toground)
		
    inst:AddComponent("inspectable")

    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "zoroswordmouth"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/zoroswordmouth.xml"
		    
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED
	
    inst:AddComponent("armor")
    inst.components.armor:InitCondition(9 * 9999999999, TUNING.ARMORGRASS_ABSORPTION *  0.9)
			
    MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/zoroswordmouth", fn, assets, prefabs)