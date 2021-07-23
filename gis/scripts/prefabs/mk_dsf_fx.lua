
local EMBER_TEXTURE = "fx/snow.tex"
local ADD_SHADER = "shaders/vfx_particle_add.ksh"

local COLOUR_ENVELOPE_NAME_EMBER = "mk_dsf_fx_big_ember_colour"
local SCALE_ENVELOPE_NAME_EMBER = "mk_dsf_fx_big_ember_scale"

local assets =
{
    Asset("IMAGE", EMBER_TEXTURE),
    Asset("SHADER", ADD_SHADER),
}

--------------------------------------------------------------------------

local function IntColour(r, g, b, a)
    return { r / 255, g / 255, b / 255, a / 255 }
end

local function InitEnvelope()
    EnvelopeManager:AddColourEnvelope(
        COLOUR_ENVELOPE_NAME_EMBER,
        {
            { 0,    IntColour(255, 212, 0, 25) },
            { .2,   IntColour(255, 212, 0, 200) },
            { .6,   IntColour(255, 212, 0, 200) },
            { 1,    IntColour(255, 212, 0, 0) },
        }
    )

    local ember_max_scale = 2--0.8 --.55
    EnvelopeManager:AddVector2Envelope(
        SCALE_ENVELOPE_NAME_EMBER,
        {
            { 0,    { ember_max_scale, ember_max_scale } },
            { 1,    { ember_max_scale * 0.2, ember_max_scale * 0.2 } },
        }
    )

    InitEnvelope = nil
    IntColour = nil
end

local EMBER_MAX_LIFETIME = .8
local function emit_ember_fn(effect, sphere_emitter, adjust_vec)
    local vx, vy, vz = .4 * UnitRand(), .4 * UnitRand(), .4 * UnitRand()
    local lifetime = EMBER_MAX_LIFETIME * (0.7 + math.random() * .3)
    local px, py, pz = sphere_emitter()
    if adjust_vec ~= nil then
        px = px + adjust_vec.x
        py = py + adjust_vec.y
        pz = pz + adjust_vec.z
    end

    effect:AddParticle(
        0,
        lifetime,           -- lifetime
        px, py + .4+2, pz,    -- position
        vx, vy, vz         -- velocity
    )
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    inst:AddTag("FX")

    inst.entity:SetPristine()

    inst.persists = false

    if TheNet:IsDedicated() then
        return inst
    elseif InitEnvelope ~= nil then
        InitEnvelope()
    end

    local effect = inst.entity:AddVFXEffect()
    effect:InitEmitters(1)

    effect:SetRenderResources(0, EMBER_TEXTURE, ADD_SHADER)
    effect:SetMaxNumParticles(0, 256)
    effect:SetMaxLifetime(0, EMBER_MAX_LIFETIME)
    effect:SetColourEnvelope(0, COLOUR_ENVELOPE_NAME_EMBER)
    effect:SetScaleEnvelope(0, SCALE_ENVELOPE_NAME_EMBER)
    effect:SetBlendMode(0, BLENDMODE.Additive)
    effect:EnableBloomPass(0, true)
    effect:SetSortOrder(0, 0)
    effect:SetSortOffset(0, 2)
    effect:SetDragCoefficient(0, .11)

    local tick_time = TheSim:GetTickTime()

    local ember_sphere_emitter = CreateSphereEmitter(.1)

    EmitterManager:AddEmitter(inst, nil, function()
        local num_to_emit_ember = 90
        local adjust_vec = nil
        while num_to_emit_ember > 0 do
            emit_ember_fn(effect, ember_sphere_emitter, adjust_vec)
            num_to_emit_ember = num_to_emit_ember - 1
        end
        inst:Remove()
    end)

    return inst
end

return Prefab("mk_dsf_fx_big", fn, assets)