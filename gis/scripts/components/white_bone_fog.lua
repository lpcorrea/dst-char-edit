

local function getdistofog(inst)
	local x,y,z = inst.Transform:GetWorldPosition()
	local ents = TheSim:FindEntities(x,y,z, 32, { "white_bone_fog", }, {"INLIMBO"})
	for i, v in ipairs(ents) do
		if v.scoperange then
			return 0.6
		elseif inst:GetDistanceSqToInst(v) < 576 then
			return 0.6
		end
	end
	return  0.2
end

local function update(self,dt)
	local one = {} 
	for fog in pairs(self.fogs)do
		local x,y,z = fog.Transform:GetWorldPosition()
		local ents = TheSim:FindEntities(x,y,z, fog.scoperange  or   32, { "_combat","_health" }, {"INLIMBO"})
		for i, v in ipairs(ents) do
			if v  then 
				if not one[v] then 
					if self.items[v] == nil then
						self.items[v] = true
					end
					one[v] = true
					if v:HasTag("player") then
						if not v:HasTag("w_b_fog") then
							v:AddTag("w_b_fog")
						end
						if v._inwbfog ~= nil and  v._inwbfog:value() == false then
							v._inwbfog:set(true)
						end
					else
						v.inwbfog = true
					end
					if v.components.combat and v.components.combat.target ~= nil
						and v.components.combat.target.prefab == "white_bone" 
						and not (v.components.health ~= nil and
							v.components.health:IsDead())				
						then
						if v.hitwhite_bone_time ~= nil then
							v.hitwhite_bone_time = v.hitwhite_bone_time + dt
						else
							v.hitwhite_bone_time = dt
						end
					end			
				end
			end
		end
	end
	for k,v in pairs(self.items)do
		if one[k] == nil then
			self:RemoveItem(k)
		elseif k:HasTag("white_bone") then
			if k.components.white_bone_cloak and k.components.white_bone_cloak:GetSkin() == "wb_armorfog" then 
				if not k.components.locomotor._externalspeedmultipliers["w_b_fog"] then
					k.components.locomotor:SetExternalSpeedMultiplier(k, "w_b_fog", 1.25)
				end
				if not k.components.combat.externaldamagemultipliers["w_b_fog"] then
					k.components.combat.externaldamagemultipliers:SetModifier("w_b_fog", 1.1)
				end
				if not k.components.health.externalabsorbmodifiers["w_b_fog"] then
					k.components.health.externalabsorbmodifiers:SetModifier("w_b_fog", 0.4)
				end
			else
				k.components.locomotor:RemoveExternalSpeedMultiplier(k, "w_b_fog")
				k.components.combat.externaldamagemultipliers:RemoveModifier("w_b_fog")
				k.components.health.externalabsorbmodifiers:RemoveModifier("w_b_fog")
			end

		elseif k.hitwhite_bone_time ~= nil then
			if k.hitwhite_bone_time >= math.random(6,10) and k.components.combat.target ~= nil
				and k.components.combat.target.prefab == "white_bone" then
				k.hitwhite_bone_time = nil
				k.components.combat:DropTarget()
			end
		end
	end
end

local White_BoneFog_Fog = Class(function(self, inst)
    self.inst = inst

    self.fogs = {}
	self.items = {}
    self.num = 0
	self.start = false
	
    self._onremovefog = function(fog)
		self:RemoveFog(fog) 
    end
end)

function White_BoneFog_Fog:AddFog(fog)
	self.fogs[fog] = fog
	self.num = self.num + 1
	if not self.start then
		self.start = true
		self.inst:StartUpdatingComponent(self)
	end
	self.inst:ListenForEvent("onremove", self._onremovefog, fog)
end

function White_BoneFog_Fog:RemoveFog(fog)
    if self.fogs[fog] ~= nil then
        self.fogs[fog] = nil
        self.num = self.num - 1
    end
	if self.num <= 0 then
		self.start = false
		self:RemoveAllItem()
		self.inst:StopUpdatingComponent(self)
	end
end

function White_BoneFog_Fog:RemoveItem(item)
	if  item then
		item:RemoveTag("w_b_fog")
		if item:HasTag("player") and item._inwbfog ~= nil and  item._inwbfog:value() == true then
			item._inwbfog:set(false)
		end
		if item:HasTag("white_bone") then 
			if item.components.locomotor then
				item.components.locomotor:RemoveExternalSpeedMultiplier(item, "w_b_fog")
			end
		end
        self.items[item] = nil
		item.inwbfog = nil
		item.hitwhite_bone_time = nil
	end
end

function White_BoneFog_Fog:RemoveAllItem()
    for k,v in pairs(self.items) do
		self:RemoveItem(k)
	end
end

function White_BoneFog_Fog:OnUpdate(dt)
	update(self,dt)
end

return White_BoneFog_Fog
