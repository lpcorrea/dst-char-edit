local Screen = require "widgets/screen"
local MapWidget = require("widgets/mapwidget")
local Widget = require "widgets/widget"
local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"

local function updateplayerpos(inst,self)
	self:CreatPlayerUi()
end

local yj_self = Class(Screen, function(self, owner,playerinfo)
    Screen._ctor(self, "yj_flysky")
    self.owner = owner
	
	if not self.owner then return end
	
	self.root = self:AddChild(Widget("ROOT"))
    self.root:SetVAnchor(ANCHOR_MIDDLE)
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetPosition(0, 0, 0)
    self.root:SetScaleMode(SCALEMODE_PROPORTIONAL)
	
    self.bg = self.root:AddChild(Image("images/hud.xml", "map.tex"))
    self.bg:SetVRegPoint(ANCHOR_MIDDLE)
    self.bg:SetHRegPoint(ANCHOR_MIDDLE)
    self.bg:SetVAnchor(ANCHOR_MIDDLE)
    self.bg:SetHAnchor(ANCHOR_MIDDLE)
    self.bg:SetScaleMode(SCALEMODE_FILLSCREEN)
	self.bg.inst.ImageWidget:SetBlendMode( BLENDMODE.Premultiplied )
    
    self.minimap = TheWorld.minimap.MiniMap
	
    self.img = self.bg:AddChild(Image())
    self.img.inst.ImageWidget:SetBlendMode( BLENDMODE.Additive )   
	
	self.players = {} 
	self.playerinfo = playerinfo
	
	self.tishi = self.bg:AddChild(Text(NEWFONT_OUTLINE, 30))
	self.tishi:SetPosition(0, 250)
	self.tishi:SetColour(255/255,229/255,160/255,1)
	self.tishi:SetString(STRINGS.YJFLYTS)
	
	local sizi = self.minimap:GetZoom()
	self.minimap:Zoom( 2 - sizi )

	self.lastpos = nil
	self.startpos = self.owner:GetPosition()
	self.startpos.y = 0
	self.repeat_time = 0
	self.target_pos = nil
	self.lock = true
	self.minimap:ResetOffset()
	self.inst:DoTaskInTime(0.1, function() 
		self.lock = false 
		self:CreatPlayerUi()
	end)
end)

local function getxml(prefab)
	if table.contains(DST_CHARACTERLIST, prefab) then
		return "minimap/minimap_data.xml" , prefab..".png"
	elseif softresolvefilepath("images/map_icons/"..prefab..".xml") ~= nil then
		return "images/map_icons/"..prefab..".xml", prefab..".tex"
	else
		return "minimap/minimap_data.xml" , "pigking.png"
	end
end

function yj_self:CreatPlayerUi()
	if self.playerinfo ~= nil then
		local success, b = pcall(json.decode,self.playerinfo)
		if success and b and type(b) == "table" then
			for k,v in ipairs(b) do
				if not self.players[v[1]] then
					local xml,tex = getxml(v[2])
					self.players[v[1]] = self.img:AddChild(ImageButton(xml, tex))
					self.players[v[1]]:SetScale(0.5)
					self.players[v[1]].x = v[3]
					self.players[v[1]].z = v[4]
					self.players[v[1]]:SetOnClick(function()
						self:Teleport(true,v[1])
					end)
				else
					self.players[v[1]].x = v[3]
					self.players[v[1]].z = v[4]
				end
			end
		end
	end
	self:Updatepos()
end

function yj_self:OnBecomeInactive()
    yj_self._base.OnBecomeInactive(self)

    if self.minimap:IsVisible() then
        self.minimap:ToggleVisibility()
    end
end

function yj_self:OnBecomeActive()
    yj_self._base.OnBecomeActive(self)

    if not self.minimap:IsVisible() then
        self.minimap:ToggleVisibility()
    end
	local handle = self.minimap:GetTextureHandle()
	self.img.inst.ImageWidget:SetTextureHandle( handle )
end

function yj_self:OnZoomIn(  )
	if self.shown then
		self.minimap:Zoom( -1 )
	end
	self:Updatepos()
end
function yj_self:OnZoomOut( )
	if self.shown and self.minimap:GetZoom() < 20 then
		self.minimap:Zoom( 1 )
	end
	self:Updatepos()
end

function yj_self:Offset(dx,dy)
	self.minimap:Offset(dx,dy)
end

function yj_self:MapPosToWidgetPos(mappos)
    return Vector3(
        mappos.x * RESOLUTION_X/2,
        mappos.y * RESOLUTION_Y/2,
        0
    )
end

function yj_self:ScreenPosToWidgetPos(screenpos)
    local w, h = TheSim:GetScreenSize()
    return Vector3(
        screenpos.x / w * RESOLUTION_X - RESOLUTION_X/2,
        screenpos.y / h * RESOLUTION_Y - RESOLUTION_Y/2,
        0
    )
end
function yj_self:WidgetPosToMapPos(widgetpos)
    return Vector3(
        widgetpos.x / (RESOLUTION_X/2),
        widgetpos.y / (RESOLUTION_Y/2),
        0
    )
end

local function GetMapPos(self,x,y,z)
	return Vector3(self.minimap:WorldPosToMapPos(x,y,z))
end

function yj_self:End()
    if self.minimap:IsVisible() then
        self.minimap:ToggleVisibility()
    end
	TheFrontEnd:PopScreen()
end

function yj_self:Updatepos(start)
	if self.lock then return end
	for k,v in pairs(self.players) do
		local x,z = v.x,v.z
		local mappos = GetMapPos(self,x,z,0)
		local widgetpos = self:MapPosToWidgetPos(mappos)
		v:SetPosition(widgetpos:Get())
		local sizi = self.minimap:GetZoom()
		local s = Remap(sizi,0,20,0.6,0.2)
		v:SetScale(s)
	end
end

function yj_self:Teleport(player,id)
	self.lock = true
	
    if self.minimap:IsVisible() then
        self.minimap:ToggleVisibility()
    end
	self.inst:DoTaskInTime(0, function()
		SendModRPCToServer(MOD_RPC["yangjian"]["flyfly"], 4,self.players[id].x,self.players[id].z)
		TheFrontEnd:PopScreen()
	end)
end

function yj_self:OnUpdate(dt)

	if self.lock then return end
    if self.repeat_time <= 0 then
        if TheInput:IsControlPressed(CONTROL_MAP_ZOOM_IN ) then
            self:OnZoomIn()
        elseif TheInput:IsControlPressed(CONTROL_MAP_ZOOM_OUT ) then
            self:OnZoomOut()
        end
        self.repeat_time = .025
    else
        self.repeat_time = self.repeat_time - dt
    end
	if TheInput:IsControlPressed(CONTROL_PRIMARY) then
		local pos = TheInput:GetScreenPosition()
		if self.lastpos then
			local scale = 0.25
			local dx = scale * ( pos.x - self.lastpos.x )
			local dy = scale * ( pos.y - self.lastpos.y )
			self.minimap:Offset( dx, dy )
		end
		
		self.lastpos = pos
	else
		self.lastpos = nil
	end	
	
	self:Updatepos()
end

function yj_self:OnControl(control, down)
	if self.lock then return true end
	if yj_self._base.OnControl(self, control, down) then return true end
	
    if not down and  control == CONTROL_CANCEL then
        self:End()
        return true
	end
		
    if not (down and self.shown) then
        return false
    end

    if control == CONTROL_MAP_ZOOM_IN then
        self:OnZoomIn()
        self.repeat_time = .025
    elseif control == CONTROL_MAP_ZOOM_OUT then
        self:OnZoomOut()
        self.repeat_time = .025
    end
    return true
end

return yj_self
