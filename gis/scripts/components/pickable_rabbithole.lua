
local function oncanbepicked(self, canbepicked)
    if canbepicked then
        self.inst:AddTag("canpickuprabithole")
    else
        self.inst:RemoveTag("canpickuprabithole")
    end
end

local function OnInit(self)
    if  TheWorld.state.isspring then
        self.canbepicked = false
    end
end

local Pickable = Class(function(self, inst)
    self.inst = inst
    self.canbepicked = true
	
	self.inst:WatchWorldState( "startday", function() 
		if  TheWorld.state.isspring then
			self.canbepicked = false
		else
			self.canbepicked = true
		end
	end)	
	inst:DoTaskInTime(0, function() OnInit(self) end)
end,
nil,
{
	canbepicked = oncanbepicked
})

function Pickable:OnLoad(data)
	self.canbepicked = data.canbepicked
end

function Pickable:OnSave()
	return
    {
        canbepicked = self.canbepicked,
    }
end

local itemspick =
{
	cutgrass = 6, 
	carrot_seeds = 4,
	carrot = 2,
	rocks = 2,
	manrabbit_tail = 1,
}

function Pickable:Pick(picker)
    if self.canbepicked then
		local item = weighted_random_choice(itemspick)
		local loot
        if picker ~= nil and picker.components.inventory ~= nil  then
            loot = SpawnPrefab(item)
            if loot ~= nil then
                if loot.components.inventoryitem ~= nil then
                    loot.components.inventoryitem:InheritMoisture(TheWorld.state.wetness, TheWorld.state.iswet)
                end
                picker:PushEvent("picksomething", { object = self.inst, loot = loot })
                picker.components.inventory:GiveItem(loot, nil, self.inst:GetPosition())
            end

        end
        self.canbepicked = false
		return true
    end
end

return Pickable
