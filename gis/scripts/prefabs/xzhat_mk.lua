
local assets=
{
    Asset("ANIM", "anim/xzhat_mk.zip"),
    Asset("ANIM", "anim/xzhat_mk_opera.zip"),
    Asset("ANIM", "anim/xzhat_mk_ear.zip"),
    Asset("ANIM", "anim/xzhat_mk_horse.zip"),
    Asset("ATLAS", "images/inventoryimages/xzhat_mk.xml"),
}

local hair_skin = {
	horse = true,
}

local function onequiphat(inst, owner)
    if hair_skin[inst.components.myth_itemskin.skin:value()] then
        inst.components.myth_itemskin:OverrideSymbol(owner, "hair")
        owner.AnimState:Show("HAT")
        owner.AnimState:Show("HAIR_HAT")
    else
        inst.components.myth_itemskin:OverrideSymbol(owner, "swap_hat")
        owner.AnimState:Show("HAT")
        owner.AnimState:Show("HAIR_HAT")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
    end
    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
    end

    if inst.components.fueled ~= nil then
        inst.components.fueled:StartConsuming()
     end
end

local function onunequiphat(inst, owner)
    if hair_skin[inst.components.myth_itemskin.skin:value()] then
        owner.AnimState:ClearOverrideSymbol("hair")
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAIR_HAT")
    else
        owner.AnimState:ClearOverrideSymbol("swap_hat")
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAIR_HAT")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
    end

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
         owner.AnimState:Hide("HEAD_HAT")
    end

    if inst.components.fueled ~= nil then
        inst.components.fueled:StopConsuming()
    end
end

local function fn(Sim)

	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("xzhat_mk")
	inst.AnimState:SetBuild("xzhat_mk")
	inst.AnimState:PlayAnimation("anim")

	inst:AddTag("hat")
	inst:AddTag("xzhat_mk")
	
	MakeInventoryFloatable(inst)

	inst:AddComponent("myth_itemskin")
	inst.components.myth_itemskin.prefab = "xzhat_mk"
	inst.components.myth_itemskin.character = "monkey_king"
	inst.components.myth_itemskin:SetData{
		opera = {
            swap = {build = "xzhat_mk_opera", folder = "swap_hat"},
            icon = {atlas = "xzhat_mk.xml", image = "xzhat_mk_opera"},
            anim = {bank = "xzhat_mk", build = "xzhat_mk_opera", anim = "anim"},
        },
		ear = {
            swap = {build = "xzhat_mk_ear", folder = "swap_hat"},
            icon = {atlas = "xzhat_mk.xml", image = "xzhat_mk_ear"},
            anim = {bank = "xzhat_mk", build = "xzhat_mk_ear", anim = "anim"},
        },
		horse = {
            swap = {build = "xzhat_mk_horse", folder = "hair"},
            icon = {atlas = "xzhat_mk.xml", image = "xzhat_mk_horse"},
            anim = {bank = "xzhat_mk_horse", build = "xzhat_mk_horse", anim = "anim"},
        },
        default = {
        	swap = {build = "xzhat_mk", folder = "swap_hat"},
            icon = {atlas = "xzhat_mk.xml", image = "xzhat_mk_none"},
            anim = {bank = "xzhat_mk", build = "xzhat_mk", anim = "anim"},
        }
	}
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("tradable")
	
    inst:AddComponent("inspectable")
		
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "xzhat_mk"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/xzhat_mk.xml"
	
	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable:SetOnEquip( onequiphat )
	inst.components.equippable:SetOnUnequip( onunequiphat )
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE
	
    inst:AddComponent("fueled")
    inst.components.fueled.fueltype = FUELTYPE.USAGE
    inst.components.fueled:InitializeFuelLevel(TUNING.HAWAIIANSHIRT_PERISHTIME) --15天
    inst.components.fueled:SetDepletedFn(inst.Remove)
	
    inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(120)
    
	return inst
end 

return Prefab( "xzhat_mk", fn, assets)