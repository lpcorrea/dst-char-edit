local assets =
{
    Asset("ANIM", "anim/bone_whip.zip"),
    Asset("ANIM", "anim/swap_bone_whip.zip"),
    Asset("ATLAS", "images/inventoryimages/bone_whip.xml"),
}

local function onhitother(inst,data)
	local rate = 0
    if inst.components.white_bone_cloak ~= nil then
        local skin = inst.components.white_bone_cloak:GetSkin()
        if skin == "wb_armorblood" then
            rate = 0.05
        elseif skin == "wb_armorfog"  and inst:HasTag("w_b_fog") then
            rate = 0.05
        end
    end
	if rate ~= 0 and data and data.target	then
		local damage = (data.damage or 0) * rate
		if inst.components.health ~= nil and inst.components.health:GetPercent() < 1 and not (data.target:HasTag("wall") or data.target:HasTag("engineering")) then
			inst.components.health:DoDelta(damage, nil, "bone_whip")
		end
	end
end

local function onequip(inst, owner)
    local key = inst.components.myth_itemskin.skin:value() == 'opera' and 'opera' or 'none'
    owner.AnimState:OverrideSymbol("swap_object", "bone_whip", "swap_whip_"..key)
    owner.AnimState:OverrideSymbol("whipline", "bone_whip", "whipline_"..key)

    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")

    if inst.blood_owner then
        inst:RemoveEventCallback("onhitother", onhitother, inst.blood_owner)
    end
    inst.blood_owner = owner
	inst:ListenForEvent("onhitother", onhitother, inst.blood_owner)
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    if inst.blood_owner then
        inst:RemoveEventCallback("onhitother", onhitother, inst.blood_owner)
        inst.blood_owner = nil
    end
end

local function supercrack(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, TUNING.WHIP_SUPERCRACK_RANGE, { "_combat" }, { "player", "epic", "shadow", "shadowminion", "shadowchesspiece" })
    for i,v in ipairs(ents) do
        if v.components.combat:HasTarget() then
            v.components.combat:DropTarget()
            if v.sg ~= nil and v.sg:HasState("hit")
                and v.components.health ~= nil and not v.components.health:IsDead()
                and not v.sg:HasStateTag("transform")
                and not v.sg:HasStateTag("nointerrupt")
                and not v.sg:HasStateTag("frozen")
                then

                if v.components.sleeper ~= nil then
                    v.components.sleeper:WakeUp()
                end
                v.sg:GoToState("hit")
            end
        end
    end
end

local function onattack(inst, owner, target)
    if  target ~= nil and target:IsValid() then
		--fx
        local chance1 =
            (target:HasTag("epic") and TUNING.WHIP_SUPERCRACK_EPIC_CHANCE) or
            (target:HasTag("monster") and TUNING.WHIP_SUPERCRACK_MONSTER_CHANCE) or
            TUNING.WHIP_SUPERCRACK_CREATURE_CHANCE
        local snap = SpawnPrefab("impact")
        local x, y, z = inst.Transform:GetWorldPosition()
        local x1, y1, z1 = target.Transform:GetWorldPosition()
        local angle = -math.atan2(z1 - z, x1 - x)
        snap.Transform:SetPosition(x1, y1, z1)
        snap.Transform:SetRotation(angle * RADIANS)
        if math.random() < chance1 then
            snap.Transform:SetScale(3, 3, 3)
            if target.SoundEmitter ~= nil then
                target.SoundEmitter:PlaySound("dontstarve/common/whip_large")
            end
            inst:DoTaskInTime(0, supercrack)
        elseif target.SoundEmitter ~= nil then
            target.SoundEmitter:PlaySound("dontstarve/common/whip_small")
        end
		
		if target.components.lootdropper ~= nil and not target:HasTag("fossil") then
			local chance2 = math.random()
            local rate = owner and owner.components.white_bone_cloak ~= nil and 
                owner.components.white_bone_cloak:GetSkin() == "wb_armorgreed" and 0.85 or 0.9
			local needchance = (target:HasTag("epic") and 0.95) or rate
			if  chance2 >=  needchance then
				local loots = target.components.lootdropper:GenerateLoot()
				if #loots > 0 then
					target.components.lootdropper:SpawnLootPrefab(loots[math.random(#loots)])
				end
			end
		end
    end
end

local function dapperfn(inst,owner)
	if owner and owner.prefab == "white_bone" then
		return 0
	else
		return TUNING.CRAZINESS_MED *2	
	end	
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("bone_whip")
    inst.AnimState:SetBuild("bone_whip")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("whip")

    inst:AddTag("weapon")
	inst:AddTag("repairable_bone")

    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'white_bone'
    inst.components.myth_itemskin.prefab = 'bone_whip'
    inst.components.myth_itemskin:SetDefaultData{"opera"}

    MakeInventoryFloatable(inst, "med", nil, 0.9)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(41)
    inst.components.weapon:SetRange(TUNING.WHIP_RANGE)
    inst.components.weapon:SetOnAttack(onattack)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(100)
    inst.components.finiteuses:SetUses(100)
	inst.components.finiteuses.repairnum = -50
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
	inst.components.inventoryitem.imagename = "bone_whip_none"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bone_whip.xml"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.dapperfn = dapperfn

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("bone_whip", fn, assets)
