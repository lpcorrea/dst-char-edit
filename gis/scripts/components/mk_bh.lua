
local function oncanuse(self,canuse)
	if canuse then
		self.inst:AddTag("cansuemk_bh")
	else
		self.inst:RemoveTag("cansuemk_bh")		
	end
end

local mk_bh = Class(function(self, inst)
	self.inst = inst
	self.onusefn = nil
	self.canuse = true
	self.timecd = nil
	self.targettime = nil
end,
nil,
{
	canuse = oncanuse
}
)


function mk_bh:SetOnUseFn(fn)
	self.onusefn = fn
end

function mk_bh:SetTime(time)
	self.timecd = time
end

local function docdover(inst, self)
    self.task = nil
    self.targettime = nil
    self.canuse = true
end

function mk_bh:OnChange(target)
	if self.onusefn ~= nil then
		self.onusefn(self.inst)
		if self.timecd ~= nil and self.targettime == nil then
			self.canuse = false
			self.targettime = GetTime() + self.timecd
			if self.task ~= nil then
				self.task:Cancel()
			end
			self.task = self.inst:DoTaskInTime(self.timecd, docdover, self)
		end
		return true
	end
end

function mk_bh:OnSave()
    local remainingtime = self.targettime ~= nil and self.targettime - GetTime() or 0
    return
    {
		canuse = self.canuse,
        remainingtime = remainingtime > 0 and remainingtime or nil,
    }
end

function mk_bh:OnLoad(data)
	if data then
		if data.canuse ~= nil then
			self.canuse = data.canuse
		end
		if data.remainingtime ~= nil then
			self.targettime = GetTime() + math.max(0, data.remainingtime)
			self.task = self.inst:DoTaskInTime(data.remainingtime, docdover, self)
		end
	end
end
function mk_bh:LongUpdate(dt)
	if  self.targettime ~= nil then
		if self.task ~= nil then
			self.task:Cancel()
		end
		if self.targettime - dt > GetTime() then
			self.targettime = self.targettime - dt
			self.task = self.inst:DoTaskInTime(self.targettime - GetTime(), docdover, self)
			dt = 0 
		else
			dt = dt - self.targettime + GetTime()
			docdover(self.inst, self)
		end
	end
end

return mk_bh