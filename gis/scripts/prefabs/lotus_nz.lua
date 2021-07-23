local assets =
{
	Asset("ANIM", "anim/lotus.zip"),  
}

local function fn(Sim)
	local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("lotus")
    inst.AnimState:SetBuild("lotus")
    inst.AnimState:PlayAnimation("idle_plant",true)

    inst:AddTag("NOCLICK")
	inst:AddTag("fx")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetTime(math.random()*2)
    local color = 0.75 + math.random() * 0.25
    inst.AnimState:SetMultColour(color, color, color, 1)

	inst.persists = false
    return inst
end

return Prefab( "lotus_nz", fn, assets)
