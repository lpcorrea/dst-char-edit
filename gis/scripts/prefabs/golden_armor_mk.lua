

local skin = {
	opera = 'golden_armor_mk_opera',
	ear = 'golden_armor_mk_ear',
}
local function goldenonequip(inst, owner)

	local s = inst.components.myth_itemskin.skin:value()
	local b = skin[s]  or 'golden_armor_mk'

	owner.AnimState:OverrideSymbol("swap_body", b, "swap_body")  
	owner.AnimState:OverrideSymbol("swap_body_tall", b, "swap_body_tall")  

	if owner.components.combat ~= nil then
		owner.components.combat.externaldamagemultipliers:SetModifier("golden_armor_mk", 1.15) 
	end
end

local function goldenonunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
	owner.AnimState:ClearOverrideSymbol("swap_body_tall")
	if owner.components.combat ~= nil then
		owner.components.combat.externaldamagemultipliers:RemoveModifier("golden_armor_mk")
	end	
end

local function onpercent(inst,data)
	local percent =  data and data.percent or inst.components.armor.condition
	if percent <= 0 then 
		inst.components.armor.absorb_percent = 0 
		inst:RemoveTag('myth_nostunned')
	else
		inst.components.armor.absorb_percent = 0.85 
		inst:AddTag('myth_nostunned')
	end
end

local function goldenfn(inst)
		inst.components.equippable:SetOnEquip(goldenonequip)
		inst.components.equippable:SetOnUnequip(goldenonunequip)
		inst:AddComponent("armor")
		inst.components.armor:InitCondition(4000, 0.85)
		inst.components.armor.SetCondition =  function(self,amount)	
			if self.indestructible then
				return
			end
			self.condition = math.max(math.min(amount, self.maxcondition),0)
			self.inst:PushEvent("percentusedchange", { percent = self:GetPercent() })
		end		
		inst:ListenForEvent("percentusedchange", onpercent)
		onpercent(inst)	
end

local function armor(name,masterfn)
	local assets =
	{
		Asset("ANIM", "anim/golden_armor_mk.zip"),
		Asset("ANIM", "anim/golden_armor_mk_opera.zip"),
		Asset("ANIM", "anim/golden_armor_mk_ear.zip"),
		Asset("ATLAS", "images/inventoryimages/golden_armor_mk.xml"),
	}

	local function fn()
		local inst = CreateEntity()

		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddNetwork()

		MakeInventoryPhysics(inst)

		inst.AnimState:SetBank(name)
		inst.AnimState:SetBuild(name)
		inst.AnimState:PlayAnimation("idle")

		MakeInventoryFloatable(inst, "small", 0.2, 0.80)

		inst:AddComponent("myth_itemskin")
		inst.components.myth_itemskin.character = "monkey_king"
		inst.components.myth_itemskin.prefab = name
		inst.components.myth_itemskin:SetData{
			opera = {
	            -- swap = {build = "mk_jgb", folder = "swap_sea"},
	            icon = {atlas = "golden_armor_mk.xml", image = "golden_armor_mk_opera"},
	            anim = {bank = "golden_armor_mk_opera", build = "golden_armor_mk_opera", anim = "idle"},
	        },
			ear = {
	            -- swap = {build = "mk_jgb", folder = "swap_sea"},
	            icon = {atlas = "golden_armor_mk.xml", image = "golden_armor_mk_ear"},
	            anim = {bank = "golden_armor_mk_ear", build = "golden_armor_mk_ear", anim = "idle"},
	        },
	        default = {
	            -- swap = {build = "mk_jgb", folder = "swap_sea"},
	            icon = {atlas = "golden_armor_mk.xml", image = "golden_armor_mk_none"},
	            anim = {bank = "golden_armor_mk", build = "golden_armor_mk", anim = "idle"},
	        },
		}
		
		inst:AddTag("myth_removebydespwn")

		inst.entity:SetPristine()

		if not TheWorld.ismastersim then
			return inst
		end

		inst:AddComponent("inspectable")
		inst:AddComponent("tradable")
		inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.imagename = name
		inst.components.inventoryitem.atlasname = "images/inventoryimages/golden_armor_mk.xml"

		inst:AddComponent("equippable")
		inst.components.equippable.restrictedtag = "monkey_king"
		inst.components.equippable.equipslot = EQUIPSLOTS.BODY
		
		masterfn(inst)

		MakeHauntableLaunch(inst)

		return inst
	end

	return Prefab(name, fn, assets)

end

return armor("golden_armor_mk",goldenfn)