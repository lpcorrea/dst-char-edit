local function PlaySound(inst, sound)
    inst.SoundEmitter:PlaySound(sound)
end

local function MakeFx(t)
    local assets =
    {
        Asset("ANIM", "anim/"..t.build..".zip")
    }

    local function startfx(proxy)
        local inst = CreateEntity(t.name)

        inst.entity:AddTransform()
        inst.entity:AddAnimState()

        local parent = proxy.entity:GetParent()
        if parent ~= nil then
            inst.entity:SetParent(parent.entity)
        end

        if t.nameoverride == nil and t.description == nil then
            inst:AddTag("FX")
        end
        inst.entity:SetCanSleep(false)
        inst.persists = false

        inst.Transform:SetFromProxy(proxy.GUID)

        if t.autorotate and parent ~= nil then
            inst.Transform:SetRotation(parent.Transform:GetRotation())
        end

        if t.sound ~= nil then
            inst.entity:AddSoundEmitter()
            inst:DoTaskInTime(t.sounddelay or 0, PlaySound, t.sound)
        end

        if t.sound2 ~= nil then
            if inst.SoundEmitter == nil then
                inst.entity:AddSoundEmitter()
            end
            inst:DoTaskInTime(t.sounddelay2 or 0, PlaySound, t.sound2)
        end

        inst.AnimState:SetBank(t.bank)
        inst.AnimState:SetBuild(t.build)
        inst.AnimState:PlayAnimation(t.anim)
        if t.tint ~= nil then
            inst.AnimState:SetMultColour(t.tint.x, t.tint.y, t.tint.z, t.tintalpha or 1)
        elseif t.tintalpha ~= nil then
            inst.AnimState:SetMultColour(t.tintalpha, t.tintalpha, t.tintalpha, t.tintalpha)
        end
        --print(inst.AnimState:GetMultColour())
        if t.transform ~= nil then
            inst.AnimState:SetScale(t.transform:Get())
        end

        if t.nameoverride ~= nil then
            if inst.components.inspectable == nil then
                inst:AddComponent("inspectable")
            end
            inst.components.inspectable.nameoverride = t.nameoverride
            inst.name = t.nameoverride
        end

        if t.description ~= nil then
            if inst.components.inspectable == nil then
                inst:AddComponent("inspectable")
            end
            inst.components.inspectable.descriptionfn = t.description
        end

        if t.bloom then
            inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
        end

		if t.animqueue then
	        inst:ListenForEvent("animqueueover", inst.Remove)
	    else
	        inst:ListenForEvent("animover", inst.Remove)
	    end

        if t.fn ~= nil then
            if t.fntime ~= nil then
                inst:DoTaskInTime(t.fntime, t.fn)
            else
                t.fn(inst)
            end
        end
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddNetwork()
        if not TheNet:IsDedicated() then
            inst:DoTaskInTime(0, startfx, inst)
        end

        if t.twofaced then
            inst.Transform:SetTwoFaced()
        elseif t.eightfaced then
            inst.Transform:SetEightFaced()
        elseif t.sixfaced then
            inst.Transform:SetSixFaced()
        elseif not t.nofaced then
            inst.Transform:SetFourFaced()
        end

        inst:AddTag("FX")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.persists = false
        inst:DoTaskInTime(1, inst.Remove)

        return inst
    end

    return Prefab(t.name, fn, assets)
end

local prefs = {}
local function FinalOffset3(inst)
    inst.AnimState:SetFinalOffset(3)
end
local function FinalOffset1(inst)
    inst.AnimState:SetFinalOffset(-1)
end	
local fx ={
	{
	    name = "white_bone_changefx", 
	    bank = "statue_ruins_fx", 
	    build = "white_bone_changefx", 
	    anim = "transform_nightmare",
		fn = FinalOffset3,
	},
	{
	    name = "white_bone_raisefx", 
	    bank = "blocker_sanity_fx", 
	    build = "white_bone_raisefx", 
	    anim = "raise",
        tintalpha = 0.5,
	},
	
    {
        name = "white_bone_small_puff",
        bank = "small_puff",
        build = "white_bone_small_puff",
        anim = "puff",
        sound = "dontstarve/common/deathpoof",
		fn = FinalOffset3,
    },
    {
        name = "yangjian_smoke",
        bank = "max_fx",
        build = "yangjian_smoke",
        anim = "anim",
    },
    {
        name = "wb_sand_puff",
        bank = "sand_puff",
        build = "wb_sand_puff",
        anim = "forage_out",
        sound = "dontstarve/common/deathpoof",
    },
    {
        name = "yangjian_firebird",
        bank = "firepit_firebird",
        build = "yangjian_firebird",
        anim = "puff3",
		bloom = true,
		fn = FinalOffset1,
    },
}

for k, v in pairs(fx) do
    table.insert(prefs, MakeFx(v))
end

return unpack(prefs)
