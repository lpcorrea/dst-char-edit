local SkyHoundWarg = Class(function(self, inst)
	self.inst = inst
	self.task = nil
	self.warg_fn = nil
	self.pet_fn = nil
end)

function SkyHoundWarg:LeaderHounds()
    local x, y, z = self.inst:GetPosition():Get()
    local dist = TUNING.SKYHOUND_VALUE.range_leader
    -- 不和克总抢人
    local hounds = TheSim:FindEntities(x, y, z, dist, {"hound"}, {"moonbeast","warg"})
    for _, hound in pairs(hounds) do
        if hound ~= nil and hound.components.follower
        and hound.components.follower:GetLeader() ~= self.inst then
            hound.components.follower:SetLeader(self.inst)
        end
    end
end

function SkyHoundWarg:Trigger(is_on)
	if self.task ~= nil then
		self.task:Cancel()
		self.task = nil
	end
	if is_on then
		self.task = self.inst:DoPeriodicTask(1, function()
			self:LeaderHounds()
		end)
	end
end

return SkyHoundWarg