
local assets=
{
    Asset("ANIM", "anim/shusui.zip"),
    Asset("ANIM", "anim/swap_shusui.zip"),
 
    Asset("ATLAS", "images/inventoryimages/shusui.xml"),
    Asset("IMAGE", "images/inventoryimages/shusui.tex"),
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
	owner.AnimState:OverrideSymbol("swap_object", "swap_shusui", "swap_shusui")
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
    MakeInventoryPhysics(inst)

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("shusui")
    inst.AnimState:SetBuild("shusui")
    inst.AnimState:PlayAnimation("idle")
	
	if not TheWorld.ismastersim then
        return inst
    end

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
		  
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "shusui"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/shusui.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	inst.components.inventoryitem.keepondeath = true
	
	inst:AddComponent("inspectable")
		
	inst:AddTag("shadow")
 	inst:AddComponent("weapon")
	inst.components.weapon:SetOnAttack(onattack_shusui)
    inst.components.weapon:SetDamage(90)
    inst.components.weapon:SetRange(10, 10)
	inst.components.weapon:SetProjectile("zoro_projectile")

    return inst
	
end
	
return  Prefab("common/inventory/shusui", fn, assets)