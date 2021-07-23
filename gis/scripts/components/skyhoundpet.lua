local SkyHoundPet = Class(function(self, inst)
	self.inst = inst

	self.item_prefab = nil
end)

function SkyHoundPet:GetItemString()
	return self.item_prefab
end

function SkyHoundPet:SetItemString(item_prefab)
	self.item_prefab = item_prefab
end

function SkyHoundPet:OnSave()
	return {item_prefab = self.item_prefab}
end

function SkyHoundPet:OnLoad(data)
	if data and data.item_prefab then
		self.item_prefab = data.item_prefab
	end
end

return SkyHoundPet