local Widget = require "widgets/widget"
local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local Spinner = require "widgets/spinner"
local ImageButton = require "widgets/imagebutton"
local Menu = require "widgets/menu"
local LoadoutSelect = require "widgets/redux/loadoutselect"
local TEMPLATES = require "widgets/redux/templates"
local Puppet = require "widgets/skinspuppet"
local ClothingExplorerPanel = require "widgets/redux/clothingexplorerpanel"
local Subscreener = require "screens/redux/subscreener"
local SkinPresetsPopup = require "screens/redux/skinpresetspopup"
local AccountItemFrame = require "widgets/redux/accountitemframe"
local UIAnimButton = require "widgets/uianimbutton"
local ItemImage = require "widgets/itemimage"
local TextButton = require "widgets/textbutton"

local function _HideExtraLayers(self)
    self:GetAnimState():Hide("TINT")
    self:GetAnimState():Hide("LOCK")
    self:GetAnimState():Hide("NEW")
    self:GetAnimState():Hide("SELECT")
    self:GetAnimState():Hide("FOCUS")
    self:GetAnimState():Hide("IC_WEAVE")
    for k, _ in pairs(EVENT_ICONS) do
        self:GetAnimState():Hide(k)
    end
    self:GetAnimState():Hide("DLC")
end

local function SetBlank(self)
    self:GetAnimState():ClearAllOverrideSymbols()
    self:GetAnimState():SetBuild("accountitem_frame")
    self:GetAnimState():PlayAnimation("icon", true)
    _HideExtraLayers(self)
end

local function Highlight(self, light)
    if light then
        self:GetAnimState():Show("SELECT")
        self:GetAnimState():PlayAnimation("hover", true)
    else
        self:GetAnimState():Hide("SELECT")
        self:GetAnimState():PlayAnimation("icon", true)
    end
end

local wb_mirror_ui =
    Class(
    Widget,
    function(self, owner,list)
        Widget._ctor(self, "wb_mirror_ui")
        self.owner = owner
        self.proot = self:AddChild(Widget("ROOT"))
        self.proot:SetVAnchor(ANCHOR_MIDDLE)
        self.proot:SetHAnchor(ANCHOR_MIDDLE)
        self.proot:SetScaleMode(SCALEMODE_PROPORTIONAL)

        self.root = self.proot:AddChild(Widget("root"))
        self.root:SetPosition(-RESOLUTION_X / 2, -RESOLUTION_Y / 2, 0)

        local bg = self.proot:AddChild(Image("images/bg_redux_wardrobe_bg.xml", "wardrobe_bg.tex"))
        bg:SetScale(.6)
        bg:SetPosition(0, 0)
        bg:SetTint(1, 1, 1, .76)

        --[[local buttons = {}  弃置咯
        table.insert(
            buttons,
            {text = STRINGS.UI.WARDROBE_POPUP.CANCEL, cb = function()
                SendModRPCToServer(MOD_RPC["wb_mirror"]["wb_mirror"])
                end}
        )
        table.insert(
            buttons,
            {text = STRINGS.UI.WARDROBE_POPUP.SET, cb = function()
                if self.cruurntskin ~= nil then 
                    SendModRPCToServer(MOD_RPC["wb_mirror"]["wb_mirror"],1,self.cruurntskin)
                end
            end}
        )]]
  
        self.divider_top = self.proot:AddChild(Image("images/global_redux.xml", "item_divider.tex"))
        self.divider_top:SetScale(0.42, 0.5)
        self.divider_top:SetPosition(190, 202)

        self.showskin = self.proot:AddChild(Text(CHATFONT, 25))
        self.showskin:SetHAlign(ANCHOR_LEFT)
        self.showskin:SetRegionSize(150, 30)
        self.showskin:SetPosition(100, 220)
        self.showskin:SetColour(UICOLOURS.GOLD_CLICKABLE)

        self.unloclk = self.proot:AddChild(Text(CHATFONT, 30))
        self.unloclk:SetHAlign(ANCHOR_LEFT)
        self.unloclk:SetRegionSize(150, 30)
        self.unloclk:SetPosition(400, 220)

        self.cruurntskin = nil
        self.cruurntskintext = self.proot:AddChild(Text(CHATFONT, 25))
        self.cruurntskintext:SetHAlign(ANCHOR_LEFT)
        self.cruurntskintext:SetRegionSize(400, 30)
        self.cruurntskintext:SetPosition(260, -20)
        self.cruurntskintext:SetColour(UICOLOURS.GOLD_CLICKABLE)

        self.cruurntskinshow = self.proot:AddChild(Text(CHATFONT, 22))
        self.cruurntskinshow:SetHAlign(ANCHOR_LEFT)
        self.cruurntskinshow:SetRegionSize(400, 60)
        self.cruurntskinshow:EnableWordWrap(true)
        self.cruurntskinshow:SetPosition(260, -60)
        self.cruurntskinshow:SetColour(UICOLOURS.WHITE)

        self.divider_middle = self.proot:AddChild(Image("images/global_redux.xml", "item_divider.tex"))
        self.divider_middle:SetScale(0.32, 0.7)
        self.divider_middle:SetPosition(190, -40)

        self.divider_down = self.proot:AddChild(Image("images/global_redux.xml", "item_divider.tex"))
        self.divider_down:SetScale(0.52, 0.4)
        self.divider_down:SetPosition(-190, -175)

        self.leveluptext = self.proot:AddChild(Text(CHATFONT_OUTLINE, 25))
        self.leveluptext:SetHAlign(ANCHOR_LEFT)
        self.leveluptext:SetRegionSize(200, 60)
        self.leveluptext:SetPosition(-280, -200)
        self.leveluptext:SetColour(UICOLOURS.GOLD_CLICKABLE)

        self.recipes = self.proot:AddChild(Widget("recipes"))
        self.recipes:SetPosition(-320, -175)

        self.skins = {}

        for k = 1, 6 do
            self.skins[k] = self.proot:AddChild(UIAnimButton("accountitem_frame", "accountitem_frame", "hover"))
            self.skins[k]:SetPosition(80 + (k - (k > 3 and 4 or 1)) * 110, k > 3 and 60 or 150)
            self.skins[k].currentskin = nil
            SetBlank(self.skins[k].uianim)
            self.skins[k].onfocus = function()
                self.skins[k]:SetScale(0.7)
            end
            local oldxx = self.skins[k].OnLoseFocus
            self.skins[k].OnLoseFocus = function(self1)
                self.skins[k]:SetScale(0.6)
            end

            self.skins[k]:SetScale(0.6)
            self.skins[k]:SetOnClick(
                function()
					if self.skins[k].currentskin ~= nil and self.skins[k].currentskin ~= self.cruurntskin  then
						self.cruurntskin = self.skins[k].currentskin
						self.puppet.animstate:OverrideSymbol("swap_body", self.cruurntskin, "swap_body")

                        self.cruurntskintext:SetString(STRINGS.NAMES[(string.upper(self.cruurntskin))] or "")
                        self.cruurntskinshow:SetString(STRINGS.WB_ARMORSTR[(string.upper(self.cruurntskin))] or "")
                    	for k1 = 1, 6 do
                       	 	if k1 ~= k then
                            	Highlight(self.skins[k1].uianim, false)
                        	else
                            	Highlight(self.skins[k1].uianim, true)
                        	end
                    	end
					end
                end
            )
        end

        --人物咯
        self.puppet_root = self.proot:AddChild(Widget("puppet_root"))
        self.puppet_root:SetPosition(-205, -10)
        self.puppet_root:SetScale(0.6)

        self.names = self.puppet_root:AddChild(Image("images/names_"..self.owner.prefab..".xml", self.owner.prefab..".tex"))
        self.names:SetPosition(0, 370)
        self.names:SetScale(0.35)
        --self.glow:SetTint(1, 1, 1, .5)
        self.names:SetClickable(false)

        self.glow = self.puppet_root:AddChild(Image("images/lobbyscreen.xml", "glow.tex"))
        self.glow:SetPosition(0, -50)
        self.glow:SetScale(2.5)
        self.glow:SetTint(1, 1, 1, .5)
        self.glow:SetClickable(false)

        self.puppet = self.puppet_root:AddChild(Puppet())
        self.puppet:AddShadow()
        self.puppet_base_offset = {0, -160}
        self.puppet:SetPosition(self.puppet_base_offset[1], self.puppet_base_offset[2])
        self.puppet_default_scale = 4.5
        self.puppet:SetScale(self.puppet_default_scale)
        self.puppet:SetClickable(false)
		self.facing = FACING_DOWN

		self.down_arrow = self.proot:AddChild(ImageButton("images/ui.xml", "arrow2_left.tex", "arrow2_left_over.tex", "arrow2_left_down.tex", "arrow2_left_down.tex", "arrow2_left_down.tex", {1,1}, {0,0}))
		self.down_arrow:SetOnClick(function()
			self.facing = self.facing -1 
			if  self.facing < 0 then
				self.facing = 3
			end
			self.puppet.anim:SetFacing(self.facing)
		end)
		self.down_arrow:ForceImageSize(40, 30)
		self.down_arrow:SetPosition(-280,-150)

		self.up_arrow = self.proot:AddChild(ImageButton("images/ui.xml", "arrow2_right.tex", "arrow2_right_over.tex", "arrow_right_disabled.tex", "arrow2_right_down.tex", "arrow2_right_down.tex", {1,1}, {0,0}))
		self.up_arrow:SetOnClick(function()  
			self.facing = self.facing + 1 
			if  self.facing > 3 then
				self.facing = 0
			end
			self.puppet.anim:SetFacing(self.facing)		
		end)
		self.up_arrow:ForceImageSize(40, 30)
		self.up_arrow:SetPosition(-130,-150)

        --local spacing = 70
        --self.menu = self.proot:AddChild(Menu(buttons, spacing, false, "carny_long", nil, 30))

        --self.menu:SetPosition(190, -220, 0)

        self.queren = self.proot:AddChild(TEMPLATES.StandardButton(function() 
            if self.cruurntskin ~= nil then 
                SendModRPCToServer(MOD_RPC["wb_mirror"]["wb_mirror"],1,self.cruurntskin)
            end
        end,STRINGS.UI.WARDROBE_POPUP.SET,{230, 60}))
        self.queren:SetPosition(190, -150)

        self.quxiao = self.proot:AddChild(TEMPLATES.StandardButton(function() 
            SendModRPCToServer(MOD_RPC["wb_mirror"]["wb_mirror"])
        end,STRINGS.UI.WARDROBE_POPUP.CANCEL,{100, 60}))
        self.quxiao:SetPosition(250, -220)

        self.jiechu = self.proot:AddChild(TEMPLATES.StandardButton(function() 
            SendModRPCToServer(MOD_RPC["wb_mirror"]["wb_mirror"],3)
        end,STRINGS.UI.WORDPREDICTIONWIDET.DISMISS,{100, 60}))
        self.jiechu:SetPosition(130, -220)
    end
)

function wb_mirror_ui:UpdateList(mmm)
	if mmm ~= nil then
		if mmm.skins ~= nil and mmm.level ~= nil then
			for k = 1, 6 do
				if mmm.skins[k]  ~= nil then
					self.skins[k].currentskin = mmm.skins[k]
                    self.skins[k].uianim:GetAnimState():OverrideSymbol("SWAP_ICON",mmm.skins[k], "SWAP_ICON")
                    self.skins[k].uianim:GetAnimState():OverrideSymbol("SWAP_frameBG", "frame_BG", "spiffy")
                else 
                    self.skins[k].currentskin = nil
                    self.skins[k].uianim:GetAnimState():ClearOverrideSymbol("SWAP_ICON")
                    self.skins[k].uianim:GetAnimState():ClearOverrideSymbol("SWAP_frameBG")
				end
                Highlight(self.skins[k].uianim, false)
			end
            self.unloclk:SetString(#mmm.skins.."/"..mmm.level*2)
            if mmm.level  < 3 then
                if TUNING.WB_BONE_MIRROR_RECIPR[mmm.level+1]  ~= nil then
                    self.recipes:KillAllChildren()
                    self:_SetupRecipeIngredientDetails(TUNING.WB_BONE_MIRROR_RECIPR[mmm.level+1], self.recipes, -50)
                end
                if self.levelup then
                    self.levelup:Kill()
                end
                self.levelup = self.proot:AddChild(TEMPLATES.StandardButton(function() 
                    SendModRPCToServer(MOD_RPC["wb_mirror"]["wb_mirror"],2)
                end,STRINGS.UI.WXPLOBBYPANEL.LEVEL_UP or "升级",{120, 60}))
                self.levelup:SetPosition(-140, -245)

                self.leveluptext:SetString(STRINGS.WB_MIRROR_NEED..mmm.level..","..STRINGS.WB_MIRROR_NEED_UP)
            else
                self.recipes:KillAllChildren()
                if self.levelup then
                    self.levelup:Kill()
                end
                self.leveluptext:SetString("")
                self.leveluptext:SetString(STRINGS.WB_MIRROR_NEED..mmm.level..","..STRINGS.WB_MIRROR_NEED_MAX)
            end
		end
		if mmm.current ~= nil then
            self.showskin:SetString(STRINGS.WB_MIRROR_CURRENT_SKIN..":"..STRINGS.NAMES[(string.upper(mmm.current))] or "")
			self.puppet.animstate:OverrideSymbol("swap_body", mmm.current, "swap_body")
        else
            self.showskin:SetString("")
            self.puppet.animstate:ClearOverrideSymbol("swap_body")
		end
	end
    self.cruurntskin = nil
    if self.owner then
        self.puppet.animstate:SetBuild(self.owner.AnimState:GetBuild())
    end
    self.cruurntskintext:SetString("")
    self.cruurntskinshow:SetString("")
    
end

local ingredient_icon_remap = {}
ingredient_icon_remap.onion = "quagmire_onion"
ingredient_icon_remap.tomato = "quagmire_tomato"
ingredient_icon_remap.acorn = "acorn_cooked"

local ingredient_name_remap = {}
ingredient_name_remap.acorn = "acorn_cooked"

local teshu = {}
function wb_mirror_ui:_SetupRecipeIngredientDetails(recipes, parent, y)
    local ingredient_size = 40
    local x_spacing = 10
    local inv_backing_root = parent:AddChild(Widget("inv_backing_root"))
    local inv_item_root = parent:AddChild(Widget("inv_item_root"))
    if #recipes <= 5 then
        local items = recipes
        local x = -((#items + 1) * ingredient_size + (#items - 1) * x_spacing) / 2 + 20
        for i = 1, #items do
            local backing = inv_backing_root:AddChild(Image("images/quagmire_recipebook.xml", "ingredient_slot.tex"))
            backing:ScaleToSize(ingredient_size, ingredient_size)
            backing:SetPosition(
                x + (i) * ingredient_size + (i - 1) * x_spacing,
                y - ingredient_size / 2 - (1 - 1) * (ingredient_size + 5)
            )

            local img_name =
                teshu[items[i][1]] ~= nil and teshu[items[i][1]] .. ".tex" or
                (ingredient_icon_remap[items[i][1]] or items[i][1]) .. ".tex"
            local img_atlas = GetInventoryItemAtlas(img_name, true)
            local img =
                inv_item_root:AddChild(
                Image(
                    img_atlas or "images/inventoryimages/" .. items[i][1] .. ".xml",
                    img_atlas ~= nil and img_name or items[i][1] .. ".tex"
                )
            )
            if items[i][2] ~= 1 then
                local num = img:AddChild(Text(NUMBERFONT, 35, tostring(items[i][2])))
                num:SetPosition(20, -20)
            end
            img:ScaleToSize(ingredient_size, ingredient_size)
            img:SetPosition(backing:GetPosition())
            img:SetHoverText(
                STRINGS.NAMES[string.upper(ingredient_name_remap[items[i][1]] or items[i][1])] or
                    subfmt(STRINGS.UI.COOKBOOK.UNKNOWN_INGREDIENT_NAME, {ingredient = items[i][1]})
            )
        end
    end
end

return wb_mirror_ui
