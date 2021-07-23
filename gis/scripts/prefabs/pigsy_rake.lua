local assets =
{
    Asset("ANIM", "anim/pigsy_rake.zip"),
	Asset("ATLAS", "images/inventoryimages/pigsy_rake.xml"),
}

local prefabs =
{
    "soil",
}

local function onequip(inst, owner)

	inst.components.myth_itemskin:OverrideSymbol(owner, "swap_object")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function onpickupfn(inst, pickupguy)
	if pickupguy and pickupguy:HasTag("player") and pickupguy.prefab ~= "pigsy" then
		if pickupguy.components.inventory then
			pickupguy:DoTaskInTime(0, function()
				pickupguy.components.inventory:DropItem(inst, true, true)
			end)
		end
	end
end
	

local function ReticuleTargetFn()
    return Vector3(ThePlayer.entity:LocalToWorldSpace(6.5, 0, 0))
end

local function ReticuleMouseTargetFn(inst, mousepos)
    if mousepos ~= nil then
        local x, y, z = inst.Transform:GetWorldPosition()
        local dx = mousepos.x - x
        local dz = mousepos.z - z
        local l = dx * dx + dz * dz
        if l <= 0 then
            return inst.components.reticule.targetpos
        end
        l = 6.5 / math.sqrt(l)
        return Vector3(x + dx * l, 0, z + dz * l)
    end
end

local function ReticuleUpdatePositionFn(inst, pos, reticule, ease, smoothing, dt)
    local x, y, z = inst.Transform:GetWorldPosition()
    reticule.Transform:SetPosition(x, 0, z)
    local rot = -math.atan2(pos.z - z, pos.x - x) / DEGREES
    if ease and dt ~= nil then
        local rot0 = reticule.Transform:GetRotation()
        local drot = rot - rot0
        rot = Lerp((drot > 180 and rot0 + 360) or (drot < -180 and rot0 - 360) or rot0, rot, dt * smoothing)
    end
    reticule.Transform:SetRotation(rot)
end

local function Lunge(inst, doer, pos)
	inst.components.rechargeable:StartRecharging()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("pigsy_rake")
    inst.AnimState:SetBuild("pigsy_rake")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("sharp")
    inst:AddTag("weapon")
	inst:AddTag("pigsy_rake")
	inst:AddTag("rechargeable")
	inst:AddTag("myth_removebydespwn")
    inst:AddTag("allow_action_on_impassable")
	
    inst:AddComponent("aoetargeting")
    inst.components.aoetargeting:SetAlwaysValid(true)
    inst.components.aoetargeting.reticule.reticuleprefab = "reticulearc"
    inst.components.aoetargeting.reticule.pingprefab = "reticulearcping"
    inst.components.aoetargeting.reticule.targetfn = ReticuleTargetFn
    inst.components.aoetargeting.reticule.mousetargetfn = ReticuleMouseTargetFn
    inst.components.aoetargeting.reticule.updatepositionfn = ReticuleUpdatePositionFn
    inst.components.aoetargeting.reticule.validcolour = { 1, .75, 0, 1 }
    inst.components.aoetargeting.reticule.invalidcolour = { .5, 0, 0, 1 }
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true
	inst.components.aoetargeting.alwaysvalid = true 

	--local swap_data = {sym_build = "pigsy_rake",sym_name = "swap_object"}
	MakeInventoryFloatable(inst)--, "med", 0.05, {0.9, 0.5, 0.9}, true, -9, swap_data)

	inst:AddComponent("myth_itemskin")
	inst.components.myth_itemskin.prefab = "pigsy_rake"
	inst.components.myth_itemskin.character = "pigsy"
	inst.components.myth_itemskin:SetDefaultData{"marry"}
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(42.5)
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "pigsy_rake"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/pigsy_rake.xml"
	inst.components.inventoryitem.onpickupfn = onpickupfn
	
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "pigsy"
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	
    inst:AddComponent("myth_aoespell")
    inst.components.aoespell = inst.components.myth_aoespell
    inst.components.aoespell:SetSpellFn(Lunge)
    inst.components.aoespell.ispassableatallpoints = true
    inst:RegisterComponentActions("aoespell")

	inst:AddComponent("myth_rechargeable")
    inst.components.rechargeable = inst.components.myth_rechargeable
	inst.components.rechargeable:SetRechargeTime(8)
	local old_StartRecharging = inst.components.rechargeable.StartRecharging
	inst.components.rechargeable.StartRecharging = function(self)
		old_StartRecharging(self)
		if self.inst.components.useableitem ~= nil then
			self.inst.components.useableitem.inuse = true
		end
	end
	local old_StopRecharging = inst.components.rechargeable.StopRecharging
	inst.components.rechargeable.StopRecharging = function(self)
		old_StopRecharging(self)
		if self.inst.components.useableitem ~= nil then
			self.inst.components.useableitem.inuse = false
		end
	end
	inst:RegisterComponentActions("rechargeable")
	
	inst:AddComponent("pigsy_rake")
	
	if TUNING.FARM_PLANT_DRINK_LOW then
		inst:AddInherentAction(ACTIONS.TILL)
		inst:AddComponent("farmtiller")
		inst.components.pigsy_rake.can_till = false
	end
    return inst
end

return Prefab("pigsy_rake", fn, assets, prefabs)
