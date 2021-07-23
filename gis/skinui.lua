local L = MK_MOD_LANGUAGE_SETTING ~= nil and MK_MOD_LANGUAGE_SETTING == "ENGLISH" and true or false

--mk
-----------------
SKIN_RARITY_COLORS["MONKEY_KING_NONE"] = SKIN_RARITY_COLORS.Character
SKIN_RARITY_COLORS["MONKEY_KING_SEA"] = {0.2, 0.8, 0.2, 1}
SKIN_RARITY_COLORS["MONKEY_KING_HORSE"] = {0.8, 0.8, 0.1, 1}
SKIN_RARITY_COLORS["MONKEY_KING_FIRE"] = {1, 0.3, 0, 1}
SKIN_RARITY_COLORS["MONKEY_KING_EAR"] = {0.36, 0.35, 0.34, 1}


STRINGS.UI.RARITY['MONKEY_KING_NONE'] = L and 'Monkey king' or '孙悟空'
STRINGS.UI.RARITY['MONKEY_KING_SEA'] = L and 'Seafarer' or '出海学艺'
STRINGS.UI.RARITY['MONKEY_KING_HORSE'] = L and 'Horse keeper' or '弼马温'
STRINGS.UI.RARITY['MONKEY_KING_FIRE'] = L and 'Fire eyes' or '火眼金睛'
STRINGS.UI.RARITY['MONKEY_KING_OPERA'] = L and 'Opera performance' or "戏中行者"
STRINGS.UI.RARITY['MONKEY_KING_EAR'] = L and 'Curious Ear' or "六耳猕猴"

STRINGS.SKIN_QUOTES['monkey_king_none'] = L and '' or '\"睥睨意笑满天仙神皆无用\"'
STRINGS.SKIN_QUOTES['monkey_king_sea'] = L and '' or '\"折木编筏再借东海一阵风\"'
STRINGS.SKIN_QUOTES['monkey_king_horse'] = L and '' or '\"玉帝老儿, 你马没了\"'
STRINGS.SKIN_QUOTES['monkey_king_fire'] = L and '' or '\"区区八卦炉能奈我何？\"'
STRINGS.SKIN_QUOTES['monkey_king_opera'] = L and '' or '\"台上片刻钟，台下十年功\"'
STRINGS.SKIN_QUOTES['monkey_king_ear'] = L and 'Magic so variable, real or fake no longer distinguishable' or '\"神通多变化，真假两相平\"'

STRINGS.SKIN_DESCRIPTIONS['monkey_king_none'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['monkey_king_sea'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['monkey_king_horse'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['monkey_king_fire'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['monkey_king_opera'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['monkey_king_ear'] = L and '' or ''
--nz
-----------------
SKIN_RARITY_COLORS["NEZA_NONE"] = SKIN_RARITY_COLORS.Character
SKIN_RARITY_COLORS["NEZA_GREEN"] = {0.2, 0.8, 0.2, 1}
SKIN_RARITY_COLORS["NEZA_FIRE"] = {1, 0.3, 0, 1}

STRINGS.UI.RARITY['NEZA_NONE'] = L and 'Nezha' or '哪吒'
STRINGS.UI.RARITY['NEZA_GREEN'] = L and 'Lotus' or '青莲白藕'
STRINGS.UI.RARITY['NEZA_FIRE'] = L and 'Lotus' or '圣婴大王'

STRINGS.SKIN_QUOTES['neza_none'] = L and '' or '\"以命偿命，灼灼天池血莲生\"'
STRINGS.SKIN_QUOTES['neza_green'] = L and '' or '\"出淤泥而不染\"'
STRINGS.SKIN_QUOTES['neza_fire'] = L and '' or '\"嘤嘤嘤\"'

STRINGS.SKIN_DESCRIPTIONS['neza_none'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['neza_green'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['neza_fire'] = L and '' or ''


--wb
-----------------
SKIN_RARITY_COLORS["WHITE_BONE_NONE"] = SKIN_RARITY_COLORS.Character
SKIN_RARITY_COLORS["WHITE_BONE_WHITE"] = {1, 1, 1, 1}
SKIN_RARITY_COLORS["WHITE_BONE_OPERA"] = {0.6, 0.6, 1, 1}

STRINGS.UI.RARITY['WHITE_BONE_NONE'] = L and 'White bone' or '白骨夫人'
STRINGS.UI.RARITY['WHITE_BONE_WHITE'] = L and 'Pale madam' or '苍白夫人'
STRINGS.UI.RARITY['WHITE_BONE_OPERA'] = L and 'Painted skin' or '梨园画皮'

STRINGS.SKIN_QUOTES['white_bone_none'] = L and '' or '\"千年白骨化阴风\"'
STRINGS.SKIN_QUOTES['white_bone_white'] = L and '' or '\"夫人面前休得放肆!\"'
STRINGS.SKIN_QUOTES['white_bone_opera'] = L and '' or '\"四面阴风起，双十年华美容仪\"'

STRINGS.SKIN_DESCRIPTIONS['white_bone_none'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['white_bone_white'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['white_bone_opera'] = L and '' or ''


--pg 
-----------------
SKIN_RARITY_COLORS["PIGSY_NONE"] = SKIN_RARITY_COLORS.Character
SKIN_RARITY_COLORS["PIGSY_MARRY"] = {1, 0.1, 0.1, 1}

STRINGS.UI.RARITY['PIGSY_NONE'] = STRINGS.CHARACTER_NAMES['pigsy']
STRINGS.UI.RARITY['PIGSY_MARRY'] = L and "Gao's son-in-law" or '高家女婿'

STRINGS.SKIN_QUOTES['pigsy_none'] = STRINGS.CHARACTER_QUOTES['pigsy']
STRINGS.SKIN_QUOTES['pigsy_marry'] = L and 'Where is my wife?' or '\"嘿嘿！翠兰俺来了！\"'

STRINGS.SKIN_DESCRIPTIONS['pigsy_none'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['pigsy_marry'] = L and '' or ''

--yj
-----------------
SKIN_RARITY_COLORS["YANGJIAN_NONE"] = SKIN_RARITY_COLORS.Character
SKIN_RARITY_COLORS["YANGJIAN_BLACK"] = {0.8, 1, 0.9, 1}
SKIN_RARITY_COLORS["YANGJIAN_DAO"] = {0.8, 1, 0.9, 1}
SKIN_RARITY_COLORS["YANGJIAN_GOLD"] = {0.8, 0.8, 0.1, 1}

STRINGS.UI.RARITY['YANGJIAN_NONE'] = STRINGS.CHARACTER_NAMES['yangjian']
STRINGS.UI.RARITY['YANGJIAN_BLACK'] = L and "The ink" or '墨影素鬓'
STRINGS.UI.RARITY["YANGJIAN_DAO"] = L and "Dao" or "妙道清源"
STRINGS.UI.RARITY["YANGJIAN_GOLD"] = L and "Golden Iliad" or "鎏金虎将"

STRINGS.SKIN_QUOTES['yangjian_none'] = STRINGS.CHARACTER_QUOTES['yangjian']
STRINGS.SKIN_QUOTES['yangjian_black'] = L and '' or '\"蚀明坠影，君子潇潇\"'
STRINGS.SKIN_QUOTES['yangjian_dao'] = L and "" or "妙"
STRINGS.SKIN_QUOTES['yangjian_gold'] = L and "" or "凤羽倒竖云色变,天眼圆睁起电光"

STRINGS.SKIN_DESCRIPTIONS['yangjian_none'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['yangjian_black'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['yangjian_dao'] = L and "" or ""
STRINGS.SKIN_DESCRIPTIONS['yangjian_gold'] = L and "" or ""


--yt
------------------
SKIN_RARITY_COLORS["MYTH_YUTU_NONE"] = SKIN_RARITY_COLORS.Character
SKIN_RARITY_COLORS["MYTH_YUTU_FROG"] = {0.2, 0.8, 0.2, 1}
SKIN_RARITY_COLORS["MYTH_YUTU_WINTER"] = {0.2, 0.2, 0.8, 1}

STRINGS.UI.RARITY['MYTH_YUTU_NONE'] = STRINGS.CHARACTER_NAMES['myth_yutu']
STRINGS.UI.RARITY['MYTH_YUTU_FROG'] =  L and '' or"蟾宫玉膳"
STRINGS.UI.RARITY['MYTH_YUTU_WINTER'] =  L and 'Winter' or"寒月暖冬"


STRINGS.SKIN_QUOTES['myth_yutu_none'] = STRINGS.CHARACTER_QUOTES['myth_yutu']
STRINGS.SKIN_QUOTES['myth_yutu_frog'] =  L and '' or '\"玉兔也不是只会捣药的哦\"'
STRINGS.SKIN_QUOTES['myth_yutu_winter'] =  L and '' or '\"灯笼给你，我这儿没有糖葫芦。\"'

STRINGS.SKIN_DESCRIPTIONS['myth_yutu_none'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['myth_yutu_frog'] = L and '' or ''
STRINGS.SKIN_DESCRIPTIONS['myth_yutu_winter'] = L and '' or ''


----------皮肤名字系列 后加载

AddSimPostInit(function()
	STRINGS.SKIN_NAMES.monkey_king_fire = "火眼金睛"
	STRINGS.SKIN_NAMES.monkey_king_sea = "出海学艺"
	STRINGS.SKIN_NAMES.monkey_king_horse = "弼马温"
	STRINGS.SKIN_NAMES.monkey_king_opera = "戏中行者"
    STRINGS.SKIN_NAMES.monkey_king_ear = STRINGS.UI.RARITY.MONKEY_KING_EAR
	STRINGS.SKIN_NAMES.neza_green = "青莲白藕"	
    STRINGS.SKIN_NAMES.neza_fire = STRINGS.UI.RARITY.NEZA_FIRE
	STRINGS.SKIN_NAMES.white_bone_white = "苍白夫人"
    STRINGS.SKIN_NAMES.white_bone_opera = STRINGS.UI.RARITY.WHITE_BONE_OPERA
	STRINGS.SKIN_NAMES.pigsy_marry = "高家女婿"
	STRINGS.SKIN_NAMES.yangjian_black = "墨影素鬓"
    STRINGS.SKIN_NAMES.yangjian_dao = STRINGS.UI.RARITY.YANGJIAN_DAO
    STRINGS.SKIN_NAMES.yangjian_gold = STRINGS.UI.RARITY.YANGJIAN_GOLD
	STRINGS.SKIN_NAMES.myth_yutu_frog = "蟾宫玉膳"
    STRINGS.SKIN_NAMES.myth_yutu_winter = STRINGS.UI.RARITY.MYTH_YUTU_WINTER
end)
----------
local SkinGifts = require("skin_gifts")
STRINGS.THANKS_POPUP.MYTH_SKINITEM = L and 'Thanks for supporting Myth Words' or '感谢支持神话书说'
SkinGifts.popupdata.MYTH_SKINITEM = 	{
	atlas = "images/thankyou_myth_gift.xml",
	image = "gift.tex",
	titleoffset = {0, -20, 0},
}

--API
do
    local prefn = function(self, pf, character, ...)
        if isskinchar(character) then 
            table.insert(DST_CHARACTERLIST, character)
        end
    end
    local postfn = function(self, pf, character, ...)
        if isskinchar(character) then
            table.removearrayvalue(DST_CHARACTERLIST, character)
        end
    end

    local LoadOutSelect = require('widgets/redux/loadoutselect')
    local constructor = LoadOutSelect._ctor
    LoadOutSelect._ctor = function (self, ...)
        prefn(self, ...)
        constructor(self, ...)
        postfn(self, ...)
    end
    local mt = getmetatable(LoadOutSelect)
    mt.__call = function(class_tbl, ...)
        local obj = {}
        setmetatable(obj, LoadOutSelect)
        if LoadOutSelect._ctor then
            LoadOutSelect._ctor(obj, ...)
        end
        return obj
    end
end

local old_GetItemCollectionName = GetItemCollectionName
function GLOBAL.GetItemCollectionName(key, ...)
    if isskin(key) and Myth_SkinExtra[key] ~= nil then
        return L and ""--[["This skin contains:"]] or "还包含:"
    else
        return old_GetItemCollectionName(key, ...)
    end
end

local ITEM_STRING = {
    weapon = L and "Weapon skin" or "专属武器皮肤",
    armor = L and "Armor skin" or "专属护甲皮肤",
    wb_beauty = L and "Beauty mode skin" or "美人形态皮肤",
    yj_pet = L and "Pet skin" or "啸天犬皮肤",
    yj_eagle = L and "Eagle skin" or "鹰形态皮肤",
    flycloud = L and "Cloud skin" or "腾云皮肤",
    miao = L and "Transform skin" or "变身形态皮肤",
}

AddClassPostConstruct('widgets/redux/itemexplorer', function(self)
    local old_fn = self._CreateWidgetDataListForItems
    function self:_CreateWidgetDataListForItems(...)
        local t = old_fn(self, ...)
        for _, data in ipairs(t)do
            if type(data.item_key) == 'string' and isskin(data.item_key) then
                data.is_owned = hasskin(data.item_key)
                data.owned_count = data.is_owned and 1 or 0
            end
        end
        return t
    end

    --无视过滤
    local old_refresh = self.RefreshItems
    function self:RefreshItems(fn, ...)
        if self.primary_item_type == 'base' then
            local parent = self.parent
            if parent and parent.owner and isskinchar(parent.owner.currentcharacter) then
                fn = function() return true end
            end
        end
        return old_refresh(self, fn, ...)
    end

    local old_app = self._ApplyDataToDescription
    function self:_ApplyDataToDescription(data, ...)
        old_app(self, data, ...)
        local item = data and data.item_key
        self.myth_skinitem = item
        if isskin(item) or isskinnone(item) then
            local s = ""
            for _,v in ipairs(Myth_SkinExtra[item] or {})do
                s = s .. ITEM_STRING[v] .. "\n"
            end
            self.description:SetString(s)
            self.action_info:SetString("")
            if self.market_button then
                self.market_button:Hide()
            end
            if self.commerce then
                self.commerce:Hide()
            end
            self:_Myth_ShowUnlockUI(not hasskin(item))
        else 
            if self.market_button then
                self.market_button:Show()
            end
            if self.commerce then 
                self.commerce:Show()
            end
            self:_Myth_ShowUnlockUI(false)
        end
    end

    --新ui
    local foot = self.footer
    local Text = require 'widgets/text'
    local Button = require "widgets/button"
    local TextButton = require 'widgets/textbutton'
    local Sc = require "screens/myth_skin_unlock"
    -- package.loaded['screens/myth_skin_unlock'] = nil
    local width = self.action_info:GetRegionSize()
    local unlock = self.action_info:AddChild(TextButton('unlock'))

    unlock:SetPosition(0, 0)
    unlock:SetFont(HEADERFONT)
    unlock.text:SetRegionSize(width, 30)
    unlock.text:SetHAlign(ANCHOR_LEFT)
    unlock:SetTextSize(30)
    unlock:SetText(L and 'Unlock' or '解锁')
    unlock:Hide()
    unlock:SetOnClick(function() TheFrontEnd:PushScreen(Sc(self.myth_skinitem)) end)
    self._myth_unlock = unlock

    self._Myth_ShowUnlockUI = function(self, val)
        if val then
            self._myth_unlock:Show()
        else
            self._myth_unlock:Hide()
        end
    end
end)

local old_fn = CompareRarities
function GLOBAL.CompareRarities(k1,k2)
    local w1, w2
    if isskin(k1) or isskin(k2) then
        return true
    end
    return old_fn(k1,k2)
end

table.insert(Assets, Asset("ATLAS", "images/myth_skin_unlock.xml"))
