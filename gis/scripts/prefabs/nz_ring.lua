--乾坤圈
local assets=
{
    Asset("ANIM", "anim/nz_ring.zip"),
    Asset("ATLAS", "images/inventoryimages/nz_ring.xml"),
}

local function OnEquip(inst, owner) 

    inst.components.myth_itemskin:OverrideSymbol(owner, "swap_object")
	owner.AnimState:Show("ARM_carry") 
	owner.AnimState:Hide("ARM_normal")
end

local IsFlying = function(inst) return inst and inst.components.mk_flyer and inst.components.mk_flyer:IsFlying()end

local function OnHitOwner(inst)
    if inst.shadow_task then
        inst.shadow_task:Cancel()
        inst.shadow_task = nil
    end
	inst.AnimState:PlayAnimation(inst.components.myth_itemskin:Default("idle"))
end

local function OnUnequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
end

local function OnPutInInventory(inst)
    inst.hitcount = 0
    inst.hittargets = {}
    if inst.shadow_task then
        inst.shadow_task:Cancel()
        inst.shadow_task = nil
    end
    inst.AnimState:PlayAnimation(inst.components.myth_itemskin:Default("idle"))
end

local function OnThrown(inst, owner, target)
    if target ~= owner then
        owner.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_throw")
    end
    inst.AnimState:PlayAnimation(inst.components.myth_itemskin:Default("fly"), true)
    if not inst.shadow_task then
        inst.shadow_task = inst:DoPeriodicTask(0, function()
            local fx = SpawnPrefab('nz_ring_shadow')
            fx.AnimState:SetPercent(inst.components.myth_itemskin:Default("fly"), math.random()*0.3)
            fx.Transform:SetPosition(inst:GetPosition():Get())
        end)
    end
end

local function FindTarget(inst) --获取附近目标
    if inst.hitcount > 19 then return nil end

    local radius = 6
    local x, y, z = inst:GetPosition():Get()
    local ents = TheSim:FindEntities(x, 0, z, 8, {'_combat'}, {'FX', 'NOCLICK', 'INLIMBO', 'DECOR', 'hiding', 'player','wall',"companion","abigail"})
    for k, v in pairs(ents)do
        if not inst.hittargets[v] then
            if v.components.health and not v.components.health:IsDead() then
                return v
            end
        end
    end
end

local function OnCaught(inst, catcher)
    if catcher then
        if catcher.components.inventory then
            if inst.components.equippable and not catcher.components.inventory:GetEquippedItem(inst.components.equippable.equipslot) then
                catcher.components.inventory:Equip(inst)
            else
                catcher.components.inventory:GiveItem(inst)
            end
            catcher:PushEvent("catch")
        end
    end
end

local function ReturnToOwner(inst, owner)
    if owner then
        owner.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_return")
        inst.components.projectile:Throw(owner, owner)
    end
end

local function Bounce(inst, owner, target)
    inst.components.projectile:Throw(owner, target)
end

local function OnHit(inst, owner, target)
    inst.hittargets[target or 1] = true
    inst.hitcount = inst.hitcount + 1

    if owner == target then  --击中玩家
		OnHitOwner(inst)
		if IsFlying(owner) then
			OnCaught(inst, owner) 
		end
    else
        local target = FindTarget(inst)
        if target then
            Bounce(inst, owner, target) --攻击下一个目标
        else
            ReturnToOwner(inst, owner)  --返回玩家
        end
    end
    local impactfx = SpawnPrefab("impact")
    if impactfx and target.components.combat then
        local follower = impactfx.entity:AddFollower()
        follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0 )
        impactfx:FacePoint(inst:GetPosition())
    end
end

local function getdamagefn(inst)
    if inst.hitcount > 5 then
        return 25
    else
        return math.max(Remap(inst.hitcount, 0, 5, 50, 25))
    end
end

local function StopTrackingDelayOwner(self)
    if self.delayowner ~= nil then
        self.inst:RemoveEventCallback("onremove", self._ondelaycancel, self.delayowner)
        self.inst:RemoveEventCallback("newstate", self._ondelaycancel, self.delayowner)
        self.delayowner = nil
    end
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

local function fn(Sim)
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)
	inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("nz_ring.tex")
    
    anim:SetBank("nz_ring")
    anim:SetBuild("nz_ring")
    anim:PlayAnimation("idle_none")
    anim:SetRayTestOnBB(true)

    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'neza'
    inst.components.myth_itemskin.prefab = 'nz_ring'
    inst.components.myth_itemskin:SetDefaultData{"green", "fire"}
    
    inst:AddTag("sharp")
    inst:AddTag("myth_removebydespwn")
    inst:AddTag("pointy")
    inst:AddTag('projectile')
    inst:AddTag('thrown')
    
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.hitcount = 0
    inst.hittargets = {}
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(68)
    inst.components.weapon:SetRange(16, 18)
    inst.components.weapon.getdamagefn = getdamagefn

    inst:AddComponent("inspectable")
    
    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(14) --飞行速度
    inst.components.projectile:SetCanCatch(true)
	inst.components.projectile:SetHitDist(1.5)
    inst.components.projectile:SetOnThrownFn(OnThrown)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnMissFn(ReturnToOwner)
    inst.components.projectile:SetOnCaughtFn(OnCaught)
    inst.components.projectile:SetLaunchOffset(Vector3(0, 0.2, 0))

	inst.components.projectile.Hit = function(self,target)
		local attacker = self.owner
		local weapon = self.inst
		StopTrackingDelayOwner(self)
		self:Stop()
		self.inst.Physics:Stop()
		if attacker.components.combat == nil and attacker.components.weapon ~= nil and attacker.components.inventoryitem ~= nil then
			weapon = attacker
			attacker = weapon.components.inventoryitem.owner
		end
		if attacker ~= nil and attacker.components.combat ~= nil and target.prefab ~= "neza" then
			attacker.components.combat:DoAttack(target, weapon, self.inst, self.stimuli)
		end
		if self.onhit ~= nil then
			self.onhit(self.inst, attacker, target)
		end	
	end
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/nz_ring.xml"
	inst.components.inventoryitem.onpickupfn = onpickupfn
	
    inst:ListenForEvent('onputininventory', OnPutInInventory)
    
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "neza"
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)

    return inst
end

local function shadow(Sim)
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()

	inst.entity:AddNetwork()
	
    anim:SetBank('nz_ring')
    anim:SetBuild('nz_ring')
    anim:SetMultColour(0.3,0.3,0.3,0.3)
    --anim:SetPercent('flying', math.random())

    inst:AddTag('FX')
    inst:AddTag('NOCLICK')
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.persists = false
	
    inst:AddComponent('colourtweener')
    inst.components.colourtweener:StartTween({0,0,0,0}, 0.2, inst.Remove)


    return inst
end

return Prefab('nz_ring_shadow', shadow, assets), Prefab("nz_ring", fn, assets)
