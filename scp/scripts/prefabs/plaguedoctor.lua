local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
}

local NO_CURE_METER = {"The world around me, fallen ill.", "Everyone is sick. Sick!", "I am doing this world a disservice, I can still save them.", "The pestilence has taken over. Everyone will fall if I don't advance my cure.", "J’ai échoué dans ce monde.", "La maladie... C’est autour de nous...", "Ashes, ashes, we all fall down..."} 

local function PlaguedoctorTimer(inst)
    for k,v in pairs(Ents) do
        if inst.player_classified ~= nil and (v.prefab == "scp035crypt" or v.prefab == "scp035item" or v:HasTag("scp035")) then
            inst.player_classified.MapExplorer:RevealArea(v.Transform:GetWorldPosition())
        end
    end

    if inst.components.pestilencecounter:GetPercent() == 0 then
        inst.components.grogginess.grog_amount = 0.5
    end 

    if inst.components.pestilencecounter:GetPercent() == 0 and inst.nocuretalkcd == 0 then
        inst.components.talker:Say(NO_CURE_METER[math.random(#NO_CURE_METER)], 3, false)
        inst.nocuretalkcd = 80 + math.random(-20, 20)
    end 

    inst.nocuretalkcd = math.max(0, inst.nocuretalkcd - 1)

    inst.components.scpcomponent:KillExtraPets()
end

local function PlaguedoctorTimer2(inst)
    inst.components.pestilencecounter:DoDelta(TUNING.SCPPESTILENCERATE)
end

local function onattackother(inst, data)

    local v = data.target
    local w = data.weapon

    if w ~= nil then
        if w:HasTag("projectile") or w:HasTag("rangedweapon") or w.prefabs == "firestaff" or w.prefabs == "icestaff" then
            return
        end
    end

    if not inst.components.scpcomponent:Blacklisted(v) and v.components.health then

        if inst.components.pestilencecounter:GetPercent() == 0 then

            inst.components.talker:Say("Something is wrong...", 3, false)
        else
            v.components.health:Kill()
            inst.components.pestilencecounter:DoDelta(-2)

            if v:HasTag("pig") and not v:HasTag("zombie") then

                local x,y,z = v.Transform:GetWorldPosition()
                local rot = v.Transform:GetRotation()

                inst:DoTaskInTime(1.3, function()

                    local corpse = SpawnPrefab("custom_pigcorpse_fx")
                    corpse.Transform:SetRotation(rot)
                    corpse:DoTaskInTime(0.1, function()
                        corpse.Transform:SetPosition(x, y, z)
                    end)
                end)
            end
        end
    else
        inst.components.talker:Say("It is resistant to my touch...", 3, false)
    end
end

local function killed(inst, data)
    local v = data.victim

    if inst.components.pestilencecounter:GetPercent() == 0 then
        if v:HasTag("pig") and not v:HasTag("zombie") then

            local x,y,z = v.Transform:GetWorldPosition()
            local rot = v.Transform:GetRotation()

            inst:DoTaskInTime(1.3, function()

                local corpse = SpawnPrefab("custom_pigcorpse_fx")
                corpse.Transform:SetRotation(rot)
                corpse:DoTaskInTime(0.1, function()
                    corpse.Transform:SetPosition(x, y, z)
                end)
            end)
        end
    end 
end

local function KillPet(pet)
    pet.components.health:Kill()
end

local function OnDespawnPet(inst, pet)
    pet:Remove()
end

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when reviving from ghost (optional)
	inst.components.locomotor.walkspeed = 1.7 * TUNING.WILSON_WALK_SPEED
    inst.components.locomotor.runspeed = 1.7 * TUNING.WILSON_RUN_SPEED
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
    inst.components.locomotor.walkspeed = 1 * TUNING.WILSON_WALK_SPEED
    inst.components.locomotor.runspeed = 1 * TUNING.WILSON_RUN_SPEED
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

local function OnSave(inst, data)
    data.spawnmask = inst.spawnmask or nil
end

local function OnPreLoad(inst, data)
    inst.spawnmask = data.spawnmask
end

local function OnDeath(inst)
    for k, v in pairs(inst.components.scpcomponent:GetPets()) do
        if (v.prefab == "scpzombie" or v.prefab == "scp035host") and v._killtask == nil then
            v._killtask = v:DoTaskInTime(math.random(), KillPet)
        end
    end
end

local function OnReroll(inst)
    local todespawn = {}
    for k, v in pairs(inst.components.scpcomponent:GetPets()) do
        if v.prefab == "scpzombie" or v.prefab == "scp035host" then
            table.insert(todespawn, v)
        end
    end 
    for i, v in ipairs(todespawn) do
        --inst.components.scpcomponent:DespawnPet(v)
        v._killtask = v:DoTaskInTime(math.random(), KillPet)
    end
end
    
local function SaveForReroll(inst)
    local data =
    {
        scpcomponent = inst.components.scpcomponent ~= nil and inst.components.scpcomponent:OnSave() or nil,
    }
    return next(data) ~= nil and data or nil
end

local function LoadForReroll(inst, data)
    if data.scpcomponent ~= nil and inst.components.scpcomponent ~= nil then
        inst.components.scpcomponent:OnLoad(data.scpcomponent)
    end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "plaguedoctor.tex" )
	inst:AddTag("scp049")
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	
    inst.pestilencecheck = 0

	inst.soundsname = "plaguedoctor"
    inst.nocuretalkcd = 80 + math.random(-20, 20)

	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(175)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(175)

	inst.components.locomotor.walkspeed = 1.7 * TUNING.WILSON_WALK_SPEED
    inst.components.locomotor.runspeed = 1.7 * TUNING.WILSON_RUN_SPEED
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE * TUNING.SCPHUNGERRATE

    inst:AddComponent("scpcomponent")
    inst.components.scpcomponent:SetOnDespawnFn(OnDespawnPet)
    inst._OnDespawnPet = inst.components.scpcomponent.ondespawnfn

    inst.spawnmask = 1

    inst:DoPeriodicTask(0.5, function() PlaguedoctorTimer(inst) end)
    inst:DoPeriodicTask(12, function() PlaguedoctorTimer2(inst) end)

    inst:ListenForEvent("death", OnDeath)
    inst:ListenForEvent("ms_becameghost", OnDeath)
    inst:ListenForEvent("ms_playerreroll", OnReroll)
    inst:ListenForEvent("killed", killed)
    inst:ListenForEvent("onattackother", onattackother)
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload

    inst.OnSave = OnSave
    inst.OnPreLoad = OnPreLoad

    inst.SaveForReroll = SaveForReroll
    inst.LoadForReroll = LoadForReroll
end

return MakePlayerCharacter("plaguedoctor", prefabs, assets, common_postinit, master_postinit, start_inv)