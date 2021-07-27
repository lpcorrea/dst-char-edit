local ScpComponent = Class(function(self, inst)
    self.inst = inst

    self.pets = {}
    self.numpets = 0

    self.ondespawnfn = nil

    self._onremovepet = function(pet)
        if self.pets[pet] ~= nil then
            self.pets[pet] = nil
            self.numpets = self.numpets - 1
        end
    end
end)

function ScpComponent:SetOnDespawnFn(fn)
    self.ondespawnfn = fn
end

function ScpComponent:GetNumPets()
    return self.numpets
end

function ScpComponent:GetPets()
    return self.pets
end

local function LinkPet(self, pet)
    self.pets[pet] = pet
    self.numpets = self.numpets + 1
    self.inst:ListenForEvent("onremove", self._onremovepet, pet)
    pet.persists = false

    if self.inst.components.leader ~= nil then
        self.inst.components.leader:AddFollower(pet)
    end
end

function ScpComponent:KillExtraPets()
    local oldestpet = nil
    local count = 0

    for k, v in pairs(self.pets) do

        if v.prefab == "scpzombie" and v.lifetime > 0 and v.components.health.currenthealth > 0 then

            if oldestpet == nil or (oldestpet ~= nil and v.lifetime < oldestpet.lifetime) then
                oldestpet = v
            end

            count = count + 1

            if count >= 8 then
                if oldestpet ~= nil then
                    oldestpet.components.health:Kill()
                else
                    v.components.health:Kill()
                end
            end
        end
    end
end

function ScpComponent:SpawnPetAt(x, y, z, prefaboverride, skin)

    local petprefab = prefaboverride

    local pet = SpawnPrefab(petprefab, skin, nil, self.inst.userid)
    if pet ~= nil then
        LinkPet(self, pet)

        if pet.Physics ~= nil then
           pet.Physics:Teleport(x, y, z)
        elseif pet.Transform ~= nil then
            pet.Transform:SetPosition(x, y, z)
        end
    end
    
    return pet
end

function ScpComponent:DespawnPet(pet)
    if self.pets[pet] ~= nil then
        for k, v in pairs(self.pets) do
            if v.prefab == "scp035host" then
                local x, y, z = v.Transform:GetWorldPosition()
                SpawnPrefab("scp035item").Transform:SetPosition(x, y, z)
            end
        end
        if self.ondespawnfn ~= nil then
            self.ondespawnfn(self.inst, pet)
        else
            pet:Remove()
        end
    end
end

function ScpComponent:DespawnAllPets()
    for k, v in pairs(self.pets) do
        --if v.prefab == "scp035host" then
        --    local x, y, z = v.Transform:GetWorldPosition()
        --    SpawnPrefab("scp035item").Transform:SetPosition(x, y, z)
        --end
        v:Remove()
    end
end

function ScpComponent:OnSave()
    if next(self.pets) ~= nil then
        local data = {}
        for k, v in pairs(self.pets) do
            local saved--[[, refs]] = v:GetSaveRecord()
            table.insert(data, saved)
        end
        return { pets = data }
    end
end

function ScpComponent:OnLoad(data)
    if data ~= nil and data.pets ~= nil then
        for i, v in ipairs(data.pets) do
            local pet = SpawnSaveRecord(v)
            if pet ~= nil then
                LinkPet(self, pet)
            end
        end
        if self.inst.migrationpets ~= nil then
            for k, v in pairs(self.pets) do
                table.insert(self.inst.migrationpets, v)
            end
        end
    end
end

--function ScpComponent:CanSpawn()
--    local count = 0
--    for k, v in pairs(self.pets) do
--        if v.prefab == "scpzombie" then
--            count = count + 1
--        end
--    end
--    if count < 7 then
--        return true
--    else
--        return false
--    end
--end

function ScpComponent:Blacklisted(v)

    return (v:HasTag( "epic") 
        or v:HasTag("chess")
        or v:HasTag("shadow")
        or v:HasTag("veggie")
        or v:HasTag("structure")
        or v:HasTag("wall")
        or v:HasTag("ghost")
        or (v:HasTag("player") and TUNING.SCPONESHOT == 1)
        or v.prefab == "tentacle"
        or v.prefab == "slurtle"
        or v.prefab == "snurtle"
        or v.prefab == "warg"
        or v.prefab == "mutatedhound"
        or v.prefab == "mutated_penguin"
        or v.prefab == "spat"
        or v.prefab == "slurtlehole"
        or v.prefab == "tentacle_pillar"
        or v.prefab == "spider_hider"
        or v.prefab == "spider_moon"
        or v.prefab == "wx78"
        or v.prefab == "cookiecutter"
        or v.prefab == "rocky")
end

function ScpComponent:OnRemoveFromEntity()
    for k, v in pairs(self.pets) do
        self.inst:RemoveEventCallback("onremove", self._onremovepet, v)
    end
    --DespawnAllPets()
end

--ScpComponent.OnRemoveEntity = ScpComponent.DespawnAllPets

return ScpComponent