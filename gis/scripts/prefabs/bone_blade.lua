local assets =
{
    Asset("ANIM", "anim/bone_blade.zip"),
    Asset("ATLAS", "images/inventoryimages/bone_blade.xml"),
}

local NO_TAGS = { "player", "wall", "ghost","shadow", "shadowminion", "structure","companion"}


local function canblood(inst)
	local blood = true
	for i,v in ipairs(NO_TAGS) do 
		if inst:HasTag(v) then
			return false
		end
	end
	return blood
end

local function onhitother(inst,data)
	if inst.components.rider and inst.components.rider:IsRiding() then
		return 
	end
	local rate  = 0.025
	if inst.components.white_bone_cloak ~= nil then
		local skin = inst.components.white_bone_cloak:GetSkin()
		if skin == "wb_armorblood" then
			rate = 0.2 --血色20%吸血
		elseif skin == "wb_armorfog" and inst:HasTag("w_b_fog") then  --在雾气里才有用
			rate = 0.1 --雾影10%吸血
		elseif  skin == "wb_armorbone" then
			rate = 0
		end
	end
	if rate ~= 0 and  data and data.target	and canblood(data.target)then
		local damage = (data.damage or 0) * rate
		if inst.components.health ~= nil and inst.components.health:GetPercent() < 1 and not (data.target:HasTag("wall") or data.target:HasTag("engineering")) then
			inst.components.health:DoDelta(damage, true, "bone_blade")
		end
	end
end

local function onequip(inst, owner)
	inst.components.myth_itemskin:OverrideSymbol(owner, "swap_object")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")

    if inst.blood_owner then
        inst:RemoveEventCallback("onhitother", onhitother, inst.blood_owner)
    end
    inst.blood_owner = owner
	inst:ListenForEvent("onhitother", onhitother, inst.blood_owner)
end

local function onunequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    if inst.blood_owner then
        inst:RemoveEventCallback("onhitother", onhitother, inst.blood_owner)
        inst.blood_owner = nil
    end
end

local function dapperfn(inst,owner)
	if owner and owner.prefab == "white_bone" then
		return 0
	else
		return TUNING.CRAZINESS_MED *2	
	end	
end

local function onblink(staff, pos, caster)
    if caster.components.hunger ~= nil then
        caster.components.hunger:DoDelta(-10)
    end

	staff.components.rechargeable:StartRecharging()

	if staff.components.finiteuses then
    	staff.components.finiteuses:Use(5)
	end
end

local function onrechargingfn(inst)
    inst:RemoveTag("can_use_infog")
end

local function onstoprechargfn(inst)
    inst:AddTag("can_use_infog")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("bone_blade")
    inst.AnimState:SetBuild("bone_blade")
    inst.AnimState:PlayAnimation("idle")
	
	local swap_data = {sym_build = "bone_blade",sym_name = "water"}
	MakeInventoryFloatable(inst, "med", 0.05, {1.1, 0.55, 1.1}, true, -9, swap_data)

    inst:AddTag("sharp")
    inst:AddTag("pointy")
	inst:AddTag("repairable_bone")
	inst:AddTag("can_use_infog")
	inst:AddTag("rechargeable")

	inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'white_bone'
    inst.components.myth_itemskin.prefab = 'bone_blade'
    inst.components.myth_itemskin:SetDefaultData{"opera"}
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(68)
	inst.components.weapon:SetRange(0.3)
	
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(100)
    inst.components.finiteuses:SetUses(100)
	inst.components.finiteuses.repairnum = -100
    inst.components.finiteuses:SetOnFinished(inst.Remove)
	local old_SetUses = inst.components.finiteuses.SetUses
	inst.components.finiteuses.SetUses =function(self,val)
		if val > self.total then
			val = self.total
		end	
		old_SetUses(self,val)
	end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bone_blade.xml"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.dapperfn = dapperfn

	inst:AddComponent("myth_rechargeable")
    inst.components.rechargeable = inst.components.myth_rechargeable
	inst.components.rechargeable:SetRechargeTime(15)
    inst.components.rechargeable.rechargingfn = onrechargingfn
    inst.components.rechargeable.stoprechargfn = onstoprechargfn
	inst:RegisterComponentActions("rechargeable")

    inst:AddComponent("wb_blinkstaff")
    inst.components.wb_blinkstaff:SetFX("white_bone_changefx", "white_bone_changefx")
    inst.components.wb_blinkstaff.onblinkfn = onblink

	MakeHauntableLaunch(inst)
	
    return inst
end

return Prefab("bone_blade", fn, assets)
		