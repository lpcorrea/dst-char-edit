

local function onequip(inst, owner)
	if owner.components.freezable then
		owner.components.freezable.qingyuan = true
	end
	owner.AnimState:OverrideSymbol("swap_body", "yangjian_armor", "swap_body")
	inst.components.myth_itemskin:OverrideSymbol(owner, "swap_body")

end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
	if owner.components.freezable then
		owner.components.freezable.qingyuan = false
	end
end


local assets =
{
	Asset("ANIM", "anim/yangjian_armor.zip"),
	Asset( "ATLAS", "images/inventoryimages/yangjian_armor.xml" ),
	Asset( "IMAGE", "images/inventoryimages/yangjian_armor.tex" ),
}

local function TemperatureChange(inst, data)
	local ambient_temp = TheWorld.state.temperature

	if ambient_temp > 0 then
		inst.components.equippable.walkspeedmult = 1.1
	else
		inst.components.equippable.walkspeedmult =  1.25
	end
end

local function onpercent(inst,data)
	local percent =  data and data.percent or inst.components.armor.condition
	if percent <= 0 then 
		inst.components.armor.absorb_percent = 0 
	else
		inst.components.armor.absorb_percent = 0.85
	end
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("yangjian_armor")
	inst.AnimState:SetBuild("yangjian_armor")
	inst.AnimState:PlayAnimation("anim")

	inst.MiniMapEntity:SetIcon("yangjian_armor.tex")

	inst:AddTag("yangjian_armor")
	inst:AddTag("myth_removebydespwn")
	
	MakeInventoryFloatable(inst, "small", 0.2, 0.80)

	inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'yangjian'
    inst.components.myth_itemskin.prefab = 'yangjian_armor'
	inst.components.myth_itemskin:SetDefaultData{"black", "gold"}

	inst.entity:SetPristine()
	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("tradable")
	
	inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = 'yangjian_armor'
	inst.components.inventoryitem.atlasname = "images/inventoryimages/yangjian_armor.xml"
	
	inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "yangjian"
	inst.components.equippable.equipslot = EQUIPSLOTS.BODY
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = 1.1


	inst:AddComponent("armor")
	inst.components.armor:InitCondition(4500, 0.85)
		inst.components.armor.SetCondition =  function(self,amount)	
			if self.indestructible then
				return
			end
			self.condition = math.max(math.min(amount, self.maxcondition),0)
			self.inst:PushEvent("percentusedchange", { percent = self:GetPercent() })
		end	
		
	inst:AddComponent("waterproofer")
	inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_ABSOLUTE)

	inst:WatchWorldState("temperature", TemperatureChange)
	TemperatureChange(inst)
	
	inst:ListenForEvent("percentusedchange", onpercent)
	onpercent(inst)	
		
	MakeHauntableLaunch(inst)

	return inst
end

return Prefab('yangjian_armor', fn, assets)