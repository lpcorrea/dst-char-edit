
local IsFlying = function(inst) return inst and inst.components.mk_flyer and inst.components.mk_flyer:IsFlying()end
local function checkfly(builder)
	--if builder.components.hunger.current < 75 then
	--	builder.components.talker:Say(STRINGS.NAMES.YANGJIAN_TRACK_NOHUNGER)
	--	return false
	if builder._inhuahouse ~= nil and builder._inhuahouse:value() then
		builder.components.talker:Say(STRINGS.NAMES.YANGJIAN_TRACK_INHOUSE)	
		return false
	elseif builder._inmythhouse ~= nil and builder._inmythhouse:value() then
		builder.components.talker:Say(STRINGS.NAMES.YANGJIAN_TRACK_INHOUSE)	
		return false
	elseif  TheWorld:HasTag("cave") then
		builder.components.talker:Say(STRINGS.NAMES.YANGJIAN_TRACK_INHOUSE)	
		return false
	elseif IsFlying(builder) then
		return false	
	else
		return true
	end
end

local function builder_onbuilt(inst, builder)

	if builder then
		if checkfly(builder) then
			builder:DoTaskInTime(0.1,function()
				if not builder.components.health:IsDead() then
					builder.sg:GoToState("yangjian_eagle_up")
				end
			end)
		else
			builder.components.sanity:DoDelta(25)
		end
	end
    inst:Remove()
end

local function MakeBuilder(prefab)
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

    return Prefab(prefab, fn)
end

return  MakeBuilder("yangjian_track")
