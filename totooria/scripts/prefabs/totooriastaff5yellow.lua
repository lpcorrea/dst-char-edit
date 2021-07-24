local assets=
{
	Asset("ANIM", "anim/totooriastaff5yellow.zip"),
	Asset("ANIM", "anim/swap_totooriastaff5yellow.zip"),
	
	Asset("ATLAS", "images/inventoryimages/totooriastaff5yellow.xml"),
}

local prefabs = {
"nightstickfire",
}

--白天关灯傍晚开灯
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
    owner.AnimState:OverrideSymbol("swap_object", "swap_totooriastaff5yellow", "swap_totooriastaff5yellow")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
end

local function onattack(inst, attacker, target, skipsanity, owner)
    if not inst or not attacker or not target then return end
	--加入冰杖效果
	if not skipsanity and attacker ~= nil and attacker.components.sanity ~= nil then
        attacker.components.sanity:DoDelta(-TUNING.SANITY_SUPERTINY)
    end

    if not target:IsValid() then
        return
    end
    
    if target.components.sleeper and target.components.sleeper:IsAsleep() then
        target.components.sleeper:WakeUp()
    end
    if target.components.burnable then
        if target.components.burnable:IsBurning() then
            target.components.burnable:Extinguish()
        elseif target.components.burnable:IsSmoldering() then
            target.components.burnable:SmotherSmolder()
        end
    end

    if target.sg ~= nil and not target.sg:HasStateTag("frozen") then
        target:PushEvent("attacked", { attacker = attacker, damage = 0 })
    end

    if target.components.freezable then
        if inst.components.inventoryitem.owner and inst.components.inventoryitem.owner.components.totooriastatus then
            target.components.freezable:AddColdness(1+inst.components.inventoryitem.owner.components.totooriastatus.dengji/20)
        else
            target.components.freezable:AddColdness(1)
        end
        target.components.freezable:SpawnShatterFX()
    end
end

local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddLight()
	inst.entity:AddNetwork() 
	
    anim:SetBank("totooriastaff5yellow")
    anim:SetBuild("totooriastaff5yellow")
    anim:PlayAnimation("idle")
	anim:SetBloomEffectHandle( "shaders/anim.ksh" )
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	--多用工具
	inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.CHOP, 2.5)
    inst.components.tool:SetAction(ACTIONS.MINE, 2)
    inst.components.tool:SetAction(ACTIONS.HAMMER,1)
    inst.components.tool:SetAction(ACTIONS.DIG,2)
	
	--加入冰杖攻击音效
	inst:AddTag("icestaff")
    inst:AddTag("extinguisher")

    inst:AddTag("lightbattery")
	
	inst:AddComponent("weapon")
    
    inst.components.weapon:SetDamage(60)

	inst.components.weapon:SetRange(8, 10)

	--加入冰杖攻击音效2
	inst.components.weapon:SetProjectile("ice_projectile")
    inst.components.weapon:SetOnAttack(onattack)
    
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/totooriastaff5yellow.xml"

	-- 让物品不需要装备就能发光，丢地上也能发光
	
    --inst.Light:SetFalloff(0.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetRadius(4)
    --inst.Light:SetColour(255/255,255/255,255/255)--光色
    --inst.Light:Enable(true)
	
    inst.components.inventoryitem:SetOnDroppedFn(lighton)
	inst.components.inventoryitem:SetOnPutInInventoryFn(lighton)
	
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	--加速
	inst.components.equippable.walkspeedmult = 1.7
	--inst.components.equippable.dapperness = TUNING.CRAZINESS_MED /4*3
    
    return inst
end


return Prefab( "common/inventory/totooriastaff5yellow", fn, assets, prefabs) 
