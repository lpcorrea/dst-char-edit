
local assets =
{
	Asset("ATLAS", "images/inventoryimages/mk_dsf.xml"),
}

local function builder_onbuilt(inst, builder)
	if builder and builder.prefab == "monkey_king" then 
		local x,y,z = builder.Transform:GetWorldPosition()
        local fx = SpawnPrefab("mk_dsf_sound")
        fx.Transform:SetPosition(builder.Transform:GetWorldPosition())
        fx:Play()

		local ents = TheSim:FindEntities(x,y,z, 32,{"_combat","_health"},{"player","INLIMBO", "notarget", "noattack", "flight", "invisible", "playerghost"})
		for i,v in ipairs(ents) do
			if v and v.components.health and not v.components.health:IsDead() and 
                v.components.combat and  v.components.combat.target == builder then
				if not v.components.mk_hold_animal then
					v:AddComponent("mk_hold_animal")
				end
				v.components.mk_hold_animal:Start()
			end
		end
	end
    inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()

    inst:AddTag("CLASSIFIED")

    if not TheWorld.ismastersim then
        return inst
    end
    inst.persists = false

    inst.OnBuiltFn = builder_onbuilt
    inst:DoTaskInTime(0, inst.Remove)

    return inst
end

local function playsound(inst,sound)
    inst.SoundEmitter:PlaySound(sound or "mythsound_rhino/mythsound_rhino/dsf")
end

local function soundfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    inst.Play = playsound
    inst.persists = false
    inst:DoTaskInTime(0, inst.Remove)

    return inst
end

return Prefab("mk_dsf", fn, assets),
    Prefab("mk_dsf_sound", soundfn)