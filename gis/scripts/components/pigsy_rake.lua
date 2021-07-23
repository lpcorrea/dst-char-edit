
local function oncan_till(self,can_till)
	if can_till then
		self.inst:AddTag("pigsy_can_till")
	else
		self.inst:RemoveTag("pigsy_can_till")
	end
end

local  pigsy_rake = Class(function(self, inst)
	self.inst = inst
	self.can_till = true
end,
nil,
{
	can_till = oncan_till
})

function pigsy_rake:Till(pt,doer)
	--[[if TUNING.FARM_PLANT_DRINK_LOW ~= nil then
		local xx = pt.x%2
		local zz = pt.z%2
		local x = (xx == 1 and -0) or (xx < 1 and  0 ) or 1
		local z = (zz == 1 and -1) or (zz < 1 and  0 ) or 1
		pt.x = 	math.floor(pt.x)+x pt.z = math.floor(pt.z)+z
		TheWorld.Map:CollapseSoilAtPoint(pt.x, 0, pt.z)
		SpawnPrefab("farm_soil").Transform:SetPosition(pt:Get())
		return true
	else]]
		local soil = SpawnPrefab("pigsy_soil")
		if soil then
			local xx = pt.x%2
			local zz = pt.z%2
			local x = (xx == 1 and -1) or (xx < 1 and  0 ) or 1
			local z = (zz == 1 and -1) or (zz < 1 and  0 ) or 1
			soil.Transform:SetPosition(math.floor(pt.x)+x, 0, math.floor(pt.z)+z)
			return true
		end
	--end
	return false
end

function pigsy_rake:TryParry(owner, attacker, damage, weapon, stimuli)
	if owner ~= nil and attacker ~= nil and damage > 0  then
		local ang = owner.Transform:GetRotation()
		local x,y,z = attacker.Transform:GetWorldPosition()
		local angle = owner:GetAngleToPoint( x,0,z )
		local drot = math.abs( ang - angle )
		while drot > 180 do
            drot = math.abs(drot - 360)
		end
		if drot < 135 then
			if owner.components.hunger then
				owner.components.hunger:DoDelta(-damage*0.2, false)
			end
			return true
		end
	end
	return false
end

return pigsy_rake


