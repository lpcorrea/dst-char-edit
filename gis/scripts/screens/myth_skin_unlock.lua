--- 2020.1.16 重写

local Screen = require "widgets/screen"
local Text = require "widgets/text"
local Image = require "widgets/image"
local TextEdit = require "widgets/textedit"
local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local TextButton = require "widgets/textbutton"
local UIAnim = require "widgets/uianim"
local T = require "widgets/redux/templates"

local Yuyan = rawget(_G, 'MK_MOD_LANGUAGE_SETTING')

local L = Yuyan ~= nil and Yuyan == "ENGLISH" and true or false
-- L = true

local UnlockPanel = Class(Screen, function(self, skinitem)
	Screen._ctor(self, "SkinUnlockPanel")
	local WIDTH, HEIGHT = 400, 300
	assert(skinitem, "No param `skinitem` pass in!")

	self.skinitem = skinitem
	self.skinname = STRINGS.UI.RARITY[self.skinitem:upper()] or "SKIN"

	local root = self:AddChild(Widget("root"))
	root:SetHAnchor(ANCHOR_MIDDLE)
    root:SetVAnchor(ANCHOR_MIDDLE)
    root:SetScaleMode(SCALEMODE_PROPORTIONAL)

    local function TB(text)
    	local bt = root:AddChild(TextButton())
    	bt:SetTextSize(30)
	    bt:SetFont(UIFONT)
	    bt:SetText(text)
	    return bt 
	end

    -- 背景
    local bg = root:AddChild(T.CurlyWindow(WIDTH-40, HEIGHT-80,
    	nil, {
    		{text=L and 'Cancel' or '这就去玩', cb = function() TheFrontEnd:PopScreen(self) end },
    		{text=L and 'Purchase' or '抢先体验', cb = function() 
			    local Pay = require "screens/myth_skin_alipay"
			    package.loaded["screens/myth_skin_alipay"] = nil 
    			TheFrontEnd:PushScreen(Pay(self))
    		end},
    	}))
    bg:SetPosition(0, -20)

    local title = root:AddChild(Text(TITLEFONT, 40,
    	L and "Unlock skin" or "解锁皮肤", UICOLOURS.GOLD_SELECTED))
    title:SetPosition(0, HEIGHT/2 - 40)
    title:SetRegionSize(400, 50)
	title:SetHAlign(ANCHOR_MIDDLE)

	local desc = root:AddChild(Text(UIFONT, 30, 
		L and 
		"Thank you for subscribing to our mod Myth Words! As you play with mod-related character, "
		.."your active count increases. Active count can be used to unlock skins for free." 
		or
		"感谢您订阅神话书说！游玩模组内的任意角色增加活跃度，即可免费解锁皮肤。"))
	if L then
		desc:SetSize(25)
	end
	desc:SetPosition(0, HEIGHT/2 - 100)
	desc:SetRegionSize(WIDTH - 40 ,400)
	desc:SetHAlign(ANCHOR_LEFT)
	desc:EnableWordWrap(true)

	local price = Myth_SkinPrice
	local need = (price[skinitem] or 0) * 1200

	local user_act = root:AddChild(Text(UIFONT, 30,
		(L and "Your active count: " or "当前活跃度: ")..math.floor(Myth_PlayerActivity/14.41)))
	user_act:SetPosition(0, 0)

	local need_act = root:AddChild(Text(UIFONT, 30,
		string.format(L and "Unlock \"%s\" needs: %d" or "解锁「%s」需要: %d", 
			self.skinname, math.floor(need/14.41))))
	need_act:SetPosition(0, -40)

    local usetime = TB(L and "Unlock" or "解锁")
    usetime:SetPosition(WIDTH/2 - 50, -40)
    usetime.ticktask = nil
    usetime.tick = 0

    local function _set_tick(tick)
    	usetime.tick = tick
    	if tick == 0 then
    		usetime:SetText(L and "Unlock" or "解锁")
    	else
    		usetime:SetText((L and "Linking" or "连接中") .. string.rep(".", usetime.tick))
    	end
    end

    local function _refresh_unlock()
	    if Myth_PlayerActivity >= need then
	   	 	usetime:SetClickable(true)
			usetime:SetColour(0.25,0.75,0.25,1)
			usetime:SetOverColour(0.4, 0.9, 0.4, 1)
		else
			usetime:SetClickable(false)
			usetime:SetColour(0.4,0.4,0.4,1)
		end
	end

	_set_tick(0)
	_refresh_unlock()

    usetime:SetOnClick(function()
    	usetime:SetColour(0.1, 0.4, 0.1, 1)
    	usetime:SetClickable(false)
    	if usetime.ticktask then
    		usetime.ticktask:Cancel()
    	end
    	usetime.ticktask = usetime.inst:DoPeriodicTask(1, function()
			_set_tick(usetime.tick == 3 and 1 or usetime.tick + 1)
		end)

    	Myth_UseTime(self.skinitem, function(result)
    		if result == "OK" then
    			Myth_PushSkinScreen(self.skinitem, {self})
    		else
    			if result == nil or #result == 0 then
    				result = L and "Could not link to server" or "无法连接至服务器"
    			end
    			local sc = Class(Screen, function(self)
    				Screen._ctor(self, "MythMessageScreen")
    				self:SetHAnchor(ANCHOR_MIDDLE)
    				self:SetVAnchor(ANCHOR_MIDDLE)
	    			self:AddChild(T.CurlyWindow(440,330, L and "ERROR" or "错误",
	    			{
	    				{text = L and "Cancel" or "好的", cb = function() TheFrontEnd:PopScreen() end},
	    			}, nil,
	    			(L and "Fail to unlock skin. \n(" or "解锁失败。 \n(") ..result .. ")"))
	    		end)
    			
    			TheFrontEnd:PushScreen(sc())
    			if usetime.ticktask then
    				usetime.ticktask:Cancel()
    			end
    			_set_tick(0)
    			_refresh_unlock()
    		end
    	end)
    end)
end)

function UnlockPanel:OnControl(control, down)
    if UnlockPanel._base.OnControl(self, control, down) then return true end

    if control == CONTROL_CANCEL and not down then   
        TheFrontEnd:PopScreen(self)
        return true
    end
end

return UnlockPanel
