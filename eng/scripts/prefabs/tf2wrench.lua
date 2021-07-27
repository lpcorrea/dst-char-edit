local assets =
{
	Asset("ANIM", "anim/tf2wrench.zip"),
	Asset("ANIM", "anim/swap_tf2wrench.zip"),

	Asset("ATLAS", "images/inventoryimages/tf2wrench.xml"),
	Asset("IMAGE", "images/inventoryimages/tf2wrench.tex"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_tf2wrench", "tf2wrench")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function onattack(inst, attacker, target)
    if target and target.brain and target.epanic ~= true and target.components.hauntable ~= nil and math.random() < .1 then
    	local x, y, z = target.Transform:GetWorldPosition()
    	local fx = SpawnPrefab("impact")
    	fx.Transform:SetPosition(x, y, z)
        target.epanic = true
	target.components.hauntable:Panic(7)
        target:DoTaskInTime(9, function()
	    target.epanic = false
        end)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst:AddTag("hammer")
    inst:AddTag("dull")
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetBank("tf2wrench")
    inst.AnimState:SetBuild("tf2wrench")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.CHOP, 2.5)
    inst.components.tool:SetAction(ACTIONS.MINE, 2)
    inst.components.tool:SetAction(ACTIONS.HAMMER,1)
    inst.components.tool:SetAction(ACTIONS.DIG,2)

    inst:AddComponent("inspectable")

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(50)
    inst.components.weapon:SetRange(6, 8)
    inst.components.weapon:SetOnAttack(onattack)

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.inventoryitem.keepondeath = true
    inst.components.equippable.walkspeedmult = 1.7

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tf2wrench"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tf2wrench.xml"
	if CurrentRelease.GreaterOrEqualTo("R08_ROT_TURNOFTIDES") then
	MakeInventoryFloatable(inst, "small", 0.15, 0.6)
	end

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(7000000)
    inst.components.finiteuses:SetUses(7000000)
    inst.components.finiteuses:SetOnFinished(inst.Remove)

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("common/inventory/tf2wrench", fn, assets)