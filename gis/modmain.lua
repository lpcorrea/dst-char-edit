GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})
getmetatable(TheSim).__index.HasPlayerSkeletons = function() return true end

TUNING.MYTH_CHARACTER_MOD_OPEN = true --全局变量方便别的mod获取

PrefabFiles = {
	"monkey_king", 
	"mk_jgb",
	"mk_jgb_pillar",
	"mk_striker",
	"monkey_start_peach",
	"mk_dsf",
	"mk_dsf_fx",
	"mk_dsf_fx_small",
	
	"golden_armor_mk",
	"golden_hat_mk",
	"xzhat_mk",	
	
	"neza", 
	"neza_none", 
	"armor_neza",
	"nz_lance",
	"nz_ring",
	"lotus_flower",
	"lotus_nz",
	
	--白骨白骨
	"white_bone",
	"white_bone_none",
	"bone_wand", --骨杖
	"bone_blade",
	"bone_whip", --骨鞭
	"bone_spike",
	"bone_mirror",
	"wb_armors",
	"white_bone_fog",
	"bone_pet",
	"wb_skeleton",
	"wb_heart",
	
	--pigsy
	"pigsy",
	"pigsy_none",
	"pigsy_rake",
	"pigsy_soil",
	"pigsy_sleepbed",
	"pigsy_hat",
	
	--yangjian
	"yangjian",
	"yangjian_none",
	"yj_spear",
	"yangjian_armor",
	"yangjian_hair",
	"yangjian_track",
	"skyhound",
	"skyhound_warg",
	"skyhound_tooth",
	"skyhound_tooth_start",
	"skyhound_fx",
	
	--玉兔 兔姬
	"myth_yutu",
	"myth_yutu_none",
	"yt_rabbithole",
	"yt_moonbutterfly",
	"medicine_pestle_myth", --擀面杖
	"yt_daoyao",
	"myth_yutu_heal_fx",
	"myth_sanity_regenbuff",
	--特效
	"myth_fxs",
	"yangjian_buzzard",
	"yangjian_buzzard_spawn",
}

Assets = {
	Asset( "IMAGE", "images/monkey_king_item.tex" ),
    Asset( "ATLAS", "images/monkey_king_item.xml" ),

	Asset("SOUNDPACKAGE", "sound/WhiteBone.fev"),
    Asset("SOUND", "sound/WhiteBone.fsb"),
    Asset("SOUNDPACKAGE", "sound/MK.fev"),
    Asset("SOUND", "sound/MonkeyKing.fsb"),
    Asset("SOUNDPACKAGE", "sound/Nezha.fev"),
    Asset("SOUND", "sound/Nezha.fsb"),
    Asset("SOUNDPACKAGE", "sound/Drum.fev"),
    Asset("SOUND", "sound/Drum.fsb"),
    Asset("SOUNDPACKAGE", "sound/Xiao.fev"),
    Asset("SOUND", "sound/Xiao.fsb"),
    Asset("SOUNDPACKAGE", "sound/Myth_Gourd.fev"),
    Asset("SOUND", "sound/Myth_Gourd.fsb"),
    Asset("SOUNDPACKAGE", "sound/myth_pigsound.fev"),
    Asset("SOUND", "sound/myth_pigsound.fsb"),

	Asset("ATLAS_BUILD", "images/monkey_king_item.xml", 256),

	Asset( "ATLAS", "images/hud/white_bone_tab.xml" ),
	Asset( "IMAGE", "images/hud/white_bone_tab.tex" ),

	Asset( "ATLAS", "images/thankyou_myth_gift.xml" ),
	Asset( "IMAGE", "images/thankyou_myth_gift.tex" ),
	
	Asset( "ATLAS", "images/hud/bone_inventorysolt.xml" ),
	Asset( "IMAGE", "images/hud/bone_inventorysolt.tex" ),

	Asset( "ATLAS", "images/hud/white_bonefogover.xml" ),
	Asset( "IMAGE", "images/hud/white_bonefogover.tex" ),

	Asset( "ATLAS", "images/hud/yutu_underground.xml" ),
	Asset( "IMAGE", "images/hud/yutu_underground.tex" ),
	
	Asset("ATLAS", "images/inventoryimages/mk_jgb_rec.xml"),
	Asset("ATLAS", "images/inventoryimages/yangjian_track.xml"),
	Asset("ATLAS", "images/inventoryimages/yangjian_ying.xml"),
	Asset("ATLAS", "images/inventoryimages/yt_rabbithole.xml"),
	Asset("ATLAS", "images/inventoryimages/myth_hunger.xml"),	
	Asset("ATLAS", "images/inventoryimages/yt_daoyao.xml"),

	Asset( "IMAGE", "images/colour_cubes/yangjian_fullmoon_cc.tex"),
	
	Asset( "ATLAS", "images/map_icons/yj_eagle.xml" ),
	Asset( "IMAGE", "images/map_icons/yj_eagle.tex" ),
	
	Asset("ANIM", "anim/skyhound_ui.zip"),
	Asset("ANIM", "anim/skyhound_meter.zip"),
	Asset("ATLAS", "images/inventoryimages/skyhound.xml"),
	Asset("ATLAS", "images/inventoryimages/skyhound_tooth.xml"),
    Asset("ANIM", "anim/mk_golden_armor.zip"),
    Asset("ANIM", "anim/white_boneui.zip"),
    Asset("ANIM", "anim/monkey_kingui.zip"),
    Asset("ANIM", "anim/yangjianui.zip"),
    Asset("ANIM", "anim/pigsy_marryui.zip"),
    Asset("ANIM", "anim/nz36.zip"),
    Asset("ANIM", "anim/mk_miao.zip"),
    Asset("ANIM", "anim/mk_miao_ear.zip"),
    Asset("ANIM", "anim/white_bone_changefx.zip"),
    Asset("ANIM", "anim/white_bone_raisefx.zip"),	
    Asset("ANIM", "anim/white_bone_small_puff.zip"),
	Asset("ANIM", "anim/yj_eagle_anim.zip"),
	Asset("ANIM", "anim/yj_eagle_black.zip"),
	Asset("ANIM", "anim/yj_eagle_gold.zip"),
	Asset("ANIM", "anim/myth_yutu_under.zip"),
    Asset("ANIM", "anim/myth_playtimebar.zip"),
	Asset("ANIM", "anim/player_actions_shovel_myth.zip"),	
	Asset("ANIM", "anim/wb_redirect_health.zip"),	

    --for strike fx
    Asset("ANIM", "anim/lavaarena_shadow_lunge.zip"),
    Asset("ANIM", "anim/monkey_king_lunge.zip"),
    Asset("ANIM", "anim/mk_jgb.zip"),

    --for skins build
	Asset("ANIM", "anim/ghost_monkey_king_build.zip"),
	Asset("ANIM", "anim/ghost_neza_build.zip"),
	Asset("ANIM", "anim/ghost_white_bone_build.zip"),
	Asset("ANIM", "anim/ghost_yangjian_build.zip"),
	Asset("ANIM", "anim/ghost_pigsy_build.zip"),
	Asset("ANIM", "anim/ghost_myth_yutu_build.zip"),
}

function AddAssets(...)
	for _,v in ipairs({...})do table.insert(Assets, v) end
end

local characters ={
	"monkey_king",
	"neza",
	"white_bone",
	"pigsy",
	"yangjian",
	"myth_yutu",
}

modimport("main/myth_character_health.lua")
modimport("main/myth_character_language.lua")
modimport("main/myth_character_containers.lua")
for k,v in pairs(characters) do 
	AddAssets(
		Asset("ATLAS", "bigportraits/"..v.."_none.xml"),
		Asset("ATLAS", "images/saveslot_portraits/"..v..".xml"),
		Asset("ATLAS", "images/names_"..v..".xml" ),
		Asset("ATLAS", "images/avatars/self_inspect_"..v..".xml" ),
		Asset("ATLAS", "images/avatars/avatar_ghost_"..v..".xml" ),
		Asset("ATLAS", "images/avatars/avatar_"..v..".xml" ),
		Asset("ATLAS", "images/map_icons/"..v..'.xml')
	)
	AddMinimapAtlas("images/map_icons/"..v..".xml")
	AddModCharacter(v, (v == 'white_bone' or v == 'myth_yutu') and 'FEMALE' or 'MALE')

	modimport("main/"..v)
end

-----===选人界面 ui相关
CHARACTER_BUTTON_OFFSET.monkey_king = -41
CHARACTER_BUTTON_OFFSET.neza = -41
CHARACTER_BUTTON_OFFSET.white_bone = -51
local mycharbutton = {
	white_bone = function(self)
		if self.head_animstate then
			self.head_animstate:OverrideSymbol("hair", "white_bone_hidehair", "hair")
		end
	end,
}
AddClassPostConstruct("widgets/redux/characterbutton",function(self)
	local old_SetCharacter = self.SetCharacter
	function self:SetCharacter(hero)
		old_SetCharacter(self,hero)
		if mycharbutton[hero] ~= nil then
			mycharbutton[hero](self)
		end
	end
end)
---========================


------------==============小地图图标
local map_icons = {
	"mk_jgb",
	"nz_lance",
	"nz_damask",
	"nz_ring",
	"pigsy_rake",
	"yj_eagle",
	"yangjian_armor",
	"yangjian_hair",
	"skyhound_tooth",
	"skyhound",
	"yj_spear",	
	"bone_mirror",
}

for k,v in pairs(map_icons) do
	table.insert(Assets, Asset( "IMAGE", "images/map_icons/"..v..".tex" )) 
    table.insert(Assets, Asset( "ATLAS", "images/map_icons/"..v..".xml" ))
	AddMinimapAtlas("images/map_icons/"..v..'.xml')
end

RemapSoundEvent( "dontstarve/characters/monkey_king/death_voice", "monkey_king/monkey_king/death" )
RemapSoundEvent( "dontstarve/characters/monkey_king/hurt",      "monkey_king/monkey_king/hit" )
RemapSoundEvent( "dontstarve/characters/monkey_king/talk_LP", "monkey_king/monkey_king/talk_loop" )

RemapSoundEvent( "dontstarve/characters/neza/death_voice", "neza_sound/neza_sound/death" )
RemapSoundEvent( "dontstarve/characters/neza/hurt",      "neza_sound/neza_sound/hit" )
RemapSoundEvent( "dontstarve/characters/neza/talk_LP", "neza_sound/neza_sound/talk_loop" )


PREFAB_SKINS["monkey_king"] = {
	"monkey_king_none",
}

PREFAB_SKINS["neza"] = {
	"neza_none",
}

PREFAB_SKINS["white_bone"] = {
	"white_bone_none",
}

PREFAB_SKINS["pigsy"] = {
	"pigsy_none",
}

PREFAB_SKINS["yangjian"] = {
	"yangjian_none",
}

PREFAB_SKINS["myth_yutu"] = {
	"myth_yutu_none",
}

local MKRECIPE = STRINGS.MKRECIPE and CUSTOM_RECIPETABS[STRINGS.MKRECIPE] or RECIPETABS.REFINE
--一柱擎天
AddRecipe("mk_jgb_rec", {Ingredient("mk_jgb", 1, "images/monkey_king_item.xml"), Ingredient(CHARACTER_INGREDIENT.SANITY, 50)}, MKRECIPE, TECH.NONE,
nil, nil, nil, nil, "monkey_king",
"images/inventoryimages/mk_jgb_rec.xml",
"mk_jgb_rec.tex")

AddRecipe("mk_dsf", {Ingredient(CHARACTER_INGREDIENT.SANITY, 10)}, MKRECIPE, TECH.LOST,
nil, nil, nil, nil, "monkey_king",
"images/inventoryimages/mk_dsf.xml",
"mk_dsf.tex")

--哪吒
AddRecipe("myth_lotus_flower",{Ingredient(CHARACTER_INGREDIENT.HEALTH, 10)}, MKRECIPE,  TECH.NONE,
nil, nil, nil, nil, "neza",
"images/inventoryimages/myth_lotus_flower.xml",
"myth_lotus_flower.tex")

---白骨部分
local WBRECIPE = AddRecipeTab( STRINGS.WBRECIPE, 511, "images/hud/white_bone_tab.xml", "white_bone_tab.tex", "white_bone")
AddRecipe("bone_blade",{Ingredient("boneshard", 4),Ingredient("livinglog", 1),Ingredient("nightmarefuel", 1)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/monkey_king_item.xml",
"bone_blade.tex")

AddRecipe("bone_whip",{Ingredient("boneshard", 4),Ingredient("livinglog", 1),Ingredient("nightmarefuel", 2)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/monkey_king_item.xml",
"bone_whip.tex")

AddRecipe("bone_wand",{Ingredient("boneshard", 4),Ingredient("livinglog", 2),Ingredient("purplegem", 2)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/monkey_king_item.xml",
"bone_wand.tex")

AddRecipe("wb_skeleton",{Ingredient("boneshard", 4)}, WBRECIPE,  TECH.NONE,
"wb_skeleton_placer", nil, nil, nil, "white_bone",
"images/monkey_king_item.xml", 
"wb_skeleton.tex",nil,
"skeleton")

STRINGS.RECIPE_DESC.WB_SKELETON = '建造一副合适的身躯'

AddRecipe("wb_heart",{Ingredient("boneshard", 2),Ingredient("spidergland", 2),Ingredient(CHARACTER_INGREDIENT.HEALTH, 20)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/monkey_king_item.xml",
"wb_heart.tex")

AddRecipe("wb_armorlight",{Ingredient("boneshard", 4),Ingredient("silk", 12)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/inventoryimages/wb_armorlight.xml",
"wb_armorlight.tex")

AddRecipe("wb_armorbone",{Ingredient("boneshard", 8),Ingredient("nightmarefuel", 4)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/inventoryimages/wb_armorbone.xml",
"wb_armorbone.tex")

AddRecipe("wb_armorblood",{Ingredient("boneshard", 4),Ingredient("mosquitosack", 4)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/inventoryimages/wb_armorblood.xml",
"wb_armorblood.tex")

AddRecipe("wb_armorstorage",{Ingredient("boneshard", 4),Ingredient("pigskin", 2)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/inventoryimages/wb_armorstorage.xml",
"wb_armorstorage.tex")

AddRecipe("wb_armorgreed",{Ingredient("boneshard", 4),Ingredient("slurper_pelt", 2)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/inventoryimages/wb_armorgreed.xml",
"wb_armorgreed.tex")

AddRecipe("bone_mirror",{Ingredient("boneshard", 6),Ingredient("silk", 6),Ingredient("bluegem", 2)}, WBRECIPE,  TECH.NONE,
nil, nil, nil, nil, "white_bone",
"images/inventoryimages/bone_mirror.xml",
"bone_mirror.tex")

--八戒八戒
AddRecipe("pigsy_sleepbed",{Ingredient("cutgrass", 3)},RECIPETABS.SURVIVAL,  TECH.NONE,
nil, nil, nil, nil, "pigsy",
"images/inventoryimages/pigsy_sleepbed.xml",
"pigsy_sleepbed.tex")

AddRecipe("pigsy_hat",{Ingredient("silk", 3),Ingredient("goldnugget", 1)},MKRECIPE,  TECH.NONE,
nil, nil, nil, nil, "pigsy",
"images/inventoryimages/pigsy_hat.xml",
"pigsy_hat_none.tex")

AddRecipe("yangjian_track",{Ingredient(CHARACTER_INGREDIENT.SANITY, 25)},MKRECIPE,  TECH.LOST,
nil, nil, nil, nil, "yangjian",
"images/inventoryimages/yangjian_track.xml",
"yangjian_track.tex")

AddRecipe("yangjian_buzzard_spawn",{Ingredient("smallmeat",1)},MKRECIPE,  TECH.NONE,
nil, nil, nil, nil, "yangjian",
"images/inventoryimages/yangjian_buzzard_spawn.xml",
"yangjian_buzzard_spawn.tex")


--玉兔部分
--神奇的官方竟然没有消耗饥饿制作的配方
CHARACTER_INGREDIENT.MYTH_HUNGER = "myth_hunger"
local oldIsCharacterIngredient = GLOBAL.IsCharacterIngredient
if oldIsCharacterIngredient ~= nil then
	GLOBAL.IsCharacterIngredient =  function(ingredienttype) 
		if ingredienttype and ingredienttype == "myth_hunger" then
			return true
		end
		return oldIsCharacterIngredient(ingredienttype)
	end
end
STRINGS.ACTIONS.CASTAOE.PIGSY_RAKE = STRINGS.ACTIONS.CASTAOE.LAVAARENA_HEAVYBLADE
STRINGS.NAMES[string.upper("myth_hunger")] = STRINGS.NAMES.HUNGER 
local yt_daoyao = AddRecipe("yt_daoyao",{Ingredient(CHARACTER_INGREDIENT.MYTH_HUNGER,5,"images/inventoryimages/myth_hunger.xml")}, MKRECIPE,  TECH.NONE,
nil, nil, nil, nil, "myth_yutu",
"images/inventoryimages/yt_daoyao.xml",
"yt_daoyao.tex")
yt_daoyao.sortkey  = 1

local yt_rabbithole = AddRecipe("yt_rabbithole",{Ingredient("rabbit", 2),Ingredient("shovel", 1)}, MKRECIPE,  TECH.SCIENCE_ONE,
"yt_rabbithole_placer", 3, nil, nil, "myth_yutu",
"images/inventoryimages/yt_rabbithole.xml", 
"yt_rabbithole.tex",nil,
"rabbithole")
yt_rabbithole.sortkey  = 2 

local yt_moonbutterfly = AddRecipe("yt_moonbutterfly",{Ingredient("petals", 1)}, MKRECIPE,  TECH.NONE,
nil, nil, nil, nil, "myth_yutu",
"images/inventoryimages1.xml",
"moonbutterfly.tex")
yt_moonbutterfly.sortkey  = 3

--皮肤
modimport "skin.lua"

local other = {
	"skyhound",
	"myth_rpc",
}
for i, v in ipairs(other) do
	modimport("main/"..v)
end

--提示订阅
-- AddPlayerPostInit(function(inst)
-- 	inst:DoTaskInTime(1, function(inst)
-- 		if inst == ThePlayer and rawget(GLOBAL, 'MK_MOD_LANGUAGE_SETTING') == nil then
-- 			local tp = require "widgets/redux/templates"
-- 			local sc = require "widgets/screen"
-- 			local w = Class(sc, function(self)
-- 				sc._ctor(self, "")
-- 				self:SetHAnchor(ANCHOR_MIDDLE)
--     			self:SetVAnchor(ANCHOR_MIDDLE)
-- 				local main = self:AddChild(tp.RectangleWindow(500, 250, "Reminder-提示", {
-- 					{text="subscribe-订阅", cb= function() VisitURL("https://steamcommunity.com/sharedfiles/filedetails/?id=1991746508") end},
-- 					{text="OK-我知道了", cb= function() TheFrontEnd:PopScreen() end},
-- 				}, 300, 
-- 				"Myth words mod has been split into two parts.\nClick subscribe button below to get more!\n"..
-- 				"为便于维护, 神话书说模组已分成了角色和主题两部分,\n关于炼丹炉、黑风大王和犀牛兄弟等内容, 请点击下方订阅!\n如遇物品丢失情况, 请开启主题mod, 然后回档!")
-- 				)
-- 			end)
-- 			TheFrontEnd:PushScreen(w())
-- 		end
-- 	end)
-- end)

AddSimPostInit(function()
	if rawget(GLOBAL, "Myth_RunCachedStr") then
		GLOBAL.Myth_RunCachedStr()
	end
end)