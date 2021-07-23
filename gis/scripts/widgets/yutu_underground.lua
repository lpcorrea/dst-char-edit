local Widget = require "widgets/widget"
local Image = require "widgets/image"


local yutu_underground = Class(Widget, function(self, owner)
    self.owner = owner
    Widget._ctor(self, "yutu_underground")
	self:SetClickable(false)

	self.img = self:AddChild(Image("images/hud/yutu_underground.xml", "yutu_underground.tex"))
	self.img:SetEffect( "shaders/uifade.ksh" )
    self.img:SetHAnchor(ANCHOR_MIDDLE)
    self.img:SetVAnchor(ANCHOR_MIDDLE)
    self.img:SetScaleMode(SCALEMODE_FILLSCREEN)

    self:Hide()
    
    self.inst:ListenForEvent("undergrounddirty", function() 
		if self.owner._underground ~= nil and self.owner._underground:value() then
			self:Show() 
		else
			self:Hide()
		end
	end, self.owner)
end)


return yutu_underground