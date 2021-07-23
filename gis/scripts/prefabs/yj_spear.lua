local assets =
{
    Asset("ANIM", "anim/yj_spear.zip"),
    Asset("ANIM", "anim/swap_yj_spear.zip"),

    Asset("IMAGE","images/inventoryimages/yj_spear.tex"),
    Asset("ATLAS","images/inventoryimages/yj_spear.xml"),
    -- Asset("IMAGE","images/inventoryimages/yj_spear_elec.tex"),
    -- Asset("ATLAS","images/inventoryimages/yj_spear_elec.xml"),

    Asset("ANIM", "anim/floating_items.zip"),
}

local assets_lightning = {
    Asset("ANIM", "anim/lightning.zip"),
    Asset("ANIM", "anim/yj_spear_lightning.zip"),
    Asset("ANIM", "anim/yj_spear_lightning_gold.zip"),
}

local assets_shockfx = {
    Asset("ANIM", "anim/yj_spear_elec_shockfx_build.zip"),
    Asset("ANIM", "anim/yj_spear_elec_shockfx_build_gold.zip"),
    Asset("ANIM", "anim/lavaarena_hammer_attack_fx.zip"),
}

local assets_preparefx = {
    Asset("ANIM", "anim/yj_spear_elec_preparefx.zip"),
    Asset("ANIM", "anim/yj_spear_elec_preparefx_gold.zip"),
    Asset("ANIM", "anim/lavaarena_creature_teleport.zip"),
}

local BASE_SPEAR_DAMAGE = 34

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

local function change(inst,electric)
	if electric then
		inst.components.weapon:SetElectric()
	else
		inst.components.weapon.stimuli = nil
	end
end
--降下天雷
local function DoDivineWrath(inst,owner,target)
    local light = SpawnAt("yj_spear_lightning",target)

    local skin = inst.components.myth_itemskin.skin:value()
    if skin == "gold" then
        light.skin:set("_gold")
    end

    --加点下雨的几率
    --TheWorld:PushEvent("ms_deltamoisture", TUNING.TELESTAFF_MOISTURE)
    if target.components.health and not target.components.health:IsDead() then 
        target.components.health:DoDelta(-30,nil,owner.prefab,false,nil,true)
        ----强制硬直真的好吗？
        -- 好个卵
        target:PushEvent("attacked",{attacker = inst,damage = 0})
        if target.sg and target.sg:HasState("hit") and not target.sg:HasStateTag("noouthit")then 
            target.sg:GoToState("hit")
        end
    end
end

local nottags = {'FX', 'NOCLICK', 'INLIMBO', 'playerghost','wall',"companion","abigail"}
if not TheNet:GetPVPEnabled() then
	table.insert(nottags, "player")
end

--武器战技：雷袭
local function SpearLightningStrike(inst, doer, pos)
    local rad = 1
	local rate = 1
	if doer.components.debuffable and doer.components.debuffable:HasDebuff("condensed_pill_buff") then
		rate = 2
	end  
    local offset = FindWalkableOffset(pos, math.random(360), rad, 12, false, true) or Vector3(0,0,0)
    local tele_pos = pos + offset
    doer.Transform:SetPosition(tele_pos:Get())

    local light = SpawnAt("yj_spear_lightning",doer)
    local skin = inst.components.myth_itemskin.skin:value()
    if skin == "gold" then
        light.skin:set("_gold")
    end

    local ents = TheSim:FindEntities(tele_pos.x,tele_pos.y,tele_pos.z,12,{"_combat"},nottags)
    for k,v in pairs(ents) do 
        if v:IsNear(doer,6) and doer.components.combat:CanTarget(v) and not doer.components.combat:IsAlly(v) then 
            v.components.combat:GetAttacked(doer,math.random(10,15)*rate)
        end
    end
	local hat =  doer.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
	if hat and hat.prefab == "yangjian_hair"  and hat.components.fueled then
		hat.components.fueled:DoDelta(-10)
	else
		doer.components.hunger:DoDelta(-10)
	end
	
    inst:StartThread(function()
        local sleeptime = GetRandomMinMax(6,8) * FRAMES
        Sleep(10 * FRAMES)
        for k,v in pairs(ents) do 
            if doer.components.combat:CanTarget(v) and not doer.components.combat:IsAlly(v) then 
                if not v.components.debuffable then 
                    v:AddComponent("debuffable")
                end
                if skin == "gold" then 
                    v.gold_shockbuff = true
                else
                    v.gold_shockbuff = false
                end

                v.components.debuffable:AddDebuff("yj_spear_elec_shockbuff","yj_spear_elec_shockbuff")

                DoDivineWrath(inst,doer,v)

                v.components.combat:GetAttacked(doer,inst.components.weapon:GetDamage(doer,v)*rate)
            end
            sleeptime = math.max(sleeptime - GetRandomMinMax(1,2) * FRAMES,FRAMES)
            Sleep(sleeptime)
        end
    end)
    inst.components.rechargeable:StartRecharging()
end

--切换附雷

local function normalize(p)
    if p == "black" or p == "dao" or p == "gold" then
        return p
    else
        return "none"
    end
end

local function EnableElecSpear(inst,enable,elec_duration)
    local skin = inst.components.myth_itemskin.skin:value()
    local owner = inst.components.equippable:IsEquipped() and inst.components.inventoryitem.owner 
    if owner then 
        local folder = "swap_"..normalize(skin)
        if enable then 
            folder = folder .. "_elec"
        end
        owner.AnimState:OverrideSymbol("swap_object", "yj_spear", folder)
    end
    local anim = "idle_"..normalize(skin)
    if enable then 
        anim = anim .. "_elec"
    end
    inst.AnimState:PlayAnimation(anim)
    local image = "yj_spear_"..normalize(skin)
    if enable then
        image = image .. "_elec"
    end
    inst.components.inventoryitem:ChangeImageName(image)

    ------------
    if inst.ElecEnabled == enable then 
        return 
    end 
    inst.ElecEnabled = enable
	change(inst,inst.ElecEnabled)

    if enable then 
        inst:AddTag("yj_spear_elec")
        if not (inst.fire and inst.fire:IsValid())  then 
            inst.fire = inst:SpawnChild("yj_spear_fire")
        end 

        --4*60
        if elec_duration then 
            inst.components.timer:StartTimer("yj_spear_elec",elec_duration)
        end
    else
        inst:RemoveTag("yj_spear_elec")
        if (inst.fire and inst.fire:IsValid()) then 
            inst.fire:Remove()
        end
        inst.fire = nil 

        inst.components.timer:StopTimer("yj_spear_elec")
    end

end

local function onequip(inst, owner)

    local skin = inst.components.myth_itemskin.skin:value()
    local folder = "swap_"..normalize(skin) .. (inst.ElecEnabled and "_elec" or "")
	owner.AnimState:OverrideSymbol("swap_object", "yj_spear", folder)
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")

	inst:ListenForEvent("lightningdamageavoided",inst._owner_lightningdamageavoided,owner)

end

local function onunequip(inst, owner)

	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")

	inst.AttackNum = 0
	inst.LastAttackTarget = nil
	inst:RemoveEventCallback("lightningdamageavoided",inst._owner_lightningdamageavoided,owner)
end

local function OnAttack(inst,owner,target)
    
    inst.AttackNum = inst.AttackNum + 1
    
    if inst.AttackNum >= 5 then 
        DoDivineWrath(inst,owner,target)
        inst.AttackNum = 0
    end

    inst.LastAttackTarget = target 
end

local function OnTimerDone(inst,data)
    local name = data.name
    if name == "yj_spear_elec" then 
        inst:EnableElecSpear(false)
    end
end

local function OnSave(inst,data)
    data.ElecEnabled = inst.ElecEnabled
end

local function OnLoad(inst,data)
    if data then 
        if data.ElecEnabled then
            inst:EnableElecSpear(data.ElecEnabled)
        end
    end
end

local function rechargerate(inst)
	local rate = 1
	local owner = inst.components.inventoryitem:GetGrandOwner()
	if owner ~= nil and owner.replica.inventory ~= nil and owner.replica.inventory:EquipHasTag("yangjian_hair") then
		rate = 2/3
	end	
	return rate 
end

local function onpickupfn(inst, pickupguy)
	if pickupguy and pickupguy.prefab ~= "yangjian" and  pickupguy.prefab ~= "wormhole" then
		if pickupguy.components.inventory then
			pickupguy:DoTaskInTime(0, function()
				pickupguy.components.inventory:DropItem(inst, true, true)
			end)
		end
	end
end


local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("yj_spear.tex")

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("yj_spear")
    inst.AnimState:SetBuild("yj_spear")
    -- inst.AnimState:PlayAnimation(inst.ElecEnabled and "idle_elec" or "idle")

    inst:AddTag("sharp")
    inst:AddTag("pointy")
    inst:AddTag("yj_spear")
    inst:AddTag("rechargeable")

    --weapon (from weapon component) added to pristine state for optimization
    inst:AddTag("weapon")

    -- MakeInventoryFloatable(inst, "med", 0.05, {1.1, 0.5, 1.1}, true, -9)

    inst:AddComponent("aoetargeting")
    inst.components.aoetargeting.reticule.reticuleprefab = "reticuleaoesmall"
    inst.components.aoetargeting.reticule.pingprefab = "reticuleaoesmallping"
    inst.components.aoetargeting.reticule.targetfn = ReticuleTargetFn
    inst.components.aoetargeting.reticule.validcolour = { 73/255, 240/255, 235/255, 1 }
    inst.components.aoetargeting.reticule.invalidcolour = { 178/255, 100/255, 50/255, 1 }
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true
    inst.components.aoetargeting:SetRange(20)

    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'yangjian'
    inst.components.myth_itemskin.prefab = 'yj_spear'
    inst.components.myth_itemskin.changskinfn = function(skin)
        if inst.EnableElecSpear then
            inst:EnableElecSpear(inst.ElecEnabled, nil)
        end
    end
    inst.components.myth_itemskin:SetDefaultData{"black", "dao", "gold"}

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AttackNum = 0
    inst.LastAttackTarget = nil 
    inst.ElecEnabled = false

    inst.EnableElecSpear = EnableElecSpear

    inst._owner_lightningdamageavoided = function(owner,data)
        if inst.components.rechargeable and inst.components.rechargeable.recharging then 
            inst.components.rechargeable:StopRecharging()
        end
        if inst.ElecEnabled then 
            inst:EnableElecSpear(false)
        end
        inst:EnableElecSpear(true,4*60)
    end

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    inst:AddComponent("timer")

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(51)
    inst.components.weapon:SetRange(6, 8)
    inst.components.weapon:SetOnAttack(OnAttack)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "yj_spear"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yj_spear.xml"
	inst.components.inventoryitem.onpickupfn = onpickupfn

    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "yangjian"
    inst.components.equippable.insulated = true
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.inventoryitem.keepondeath = true

    inst:AddComponent("myth_aoespell")
    inst.components.aoespell = inst.components.myth_aoespell
    inst.components.aoespell:SetSpellFn(SpearLightningStrike)
    inst:RegisterComponentActions("aoespell")

    inst:AddComponent("myth_rechargeable")
    inst.components.rechargeable = inst.components.myth_rechargeable
    inst.components.rechargeable:SetRechargeTime(15)
	inst.components.rechargeable:SetRechargeRate(rechargerate)
    inst:RegisterComponentActions("rechargeable")

    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.CHOP, 2.5)
    inst.components.tool:SetAction(ACTIONS.MINE, 2)
    inst.components.tool:SetAction(ACTIONS.HAMMER,1)
    inst.components.tool:SetAction(ACTIONS.DIG,2)

    MakeHauntableLaunch(inst)

    inst:ListenForEvent("timerdone",OnTimerDone)

    return inst
end

----------------------------------------------------------------------------------------------

local function PlayLightningAnim(pos,skin)
    local inst = CreateEntity()

    inst:AddTag("FX")
    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddLight()

    inst.Transform:SetPosition(pos:Get())
    inst.Transform:SetScale(2, 2, 2)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetLightOverride(1)
    -- inst.AnimState:SetSortOrder(2)
    inst.AnimState:SetBank("lightning")
    inst.AnimState:SetBuild("yj_spear_lightning"..skin)
    inst.AnimState:PlayAnimation("anim")
    
    inst:ListenForEvent("animover", inst.Remove)
end

local function PlayThunderSound(pos)
    local inst = CreateEntity()

    --[[Non-networked entity]]

    inst.entity:AddTransform()
    inst.entity:AddSoundEmitter()

    inst.Transform:SetPosition(pos:Get())
    inst.SoundEmitter:PlaySoundWithParams("dontstarve/rain/thunder_close", {intensity= 0.7})
    inst:Remove()
end

local function StartFX(proxy,skin)
    TheWorld:PushEvent("screenflash", .5)

    local pos = Vector3(proxy.Transform:GetWorldPosition())
    PlayLightningAnim(pos,skin)

    --Dedicated server does not need to spawn the local fx
    --(except red_lightning anim since it affects lighting)
    if TheNet:IsDedicated() then
        return
    end

    local pos0 = Vector3(TheFocalPoint.Transform:GetWorldPosition())
    local diff = pos - pos0
    local distsq = diff:LengthSq()
    local minsounddist = 10
    local normpos = pos
    if distsq > minsounddist * minsounddist then
        --Sound needs to be played closer to us if red_lightning is too far from player
        local normdiff = diff * (minsounddist / math.sqrt(distsq))
        normpos = pos0 + normdiff
    end

    if ThePlayer ~= nil then
        ThePlayer:ShakeCamera(CAMERASHAKE.FULL, .7, .02, .5, proxy, 40)
    end
    PlayThunderSound(normpos)
end

local function lightningfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    inst.skin = net_string(inst.GUID, "yj_spear_lightning.skin"),
    --Delay one frame so that we are positioned properly before starting the effect
    --or in case we are about to be removed
    inst:DoTaskInTime(0, function()
        StartFX(inst,inst.skin:value())
        -- body
    end)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetCanSleep(false)
    inst.persists = false
    inst:DoTaskInTime(1, inst.Remove)

    return inst
end

----------------------------------------------------------------------------

local function firefn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(50 / 255, 195 / 255, 215 / 255)
    inst.Light:SetFalloff(1)
    inst.Light:SetRadius(.6)
    inst.Light:Enable(true)
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    return inst
end

-------------------------------------------------------------------------------------

local function buff_OnAttached(inst,target)
    local hitfx = SpawnAt("yj_spear_elec_shockfx_hit",target)

    inst.ShockFX = target:SpawnChild("yj_spear_elec_shockfx")

    if target.gold_shockbuff then
        hitfx.AnimState:SetBuild("yj_spear_elec_shockfx_build_gold")
        inst.ShockFX.AnimState:SetBuild("yj_spear_elec_shockfx_build_gold")
    end

    inst.ShockTask = inst:DoPeriodicTask(5,function()
        target:PushEvent("attacked",{attacker = inst,damage = 0})
        if target.sg and target.sg:HasState("hit") and not target.sg:HasStateTag("noouthit") then 
            target.sg:GoToState("hit")
        end
    end)
    target.components.combat.externaldamagetakenmultipliers:SetModifier(inst,1.1,"yj_spear_elec_shockbuff")
    inst:ListenForEvent("death",function()
        inst.components.timer:StopTimer("buffduration")
        inst.components.debuff:Stop()
    end,target)
end

local function buff_OnDetached(inst,target)
    if inst.ShockFX and inst.ShockFX:IsValid() then 
        if inst.ShockFX.KillFX then 
            inst.ShockFX:KillFX()
        else
            inst.ShockFX:Remove()
        end 
    end
    inst.ShockFX = nil 
    if inst.ShockTask then
        inst.ShockTask:Cancel()
        inst.ShockTask = nil 
    end 
    target.components.combat.externaldamagetakenmultipliers:RemoveModifier(inst,"yj_spear_elec_shockbuff")
    inst:Remove()
end

local function buff_OnExtended(inst,target)
    -- SpawnAt("yj_spear_elec_shockfx",target)
    local hitfx = SpawnAt("yj_spear_elec_shockfx_hit",target)
    if target.gold_shockbuff  then
        hitfx.AnimState:SetBuild("yj_spear_elec_shockfx_build_gold")
    end

    inst.components.timer:StopTimer("buffduration")
    inst.components.timer:StartTimer("buffduration", 10)
end

local function buff_OnTimerDone(inst,data)
    if data.name == "buffduration" then 
        inst.components.debuff:Stop()
    end
end

local function elecbufffn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(buff_OnAttached)
    inst.components.debuff:SetDetachedFn(buff_OnDetached)
    inst.components.debuff:SetExtendedFn(buff_OnExtended)
    inst.components.debuff.keepondespawn = false

    inst:AddComponent("timer")
    inst.components.timer:StartTimer("buffduration",10)
    inst:ListenForEvent("timerdone", buff_OnTimerDone)

    return inst
end
--------------------------------------------------------------------------------

local function shockfxhitfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("lavaarena_hammer_attack_fx")
    inst.AnimState:SetBuild("yj_spear_elec_shockfx_build")
    inst.AnimState:PlayAnimation("crackle_hit")
    -- inst.AnimState:SetMultColour(14/255,192/255,255/255,1)
    inst.AnimState:SetLightOverride(1)
    -- inst.AnimState:SetSortOrder(2)
    
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
    
    inst:ListenForEvent("animover",inst.Remove)
    
    return inst
end

local function shockfxfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("lavaarena_hammer_attack_fx")
    inst.AnimState:SetBuild("yj_spear_elec_shockfx_build")
    inst.AnimState:PlayAnimation("crackle_loop",true)
    -- inst.AnimState:SetMultColour(202/255,245/255,255/255,1)
    inst.AnimState:SetLightOverride(1)
    -- inst.AnimState:SetSortOrder(2)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
    
    inst.KillFX = function(self)
        self.AnimState:PushAnimation("crackle_pst",false)
        self:ListenForEvent("animover", function() 
            if self.AnimState:IsCurrentAnimation("crackle_pst") then
                self:Remove()
            end
        end) 
    end
    
    return inst
end

-----------------------------------------------------------------------------
local function preparefxfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("lavaarena_creature_teleport")
    inst.AnimState:SetBuild("yj_spear_elec_preparefx")
    inst.AnimState:PlayAnimation("spawn_medium")

    inst.AnimState:HideSymbol("blast")
    inst.AnimState:HideSymbol("smoke1")
    inst.AnimState:HideSymbol("smoke3")

    inst.AnimState:SetLightOverride(1)
    -- inst.AnimState:SetSortOrder(2)

    -- inst.AnimState:SetMultColour(50/255,195/255,215/255,1)

    -- inst.AnimState:SetDeltaTimeMultiplier(1.1)

    inst.Transform:SetScale(1.5,1.5,1.5)
    
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
    
    inst:ListenForEvent("animover",inst.Remove)
    inst:DoTaskInTime(9 * FRAMES,inst.Remove)

    
    
    return inst
end

return Prefab("yj_spear", fn, assets),
    Prefab("yj_spear_lightning",lightningfn,assets_lightning),
    Prefab("yj_spear_fire",firefn),
    Prefab("yj_spear_elec_shockbuff",elecbufffn),
    Prefab("yj_spear_elec_shockfx_hit",shockfxhitfn,assets_shockfx),
    Prefab("yj_spear_elec_shockfx",shockfxfn,assets_shockfx),
    Prefab("yj_spear_elec_preparefx",preparefxfn,assets_preparefx)