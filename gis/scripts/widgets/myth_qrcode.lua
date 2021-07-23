-- 二维码渲染

local Widget = require "widgets/widget"
local Image = require "widgets/image"

local ERROR_MATRIX = {
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1},
	{1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1},
	{1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1},
	{1,1,1,1,1,1,0,0,1,1,1,1,0,0,1,1,1,1,1,1},
	{1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1},
	{1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1},
	{1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
}

local qrcodematrix = (require "qrcode_gen").qrcode

local Block = Class(Image, function(self, bool, size)
	Image._ctor(self, "images/ui.xml", "white.tex")
	size = size or 32
	if not bool then
		self:SetTint(182/255, 154/255, 112/255, 1)
	else
		self:SetTint(40/255, 33/255, 24/255, 1)
	end
	self:SetSize(size, size)
end)

local WIDTH = 300

local QRCode = Class(Widget, function(self)
	Widget._ctor(self, "QRCode")

	self.blocks = {}
	self.url = ""
	-- self:SetDefault()
end)

function QRCode:SetURL(s)
	self.url = s
	self:SetData(s)
end

function QRCode:SetError()
	self:SetMatrix(ERROR_MATRIX)
end


function QRCode:SetData(s)
	local ok, matrix = qrcodematrix(s)
	if ok then
		self:SetMatrix(matrix, 1)
	end
end

function QRCode:SetMatrix(m, border)
	self:ClearData()

	local N = #m 
	local size = WIDTH/N 
	local border = border or 1
	for i = 1, N + border*2 do
		for j = 1, N + border*2 do
			local _i = i - border
			local _j = j - border
			local bool
			if _i < 1 or _j < 1 or _i > N or _j > N then
				bool = false
			else
				bool = m[_i][_j] > 0
			end

			local block = self:AddChild(Block(bool, size))
			block:SetPosition((j-N/2-border-0.5)*size, -(i-N/2)*size)
			block.i = i 
			block.j = j 
			self.blocks[block] = true
		end 
	end
end




function QRCode:ClearData()
	for k in pairs(self.blocks)do
		k:Kill()
	end
	self.blocks = {}
end

return QRCode
