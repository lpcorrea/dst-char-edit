
local assets =
{
    Asset("ANIM", "anim/butterfly_basic.zip"),
    Asset("ANIM", "anim/butterfly_moon.zip"),
    Asset("INV_IMAGE", "moonbutterfly"),
}

local brain = require "brains/moonbutterflybrain"

local LIGHT_RADIUS = .5
local LIGHT_INTENSITY = .5
local LIGHT_FALLOFF = .8

local function OnUpdateFlicker(inst, starttime)
    local time = starttime ~= nil and (GetTime() - starttime) * 15 or 0
    local flicker = math.sin(time * 0.7 + math.sin(time * 6.28))
    flicker = (1 + flicker) * .5
    inst.Light:SetIntensity(LIGHT_INTENSITY + .05 * flicker)
end

local function onbuilt(inst,builder)
	inst:Hide()
	inst:DoTaskInTime(0.4,function()inst:Show()end )
	
	if TUNING.MYTH_GHG ~= nil and TUNING.MYTH_GHG:IsValid() then
		local pos = TUNING.MYTH_GHG:GetPosition()
		inst.components.locomotor:GoToPoint(pos,nil ,true)
	elseif #TUNING.MYTH_YUEDAO > 0 then
		local suiji = TUNING.MYTH_YUEDAO[math.random(#TUNING.MYTH_YUEDAO)]
		local pos = Point(suiji.x, 0, suiji.z)
		inst.components.locomotor:GoToPoint(pos,nil ,true)
	end
end

local function OnDeath(inst)
	inst.components.colourtweener:StartTween({1,1,1,0},1.5,inst.Remove)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddLight()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.Transform:SetTwoFaced()

    inst.AnimState:SetBuild("butterfly_moon")
    inst.AnimState:SetBank("butterfly")
    inst.AnimState:PlayAnimation("idle", true)
    --inst.AnimState:SetRayTestOnBB(true)
	inst.AnimState:SetLightOverride(0.15)
	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.Light:SetFalloff(LIGHT_FALLOFF)
    inst.Light:SetIntensity(LIGHT_INTENSITY)
    inst.Light:SetRadius(LIGHT_RADIUS)
    inst.Light:SetColour(0.3, 0.55, 0.45)
    inst.Light:Enable(true)
    inst.Light:EnableClientModulation(true)

	MakeInventoryPhysics(inst)
	RemovePhysicsColliders(inst)
	
    inst:AddTag("fx")

    inst:DoPeriodicTask(.1, OnUpdateFlicker, nil, GetTime())
    OnUpdateFlicker(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	--inst.AnimState:SetTime(0.8 * inst.AnimState:GetCurrentAnimationLength())

    inst:AddComponent("locomotor")
    inst.components.locomotor:EnableGroundSpeedMultiplier(false)
    inst.components.locomotor:SetTriggersCreep(false)
    inst.components.locomotor.walkspeed = TUNING.MOONBUTTERFLY_SPEED
	
    inst:AddComponent("knownlocations")

    inst:SetStateGraph("SGbutterfly")
    --inst:SetBrain(brain)
    inst:AddComponent('colourtweener')
    
	inst.OnBuiltFn = onbuilt
	inst:DoTaskInTime(8,OnDeath)
    return inst
end

return Prefab("yt_moonbutterfly", fn, assets)
