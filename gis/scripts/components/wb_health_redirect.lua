

local function onredirect(self,redirect)
	if redirect then
		self.inst._isredirecthealth:set(true)
	else
		self.inst._isredirecthealth:set(false)
	end
end

local  white_bone_cloak = Class(function(self, inst)
	self.inst = inst
	self.redirect = true
	self.cd = 240
    self.targettime = nil
end,
nil,
{
	redirect = onredirect,
}
)
local function donetime(inst,self)
	self.redirect = true
    self.targettime = nil
end

function white_bone_cloak:CanRedirect()
	return  self.redirect
end

function white_bone_cloak:CD(time)
    local time = time or self.cd
    self.targettime = GetTime() + time
	self.redirect = false
    if self.task ~= nil then
        self.task:Cancel()
    end
    self.task = self.inst:DoTaskInTime(time, donetime, self)
end

function white_bone_cloak:OnSave(time)
    local remainingtime = self.targettime ~= nil and self.targettime - GetTime() or 0
    return remainingtime ~= 0 and { remainingtime =  remainingtime } or nil
end

function white_bone_cloak:OnLoad(data)
    if data.remainingtime ~= nil then
        self:CD(data.remainingtime)
	end
end

return white_bone_cloak


