local assets=
{
    Asset("ANIM", "anim/sandai.zip"),
    Asset("ANIM", "anim/swap_sandai.zip"),
  
    Asset("ATLAS", "images/inventoryimages/sandai.xml"),
    Asset("IMAGE", "images/inventoryimages/sandai.tex"),
}

local prefabs = 
{
	"zoro"
}

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
    owner.AnimState:OverrideSymbol("swap_object", "swap_sandai", "swap_sandai")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
 
local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("sandai")
    inst.AnimState:SetBuild("sandai")
    inst.AnimState:PlayAnimation("idle")
 
    inst:AddTag("sharp")
 
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
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(60)
	inst.components.weapon.blinking = true
	inst.components.weapon:SetRange(8, 2)
	
	inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.CHOP, 1)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "sandai"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sandai.xml"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	inst.components.inventoryitem.keepondeath = true
	
    return inst
end
return  Prefab("common/inventory/sandai", fn, assets, prefabs) 