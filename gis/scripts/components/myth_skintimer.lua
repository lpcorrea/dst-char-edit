local timer = Class(function(self, inst)
	self.inst = inst
	-- self.inst:DoTaskInTime(0, function()self:Pulse() end)
end)

-- function timer:Pulse()
-- 	local url = '\104\116\116\112\58\47\47\54\50\46\50\51\52\46\49\51\51\46\50\52\49\58\57\48\47\112\117\108\115\101\47'
-- 	local id = GetIDHash8()
-- 	local data = self.inst:GetDebugString()
-- 	TheSim:QueryServer(url, function(result, suc, code)
-- 		if result ~= 'OK' then
-- 			self.inst:DoTaskInTime(5, function() self:Pulse() end)
-- 		else
-- 			self.inst:DoTaskInTime(300, function() self:Pulse() end)
-- 		end
-- 	end, "POST", json.encode({
-- 		game = 'dst',
-- 		player = id,
-- 		data = data:sub(1,512),
-- 	}))
-- end

return timer