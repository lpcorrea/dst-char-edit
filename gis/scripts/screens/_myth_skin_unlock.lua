local Screen = require "widgets/screen"
local Text = require "widgets/text"
local Image = require "widgets/image"
local TextEdit = require "widgets/textedit"
local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local TextButton = require "widgets/textbutton"
local UIAnim = require "widgets/uianim"

local Yuyan = rawget(_G, 'MK_MOD_LANGUAGE_SETTING')

local L = Yuyan ~= nil and Yuyan == "ENGLISH" and true or false

local TextEditLinked = Class(TextEdit, function(self, font, size, text, colour)
    TextEdit._ctor(self, font, size, text, colour)
    --self:SetAllowClipboardPaste(true)
    self.force_edit = true
    self:SetColour({1,1,1,1})
end)

function TextEditLinked:SetNextTextEdit(next_te)
	self.next_text_edit = next_te
end

function TextEditLinked:SetLastTextEdit(last_te)
	self.last_text_edit = last_te
end

function TextEditLinked:OnTextInput(text)
	--将字母转换为大写, 去掉-
	text = text:upper():gsub('-', '')
    if self.limit then
        local str = self:GetString()
        if string.len(str) >= self.limit then
			if self.next_text_edit == nil then
				return false
			else
				self:SetEditing(false)
                self.next_text_edit:SetEditing(true)
				return self.next_text_edit:OnTextInput(text)
			end
        end
    end
	TextEditLinked._base.OnTextInput(self, text)
	if self.OnTextInputted then
		self.OnTextInputted()
	end
end

local function IsPasteKey(key)
	if TheSim:GetGameID() == 'DS' then return false end
    if key == KEY_V then
        if PLATFORM == "OSX_STEAM" then
            return TheInput:IsKeyDown(KEY_LSUPER) or TheInput:IsKeyDown(KEY_RSUPER)
        end
        return TheInput:IsKeyDown(KEY_CTRL)
    end
    return key == KEY_INSERT and PLATFORM == "LINUX_STEAM" and TheInput:IsKeyDown(KEY_SHIFT)
end

function TextEditLinked:OnRawKey(key, down)
	if down and self.editing then
		if key == KEY_BACKSPACE then
			if self.OnTextInputted then --将删除视为一次键入, 触发按钮变灰
				self.OnTextInputted(0)
			end
			local str = self:GetString()
			if string.len(str) == 0 and self.last_text_edit ~= nil then
				self:SetEditing(false)
				self.last_text_edit:SetEditing(true)
				self.last_text_edit:SetString(self.last_text_edit:GetString()) --HACK to set the cursor to the end
				return self.last_text_edit:OnRawKey(key, down)
			end
		elseif key == KEY_TAB then
			if self.next_text_edit then
				self.next_text_edit:SetEditing(true)
			end
        elseif IsPasteKey(key) then
			local clipboard = TheSim:GetClipboardData():gsub("-", '')
			if self.OnLargePaste ~= nil and #clipboard > self.limit then
				self:OnLargePaste()
				if self.OnTextInputted ~= nil then
					self.OnTextInputted()
				end
				return true
			else
                self.pasting = true
                if self.next_text_edit ~= nil then
                    self.next_text_edit.pasting = true
                end
				for i=1,#clipboard do
					local char = clipboard:sub(i,i)
                    local success, overflow = self:OnTextInput(char)
					if not success and self.next_text_edit ~= nil then
						success, overflow = self.next_text_edit:OnTextInput(char)
					end
                    if overflow then
                        break
                    end
                end
                self.pasting = false
                if self.next_text_edit ~= nil then
                    self.next_text_edit.pasting = false
                end
				if self.OnTextInputted ~= nil then
					self.OnTextInputted()
				end
				return true
			end
		end
	end
	return TextEditLinked._base.OnRawKey(self, key, down)
end

local NUM_CODE_GROUPS = 4
local DIGITS_PER_GROUP = 4
local DIGIT_WIDTH = 19
local CODE_LENGTH = 16

local VALID_CHARS = [[-0123456789]]
for i = 0, 25 do
	VALID_CHARS = VALID_CHARS .. string.char(97+i) .. string.char(65+i)
end

-------
-------
-------
local function getprefab(skin)
	for _, p in ipairs{"monkey_king", 'neza', 'white_bone'}do
		if skin:find(p) then
			return p
		end
	end
end


local URLS  = {
	monkey_king_sea = "",--皮肤和对应的网址



}
local RedeemDialog = Class(Screen, function(self, skinitem)
	Screen._ctor(self, "SkinUnlockDialog")
	assert(skinitem, "No skinitem pass in!!! 少传了个参数哦")

	self.skinitem = skinitem
	
    local buttons =
    {
        {text=L and 'Submit' or '提交', cb = function() self:DoSubmitCode() end },
        {text=L and 'Cancel' or '关闭', cb = function() self:Close() end },
        {text=L and 'Get code' or '获取兑换码', cb = function() VisitURL('http://62.234.133.241:90/redirect/getcode/') end},
        {text=L and 'Q&A' or '问题反馈', cb = function() VisitURL('http://62.234.133.241:90/redirect/qa/') end},
    }
	if IsConsole() then
		buttons = nil
		NUM_CODE_GROUPS = 1
		DIGITS_PER_GROUP = CODE_LENGTH --allow the users to include the hyphens or spaces when they enter text
	end

    self.root = self:AddChild(Widget('root'))
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetVAnchor(ANCHOR_MIDDLE)
    self.root:SetScaleMode(SCALEMODE_PROPORTIONAL)

	local bg = self.root:AddChild(Image('images/hud/myth_skin_unlock_dst.xml', 'myth_skin_unlock_dst.tex'))
	bg:SetSize(700, 432)

	--左上角标题
	local skinstr = STRINGS.UI.RARITY[self.skinitem:upper()]
	assert(skinstr, "Skin item is wrong")
	local str = string.format(L and "Unlock \"%s\" skin?" or "解锁皮肤%s?", skinstr)
    self.title = self.root:AddChild(Text(TITLEFONT, 40, str))
    self.title:SetPosition(0, 160)
    self.title:SetRegionSize(600, 50)
    self.title:SetHAlign(ANCHOR_LEFT)

    --anim进度条
    local bar = self.root:AddChild(UIAnim())
    bar:GetAnimState():SetBank("myth_playtimebar")
    bar:GetAnimState():SetBuild("myth_playtimebar")
    bar:GetAnimState():SetPercent("anim", 0)
    bar:SetPosition(-300, 40)
    bar:SetScale(0.6)

    --百分比
    local num = self.root:AddChild(Text(UIFONT, 30, 'x%'))
    num:SetPosition(140, 38)
    --num:SetColour(0.25,0.75,0.25,1)

    --解锁!
    local usetime = num:AddChild(TextButton())
    usetime:SetPosition(80, 0)
    usetime:SetTextSize(30)
    usetime:SetFont(UIFONT)
    usetime:SetText( L and '[Unlock]' or '[解锁]')
    usetime:SetColour(0.5,0.5,0.5,1)
    usetime:SetClickable(false)
    usetime:SetOnClick(function()
    	local url = string.format("http://62.234.133.241:90/usetime/dst/%s/%s/", GetIDHash8(), self.skinitem)
    	TheSim:QueryServer(url, function(result, suc)
    		if suc and result then
    			if result == '<LW>OK</LW>' then
    				Mythwords_ForceSync()
    				TheFrontEnd:PopScreen()
    			end
    		end
    	end)
    end)

   	--设置进度ui
   	local function SetPlayTime()
	   	local data = Myth_PlayTime
	   	local prefab = getprefab(self.skinitem)
	   	local percent = tonumber(data[prefab])
	   	-- print("1111", data, prefab, percent)
	   	-- percent = 1.2
	   	if percent then
	   		local str = string.format("%d%%", math.floor(percent*100))
	   		if str == '120%' then str = '120% (MAX)' end
	   		num:SetString(str)
	   		bar:GetAnimState():SetPercent("anim", percent)
	   		if percent >= 1 then
	   			usetime:SetClickable(true)
	   			usetime:SetColour(0.25,0.75,0.25,1)
	   			usetime:SetOverColour(0.4, 0.9, 0.4, 1)
	   		end
	   	else
	   		num:SetString("??%")
	   	end
	end
	   
	SetPlayTime()
	--self.inst:ListenForEvent('skinEvent_getplaytime', SetPlayTime, MK_evententity)

   	--详细介绍
   	local desc1 = self.root:AddChild(Text(UIFONT, 30,
   	 	L and '1) Play with this character, fill the bar, then unlock the skin!' 
   	 		or 
   	 	'① 用这名角色进行游戏, 积累进度条, 达到100%后即可解锁皮肤!')
   	)
   	desc1:SetPosition(0,100)
   	desc1:SetRegionSize(600, 120)
   	desc1:SetHAlign(ANCHOR_LEFT)
   	desc1:EnableWordWrap(true)

   	--分割线----------------------

    --激活码
   	local desc2 = self.root:AddChild(Text(UIFONT, 30,
   	 	L and '2) Or enter the redeem code and get the skin immediately!' or 
   	 	'② 亦可输入兑换码, 立刻获得皮肤!')
   	)
   	desc2:SetPosition(0,-30)
   	desc2:SetRegionSize(600, 100)
   	desc2:SetHAlign(ANCHOR_LEFT)
   	desc2:EnableWordWrap(true)
   	--ui内容后续还会改动, 所以赋值
   	self.text = desc2

   	local function _enable(self)
   		self:SetColour(0.9,0.8,0.6,1)
   		self:SetOverColour(1,1,1,1)
   		self:SetClickable(true)
	end

	local function _disable(self)
		self:SetClickable(false)
		self:SetColour(0.4,0.4,0.4,1)
	end

    self.buttons = {}
    for i, v in ipairs(buttons or {})do
    	self.buttons[i] = self.root:AddChild(TextButton())
    	self.buttons[i]:SetOnClick(v.cb)
    	self.buttons[i]:SetFont(UIFONT)
    	self.buttons[i]:SetText(v.text)
    	self.buttons[i]:SetTextSize(35)
    	self.buttons[i]:SetPosition((i-1-(#buttons-1)/2)* 137, -130)
    	self.buttons[i]._enable = _enable
    	self.buttons[i]._disable = _disable
    	self.buttons[i]:SetColour(0.9,0.8,0.6,1)
   		self.buttons[i]:SetOverColour(1,1,1,1)
    end

    self.proot = self.root:AddChild(Widget("proot"))
    self.proot:SetPosition(0, -40)

    self:MakeTextEntryBox(self.proot)

	self.redeem_in_progress = false

	if IsNotConsole() then
	    self.submit_btn = self.buttons[1]
	    self.submit_btn:_disable()
	end

	self.default_focus = self.dialog
	self.firsttime = true
end)

function RedeemDialog:OnBecomeActive()
    self._base.OnBecomeActive(self)
    self.entrybox.textboxes[1]:SetFocus()
    if IsNotConsole() or self.firsttime then
    	self.entrybox.textboxes[1]:SetEditing(true)
    	self.firsttime = false
    end
end

function RedeemDialog:MakeTextEntryBox(parent)
    local entrybox = parent:AddChild(Widget("entrybox"))
    local box_size = DIGIT_WIDTH * DIGITS_PER_GROUP
    local box_y = 40

   	entrybox.bgs = {}
    entrybox.textboxes = {}

    for i = 1, NUM_CODE_GROUPS do
		entrybox.textboxes[i] = parent:AddChild(TextEditLinked( CODEFONT, 35, nil, {.1, .1, .1, 1}))
		entrybox.textboxes[i]:MoveToFront()
		entrybox.textboxes[i]:SetForceEdit(true)
		entrybox.textboxes[i]:SetRegionSize( box_size, box_y )
		entrybox.textboxes[i]:SetHAlign(ANCHOR_LEFT)
		entrybox.textboxes[i]:SetVAlign(ANCHOR_MIDDLE)
		entrybox.textboxes[i]:SetTextLengthLimit(DIGITS_PER_GROUP)
		entrybox.textboxes[i]:SetCharacterFilter( VALID_CHARS )
		entrybox.textboxes[i]:EnableWordWrap(false)
		entrybox.textboxes[i]:EnableScrollEditWindow(false)
		entrybox.textboxes[i]:SetForceUpperCase(true)
		entrybox.textboxes[i]:SetString('')
		entrybox.textboxes[i]:SetPosition(((i-1) - (NUM_CODE_GROUPS/2-0.5))*143+5, -45, 0)

		entrybox.textboxes[i].OnTextInputted = function(flag)
			if flag == 0 then
				if self.submit_btn then
					self.submit_btn:_disable()
					return
				end
			end
			for i = 1, NUM_CODE_GROUPS do
				if string.len(entrybox.textboxes[i]:GetString()) ~= entrybox.textboxes[i].limit then
					-- if any box is full, we're not ready yet
					if IsConsole() then
						self.entrybox.textboxes[1]:SetFocus()
					else
						if self.submit_btn then
							self.submit_btn:_disable()
						end
					end
					return
				end
			end
			if self.submit_btn then
				self.submit_btn:_enable()
			end
		end

		entrybox.textboxes[i].OnTextEntered = function()
			if not self.redeem_in_progress then
				local redeem_code = ""
                if IsConsole() then
                    redeem_code = entrybox.textboxes[1]:GetString()
                    redeem_code = redeem_code:gsub("-", "")
                    entrybox.textboxes[1]:SetString(redeem_code)
                else
                    for i = 1, NUM_CODE_GROUPS do
					    redeem_code	= redeem_code .. entrybox.textboxes[i]:GetString() 
				    end
                end
				if string.len(redeem_code) == CODE_LENGTH then
					self.text:SetString("")
					if IsConsole() then
						self.entrybox.textboxes[1]:SetFocus()
					else
						if self.submit_btn then
							self.submit_btn:_enable()
						end
					end
					self.redeem_in_progress = true
					self.redeem_code_input = redeem_code
					local playerid = GetIDHash8()
					TheSim:QueryServer(string.format('http://62.234.133.241:90/code/use/dst/%s/%s/%s/', playerid, redeem_code, self.skinitem),
					function(str, suc, ...)
						if suc and str then
							local _, _, result = str:find("<LW>(.+)</LW>")
							self:DisplayResult(result or "SERVER_WRONG")
						else
							self:DisplayResult("NO_NET")
						end
					end, "GET")
				end
			end
		end

		entrybox.textboxes[i].OnLargePaste = function()
			local clipboard = TheSim:GetClipboardData():gsub("-", '')

			--clear invalid characters
			local res = ""
			for i=1,#clipboard do
				local char = clipboard:sub(i,i)
				if string.find(VALID_CHARS, char, 1, true) then
					res = res .. char
				end
			end
			clipboard = res

			local i = 1
			while #clipboard > 0 and i <= NUM_CODE_GROUPS do
				local seg = clipboard:sub(1,DIGITS_PER_GROUP)
				clipboard = clipboard:sub(DIGITS_PER_GROUP+1)
				entrybox.textboxes[i]:SetString(seg)
				entrybox.textboxes[i]:SetEditing(true)
				i = i + 1
			end

			return true
		end

		if i > 1 then
			entrybox.textboxes[i-1]:SetNextTextEdit(entrybox.textboxes[i])
			entrybox.textboxes[i]:SetLastTextEdit(entrybox.textboxes[i-1])
		end
   	end

    self.entrybox = entrybox
end

local ThankYouPopup = require "screens/thankyoupopup"
function RedeemDialog:DisplayResult(result)
	if self.submit_btn then
    	self.submit_btn:_disable()
    end
    self.redeem_in_progress = false 

    if result == 'OK' then
    	--self.text:Hide()
    	--self.title:Show()

    	local str = L and 'Successfully unlocked [%s], thanks for your support!' or '已成功解锁[%s], 感谢您的支持!'
    	local skinstring = STRINGS.UI.RARITY[self.skinitem:upper()]
    	self.text:Show()
    	self.text:SetString(string.format(str, skinstring or ''))
    	Mythwords_ForceSync()
		TheFrontEnd:PushScreen(ThankYouPopup({{ item = self.skinitem, item_id = 0, gifttype = "MYTH_SKINITEM" }}))
    else
		if result == 'USED' then
			self.text:SetString(L and 'This code has already been redeemed. Maybe by you?'
				or '兑换码已被使用')
		elseif result == 'PRICE' then
			self.text:SetString(L and 'This code cannot unlock this skin'
				 or '这个皮肤不能被本兑换码解锁')
		elseif result == 'NULL' then
			self.text:SetString(L and 'That code wasn\'t quite right. Please try again.'
				or '输入错误..')
		elseif result == 'DENY' then
			self.text:SetString(L and 'There are TOO many errors. The server denied you access.'
				or '错误次数过多, 服务器已拒绝您的访问')
		elseif result == 'NO_NET' then
			self.text:SetString(L and 'Sorry, it looks like the server\'s not answering right now. Please try again later.'
				or '请检查网络连接')
		elseif result == 'SERVER_WRONG' then
			self.text:SetString(L and 'Sorry, the server is under maintenance, please try again later.' 
				or '对不起, 服务器正在维护中, 请稍后再试..')
		end
		self.text:Show()
	end
end

function RedeemDialog:OnRawKey(key, down)
    if RedeemDialog._base.OnRawKey(self, key, down) then return true end

	if down and IsPasteKey(key) then
		local clipboard = TheSim:GetClipboardData():gsub("-", '')
		if #clipboard > DIGITS_PER_GROUP then
			self.entrybox.textboxes[1]:OnLargePaste()
			return true
		else
			for i = 1, NUM_CODE_GROUPS do
				if #self.entrybox.textboxes[i]:GetString() < DIGITS_PER_GROUP then
					self.entrybox.textboxes[i]:SetEditing(true)
					self.entrybox.textboxes[i]:OnRawKey(key, down)
					return true
				end
			end
		end
	end
	return false
end

function RedeemDialog:OnControl(control, down)
    if RedeemDialog._base.OnControl(self,control, down) then return true end

    if control == CONTROL_CANCEL and not down then   
        self:Close()
        return true
    end
end

function RedeemDialog:DoSubmitCode()	
	self.entrybox.textboxes[1]:OnTextEntered()
end

function RedeemDialog:Close()
    TheFrontEnd:PopScreen()
end

function RedeemDialog:GetHelpText()
	local controller_id = TheInput:GetControllerID()
	local t = {}
	if self.buttons and #self.buttons > 1 and self.buttons[#self.buttons] then
        table.insert(t, TheInput:GetLocalizedControl(controller_id, CONTROL_CANCEL) .. " " .. STRINGS.UI.HELP.BACK)	
    end

    if IsConsole() then
        table.insert(t, TheInput:GetLocalizedControl(controller_id, CONTROL_CANCEL) .. " " .. STRINGS.UI.HELP.BACK)	
    end
	return table.concat(t, "  ")
end

return RedeemDialog
