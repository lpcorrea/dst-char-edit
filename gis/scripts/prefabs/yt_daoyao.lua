
STRINGS.MYTH_NOPESTLE = "我需要一个捣药杵"

local assets=
{
	Asset("ANIM", "anim/myth_lifeplant_fx.zip"),
}

local function builder_onbuilt(inst, builder)
	if builder and builder.components.inventory and not builder.components.health:IsDead() then
		local weapon = builder.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		if weapon ~= nil and weapon:HasTag("medicine_pestle_myth") then
			builder:DoTaskInTime(0.1,function()
				if not builder.components.health:IsDead() then
					builder.sg:GoToState("myth_daoyao",weapon)
				end
			end)
		else
			builder.components.talker:Say(STRINGS.MYTH_NOPESTLE)
		end
	end
    inst:Remove()
end


local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()

    inst:AddTag("CLASSIFIED")

    inst.persists = false

    inst:DoTaskInTime(0, inst.Remove)

    if not TheWorld.ismastersim then
        return inst
    end
		
	inst.OnBuiltFn = builder_onbuilt
		
    return inst
end

local function fxfn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
   
	inst.entity:AddNetwork()

	inst:AddTag("FX")
	
    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)
        
	inst.AnimState:SetBank("myth_lifeplant_fx")
    inst.AnimState:SetBuild("myth_lifeplant_fx")
    inst.AnimState:PlayAnimation("single"..math.random(1,3),true)
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
	
	inst:AddTag("projectile")
	
	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
		return inst
	end
	inst:AddComponent("projectile")
	inst.components.projectile:SetSpeed(2)
	inst.components.projectile:SetLaunchOffset(Vector3(0, 1.5, 0))
	inst.components.projectile:SetOnMissFn(inst.Remove)
	inst.components.projectile:SetOnHitFn(function(inst, owner, target)
		if target:IsValid() then
		end
		inst:Remove()
	end)
	
	inst.persists = false
	inst:DoTaskInTime(8, inst.Remove)
	inst.persists = false
	
	return inst
end

return Prefab("yt_daoyao",fn),
	Prefab("myth_sparkle",fxfn,assets)