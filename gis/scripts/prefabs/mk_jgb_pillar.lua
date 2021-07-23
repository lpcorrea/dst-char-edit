local assets =
{
    Asset("ANIM", "anim/mk_jgb.zip"),
}


local function OnBuilt(inst, builder)
	if not( builder and builder:IsValid() and builder.prefab == 'monkey_king')then
		return 
	end
	local pos = builder:GetPosition()
	pos.y =0
	local a = -builder.Transform:GetRotation()*DEGREES
	local dist = 4
	local skin = builder.AnimState:GetBuild()

	local targetpos = pos + Vector3(dist*math.cos(a), 0, dist*math.sin(a))
	local pillar = SpawnPrefab("mk_jgb_pillar")
	pillar.owner = builder
	pillar.Transform:SetPosition(targetpos:Get())
	pillar.AnimState:PlayAnimation("pillar_drop")
	pillar:DoTaskInTime(0.5, function() 
		pillar.Physics:SetActive(true) 
		pillar.components.groundpounder:GroundPound()
		pillar:DoTaskInTime(0.1, function() 
			pillar.components.groundpounder:GroundPound()
		end)
		ShakeAllCameras(CAMERASHAKE.VERTICAL, .7, .025, 1.25, pillar, 40)
	end)
	pillar:SetSkin(skin)

	inst:Remove()
end

local function rec()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	-- inst.entity:AddNetwork()

	inst:AddTag("NOCLICK")

	inst.OnBuilt = OnBuilt
	return inst
end

local function SetSkin(inst, skin)
	if skin == 'monkey_king_sea' then
		inst.skin = "sea"
	elseif skin == 'monkey_king_fire' then
		inst.skin = "fire"
	elseif skin == 'monkey_king_opera' then
		inst.skin = "opera"
	elseif skin == 'monkey_king_ear' then
		inst.skin = "ear"
	elseif skin == 'monkey_king' or skin == 'monkey_king_none' then
		inst.skin = "none"
	else
		inst.skin = inst.skin or "none"
	end

	if inst.skin == "none" then
		inst.AnimState:ClearOverrideSymbol("p_none")
	else
		inst.AnimState:OverrideSymbol("p_none", "mk_jgb", "p_"..inst.skin)
	end
end

local function OnSave(inst, data)
	data.skin = inst.skin
end

local function OnLoad(inst, data)
	inst.skin = data and data.skin or "none"
	inst:SetSkin()
	inst.Physics:SetActive(true)
end

local function pillar()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	inst.Transform:SetScale(2,2,1)

	MakeObstaclePhysics(inst, 1, 10)
	inst.Physics:SetActive(false)

	inst.AnimState:SetBank('mk_jgb')
	inst.AnimState:SetBuild('mk_jgb')
	inst.AnimState:SetPercent('pillar_drop', 1)

	inst.SetSkin = SetSkin
	inst.skin = "none"

	inst.entity:SetPristine()
	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")

	inst:AddComponent("myth_groundpounder")
	inst.components.groundpounder = inst.components.myth_groundpounder
	inst.components.groundpounder.destroyer = true
	inst.components.groundpounder.noTags = {"FX", "NOCLICK", "DECOR", "INLIMBO", "player", "laozi"}

	inst:AddComponent("mk_jgb_pillar")

	inst:AddComponent("combat")
	inst.components.combat.defaultdamage= 200

	inst.OnSave = OnSave
	inst.OnLoad = OnLoad

	return inst
end

return Prefab("mk_jgb_rec", rec), Prefab("mk_jgb_pillar", pillar, assets)


