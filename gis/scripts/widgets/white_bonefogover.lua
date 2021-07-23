local Widget = require "widgets/widget"
local UIAnim = require "widgets/uianim"

local White_BoneFogOver = Class(Widget, function(self, owner)
    self.owner = owner
    Widget._ctor(self, "White_BoneFogOver")
    self:SetClickable(false)

    self.bg2 = self:AddChild(Image("images/hud/white_bonefogover.xml", "white_bonefogover.tex"))
    self.bg2:SetVRegPoint(ANCHOR_MIDDLE)
    self.bg2:SetHRegPoint(ANCHOR_MIDDLE)
    self.bg2:SetVAnchor(ANCHOR_MIDDLE)
    self.bg2:SetHAnchor(ANCHOR_MIDDLE)
    self.bg2:SetScaleMode(SCALEMODE_FILLSCREEN)
	
	self.totalalpha = 0.6

	self.bg2:SetTint(1, 1, 1, self.totalalpha)

    self.alpha = 0
    self.alphagoal = 0
    self.transitiontime = 2
    self.time = self.transitiontime
    self:Hide()
    self.inst:ListenForEvent("inwbfogdirty", function(inst)
		if inst._inwbfog:value() == true then
			self:StartFog()
		else
			self:StopFog()		
		end
	end,self.owner)

    self.inst:ListenForEvent("wbfogalpha", function(inst,alpha)
		if alpha ~= nil and self.shown and self.totalalpha ~= alpha then
            self.totalalpha = alpha 
            self.bg2:SetTint(1, 1, 1, alpha)
		end
	end,self.owner)
end)

function White_BoneFogOver:StartFog()
    if not self.foggy then
        self.time = self.transitiontime
        self.alphagoal = self.totalalpha
        self.foggy = true
		self.bg2:SetTint(1, 1, 1, 0)
        self:StartUpdating()
        self:Show()
    end
end

function White_BoneFogOver:StopFog()
    if self.foggy then
        self.time = self.transitiontime
        self.alphagoal = 0
        self.foggy = false
    end
end

function White_BoneFogOver:UpdateAlpha(dt)
    if self.alphagoal ~= self.alpha then
        if self.time > 0 then
            self.time = math.max(0, self.time - dt)
            if self.alphagoal < self.alpha then
                self.alpha = Remap(self.time, self.transitiontime, 0, self.totalalpha, 0)
            else
                self.alpha = Remap(self.time, self.transitiontime, 0, 0, self.totalalpha)
            end
        end
    end
end

function White_BoneFogOver:OnUpdate(dt)

    self:UpdateAlpha(dt)

	if self.owner:HasTag("skyeye") or self.owner:HasTag("fireeye") then
		if self.shown then
			self:Hide()
		end
	elseif not self.shown then
		self:Show()
	end
    self.bg2:SetTint(1, 1, 1, self.alpha)
	
    if self.alpha == 0 and self.alphagoal == 0 then
        self:Hide()
        self:StopUpdating()
    end
end

return White_BoneFogOver
