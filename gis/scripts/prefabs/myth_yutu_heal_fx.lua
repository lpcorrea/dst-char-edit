
local TINT = { r = 134 / 255, g = 189 / 255, b = 206 / 255 }

local function OnUpdateTargetTint(inst)--, dt)
    if inst._tinttarget:IsValid() then
		inst.basetime = inst.basetime + FRAMES
        local curframe = inst.basetime / FRAMES
        if curframe < 10 then
            local k = curframe / 10 * .5
            if inst._tinttarget.components.colouradder ~= nil then
                inst._tinttarget.components.colouradder:PushColour(inst, TINT.r * k, TINT.g * k, TINT.b * k, 0)
            end
        elseif curframe < 40 then
            local k = (curframe - 10) / 30
            k = (1 - k * k) * .5
            if inst._tinttarget.components.colouradder ~= nil then
                inst._tinttarget.components.colouradder:PushColour(inst, TINT.r * k, TINT.g * k, TINT.b * k, 0)
            end
        else
            inst.components.updatelooper:RemoveOnUpdateFn(OnUpdateTargetTint)
            if inst._tinttarget.components.colouradder ~= nil then
                inst._tinttarget.components.colouradder:PopColour(inst)
            end
        end
    else
        inst.components.updatelooper:RemoveOnUpdateFn(OnUpdateTargetTint)
    end
end

local function Setup(inst, target)
    if inst.components.updatelooper == nil then
        inst:AddComponent("updatelooper")
        inst.components.updatelooper:AddOnUpdateFn(OnUpdateTargetTint)
        inst._tinttarget = target
    end
    if target.SoundEmitter ~= nil then
        target.SoundEmitter:PlaySound("dontstarve/characters/wortox/soul/heal")
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:DoTaskInTime(1.15,inst.Remove)
    inst.persists = false
    inst.Setup = Setup
	inst.basetime = 0

    return inst
end

return Prefab("myth_yutu_heal_fx", fn, assets)
