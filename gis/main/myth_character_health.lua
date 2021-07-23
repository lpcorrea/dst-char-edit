

--人物三维相关


TUNING.MONKEY_KING_HEALTH = 175
TUNING.MONKEY_KING_HUNGER = 150
TUNING.MONKEY_KING_SANITY = 125

TUNING.NEZA_HEALTH = 150
TUNING.NEZA_HUNGER = 150
TUNING.NEZA_SANITY = 150

TUNING.WHITE_BONE_HEALTH = 150
TUNING.WHITE_BONE_HUNGER = 150
TUNING.WHITE_BONE_SANITY = 250

TUNING.PIGSY_HEALTH = 250
TUNING.PIGSY_HUNGER = 300
TUNING.PIGSY_SANITY = 100

TUNING.YANGJIAN_HEALTH = 150
TUNING.YANGJIAN_HUNGER = 150
TUNING.YANGJIAN_SANITY = 200


TUNING.MYTH_YUTU_HEALTH = 150
TUNING.MYTH_YUTU_HUNGER = 150
TUNING.MYTH_YUTU_SANITY = 120

TUNING.SKYHOUND_VALUE = {
	health = 300,  -- 
	health_warg = 600,
	health_amount = 2,  -- 回血量
	health_period = 1,  -- 回血周期
	hunger = 200,  -- 饥饿值
	hunger_rate = 75/(30*16),  -- 正常饥饿速率
	hunger_wait_rate = (75/2)/(30*16),  -- 待机饥饿速率
	hunger_medium_line = 50,  -- 找吃的饥饿线
	hunger_low_line = 0,  -- 咬人饥饿线
	range_pick = 25,  -- 捡东西范围
	range_hunt = 15,  -- 狩猎兔子的范围
	range_food = 10,  -- 找吃的范围
	range_bite = 10,  -- 咬人范围
	range_attack = 3,  -- 默认攻击距离
	range_leader = 10,  -- 领导范围内的猎狗
	range_startle = 15,  -- 震慑范围内的猎狗
	dmg = 34,  -- 攻击力
	dmg_bite = 25,  -- 咬其他生物的伤害
	dmg_bite_player = 5,  -- 咬人伤害
	attack_period = 3,  -- 攻击频率
	speed = 7.5,  -- 速度
	speed_run = 15,
	time_no_eat = 5,  -- 交出东西后过几秒才能吃东西
	time_no_hunt = 10,  -- 交出东西后过几秒才能捕猎
	time_no_bite = 15,  -- 咬人的cd
	-- time_pick = 120,  -- 捡东西的限定时间
	time_should_wait = .5,  -- 吹口哨后的等待，以打断哮天犬原来的动作
	whistle_dist = 20,  -- 吹口哨会传送的距离
	trans_dist = 30,  -- 传送到附近的距离
	icon_scale = 0.6,  -- ui哮天犬的比例
}
--初始物品
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.MONKEY_KING = {"mk_jgb","peach"}
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.NEZA = {"nz_lance","nz_damask","nz_ring"}
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.WHITE_BONE = {"boneshard","nightmarefuel","livinglog","bone_mirror"}
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.PIGSY = {"pigsy_rake"}
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.YANGJIAN = {"yj_spear","skyhound"}
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.MYTH_YUTU = {"medicine_pestle_myth"}
--生存几率
local L = MK_MOD_LANGUAGE_SETTING
if L  == "ENGLISH" then
STRINGS.CHARACTER_SURVIVABILITY.monkey_king = "piece of peach"
STRINGS.CHARACTER_SURVIVABILITY.neza = "leisurely"
STRINGS.CHARACTER_SURVIVABILITY.white_bone = "burdensome"
STRINGS.CHARACTER_SURVIVABILITY.pigsy = "leisurely"
STRINGS.CHARACTER_SURVIVABILITY.yangjian = "fvck giz"
STRINGS.CHARACTER_SURVIVABILITY.myth_yutu = "piece of carrot"

elseif L == "JAPAN" then
STRINGS.CHARACTER_SURVIVABILITY.monkey_king = "朝飯前さ"
STRINGS.CHARACTER_SURVIVABILITY.neza = "悠々自適"
STRINGS.CHARACTER_SURVIVABILITY.white_bone = "天命任せ"
STRINGS.CHARACTER_SURVIVABILITY.pigsy = "悠々自適"
STRINGS.CHARACTER_SURVIVABILITY.yangjian = "朝飯前さ"
STRINGS.CHARACTER_SURVIVABILITY.myth_yutu = "朝飯前さ"
else
STRINGS.CHARACTER_SURVIVABILITY.monkey_king = "小菜一碟"
STRINGS.CHARACTER_SURVIVABILITY.neza = "优哉游哉"
STRINGS.CHARACTER_SURVIVABILITY.white_bone = "苟延残喘"
STRINGS.CHARACTER_SURVIVABILITY.pigsy = "优哉游哉"
STRINGS.CHARACTER_SURVIVABILITY.yangjian = "小菜一碟"
STRINGS.CHARACTER_SURVIVABILITY.myth_yutu = "小菜一碟"
end
--如果是mod物品需要定义mod物品的图片路径
local myth_startitem = {
	mk_jgb = {
		atlas = "images/monkey_king_item.xml",
		image = "mk_jgb.tex",
	},
	peach = {
		atlas = "images/monkey_king_item.xml",
		image = "peach.tex",
	},
	nz_lance = {
		atlas = "images/monkey_king_item.xml",
		image = "nz_lance.tex",
	},
	nz_damask = {
		atlas = "images/monkey_king_item.xml",
		image = "nz_damask.tex",
	},
	nz_ring = {
		atlas = "images/monkey_king_item.xml",
		image = "nz_ring.tex",
	},
	pigsy_rake = {
		atlas = "images/inventoryimages/pigsy_rake.xml",
		image = "pigsy_rake_none.tex",
	},
	yj_spear = {
		atlas = "images/inventoryimages/yj_spear.xml",
		image = "yj_spear_none.tex",
	},
	skyhound = {
		atlas = "images/inventoryimages/skyhound.xml",
		image = "skyhound.tex",
	},	
	medicine_pestle_myth = {
		atlas = "images/inventoryimages/medicine_pestle_myth.xml",
		image = "medicine_pestle_myth.tex",
	},
	bone_mirror = {
		atlas = "images/inventoryimages/bone_mirror.xml",
		image = "bone_mirror.tex",
	},
}
for k,v in pairs(myth_startitem) do
	TUNING.STARTING_ITEM_IMAGE_OVERRIDE[k] = v
end
