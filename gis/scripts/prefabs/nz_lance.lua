local assets =
{
    Asset("ANIM", "anim/nz_lance.zip"),
    Asset("ATLAS", "images/inventoryimages/nz_lance.xml"),
}


local function onequip(inst, owner)
	inst.components.myth_itemskin:OverrideSymbol(owner, "swap_object")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end
local function onpickupfn(inst, pickupguy)
	if pickupguy and pickupguy.prefab ~= "neza" and  pickupguy.prefab ~= "wormhole"  then
		if pickupguy.components.inventory then
			pickupguy:DoTaskInTime(0, function()
				pickupguy.components.inventory:DropItem(inst, true, true)
			end)
		end
	end
end
local function ReticuleTargetFn()
    local player = ThePlayer
    local ground = TheWorld.Map
    local pos = Vector3()
    for r = 5, 0, -.25 do
        pos.x, pos.y, pos.z = player.entity:LocalToWorldSpace(r, 0, 0)
        if ground:IsPassableAtPoint(pos:Get()) and not ground:IsGroundTargetBlocked(pos) then
            return pos
        end
    end
    return pos
end

local function Lunge(inst, doer, pos)
	doer:PushEvent("nzcombat_superjump", {targetpos = pos, weapon = inst})
	inst.components.rechargeable:StartRecharging()
	local fx = SpawnPrefab("abigail_retaliation")
	if fx then
		fx.Transform:SetPosition(doer.Transform:GetWorldPosition())
	end
end

local function leapfn(inst,doer, pos, targetpos)
	local x, y, z = doer.Transform:GetWorldPosition()
    SpawnPrefab("fx_boat_pop").Transform:SetPosition(x, y, z)
    SpawnPrefab("winona_battery_high_shatterfx").Transform:SetPosition(x, y, z)
    for i, v in ipairs(TheSim:FindEntities(x, 0, z, 4, {"_combat", }, { "playerghost", "INLIMBO", "player","companion","wall" })) do
        if v and v:IsValid() and not v:IsInLimbo() and not (v.components.health ~= nil and v.components.health:IsDead()) then
            if doer ~= nil and doer:IsValid() and doer.components.combat and doer.components.combat:CanTarget(v) then
				doer:PushEvent("onareaattackother", { target = v, weapon = inst or nil, stimuli = "nz_lance" })
				local damage = 70
				if doer.components.debuffable and doer.components.debuffable:HasDebuff("condensed_pill_buff") then
					damage = 100
				end
				v.components.combat:GetAttacked(doer, damage, inst, "nz_lance")
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
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()
	
    inst.MiniMapEntity:SetIcon("nz_lance.tex")

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("nz_lance")
    inst.AnimState:SetBuild("nz_lance")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("sharp")
    inst:AddTag("pointy")

    inst:AddTag("rechargeable")
    inst:AddTag("myth_removebydespwn")
	
	inst:AddTag("nzaoeweapon_leap")
	
    inst:AddTag("superjump")
	
    inst:AddComponent("aoetargeting")
    inst.components.aoetargeting:SetRange(16)
    inst.components.aoetargeting.reticule.reticuleprefab = "reticuleaoesmall"
    inst.components.aoetargeting.reticule.pingprefab = "reticuleaoesmallping"
    inst.components.aoetargeting.reticule.targetfn = ReticuleTargetFn
    inst.components.aoetargeting.reticule.validcolour = { 1, .75, 0, 1 }
    inst.components.aoetargeting.reticule.invalidcolour = { .5, 0, 0, 1 }
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true	

    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'neza'
    inst.components.myth_itemskin.prefab = 'nz_lance'
    inst.components.myth_itemskin:SetDefaultData{"green", "fire"}
    -- inst.components.myth_itemskin:SetData{
    --     green = {
    --         swap = {build = "nz_lance", folder = "swap_green"},
    --         icon = {atlas = "nz_lance.xml", image = "nz_lance_green"},
    --         anim = {bank = "nz_lance", build = "nz_lance", anim = "idle_green"},
    --     },
    --     default = {
    --         swap = {build = "nz_lance", folder = "swap_none"},
    --         icon = {atlas = "nz_lance.xml", image = "nz_lance_none"},
    --         anim = {bank = "nz_lance", build = "nz_lance", anim = "idle_none"},
    --     },
    -- }
	
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(51)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "nz_lance"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/nz_lance.xml"
	inst.components.inventoryitem.onpickupfn = onpickupfn

    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "neza"
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

	inst:AddComponent("myth_aoespell")
    inst.components.aoespell = inst.components.myth_aoespell
	inst.components.aoespell:SetSpellFn(Lunge)
	inst:RegisterComponentActions("aoespell")
	
	inst:AddComponent("myth_aoeweapon_leap")
	inst.components.aoeweapon_leap = inst.components.myth_aoeweapon_leap
	inst.components.aoeweapon_leap:SetLeapfn(leapfn)
	inst:RegisterComponentActions("aoeweapon_leap")

	inst:AddComponent("myth_rechargeable")
    inst.components.rechargeable = inst.components.myth_rechargeable
	inst.components.rechargeable:SetRechargeTime(13)
	inst:RegisterComponentActions("rechargeable")

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

    inst.AnimState:SetBank('wilson')
    inst.AnimState:SetBuild('neza')
    inst.AnimState:SetMultColour(1,1,1,.8)
    inst.AnimState:PlayAnimation('superjump_land')
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	inst.persists = false
	inst:ListenForEvent('animover',inst.Remove)
	return inst
end
return Prefab("nz_lance", fn, assets),
	Prefab("nz_lance_fx", fxfn)
		