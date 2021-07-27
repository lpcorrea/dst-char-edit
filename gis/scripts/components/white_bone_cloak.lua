
local setability = {

	--贮藏
	wb_armorstorage = function(self,abled)
		if self.inst.components.inventory then
			if abled  then
				if not self.inst.components.inventory:EquipHasTag("wb_armorstorage_back") then
					local back = SpawnPrefab("wb_armorstorage_back")
					self.inst.components.inventory:Equip(back)
					self.inst.components.health:SetAbsorptionAmount(0.90)
				end
			else
				self.inst.components.inventory:DropEverythingWithTag("wb_armorstorage_back")
				self.inst.components.health:SetAbsorptionAmount(0)
			end
		end
	end,

	--轻盈
	wb_armorlight = function(self,abled)
		if self.inst.components.locomotor then
			if abled  then
				self.inst.components.locomotor:SetExternalSpeedMultiplier(self.inst, "wb_armorlight", 1.2)
			else
				self.inst.components.locomotor:RemoveExternalSpeedMultiplier(self.inst, "wb_armorlight")
			end
		end
	end,

	--硬骨
	wb_armorbone = function(self,abled)
		if self.inst.components.health then
			if abled  then
				self.inst.components.health:SetAbsorptionAmount(0.75)
			else
				self.inst.components.health:SetAbsorptionAmount(0)
			end
		end
	end,
}

local keepwarm = {
	wb_armorbone = true,
	wb_armorlight = true,
	wb_armorblood = true,
}

local keepcold = {
	wb_armorstorage = true,
	wb_armorgreed = true,
	wb_armorfog = true,
}

local function oncurrent(self,current,old)
	for k,v in pairs(setability) do
		v(self,k == current )
	end
	self.inst.components.temperature.inherentinsulation = keepwarm[current] and 120 or 0
	self.inst.components.temperature.inherentsummerinsulation = keepcold[current] and 120 or 0
	if current == "wb_armorfog" then
		self.inst:AddTag("wear_wb_armorfog")
	else
		self.inst:RemoveTag("wear_wb_armorfog")
	end
	if current ~= nil then
		self.inst.AnimState:OverrideSymbol("swap_body", current, "swap_body")
	elseif old ~= nil then
		self.inst.AnimState:ClearOverrideSymbol("swap_body")
	end
end

local  white_bone_cloak = Class(function(self, inst)
	self.inst = inst
	self.appaly = false
	self.skin = nil
	self.current = nil
end,
nil,
{
	current = oncurrent,
}
)

function white_bone_cloak:GetSkin()
	return self.current
end

function white_bone_cloak:Apply()
	if self.skin ~= nil then
		self.current = self.skin
		self.appaly = true
	end
end

function white_bone_cloak:Clear()
	self.current = nil
	self.appaly = false
end

function white_bone_cloak:ClearAll()
	self.current = nil
	self.skin = nil
	self.appaly = false
	SpawnPrefab("white_bone_changefx").Transform:SetPosition(self.inst.Transform:GetWorldPosition())
end

function white_bone_cloak:SetSkin(skin)
	if skin ~= nil then
		self.skin = skin
		self:Apply()
		SpawnPrefab("white_bone_changefx").Transform:SetPosition(self.inst.Transform:GetWorldPosition())
	end
end

function white_bone_cloak:OnSave()
    return {skin = self.skin }
end

function white_bone_cloak:OnLoad(data)
    if data then
		self.skin = data.skin
    end
end

return white_bone_cloak


