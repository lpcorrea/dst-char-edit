

local function onequip(inst, owner)
	inst.components.myth_itemskin:OverrideSymbol(owner, "swap_body_tall")
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body_tall")
end


local RESISTANCES =
{
    "_combat",
    "explosive",
    "quakedebris",
    "caveindebris",
}

local attacked_cool_down = 0.55

local function OnResistDamage(inst)--, damage)
	if GetTime()- inst.last_take_damage_time <= attacked_cool_down then
		return 
	end
	
    local owner = inst.components.inventoryitem:GetGrandOwner() or inst

	if inst.components.myth_itemskin.skin:value() == "fire" then
		local fx = SpawnPrefab("firehit")
		fx.Transform:SetPosition(owner.Transform:GetWorldPosition())
		fx:DoTaskInTime(1.5,fx.Remove)
	else
		local fx = SpawnPrefab("nz_damask_fx")
		if fx then
			fx.entity:SetParent(owner.entity)
		end
	end

    inst.components.fueled:DoDelta(-5)
	
	inst.last_take_damage_time = GetTime()
end

local function ShouldResistFn(inst)
    if not inst.components.equippable:IsEquipped() then
        return false
    end
    if inst.components.fueled:IsEmpty() then
        return false
    end
    local owner = inst.components.inventoryitem.owner
    return owner ~= nil and owner:HasTag("neza")
        and not (owner.components.inventory ~= nil and
                owner.components.inventory:EquipHasTag("forcefield"))
end


local assets =
{
	Asset("ANIM", "anim/nz_damask.zip"),
	Asset("ANIM", "anim/vortex_cloak_fx.zip"),
	Asset("ANIM", "anim/white_vortex_cloak_fx.zip"),
	Asset("ATLAS", "images/inventoryimages/nz_damask.xml"),
}

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("nz_damask")
	inst.AnimState:SetBuild("nz_damask")
	inst.AnimState:PlayAnimation("idle")

	inst.MiniMapEntity:SetIcon("nz_damask.tex")

	inst:AddTag("nz_damask")
	
	MakeInventoryFloatable(inst, "small", 0.2, 0.80)

	inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'neza'
    inst.components.myth_itemskin.prefab = 'nz_damask'
    inst.components.myth_itemskin:SetDefaultData{"green", "fire"}
	
	inst.entity:SetPristine()
	if not TheWorld.ismastersim then
		return inst
	end

	inst.last_take_damage_time = GetTime()
	
	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = 'nz_damask'
	inst.components.inventoryitem.atlasname = "images/inventoryimages/nz_damask.xml"
	
	inst:AddComponent("fueled")
	inst.components.fueled:InitializeFuelLevel(100)
	inst.components.fueled.fueltype = FUELTYPE.LOTUS_FLOWER --修复材料待写
	inst.components.fueled.accepting = true

	inst:AddComponent("resistance")
	inst.components.resistance:SetShouldResistFn(ShouldResistFn)
	inst.components.resistance:SetOnResistDamageFn(OnResistDamage)

	for i, v in ipairs(RESISTANCES) do
		inst.components.resistance:AddResistance(v)
	end		

	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.BODY
	inst.components.equippable.walkspeedmult = 1.7
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)

	MakeHauntableLaunch(inst)

	return inst
end

local function fxfn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	inst:AddTag("FX")
	inst:AddTag("NOCLICK")

	inst.AnimState:SetBank("vortex_cloak_fx")
	inst.AnimState:SetBuild("white_vortex_cloak_fx")
	inst.AnimState:PlayAnimation('idle')
	inst.AnimState:SetMultColour(0.7,0,0,0.5)
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	inst.persists = false
	inst:ListenForEvent('animover',inst.Remove)
	return inst
end

return Prefab('nz_damask', fn, assets),
	Prefab("nz_damask_fx", fxfn)