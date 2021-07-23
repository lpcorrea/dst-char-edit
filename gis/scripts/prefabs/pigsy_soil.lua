local assets =
{
    Asset("ANIM", "anim/quagmire_soil.zip"),
}

local rates =
{
    TUNING.FARM1_GROW_BONUS,
    TUNING.FARM2_GROW_BONUS,
    TUNING.FARM3_GROW_BONUS,
}

local croppoints =
{
    { Vector3(0, 0, -0.1) },
    { Vector3(0, 0, -0.1) },
    { Vector3(0, 0, -0.1) },
}

local function setfertilityfn(inst)
	inst.persists = false
	inst.AnimState:ShowSymbol("soil01")
	inst.AnimState:PlayAnimation("break")
	inst.AnimState:PushAnimation("collapse_broken",false)
	inst:ListenForEvent("animqueueover", inst.Remove)
end

local function dig_up(inst)
    if inst.components.grower ~= nil then
        inst.components.grower:Reset()
    end
	inst.persists = false
	inst.AnimState:PlayAnimation("break")
	inst.AnimState:PushAnimation("collapse_broken",false)
	inst:ListenForEvent("animqueueover", inst.Remove)
end

local function hide(inst)
	for k, v in pairs(inst.components.grower.crops) do
		if k and k.prefab == "plant_normal_legion" then
			inst.AnimState:HideSymbol("soil01")
			break
		end
	end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()

    inst.AnimState:SetBank("quagmire_soil")
    inst.AnimState:SetBuild("quagmire_soil")
    inst.AnimState:PlayAnimation("rise")
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
	
	inst:AddTag("plantedsoil")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
    inst.components.workable:SetOnFinishCallback(dig_up)
    inst.components.workable:SetWorkLeft(1)
	
    inst:AddComponent("grower")
    inst.components.grower.level = 2
    inst.components.grower.onplantfn = function() 
		inst.SoundEmitter:PlaySound("dontstarve/wilson/plant_seeds")
		hide(inst)
	end
    inst.components.grower.croppoints = croppoints[2]
    inst.components.grower.growrate = rates[2]

    inst.components.grower.max_cycles_left = 1
    inst.components.grower.cycles_left = 1
	local old = inst.components.grower.RemoveCrop
	inst.components.grower.RemoveCrop = function(self,crop)
		old(self,crop)
		setfertilityfn(self.inst)
	end

	local old_OnLoad = inst.components.grower.OnLoad
	inst.components.grower.OnLoad = function(self,data, newents)
		old_OnLoad(self,data, newents)
		hide(inst)
	end
    return inst
end

return Prefab("pigsy_soil", fn, assets)
