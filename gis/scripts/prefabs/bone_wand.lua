local assets =
{
    Asset("ANIM", "anim/bone_wand.zip"),
    Asset("ATLAS", "images/inventoryimages/bone_wand.xml"),
}

local function lighton(inst, owner)
    if inst._light ~= nil then
        inst._light:Remove()
    end
    if owner and owner:HasTag("lamp") then return end
    inst._light = SpawnPrefab("minerhatlight")
    inst._light.Light:SetFalloff(0.7)
    inst._light.Light:SetIntensity(.5)
    inst._light.Light:SetRadius(4)
    inst._light.Light:SetColour(255/255,255/255,255/255)
    if owner ~= nil then
        inst._light.entity:SetParent(owner.entity)
    else
        inst._light.entity:SetParent(inst.entity)
    end
    if TheWorld.components.worldstate.data.isday then
        inst._light.Light:SetIntensity(0)
        inst._light.Light:Enable(false)
    end
    local t = 100
    inst:WatchWorldState("startday", function()
        for i=1, t do
            inst:DoTaskInTime(i*FRAMES, function()
                inst._light.Light:SetIntensity(.5-i/t*.5)
            end)
        end
        inst:DoTaskInTime(t*FRAMES, function() inst._light.Light:Enable(false) end)
    end)
    inst:WatchWorldState("startdusk", function()
        inst._light.Light:Enable(true)
        for i=1, t do
            inst:DoTaskInTime(i*FRAMES, function()
                inst._light.Light:SetIntensity(i/t*.5)
            end)
        end
    end)
end

local function onequip(inst, owner)
    inst.components.myth_itemskin:OverrideSymbol(owner, "swap_object")
	-- owner.AnimState:OverrideSymbol("swap_object", "bone_wand", "swap_bone_wand")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_object")
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end


local SNARE_OVERLAP_MIN = 1
local SNARE_OVERLAP_MAX = 3
local function NoSnareOverlap(x, z, r)
    return #TheSim:FindEntities(x, 0, z, r or SNARE_OVERLAP_MIN, { "bonespike", "groundspike" }) <= 0
end

--Hard limit target list size since casting does multiple passes it
local SNARE_MAX_TARGETS = 20
local SNARE_TAGS = { "_combat", "locomotor" }
local SNARE_NO_TAGS = { "player","flying", "ghost", "playerghost","shadow", "shadowminion", "INLIMBO","bird","companion"}

--???????????? ?????? ???????????? ?????? ???????????? ???

local function FindSnareTargets(inst) --????????????
    local x, y, z = inst.Transform:GetWorldPosition()
    local targets = {}
    local priorityindex = 1
    local priorityindex2 = 1
    local ents = TheSim:FindEntities(x, y, z, 32, SNARE_TAGS, SNARE_NO_TAGS)
    for i, v in ipairs(ents) do
        if not (v.components.health ~= nil and v.components.health:IsDead()) then 
            table.insert(targets, v)
        end
    end
    return #targets > 0 and targets or nil
end

local function SpawnSnare(inst, x, z, r, num, target)
	--print("5")
    local vars = { 1, 2, 3, 4, 5, 6, 7 }
    local used = {}
    local queued = {}
    local count = 0
    local dtheta = PI * 2 / num
    local thetaoffset = math.random() * PI * 2
    local delaytoggle = 0
    local map = TheWorld.Map
    for theta = math.random() * dtheta, PI * 2, dtheta do
        local x1 = x + r * math.cos(theta)
        local z1 = z + r * math.sin(theta)
        if map:IsPassableAtPoint(x1, 0, z1) and not map:IsPointNearHole(Vector3(x1, 0, z1)) then
            local spike = SpawnPrefab("bonespike")  --????????????
            spike.Transform:SetPosition(x1, 0, z1)

            local delay = delaytoggle == 0 and 0 or .2 + delaytoggle * math.random() * .2
            delaytoggle = delaytoggle == 1 and -1 or 1

            local duration = GetRandomWithVariance(TUNING.STALKER_SNARE_TIME, TUNING.STALKER_SNARE_TIME_VARIANCE)

            local variation = table.remove(vars, math.random(#vars))
            table.insert(used, variation)
            if #used > 3 then
                table.insert(queued, table.remove(used, 1))
            end
            if #vars <= 0 then
                local swap = vars
                vars = queued
                queued = swap
            end

            spike:RestartSpike(delay, duration, variation)
            count = count + 1
        end
    end
    if count <= 0 then
        return false
    elseif target:IsValid() then
        target:PushEvent("snared", { attacker = inst })
    end
    return true
end

local function SpawnSnares(inst, targets)
    local count = 0
    local nextpass = {}
    for i, v in ipairs(targets) do
        if v:IsValid() then
            local x, y, z = v.Transform:GetWorldPosition()
            local islarge = v:HasTag("largecreature")
            local r = v:GetPhysicsRadius(0) + (islarge and 1.5 or .5)
            local num = islarge and 12 or 6
            --if NoSnareOverlap(x, z, r + SNARE_OVERLAP_MAX) then --??????????????????
				if SpawnSnare(inst, x, z, r, num, v) then
                    count = count + 1
                end
            --end
        end
    end
	if count > 0 then
		local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
		if owner ~= nil	and owner.components.health and not owner.components.health:IsDead() then
			owner.components.health:DoDelta(2*count, false)
			if owner.components.sanity then
				owner.components.sanity:DoDelta(-2*count, false)
			end
			if owner.components.hunger then
				owner.components.hunger:DoDelta(-2*count, false)
			end
		end
	end
end

local function onspell(inst,doer, pos)
	local targets = FindSnareTargets(inst)
    if targets ~= nil then
        SpawnSnares(inst, targets)
		SpawnPrefab("white_bone_changefx").Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst.components.rechargeable:StartRecharging()
        inst.components.finiteuses:Use(1)
		return true
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()
	
    inst.MiniMapEntity:SetIcon("bone_wand.tex")

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("bone_wand")
    inst.AnimState:SetBuild("bone_wand")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'white_bone'
    inst.components.myth_itemskin.prefab = 'bone_wand'
    inst.components.myth_itemskin:SetDefaultData{"opera"}
	
	local swap_data = {sym_build = "bone_wand",sym_name = "water"}
	MakeInventoryFloatable(inst, "med", 0.05, {0.9, 0.5, 0.9}, true, -9, swap_data)

    inst:AddTag("sharp")
    inst:AddTag("pointy")
	inst:AddTag("rechargeable")
	inst:AddTag("repairable_bone")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(51)
    inst.components.weapon:SetRange(6, 8)
	--inst.components.weapon.attackwear = 2

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bone_wand.xml"

    inst.components.inventoryitem:SetOnDroppedFn(lighton)
	inst.components.inventoryitem:SetOnPutInInventoryFn(lighton)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(250000)
    inst.components.finiteuses:SetUses(250000)
	inst.components.finiteuses.repairnum = -10
    inst.components.finiteuses:SetOnFinished(inst.Remove)
	local old_SetUses = inst.components.finiteuses.SetUses
	inst.components.finiteuses.SetUses =function(self,val)
		if val > self.total then
			val = self.total
		end	
		old_SetUses(self,val)
	end

    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.CHOP, 10)
    inst.components.tool:SetAction(ACTIONS.MINE, 10)
    inst.components.tool:SetAction(ACTIONS.HAMMER, 10)
    inst.components.tool:SetAction(ACTIONS.DIG)
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.inventoryitem.keepondeath = true
    inst.components.equippable.walkspeedmult = 1.7
	
    inst:AddComponent("spellcaster")
	inst.components.spellcaster.CanCast =  function(self,doer, target, pos) return doer and doer.prefab == "white_bone" end
    inst.components.spellcaster.spell =  onspell
	inst.components.spellcaster.canuseonpoint = true --?????????
    inst.components.spellcaster.canuseontargets = true --?????????


	inst:AddComponent("myth_rechargeable")
    inst.components.rechargeable = inst.components.myth_rechargeable
	inst.components.rechargeable:SetRechargeTime(8)
	
	local old_StartRecharging = inst.components.rechargeable.StartRecharging
	inst.components.rechargeable.StartRecharging = function(self)
		old_StartRecharging(self)
		if self.inst.components.spellcaster then
			self.inst.components.spellcaster.canuseonpoint = false
			self.inst.components.spellcaster.canuseontargets = false 	
		end
	end

	local old_StopRecharging = inst.components.rechargeable.StopRecharging
	inst.components.rechargeable.StopRecharging = function(self)
		old_StopRecharging(self)
		if self.inst.components.spellcaster then
			self.inst.components.spellcaster.canuseonpoint = true
			self.inst.components.spellcaster.canuseontargets = true 	
		end
	end
	inst:RegisterComponentActions("rechargeable")
	
	MakeHauntableLaunch(inst)

    return inst
end

return Prefab("bone_wand", fn, assets)
		