local SkyHoundLeash = Class(function(self, inst)
	self.inst = inst

	self.pet = nil
	self.maxpets = 1
	self.numpets = 0
	self.is_platform = false
	self._onremovepet = function()
		self:LosePet()
	end
	-- self.on_platform = function()
	-- 	self.is_platform = true
	-- end
	-- self.off_platform = function()
	-- 	self.is_platform = false
	-- end
	-- inst:ListenForEvent("got_on_platform", function()
	-- 	self.on_platform()
	-- end)
	-- inst:ListenForEvent("got_off_platform", function()
	-- 	self.off_platform()
	-- end)
end)

function SkyHoundLeash:IsFull()
	return self.numpets >= self.maxpets
end

function SkyHoundLeash:GetPet()
	return self.pet
end

function SkyHoundLeash:CanSpawn()
	return not self.pet
end

local function skyhound_link_player(pet, player)
	if pet and player then
	end
end

local function LinkPet(self, pet)
	self.pet = pet
	self.numpets = self.numpets + 1
	if not self.pet:HasTag("skyhound_warg") then
		self.inst:ListenForEvent("onremove", self._onremovepet, pet)
	end
	pet.persists = false
	if self.inst.components.leader ~= nil then
		self.inst.components.leader:AddFollower(pet)
		if pet:HasTag("skyhound_warg") then
			self.inst:AddTag("houndfriend")
			self:TriggerFrame(true)
		else
			self:TriggerFrame(false)
		end
		skyhound_link_player(pet, self.inst)
	end
end

local function DoEffects(x, y, z)
	SpawnPrefab("spawn_fx_small").Transform:SetPosition(x, y, z)
end

function SkyHoundLeash:DoSpawn(pet, x, y, z, no_effect)
	if pet then
		LinkPet(self, pet)
		if pet.Physics then
			pet.Physics:Teleport(x, y, z)
		elseif pet.Transform then
			pet.Transform:SetPosition(x, y, z)
		end
		if pet.components.spawnfader then
			pet.components.spawnfader:FadeIn()
		end
		if not no_effect then
			DoEffects(x, y, z)
		end
		self:TriggerHUD(true)
	end
end

function SkyHoundLeash:SpawnPetAt(x, y, z, no_effect)
	if not self:CanSpawn() then
		return
	end
	local pet = nil
	pet = SpawnPrefab("skyhound")
	-- For skin 
	local base = self.inst.components.skinner and self.inst.components.skinner:GetClothing().base
	for _,v in ipairs{"black", "gold", "dao"}do
		if base == "yangjian_"..v then 
			pet.components.myth_itemskin:ChangeSkin(v)
			break
		end
	end

    if self.onspawnfn ~= nil then
        self.onspawnfn(self.inst, pet)
    end
	self:DoSpawn(pet, x, y, z, no_effect)

	return pet
end

function SkyHoundLeash:SpawnWargAt(x, y, z, no_effect)
	if not self:CanSpawn() then
		return
	end
	local pet = nil
	pet = SpawnPrefab("skyhound_warg")
	-- For skin
	local base = self.inst.components.skinner and self.inst.components.skinner:GetClothing().base
	for _,v in ipairs{"gold"}do
		if base == "yangjian_"..v then 
			pet.components.myth_itemskin:ChangeSkin(v)
			break
		end
	end
	
    if self.onspawnfn ~= nil then
        self.onspawnfn(self.inst, pet)
    end
	self:DoSpawn(pet, x, y, z, no_effect)

	return pet
end

function SkyHoundLeash:SpawnAround()
	local theta = math.random() * 2 * PI
    local pt = self.inst:GetPosition()
    local radius = 1
    local offset = FindWalkableOffset(pt, theta, radius, 6, true)
    if offset ~= nil then
        pt.x = pt.x + offset.x
        pt.z = pt.z + offset.z
    end
    return self:SpawnPetAt(pt.x, 0, pt.z)
end

function SkyHoundLeash:LosePet()
	if self.pet then
        if self.ondespawnfn ~= nil then
            self.ondespawnfn(self.inst, self.pet)
        end
		self.pet = nil
		self.numpets = self.numpets - 1
		self:TriggerHUD(false)
		self:TriggerFrame(false)
	end
end

function SkyHoundLeash:TriggerHUD(show)
	--self.inst._skyhound_bar:set_local(false)
	--self.inst._skyhound_bar:set(show)
end

function SkyHoundLeash:TriggerFrame(moon)
	--self.inst._skyhound_frame:set_local(false)
	--self.inst._skyhound_frame:set(moon)
end

function SkyHoundLeash:Wait()
	if self.pet and self.pet:IsValid() and self.inst:IsValid() then
		local dist = TUNING.SKYHOUND_VALUE.whistle_dist
		if self.inst:IsNear(self.pet, dist) then
			self.inst.components.talker:Say("坐下")
			-- 待机状态下哮天犬只会待在原地
			self.pet:AddTag("skyhound_wait")
			-- 改变饥饿值
			self.pet:PushEvent("skyhound_wait", {wait=true})
		else
			-- 远了哮天犬听不到命令
			self.inst.components.talker:Say("太远了")
		end
	end
end

function SkyHoundLeash:Call()
	if self.pet and self.pet:IsValid() then
		self.pet:PushEvent("onwakeup")  -- 别睡了
		self.pet:RemoveTag("skyhound_wait")
		self.pet:PushEvent("skyhound_wait", {wait=false})
		local dist = TUNING.SKYHOUND_VALUE.trans_dist
		if not self.inst:IsNear(self.pet, dist) then
		    local pt = self.inst:GetPosition()
			-- if not self.is_platform then
			if self.inst:GetCurrentPlatform() then
				local theta = math.random() * 2 * PI
			    local radius = TUNING.SKYHOUND_VALUE.whistle_dist
			    local offset = FindWalkableOffset(pt, theta, radius, 6, true)
			    if offset ~= nil then
			        pt.x = pt.x + offset.x
			        pt.z = pt.z + offset.z
			    end
			end
			if self.pet.Physics then
				self.pet.Physics:Teleport(pt:Get())
			elseif self.pet.Transform then
				self.pet.Transform:SetPosition(pt:Get())
			end
			self.pet:ClearBufferedAction()
			-- 短暂等待，清掉原来的一些动作
			if self.pet.components.timer then
				self.pet:AddTag("skyhound_should_wait")
				self.pet.components.timer:StartTimer("skyhound_should_wait", TUNING.SKYHOUND_VALUE.time_should_wait)
			end
		end
	end
end

function SkyHoundLeash:OnSave()
	if self.pet ~= nil then
		local saved = self.pet:GetSaveRecord()
		return {
			pet = saved, 
			-- is_platform = self.is_platform,
		}
	end
end

function SkyHoundLeash:OnLoad(data)
	if data ~= nil and data.pet ~= nil then
		local pet = SpawnSaveRecord(data.pet)
		if pet ~= nil then
			LinkPet(self, pet)
		end
		-- if data.is_platform ~= nil then
		-- 	self.is_platform = data.is_platform
		-- end
	end
end

function SkyHoundLeash:OnRemoveFromEntity()
	self.inst:RemoveEventCallback("onremove", self._onremovepet, self.pet)
	-- self.inst:RemoveEventCallback("got_on_platform", self.on_platform)
	-- self.inst:RemoveEventCallback("got_off_platform", self.off_platform)
end

function SkyHoundLeash:OnRemoveEntity()
	if self.pet ~= nil then
		self.pet:Remove()
		self.pet = nil
	end
end

return SkyHoundLeash