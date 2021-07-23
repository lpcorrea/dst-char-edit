--- 1. 二维码
--- 2. CDK

local Screen = require "widgets/screen"
local Text = require "widgets/text"
local Image = require "widgets/image"
local TextEdit = require "widgets/textedit"
local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local TextButton = require "widgets/textbutton"
local UIAnim = require "widgets/uianim"
local QRCode = require "widgets/myth_qrcode"

local Yuyan = rawget(_G, 'MK_MOD_LANGUAGE_SETTING')

local L = Yuyan ~= nil and Yuyan == "ENGLISH" and true or false

local CODE_LENGTH = 16
local VALID_CHARS = "-0123456789"
for i = 0, 25 do
	VALID_CHARS = VALID_CHARS .. string.char(97+i) .. string.char(65+i)
end

---------------------------------------------------------------------

local PayScreen = Class(Screen, function(self, unlockpanel)
	Screen._ctor(self, "SkinUnlockPayScreen")

	local WIDTH, HEIGHT = 400, 300	

	self.poll_count = 0

	self.unlockpanel = unlockpanel
	self.skinitem = unlockpanel.skinitem
	self.skinname = unlockpanel.skinname
	
    local root = self:AddChild(Widget('root'))
    root:SetHAnchor(ANCHOR_MIDDLE)
    root:SetVAnchor(ANCHOR_MIDDLE)
    root:SetScaleMode(SCALEMODE_PROPORTIONAL)

    local bg = root:AddChild((require"widgets/redux/templates").CurlyWindow(WIDTH, HEIGHT, nil, {
    	{text=L and 'Cancel' or '关闭', cb = function() self:Close() end },
    }))
    
    local main_root = root:AddChild(Widget("main_root"))

    local title = main_root:AddChild(Text(TITLEFONT, 40,
    	L and "Unlock skin immediately" or "立刻解锁皮肤", UICOLOURS.GOLD_SELECTED))
    title:SetPosition(0, HEIGHT/2 + 20)
	title:SetHAlign(ANCHOR_MIDDLE)

	local desc = main_root:AddChild(Text(UIFONT, 30, 
		string.format(L and "Use redeem code to unlock '%s' immediately!" or "扫码购买或使用兑换码，即刻解锁「%s」。", self.skinname)))
	desc:SetPosition(0, 120)

	local price = Myth_SkinPrice[self.skinitem]
	local pricedesc = main_root:AddChild(Text(CODEFONT, 30,
		--[[self.skinname .. " "..]] (price and ("¥"..string.format("%0.2f", price)) or ""), {0,.8,0,1}))
	pricedesc:SetPosition(0, 80)

	local method1 = main_root:AddChild(Text(UIFONT, 30, L and "Wechat" or "微信"))
	method1:SetPosition(-120, -80)

	local img1 = method1:AddChild(ImageButton("images/myth_skin_unlock.xml", "alipay.tex"))
	img1:SetPosition(0, 80)
	img1:SetScale(.5)
	
	local method2 = main_root:AddChild(Text(UIFONT, 30, L and "Redeem code" or "兑换码"))
	method2:SetPosition(120, -80)

	local img2 = method2:AddChild(ImageButton("images/myth_skin_unlock.xml", "cdk.tex"))
	img2:SetPosition(0, 80)
	img2:SetScale(.5)

	--- QR
	local qr_root = root:AddChild(Widget("qr_root"))
	qr_root:Hide()
	package.loaded['widgets/myth_qrcode']  =nil

	local qrtitle = qr_root:AddChild(Text(TITLEFONT, 40,
		L and "Connecting to server.." or "正在连接服务器，请耐心等待.."), UICOLOURS.GOLD_SELECTED)
	qrtitle:SetPosition(title:GetPosition())
	self.qrtitle = qrtitle

	local qrsubinfo = qr_root:AddChild(Text(UIFONT, 30, 
		L and "Order is valid within five minutes." or "订单五分钟内有效，以下是订单号"))
	qrsubinfo:Hide()
	qrsubinfo:SetPosition(0, 130)
	qrsubinfo:SetRegionSize(300, 400)
    qrsubinfo:EnableWordWrap(true)
	self.qrsubinfo = qrsubinfo

	local qrtradenumber = qr_root:AddChild(Text(CODEFONT, 25, nil, {1,0.8,0,1}))
	qrtradenumber:SetPosition(0, 100)
	self.qrtradenumber = qrtradenumber

	local qrc = qr_root:AddChild(QRCode())
	qrc:SetScale(.5)
	qrc:SetPosition(0, 0)
	self.qrc = qrc

	img1:SetOnClick(function() 
		main_root:Hide()
		qr_root:Show()
		local i = 0
		qrtitle.ticktask = qrtitle.inst:DoPeriodicTask(1, function()
			i = i < 3 and i + 1 or 1
			qrtitle:SetString((L and "Connecting to server" or "正在连接服务器，请耐心等待")..string.rep(".", i))
		end)
		self:StartPoll(100)
	end)

	-- CDK
	local cdk_root = root:AddChild(Widget("cdk_root"))
	cdk_root:Hide()

	local cdktitile = cdk_root:AddChild(Text(TITLEFONT, 40, 
		L and "Input your redeem code" or "请输入兑换码"))
	cdktitile:SetPosition(title:GetPosition())

	local BOX_WIDTH = 295

	local editbg = cdk_root:AddChild(Image("images/ui.xml", "white.tex"))
	editbg:SetTint(0.4, 0.3, 0.2, 1)
	editbg:SetSize(BOX_WIDTH, 40)
	editbg:SetPosition(0, 80)

	local function _format_cdk(s)
		s = string.gsub(s, "-", "")
		local temp = {}
		local i = 1
		local l = #s
		while i <= l do
			table.insert(temp, string.sub(s, i, i+3))
			i = i+4
		end
		return table.concat(temp, "-")
	end

	local editbox = editbg:AddChild(TextEdit(CODEFONT, 30, nil, {1,1,1,1}))
	editbox:SetForceEdit(true)
	editbox:SetRegionSize(BOX_WIDTH-20, 30)
	editbox:SetHAlign(ANCHOR_LEFT)
	editbox:SetVAlign(ANCHOR_MIDDLE)
	editbox:SetTextLengthLimit(16+3)
	editbox:SetCharacterFilter(VALID_CHARS)
	editbox:EnableWordWrap(false)
	editbox:SetForceUpperCase(true)
	editbox:SetColour(1,1,1,1)
	editbox:SetEditTextColour(1,1,1,1)
	editbox:SetIdleTextColour(0.8,0.8,0.8,1)
	editbox:SetEditCursorColour(1,1,1,1)

	editbox.OnTextInputted = function()
		local s = editbox:GetString()
		editbox:SetString(_format_cdk(s))
		if #string.gsub(s, "-", "") >= CODE_LENGTH then
			self.submit_btn:Enable()
		else
			self.submit_btn:Disable()
		end
	end	

	editbox.OnTextEntered = function()
		if not self.redeem_in_progress then
			local redeem_code = editbox:GetString():gsub("-", "")
			if string.len(redeem_code) == CODE_LENGTH then
				self.redeem_in_progress = true
				self.redeem_code_input = redeem_code
				Myth_CDK(redeem_code, self.skinitem, function(result)
					if not self.inst:IsValid() then
						return
					end
					local _, _, r = string.find(result, "<LW>(.+)</LW>")
					self:DisplayResult(r or "NO_NET")
				end)
			else
				self.infotext:SetString(L and "Wrong length." or "兑换码必须是16位！")
			end
		end
	end
	editbox.OnLargePaste = function()
		local clipboard = TheSim:GetClipboardData()

		--clear invalid characters
		local res = ""
		for i=1,#clipboard do
			local char = clipboard:sub(i,i)
			if string.find(VALID_CHARS, char, 1, true) then
				res = res .. char
			end
		end

		editbox:SetString(_format_cdk(res))
		return true
	end

	local clearbt = editbox:AddChild(TextButton())
	clearbt:SetText(L and "Clear" or "清空")
	clearbt:SetPosition(-100, -50)
	clearbt:SetOnClick(function()
		editbox:SetString("")
		editbox:OnTextInputted()
	end)

    local submit_btn = editbox:AddChild(TextButton())
    submit_btn:SetText(L and "Submit" or "提交")
    submit_btn:SetOnClick(editbox.OnTextEntered)
    submit_btn:SetTextDisabledColour(0.2,0.2,0.2,1)
    submit_btn:Disable()
    submit_btn:SetPosition(100, -50)
    self.submit_btn = submit_btn

    local infotext = editbox:AddChild(Text(UIFONT, 30, ""))
    infotext:SetPosition(0, -100)
    infotext:SetRegionSize(300, 400)
    infotext:EnableWordWrap(true)
    self.infotext = infotext

	img2:SetOnClick(function()
		main_root:Hide()
		cdk_root:Show()
		editbox:SetEditing(true)
	end)
    
	self.redeem_in_progress = false
end)

function PayScreen:DoPoll()
	if self.poll_count > 0 then
		self.poll_count = self.poll_count - 1
	else
		TheFrontEnd:PopScreen(self)
		return
	end
	Myth_Purchase(self.skinitem, function(result)
		if not self.inst:IsValid() then
			-- print("Invalid GUI")
			return
		end
		if self.qrtitle.ticktask then
			self.qrtitle.ticktask:Cancel()
		end
		if result == "HAS" then
			Myth_PushSkinScreen(self.skinitem, {self, self.unlockpanel})	
		elseif type(result) == "table" then
			local data = result
			self.qrtitle:SetString(L and "Please use Wechat to scan the QR code" or "请使用微信扫描二维码")
			self.qrc:SetURL(data.qrcode)
			self.qrsubinfo:Show()
			self.qrtradenumber:SetString(data.out_trade_no)
			self.polltask = self.inst:DoTaskInTime(3, function() self:DoPoll() end)
			return
		end
		self.qrtitle:SetString(L and "Link failed" or "连接失败")
		self.qrsubinfo:Show()
		if result == "" then result = "0" end
		if result == "BUSY" then
			self.qrsubinfo:SetString(L and "The server is busy, please try again later." or "服务器繁忙，请五分钟后再试。")
		elseif result == "ERROR" then
			self.qrsubinfo:SetString(L and "Server error." or "服务器发生错误，请联系开发者。")
		else
			self.qrsubinfo:SetString("错误信息: "..result)
		end
		self.qrtradenumber:SetString("")
		self.qrc:SetError()
	end)
end

function PayScreen:StartPoll(max_tries)
	self.poll_count = max_tries
	self:DoPoll()
end

function PayScreen:DisplayResult(result)
    self.submit_btn:Disable()
    self.redeem_in_progress = false 

    if result == 'OK' or result == 'HAS' then
    	Mythwords_ForceSync()
    	Myth_PushSkinScreen(self.skinitem, {self, self.unlockpanel})		
    else
    	local function _set(s)
    		self.infotext:SetString(s)
    	end
		if result == 'USED' then
			_set(L and 'This code has already been redeemed. Maybe by you?' or '兑换码已被使用。')
		elseif result == 'PRICE' then
			_set(L and 'This code cannot unlock this skin.' or '这个皮肤不能被本兑换码解锁。')
		elseif result == 'NULL' then
			_set(L and 'That code wasn\'t quite right. Please try again.' or '兑换码错误!')
		elseif result == 'NO_NET' then
			_set(L and 'Sorry, it looks like the server is not answering right now. Please try again later.'
				or '服务器似乎发生了些问题, 请稍后再试。')
		end
	end
end

function PayScreen:OnControl(control, down)
    if PayScreen._base.OnControl(self,control, down) then return true end

    if control == CONTROL_CANCEL and not down then   
        self:Close()
        return true
    end
end

function PayScreen:OnBecomeInactive()
	PayScreen._base.OnBecomeInactive(self)
	if self.polltask then
		self.polltask:Cancel()
	end
end

function PayScreen:Close()
    TheFrontEnd:PopScreen(self)
end

return PayScreen
