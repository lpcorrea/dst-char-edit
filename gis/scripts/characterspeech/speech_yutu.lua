return
{
	ACTIONFAIL =
	{
        REPAIR =
        {
            WRONGPIECE = "那个看着不太对",		--化石骨架拼接错误
        },
        BUILD =
        {
            MOUNTED = "呜姆...手到用时方恨短！",		--建造失败（骑乘状态）
            HASPET = "一个足矣",		--建造失败（已经有一个宠物了）
        },
		SHAVE =
		{
			AWAKEBEEFALO = "我可不要和牛牛比力气",		--给醒着的牛刮毛
			GENERIC = "哎呀！搞错了",		--刮牛毛失败
			NOBITS = "做兔子不能太贪心",		--给没毛的牛刮毛
		},
		STORE =
		{
			GENERIC = "怎么放不进去？",		--存放东西失败
			NOTALLOWED = "别人不允许我用",		--存放东西--不被允许
			INUSE = "总的有个先来后到，对吧！",		--别人正在用箱子
            NOTMASTERCHEF = "让花哨的厨子去做吧",		--暂无注释
		},
        CONSTRUCT =
        {
            INUSE = "得等等了",		--建筑正在使用
            NOTALLOWED = "现在不可以使用",		--建筑不允许使用
            EMPTY = "需要些建东西的材料",		--建筑空了
            MISMATCH = "不对？",		--升级套件错误（目前用不到）
        },
		RUMMAGE =
		{	
			GENERIC = "不行",		--打开箱子失败
			INUSE = "找到了什么好东西？",		--打开箱子 正在使用
            NOTMASTERCHEF = "让花哨的厨子去做吧",		--暂无注释
		},
		UNLOCK =
        {
        },
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "这个钥匙不对哎！",		--使用克劳斯钥匙
        	KLAUS = "时间不对！",		--克劳斯
        },
		ACTIVATE = 
		{
			LOCKED_GATE = "我也想进去！",		--远古钥匙
		},
        COOK =
        {
            GENERIC = "我可不乐意",		--做饭失败
            INUSE = "呣……好香的味道",		--做饭失败-别人在用锅
            TOOFAR = "你想让我用眼神炒菜吗！",		--做饭失败-太远
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "还不能开始！需要一些新鲜的蔬菜！",		--暂无注释
        },
        FISH_OCEAN =
		{
			TOODEEP = "靠近点，小鱼！",		--暂无注释
		},
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "池塘不需要这个",		--暂无注释
		},
        GIVE =
        {
            GENERIC = "他不需要哎",		--给予失败
            DEAD = "魂魄用不上这个",		--给予 -目标死亡
            SLEEPING = "起床啦！我有礼物送你！",		--给予--目标睡觉
            BUSY = "忙的没时间收礼物？",		--给予--目标正忙
            ABIGAILHEART = "嗷……对不起，你去保护你的妹妹吧",		--给阿比盖尔 救赎之心
            GHOSTHEART = "额……我不这么认为",		--给鬼魂 救赎之心
            NOTGEM = "不行",		--给的不是宝石
            WRONGGEM = "驴头不对兔子尾",		--给错了宝石
            NOTSTAFF = "要一件法器才能引动月光之力",		--给月石祭坛的物品不是法杖
            MUSHROOMFARM_NEEDSSHROOM = "需要找到五彩斑斓蘑菇!",		--蘑菇农场需要蘑菇
            MUSHROOMFARM_NEEDSLOG = "需要拿根怪木头来",		--蘑菇农场需要活木
            SLOTFULL = "已经满了",		--已经放了材料后，再给雕像桌子再给一个材料
            FOODFULL = "有东西在烹饪中了",		--没调用
            NOTDISH = "啵！！",		--没调用
            DUPLICATE = "噢！早就料到了！",		--给雕像桌子已经学习过的图纸
            NOTSCULPTABLE = "无法塑造！",		--给陶艺圆盘的东西不对
            NOTATRIUMKEY = "看着不太对",		--中庭钥匙不对
            CANTSHADOWREVIVE = "不行",		--中庭仍在CD
            WRONGSHADOWFORM = "那个看着不对……",		--没调用
            NOMOON = "不会起作用，缺少了月的力量",		--洞穴里建造月石科技
			PIGKINGGAME_MESSY = "得先清理一下……",		--猪王旁边有建筑，不能开始抢元宝
			PIGKINGGAME_DANGER = "现在没时间玩游戏！",		--危险，不能开始抢元宝
			PIGKINGGAME_TOOLATE = "嗷……天色太晚了",		--不是白天，不能开始抢元宝
        },
        GIVETOPLAYER =
        {
            FULL = "他已经有很多了！",		--给玩家一个东西 -但是背包满了
            DEAD = "死去的人应该用不到了",		--给死亡的玩家一个东西
            SLEEPING = "起床啦！我有东西给你！",		--给睡觉的玩家一个东西
            BUSY = "来拿呀！来拿呀！！",		--给忙碌的玩家一个东西
        },
        GIVEALLTOPLAYER =
        {
            FULL = "他们已经有很多了！",		--给人一组东西 但是背包满了
            DEAD = "死去的人应该用不到了",		--给于死去的玩家一组物品
            SLEEPING = "起床啦！我有东西给你！",		--给于正在睡觉的玩家一组物品
            BUSY = "来拿呀！来拿呀！！",		--给于正在忙碌的玩家一组物品
        },
        WRITE =
        {
            GENERIC = "字怎么写的来着？",		--鞋子失败
            INUSE = "接着我来！接着我来！",		--写字 正在使用中
        },
        DRAW =
        {
            NOIMAGE = "我忘记要画什么了，胡萝卜吗？",		--画图缺乏图像
        },
        CHANGEIN =
        {
            GENERIC = "不乐意",		--换装失败 
            BURNING = "快来救火呀！",		--换装失败-着火了
            INUSE = "广寒宫里每个人都有自己的衣橱……",		--衣橱有人占用
        },
        ATTUNE =
        {
            NOHEALTH = "气血虚弱……回复一下再试",		--制造肉雕像血量不足
        },
        MOUNT =
        {
            TARGETINCOMBAT = "它们看起来很火大……",		--骑乘，牛正在战斗
            INUSE = "兔兔要骑牛！",		--骑乘（牛被占据）
        },
        SADDLE =
        {
            TARGETINCOMBAT = "它正在气头上",		--给战斗状态的牛上鞍
        },
        TEACH =
        {
            KNOWN = "已经知道了！",		--学习已经知道的蓝图
            CANTLEARN = "太难了，兔脑袋都疼",		--学习无法学习的蓝图
            WRONGWORLD = "地图不匹配这个地方……",		--学习另外一个世界的地图
        },
        WRAPBUNDLE =
        {
            EMPTY = "空空如也",		--打包纸是空的
        },
        PICKUP =
        {
			RESTRICTION = "不想要",		--熔炉模式下捡起错误的武器
			INUSE = "得等等",		--捡起已经打开的容器
            NOTMINE_YOTC =
            {
                "它不想来",		--暂无注释
                "那个已经有主人了",		--暂无注释
            },
        },
        SLAUGHTER =
        {
            TOOFAR = "快点回来！",		--屠杀？？ 因为太远而失败
        },
        REPLATE =
        {
            MISMATCH = "不是正确的菜", 		--暴食-换盘子换错了 比如用碗换碟子
            SAMEDISH = "已经有了！", 		--暴食-换盘子已经换了
        },
        SAIL =
        {
        	REPAIR = "够好了",		--暂无注释
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "为什么不能直接腾云！",		--暂无注释
            BAD_TIMING1 = "胳膊好累呀",		--暂无注释
            BAD_TIMING2 = "我好歹也是一只仙女兔……",		--暂无注释
        },
        LOWER_SAIL_FAIL =
        {
            "哎呀！",		--暂无注释
            "下去！",		--暂无注释
            "不行……",		--暂无注释
        },
        BATHBOMB =
        {
            GLASSED = "水太硬",		--暂无注释
            ALREADY_BOMBED = "水够热了",		--暂无注释
        },
		GIVE_TACKLESKETCH =
		{
			DUPLICATE = "嘿嘿！早就料到了！",		--暂无注释
		},
		COMPARE_WEIGHABLE =
		{
			TOO_SMALL = "这鱼也太小了！",		--暂无注释
		},
        BEGIN_QUEST =
        {
            ONEGHOST = "only_used_by_wendy",		--暂无注释
        },
	},
	ACTIONFAIL_GENERIC = "做不到",		--动作失败
	ANNOUNCE_BOAT_LEAK = "不要啊！船里变得更湿了！",		--暂无注释
	ANNOUNCE_BOAT_SINK = "……也许船有点太湿了",		--暂无注释
	ANNOUNCE_DIG_DISEASE_WARNING = "看着好一些了？",		--挖起生病的植物
	ANNOUNCE_PICK_DISEASE_WARNING = "好臭",		--（植物生病）
	ANNOUNCE_ADVENTUREFAIL = "搞砸了！",		--没调用（废案）
    ANNOUNCE_MOUNT_LOWHEALTH = "毛绒绒的大个子好像受伤了……",		--牛血量过低
	ANNOUNCE_BEES = "我只是想吃一点点蜂蜜！",		--戴养蜂帽被蜜蜂蛰
	ANNOUNCE_BOOMERANG = "呼呼呼~飞起来喽",		--回旋镖
	ANNOUNCE_CHARLIE = "嫦娥姐姐快救我！",		--查理即将攻击
	ANNOUNCE_CHARLIE_ATTACK = "哼！要不是今天晚上月光暗淡.....",		--被查理攻击
	ANNOUNCE_COLD = "我不该贪凉不换冬毛",		--过冷
	ANNOUNCE_HOT = "我不要做暴晒兔肉！",		--过热
	ANNOUNCE_CRAFTING_FAIL = "不行，还需要更多的东西",		--没调用
	ANNOUNCE_DEERCLOPS = "有妖气在逼近……",		--boss来袭
	ANNOUNCE_CAVEIN = "掉石头啊！！",		--要地震了？？？
	ANNOUNCE_ANTLION_SINKHOLE = 
	{
		"此方土地又在偷懒了",		--蚁狮地震
		"地为什么在摇？！",		--蚁狮地震
		"我得想办法找到源头！",		--蚁狮地震
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "拿去吧，别乱动了",		--向蚁狮致敬
        "这个是给你的",		--给蚁狮上供
        "妖神邪祀早晚给你除了",		--给蚁狮上供
	},
	ANNOUNCE_SACREDCHEST_YES = "耶！",		--远古宝箱物品正确给出蓝图
	ANNOUNCE_SACREDCHEST_NO = "讨厌的大箱子",		--远古宝箱
    ANNOUNCE_DUSK = "太阳公公马上要睡觉了",		--进入黄昏
	ANNOUNCE_EAT =
	{
		GENERIC = "唔呣-呣呣!",		--吃东西
		PAINFUL = "肚子疼……",		--吃怪物肉
		SPOILED = "你居然让我吃这个！呜呜~",		--吃腐烂食物
		STALE = "味道怪怪的",		--吃黄色食物
		INVALID = "本仙子不能吃这个",		--拒吃
        YUCKY = "嫦娥姐姐从来没让我吃过这种东西",		--吃红色食物
    },
    ANNOUNCE_ENCUMBERED =
    {
        "呵……",		--搬运雕像、可疑的大理石
        "累了……",		--搬运雕像、可疑的大理石
        "不要嘛！",		--搬运雕像、可疑的大理石
        "仙女……不适合……搬重东西！",		--搬运雕像、可疑的大理石
        "不……喜欢……这样……",		--搬运雕像、可疑的大理石
        "（嘟囔）",		--搬运雕像、可疑的大理石
        "/(ㄒoㄒ)/~~",		--搬运雕像、可疑的大理石
        "有没有……大一点的人……帮忙……？",		--搬运雕像、可疑的大理石
        "哎呦！我的小蛮腰",		--搬运雕像、可疑的大理石
    },
    ANNOUNCE_ATRIUM_DESTABILIZING = 
    {
		"此番天地在震动！",		--中庭击杀boss后即将刷新
		"出问题了！",		--中庭震动
		"开溜！",		--中庭击杀boss后即将刷新
	},
    ANNOUNCE_RUINS_RESET = "轮回不止！",		--地下重置
    ANNOUNCE_SNARED = "不要关我",		--远古嘤嘤怪的骨笼
    ANNOUNCE_REPELLED = "大乌龟？！",		--嘤嘤怪保护状态
	ANNOUNCE_ENTER_DARK = "黑夜就像一双大手笼罩了我，",		--进入黑暗
	ANNOUNCE_ENTER_LIGHT = "月宫上总是亮堂堂的",		--进入光源
	ANNOUNCE_FREEDOM = "再见咯！",		--没调用（废案）
	ANNOUNCE_HIGHRESEARCH = "感觉脑瓜聪明透顶！",		--没调用（废案）
	ANNOUNCE_HOUNDS = "我……我要一棒子打跑狗子们……也许吧",		--猎犬将至
	ANNOUNCE_WORMS = "有恶心的大虫子要钻出来了",		--蠕虫袭击
	ANNOUNCE_HUNGRY = "我现在一口气能吃下八百根大萝卜！",		--饥饿
	ANNOUNCE_HUNT_BEAST_NEARBY = "柳暗花明？",		--即将找到野兽
	ANNOUNCE_HUNT_LOST_TRAIL = "飞入菜花无处寻",		--猎物（大象脚印丢失）
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "浸湿的土壤了留不下脚印",		--大猎物丢失踪迹
	ANNOUNCE_INV_FULL = "我的口袋不够用了",		--身上的物品满了
	ANNOUNCE_KNOCKEDOUT = "头疼……",		--被催眠
	ANNOUNCE_LOWRESEARCH = "理解不了……",		--没调用（废案）
	ANNOUNCE_MOSQUITOS = "！走开，虫子们！",		--没调用
    ANNOUNCE_NOWARDROBEONFIRE = "不行啊！",		--橱柜着火
    ANNOUNCE_NODANGERGIFT = "想开礼物……可是不安全",		--周围有危险的情况下打开礼物
    ANNOUNCE_NOMOUNTEDGIFT = "得先下来",		--骑牛的时候打开礼物
	ANNOUNCE_NODANGERSLEEP = "现在可不是睡觉的时候！",		--危险，不能睡觉
	ANNOUNCE_NODAYSLEEP = "大白天睡什么觉呀！",		--白天睡帐篷
	ANNOUNCE_NODAYSLEEP_CAVE = "小兔儿还不是很困",		--洞穴里白天睡帐篷
	ANNOUNCE_NOHUNGERSLEEP = "肚子咕囔咕囔叫",		--饿了无法睡觉
	ANNOUNCE_NOSLEEPONFIRE = "我不要变成烤兔子！",		--营帐着火无法睡觉
	ANNOUNCE_NODANGERSIESTA = "你是认真的吗！",		--危险，不能午睡
	ANNOUNCE_NONIGHTSIESTA = "现在我可不想乘凉！",		--夜晚睡凉棚
	ANNOUNCE_NONIGHTSIESTA_CAVE = "这里太吓人……",		--在洞穴里夜晚睡凉棚
	ANNOUNCE_NOHUNGERSIESTA = "肚子咕咕叫的厉害！",		--饱度不足无法午睡
	ANNOUNCE_NODANGERAFK = "得小心！",		--战斗状态下线（已经移除）
	ANNOUNCE_NO_TRAP = "容易！",		--没有陷阱？？？没调用
	ANNOUNCE_PECKED = "噢！噢！噢哇！",		--被小高鸟啄
	ANNOUNCE_QUAKE = "地在摇！",		--地震
	ANNOUNCE_RESEARCH = "感觉脑瓜聪明透顶！",		--没调用
	ANNOUNCE_SHELTER = "大树先生谢谢你的庇护",		--下雨天躲树下
	ANNOUNCE_THORNS = "荆棘缠绕着芬芳！",		--玫瑰、仙人掌、荆棘扎手
	ANNOUNCE_BURNT = "烫！！",		--烧完了
	ANNOUNCE_TORCH_OUT = "看起来要在扎一个火把",		--火把用完了
	ANNOUNCE_THURIBLE_OUT = "嗷，没了",		--香炉燃尽
	ANNOUNCE_FAN_OUT = "呼呼呼……不是我弄坏的！！",		--小风车停了
    ANNOUNCE_COMPASS_OUT = "尖尖的指针坏掉了",		--指南针用完了
	ANNOUNCE_TRAP_WENT_OFF = "……黏糊糊的东西",		--触发陷阱（例如冬季陷阱）
	ANNOUNCE_UNIMPLEMENTED = "陷阱没好！",		--没调用
	ANNOUNCE_WORMHOLE = "大嘴巴差点把我吞了！",		--跳虫洞
	ANNOUNCE_TOWNPORTALTELEPORT = "……感觉好怪！",		--豪华传送
	ANNOUNCE_CANFIX = "很容易就能修好！",		--墙壁可以修理
	ANNOUNCE_ACCOMPLISHMENT = "搞定！",		--没调用
	ANNOUNCE_ACCOMPLISHMENT_DONE = "搞定！",			--没调用
	ANNOUNCE_INSUFFICIENTFERTILIZER = "这种地方萝卜都长不大",		--土地肥力不足
	ANNOUNCE_TOOL_SLIP = "我的爪子拿不住这个",		--工具滑出
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "好你个雷公电母！带我回去禀报太阴星君！",		--规避闪电
	ANNOUNCE_TOADESCAPING = "别走！",		--蟾蜍正在逃跑
	ANNOUNCE_TOADESCAPED = "回来，蛤蟆！！",		--蟾蜍逃走了
	ANNOUNCE_DAMP = "微风吹拂着细雨，夹杂着泥土的芬芳！",		--潮湿（1级）
	ANNOUNCE_WET = "我的毛都被打湿了",		--潮湿（2级）
	ANNOUNCE_WETTER = "我现在是落汤兔，呜呜~",		--潮湿（3级）
	ANNOUNCE_SOAKED = "我现在是在水里游泳吗！",		--潮湿（4级）
	ANNOUNCE_WASHED_ASHORE = "游的很尽兴！",		--暂无注释
    ANNOUNCE_DESPAWN = "感觉冷……",		--下线
	ANNOUNCE_BECOMEGHOST = "啊！",		--变成鬼魂
	ANNOUNCE_GHOSTDRAIN = "额……喔喔…………",		--队友死亡掉san
	ANNOUNCE_PETRIFED_TREES = "树好吓人……",		--石化树
	ANNOUNCE_KLAUS_ENRAGE = "呀！好可怕好可怕！！",		--克劳斯被激怒（杀死了鹿）
	ANNOUNCE_KLAUS_UNCHAINED = "肚子都长牙！救命呀！",		--克劳斯-未上锁的  猜测是死亡准备变身？
	ANNOUNCE_KLAUS_CALLFORHELP = "它在呼朋引伴！",		--克劳斯召唤小偷
	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "里面有东西？",		--暂无注释
		GLASS_LOW = "马上好了！",		--暂无注释
		GLASS_REVEAL = "自由！",		--暂无注释
		IDOL_MED = "里面有东西？",		--暂无注释
		IDOL_LOW = "马上好了！",		--暂无注释
		IDOL_REVEAL = "自由！",		--暂无注释
		SEED_MED = "里面有东西？",		--暂无注释
		SEED_LOW = "马上好了！",		--暂无注释
		SEED_REVEAL = "自由！",		--暂无注释
	},
    ANNOUNCE_SPOOKED = "-看到了一些东西……",		--被吓到
	ANNOUNCE_BRAVERY_POTION = "我从来没怕过！",		--勇气药剂
	ANNOUNCE_MOONPOTION_FAILED = "嗷……什么都没发生",		--暂无注释
	ANNOUNCE_EATING_NOT_FEASTING = "应该跟其他人一起分享",		--暂无注释
	ANNOUNCE_WINTERS_FEAST_BUFF = "噢，感觉亮闪闪的！",		--暂无注释
	ANNOUNCE_IS_FEASTING = "好多食物！",		--暂无注释
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "嘿！闪闪的东西去哪了？",		--暂无注释
    ANNOUNCE_REVIVING_CORPSE = "我们是朋友了……？",		--没调用（熔炉）
    ANNOUNCE_REVIVED_OTHER_CORPSE = "好多了！",		--没调用（熔炉）
    ANNOUNCE_REVIVED_FROM_CORPSE = "-真吓人",		--没调用（熔炉）
    ANNOUNCE_FLARE_SEEN = "天空着火了？？",		--暂无注释
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "有人要来？",		--暂无注释
    ANNOUNCE_ROYALTY =
    {
        "大的重要人物！",		--向带着蜂王帽的队友鞠躬
        "头戴皇冠的小白兔！",		--向带着蜂王帽的队友鞠躬
        "你是童话里的人吗？",		--向带着蜂王帽的队友鞠躬
    },
    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "电光火石！",		--暂无注释
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "想打架嘛！",		--暂无注释
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "我比你身体硬！",		--暂无注释
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "……？怎么我突然想干活了？",		--暂无注释
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "……变的干巴巴了……",		--暂无注释
    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "嗷嗷嗷……",		--暂无注释
    ANNOUNCE_DETACH_BUFF_ATTACK            = "不想打了",		--暂无注释
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "，别打！",		--暂无注释
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "它累了……",		--暂无注释
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "马上湿了起来！",		--暂无注释
	ANNOUNCE_OCEANFISHING_LINESNAP = "嘿！",		--暂无注释
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "线太松了，鱼会跑走的！",		--暂无注释
	ANNOUNCE_OCEANFISHING_GOTAWAY = "不！回来啊，小鱼！",		--暂无注释
	ANNOUNCE_OCEANFISHING_BADCAST = "好难",		--暂无注释
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE = 
	{
		"鱼！过来，鱼！",		--暂无注释
		"嘟嘀嘟嘀嗒……",		--暂无注释
		"鱼儿呢？",		--暂无注释
		"有点久",		--暂无注释
	},
	ANNOUNCE_WEIGHT = "重量：{weight}",		--暂无注释
    ANNOUNCE_KINGCREATED = "鱼人有了新国王！",		--暂无注释
    ANNOUNCE_KINGDESTROYED = "上一届国王不行，有人会找一个更好的！",		--暂无注释
    ANNOUNCE_CANTBUILDHERE_THRONE = "这地方不适合沼泽之王！",		--暂无注释
    ANNOUNCE_CANTBUILDHERE_HOUSE = "真壮观！",		--暂无注释
    ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "卫士会保护这里！",		--暂无注释
    ANNOUNCE_READ_BOOK = 
    {
        BOOK_SLEEP = "很久很久！以前……",		--暂无注释
        BOOK_BIRDS = "有没有帮助织女姐姐的喜鹊呢？",		--暂无注释
        BOOK_TENTACLES =  "这是本好书！",		--暂无注释
        BOOK_BRIMSTONE = "我想知道故事的结尾！",		--暂无注释
        BOOK_GARDENING = "好多生僻词……",		--暂无注释
    },
    ANNOUNCE_WEAK_RAT = "看着不太适合……",		--暂无注释
    ANNOUNCE_CARRAT_START_RACE = "冲！冲！冲！",		--暂无注释
    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = 
    {
        "嘿！往那边跑！那边！",		--暂无注释
        "萝卜鼠跑错方向了！",		--暂无注释
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "别睡觉！起来赢！",    		--暂无注释
    ANNOUNCE_CARRAT_ERROR_WALKING = "跑的不够快啊！",    		--暂无注释
    ANNOUNCE_CARRAT_ERROR_STUNNED = "怎么了，你为什么不动弹？！",		--暂无注释
    ANNOUNCE_GHOST_QUEST = "only_used_by_wendy",		--暂无注释
    ANNOUNCE_ABIGAIL_SUMMON = 
	{
	},
    ANNOUNCE_GHOSTLYBOND_LEVELUP = 
	{
	},
	BATTLECRY =
	{
		GENERIC = "不要怕……我……我可以打赢的……",		--战斗
		PIG = "肥头大耳的没一个好东西！",		--战斗 猪人
		PREY = "留下……留下！",		--战斗 猎物？？大象？
		SPIDER = "如果你能乖乖交出蛛丝，我就少打你一棒！",		--战斗 蜘蛛
		SPIDER_WARRIOR = "你要与我大战一场嘛！",		--战斗 蜘蛛战士
		DEER = "我可不想让别人说我欺负残疾鹿！",		--战斗 无眼鹿
	},
	COMBAT_QUIT =
	{
		GENERIC = "哈哈哈！",		--攻击目标被卡住，无法攻击
		PIG = "坏猪人跑了",		--退出战斗-猪人
		PREY = "回快来！",		--退出战斗 猎物？？大象？
		SPIDER = "喔……可能是蜘蛛精的朋友吧",		-- 退出战斗 蜘蛛
		SPIDER_WARRIOR = "本来就不怎么喜欢你！",		--退出战斗 蜘蛛战士
	},
	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "希望被绝望缠绕，绽放出绚丽的玫瑰",		-- 物品名:"绚丽之门"
        MULTIPLAYER_PORTAL_MOONROCK = "这扇门可以帮我回家嘛！",		-- 物品名:"天体传送门"
        MOONROCKIDOL = "它在看着我",		-- 物品名:"月岩雕像" 制造描述:"重要人物"
        CONSTRUCTION_PLANS = "好像很容易做！",		-- 物品名:未找到
        ANTLION =
        {
            GENERIC = "你想要什么？",		-- 物品名:"蚁狮"->默认
            VERYHAPPY = "她看着高兴多了！",		-- 物品名:"蚁狮"
            UNHAPPY = "哈哈不要生气！",		-- 物品名:"蚁狮"
        },
        ANTLIONTRINKET = "认识一个喜欢这个的人！",		-- 物品名:"沙滩玩具"
        SANDSPIKE = "啊！尖刺！",		-- 物品名:"沙刺"
        SANDBLOCK = "来和我一起堆沙子吧",		-- 物品名:"沙堡"
        GLASSSPIKE = "叉个猪头会更好看！",		-- 物品名:"玻璃狼牙棒"
        GLASSBLOCK = "看起来很容易碎",		-- 物品名:"玻璃城堡"
        ABIGAIL_FLOWER =
        {
            GENERIC ="蕴藏灵魂的花",		-- 物品名:"阿比盖尔之花"->默认 制造描述:"一个神奇的纪念品"
			LEVEL1 = "阿比盖尔藏起来了",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
			LEVEL2 = "她还真是慢慢悠悠",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
			LEVEL3 = "出来！",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
            LONG = "真漂亮",		-- 物品名:"阿比盖尔之花"->还需要很久 制造描述:"一个神奇的纪念品"
            MEDIUM = "呣？",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
            SOON = "有什么事要发生了！",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
            HAUNTED_POCKET = "下去，花！",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
            HAUNTED_GROUND = "不该出现在这的……",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
        },
        BALLOONS_EMPTY = "看起来很漂亮",		-- 物品名:"韦斯的气球" 制造描述:"要是有更简单的方法该多好"
        BALLOON = "我也想要一个！！",		-- 物品名:"气球"
        BERNIE_INACTIVE =
        {
            BROKEN = "啊...我也想要一个",		-- 物品名:"伯尼" 制造描述:"这个疯狂的世界总有你熟悉的人"
            GENERIC = "不玩了吗？",		-- 物品名:"伯尼"->默认 制造描述:"这个疯狂的世界总有你熟悉的人"
        },
        BERNIE_ACTIVE = "想跟它玩！",		-- 物品名:"伯尼"
        BERNIE_BIG = "好玩的玩具!",		-- 物品名:"伯尼！"
        BOOK_BIRDS = "喜鹊在云端架桥，心爱的人会再云端相遇！",		-- 物品名:"世界鸟类手册" 制造描述:"涵盖1000个物种：习性、栖息地及叫声"
        BOOK_TENTACLES = "这也太恶心了",		-- 物品名:"触手的召唤" 制造描述:"让我们来了解一下地下的朋友们！"
        BOOK_GARDENING = "月宫的玄霜仙药可都是我种的",		-- 物品名:"应用园艺学" 制造描述:"讲述培育和照料植物的相关知识"
        BOOK_SLEEP = "嫦娥姐姐经常哄我睡觉！",		-- 物品名:"睡前故事" 制造描述:"送你入梦的睡前故事"
        BOOK_BRIMSTONE = "骗小孩子的把戏！",		-- 物品名:"末日将至！" 制造描述:"世界将在火焰和灾难中终结！"
        PLAYER =
        {
            GENERIC = "你好啊, %s!",		-- 物品名:未找到
            ATTACKER = "不信任 %s",		-- 物品名:未找到
            MURDERER = "………… %s 是杀手！！ ",		-- 物品名:未找到
            REVIVER = "我本来不需要任何帮助的！……不过还是谢了",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "你好吓人， %s",		-- 物品名:"幽灵"
            FIRESTARTER = "你会把所有东西都烧掉， %s!!",		-- 物品名:未找到
        },
        WILSON =
        {
            GENERIC = "你好，可爱的威尔逊！",		-- 物品名:"威尔逊"->默认
            ATTACKER = "这样不好啊！",		-- 物品名:"威尔逊"
            MURDERER = "就知道不能信任这些人！",		-- 物品名:"威尔逊"
            REVIVER = "那个 \"科学\" 挺不错, ",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "嘿嘿，你看着有点傻！",		-- 物品名:"幽灵"
            FIRESTARTER = "这样是为了 \" 科学\"？",		-- 物品名:"威尔逊"
        },
        WOLFGANG =
        {
            GENERIC = "你好，肌肉胡子先生！",		-- 物品名:"沃尔夫冈"->默认
            ATTACKER = "不公平，你个头大很多！",		-- 物品名:"沃尔夫冈"
            MURDERER = "你这个恶霸！",		-- 物品名:"沃尔夫冈"
            REVIVER = "所以你不再怕我了吗？",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "别害怕，我会给你找颗心！",		-- 物品名:"幽灵"
            FIRESTARTER = "这是个馊点子",		-- 物品名:"沃尔夫冈"
        },
        WAXWELL =
        {
            GENERIC = "我感觉到了你身上的黑暗",		-- 物品名:"麦斯威尔"->默认
            ATTACKER = "你这个坏蛋！！",		-- 物品名:"麦斯威尔"
            MURDERER = "我知道为什么也不喜欢你了",		-- 物品名:"麦斯威尔"
            REVIVER = "你好像也没那么坏",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "别闹，我会帮你的！",		-- 物品名:"幽灵"
            FIRESTARTER = "他干的！他干的！",		-- 物品名:"麦斯威尔"
        },
        WX78 =
        {
            GENERIC = "你好小铁人",		-- 物品名:"WX-78"->默认
            ATTACKER = "嗷！住手！",		-- 物品名:"WX-78"
            MURDERER = "残酷的战争！",		-- 物品名:"WX-78"
            REVIVER = "没想到你会这样做……",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "你看起来不怎么高兴",		-- 物品名:"幽灵"
            FIRESTARTER = "你玩的过火了",		-- 物品名:"WX-78"
        },
        WILLOW =
        {
            GENERIC = "你好火焰女士！",		-- 物品名:"薇洛"->默认
            ATTACKER = "你们也不是那么硬！",		-- 物品名:"薇洛"
            MURDERER = "，坏女士！",		-- 物品名:"薇洛"
            REVIVER = "你人其实挺好的",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "反正你都……就换我陪小熊玩吧？好吧，我去找颗心",		-- 物品名:"幽灵"
            FIRESTARTER = "她好像挺开心的",		-- 物品名:"薇洛"
        },
        WENDY =
        {
            GENERIC = "你好，今天姐妹还好吗？",		-- 物品名:"温蒂"->默认
            ATTACKER = "嘿！停手！",		-- 物品名:"温蒂"
            MURDERER = "你只想跟鬼魂玩？",		-- 物品名:"温蒂"
            REVIVER = "替你跟阿比盖饵打招呼了",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "你……真的想要一颗心吗？",		-- 物品名:"幽灵"
            FIRESTARTER = "你为什么那么做？",		-- 物品名:"温蒂"
        },
        WOODIE =
        {
            GENERIC = "你好伐木先生！",		-- 物品名:"伍迪"->默认
            ATTACKER = "去找棵树打，别打人！",		-- 物品名:"伍迪"
            MURDERER = "早就该料到伐木先生是杀手的！",		-- 物品名:"伍迪"
            REVIVER = "伐木先生人很好",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "需要帮忙吗？",		-- 物品名:"幽灵"
            BEAVER = "砍树的那个人去哪了？！",		-- 物品名:"伍迪"
            BEAVERGHOST = "我会找颗心的，你要把伐木先生带回来！",		-- 物品名:"伍迪"
            MOOSE = "砍树的那个人去哪了？！",		-- 物品名:"伍迪"
            MOOSEGHOST = "我会找颗心的，你要把伐木先生带回来！",		-- 物品名:"伍迪"
            GOOSE = "砍树的那个人去哪了？！",		-- 物品名:"伍迪"
            GOOSEGHOST = "我会找颗心的，你要把伐木先生带回来！",		-- 物品名:"伍迪"
            FIRESTARTER = "你不是喜欢砍树吗，怎么又烧东西？",		-- 物品名:"伍迪"
        },
        WICKERBOTTOM =
        {
            GENERIC = "给我讲个故事吧？",		-- 物品名:"薇克巴顿"->默认
            ATTACKER = "生什么气？我什么也没做！",		-- 物品名:"薇克巴顿"
            MURDERER = "亏我那么信任你！",		-- 物品名:"薇克巴顿"
            REVIVER = "非常感谢！（我说对了吗）",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "马上就给你弄颗心！",		-- 物品名:"幽灵"
            FIRESTARTER = "不要到处点营火",		-- 物品名:"薇克巴顿"
        },
        WES =
        {
            GENERIC = "你好，小丑",		-- 物品名:"韦斯"->默认
            ATTACKER = "，走开！",		-- 物品名:"韦斯"
            MURDERER = "当初就不该离开那里！",		-- 物品名:"韦斯"
            REVIVER = "喔……谢谢",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "比平时还苍白",		-- 物品名:"幽灵"
            FIRESTARTER = "你是个怪人",		-- 物品名:"韦斯"
        },
        WEBBER =
        {
            GENERIC = "嗨，小蜘蛛精！",		-- 物品名:"韦伯"->默认
            ATTACKER = "你干嘛这么刻薄？",		-- 物品名:"韦伯"
            MURDERER = "以为你是朋友呢！",		-- 物品名:"韦伯"
            REVIVER = "就知道我们是朋友！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "别难过，会给你找颗心！",		-- 物品名:"幽灵"
            FIRESTARTER = "你会惹上麻烦的！",		-- 物品名:"韦伯"
        },
        WATHGRITHR =
        {
            GENERIC = "你好维京女士！",		-- 物品名:"薇弗德"->默认
            ATTACKER = "维京女士想打一架？？",		-- 物品名:"薇弗德"
            MURDERER = "可别猎杀我！！",		-- 物品名:"薇弗德"
            REVIVER = "……谢谢你",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "喔，你看着好吓人！",		-- 物品名:"幽灵"
            FIRESTARTER = "那不是火焰女士的工作吗",		-- 物品名:"薇弗德"
        },
        WINONA =
        {
            GENERIC = "你认识夜晚女士？",		-- 物品名:"薇诺娜"->默认
            ATTACKER = "那个不安全！",		-- 物品名:"薇诺娜"
            MURDERER = "你辜负了我的信任！！",		-- 物品名:"薇诺娜"
            REVIVER = "都修好了！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "本以为你从来不开小差呢？",		-- 物品名:"幽灵"
            FIRESTARTER = "也许她厌倦修东西了",		-- 物品名:"薇诺娜"
        },
        WORTOX =
        {
            GENERIC = "小\"恶魔\"？",		-- 物品名:"沃拓克斯"->默认
            ATTACKER = "你真是个坏蛋！",		-- 物品名:"沃拓克斯"
            MURDERER = "就知道你信不过！",		-- 物品名:"沃拓克斯"
            REVIVER = "又在捣鬼……？",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "噗嗤一声你就灵魂出窍了！！",		-- 物品名:"幽灵"
            FIRESTARTER = "它看着好吓人",		-- 物品名:"沃拓克斯"
        },
        WORMWOOD =
        {
            GENERIC = "嗨，绿叶植物！",		-- 物品名:"沃姆伍德"->默认
            ATTACKER = "嗷！你这个又老又坏的杂草！",		-- 物品名:"沃姆伍德"
            MURDERER = "我们做不了朋友了！",		-- 物品名:"沃姆伍德"
            REVIVER = "你是颗好植物！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "你在这等着！我去找人帮忙！",		-- 物品名:"幽灵"
            FIRESTARTER = "，那样做很危险！",		-- 物品名:"沃姆伍德"
        },
        WARLY =
        {
            GENERIC = "你好厨师1先生！",		-- 物品名:"沃利"->默认
            ATTACKER = "还以为你是个好人呢！",		-- 物品名:"沃利"
            MURDERER = "你根本就不算朋友！",		-- 物品名:"沃利"
            REVIVER = "你……帮我？",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "不！以后谁给我做好吃的……",		-- 物品名:"幽灵"
            FIRESTARTER = "他什么都想烧来吃！",		-- 物品名:"沃利"
        },
        WURT =
        {
            GENERIC = "你好啊，小鱼人!",		-- 物品名:"沃特"->默认
            ATTACKER = "我们应该团结！",		-- 物品名:"沃特"
            MURDERER = "果然最大的敌人！",		-- 物品名:"沃特"
            REVIVER = "我永远靠谱！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "某个地方应该能找到颗心",		-- 物品名:"幽灵"
            FIRESTARTER = "停手！你会让我们惹上麻烦的！",		-- 物品名:"沃特"
        },
        MIGRATION_PORTAL =
        {
            GENERIC = "这个会去哪？",		-- 物品名:"Matic 朋友之门"->默认
            OPEN = "不知道另一边有什么……",		-- 物品名:"Matic 朋友之门"->打开
            FULL = "没有空位",		-- 物品名:"Matic 朋友之门"->满了
        },
        GLOMMER = 
        {
            GENERIC = "嘿嘿，虫子上的有一些黏糊东西！",		-- 物品名:"罗姆"->默认
            SLEEPING = "晚安，小虫子",		-- 物品名:"罗姆"->睡着了
        },
        GLOMMERFLOWER =
        {
            GENERIC = "绚烂至极？",		-- 物品名:"罗姆花"->默认
            DEAD = "我有点难过",		-- 物品名:"罗姆花"->死了
        },
        GLOMMERWINGS = "大虫子长着奇怪的小翅膀",		-- 物品名:"罗姆翅膀"
        GLOMMERFUEL = "虫子掉的黏液团",		-- 物品名:"罗姆的黏液"
        BELL = "能发出好听的声音",		-- 物品名:"远古铃铛" 制造描述:"这可不是普通的铃铛"
        STATUEGLOMMER =
        {
            GENERIC = "石头看起来像奇怪的虫子",		-- 物品名:"罗姆雕像"->默认
            EMPTY = "哎呀……不是我干的！",		-- 物品名:"罗姆雕像"
        },
        LAVA_POND_ROCK = "也许可以打磨成一个钵",		-- 物品名:"岩石"
		WEBBERSKULL = "骨头不该放那里！",		-- 物品名:"韦伯的头骨"
		WORMLIGHT = "又大又发亮的浆果！",		-- 物品名:"发光蓝莓"
		WORMLIGHT_LESSER = "发一点点光……",		-- 物品名:"较少发光蓝莓"
		WORM =
		{
		    PLANT = "危险与机遇并存……",		-- 物品名:"洞穴蠕虫"
		    DIRT = "土堆！",		-- 物品名:"洞穴蠕虫"
		    WORM = "虫子！！",		-- 物品名:"洞穴蠕虫"
		},
        WORMLIGHT_PLANT = "真漂亮……",		-- 物品名:"神秘植物"
		MOLE =
		{
			HELD = "小可怜，别扭来扭去了!",		-- 物品名:"鼹鼠"->拿在手里
			UNDERGROUND = "小土地，你要去哪里？",		-- 物品名:"鼹鼠"
			ABOVEGROUND = "真爱管闲事！",		-- 物品名:"鼹鼠"
		},
		MOLEHILL = "鼹鼠家",		-- 物品名:"鼹鼠丘"
		MOLEHAT = "上面的臭味真难闻",		-- 物品名:"鼹鼠帽" 制造描述:"为穿戴者提供夜视能力"
		EEL = "你好长鱼！",		-- 物品名:"鳗鱼"
		EEL_COOKED = "这下你放不了电了吧",		-- 物品名:"烤鳗鱼"
		UNAGI = "不能这样对待鱼!",		-- 物品名:"鳗鱼料理"
		EYETURRET = "不会打我……对吧？",		-- 物品名:"眼睛炮塔"
		EYETURRET_ITEM = "这是个好主意吗……",		-- 物品名:"眼睛炮塔" 制造描述:"要远离讨厌的东西，就得杀了它们"
		MINOTAURHORN = "凡尘俗气，无物不避!",		-- 物品名:"守护者之角"
		MINOTAURCHEST = "兔子船长找到了宝藏",		-- 物品名:"大号华丽箱子"
		THULECITE_PIECES = "小东西",		-- 物品名:"铥矿碎片"
		POND_ALGAE = "喔，黏黏的！",		-- 物品名:"水藻"
		GREENSTAFF = "镶了一块漂亮的绿石头",		-- 物品名:"拆解魔杖" 制造描述:"干净而有效的摧毁"
		GIFT = "送我的礼物！",		-- 物品名:"礼物"
        GIFTWRAP = "为什么用一件东西去包另一件？",		-- 物品名:"礼物包装" 制造描述:"把东西打包起来，好看又可爱！"
		POTTEDFERN = "这颗植物有个小房子",		-- 物品名:"蕨类盆栽" 制造描述:"做个花盆，里面栽上蕨类植物"
        SUCCULENT_POTTED = "现在有个家了",		-- 物品名:"多肉盆栽" 制造描述:"塞进陶盆的漂亮多肉植物"
		SUCCULENT_PLANT = "你怎么住在这样一个地方？",		-- 物品名:"多肉植物"
		SUCCULENT_PICKED = "哦，弄坏了",		-- 物品名:"多肉植物"
		SENTRYWARD = "月亮的眼睛？",		-- 物品名:"月眼守卫" 制造描述:"绘图者最有价值的武器"
        TOWNPORTAL =
        {
			GENERIC = "带我到朋友身边！",		-- 物品名:"强征传送塔"->默认 制造描述:"用沙子的力量聚集你的朋友们"
			ACTIVE = "准备好了!",		-- 物品名:"强征传送塔"->激活了 制造描述:"用沙子的力量聚集你的朋友们"
		},
        TOWNPORTALTALISMAN = 
        {
			GENERIC = "传送石！",		-- 物品名:"沙漠石头"->默认
			ACTIVE = "跳到朋友身边！",		-- 物品名:"沙漠石头"->激活了
		},
        WETPAPER = "它可以承载无数的只是",		-- 物品名:"纸张"
        WETPOUCH = "找到了池塘的宝藏！",		-- 物品名:"起皱的包裹"
        MOONROCK_PIECES = "月宫？",		-- 物品名:"月亮石碎块"
        MOONBASE =
        {
            GENERIC = "引导月的力量",		-- 物品名:"月亮石"->默认
            BROKEN = "有人弄坏它了！",		-- 物品名:"月亮石"
            STAFFED = "要有事发生了吗？",		-- 物品名:"月亮石"
            WRONGSTAFF = "看着不太对",		-- 物品名:"月亮石"->插错法杖
            MOONSTAFF = "是月光！",		-- 物品名:"月亮石"->已经插了法杖的（月杖）
        },
        MOONDIAL = 
        {
			GENERIC = "映照着我的故乡",		-- 物品名:"月晷"->默认 制造描述:"追踪月相！"
			NIGHT_NEW = "新月弯弯柳梢眉",		-- 物品名:"月晷"->新月 制造描述:"追踪月相！"
			NIGHT_WAX = "上弦似弓射我心！",		-- 物品名:"月晷"->上弦月 制造描述:"追踪月相！"
			NIGHT_FULL = "满月如轮盈大地！",		-- 物品名:"月晷"->满月 制造描述:"追踪月相！"
			NIGHT_WANE = "云掩初弦月，香传小树花",		-- 物品名:"月晷"->下弦月 制造描述:"追踪月相！"
			CAVE = "这里，望不到故乡",		-- 物品名:"月晷"->洞穴 制造描述:"追踪月相！"
        },
		THULECITE = "看起来好奇怪……",		-- 物品名:"铥矿石" 制造描述:"将小碎片合成一大块"
		ARMORRUINS = "强大的保护！",		-- 物品名:"铥矿甲" 制造描述:"炫目并且能提供保护"
		ARMORSKELETON = "看着真吓人！",		-- 物品名:"骨头盔甲"
		SKELETONHAT = "脑袋感觉怪怪的",		-- 物品名:"骨头头盔"
		RUINS_BAT = "挥舞大棒！",		-- 物品名:"铥矿岩棒" 制造描述:"尖钉让一切变得更好"
		RUINSHAT = "现在我就是大王！！",		-- 物品名:"远古王冠" 制造描述:"附有远古力场！"
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "它好像安全了",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            WARN = "越来越古怪了……",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            WAXING = "有什么事要发生了！",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            STEADY = "一直没变",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            WANING = "它快没了！",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            DAWN = "就快结束了，就快结束了",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            NOMAGIC = "好像是好的",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
		},
		BISHOP_NIGHTMARE = "它不对劲！",		-- 物品名:"损坏的发条主教"
		ROOK_NIGHTMARE = "它怎么了？！",		-- 物品名:"损坏的发条战车"
		KNIGHT_NIGHTMARE = "上面有些不好的东西！",		-- 物品名:"损坏的发条骑士"
		MINOTAUR = "它看起来像个暴脾气",		-- 物品名:"远古守护者"
		SPIDER_DROPPER = "我看到你在上面藏着！",		-- 物品名:"穴居悬蛛"
		NIGHTMARELIGHT = "梦会醒，也会痛",		-- 物品名:"梦魇灯座"
		NIGHTSTICK = "噢，明亮啊！",		-- 物品名:"晨星锤" 制造描述:"用于夜间战斗的晨光"
		GREENGEM = "用碧玉给你做一顶发冠",		-- 物品名:"绿宝石"
		MULTITOOL_AXE_PICKAXE = "做出来这个真聪明",		-- 物品名:"多用斧镐" 制造描述:"加倍实用"
		ORANGESTAFF = "破开空间的力量！",		-- 物品名:"瞬移魔杖" 制造描述:"适合那些不喜欢走路的人"
		YELLOWAMULET = "感觉暖暖的……",		-- 物品名:"魔光护符" 制造描述:"从天堂汲取力量"
		GREENAMULET = "对造东西有帮助！",		-- 物品名:"建造护符" 制造描述:"用更少的材料合成物品！"
		SLURPERPELT = "抢了它的毛皮",			-- 物品名:"铥矿奖章"->啜食者皮 制造描述:"跟踪周围魔力水平的流动"
		SLURPER = "哈哈，痒死了！",		-- 物品名:"啜食者"
		SLURPER_PELT = "抢了它的毛皮",		-- 物品名:"啜食者皮"
		ARMORSLURPER = "好皮带",		-- 物品名:"饥饿腰带" 制造描述:"保持肚子不饿"
		ORANGEAMULET = "让我感到高级",		-- 物品名:"懒人护符" 制造描述:"适合那些不喜欢捡东西的人"
		YELLOWSTAFF = "金乌啼鸣",		-- 物品名:"唤星者法杖" 制造描述:"召唤一个小星星"
		YELLOWGEM = "里面有阳光",		-- 物品名:"黄宝石"
		ORANGEGEM = "古怪的橙色石头",		-- 物品名:"橙宝石"
        OPALSTAFF = "月亮将一部分力量借给了它！",		-- 物品名:"唤月者魔杖"
        OPALPRECIOUSGEM = "凝聚的日月的精华!",		-- 物品名:"彩虹宝石"
        TELEBASE = 
		{
			VALID = "准备！",		-- 物品名:"传送焦点"->有效 制造描述:"装上宝石试试"
			GEMS = "缺点什么……",		-- 物品名:"传送焦点"->需要宝石 制造描述:"装上宝石试试"
		},
		GEMSOCKET = 
		{
			VALID = "石头浮起来了",		-- 物品名:"宝石底座"->有效
			GEMS = "找闪光的石头镶在里面",		-- 物品名:"宝石底座"->需要宝石
		},
		STAFFLIGHT = "燃烧的光！",		-- 物品名:"矮人之星"
        STAFFCOLDLIGHT = "广寒风露！",		-- 物品名:"极光"
        ANCIENT_ALTAR = "看起来很旧",		-- 物品名:"远古祭坛"
        ANCIENT_ALTAR_BROKEN = "坏了",		-- 物品名:"损坏的远古祭坛"
        ANCIENT_STATUE = "真吓人",		-- 物品名:"远古雕像"
        LICHEN = "洞穴食物",		-- 物品名:"洞穴苔藓"
		CUTLICHEN = "松脆",		-- 物品名:"苔藓"
		CAVE_BANANA = "呣……好水果",		-- 物品名:"洞穴香蕉"
		CAVE_BANANA_COOKED = "好吃！",		-- 物品名:"烤香蕉"
		CAVE_BANANA_TREE = "上面有水果！",		-- 物品名:"洞穴香蕉树"
		ROCKY = "你好！",		-- 物品名:"石虾"
		COMPASS =
		{
			GENERIC="里面有尖尖的针！",		-- 物品名:"指南针"->默认 制造描述:"指向北方"
			N = "北",		-- 物品名:"指南针" 制造描述:"指向北方"
			S = "南",		-- 物品名:"指南针" 制造描述:"指向北方"
			E = "东",		-- 物品名:"指南针" 制造描述:"指向北方"
			W = "西",		-- 物品名:"指南针" 制造描述:"指向北方"
			NE = "东北",		-- 物品名:"指南针" 制造描述:"指向北方"
			SE = "东南",		-- 物品名:"指南针" 制造描述:"指向北方"
			NW = "西北",		-- 物品名:"指南针" 制造描述:"指向北方"
			SW = "西南",		-- 物品名:"指南针" 制造描述:"指向北方"
		},
        HOUNDSTOOTH = "大汪汪的牙",		-- 物品名:"犬牙"
        ARMORSNURTLESHELL = "真黏！",		-- 物品名:"蜗壳护甲"
        BAT = "不要生吃蝙蝠！",		-- 物品名:"洞穴蝙蝠"
        BATBAT = "动手！动手！",		-- 物品名:"蝙蝠棒" 制造描述:"所有科技都如此...耗费精神"
        BATWING = "没蝙蝠了",		-- 物品名:"洞穴蝙蝠翅膀"
        BATWING_COOKED = "恶……",		-- 物品名:"烤蝙蝠翅膀"
        BATCAVE = "我不怕！",		-- 物品名:"蝙蝠洞"
        BEDROLL_FURRY = "毛茸茸的……",		-- 物品名:"毛皮铺盖" 制造描述:"舒适地一觉睡到天亮！"
        BUNNYMAN = "不如我们一起去晒太阳吧！",		-- 物品名:"兔人"
        FLOWER_CAVE = "没用的花朵",		-- 物品名:"荧光花"
        GUANO = "蝙蝠也拉便便",		-- 物品名:"鸟粪"
        LANTERN = "放光啊！",		-- 物品名:"提灯" 制造描述:"可加燃料、明亮、便携！"
        LIGHTBULB = "你说\"别放进嘴里\" 是什么意思?",		-- 物品名:"荧光果"
        MANRABBIT_TAIL = "唉?不是我掉的吧！",		-- 物品名:"兔绒"
        MUSHROOMHAT = "让头又好看又黏！",		-- 物品名:"蘑菇帽"
        MUSHROOM_LIGHT2 =
        {
            ON = "噢，漂亮的色彩！",		-- 物品名:"炽菇灯"->开启 制造描述:"受到火山岩浆灯饰学问的激发"
            OFF = "它有什么作用吗？",		-- 物品名:"炽菇灯"->关闭 制造描述:"受到火山岩浆灯饰学问的激发"
            BURNT = "曾经那么美……",		-- 物品名:"炽菇灯"->烧焦的 制造描述:"受到火山岩浆灯饰学问的激发"
        },
        MUSHROOM_LIGHT =
        {
            ON = "发着光！",		-- 物品名:"蘑菇灯"->开启 制造描述:"任何蘑菇的完美添加物"
            OFF = "它的形状很奇怪",		-- 物品名:"蘑菇灯"->关闭 制造描述:"任何蘑菇的完美添加物"
            BURNT = "不是我干的！！",		-- 物品名:"蘑菇灯"->烧焦的 制造描述:"任何蘑菇的完美添加物"
        },
        SLEEPBOMB = "嘿嘿，安安！",		-- 物品名:"睡袋" 制造描述:"可以扔掉的袋子睡意沉沉"
        MUSHROOMBOMB = "快跑！",		-- 物品名:"炸弹蘑菇"
        SHROOM_SKIN = "麻麻赖赖的皮肤！",		-- 物品名:"蘑菇皮"
        TOADSTOOL_CAP =
        {
            EMPTY = "你好？有人在家吗？",		-- 物品名:"毒菌蟾蜍"
            INGROUND = "咱们里面见！",		-- 物品名:"毒菌蟾蜍"->在地里面
            GENERIC = "你这帽子很不错",		-- 物品名:"毒菌蟾蜍"->默认
        },
        TOADSTOOL =
        {
            GENERIC = "我想离他远一点",		-- 物品名:"毒菌蟾蜍"->默认
            RAGE = "我们应该是惹他生气了！",		-- 物品名:"毒菌蟾蜍"->愤怒
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "大蘑菇！",		-- 物品名:"孢子帽"->默认
            BURNT = "哎呀……",		-- 物品名:"孢子帽"->烧焦的
        },
        MUSHTREE_TALL =
        {
            GENERIC = "看起来味道不错",		-- 物品名:"蓝蘑菇树"->默认
            BLOOM = "有东西在往下掉",		-- 物品名:"蓝蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "长好大啊！",		-- 物品名:"红蘑菇树"->默认
            BLOOM = "好漂亮！",		-- 物品名:"红蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "矮矮的木桩",		-- 物品名:"绿蘑菇树"->默认
            BLOOM = "飘浮的灯！",		-- 物品名:"绿蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_TALL_WEBBED = "这一个被蜘蛛人占有了",		-- 物品名:"蛛网蓝蘑菇树"
        SPORE_TALL =
        {
            GENERIC = "好漂亮！",		-- 物品名:"蓝色孢子"->默认
            HELD = "这飘浮的小绒毛现在是我的了！",		-- 物品名:"蓝色孢子"->拿在手里
        },
        SPORE_MEDIUM =
        {
            GENERIC = "能浮起来！",		-- 物品名:"红色孢子"->默认
            HELD = "这飘浮的小绒毛现在是我的了！",		-- 物品名:"红色孢子"->拿在手里
        },
        SPORE_SMALL =
        {
            GENERIC = "它在跳舞！",		-- 物品名:"绿色孢子"->默认
            HELD = "这飘浮的小绒毛现在是我的了！",		-- 物品名:"绿色孢子"->拿在手里
        },
        RABBITHOUSE =
        {
            GENERIC = "你好，有兔兔在家嘛(●'◡'●)",		-- 物品名:"兔屋"->默认 制造描述:"可容纳一只巨大的兔子及其所有物品"
            BURNT = "虽然很可惜，但是......想吃那个！",		-- 物品名:"兔屋"->烧焦的 制造描述:"可容纳一只巨大的兔子及其所有物品"
        },
        SLURTLE = "跟我一个朋友长得很像",		-- 物品名:"尖壳蜗牛"
        SLURTLE_SHELLPIECES = "嗷，它坏掉了！",		-- 物品名:"蜗壳碎片"
        SLURTLEHAT = "现在是我的壳子了！",		-- 物品名:"蜗牛帽"
        SLURTLEHOLE = "喔，黏黏的！",		-- 物品名:"尖壳蜗牛窝"
        SLURTLESLIME = "会爆炸的黏液！",		-- 物品名:"尖壳蜗牛黏液"
        SNURTLE = "有张值得信任的脸",		-- 物品名:"圆壳蜗牛"
        SPIDER_HIDER = "神圣的蜘蛛！！",		-- 物品名:"洞穴蜘蛛"
        SPIDER_SPITTER = "蜘蛛吐的痰！！",		-- 物品名:"喷射蜘蛛"
        SPIDERHOLE = "蜘蛛人的洞！",		-- 物品名:"蛛网岩"
        SPIDERHOLE_ROCK = "你好，有兔兔在家嘛",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品"
        STALAGMITE = "洞穴岩石",		-- 物品名:"石笋"
        STALAGMITE_TALL = "很大的洞穴岩石",		-- 物品名:"石笋"
        TREASURECHEST_TRAP = "宝藏！",		-- 物品名:"宝箱"
        TURF_CARPETFLOOR = "毛绒绒的地面",		-- 物品名:"地毯地板" 制造描述:"超级柔软气味像牦牛"
        TURF_CHECKERFLOOR = "地面上的东西",		-- 物品名:"棋盘地板" 制造描述:"精心制作成棋盘状的大理石地砖"
        TURF_DIRT = "地面上的东西",		-- 物品名:"泥土地皮"
        TURF_FOREST = "地面上的东西",		-- 物品名:"森林地皮"
        TURF_GRASS = "地面上的东西",		-- 物品名:"长草地皮"
        TURF_MARSH = "地面上的东西",		-- 物品名:"沼泽地皮" 制造描述:"沼泽在哪，家就在哪！"
        TURF_METEOR = "地面上的东西",		-- 物品名:"月坑地皮" 制造描述:"月球表面的月坑"
        TURF_PEBBLEBEACH = "地面上的东西",		-- 物品名:"岩石海滩地皮"
        TURF_ROAD = "能让地面好走一点！",		-- 物品名:"卵石路" 制造描述:"修建你自己的道路，通往任何地方"
        TURF_ROCKY = "地面上的东西",		-- 物品名:"岩石地皮"
        TURF_SAVANNA = "地面上的东西",		-- 物品名:"热带草原地皮"
        TURF_WOODFLOOR = "树的碎片",		-- 物品名:"木地板" 制造描述:"优质复合地板"
		TURF_CAVE="地面上的东西",		-- 物品名:"鸟粪地皮"
		TURF_FUNGUS="地面上的东西",		-- 物品名:"菌类地皮"
		TURF_SINKHOLE="地面上的东西",		-- 物品名:"黏滑地皮"
		TURF_UNDERROCK="地面上的东西",		-- 物品名:"洞穴岩石地皮"
		TURF_MUD="地面上的东西",		-- 物品名:"泥泞地皮"
		TURF_DECIDUOUS = "地面上的东西",		-- 物品名:"桦树地皮"
		TURF_SANDY = "你好，有兔兔在家嘛",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品"
		TURF_BADLANDS = "地面上的东西",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品"
		TURF_DESERTDIRT = "地面上的东西",		-- 物品名:"沙漠地皮"
		TURF_FUNGUS_GREEN = "地面上的东西",		-- 物品名:"菌类地皮"
		TURF_FUNGUS_RED = "地面上的东西",		-- 物品名:"菌类地皮"
		TURF_DRAGONFLY = "有鳞片的地面！",		-- 物品名:"鳞状地板" 制造描述:"消除火灾蔓延速度"
		POWCAKE = "吃了会肚子疼，但是闻起来好香……",		-- 物品名:"芝士蛋糕"
        CAVE_ENTRANCE = "被石头挡到了",		-- 物品名:"堵住的陷洞"
        CAVE_ENTRANCE_RUINS = "下面那有什么？",		-- 物品名:"被堵住的陷洞"->单机 洞二入口
       	CAVE_ENTRANCE_OPEN = 
        {
            GENERIC = "下面有东西",		-- 物品名:"陷洞"->默认
            OPEN = "想看里面有什么！",		-- 物品名:"陷洞"->打开
            FULL = "让我进去！",		-- 物品名:"陷洞"->满了
        },
        CAVE_EXIT = 
        {
            GENERIC = "有点喜欢这下面",		-- 物品名:"楼梯"->默认
            OPEN = "想念外面的世界",		-- 物品名:"楼梯"->打开
            FULL = "让我出去！",		-- 物品名:"楼梯"->满了
        },
		MAXWELLPHONOGRAPH = "里面传出音乐来！",		-- 物品名:"麦斯威尔的留声机"->单机 麦斯威尔留声机
		BOOMERANG = "回旋木棒！",		-- 物品名:"回旋镖" 制造描述:"来自澳洲土著"
		PIGGUARD = "他比其他人更吓人",		-- 物品名:"猪人守卫"
		ABIGAIL =
		{
            LEVEL1 =
            {
                "你……是好人吗？",		-- 物品名:未找到 制造描述:未找到
                "你……是好人吗？",		-- 物品名:未找到 制造描述:未找到
            },
            LEVEL2 = 
            {
                "你……是好人吗？",		-- 物品名:未找到 制造描述:未找到
                "你……是好人吗？",		-- 物品名:未找到 制造描述:未找到
            },
            LEVEL3 = 
            {
                "你……是好人吗？",		-- 物品名:未找到 制造描述:未找到
                "你……是好人吗？",		-- 物品名:未找到 制造描述:未找到
            },
		},
		ADVENTURE_PORTAL = "这个会去哪？",		-- 物品名:"麦斯威尔之门"->单机 麦斯威尔之门
		AMULET = "漂亮魔法石！",		-- 物品名:"重生护符" 制造描述:"逃离死神的魔爪"
		ANIMAL_TRACK = "行踪！",		-- 物品名:"动物足迹"
		ARMORGRASS = "渔舟蓑笠！",		-- 物品名:"草甲" 制造描述:"提供少许防护"
		ARMORMARBLE = "真沉啊……",		-- 物品名:"大理石甲" 制造描述:"它很重，但能够保护你"
		ARMORWOOD = "木衬衣！",		-- 物品名:"木甲" 制造描述:"为你抵御部分伤害"
		ARMOR_SANITY = "它在吞噬我的灵魂!!",		-- 物品名:"魂甲" 制造描述:"保护你的躯体，但无法保护你的心智"
		ASH =
		{
			GENERIC = "芳兰已灰烬,幕府留馀香",		-- 物品名:"灰烬"->默认
			REMAINS_GLOMMERFLOWER = "嗷……全没了",		-- 物品名:"灰烬"->单机专用
			REMAINS_EYE_BONE = "再见咯，闪光棒",		-- 物品名:"灰烬"->单机专用
			REMAINS_THINGIE = "没有了",		-- 物品名:"灰烬"->单机专用
		},
		AXE = "看我用大斧头给你雕个萝卜花",		-- 物品名:"斧头" 制造描述:"砍倒树木！"
		BABYBEEFALO = 
		{
			GENERIC = "真小",		-- 物品名:"小牦牛"->默认
		    SLEEPING = "安安啦！",		-- 物品名:"小牦牛"->睡着了
        },
        BUNDLE = "留着以后用",		-- 物品名:"捆绑物资"
        BUNDLEWRAP = "能包好多东西的！",		-- 物品名:"捆绑包装" 制造描述:"打包你的东西的部分和袋子"
		BACKPACK = "我也有行囊啦！",		-- 物品名:"背包" 制造描述:"携带更多物品"
		BACONEGGS = "快拿开！",		-- 物品名:"培根煎蛋"
		BANDAGE = "让伤口感觉好一些",		-- 物品名:"蜂蜜药膏" 制造描述:"愈合小伤口"
		BASALT = "硬石头！！",		-- 物品名:"玄武岩"
		BEARDHAIR = "他真奇怪……",		-- 物品名:"胡子"
		BEARGER = "快跑！！",		-- 物品名:"狂暴熊獾"
		BEARGERVEST = "感觉暖暖的，毛绒绒的……",		-- 物品名:"熊皮背心" 制造描述:"熊皮背心"
		ICEPACK = "毛绒绒的包包！",		-- 物品名:"保鲜背包" 制造描述:"容量虽小，但能保持东西新鲜"
		BEARGER_FUR = "条纹小绒毛",		-- 物品名:"熊皮" 制造描述:"毛皮再生"
		BEDROLL_STRAW = "暖暖的睡一觉",		-- 物品名:"草席卷" 制造描述:"一觉睡到天亮"
		BEEQUEEN = "听说她吃的蜜最甜！",		-- 物品名:"蜂王"
		BEEQUEENHIVE = 
		{
			GENERIC = "里面有蜂蜜吗？",		-- 物品名:"蜂蜜地块"->默认
			GROWING = "有些奇怪……",		-- 物品名:"蜂蜜地块"->正在生长
		},
        BEEQUEENHIVEGROWN = "有种不祥的预感……",		-- 物品名:"巨大蜂巢"
        BEEGUARD = "大蜜蜂！",		-- 物品名:"嗡嗡蜜蜂"
        HIVEHAT = "我是你们的蜂王了！",		-- 物品名:"蜂王帽"
        MINISIGN =
        {
            GENERIC = "噢，图片！",		-- 物品名:"小木牌"->默认
            UNDRAWN = "上面什么都没",		-- 物品名:"小木牌"->没有画画
        },
        MINISIGN_ITEM = "把它放哪？",		-- 物品名:"小木牌" 制造描述:"用羽毛笔在这些上面画画"
		BEE =
		{
			GENERIC = "采得百花成蜜后 为谁辛苦为谁甜",		-- 物品名:"蜜蜂"->默认
			HELD = "哈！你先在我的包里乖乖的！",		-- 物品名:"蜜蜂"->拿在手里
		},
		BEEBOX =
		{
			READY = "采蜜采蜜！！",		-- 物品名:"蜂箱"->准备好的 满的 制造描述:"贮存你自己的蜜蜂"
			FULLHONEY = "让我来个你做点甜点吧！",		-- 物品名:"蜂箱"->蜂蜜满了 制造描述:"贮存你自己的蜜蜂"
			GENERIC = "小蜜蜂的家",		-- 物品名:"蜂箱"->默认 制造描述:"贮存你自己的蜜蜂"
			NOHONEY = "嗷，里面没有蜂蜜了",		-- 物品名:"蜂箱"->没有蜂蜜 制造描述:"贮存你自己的蜜蜂"
			SOMEHONEY = "不想等啊！！",		-- 物品名:"蜂箱"->有一些蜂蜜 制造描述:"贮存你自己的蜜蜂"
			BURNT = "它不再嗡嗡了……",		-- 物品名:"蜂箱"->烧焦的 制造描述:"贮存你自己的蜜蜂"
		},
		MUSHROOM_FARM =
		{
			STUFFED = "没地方种更多蘑菇了！",		-- 物品名:"蘑菇农场"->塞，满了？？ 制造描述:"种蘑菇"
			LOTS = "呣，好多美味的小吃在成长！",		-- 物品名:"蘑菇农场"->很多 制造描述:"种蘑菇"
			SOME = "他们开始成长了！",		-- 物品名:"蘑菇农场"->有一些 制造描述:"种蘑菇"
			EMPTY = "需要蘑菇！",		-- 物品名:"蘑菇农场" 制造描述:"种蘑菇"
			ROTTEN = "需要更多的怪木头！",		-- 物品名:"蘑菇农场"->腐烂的--需要活木 制造描述:"种蘑菇"
			BURNT = "烧的太焦种不了蘑菇",		-- 物品名:"蘑菇农场"->烧焦的 制造描述:"种蘑菇"
			SNOWCOVERED = "也许蘑菇在睡觉？",		-- 物品名:"蘑菇农场"->被雪覆盖 制造描述:"种蘑菇"
		},
		BEEFALO =
		{
			FOLLOWER = "跟着我！",		-- 物品名:"牦牛"->追随者
			GENERIC = "大绒毛！",		-- 物品名:"牦牛"->默认
			NAKED = "披着毛皮好看些",		-- 物品名:"牦牛"->牛毛被刮干净了
			SLEEPING = "安安，大绒毛",		-- 物品名:"牦牛"->睡着了
            DOMESTICATED = "它是朋友",		-- 物品名:"牦牛"->驯化牛
            ORNERY = "别生气！！",		-- 物品名:"牦牛"->战斗牛
            RIDER = "想骑！",		-- 物品名:"牦牛"->骑行牛
            PUDGY = "大绒毛看着太大了",		-- 物品名:"牦牛"->胖牛
		},
		BEEFALOHAT = "更大的角！！",		-- 物品名:"牛角帽" 制造描述:"成为牛群中的一员！连气味也变得一样"
		BEEFALOWOOL = "小绒毛",		-- 物品名:"牛毛"
		BEEHAT = "戴上这个什么都看不到！",		-- 物品名:"养蜂帽" 制造描述:"防止被愤怒的蜜蜂蜇伤"
        BEESWAX = "从蜜蜂巢里偷来的！",		-- 物品名:"蜂蜡" 制造描述:"一种有用的防腐蜂蜡"
		BEEHIVE = "蜜蜂的家",		-- 物品名:"野生蜂窝"
		BEEMINE = "小心！",		-- 物品名:"蜜蜂地雷" 制造描述:"变成武器的蜜蜂会出什么问题？"
		BEEMINE_MAXWELL = "不喜欢它嗡嗡叫",		-- 物品名:"麦斯威尔的蚊子陷阱"->单机 麦斯威尔的蚊子陷阱
		BERRIES = "甜蜜的果子！",		-- 物品名:"浆果"
		BERRIES_COOKED = "烤制过后更甜了，",		-- 物品名:"烤浆果"
        BERRIES_JUICY = "噢，又大又好吃！",		-- 物品名:"多汁浆果"
        BERRIES_JUICY_COOKED = "想全吃完！",		-- 物品名:"烤多汁浆果"
		BERRYBUSH =
		{
			BARREN = "放一些便便在上面",		-- 物品名:"浆果丛"
			WITHERED = "太干了",		-- 物品名:"浆果丛"->枯萎了
			GENERIC = "零食！",		-- 物品名:"浆果丛"->默认
			PICKED = "得等等才能结出来",		-- 物品名:"浆果丛"->被采完了
			DISEASED = "病了就长不出果子了",		-- 物品名:"浆果丛"->生病了
			DISEASING = "看着不太对",		-- 物品名:"浆果丛"->正在生病？？
			BURNING = "再见",		-- 物品名:"浆果丛"->正在燃烧
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "需要便便",		-- 物品名:"多汁浆果丛"
			WITHERED = "它也不喜欢热",		-- 物品名:"多汁浆果丛"->枯萎了
			GENERIC = "得赶紧吃！",		-- 物品名:"多汁浆果丛"->默认
			PICKED = "能做小吃！能做小吃！",		-- 物品名:"多汁浆果丛"->被采完了
			DISEASED = "看起来不太好",		-- 物品名:"多汁浆果丛"->生病了
			DISEASING = "看着不太对",		-- 物品名:"多汁浆果丛"->正在生病？？
			BURNING = "热热热！",		-- 物品名:"多汁浆果丛"->正在燃烧
		},
		BIGFOOT = "大脚丫！",		-- 物品名:"大脚怪"->单机 大脚怪
		BIRDCAGE =
		{
			GENERIC = "给鸟儿一个温暖的家！",		-- 物品名:"鸟笼"->默认 制造描述:"为你的鸟类朋友提供一个幸福的家"
			OCCUPIED = "现在鸟哪都不去了！",		-- 物品名:"鸟笼"->被占领 制造描述:"为你的鸟类朋友提供一个幸福的家"
			SLEEPING = "晚安，小鸟",		-- 物品名:"鸟笼"->睡着了 制造描述:"为你的鸟类朋友提供一个幸福的家"
			HUNGRY = "鸟要吃点东西了",		-- 物品名:"鸟笼"->有点饿了 制造描述:"为你的鸟类朋友提供一个幸福的家"
			STARVING = "它看起来很饿……",		-- 物品名:"鸟笼"->挨饿 制造描述:"为你的鸟类朋友提供一个幸福的家"
			DEAD = "嗷，它死了",		-- 物品名:"鸟笼"->死了 制造描述:"为你的鸟类朋友提供一个幸福的家"
			SKELETON = "...",		-- 物品名:"骷髅"
		},
		BIRDTRAP = "抓鸟用的！",		-- 物品名:"捕鸟陷阱" 制造描述:"捕捉会飞的动物"
		CAVE_BANANA_BURNT = "毁掉了",		-- 物品名:"鸟笼"->烧焦的洞穴香蕉树 制造描述:"为你的鸟类朋友提供一个幸福的家"
		BIRD_EGG = "里面有小鸟吗？",		-- 物品名:"鸟蛋"
		BIRD_EGG_COOKED = "不想吃！",		-- 物品名:"煎蛋"
		BISHOP = "活泼的铁人！！",		-- 物品名:"发条主教"
		BLOWDART_FIRE = "想试试那个！",		-- 物品名:"火焰吹箭" 制造描述:"向你的敌人喷火"
		BLOWDART_SLEEP = "到睡觉时间了！",		-- 物品名:"催眠吹箭" 制造描述:"催眠你的敌人"
		BLOWDART_PIPE = "biu biu biu！",		-- 物品名:"吹箭" 制造描述:"向你的敌人喷射利齿"
		BLOWDART_YELLOW = "活泼啊！",		-- 物品名:"雷电吹箭" 制造描述:"朝你的敌人放闪电"
		BLUEAMULET = "冰冰凉！",		-- 物品名:"寒冰护符" 制造描述:"多么冰冷酷炫的护符"
		BLUEGEM = "漂亮的石头",		-- 物品名:"蓝宝石"
		BLUEPRINT = 
		{ 
            COMMON = "上面还有图呢！",		-- 物品名:"蓝图"
            RARE = "看起来真复杂",		-- 物品名:"蓝图"->罕见的
        },
        SKETCH = "噢，骨架！",		-- 物品名:"{item}骨架"
		BLUE_CAP = "对肚子好，对头可不好",		-- 物品名:"采摘的蓝蘑菇"
		BLUE_CAP_COOKED = "闻起来不一样……",		-- 物品名:"烤蓝蘑菇"
		BLUE_MUSHROOM =
		{
			GENERIC = "食物！",		-- 物品名:"蓝蘑菇"->默认
			INGROUND = "等它颜色深一点我再回来",		-- 物品名:"蓝蘑菇"->在地里面
			PICKED = "又长大了！",		-- 物品名:"蓝蘑菇"->被采完了
		},
		BOARDS = "树上砍下的建造原料",		-- 物品名:"木板" 制造描述:"更平直的木头"
		BONESHARD = "某种遗骸",		-- 物品名:"骨头碎片"
		BONESTEW = "凡尘的浊物",		-- 物品名:"炖肉汤"
		BUGNET = "想抓虫子！",		-- 物品名:"捕虫网" 制造描述:"抓虫子用的"
		BUSHHAT = "看不到我！！",		-- 物品名:"灌木丛帽" 制造描述:"很好的伪装！"
		BUTTER = "跟花一样的味道……不错",		-- 物品名:"黄油"
		BUTTERFLY =
		{
			GENERIC = "晚来蝴蝶入疏帘",		-- 物品名:"蝴蝶"->默认
			HELD = "抓住了！",		-- 物品名:"蝴蝶"->拿在手里
		},
		BUTTERFLYMUFFIN = "好吃的小松饼！",		-- 物品名:"蝴蝶松饼"
		BUTTERFLYWINGS = "可怜的小家伙！",		-- 物品名:"蝴蝶翅膀"
		BUZZARD = "光秃秃的小鸟！",		-- 物品名:"秃鹫"
		SHADOWDIGGER = "他使用坏的那种魔法！！",		-- 物品名:"蝴蝶"
		CACTUS = 
		{
			GENERIC = "长满了尖刺",		-- 物品名:"仙人掌"->默认
			PICKED = "长回来吧！",		-- 物品名:"仙人掌"->被采完了
		},
		CACTUS_MEAT_COOKED = "呣，到饭点了！",		-- 物品名:"烤仙人掌肉"
		CACTUS_MEAT = "嗷！还是很多刺",		-- 物品名:"仙人掌肉"
		CACTUS_FLOWER = "样子丑但是很好吃",		-- 物品名:"仙人掌花"
		COLDFIRE =
		{
			EMBERS = "火要熄了",		-- 物品名:"冰火"->即将熄灭 制造描述:"这火是越烤越冷的冰火"
			GENERIC = "我们来围着营火讲故事吧，",		-- 物品名:"冰火"->默认 制造描述:"这火是越烤越冷的冰火"
			HIGH = "大火！",		-- 物品名:"冰火"->高 制造描述:"这火是越烤越冷的冰火"
			LOW = "火变小了",		-- 物品名:"冰火"->低？ 制造描述:"这火是越烤越冷的冰火"
			NORMAL = "冰凉的火？",		-- 物品名:"冰火"->普通 制造描述:"这火是越烤越冷的冰火"
			OUT = "再见",		-- 物品名:"冰火"->出去？外面？ 制造描述:"这火是越烤越冷的冰火"
		},
		CAMPFIRE =
		{
			EMBERS = "火要熄了",		-- 物品名:"营火"->即将熄灭 制造描述:"燃烧时发出光亮"
			GENERIC = "我们来围着营火讲故事吧，",		-- 物品名:"营火"->默认 制造描述:"燃烧时发出光亮"
			HIGH = "大火！",		-- 物品名:"营火"->高 制造描述:"燃烧时发出光亮"
			LOW = "火变小了",		-- 物品名:"营火"->低？ 制造描述:"燃烧时发出光亮"
			NORMAL = "温暖舒适",		-- 物品名:"营火"->普通 制造描述:"燃烧时发出光亮"
			OUT = "再见",		-- 物品名:"营火"->出去？外面？ 制造描述:"燃烧时发出光亮"
		},
		CANE = "你看我需要这个吗？",		-- 物品名:"拐棍" 制造描述:"泰然自若地快步走"
		CATCOON = "你真可爱",		-- 物品名:"浣熊猫"
		CATCOONDEN = 
		{
			GENERIC = "里面的东西在挠壳子",		-- 物品名:"空心树桩"->默认
			EMPTY = "家里没人了",		-- 物品名:"空心树桩"
		},
		CATCOONHAT = "哈哈，现在变帽子了",		-- 物品名:"浣熊猫帽子" 制造描述:"适合那些重视温暖甚于朋友的人"
		COONTAIL = "现在归我了！",		-- 物品名:"浣熊猫尾巴"
		CARROT = "香香脆脆的大萝卜！",		-- 物品名:"胡萝卜"
		CARROT_COOKED = "生的更香脆可口",		-- 物品名:"烤胡萝卜"
		CARROT_PLANTED = "长大！长大！",		-- 物品名:"胡萝卜"
		CARROT_SEEDS = "种一粒种子，收一筐萝卜！",		-- 物品名:"胡萝卜种子"
		CARTOGRAPHYDESK =
		{
			GENERIC = "我需要地图！",		-- 物品名:"制图桌"->默认 制造描述:"准确地告诉别人你去过哪里"
			BURNING = "再见了！",		-- 物品名:"制图桌"->正在燃烧 制造描述:"准确地告诉别人你去过哪里"
			BURNT = "没了",		-- 物品名:"制图桌"->烧焦的 制造描述:"准确地告诉别人你去过哪里"
		},
		WATERMELON_SEEDS = "能种出更多的西瓜！",		-- 物品名:"西瓜种子"
		CAVE_FERN = "茂盛的洞穴植物",		-- 物品名:"蕨类植物"
		CHARCOAL = "会把手爪都弄脏",		-- 物品名:"木炭"
        CHESSPIECE_PAWN = "它们中最小的一个……",		-- 物品名:"卒子棋子"
        CHESSPIECE_ROOK =
        {
            GENERIC = "这座城堡真小",		-- 物品名:"战车棋子"->默认
            STRUGGLE = "在动！",		-- 物品名:"战车棋子"->三基佬棋子晃动
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "看起来像铁人",		-- 物品名:"骑士棋子"->默认
            STRUGGLE = "在动！",		-- 物品名:"骑士棋子"->三基佬棋子晃动
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "尖的！",		-- 物品名:"主教棋子"->默认
            STRUGGLE = "在动！",		-- 物品名:"主教棋子"->三基佬棋子晃动
        },
        CHESSPIECE_MUSE = "可怕的女士",		-- 物品名:"女王棋子"
        CHESSPIECE_FORMAL = "为什么在这东西周围人就变得怪怪的",		-- 物品名:"国王棋子"
        CHESSPIECE_HORNUCOPIA = "全是好吃的！",		-- 物品名:"丰饶角雕刻"
        CHESSPIECE_PIPE = "没毛毛真奇怪",		-- 物品名:"泡泡烟斗雕塑"
        CHESSPIECE_DEERCLOPS = "不会再烦我们了",		-- 物品名:"独眼巨鹿棋子"
        CHESSPIECE_BEARGER = "！",		-- 物品名:"熊獾棋子"
        CHESSPIECE_MOOSEGOOSE =
        {
            "哈哈！瞧她的脸！",		-- 物品名:"驼鹿棋子" 制造描述:未找到
        },
        CHESSPIECE_DRAGONFLY = "瞪大眼睛，神奇惊奇",		-- 物品名:"龙蝇棋子"
        CHESSPIECE_BUTTERFLY = "好丑",		-- 物品名:"月蛾棋子"
        CHESSPIECE_ANCHOR = "怎么地上还有锚？",		-- 物品名:"锚棋子"
        CHESSPIECE_MOON = "看起来就像真的一样！",		-- 物品名:"\\“月亮\\” 棋子"
        CHESSPIECE_CARRAT = "哈哈，看起来很好吃",		-- 物品名:"胡萝卜鼠雕像"
        CHESSJUNK1 = "都坏了",		-- 物品名:"损坏的发条装置"
        CHESSJUNK2 = "不是我弄坏的！！",		-- 物品名:"损坏的发条装置"
        CHESSJUNK3 = "全弄乱了",		-- 物品名:"损坏的发条装置"
		CHESTER = "毛茸茸的大包裹，我喜欢你",		-- 物品名:"切斯特"
		CHESTER_EYEBONE =
		{
			GENERIC = "它在看着我！",		-- 物品名:"眼骨"->默认
			WAITING = "醒醒！",		-- 物品名:"眼骨"->需要等待
		},
		COOKEDMANDRAKE = "人参果不是娃娃脸嘛，这咋是个老头？",		-- 物品名:"烤曼德拉草"
		COOKEDMEAT = "仙女是不吃肉的",		-- 物品名:"烤大肉"
		COOKEDMONSTERMEAT = "我可不想让自己为难",		-- 物品名:"烤怪物肉"
		COOKEDSMALLMEAT = "我不吃",		-- 物品名:"烤小肉"
		COOKPOT =
		{
			COOKING_LONG = "美食需要等待……",		-- 物品名:"烹饪锅"->饭还需要很久 制造描述:"制作更好的食物"
			COOKING_SHORT = "很快就好了！再等等吧",		-- 物品名:"烹饪锅"->饭快做好了 制造描述:"制作更好的食物"
			DONE = "美味时间到！",		-- 物品名:"烹饪锅"->完成了 制造描述:"制作更好的食物"
			EMPTY = "希望里面有吃的",		-- 物品名:"烹饪锅" 制造描述:"制作更好的食物"
			BURNT = "哎呀……",		-- 物品名:"烹饪锅"->烧焦的 制造描述:"制作更好的食物"
		},
		CORN = "啃玉米棒子，嘎嘣脆的小吃",		-- 物品名:"玉米"
		CORN_COOKED = "爆开了！",		-- 物品名:"爆米花"
		CORN_SEEDS = "可以种出更多玉米！",		-- 物品名:"玉米种子"
        CANARY =
		{
			GENERIC = "小黄鸟",		-- 物品名:"金丝雀"->默认
			HELD = "抓到你了！",		-- 物品名:"金丝雀"->拿在手里
		},
        CANARY_POISONED = "它怎么了？",		-- 物品名:"金丝雀（有翅膀的动物）"
		CRITTERLAB = "看见里面有东西在动",		-- 物品名:"岩石巢穴"
        CRITTER_GLOMLING = "爱跳的好虫子",		-- 物品名:"小罗姆"
        CRITTER_DRAGONLING = "咱们好朋友要团结！",		-- 物品名:"蜂群卫士"
		CRITTER_LAMB = "别担心，我会保护你的！",		-- 物品名:"小钢羊"
        CRITTER_PUPPY = "想一起玩吗？",		-- 物品名:"小座狼"
        CRITTER_KITTEN = "……我猜你挺好的",		-- 物品名:"小浣猫"
        CRITTER_PERDLING = "你好，小鸟！",		-- 物品名:"小火鸡"
		CRITTER_LUNARMOTHLING = "我喜欢你",		-- 物品名:"小蛾子"
		CROW =
		{
			GENERIC = "一只黑色的鸟",		-- 物品名:"乌鸦"->默认
			HELD = "我会给你找个新家",		-- 物品名:"乌鸦"->拿在手里
		},
		CUTGRASS = "可以编制很多东西",		-- 物品名:"草"
		CUTREEDS = "泥塘里全是有用的东西",		-- 物品名:"采下的芦苇"
		CUTSTONE = "石头和碎石头",		-- 物品名:"石砖" 制造描述:"切成正方形的石头"
		DEADLYFEAST = "不应该吃那个",		-- 物品名:"致命的盛宴"->致命盛宴 单机
		DEER =
		{
			GENERIC = "你需要剪头发了",		-- 物品名:"无眼鹿"->默认
			ANTLER = "鹿角变尖了",		-- 物品名:"无眼鹿"
		},
        DEER_ANTLER = "鹿角！",		-- 物品名:"鹿角"
        DEER_GEMMED = "鹿的头不太对！",		-- 物品名:"无眼鹿"
		DEERCLOPS = "她看起来不开心",		-- 物品名:"独眼巨鹿"
		DEERCLOPS_EYEBALL = "喔，想摸摸",		-- 物品名:"独眼巨鹿眼球"
		EYEBRELLAHAT =	"它在看什么？",		-- 物品名:"眼球伞" 制造描述:"面向天空的眼球让你保持干燥"
		DEPLETED_GRASS =
		{
			GENERIC = "剩下了一点点草",		-- 物品名:"草"->默认
		},
        GOGGLESHAT = "我是走在时尚前沿的兔仙子",		-- 物品名:"时髦的护目镜" 制造描述:"你可以瞪大眼睛看装饰性护目镜"
        DESERTHAT = "讨厌沙漠，但是有了这个会好一点",		-- 物品名:"沙漠护目镜" 制造描述:"从你的眼睛里把沙子揉出来"
		DEVTOOL = "喜欢这个！",		-- 物品名:"开发工具"
		DEVTOOL_NODEV = "做不了",		-- 物品名:"草"
		DIRTPILE = "里面有人吗？",		-- 物品名:"可疑的土堆"
		DIVININGROD =
		{
			COLD = "现在声音小了",		-- 物品名:"冻伤"->冷了
			GENERIC = "上面这个奇怪的盒子是什么？",		-- 物品名:"探测杖"->默认 制造描述:"肯定有方法可以离开这里..."
			HOT = "它在向我喊叫！！",		-- 物品名:"中暑"->热了
			WARM = "声音越来越大了",		-- 物品名:"探测杖"->温暖 制造描述:"肯定有方法可以离开这里..."
			WARMER = "更大声了！",		-- 物品名:"探测杖" 制造描述:"肯定有方法可以离开这里..."
		},
		DIVININGRODBASE =
		{
			GENERIC = "这是什么？",		-- 物品名:"探测杖底座"->默认
			READY = "还缺点东西……",		-- 物品名:"探测杖底座"->准备好的 满的
			UNLOCKED = "我想这个现在可以用了！",		-- 物品名:"探测杖底座"->解锁了
		},
		DIVININGRODSTART = "这东西看起来很奇怪",		-- 物品名:"探测杖底座"->单机探测杖底座
		DRAGONFLY = "你的大眼睛可以制药吗？",		-- 物品名:"龙蝇"
		ARMORDRAGONFLY = "更多的鳞片！！",		-- 物品名:"鳞甲" 制造描述:"脾气火爆的盔甲"
		DRAGON_SCALES = "真漂亮……",		-- 物品名:"鳞片"
		DRAGONFLYCHEST = "喜欢这个箱子的样子",		-- 物品名:"巨鳞宝箱" 制造描述:"一种结实且防火的容器"
		DRAGONFLYFURNACE = 
		{
			HAMMERED = "弄坏了……",		-- 物品名:"龙鳞火炉"->被锤了 制造描述:"给自己建造一个苍蝇暖炉"
			GENERIC = "在旁边睡觉一定很暖和", --no gems		-- 物品名:"龙鳞火炉"->默认 制造描述:"给自己建造一个苍蝇暖炉"
			NORMAL = "面孔友善", --one gem		-- 物品名:"龙鳞火炉"->普通 制造描述:"给自己建造一个苍蝇暖炉"
			HIGH = "特！！好烫！！", --two gems		-- 物品名:"龙鳞火炉"->高 制造描述:"给自己建造一个苍蝇暖炉"
		},
        HUTCH = "小脸真可爱！！",		-- 物品名:"哈奇"
        HUTCH_FISHBOWL =
        {
            GENERIC = "你好鱼腥味的小家伙！",		-- 物品名:"星空"->默认
            WAITING = "在打盹？",		-- 物品名:"星空"->需要等待
        },
		LAVASPIT = 
		{
			HOT = "！发烫的石头！",		-- 物品名:"中暑"->热了
			COOL = "现在变成石头了",		-- 物品名:"龙蝇唾液"
		},
		LAVA_POND = "太烫不适合游泳",		-- 物品名:"岩浆池"
		LAVAE = "嗷，它只是个宝宝",		-- 物品名:"岩浆虫"
		LAVAE_COCOON = "午觉时间到！",		-- 物品名:"冷冻虫卵"
		LAVAE_PET = 
		{
			STARVING = "要尽快给你找点吃的！",		-- 物品名:"超级可爱岩浆虫"->挨饿
			HUNGRY = "需要小吃！",		-- 物品名:"超级可爱岩浆虫"->有点饿了
			CONTENT = "看起来很开心！",		-- 物品名:"超级可爱岩浆虫"->内容？？？、
			GENERIC = "她的拥抱很温暖",		-- 物品名:"超级可爱岩浆虫"->默认
		},
		LAVAE_EGG = 
		{
			GENERIC = "里面的东西在挠壳子",		-- 物品名:"岩浆虫卵"->默认
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "要抱抱吗？",		-- 物品名:"冻伤"->冷了
			COMFY = "里面好暖！",		-- 物品名:"岩浆虫卵"->舒服的
		},
		LAVAE_TOOTH = "宝宝的乳牙掉了",		-- 物品名:"岩浆虫尖牙"
		DRAGONFRUIT = "要吐籽吗？",		-- 物品名:"火龙果"
		DRAGONFRUIT_COOKED = "尝着像药",		-- 物品名:"烤火龙果"
		DRAGONFRUIT_SEEDS = "漂亮的水果籽",		-- 物品名:"火龙果种子"
		DRAGONPIE = "呣呣，这是最棒的饼！！",		-- 物品名:"火龙果派"
		DRUMSTICK = "真可怜",		-- 物品名:"鸟腿"
		DRUMSTICK_COOKED = "你把鸟放到火里？？",		-- 物品名:"炸鸟腿"
		DUG_BERRYBUSH = "你跟我来",		-- 物品名:"浆果丛"
		DUG_BERRYBUSH_JUICY = "带你回家",		-- 物品名:"多汁浆果丛"
		DUG_GRASS = "这个要放哪？",		-- 物品名:"草丛"
		DUG_MARSH_BUSH = "一点家的感觉",		-- 物品名:"尖刺灌木"
		DUG_SAPLING = "会给你找个好地方",		-- 物品名:"树苗"
		DURIAN = "呣……闻着像便便！",		-- 物品名:"榴莲"
		DURIAN_COOKED = "好难闻的臭味！",		-- 物品名:"超臭榴莲"
		DURIAN_SEEDS = "臭水果的臭籽！",		-- 物品名:"榴莲种子"
		EARMUFFSHAT = "可以不要抓他们嘛/(ㄒoㄒ)/~~",		-- 物品名:"兔耳罩" 制造描述:"毛茸茸的保暖物品"
		EGGPLANT = "又大又紫又好吃！",		-- 物品名:"茄子"
		EGGPLANT_COOKED = "烹调出了浓郁的紫色风味",		-- 物品名:"烤茄子"
		EGGPLANT_SEEDS = "长出更多的紫色蔬菜！",		-- 物品名:"茄子种子"
		ENDTABLE = 
		{
			BURNT = "玩火的女孩干的！",		-- 物品名:"茶几"->烧焦的 制造描述:"一张装饰桌"
			GENERIC = "桌上的花真难看",		-- 物品名:"茶几"->默认 制造描述:"一张装饰桌"
			EMPTY = "在这放鱼会比放花好看",		-- 物品名:"茶几" 制造描述:"一张装饰桌"
			WILTED = "鱼就不会像这样枯萎",		-- 物品名:"茶几"->枯萎的 制造描述:"一张装饰桌"
			FRESHLIGHT = "友好的小灯",		-- 物品名:"茶几"->茶几-新的发光的 制造描述:"一张装饰桌"
			OLDLIGHT = "需要一盏新灯", -- will be wilted soon, light radius will be very small at this point		-- 物品名:"茶几"->茶几-旧的发光的 制造描述:"一张装饰桌"
		},
		DECIDUOUSTREE = 
		{
			BURNING = "啊，好烫！！",		-- 物品名:"桦树"->正在燃烧
			BURNT = "再见了，小树",		-- 物品名:"桦树"->烧焦的
			CHOPPED = "砍成小碎片了！",		-- 物品名:"桦树"->被砍了
			POISON = "你在看什么？",		-- 物品名:"桦树"->毒化的
			GENERIC = "茁壮成长的小树",		-- 物品名:"桦树"->默认
		},
		ACORN = "小树苗！",		-- 物品名:"桦木果"
        ACORN_SAPLING = "快长大！",		-- 物品名:"桦树树苗"
		ACORN_COOKED = "好吃！",		-- 物品名:"烤桦木果"
		BIRCHNUTDRAKE = "哈哈！它真好玩！",		-- 物品名:"桦木果精"
		EVERGREEN =
		{
			BURNING = "应该先砍树再生营火的",		-- 物品名:"常青树"->正在燃烧
			BURNT = "再见了，小松树",		-- 物品名:"常青树"->烧焦的
			CHOPPED = "小松树块",		-- 物品名:"常青树"->被砍了
			GENERIC = "照顾植物我还是有点心得的",		-- 物品名:"常青树"->默认
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "应该先砍树再生营火的",		-- 物品名:"粗壮常青树"->正在燃烧
			BURNT = "再见了，小松树",		-- 物品名:"粗壮常青树"->烧焦的
			CHOPPED = "小松树块",		-- 物品名:"粗壮常青树"->被砍了
			GENERIC = "树看着很瘦，应该给它点吃的",		-- 物品名:"粗壮常青树"->默认
		},
		TWIGGYTREE = 
		{
			BURNING = "再见了，小树",		-- 物品名:"繁茂的树木"->正在燃烧
			BURNT = "烧得精光",		-- 物品名:"繁茂的树木"->烧焦的
			CHOPPED = "只剩一个矮树桩了",		-- 物品名:"繁茂的树木"->被砍了
			GENERIC = "小瘦树",					-- 物品名:"繁茂的树木"->默认
			DISEASED = "我觉得它应该是病了……",		-- 物品名:"繁茂的树木"->生病了
		},
		TWIGGY_NUT_SAPLING = "有一天会长大的！",		-- 物品名:"繁茂的树苗"
        TWIGGY_OLD = "它在森林里住了好久",		-- 物品名:"繁茂的树木"
		TWIGGY_NUT = "树宝宝",		-- 物品名:"繁茂的针叶树"->多枝树果
		EYEPLANT = "它在注视着周围",		-- 物品名:"眼球草"
		INSPECTSELF = "想看我扮鬼脸吗？",		-- 物品名:"繁茂的树木"->检查自己
		FARMPLOT =
		{
			GENERIC = "能种出自己的蔬菜？！",		-- 物品名:未找到
			GROWING = "成长中的小吃！",		-- 物品名:未找到
			NEEDSFERTILIZER = "放一些便便在上面！",		-- 物品名:未找到
			BURNT = "烧的太焦，不能种植",		-- 物品名:未找到
		},
		FEATHERHAT = "长的像鸟，想法也像鸟",		-- 物品名:"羽毛帽" 制造描述:"头上的装饰"
		FEATHER_CROW = "小黑鸟的羽毛",		-- 物品名:"黑色羽毛"
		FEATHER_ROBIN = "小红鸟的羽毛",		-- 物品名:"红色羽毛"
		FEATHER_ROBIN_WINTER = "小雪鸟的羽毛",		-- 物品名:"雪雀羽毛"
		FEATHER_CANARY = "小黄鸟的羽毛",		-- 物品名:"橙黄羽毛"
		FEATHERPENCIL = "精美书写的文具",		-- 物品名:"羽毛笔" 制造描述:"是的，羽毛是必须的"
		FEM_PUPPET = "你困住了吗？",		-- 物品名:未找到
		FIREFLIES =
		{
			GENERIC = "月光莹莹舞清河！",		-- 物品名:"萤火虫"->默认
			HELD = "不要钻到我怀里，哈哈！",		-- 物品名:"萤火虫"->拿在手里
		},
		FIREHOUND = "不喜欢那东西的样子",		-- 物品名:"火猎犬"
		FIREPIT =
		{
			EMBERS = "火要熄了",		-- 物品名:"石头营火"->即将熄灭 制造描述:"一种更安全、更高效的营火"
			GENERIC = "我们来围着营火讲故事吧，",		-- 物品名:"石头营火"->默认 制造描述:"一种更安全、更高效的营火"
			HIGH = "大火！",		-- 物品名:"石头营火"->高 制造描述:"一种更安全、更高效的营火"
			LOW = "火变小了",		-- 物品名:"石头营火"->低？ 制造描述:"一种更安全、更高效的营火"
			NORMAL = "舒服啊",		-- 物品名:"石头营火"->普通 制造描述:"一种更安全、更高效的营火"
			OUT = "一会可以再生点火！",		-- 物品名:"石头营火"->出去？外面？ 制造描述:"一种更安全、更高效的营火"
		},
		COLDFIREPIT =
		{
			EMBERS = "火要熄了",		-- 物品名:"石头冰火"->即将熄灭 制造描述:"燃烧效率更高，但仍然越烤越冷"
			GENERIC = "我们来围着营火讲故事吧，",		-- 物品名:"石头冰火"->默认 制造描述:"燃烧效率更高，但仍然越烤越冷"
			HIGH = "大火！",		-- 物品名:"石头冰火"->高 制造描述:"燃烧效率更高，但仍然越烤越冷"
			LOW = "火变小了",		-- 物品名:"石头冰火"->低？ 制造描述:"燃烧效率更高，但仍然越烤越冷"
			NORMAL = "冰凉的火？",		-- 物品名:"石头冰火"->普通 制造描述:"燃烧效率更高，但仍然越烤越冷"
			OUT = "一会可以再生点火！",		-- 物品名:"石头冰火"->出去？外面？ 制造描述:"燃烧效率更高，但仍然越烤越冷"
		},
		FIRESTAFF = "火德真君的法宝吗！",		-- 物品名:"火魔杖" 制造描述:"利用火焰的力量！"
		FIRESUPPRESSOR = 
		{	
			ON = "好机器！",		-- 物品名:"雪球发射器"->开启 制造描述:"拯救植物，扑灭火焰，可添加燃料"
			OFF = "它在睡觉",		-- 物品名:"雪球发射器"->关闭 制造描述:"拯救植物，扑灭火焰，可添加燃料"
			LOWFUEL = "它需要一些燃料",		-- 物品名:"雪球发射器"->燃料不足 制造描述:"拯救植物，扑灭火焰，可添加燃料"
		},
		FISH = "啊，太可爱了！",		-- 物品名:"鱼"
		FISHINGROD = "抓住，鱼！",		-- 物品名:"钓竿" 制造描述:"去钓鱼为了鱼"
		FISHSTICKS = "为什么要这样对鱼？！",		-- 物品名:"炸鱼排"
		FISHTACOS = "鱼在那里不开心……",		-- 物品名:"鱼肉玉米卷"
		FISH_COOKED = "鱼是朋友，不是食物！",		-- 物品名:"烤鱼"
		FLINT = "好尖！",		-- 物品名:"燧石"
		FLOWER = 
		{
            GENERIC = "手种秋风碧玉成，花开如粟水惊沉",		-- 物品名:"花"->默认
            ROSE = "小槛锁玫瑰，群芳次第催",		-- 物品名:"花"->玫瑰
        },
        FLOWER_WITHERED = "枯萎衰败",		-- 物品名:"枯萎的花"
		FLOWERHAT = "花瓣保护着我的心神！",		-- 物品名:"花环" 制造描述:"放松神经的东西"
		FLOWER_EVIL = "充斥者邪恶",		-- 物品名:"邪恶花"
		FOLIAGE = "紫色是最美味的颜色",		-- 物品名:"蕨叶"
		FOOTBALLHAT = "要和我一起打橄榄球嘛！",		-- 物品名:"橄榄球头盔" 制造描述:"保护你的脑壳"
        FOSSIL_PIECE = "阴森的骨头",		-- 物品名:"化石碎片"
        FOSSIL_STALKER =
        {
			GENERIC = "需要多几块阴森的骨头",		-- 物品名:"化石骨架"->默认
			FUNNY = "他原本就长这样吗？",		-- 物品名:"化石骨架"->趣味？？
			COMPLETE = "……我们为什么又做一遍？",		-- 物品名:"化石骨架"->准备好了
        },
        STALKER = "受到过暗影魔法！",		-- 物品名:"复活的骨架"
        STALKER_ATRIUM = "它是真的！",		-- 物品名:"远古织影者"
        STALKER_MINION = "爬行的小家伙！",		-- 物品名:"编织暗影"
        THURIBLE = "古怪的香炉",		-- 物品名:"影子香炉"
        ATRIUM_OVERGROWTH = "奇怪的字母让我头疼……",		-- 物品名:"古代的方尖碑"
		FROG =
		{
			DEAD = "它去了天上的大沼泽吗",		-- 物品名:"青蛙"->死了
			GENERIC = "你好吗？",		-- 物品名:"青蛙"->默认
			SLEEPING = "安安，小青蛙",		-- 物品名:"青蛙"->睡着了
		},
		FROGGLEBUNWICH = "这是三明治真糟",		-- 物品名:"蛙腿三明治"
		FROGLEGS = "可怜的小青蛙……",		-- 物品名:"蛙腿"
		FROGLEGS_COOKED = "不忍直视",		-- 物品名:"烤蛙腿"
		FRUITMEDLEY = "水果琵琶……饼干……拼盘盘？",		-- 物品名:"水果圣代"
		FURTUFT = "闻起来怪怪的", 		-- 物品名:"毛丛"
		GEARS = "铁人的内脏",		-- 物品名:"齿轮"
		GHOST = "走开！",		-- 物品名:"幽灵"
		GOLDENAXE = "黄金十分坚硬",		-- 物品名:"黄金斧头" 制造描述:"砍树也要有调！"
		GOLDENPICKAXE = "比普通砸石头的工具更结实",		-- 物品名:"黄金鹤嘴锄" 制造描述:"像大Boss一样砸碎岩石"
		GOLDENPITCHFORK = "高级农业工具",		-- 物品名:"黄金干草叉" 制造描述:"重新布置整个世界"
		GOLDENSHOVEL = "挖土的高级工具",		-- 物品名:"黄金铲子" 制造描述:"挖掘作用相同，但使用寿命更长"
		GOLDNUGGET = "金光闪闪的金子哎！",		-- 物品名:"金块"
		GRASS =
		{
			BARREN = "需要更多的便便",		-- 物品名:"草"
			WITHERED = "它太热了",		-- 物品名:"草"->枯萎了
			BURNING = "火焰！！",		-- 物品名:"草"->正在燃烧
			GENERIC = "几根草",		-- 物品名:"草"->默认
			PICKED = "还没长回来",		-- 物品名:"草"->被采完了
			DISEASED = "它生病了，但我会治好它",		-- 物品名:"草"->生病了
			DISEASING = "它有点问题",		-- 物品名:"草"->正在生病？？
		},
		GRASSGEKKO = 
		{
			GENERIC = "应该偷偷接近它",			-- 物品名:"草地壁虎"->默认
			DISEASED = "草蜥蜴出问题了",		-- 物品名:"草地壁虎"->生病了
		},
		GREEN_CAP = "颜色很漂亮，应该很好吃",		-- 物品名:"采摘的绿蘑菇"
		GREEN_CAP_COOKED = "现在气味不一样了",		-- 物品名:"烤绿蘑菇"
		GREEN_MUSHROOM =
		{
			GENERIC = "会致幻的毒蘑菇",		-- 物品名:"绿蘑菇"->默认
			INGROUND = "它藏起来了",		-- 物品名:"绿蘑菇"->在地里面
			PICKED = "都是我的！",		-- 物品名:"绿蘑菇"->被采完了
		},
		GUNPOWDER = "爆炸粉末",		-- 物品名:"火药" 制造描述:"一把火药"
		HAMBAT = "比我的捣药杵还大",		-- 物品名:"火腿棒" 制造描述:"舍不得火腿套不着狼"
		HAMMER = "打破一切！",		-- 物品名:"锤子" 制造描述:"敲碎各种东西"
		HEALINGSALVE = "冰冰凉凉的",		-- 物品名:"治疗药膏" 制造描述:"对割伤和擦伤进行消毒杀菌"
		HEATROCK =
		{
			FROZEN = "冰凉",		-- 物品名:"暖石"->冰冻 制造描述:"储存热能供旅行途中使用"
			COLD = "啵……冰冷",		-- 物品名:"冻伤"->冷了
			GENERIC = "满载着能量！",		-- 物品名:"暖石"->默认 制造描述:"储存热能供旅行途中使用"
			WARM = "暖暖的",		-- 物品名:"暖石"->温暖 制造描述:"储存热能供旅行途中使用"
			HOT = "灼热的石头！",		-- 物品名:"中暑"->热了
		},
		HOME = "那里有人在吗？",		-- 物品名:"暖石"->没调用 制造描述:"储存热能供旅行途中使用"
		HOMESIGN =
		{
			GENERIC = "它说什么？",		-- 物品名:"路牌"->默认 制造描述:"在世界中留下你的标记"
            UNWRITTEN = "什么也没有",		-- 物品名:"路牌"->没有写字 制造描述:"在世界中留下你的标记"
			BURNT = "嗷好吧",		-- 物品名:"路牌"->烧焦的 制造描述:"在世界中留下你的标记"
		},
		ARROWSIGN_POST =
		{
			GENERIC = "它说什么？",		-- 物品名:"指路标志"->默认 制造描述:"对这个世界指指点点或许只是打下手势"
            UNWRITTEN = "什么都没！",		-- 物品名:"指路标志"->没有写字 制造描述:"对这个世界指指点点或许只是打下手势"
			BURNT = "烧烤的香味",		-- 物品名:"指路标志"->烧焦的 制造描述:"对这个世界指指点点或许只是打下手势"
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "它说什么？",		-- 物品名:"指路标志"->默认
            UNWRITTEN = "什么都没！",		-- 物品名:"指路标志"->没有写字
			BURNT = "死了",		-- 物品名:"指路标志"->烧焦的
		},
		HONEY = "你好我的蜜糖！",		-- 物品名:"蜂蜜"
		HONEYCOMB = "从蜜蜂那里偷的！",		-- 物品名:"蜂巢"
		HONEYHAM = "猪肉毁了蜂蜜！！",		-- 物品名:"蜜汁火腿"
		HONEYNUGGETS = "浪费蜂蜜！",		-- 物品名:"蜜汁卤肉"
		HORN = "嘟嘟！",		-- 物品名:"牛角"
		HOUND = "坏狗狗！找打",		-- 物品名:"猎犬"
		HOUNDCORPSE =
		{
			GENERIC = "奇怪的狗",		-- 物品名:"猎犬"->默认
			BURNING = "好臭",		-- 物品名:"猎犬"->正在燃烧
			REVIVING = "它正在回来！",		-- 物品名:"猎犬"
		},
		HOUNDBONE = "刺人",		-- 物品名:"犬骨"
		HOUNDMOUND = "找到了狗窝",		-- 物品名:"猎犬丘"
		ICEBOX = "冰凉的箱子",		-- 物品名:"冰箱" 制造描述:"延缓食物变质"
		ICEHAT = "一顶非常好的帽子",		-- 物品名:"冰帽" 制造描述:"用科学技术合成的冰帽"
		ICEHOUND = "冰凉的狗狗",		-- 物品名:"冰猎犬"
		INSANITYROCK =
		{
			ACTIVE = "这是哪儿来的……？",		-- 物品名:"方尖碑"->激活了
			INACTIVE = "会耍花样的石头……",		-- 物品名:"方尖碑"->没有激活
		},
		JAMMYPRESERVES = "我的手爪都弄粘了",		-- 物品名:"果酱"
		KABOBS = "恶心的肉块",		-- 物品名:"肉串"
		KILLERBEE =
		{
			GENERIC = "看起来很生气",		-- 物品名:"杀人蜂"->默认
			HELD = "嗡嗡叫真好听……",		-- 物品名:"杀人蜂"->拿在手里
		},
		KNIGHT = "弹簧铁人",		-- 物品名:"发条骑士"
		KOALEFANT_SUMMER = "你的眼睛真大！",		-- 物品名:"大象"
		KOALEFANT_WINTER = "你的眼睛真大！",		-- 物品名:"大象"
		KRAMPUS = "大坏蛋！！",		-- 物品名:"坎普斯"
		KRAMPUS_SACK = "它叮当响！",		-- 物品名:"坎普斯背包"
		LEIF = "树怪精怪！",		-- 物品名:"树精守卫"
		LEIF_SPARSE = "树怪！！",		-- 物品名:"树精守卫"
		LIGHTER  = "这个对火焰女士有特别意义",		-- 物品名:"薇洛的打火机" 制造描述:"火焰在雨中彻夜燃烧"
		LIGHTNING_ROD =
		{
			CHARGED = "它在滋滋响!",		-- 物品名:"避雷针" 制造描述:"防雷劈"
			GENERIC = "蔽灾神物？",		-- 物品名:"避雷针"->默认 制造描述:"防雷劈"
		},
		LIGHTNINGGOAT = 
		{
			GENERIC = "卷毛！",		-- 物品名:"闪电羊"->默认
			CHARGED = "快跑啊！",		-- 物品名:"闪电羊"
		},
		LIGHTNINGGOATHORN = "有裂缝！",		-- 物品名:"闪电羊角"
		GOATMILK = "酥酥麻麻的奶",		-- 物品名:"带电的羊奶"
		LITTLE_WALRUS = "你好！想玩吗？",		-- 物品名:"小海象人"
		LIVINGLOG = "感觉有点不好……",		-- 物品名:"活木头" 制造描述:"用你的身体来代替\n你该干的活吧"
		LOG =
		{
			BURNING = "营火！",		-- 物品名:"木头"->正在燃烧
			GENERIC = "我们搭个营火？",		-- 物品名:"木头"->默认
		},
		LUCY = "你是伐木先生的朋友吗？",		-- 物品名:"露西斧"
		LUREPLANT = "为什么那颗植物上有块肉？？",		-- 物品名:"食人花"
		LUREPLANTBULB = "讨厌的植物",		-- 物品名:"食人花种子"
		MALE_PUPPET = "它看起来卡住了！",		-- 物品名:"木头"
		MANDRAKE_ACTIVE = "咦！它在跟着我！",		-- 物品名:"曼德拉草"
		MANDRAKE_PLANTED = "据说要晚上才能摘",		-- 物品名:"曼德拉草"
		MANDRAKE = "不动了",		-- 物品名:"曼德拉草"
        MANDRAKESOUP = "蔬菜小兄弟做汤很好喝",		-- 物品名:"曼德拉草汤"
        MANDRAKE_COOKED = "夜宵",		-- 物品名:"木头"
        MAPSCROLL = "图片在哪？",		-- 物品名:"地图" 制造描述:"向别人展示你看到什么！"
        MARBLE = "大石块",		-- 物品名:"大理石"
        MARBLEBEAN = "辣！它蹦叫掉我的家牙啦……",		-- 物品名:"大理石豌豆" 制造描述:"种植一片大理石森林"
        MARBLEBEAN_SAPLING = "那块石头在变大吗？",		-- 物品名:"大理石芽"
        MARBLESHRUB = "石头灌木",		-- 物品名:"大理石灌木"
        MARBLEPILLAR = "它看起来很旧",		-- 物品名:"大理石柱"
        MARBLETREE = "伐木先生，来砍砍这棵树！哈哈……",		-- 物品名:"大理石树"
        MARSH_BUSH =
        {
			BURNT = "烧毁了",		-- 物品名:"尖刺灌木"->烧焦的
            BURNING = "火！火！",		-- 物品名:"尖刺灌木"->正在燃烧
            GENERIC = "沼泽里很多这些东西",		-- 物品名:"尖刺灌木"->默认
            PICKED = "疼！",		-- 物品名:"尖刺灌木"->被采完了
        },
        BURNT_MARSH_BUSH = "好悲伤……",		-- 物品名:"尖刺灌木"
        MARSH_PLANT = "沼泽植物",		-- 物品名:"池塘边植物"
        MARSH_TREE =
        {
            BURNING = "不是我干的！！",		-- 物品名:"针刺树"->正在燃烧
            BURNT = "烧毁了",		-- 物品名:"针刺树"->烧焦的
            CHOPPED = "砍光了！",		-- 物品名:"针刺树"->被砍了
            GENERIC = "不应该在这附近玩",		-- 物品名:"针刺树"->默认
        },
        MAXWELL = "他好像不是很友好",		-- 物品名:"麦斯威尔"->单机 麦斯威尔
        MAXWELLHEAD = "头真大！",		-- 物品名:"麦斯威尔的头"->单机 麦斯威尔的头
        MAXWELLLIGHT = "不喜欢它……",		-- 物品名:"麦斯威尔灯"->单机 麦斯威尔的灯
        MAXWELLLOCK = "需要钥匙？",		-- 物品名:"噩梦锁"->单机 麦斯威尔的噩梦锁
        MAXWELLTHRONE = "不该出现在这……",		-- 物品名:"噩梦王座"->单机 麦斯威尔的噩梦王座
        MEAT = "肉？仙女是不会碰这种东西的",		-- 物品名:"肉"
        MEATBALLS = "辣……一颗颗真恶心",		-- 物品名:"肉丸"
        MEATRACK =
        {
            DONE = "，不要碰那个",		-- 物品名:"晾肉架"->完成了 制造描述:"晾肉的架子"
            DRYING = "好臭",		-- 物品名:"晾肉架"->正在风干 制造描述:"晾肉的架子"
            DRYINGINRAIN = "这么做没想清楚吧",		-- 物品名:"晾肉架"->雨天风干 制造描述:"晾肉的架子"
            GENERIC = "他用这个来做恶心的食物",		-- 物品名:"晾肉架"->默认 制造描述:"晾肉的架子"
            BURNT = "哎好吧",		-- 物品名:"晾肉架"->烧焦的 制造描述:"晾肉的架子"
            DONE_NOTMEAT = "比平时还难看",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子"
            DRYING_NOTMEAT = "那个看着不对",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子"
            DRYINGINRAIN_NOTMEAT = "据说这个能把东西晾干？",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子"
        },
        MEAT_DRIED = "好难闻",		-- 物品名:"风干肉"
        MERM = "你好!",		-- 物品名:"鱼人"
        MERMHEAD =
        {
            GENERIC = "谁会干这种事……",		-- 物品名:"鱼头"->默认
            BURNT = "好好埋葬吧",		-- 物品名:"鱼头"->烧焦的
        },
        MERMHOUSE =
        {
            GENERIC = "沼泽在哪，就有小屋",		-- 物品名:"漏雨的小屋"->默认
            BURNT = "不不不！！",		-- 物品名:"漏雨的小屋"->烧焦的
        },
        MINERHAT = "有趣的头灯",		-- 物品名:"矿工帽" 制造描述:"用你脑袋上的灯照亮夜晚"
        MONKEY = "嘿嘿，好玩的猴子",		-- 物品名:"暴躁猴"
        MONKEYBARREL = "脸看起来还算友好",		-- 物品名:"猴子桶"
        MONSTERLASAGNA = "里面……有什么？",		-- 物品名:"怪物千层饼"
        FLOWERSALAD = "看起来不怎么样，但尝起来还不错",		-- 物品名:"花沙拉"
        ICECREAM = "冷的甜点！",		-- 物品名:"冰淇淋"
        WATERMELONICLE = "冰冻西瓜！",		-- 物品名:"西瓜冰棍"
        TRAILMIX = "嘎嘣，嘎嘣，嘎嘣脆！",		-- 物品名:"什锦干果"
        HOTCHILI = "不想要！",		-- 物品名:"辣椒炖肉"
        GUACAMOLE = "好吃的绿色糊糊！",		-- 物品名:"鳄梨酱"
        MONSTERMEAT = "宁可捣药也不要碰这种东西",		-- 物品名:"怪物肉"
        MONSTERMEAT_DRIED = "现在更难闻了！",		-- 物品名:"怪物肉干"
        MOOSE = "这就是薇克女士说的 \"鹅妈妈\"？",		-- 物品名:"漏雨的小屋"
        MOOSE_NESTING_GROUND = "这就是她养宝宝的地方",		-- 物品名:"漏雨的小屋"
        MOOSEEGG = "能打开看看里面是什么吗？",		-- 物品名:"漏雨的小屋"
        MOSSLING = "嘿嘿，好玩的一摇一摆的家伙",		-- 物品名:"驼鹿鹅幼崽"
        FEATHERFAN = "这是什么鸟身上下来的？！",		-- 物品名:"羽毛扇" 制造描述:"超柔软、超大的扇子"
        MINIFAN = "嘿嘿嘿！",		-- 物品名:"旋转的风扇" 制造描述:"你得跑起来，才能带来风！"
        GOOSE_FEATHER = "呼呼呼~看大风！",		-- 物品名:"鹿鸭羽毛"
        STAFF_TORNADO = "能让风转起来！",		-- 物品名:"天气风向标" 制造描述:"把你的敌人吹走"
        MOSQUITO =
        {
            GENERIC = "应该不会喜欢我的血吧！",		-- 物品名:"蚊子"->默认
            HELD = "抓到你了，讨厌的叮人虫！",		-- 物品名:"蚊子"->拿在手里
        },
        MOSQUITOSACK = "血腥味好重",		-- 物品名:"蚊子血囊"
        MOUND =
        {
            DUG = "有人在这留下一堆骨头",		-- 物品名:"坟墓"->被挖了
            GENERIC = "逝者安息？",		-- 物品名:"坟墓"->默认
        },
        NIGHTLIGHT = "古怪的光",		-- 物品名:"魂灯" 制造描述:"用你的噩梦点亮夜晚"
        NIGHTMAREFUEL = "残忍积蓄着噩梦！",		-- 物品名:"噩梦燃料" 制造描述:"傻子和疯子使用的邪恶残渣"
        NIGHTSWORD = "噩梦入体",		-- 物品名:"暗夜剑" 制造描述:"造成噩梦般的伤害"
        NITRE = "有趣的石头",		-- 物品名:"硝石"
        ONEMANBAND = "咚！咚！锵！",		-- 物品名:"独奏乐器" 制造描述:"疯子音乐家也有粉丝"
        OASISLAKE =
		{
			GENERIC = "水！！",		-- 物品名:"湖泊"->默认
			EMPTY = "不！水去哪了？！",		-- 物品名:"湖泊"
		},
        PANDORASCHEST = "箱子里装的是什么？",		-- 物品名:"华丽箱子"
        PANFLUTE = "且听一曲",		-- 物品名:"排箫" 制造描述:"抚慰凶猛野兽的音乐"
        PAPYRUS = "多编点故事",		-- 物品名:"莎草纸" 制造描述:"用于书写"
        WAXPAPER = "这张纸上面没画图！",		-- 物品名:"蜡纸" 制造描述:"用于打包东西"
        PENGUIN = "他们是聪明的鸟，宁愿游泳也不飞",		-- 物品名:"企鹅"
        PERD = "走开，咯咯叫的鸟！",		-- 物品名:"火鸡"
        PEROGIES = "里面藏了肉？？",		-- 物品名:"波兰水饺"
        PETALS = "嘿嘿，接招，小花！",		-- 物品名:"花瓣"
        PETALS_EVIL = "不想拿这些",		-- 物品名:"恶魔花瓣"
        PHLEGM = "我吃过比这还差的",		-- 物品名:"脓鼻涕"
        PICKAXE = "凿石头的工具",		-- 物品名:"鹤嘴锄" 制造描述:"凿碎岩石"
        PIGGYBACK = "脏猪皮做的包",		-- 物品名:"猪皮包" 制造描述:"能装许多东西，但会减慢你的速度"
        PIGHEAD =
        {
            GENERIC = "哈哈！",		-- 物品名:"猪头"->默认
            BURNT = "香脆猪！罪有应得",		-- 物品名:"猪头"->烧焦的
        },
        PIGHOUSE =
        {
            FULL = "那房里全是肮脏的猪人！",		-- 物品名:"猪屋"->满了 制造描述:"可以住一只猪"
            GENERIC = "闻闻……闻着像……猪人！",		-- 物品名:"猪屋"->默认 制造描述:"可以住一只猪"
            LIGHTSOUT = "环境安全",		-- 物品名:"猪屋"->关灯了 制造描述:"可以住一只猪"
            BURNT = "嘿嘿，猪人屋全烧了！",		-- 物品名:"猪屋"->烧焦的 制造描述:"可以住一只猪"
        },
        PIGKING = "肥头大耳的没一个好货！",		-- 物品名:"猪王"
        PIGMAN =
        {
            DEAD = "你活该",		-- 物品名:"猪人"->死了
            FOLLOWER = "离远点！",		-- 物品名:"猪人"->追随者
            GENERIC = "猪人……",		-- 物品名:"猪人"->默认
            GUARD = "他比其他人更吓人",		-- 物品名:"猪人"->警戒
            WEREPIG = "离我远一点！！",		-- 物品名:"猪人"->疯猪
        },
        PIGSKIN = "从脏猪那抢来的！！",		-- 物品名:"猪皮"
        PIGTENT = "那里面有猪人？",		-- 物品名:"猪人"
        PIGTORCH = "火！",		-- 物品名:"猪火炬"
        PINECONE = "不适合吃",		-- 物品名:"松果"
        PINECONE_SAPLING = "树宝宝",		-- 物品名:"常青树苗"
        LUMPY_SAPLING = "它在竭尽全力了",		-- 物品名:"有疙瘩的树苗"
        PITCHFORK = "会戳到人的工具",		-- 物品名:"干草叉" 制造描述:"铲地用具"
        PLANTMEAT = "感觉……困惑……",		-- 物品名:"叶子肉"
        PLANTMEAT_COOKED = "还是不会吃的",		-- 物品名:"烤叶子肉"
        PLANT_NORMAL =
        {
            GENERIC = "多叶的绿植！",		-- 物品名:"农作物"->默认
            GROWING = "马上就好了吗？",		-- 物品名:"农作物"->正在生长
            READY = "为我准备的肌肉！",		-- 物品名:"农作物"->准备好的 满的
            WITHERED = "植物需要喝水？",		-- 物品名:"农作物"->枯萎了
        },
        POMEGRANATE = "噢，不是直接咬的吗？",		-- 物品名:"石榴"
        POMEGRANATE_COOKED = "呣……好吧……",		-- 物品名:"切片熟石榴"
        POMEGRANATE_SEEDS = "能种出更多的石榴！",		-- 物品名:"石榴种子"
        POND = "水花四溅！",		-- 物品名:"池塘"
        POOP = "要想培育好的药草，肥料可少不了",		-- 物品名:"肥料"
        FERTILIZER = "什么？就是些便便",		-- 物品名:"便便桶" 制造描述:"少拉点在手上，多拉点在庄稼上"
        PUMPKIN = "一大块的好东西！",		-- 物品名:"南瓜"
        PUMPKINCOOKIE = "这是最棒的南瓜",		-- 物品名:"南瓜饼"
        PUMPKIN_COOKED = "黏糊糊！",		-- 物品名:"烤南瓜"
        PUMPKIN_LANTERN = "一张友好的脸",		-- 物品名:"南瓜灯" 制造描述:"长着鬼脸的照明用具"
        PUMPKIN_SEEDS = "能种出更多的南瓜！",		-- 物品名:"南瓜种子"
        PURPLEAMULET = "不想玩这个了",		-- 物品名:"噩梦护符" 制造描述:"引起精神错乱"
        PURPLEGEM = "真漂亮……",		-- 物品名:"紫宝石" 制造描述:"由两种颜色的宝石合成！"
        RABBIT =
        {
            GENERIC = "别怕，我会保护你",		-- 物品名:"兔子"->默认
            HELD = "我这里有胡萝卜，你要不要？",		-- 物品名:"兔子"->拿在手里
        },
        RABBITHOLE =
        {
            GENERIC = "嘿嘿，借我一点东西，不会还的那种",		-- 物品名:"兔洞"->默认
            SPRING = "有人在家吗？",		-- 物品名:"兔洞"->春天 or 潮湿
        },
        RAINOMETER =
        {
            GENERIC = "希望下点雨！",		-- 物品名:"雨量计"->默认 制造描述:"观测降雨机率"
            BURNT = "嗷好吧",		-- 物品名:"雨量计"->烧焦的 制造描述:"观测降雨机率"
        },
        RAINCOAT = "穿着雨衣再雨里面散步",		-- 物品名:"雨衣" 制造描述:"让你保持干燥的防水外套"
        RAINHAT = "雨没什么好怕的！",		-- 物品名:"防雨帽" 制造描述:"手感柔软，防雨必备"
        RATATOUILLE = "这是最棒的！！",		-- 物品名:"蔬菜大杂烩"
        RAZOR = "切割用的？",		-- 物品名:"剃刀" 制造描述:"剃掉你脏脏的山羊胡子"
        REDGEM = "既漂亮又温暖",		-- 物品名:"红宝石"
        RED_CAP = "这些对你有坏处",		-- 物品名:"采摘的红蘑菇"
        RED_CAP_COOKED = "稍微好点……",		-- 物品名:"烤红蘑菇"
        RED_MUSHROOM =
        {
            GENERIC = "你好蘑菇！",		-- 物品名:"红蘑菇"->默认
            INGROUND = "出来！",		-- 物品名:"红蘑菇"->在地里面
            PICKED = "什么都没剩",		-- 物品名:"红蘑菇"->被采完了
        },
        REEDS =
        {
            BURNING = "沼泽在燃烧！",		-- 物品名:"芦苇"->正在燃烧
            GENERIC = "沼泽里很多这种东西！",		-- 物品名:"芦苇"->默认
            PICKED = "要多找点",		-- 物品名:"芦苇"->被采完了
        },
        RELIC = "旧东西",		-- 物品名:"废墟"
        RUINS_RUBBLE = "石头之类的东西",		-- 物品名:"损毁的废墟"
        RUBBLE = "石头之类的东西",		-- 物品名:"碎石"
        RESEARCHLAB =
        {
            GENERIC = "让你了解更多知识 ",		-- 物品名:"科学机器"->默认 制造描述:"解锁新的合成配方！"
            BURNT = "好吧",		-- 物品名:"科学机器"->烧焦的 制造描述:"解锁新的合成配方！"
        },
        RESEARCHLAB2 =
        {
            GENERIC = "炼金术……我可是会点石成金的法术",		-- 物品名:"炼金引擎"->默认 制造描述:"解锁更多合成配方！"
            BURNT = "好，它没了",		-- 物品名:"炼金引擎"->烧焦的 制造描述:"解锁更多合成配方！"
        },
        RESEARCHLAB3 =
        {
            GENERIC = "不应该摆弄那个",		-- 物品名:"暗影操控器"->默认 制造描述:"这还是科学吗？"
            BURNT = "烧了挺好的",		-- 物品名:"暗影操控器"->烧焦的 制造描述:"这还是科学吗？"
        },
        RESEARCHLAB4 =
        {
            GENERIC = "我猜你都是刚刚才编的",		-- 物品名:"灵子分解器"->默认 制造描述:"增强高礼帽的魔力"
            BURNT = "奇怪的帽子机器烧掉了",		-- 物品名:"灵子分解器"->烧焦的 制造描述:"增强高礼帽的魔力"
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "替身娃娃？",		-- 物品名:"替身人偶"->默认 制造描述:"以肉的力量让你重生"
            BURNT = "它真难闻",		-- 物品名:"替身人偶"->烧焦的 制造描述:"以肉的力量让你重生"
        },
        RESURRECTIONSTONE = "这种强大的力量！",		-- 物品名:"复活石"
        ROBIN =
        {
            GENERIC = "红色真喜庆",		-- 物品名:"红雀"->默认
            HELD = "我的小鸟！",		-- 物品名:"红雀"->拿在手里
        },
        ROBIN_WINTER =
        {
            GENERIC = "小雪鸟，到我怀里来",		-- 物品名:"雪雀"->默认
            HELD = "它喜欢当宠物",		-- 物品名:"雪雀"->拿在手里
        },
        ROBOT_PUPPET = "你困住了吗？",		-- 物品名:"雪雀"
        ROCK_LIGHT =
        {
            GENERIC = "不喜欢它",		-- 物品名:"熔岩坑"->默认
            OUT = "呣",		-- 物品名:"熔岩坑"->出去？外面？
            LOW = "变成石头了",		-- 物品名:"熔岩坑"->低？
            NORMAL = "发着光！",		-- 物品名:"熔岩坑"->普通
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "好大一块石头……",		-- 物品名:"岩石"->默认
            RAISED = "够不着！",		-- 物品名:"岩石"->提高了？
        },
        ROCK = "只是块石头",		-- 物品名:"岩石"
        PETRIFIED_TREE = "这是树形状的石头？",		-- 物品名:"岩石"
        ROCK_PETRIFIED_TREE = "这是树形状的石头？",		-- 物品名:"石化树"
        ROCK_PETRIFIED_TREE_OLD = "这是树形状的石头？",		-- 物品名:"岩石"
        ROCK_ICE =
        {
            GENERIC = "啵，放在毛上好冰！",		-- 物品名:"迷你冰山"->默认
            MELTED = "泥泞的水坑",		-- 物品名:"迷你冰山"->融化了
        },
        ROCK_ICE_MELTED = "泥泞的水坑",		-- 物品名:"融化的冰矿"
        ICE = "呼呼...好冰",		-- 物品名:"冰"
        ROCKS = "一堆石头",		-- 物品名:"石头"
        ROOK = "看起来很凶……",		-- 物品名:"发条战车"
        ROPE = "捆绑用的",		-- 物品名:"绳子" 制造描述:"紧密编成的草绳，非常有用"
        ROTTENEGG = "有股好闻的臭味",		-- 物品名:"腐烂鸟蛋"
        ROYAL_JELLY = "呣呣呣！",		-- 物品名:"蜂王浆"
        JELLYBEAN = "好豆子",		-- 物品名:"彩虹糖豆"
        SADDLE_BASIC = "嘿嘿，上面有小角！",		-- 物品名:"鞍具" 制造描述:"你坐在动物身上仅仅是理论上"
        SADDLE_RACE = "蝴蝶总算有点用了！",		-- 物品名:"轻鞍具" 制造描述:"抵消掉完成目标所花费的时间或许"
        SADDLE_WAR = "我要为兔仙人的荣誉而战！",		-- 物品名:"战争鞍具" 制造描述:"战场首领的王位"
        SADDLEHORN = "从毛绒绒的大家伙身上卸下鞍的工具",		-- 物品名:"鞍角" 制造描述:"把鞍具撬开"
        SALTLICK = "你什么意思，\"牦牛专用\"？",		-- 物品名:"舔舔盐块" 制造描述:"好好喂养你家的牲畜"
        BRUSH = "毛发真奇怪",		-- 物品名:"刷子" 制造描述:"减缓牦牛毛发的生长速度"
		SANITYROCK =
		{
			ACTIVE = "走开！",		-- 物品名:"方尖碑"->激活了
			INACTIVE = "也许只是我的想象……",		-- 物品名:"方尖碑"->没有激活
		},
		SAPLING =
		{
			BURNING = "火焰！",		-- 物品名:"树苗"->正在燃烧
			WITHERED = "太干燥",		-- 物品名:"树苗"->枯萎了
			GENERIC = "小树！给我一点枝条",		-- 物品名:"树苗"->默认
			PICKED = "拿走了！",		-- 物品名:"树苗"->被采完了
			DISEASED = "嗯...看起来很糟",		-- 物品名:"树苗"->生病了
			DISEASING = "它不对劲",		-- 物品名:"树苗"->正在生病？？
		},
   		SCARECROW = 
   		{
			GENERIC = "非常喜欢他!",		-- 物品名:"友善的稻草人"->默认 制造描述:"模仿最新的秋季时尚"
			BURNING = "不不不！救救他！！",		-- 物品名:"友善的稻草人"->正在燃烧 制造描述:"模仿最新的秋季时尚"
			BURNT = "再见了",		-- 物品名:"友善的稻草人"->烧焦的 制造描述:"模仿最新的秋季时尚"
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "从石头里做出东西！",		-- 物品名:"陶轮" 制造描述:"大理石在你手里将像黏土一样！"
			BLOCK = "我要做个好看的！",		-- 物品名:"陶轮"->锁住了 制造描述:"大理石在你手里将像黏土一样！"
			SCULPTURE = "看！我亲手亲爪做的！",		-- 物品名:"陶轮"->雕像做好了 制造描述:"大理石在你手里将像黏土一样！"
			BURNT = "用不了",		-- 物品名:"陶轮"->烧焦的 制造描述:"大理石在你手里将像黏土一样！"
   		},
        SCULPTURE_KNIGHTHEAD = "好像是铁人的头",		-- 物品名:"可疑的大理石"
		SCULPTURE_KNIGHTBODY = 
		{
			COVERED = "那个是什么东西？",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "它坏掉了！",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "全部一起！",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "有什么事要发生了...",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        SCULPTURE_BISHOPHEAD = "看起来走失了",		-- 物品名:"可疑的大理石"
		SCULPTURE_BISHOPBODY = 
		{
			COVERED = "有点不对劲",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "它丢掉了头！",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "全做完了！",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "哈？",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        SCULPTURE_ROOKNOSE = "嗯，我猜这个应该安在某个地方",		-- 物品名:"可疑的大理石"
		SCULPTURE_ROOKBODY = 
		{
			COVERED = "好奇怪的一块石头……",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "缺了点什么……",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "好起来好一点了",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "有什么事要发生了...",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        GARGOYLE_HOUND = "它看起来很惊讶",		-- 物品名:"可疑的月亮石"
        GARGOYLE_WEREPIG = "不喜欢旁边有这个",		-- 物品名:"可疑的月亮石"
		SEEDS = "这是放在土里的！",		-- 物品名:"种子"
		SEEDS_COOKED = "很小的小吃！",		-- 物品名:"烤种子"
		SEWING_KIT = "回头向织女讨教……",		-- 物品名:"针线包" 制造描述:"缝补受损的衣物"
		SEWING_TAPE = "薇诺娜女士很会修东西",		-- 物品名:"可靠的胶布" 制造描述:"缝补受损的衣物"
		SHOVEL = "铲东西用的",		-- 物品名:"铲子" 制造描述:"挖掘各种各样的东西"
		SILK = "蜘蛛吐丝！",		-- 物品名:"蜘蛛丝"
		SKELETON = "下次再见",		-- 物品名:"骷髅"
		SCORCHED_SKELETON = "离营火太近了",		-- 物品名:"易碎骨骼"
		SKULLCHEST = "里面也许有好东西！",		-- 物品名:"骷髅箱"
		SMALLBIRD =
		{
			GENERIC = "它真是小！",		-- 物品名:"小鸟"->默认
			HUNGRY = "想吃小吃",		-- 物品名:"小鸟"->有点饿了
			STARVING = "看起来饿极了",		-- 物品名:"小鸟"->挨饿
			SLEEPING = "好好睡！",		-- 物品名:"小鸟"->睡着了
		},
		SMALLMEAT = "我可不会吃这个",		-- 物品名:"小肉"
		SMALLMEAT_DRIED = "现在更难吃了",		-- 物品名:"小风干肉"
		SPAT = "她看起来不舒服",		-- 物品名:"钢羊"
		SPEAR = "戳人的棍子！",		-- 物品名:"长矛" 制造描述:"使用尖的那一端"
		SPEAR_WATHGRITHR = "维京女士戳人的棍子！！",		-- 物品名:"战斗长矛" 制造描述:"黄金使它更锋利"
		WATHGRITHRHAT = "戴这个会让我变的跟维京女士一样强大吗？",		-- 物品名:"战斗头盔" 制造描述:"独角兽是你的保护神"
		SPIDER =
		{
			DEAD = "没那么强壮",		-- 物品名:"蜘蛛"->死了
			GENERIC = "小蜘蛛……",		-- 物品名:"蜘蛛"->默认
			SLEEPING = "嘘……",		-- 物品名:"蜘蛛"->睡着了
		},
		SPIDERDEN = "，踩到了黏黏的东西！",		-- 物品名:"蜘蛛巢"
		SPIDEREGGSACK = "啵，这就是蜘蛛宝宝出来的地方？",		-- 物品名:"蜘蛛卵" 制造描述:"跟你的朋友寻求点帮助"
		SPIDERGLAND = "药！",		-- 物品名:"蜘蛛腺"
		SPIDERHAT = "哈哈，看起来像韦伯那个小伙子",		-- 物品名:"蜘蛛帽" 制造描述:"蜘蛛们会喊你\"妈妈\""
		SPIDERQUEEN = "她是强大的女王！",		-- 物品名:"蜘蛛女王"
		SPIDER_WARRIOR =
		{
			DEAD = "我可是月宫战神，哈哈哈！",		-- 物品名:"蜘蛛战士"->死了
			GENERIC = "蜘蛛人勇士……",		-- 物品名:"蜘蛛战士"->默认
			SLEEPING = "它在做蜘蛛的梦",		-- 物品名:"蜘蛛战士"->睡着了
		},
		SPOILED_FOOD = "放回土里，重归自然吧",		-- 物品名:"腐烂食物"
        STAGEHAND =
        {
			AWAKE = "别烦我!！",		-- 物品名:"舞台"->醒了
			HIDING = "奇怪的事情……",		-- 物品名:"舞台"->藏起来了
        },
        STATUE_MARBLE = 
        {
            GENERIC = "这块石头形状很奇怪",		-- 物品名:"大理石雕像"->默认
            TYPE1 = "她的头没了！",		-- 物品名:"大理石雕像"->类型1
            TYPE2 = "好悲伤",		-- 物品名:"大理石雕像"->类型2
            TYPE3 = "看起来很高级、很无聊", --bird bath type statue		-- 物品名:"大理石雕像"
        },
		STATUEHARP = "有人弄坏它了",		-- 物品名:"竖琴雕像"
		STATUEMAXWELL = "看起来像脆弱的无鳞人",		-- 物品名:"麦斯威尔雕像"
		STEELWOOL = "会刮到人！",		-- 物品名:"钢丝绵"
		STINGER = "它的屁股嗡嗡叫",		-- 物品名:"蜂刺"
		STRAWHAT = "痒啊……",		-- 物品名:"草帽" 制造描述:"帮助你保持清凉干爽"
		STUFFEDEGGPLANT = "哇！蔬菜里还是蔬菜！？",		-- 物品名:"酿茄子"
		SWEATERVEST = "他穿好多衣服",		-- 物品名:"犬牙背心" 制造描述:"粗糙，但挺时尚"
		REFLECTIVEVEST = "嗯……橙色的",		-- 物品名:"清凉夏装" 制造描述:"穿上这件时尚的背心，保持凉爽和清醒"
		HAWAIIANSHIRT = "，那些花儿都完蛋了！",		-- 物品名:"花衬衫" 制造描述:"适合夏日穿着，或在周五便装日穿着"
		TAFFY = "呣呣呣！介锅吼连牙！",		-- 物品名:"太妃糖"
		TALLBIRD = "长腿鸟",		-- 物品名:"高脚鸟"
		TALLBIRDEGG = "听到里面有东西！",		-- 物品名:"高脚鸟蛋"
		TALLBIRDEGG_COOKED = "小可怜",		-- 物品名:"煎高脚鸟蛋"
		TALLBIRDEGG_CRACKED =
		{
			COLD = "你冷吗？",		-- 物品名:"冻伤"->冷了
			GENERIC = "它在孵化！",		-- 物品名:"孵化中的高脚鸟蛋"->默认
			HOT = "嗯……感觉好热……",		-- 物品名:"中暑"->热了
			LONG = "为什么会这么久！！",		-- 物品名:"孵化中的高脚鸟蛋"->还需要很久
			SHORT = "马上就出来了！",		-- 物品名:"孵化中的高脚鸟蛋"->很快了
		},
		TALLBIRDNEST =
		{
			GENERIC = "长腿鸟的蛋！",		-- 物品名:"高脚鸟巢"->默认
			PICKED = "长腿鸟在这睡",		-- 物品名:"高脚鸟巢"->被采完了
		},
		TEENBIRD =
		{
			GENERIC = "你长大就不好笑了",		-- 物品名:"小高脚鸟"->默认
			HUNGRY = "想吃小吃",		-- 物品名:"小高脚鸟"->有点饿了
			STARVING = "它饿了就会生气",		-- 物品名:"小高脚鸟"->挨饿
			SLEEPING = "它喜欢打盹",		-- 物品名:"小高脚鸟"->睡着了
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "，总能回来，对吧？",		-- 物品名:"木制传送台"->激活了
			GENERIC = "这个回去……别的世界？",		-- 物品名:"木制传送台"->默认
			LOCKED = "缺了点什么？",		-- 物品名:"木制传送台"->锁住了
			PARTIAL = "还没完吧？",		-- 物品名:"木制传送台"->已经有部分了
		},
		TELEPORTATO_BOX = "好玩的箱子",		-- 物品名:"盒状零件"
		TELEPORTATO_CRANK = "这是啥玩意儿？",		-- 物品名:"曲柄零件"
		TELEPORTATO_POTATO = "大金属块",		-- 物品名:"金属土豆状零件"
		TELEPORTATO_RING = "嗯，太大了放不到皇冠上",		-- 物品名:"环状零件"
		TELESTAFF = "会让脑袋感觉怪怪的……",		-- 物品名:"传送魔杖" 制造描述:"穿越空间的法杖！穿越时间的装置需另外购买"
		TENT = 
		{
			GENERIC = "睡觉觉",		-- 物品名:"帐篷"->默认 制造描述:"回复精神值，但要花费时间并导致饥饿"
			BURNT = "它烧掉了",		-- 物品名:"帐篷"->烧焦的 制造描述:"回复精神值，但要花费时间并导致饥饿"
		},
		SIESTAHUT = 
		{
			GENERIC = "想睡个午觉！就这睡吧……",		-- 物品名:"遮阳篷"->默认 制造描述:"躲避烈日，回复精神值"
			BURNT = "要找个新的地方睡午觉……",		-- 物品名:"遮阳篷"->烧焦的 制造描述:"躲避烈日，回复精神值"
		},
		TENTACLE = "他总是踩到这些",		-- 物品名:"触手"
		TENTACLESPIKE = "哈哈，尖刺！",		-- 物品名:"狼牙棒"
		TENTACLESPOTS = "拿了它的皮！",		-- 物品名:"触手皮"
		TENTACLE_PILLAR = "挠它肚子的痒！",		-- 物品名:"大触手"
        TENTACLE_PILLAR_HOLE = "那里面有什么？",		-- 物品名:"硕大的泥坑"
		TENTACLE_PILLAR_ARM = "他们好小",		-- 物品名:"小触手"
		TENTACLE_GARDEN = "找到了它的家！",		-- 物品名:"大触手"
		TOPHAT = "噢，高级啊！",		-- 物品名:"高礼帽" 制造描述:"最经典的帽子款式"
		TORCH = "带火的木棍",		-- 物品名:"火炬" 制造描述:"可携带的光源"
		TRANSISTOR = "它嗡嗡响！里面困着个蜜蜂吗？",		-- 物品名:"电子元件" 制造描述:"科学至上！滋滋滋！"
		TRAP = "可疑的！",		-- 物品名:"陷阱" 制造描述:"捕捉小型生物"
		TRAP_TEETH = "看起来很吓人",		-- 物品名:"犬牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西"
		TRAP_TEETH_MAXWELL = "吓人的尖刺！",		-- 物品名:"麦斯威尔的尖牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西"
		TREASURECHEST = 
		{
			GENERIC = "哦，装东西的盒子！",		-- 物品名:"木箱"->默认 制造描述:"一种结实的容器"
			BURNT = "不！",		-- 物品名:"木箱"->烧焦的 制造描述:"一种结实的容器"
		},
		TREASURECHEST_TRAP = "宝藏！",		-- 物品名:"宝箱"
		SACRED_CHEST = 
		{
			GENERIC = "想知道里面有什么？",		-- 物品名:"古老的箱子"->默认
			LOCKED = "喂！",		-- 物品名:"古老的箱子"->锁住了
		},
		TREECLUMP = "越不过去因为……啊……因为……",		-- 物品名:"古老的箱子"
		TRINKET_1 = "漂亮的小鞋子！", --Melted Marbles		-- 物品名:"熔化的弹珠"
		TRINKET_2 = "为什么没声音？！", --Fake Kazoo		-- 物品名:"假卡祖笛"
		TRINKET_3 = "解不开的结！", --Gord's Knot		-- 物品名:"戈尔迪之结"
		TRINKET_4 = "奇怪的小家伙", --Gnome		-- 物品名:"地精玩偶"
		TRINKET_5 = "砰砰砰！", --Toy Rocketship		-- 物品名:"迷你火箭"
		TRINKET_6 = "奇怪的彩色弯棍子？", --Frazzled Wires		-- 物品名:"烂电线"
		TRINKET_7 = "这游戏太难了！", --Ball and Cup		-- 物品名:"杯子和球玩具"
		TRINKET_8 = "嘎嘎的，容易碎", --Rubber Bung		-- 物品名:"硬化橡胶塞"
		TRINKET_9 = "这些石头中间有洞？", --Mismatched Buttons		-- 物品名:"不搭的纽扣"
		TRINKET_10 = "嘿嘿，又短又圆的牙齿", --Dentures		-- 物品名:"二手假牙"
		TRINKET_11 = "它说会一切顺利！", --Lying Robot		-- 物品名:"机器人玩偶"
		TRINKET_12 = "嘿嘿，它死了", --Dessicated Tentacle		-- 物品名:"干瘪的触手"
		TRINKET_13 = "奇怪的小女士", --Gnomette		-- 物品名:"可爱的小玩偶"
		TRINKET_14 = "这是喝的还是洗的", --Leaky Teacup		-- 物品名:"漏水的茶杯"
		TRINKET_15 = "看起来像……小铁人……？", --Pawn		-- 物品名:"白衣主教"
		TRINKET_16 = "看起来像……小铁人……？", --Pawn		-- 物品名:"黑衣主教"
		TRINKET_17 = "捞食物的容器", --Bent Spork		-- 物品名:"弯曲的叉子"
		TRINKET_18 = "里面有响声", --Trojan Horse		-- 物品名:"玩具木马"
		TRINKET_19 = "转啊转！", --Unbalanced Top		-- 物品名:"失衡上衣"
		TRINKET_20 = "多一个手爪挠痒痒！", --Backscratcher		-- 物品名:"不求人"
		TRINKET_21 = "他的发明好奇怪", --Egg Beater		-- 物品名:"破搅拌器"
		TRINKET_22 = "小绳子？", --Frayed Yarn		-- 物品名:"磨损的纱线"
		TRINKET_23 = "看起来不像角啊", --Shoehorn		-- 物品名:"鞋拔子"
		TRINKET_24 = "看起来很开心", --Lucky Cat Jar		-- 物品名:"幸运猫扎尔"
		TRINKET_25 = "怎么把树压得这么小这么扁？", --Air Unfreshener		-- 物品名:"臭气制造器"
		TRINKET_26 = "里面的瓤去哪了？！", --Potato Cup		-- 物品名:"土豆杯"
		TRINKET_27 = "头上有小爪！", --Coat Hanger		-- 物品名:"钢丝衣架"
		TRINKET_28 = "这是蚂蚁的城堡吗？", --Rook		-- 物品名:"白色战车"
        TRINKET_29 = "这是蚂蚁的城堡吗？", --Rook		-- 物品名:"黑色战车"
        TRINKET_30 = "看起来像……小铁人……？", --Knight		-- 物品名:"白色骑士"
        TRINKET_31 = "看起来像……小铁人……？", --Knight		-- 物品名:"黑色骑士"
        TRINKET_32 = "能看到一张可爱的脸！", --Cubic Zirconia Ball		-- 物品名:"立方氧化锆球"
        TRINKET_33 = "谁见过这么小的蜘蛛人？", --Spider Ring		-- 物品名:"蜘蛛指环"
        TRINKET_34 = "好像是安全的", --Monkey Paw		-- 物品名:"猴子手掌"
        TRINKET_35 = "有人喝掉了", --Empty Elixir		-- 物品名:"空的长生不老药"
        TRINKET_36 = "好尖的牙！", --Faux fangs		-- 物品名:"人造尖牙"
        TRINKET_37 = "不是我弄断的！！找到时就这样！", --Broken Stake		-- 物品名:"断桩"
        TRINKET_38 = "永远都能看到！", -- Binoculars Griftlands trinket		-- 物品名:"双筒望远镜"
        TRINKET_39 = "能为一只手爪保暖", -- Lone Glove Griftlands trinket		-- 物品名:"单只手套"
        TRINKET_40 = "这只蜗牛在睡觉", -- Snail Scale Griftlands trinket		-- 物品名:"蜗牛秤"
        TRINKET_41 = "温暖啊！", -- Goop Canister Hot Lava trinket		-- 物品名:"黏液罐"
        TRINKET_42 = "噢，有趣的玩具！", -- Toy Cobra Hot Lava trinket		-- 物品名:"玩具眼镜蛇"
        TRINKET_43= "嘿嘿，它穿着有趣的衣服！", -- Crocodile Toy Hot Lava trinket		-- 物品名:"鳄鱼玩具"
        TRINKET_44 = "有人弄破了植物的房子", -- Broken Terrarium ONI trinket		-- 物品名:"破碎的玻璃罐"
        TRINKET_45 = "它能做什么？", -- Odd Radio ONI trinket		-- 物品名:"奇怪的收音机"
        TRINKET_46 = "嗯……", -- Hairdryer ONI trinket		-- 物品名:"损坏的吹风机"
        LOST_TOY_1  = "哈？捡不起来！",		-- 物品名:"遗失的玻璃球"
        LOST_TOY_2  = "哈？捡不起来！",		-- 物品名:"多愁善感的卡祖笛"
        LOST_TOY_7  = "哈？捡不起来！",		-- 物品名:"珍视的抽线陀螺"
        LOST_TOY_10 = "哈？捡不起来！",		-- 物品名:"缺少的牙齿"
        LOST_TOY_11 = "哈？捡不起来！",		-- 物品名:"珍贵的玩具机器人"
        LOST_TOY_14 = "哈？捡不起来！",		-- 物品名:"妈妈最爱的茶杯"
        LOST_TOY_18 = "哈？捡不起来！",		-- 物品名:"宝贵的玩具木马"
        LOST_TOY_19 = "哈？捡不起来！",		-- 物品名:"最爱的陀螺"
        LOST_TOY_42 = "哈？捡不起来！",		-- 物品名:"装错的玩具眼镜蛇"
        LOST_TOY_43 = "哈？捡不起来！",		-- 物品名:"宠爱的鳄鱼玩具"
        HALLOWEENCANDY_1 = "这些比苹果还好吃!",		-- 物品名:"糖果苹果"
        HALLOWEENCANDY_2 = "让玉米更好了？！",		-- 物品名:"糖果玉米"
        HALLOWEENCANDY_3 = "玉米！！",		-- 物品名:"不太甜的玉米"
        HALLOWEENCANDY_4 = "没想到蜘蛛人这么好吃！",		-- 物品名:"粘液蜘蛛"
        HALLOWEENCANDY_5 = "一口就把你吃掉！",		-- 物品名:"浣猫糖果"
        HALLOWEENCANDY_6 = "味道不错",		-- 物品名:"\"葡萄干\""
        HALLOWEENCANDY_7 = "你那份不吃给我吃",		-- 物品名:"葡萄干"
        HALLOWEENCANDY_8 = "真好吃！",		-- 物品名:"鬼魂波普"
        HALLOWEENCANDY_9 = "比普通虫子都好吃！",		-- 物品名:"果冻虫"
        HALLOWEENCANDY_10 = "呣，沼泽的味道！",		-- 物品名:"触须棒棒糖"
        HALLOWEENCANDY_11 = "要把你全部吃掉！！",		-- 物品名:"巧克力猪"
        HALLOWEENCANDY_12 = "吃进肚肚里太好吃了！", --ONI meal lice candy		-- 物品名:"糖果虱"
        HALLOWEENCANDY_13 = "大门牙都要碎了！", --Griftlands themed candy		-- 物品名:"无敌硬糖"
        HALLOWEENCANDY_14 = "热热热！", --Hot Lava pepper candy		-- 物品名:"熔岩椒"
        CANDYBAG = "甜食！！",		-- 物品名:"糖果袋" 制造描述:"只带万圣夜好吃的东西"
		HALLOWEEN_ORNAMENT_1 = "啵！嘿嘿",		-- 物品名:"幽灵装饰"
		HALLOWEEN_ORNAMENT_2 = "可以用来装饰！",		-- 物品名:"蝙蝠装饰"
		HALLOWEEN_ORNAMENT_3 = "嘿嘿……看起来很像韦伯那个小伙子", 		-- 物品名:"蜘蛛装饰"
		HALLOWEEN_ORNAMENT_4 = "这些一点不吓人",		-- 物品名:"触手装饰"
		HALLOWEEN_ORNAMENT_5 = "奇怪的装饰物呢",		-- 物品名:"悬垂蜘蛛装饰"
		HALLOWEEN_ORNAMENT_6 = "漂亮的小鸟", 		-- 物品名:"乌鸦装饰"
		HALLOWEENPOTION_DRINKS_WEAK = "没那么好...",		-- 物品名:"古老的箱子"
		HALLOWEENPOTION_DRINKS_POTENT = "味道很大",		-- 物品名:"古老的箱子"
        HALLOWEENPOTION_BRAVERY = "天不怕，地不怕！",		-- 物品名:"古老的箱子"
		HALLOWEENPOTION_MOON = "好像能摔破……",		-- 物品名:"月亮精华液"
		HALLOWEENPOTION_FIRE_FX = "火花瓶", 		-- 物品名:"古老的箱子"
		MADSCIENCE_LAB = "泡沫，泡沫！",		-- 物品名:"疯狂科学家实验室" 制造描述:"疯狂实验无极限唯独神智有极限"
		LIVINGTREE_ROOT = "还有根须在！", 		-- 物品名:"完全正常的树根"
		LIVINGTREE_SAPLING = "还在生长",		-- 物品名:"完全正常的树苗"
        DRAGONHEADHAT = "看着就和自己的脸一样可爱",		-- 物品名:"幸运兽脑袋" 制造描述:"野兽装束的前端"
        DRAGONBODYHAT = "真是百搭啊！",		-- 物品名:"幸运兽躯体" 制造描述:"野兽装束的中间部分"
        DRAGONTAILHAT = "我一直都想要一条尾巴！",		-- 物品名:"幸运兽尾巴" 制造描述:"野兽装束的尾端"
        PERDSHRINE =
        {
            GENERIC = "哈？你要什么啊，咯咯叫的鸟？",		-- 物品名:"火鸡神龛"->默认 制造描述:"供奉庄严的火鸡"
            EMPTY = "这里应该放点东西？",		-- 物品名:"火鸡神龛" 制造描述:"供奉庄严的火鸡"
            BURNT = "全烧没了",		-- 物品名:"火鸡神龛"->烧焦的 制造描述:"供奉庄严的火鸡"
        },
        REDLANTERN = "嗯，看起来挺好看的",		-- 物品名:"红灯笼" 制造描述:"照亮你的路的幸运灯笼"
        LUCKY_GOLDNUGGET = "闪耀的石头！",		-- 物品名:"幸运黄金"
        FIRECRACKERS = "响声大，闪光亮！！",		-- 物品名:"红色爆竹" 制造描述:"用重击来庆祝！"
        PERDFAN = "羽毛棒子！",		-- 物品名:"幸运扇" 制造描述:"额外的运气，超级多"
        REDPOUCH = "里面叮叮当当的响",		-- 物品名:"红袋子"
        WARGSHRINE = 
        {
            GENERIC = "黄金小狗的家",		-- 物品名:"座狼龛"->默认 制造描述:"供奉黏土座狼"
            EMPTY = "需要一点光",		-- 物品名:"座狼龛" 制造描述:"供奉黏土座狼"
            BURNT = "烧得精光",		-- 物品名:"座狼龛"->烧焦的 制造描述:"供奉黏土座狼"
        },
        CLAYWARG = 
        {
        	GENERIC = "大牙！",		-- 物品名:"黏土座狼"->默认
        	STATUE = "有种不祥的预感",		-- 物品名:"黏土座狼"->雕像
        },
        CLAYHOUND = 
        {
        	GENERIC = "会咬人！",		-- 物品名:"黏土猎犬"->默认
        	STATUE = "你是谁做的？",		-- 物品名:"黏土猎犬"->雕像
        },
        HOUNDWHISTLE = "它发不出声？",		-- 物品名:"幸运哨子" 制造描述:"对野猎犬吹哨"
        CHESSPIECE_CLAYHOUND = "坏狗",		-- 物品名:"猎犬棋子"
        CHESSPIECE_CLAYWARG = "！",		-- 物品名:"座狼棋子"
		PIGSHRINE =
		{
            GENERIC = "谁建的？？",		-- 物品名:"猪神龛"->默认 制造描述:"为富有的猪献贡"
            EMPTY = "什么都不给你",		-- 物品名:"猪神龛" 制造描述:"为富有的猪献贡"
            BURNT = "好，它没了",		-- 物品名:"猪神龛"->烧焦的 制造描述:"为富有的猪献贡"
		},
		PIG_TOKEN = "偷来了猪人的腰带！",		-- 物品名:"金色腰带"
		PIG_COIN = "闪闪的猪鼻子！",		-- 物品名:"猪鼻铸币"
		YOTP_FOOD1 = "啵！一张丑陋的猪脸！",		-- 物品名:"致敬烤肉" 制造描述:"向猪王敬肉"
		YOTP_FOOD2 = "照理讲我挺喜欢泥巴，但那东西我接受不了",		-- 物品名:"八宝泥馅饼" 制造描述:"那里隐藏着什么？"
		YOTP_FOOD3 = "浑浊的烧烤",		-- 物品名:"鱼头串" 制造描述:"棍子上的荣华富贵"
		PIGELITE1 = "离远点！", --BLUE		-- 物品名:"韦德"
		PIGELITE2 = "坏猪！", --RED		-- 物品名:"伊内修斯"
		PIGELITE3 = "脏猪人！", --WHITE		-- 物品名:"德米特里"
		PIGELITE4 = "公敌！", --GREEN		-- 物品名:"索耶"
		PIGELITEFIGHTER1 = "离远点！", --BLUE		-- 物品名:"韦德"
		PIGELITEFIGHTER2 = "坏猪！", --RED		-- 物品名:"伊内修斯"
		PIGELITEFIGHTER3 = "脏猪人！", --WHITE		-- 物品名:"德米特里"
		PIGELITEFIGHTER4 = "公敌！", --GREEN		-- 物品名:"索耶"
		CARRAT_GHOSTRACER = "那个好吓人",		-- 物品名:"查理的胡萝卜鼠"
        YOTC_CARRAT_RACE_START = "植物比赛从这开始！",		-- 物品名:"起点" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT = "它能指路！",		-- 物品名:"检查点" 制造描述:"通往光荣之路上的一站"
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "这是终点",		-- 物品名:"终点线"->默认 制造描述:"你走投无路了"
            BURNT = "嗷嗷嗷",		-- 物品名:"终点线"->烧焦的 制造描述:"你走投无路了"
            I_WON = "耶！！打败你了，哈哈!",		-- 物品名:"终点线" 制造描述:"你走投无路了"
            SOMEONE_ELSE_WON = ", {winner} 作弊了……",		-- 物品名:"终点线" 制造描述:"你走投无路了"
        },
		YOTC_CARRAT_RACE_START_ITEM = "植物比赛的起点",		-- 物品名:"起点套装" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "帮萝卜鼠找路",		-- 物品名:"检查点套装" 制造描述:"通往光荣之路上的一站"
		YOTC_CARRAT_RACE_FINISH_ITEM = "终点放在哪？",		-- 物品名:"终点线套装" 制造描述:"你走投无路了"
		YOTC_SEEDPACKET = "小零食！",		-- 物品名:"种子包" 制造描述:"一包普通的混合种子"
		YOTC_SEEDPACKET_RARE = "不知道会不会长出好吃的东西",		-- 物品名:"高级种子包" 制造描述:"一包高质量的种子"
		MINIBOATLANTERN = "可爱的水上漂浮物",		-- 物品名:"漂浮灯笼" 制造描述:"闪着暖暖的光亮"
        YOTC_CARRATSHRINE =
        {
            GENERIC = "像是一只萝卜鼠",		-- 物品名:"胡萝卜鼠神龛"->默认 制造描述:"供奉灵活的胡萝卜鼠"
            EMPTY = "想要礼物吗？",		-- 物品名:"胡萝卜鼠神龛" 制造描述:"供奉灵活的胡萝卜鼠"
            BURNT = "不是我弄坏的！！",		-- 物品名:"胡萝卜鼠神龛"->烧焦的 制造描述:"供奉灵活的胡萝卜鼠"
        },
        YOTC_CARRAT_GYM_DIRECTION = 
        {
            GENERIC = "嘿嘿，我的萝卜鼠会是最棒的！",		-- 物品名:"方向健身房"->默认
            RAT = "冲啊，冲啊！",		-- 物品名:"方向健身房"
            BURNT = "啊...",		-- 物品名:"方向健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_SPEED = 
        {
            GENERIC = "竞速轮",		-- 物品名:"速度健身房"->默认
            RAT = "转啊，转啊，转！",		-- 物品名:"速度健身房"
            BURNT = "啊...",		-- 物品名:"速度健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_REACTION = 
        {
            GENERIC = "非常好的赛跑训练！",		-- 物品名:"反应健身房"->默认
            RAT = "提高了！",		-- 物品名:"反应健身房"
            BURNT = "啊...",		-- 物品名:"反应健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_STAMINA = 
        {
            GENERIC = "跳绳机器",		-- 物品名:"耐力健身房"->默认
            RAT = "跳啊！",		-- 物品名:"耐力健身房"
            BURNT = "啊...",		-- 物品名:"耐力健身房"->烧焦的
        }, 
        YOTC_CARRAT_GYM_DIRECTION_ITEM = "我会让萝卜鼠成最棒的！",		-- 物品名:"方向健身房套装" 制造描述:"提高你的胡萝卜鼠的方向感"
        YOTC_CARRAT_GYM_SPEED_ITEM = "给萝卜鼠的",		-- 物品名:"速度健身房套装" 制造描述:"增加你的胡萝卜鼠的速度"
        YOTC_CARRAT_GYM_STAMINA_ITEM = "把这个放在哪里呢？",		-- 物品名:"耐力健身房套装" 制造描述:"增强你的胡萝卜鼠的耐力"
        YOTC_CARRAT_GYM_REACTION_ITEM = "，要组装好多东西",		-- 物品名:"反应健身房套装" 制造描述:"加快你的胡萝卜鼠的反应时间"
        YOTC_CARRAT_SCALE_ITEM = "可以看看哪只萝卜鼠是最棒的！",           		-- 物品名:"胡萝卜鼠秤套装" 制造描述:"看看你的胡萝卜鼠的情况"
        YOTC_CARRAT_SCALE = 
        {
            GENERIC = "需要拿到最棒的萝卜鼠！",		-- 物品名:"胡萝卜鼠秤"->默认
            CARRAT = "不是很好",		-- 物品名:"胡萝卜" 制造描述:"灵巧机敏，富含胡萝卜素"
            CARRAT_GOOD = "会是个很好的选手！",		-- 物品名:"胡萝卜鼠秤"
            BURNT = "不是我干的！！",		-- 物品名:"胡萝卜鼠秤"->烧焦的
        },                
		BISHOP_CHARGE_HIT = "朗普！",		-- 物品名:"胡萝卜鼠秤"->被主教攻击
		TRUNKVEST_SUMMER = "穿个鼻子在身上！",		-- 物品名:"保暖小背心" 制造描述:"暖和，但算不上非常暖和"
		TRUNKVEST_WINTER = "舒服……",		-- 物品名:"寒冬背心" 制造描述:"足以抵御冬季暴雪的保暖背心"
		TRUNK_COOKED = "啵！",		-- 物品名:"象鼻排"
		TRUNK_SUMMER = "拿到了它的鼻子！",		-- 物品名:"象鼻"
		TRUNK_WINTER = "毛茸茸的",		-- 物品名:"冬象鼻"
		TUMBLEWEED = "你要去哪里？",		-- 物品名:"风滚草"
		TURKEYDINNER = "真可怕",		-- 物品名:"火鸡大餐"
		TWIGS = "一堆棍子",		-- 物品名:"树枝"
		UMBRELLA = "打了雨伞就淋不到我了！",		-- 物品名:"雨伞" 制造描述:"遮阳挡雨！"
		GRASS_UMBRELLA = "看不出漂亮在哪",		-- 物品名:"花伞" 制造描述:"漂亮轻便的保护伞"
		UNIMPLEMENTED = "那是什么？",		-- 物品名:"胡萝卜鼠秤"
		WAFFLES = "毛绒绒的甜方块！",		-- 物品名:"华夫饼"
		WALL_HAY = 
		{	
			GENERIC = "我几口气就把这墙给吹倒了！",		-- 物品名:"草墙"->默认
			BURNT = "故事通常不是这么结束的",		-- 物品名:"草墙"->烧焦的
		},
		WALL_HAY_ITEM = "薇克女士讲过一个稻草房子的故事……",		-- 物品名:"草墙" 制造描述:"草墙墙体不太结实"
		WALL_STONE = "看着不错！",		-- 物品名:"石墙"
		WALL_STONE_ITEM = "石头堆！",		-- 物品名:"石墙" 制造描述:"石墙墙体"
		WALL_RUINS = "怎么看起来这么老啊？",		-- 物品名:"铥墙"
		WALL_RUINS_ITEM = "能用这个建一堵结实的墙！",		-- 物品名:"铥墙" 制造描述:"这些墙可以承受相当多的打击"
		WALL_WOOD = 
		{
			GENERIC = "放几朵月花就好看了",		-- 物品名:"木墙"->默认
			BURNT = "嗷，曾经是一堵好墙……",		-- 物品名:"木墙"->烧焦的
		},
		WALL_WOOD_ITEM = "尖尖的真漂亮",		-- 物品名:"木墙" 制造描述:"木墙墙体"
		WALL_MOONROCK = "月亮墙！",		-- 物品名:"月岩壁"
		WALL_MOONROCK_ITEM = "硬石头",		-- 物品名:"月岩壁" 制造描述:"月球疯子之墙"
		FENCE = "能把讨厌的猪人挡在外面",		-- 物品名:"木栅栏"
        FENCE_ITEM = "建篱笆的材料！",		-- 物品名:"木栅栏" 制造描述:"木栅栏部分"
        FENCE_GATE = "噢聪明啊，篱笆上面装个门",		-- 物品名:"木门"
        FENCE_GATE_ITEM = "建篱笆门的材料！",		-- 物品名:"木门" 制造描述:"木栅栏的门"
		WALRUS = "他看起来又大又重要",		-- 物品名:"海象人"
		WALRUSHAT = "嘿嘿，暖暖的，耳朵很舒服！",		-- 物品名:"海象的贝雷帽"
		WALRUS_CAMP =
		{
			EMPTY = "有人之前来过",		-- 物品名:"海象营"
			GENERIC = "虽然是冰做的房子，但是看起来很暖和",		-- 物品名:"海象营"->默认
		},
		WALRUS_TUSK = "我拿了它的牙！",		-- 物品名:"海象牙"
		WARDROBE = 
		{
			GENERIC = "可以玩换衣服的游戏了！",		-- 物品名:"衣柜"->默认 制造描述:"随心变换面容"
            BURNING = "火！火！！",		-- 物品名:"衣柜"->正在燃烧 制造描述:"随心变换面容"
			BURNT = "啊...",		-- 物品名:"衣柜"->烧焦的 制造描述:"随心变换面容"
		},
		WARG = "他的牙齿真大啊",		-- 物品名:"座狼"
		WASPHIVE = "看起来吓人……但里面有甜甜的东西……",		-- 物品名:"杀人蜂蜂窝"
		WATERBALLOON = "别怕，不朝你扔……（嘿嘿）",		-- 物品名:"水球" 制造描述:"球体灭火"
		WATERMELON = "给我！！",		-- 物品名:"西瓜"
		WATERMELON_COOKED = "烤西瓜",		-- 物品名:"烤西瓜"
		WATERMELONHAT = "我爱时尚！",		-- 物品名:"西瓜帽" 制造描述:"提神醒脑，但感觉黏黏的"
		WAXWELLJOURNAL = "……不喜欢那本书里的故事",		-- 物品名:"暗影魔法书" 制造描述:"这将让你大吃一惊"
		WETGOOP = "通常这种湿湿黏黏的东西我是喜欢的……",		-- 物品名:"失败料理"
        WHIP = "我-驾！！",		-- 物品名:"皮鞭" 制造描述:"提出有建设性的反馈意见"
		WINTERHAT = "它看起来很舒服！",		-- 物品名:"冬帽" 制造描述:"保持脑袋温暖"
		WINTEROMETER = 
		{
			GENERIC = "他要靠这个才知道冷热？",		-- 物品名:"温度测量仪"->默认 制造描述:"测量环境气温"
			BURNT = "好的",		-- 物品名:"温度测量仪"->烧焦的 制造描述:"测量环境气温"
		},
        WINTER_TREE =
        {
            BURNT = "曾经很漂亮……",		-- 物品名:"冬季圣诞树"->烧焦的
            BURNING = "快灭火！",		-- 物品名:"冬季圣诞树"->正在燃烧
            CANDECORATE = "从没见过这么漂亮的树！",		-- 物品名:"冬季圣诞树"->烛台？？？
            YOUNG = "快长大！",		-- 物品名:"冬季圣诞树"->还年轻
        },
		WINTER_TREESTAND = 
		{
			GENERIC = "要找到一颗松果！",		-- 物品名:"圣诞树墩"->默认 制造描述:"种植并装饰一棵冬季圣诞树！"
            BURNT = "噢...",		-- 物品名:"圣诞树墩"->烧焦的 制造描述:"种植并装饰一棵冬季圣诞树！"
		},
        WINTER_ORNAMENT = "噢……真漂亮！",		-- 物品名:"圣诞小玩意"
        WINTER_ORNAMENTLIGHT = "发着光！",		-- 物品名:"圣诞灯"
        WINTER_ORNAMENTBOSS = "这些在树上都留了特殊位置！",		-- 物品名:"华丽的装饰"
		WINTER_ORNAMENTFORGE = "得把那个放在树上？",		-- 物品名:"熔炉装饰"
		WINTER_ORNAMENTGORGE = "……？",		-- 物品名:"舒缓的装饰"
        WINTER_FOOD1 = "呣，这个是做什么的？", --gingerbread cookie		-- 物品名:"小姜饼"
        WINTER_FOOD2 = "这种雪花在舌头上也会化！", --sugar cookie		-- 物品名:"糖曲奇饼"
        WINTER_FOOD3 = "脆脆的！", --candy cane		-- 物品名:"拐杖糖"
        WINTER_FOOD4 = "，里面包了什么馅？", --fruitcake		-- 物品名:"永远的水果蛋糕"
        WINTER_FOOD5 = "是真木头吗？", --yule log cake		-- 物品名:"巧克力树洞蛋糕"
        WINTER_FOOD6 = "快看！我能一口全吞了！", --plum pudding		-- 物品名:"李子布丁"
        WINTER_FOOD7 = "嗯...", --apple cider		-- 物品名:"苹果酒"
        WINTER_FOOD8 = "一级棒，顶呱呱", --hot cocoa		-- 物品名:"热可可"
        WINTER_FOOD9 = "汩汩汩！", --eggnog		-- 物品名:"美味的蛋酒"
		WINTERSFEASTOVEN =
		{
			GENERIC = "能烧好大一把火！",		-- 物品名:"砖砌烤炉"->默认 制造描述:"燃起了喜庆的火焰"
			COOKING = "正在做食物",		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰"
			ALMOST_DONE_COOKING = "现在能吃吗？现在好吗？现在？",		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰"
			DISH_READY = "食物好了！",		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰"
		},
		BERRYSAUCE = "美味的浆果！",		-- 物品名:"快乐浆果酱"
		BIBINGKA = "喜欢这个！",		-- 物品名:"比宾卡米糕"
		CABBAGEROLLS = "白菜包白菜！",		-- 物品名:"白菜卷"
		FESTIVEFISH = "有人在玩恶作剧，看起来是鱼，其实是蔬菜！",		-- 物品名:"节庆鱼料理"
		GRAVY = "呣，是巧克力！",		-- 物品名:"好肉汁"
		LATKES = "香脆美味！",		-- 物品名:"土豆饼"
		LUTEFISK = "土豆拼成了鱼的样子！",		-- 物品名:"苏打鱼"
		MULLEDDRINK = "呣，肚子暖暖的！",		-- 物品名:"香料潘趣酒"
		PANETTONE = "香香的面包！",		-- 物品名:"托尼甜面包"
		PAVLOVA = "高级厨师叫它蛋……蛋白……书皮",		-- 物品名:"巴甫洛娃蛋糕"
		PICKLEDHERRING = "有人在玩恶作剧，看起来是鱼，其实是蔬菜！",		-- 物品名:"腌鲱鱼"
		POLISHCOOKIE = "香香的水果口袋！",		-- 物品名:"波兰饼干"
		PUMPKINPIE = "呣呣呣呣！",		-- 物品名:"南瓜饼"
		ROASTTURKEY = "看着像难吃的火鸡，但闻起来像蔬菜？",		-- 物品名:"烤火鸡"
		STUFFING = "好吃的面包碎",		-- 物品名:"烤火鸡面包馅"
		SWEETPOTATO = "这个比普通土豆还好吃",		-- 物品名:"红薯焗饭"
		TAMALES = "呣，里面有辣的蔬菜",		-- 物品名:"塔马利"
		TOURTIERE = "呣，是辣的蔬菜饼！",		-- 物品名:"饕餮馅饼"
		TABLE_WINTERS_FEAST = 
		{
			GENERIC = "很高级的餐桌",		-- 物品名:"冬季盛宴餐桌"->默认 制造描述:"一起来享用冬季盛宴吧"
			HAS_FOOD = "准备好吃了！准备好吃了！",		-- 物品名:"冬季盛宴餐桌" 制造描述:"一起来享用冬季盛宴吧"
			WRONG_TYPE = "那个不能放那里！",		-- 物品名:"冬季盛宴餐桌" 制造描述:"一起来享用冬季盛宴吧"
			BURNT = "嗷，盛宴结束了？",		-- 物品名:"冬季盛宴餐桌"->烧焦的 制造描述:"一起来享用冬季盛宴吧"
		},
		GINGERBREADWARG = "要把你全部吃掉！", 		-- 物品名:"姜饼狼"
		GINGERBREADHOUSE = "有人在家吗？", 		-- 物品名:"姜饼猪屋"
		GINGERBREADPIG = "绝不放过饼干小猪人！",		-- 物品名:"姜饼猪"
		CRUMBS = "留下一路的美味",		-- 物品名:"饼干屑"
		WINTERSFEASTFUEL = "看起来好好吃",		-- 物品名:"节日欢愉"
        KLAUS = "有礼物送我吗？",		-- 物品名:"克劳斯"
        KLAUS_SACK = "打开！打开！",		-- 物品名:"赃物袋"
		KLAUSSACKKEY = "样子奇怪的鹿角……",		-- 物品名:"麋鹿茸"
		WORMHOLE =
		{
			GENERIC = "什么在动？",		-- 物品名:"虫洞"->默认
			OPEN = "哈哈！这是一个长牙的隧道",		-- 物品名:"虫洞"->打开
		},
		WORMHOLE_LIMITED = "感觉不好？",		-- 物品名:"生病的虫洞"->一次性虫洞 单机
		ACCOMPLISHMENT_SHRINE = "做了好多事！",        		-- 物品名:"奖杯" 制造描述:"证明你作为一个人的价值"
		LIVINGTREE = "它看我的眼神不太对",		-- 物品名:"完全正常的树"
		ICESTAFF = "魔法冷棍子",		-- 物品名:"冰魔杖" 制造描述:"把敌人冰冻在原地"
		REVIVER = "它还在动！",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
		SHADOWHEART = "好……悲伤……",		-- 物品名:"暗影心房"
        ATRIUM_RUBBLE = 
        {
			LINE_1 = "喔，图像讲故事！",		-- 物品名:"古代的壁画"->第一行
			LINE_2 = "看不到图像",		-- 物品名:"古代的壁画"->第二行
			LINE_3 = "看起来……发生了不好的事情",		-- 物品名:"古代的壁画"->第三行
			LINE_4 = "这里开始吓人了……",		-- 物品名:"古代的壁画"->第四行
			LINE_5 = "他们这里曾有过村庄",		-- 物品名:"古代的壁画"->第五行
		},
        ATRIUM_STATUE = "有点不对劲……",		-- 物品名:"远古雕像"
        ATRIUM_LIGHT = 
        {
			ON = "好可怕!",		-- 物品名:"古代的灯塔"->开启
			OFF = "需要火？",		-- 物品名:"古代的灯塔"->关闭
		},
        ATRIUM_GATE =
        {
			ON = "不应该那样做的！",		-- 物品名:"古代的通道"->开启
			OFF = "有人弄坏了",		-- 物品名:"古代的通道"->关闭
			CHARGING = "发生什么了？！",		-- 物品名:"古代的通道"->充能中
			DESTABILIZING = "-！",		-- 物品名:"古代的通道"->不稳定
			COOLDOWN = "结束了？",		-- 物品名:"古代的通道"->冷却中
        },
        ATRIUM_KEY = "这个看起来很重要！",		-- 物品名:"古代的钥匙"
		LIFEINJECTOR = "不喜欢针头！",		-- 物品名:"强心针" 制造描述:"提高下你那日渐衰退的最大健康值吧"
		SKELETON_PLAYER =
		{
			MALE = "他们出事了……",		-- 物品名:"骷髅"->男性
			FEMALE = "他们出事了……",		-- 物品名:"骷髅"->女性
			ROBOT = "他们出事了……",		-- 物品名:"骷髅"->机器人
			DEFAULT = "再见……",		-- 物品名:"物品栏物品"->默认
		},
		HUMANMEAT = "不行",		-- 物品名:"长猪"
		HUMANMEAT_COOKED = "，他熟了以后更难闻",		-- 物品名:"煮熟的长猪"
		HUMANMEAT_DRIED = "不不不",		-- 物品名:"长猪肉干"
		ROCK_MOON = "月石！",		-- 物品名:"岩石"
		MOONROCKNUGGET = "是故乡的石头",		-- 物品名:"月岩"
		MOONROCKCRATER = "这只眼，缺一颗心！",		-- 物品名:"有洞的月亮石" 制造描述:"用于划定地盘的岩石"
		MOONROCKSEED = "且就洞庭赊月色，将船买酒白云边",		-- 物品名:"天体宝球"
        REDMOONEYE = "猩红的蔑视",		-- 物品名:"红色月眼"
        PURPLEMOONEYE = "深邃的望视",		-- 物品名:"紫色月眼"
        GREENMOONEYE = "生命的凝视",		-- 物品名:"绿色月眼"
        ORANGEMOONEYE = "温暖的注视",		-- 物品名:"橘色月眼"
        YELLOWMOONEYE = "懵懂的窥视",		-- 物品名:"黄色月眼"
        BLUEMOONEYE = "清寒的仰视",		-- 物品名:"蓝色月眼"
        BOARRIOR = "大-大猪人……",		-- 物品名:"大熔炉猪战士"->大熔炉猪战士
        BOARON = "你是猪人的亲戚？？",		-- 物品名:"小猪"
        PEGHOOK = "坏虫子！",		-- 物品名:"蝎子"
        TRAILS = "他……看着不怎么强硬……噗",		-- 物品名:"大猩猩"
        TURTILLUS = "为什么当刺头？",		-- 物品名:"坦克龟"
        SNAPPER = "牙齿",		-- 物品名:"鳄鱼指挥官"
		RHINODRILL = "他们也不是那么硬！",		-- 物品名:"后扣帽犀牛兄弟"
		BEETLETAUR = "特！！",		-- 物品名:"地狱独眼巨猪"
        LAVAARENA_PORTAL = 
        {
            ON = "再见了！",		-- 物品名:"远古传送门"->开启
            GENERIC = "那扇门怎么用？",		-- 物品名:"远古传送门"->默认
        },
        HEALINGSTAFF = "啵，丑陋的棍子……",		-- 物品名:"生存魔杖"
        FIREBALLSTAFF = "呼轰！",		-- 物品名:"地狱魔杖"
        HAMMER_MJOLNIR = "外强大的锤子！",		-- 物品名:"锻锤"
        SPEAR_GUNGNIR = "戳戳戳！",		-- 物品名:"尖齿矛"
        BLOWDART_LAVA = "不应该玩那个……我就要玩",		-- 物品名:"吹箭"
        BLOWDART_LAVA2 = "看起来很危险！",		-- 物品名:"熔化吹箭"
        WEBBER_SPIDER_MINION = "我们现在休战了",		-- 物品名:"蜘蛛宝宝"
        BOOK_FOSSIL = "上面写什么？",		-- 物品名:"石化之书"
		SPEAR_LANCE = "转转转！",		-- 物品名:"螺旋矛"
		BOOK_ELEMENTAL = "上面写什么？",		-- 物品名:"召唤之书"
        QUAGMIRE_ALTAR = 
        {
        	GENERIC = "食物都去那儿了",		-- 物品名:"饕餮祭坛"->默认
        	FULL = "它刚吃完！",		-- 物品名:"饕餮祭坛"->满了
    	},
		QUAGMIRE_SUGARWOODTREE = 
		{
			GENERIC = "里面有甜甜的东西！",		-- 物品名:"糖木树"->默认
			STUMP = "有人砍走了树！不是我干的！",		-- 物品名:"糖木树"->暴食模式糖木树只剩树桩了
			TAPPED_EMPTY = "嗷……一点没剩下",		-- 物品名:"糖木树"->暴食模式糖木树空了
			TAPPED_READY = "呣，都是甜甜的东西！",		-- 物品名:"糖木树"->暴食模式糖木树好了
			TAPPED_BUGS = "啵，这些虫子粘在了甜的东西里",		-- 物品名:"糖木树"->暴食模式糖木树上有蚂蚁
			WOUNDED = "树还好吗？",		-- 物品名:"糖木树"->暴食糖木树生病了
		},
		QUAGMIRE_SPOTSPICE_SHRUB = 
		{
			GENERIC = "有种家乡的感觉",		-- 物品名:"带斑点的小灌木"->默认
			PICKED = "没什么可以摘了",		-- 物品名:"带斑点的小灌木"->被采完了
		},
		QUAGMIRE_SALT_RACK =
		{
			READY = "上面长东西了！",		-- 物品名:"盐架"->准备好的 满的
			GENERIC = "这个有什么用？",		-- 物品名:"盐架"->默认
		},
		QUAGMIRE_SAFE = 
		{
			GENERIC = "想知道那个箱子藏了什么……",		-- 物品名:"保险箱"->默认
			LOCKED = "嗷，让我进去！！",		-- 物品名:"保险箱"->锁住了
		},
		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "噢，蘑菇原来长这里！",		-- 物品名:"蘑菇"->默认
			PICKED = "没有蘑菇了……？",		-- 物品名:"蘑菇"->被采完了
		},
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "你好？",		-- 物品名:"残破的房子" 制造描述:未找到
            "这里好荒凉",		-- 物品名:"残破的房子" 制造描述:未找到
            "家里没人",		-- 物品名:"残破的房子" 制造描述:未找到
        },
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "那个猪人有点奇怪",		-- 物品名:"沼泽猪长老"->默认
            SLEEPING = "睡着了？",		-- 物品名:"沼泽猪长老"->睡着了
        },
        QUAGMIRE_FOOD =
        {
        	GENERIC = "该把它给天上的大嘴！",		-- 物品名:未找到
            MISMATCH = "它应该不会喜欢",		-- 物品名:未找到
            MATCH = "适合天上的嘴巴！",		-- 物品名:未找到
            MATCH_BUT_SNACK = "嘴巴这么大，食物比起来真小",		-- 物品名:未找到
        },
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "里面最好有好东西",		-- 物品名:"铁门"->默认
            LOCKED = "让我进去！！",		-- 物品名:"铁门"->锁住了
        },
        QUAGMIRE_PIGEON =
        {
            DEAD = "咦，它死了",		-- 物品名:"鸽子"->死了 制造描述:"这是一只完整的活鸽"
            GENERIC = "你好，小鸟！",		-- 物品名:"鸽子"->默认 制造描述:"这是一只完整的活鸽"
            SLEEPING = "安睡的小鸟",		-- 物品名:"鸽子"->睡着了 制造描述:"这是一只完整的活鸽"
        },
        WINONA_CATAPULT = 
        {
        	GENERIC = "扔石头的机器！扔石头的机器！",		-- 物品名:"薇诺娜的投石机"->默认 制造描述:"向敌人投掷大石块"
        	OFF = "为什么不工作了？",		-- 物品名:"薇诺娜的投石机"->关闭 制造描述:"向敌人投掷大石块"
        	BURNING = "看起来非常危险啊！",		-- 物品名:"薇诺娜的投石机"->正在燃烧 制造描述:"向敌人投掷大石块"
        	BURNT = "呜呜呜...",		-- 物品名:"薇诺娜的投石机"->烧焦的 制造描述:"向敌人投掷大石块"
        },
        WINONA_SPOTLIGHT = 
        {
        	GENERIC = "这是什么？",		-- 物品名:"薇诺娜的聚光灯"->默认 制造描述:"白天夜里都发光"
        	OFF = "我想它是累了",		-- 物品名:"薇诺娜的聚光灯"->关闭 制造描述:"白天夜里都发光"
        	BURNING = "发这种光不对",		-- 物品名:"薇诺娜的聚光灯"->正在燃烧 制造描述:"白天夜里都发光"
        	BURNT = "这下帮不上忙了",		-- 物品名:"薇诺娜的聚光灯"->烧焦的 制造描述:"白天夜里都发光"
        },
        WINONA_BATTERY_LOW = 
        {
        	GENERIC = "这个箱子有奇怪的树枝伸出来",		-- 物品名:"薇诺娜的发电机"->默认 制造描述:"要确保电力供应充足"
        	LOWPOWER = "这个小灯越来越暗……",		-- 物品名:"薇诺娜的发电机"->没电了 制造描述:"要确保电力供应充足"
        	OFF = "应该是睡着了",		-- 物品名:"薇诺娜的发电机"->关闭 制造描述:"要确保电力供应充足"
        	BURNING = "不是我弄坏的！！",		-- 物品名:"薇诺娜的发电机"->正在燃烧 制造描述:"要确保电力供应充足"
        	BURNT = "薇诺娜女士应该再造一个了！",		-- 物品名:"薇诺娜的发电机"->烧焦的 制造描述:"要确保电力供应充足"
        },
        WINONA_BATTERY_HIGH = 
        {
        	GENERIC = "它能做什么？",		-- 物品名:"薇诺娜的宝石发电机"->默认 制造描述:"这玩意烧宝石，所以肯定不会差"
        	LOWPOWER = "它看起来累了",		-- 物品名:"薇诺娜的宝石发电机"->没电了 制造描述:"这玩意烧宝石，所以肯定不会差"
        	OFF = "它本应该做点什么吗？",		-- 物品名:"薇诺娜的宝石发电机"->关闭 制造描述:"这玩意烧宝石，所以肯定不会差"
        	BURNING = "它这样正常吗,?",		-- 物品名:"薇诺娜的宝石发电机"->正在燃烧 制造描述:"这玩意烧宝石，所以肯定不会差"
        	BURNT = "哎，算了",		-- 物品名:"薇诺娜的宝石发电机"->烧焦的 制造描述:"这玩意烧宝石，所以肯定不会差"
        },
        COMPOSTWRAP = "（闻）！！",		-- 物品名:"肥料包" 制造描述:"\"草本\"的疗法"
        ARMOR_BRAMBLE = "植物做的！",		-- 物品名:"荆棘外壳" 制造描述:"让大自然告诉你什么叫\"滚开\""
        TRAP_BRAMBLE = "植物陷阱！",		-- 物品名:"荆棘陷阱" 制造描述:"都有机会中招的干\n扰陷阱"
        BOATFRAGMENT03 = "再见了，小船",		-- 物品名:"船碎片"
        BOATFRAGMENT04 = "再见了，小船",		-- 物品名:"船碎片"
        BOATFRAGMENT05 = "再见了，小船",		-- 物品名:"船碎片"
		BOAT_LEAK = "我看不是什么大问题",		-- 物品名:"漏洞"
        MAST = "这是船上用的？",		-- 物品名:"桅杆" 制造描述:"乘风破浪会有时"
        SEASTACK = "噢嗷，大石头！",		-- 物品名:"浮堆"
        FISHINGNET = "能捞起很多鱼",		-- 物品名:"渔网" 制造描述:"就是一张网"
        ANTCHOVIES = "是鱼？还是虫子？",		-- 物品名:"蚁头凤尾鱼"
        STEERINGWHEEL = "现在我是船长！！",		-- 物品名:"方向舵" 制造描述:"航海必备道具"
        ANCHOR = "拴牢船",		-- 物品名:"锚" 制造描述:"船用刹车"
        BOATPATCH = "为什么打补丁？让船进水！",		-- 物品名:"船补丁" 制造描述:"打补丁永远不晚"
        DRIFTWOOD_TREE = 
        {
            BURNING = "热热热！",		-- 物品名:"浮木"->正在燃烧
            BURNT = "没了",		-- 物品名:"浮木"->烧焦的
            CHOPPED = "剁碎！",		-- 物品名:"浮木"->被砍了
            GENERIC = "它溺水了",		-- 物品名:"浮木"->默认
        },
        DRIFTWOOD_LOG = "浮木",		-- 物品名:"浮木桩"
        MOON_TREE = 
        {
            BURNING = "快救救她",		-- 物品名:"月树"->正在燃烧
            BURNT = "广寒之物，",		-- 物品名:"月树"->烧焦的
            CHOPPED = "只剩一根桩子",		-- 物品名:"月树"->被砍了
            GENERIC = "请给我一朵花",		-- 物品名:"月树"->默认
        },
		MOON_TREE_BLOSSOM = "故乡的芬芳",		-- 物品名:"月树花"
        MOONBUTTERFLY = 
        {
        	GENERIC = "月宫上月蛾飞舞，遮蔽长空",		-- 物品名:"月蛾"->默认
        	HELD = "真软……",		-- 物品名:"月蛾"->拿在手里
        },
		MOONBUTTERFLYWINGS = "有点灰尘",		-- 物品名:"月蛾翅膀"
        MOONBUTTERFLY_SAPLING = "月蛾化树，重归人间",		-- 物品名:"月树苗"
        ROCK_AVOCADO_FRUIT = "嗷！太硬了！",		-- 物品名:"石果"
        ROCK_AVOCADO_FRUIT_RIPE = "它准备好了！",		-- 物品名:"成熟石果"
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "做的更好吃了！",		-- 物品名:"熟石果"
        ROCK_AVOCADO_FRUIT_SPROUT = "现在还太小，不能当水果吃",		-- 物品名:"发芽的石果"
        ROCK_AVOCADO_BUSH = 
        {
        	BARREN = "这里没有水果",		-- 物品名:"石果灌木丛"
			WITHERED = "它看起来渴了",		-- 物品名:"石果灌木丛"->枯萎了
			GENERIC = "哈？这些水果看起来像石头一样",		-- 物品名:"石果灌木丛"->默认
			PICKED = "现在长回来了！",		-- 物品名:"石果灌木丛"->被采完了
			DISEASED = "看着病了",		-- 物品名:"石果灌木丛"->生病了
            DISEASING = "它有点问题……",		-- 物品名:"石果灌木丛"->正在生病？？
			BURNING = "火！火！",		-- 物品名:"石果灌木丛"->正在燃烧
		},
        DEAD_SEA_BONES = "可怜的鱼，应该戴在水里的",		-- 物品名:"海骨"
        HOTSPRING = 
        {
        	GENERIC = "让我去泡泡！",		-- 物品名:"温泉"->默认
        	BOMBED = "看起来温暖舒适！",		-- 物品名:"温泉"
        	GLASS = "好漂亮！",		-- 物品名:"温泉"
			EMPTY = "什么都没有！",		-- 物品名:"温泉"
        },
        MOONGLASS = "思念的刀锋！",		-- 物品名:"月亮碎片"
        MOONGLASS_ROCK = "完美似碧玉",		-- 物品名:"月光玻璃"
        BATHBOMB = "现在就想扔！",		-- 物品名:"沐浴球" 制造描述:"春天里来百花香？这点子把地都炸碎了"
        TRAP_STARFISH =
        {
            GENERIC = "想戳一下！",		-- 物品名:"海星"->默认
            CLOSED = "它差点吞了我！",		-- 物品名:"海星"
        },
        DUG_TRAP_STARFISH = "会给你找个好位置，嘿嘿",		-- 物品名:"海星陷阱"
        SPIDER_MOON = 
        {
        	GENERIC = "从来没见过那样的蜘蛛人",		-- 物品名:"破碎蜘蛛"->默认
        	SLEEPING = "嘘...",		-- 物品名:"破碎蜘蛛"->睡着了
        	DEAD = "再见了！",		-- 物品名:"破碎蜘蛛"->死了
        },
        MOONSPIDERDEN = "尤其恶心的蜘蛛人！！",		-- 物品名:"破碎蜘蛛洞"
		FRUITDRAGON =
		{
			GENERIC = "绿色可不是一般人能撑得住的",		-- 物品名:"沙拉蝾螈"->默认
			RIPE = "闻起来像……水果？",		-- 物品名:"沙拉蝾螈"
			SLEEPING = "它在打盹",		-- 物品名:"沙拉蝾螈"->睡着了
		},
        PUFFIN =
        {
            GENERIC = "小胖鸟",		-- 物品名:"海鹦鹉"->默认
            HELD = "抓到它了！！",		-- 物品名:"海鹦鹉"->拿在手里
            SLEEPING = "安睡的小鸟",		-- 物品名:"海鹦鹉"->睡着了
        },
		MOONGLASSAXE = "砍起来外顺手！",		-- 物品名:"月光玻璃斧" 制造描述:"脆弱而有效"
		GLASSCUTTER = "真锋利！",		-- 物品名:"玻璃刀" 制造描述:"尖端武器"
        ICEBERG =
        {
            GENERIC = "小心！",		-- 物品名:"小冰山"->默认
            MELTED = "全融化了！",		-- 物品名:"小冰山"->融化了
        },
        ICEBERG_MELTED = "全融化了！",		-- 物品名:"融化的冰山"
        MINIFLARE = "发亮的火花！",		-- 物品名:"信号" 制造描述:"为你信任的朋友照亮前路"
		MOON_FISSURE = 
		{
			GENERIC = "脑袋感觉怪怪的", 		-- 物品名:"天体裂隙"->默认
			NOLIGHT = "回声！回声！回声声……",		-- 物品名:"天体裂隙"
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "还需要点东西",		-- 物品名:未找到
            GENERIC = "需要帮忙吗？",		-- 物品名:未找到
        },
        MOON_ALTAR_IDOL = "你想去哪？",		-- 物品名:"天体祭坛雕像"
        MOON_ALTAR_GLASS = "它在那里看起来很悲伤",		-- 物品名:"天体祭坛底座"
        MOON_ALTAR_SEED = "你该回家了",		-- 物品名:"天体祭坛宝球"
        MOON_ALTAR_ROCK_IDOL = "你好？",		-- 物品名:"在呼唤我"
        MOON_ALTAR_ROCK_GLASS = "你好？",		-- 物品名:"在呼唤我"
        MOON_ALTAR_ROCK_SEED = "你好？",		-- 物品名:"在呼唤我"
        SEAFARING_PROTOTYPER =
        {
            GENERIC = "能做水里用的东西！",		-- 物品名:"智囊团"->默认 制造描述:"海上科学"
            BURNT = "这种事好像经常发生……",		-- 物品名:"智囊团"->烧焦的 制造描述:"海上科学"
        },
        BOAT_ITEM = "能在大池塘上穿行！",		-- 物品名:"船套装" 制造描述:"让大海成为你的领地"
        STEERINGWHEEL_ITEM = "这是船上的？",		-- 物品名:"方向舵套装" 制造描述:"航海必备道具"
        ANCHOR_ITEM = "能做拴住船的东西！",		-- 物品名:"锚套装" 制造描述:"船用刹车"
        MAST_ITEM = "船具的半成品",		-- 物品名:"桅杆套装" 制造描述:"乘风破浪会有时"
        MUTATEDHOUND = 
        {
        	DEAD = "再见了，小狗",		-- 物品名:"恐怖猎犬"->死了
        	GENERIC = "看着病了？",		-- 物品名:"恐怖猎犬"->默认
        	SLEEPING = "别吵醒它",		-- 物品名:"恐怖猎犬"->睡着了
        },
        MUTATED_PENGUIN = 
        {
			DEAD = "这样更好",		-- 物品名:"月石企鸥"->死了
			GENERIC = "，能看到它的内脏！",		-- 物品名:"月石企鸥"->默认
			SLEEPING = "安安，吓人的小鸟",		-- 物品名:"月石企鸥"->睡着了
		},
        CARRAT = 
        {
        	DEAD = "不动了",		-- 物品名:"胡萝卜"->死了 制造描述:"灵巧机敏，富含胡萝卜素"
        	GENERIC = "那是什么？",		-- 物品名:"胡萝卜"->默认 制造描述:"灵巧机敏，富含胡萝卜素"
        	HELD = "食物还是宠物？",		-- 物品名:"胡萝卜"->拿在手里 制造描述:"灵巧机敏，富含胡萝卜素"
        	SLEEPING = "它正酣睡",		-- 物品名:"胡萝卜"->睡着了 制造描述:"灵巧机敏，富含胡萝卜素"
        },
		BULLKELP_PLANT = 
        {
            GENERIC = "水里长的小吃！",		-- 物品名:"公牛海带"->默认
            PICKED = "一会还会长回来",		-- 物品名:"公牛海带"->被采完了
        },
		BULLKELP_ROOT = "多种点水里长的小吃！",		-- 物品名:"公牛海带茎"
        KELPHAT = "我宁愿吃掉也不想戴着",		-- 物品名:"海花冠" 制造描述:"让人神经焦虑的东西"
		KELP = "海里的小吃！",		-- 物品名:"海带叶"
		KELP_COOKED = "嗯，黏黏的！",		-- 物品名:"熟海带叶"
		KELP_DRIED = "咸薄脆",		-- 物品名:"干海带叶"
		GESTALT = "他们想讲故事",		-- 物品名:"虚空之影"
		COOKIECUTTER = "看着挺友好",		-- 物品名:"饼干切割机"
		COOKIECUTTERSHELL = "哈哈！现在是我的了！",		-- 物品名:"饼干切割机壳"
		COOKIECUTTERHAT = "是个好的尖刺帽子！",		-- 物品名:"饼干切割机帽子" 制造描述:"穿着必须犀利"
		SALTSTACK =
		{
			GENERIC = "奇怪的石头",		-- 物品名:"盐堆"->默认
			MINED_OUT = "没什么能拿的了",		-- 物品名:"盐堆"
			GROWING = "它正在生长！",		-- 物品名:"盐堆"->正在生长
		},
		SALTROCK = "奇怪的石头",		-- 物品名:"盐晶"
		SALTBOX = "很适合藏好吃的东西",		-- 物品名:"盐盒" 制造描述:"用盐来储存食物"
		TACKLESTATION = "不能这样对待鱼!",		-- 物品名:"钓具容器" 制造描述:"传统的用饵钓鱼"
		TACKLESKETCH = "噢，图片！",		-- 物品名:"{item}广告"
        MALBATROSS = "坏鸟！",		-- 物品名:"邪天翁"
        MALBATROSS_FEATHER = "偷坏鸟的！",		-- 物品名:"邪天翁羽毛"
        MALBATROSS_BEAK = "尖叫！尖叫！嘿嘿……",		-- 物品名:"邪天翁喙"
        MAST_MALBATROSS_ITEM = "鸟帆！",		-- 物品名:"飞翼风帆套装" 制造描述:"像海鸟一样航向深蓝"
        MAST_MALBATROSS = "能让船飞吗？不行？嗷……",		-- 物品名:"飞翼风帆" 制造描述:"像海鸟一样航向深蓝"
		MALBATROSS_FEATHERED_WEAVE = "鸟做的！",		-- 物品名:"羽毛帆布" 制造描述:"精美的羽毛布料"
        GNARWAIL =
        {
            GENERIC = "你这条怪模怪样的鱼",		-- 物品名:"一角鲸"->默认
            BROKENHORN = "角破了也没那么糟了！",		-- 物品名:"一角鲸"
            FOLLOWER = "我们现在是朋友了！",		-- 物品名:"一角鲸"->追随者
            BROKENHORN_FOLLOWER = "角破了也没那么糟了！",		-- 物品名:"一角鲸"
        },
        GNARWAIL_HORN = "哈哈！现在是我的了！",		-- 物品名:"一角鲸的角"
        WALKINGPLANK = "跳跳板！",		-- 物品名:"木板"
        OAR = "能让小船走！",		-- 物品名:"桨" 制造描述:"划，划，划小船"
		OAR_DRIFTWOOD = "能让小船走！",		-- 物品名:"浮木桨" 制造描述:"小桨要用浮木造？"
		OCEANFISHINGROD = "要从大海里抓鱼了！",		-- 物品名:"海钓竿" 制造描述:"像职业选手一样钓鱼吧"
		OCEANFISHINGBOBBER_NONE = "缺点东西……",		-- 物品名:"鱼钩"
        OCEANFISHINGBOBBER_BALL = "浮标在浮！",		-- 物品名:"木球浮标" 制造描述:"经典设计，初学者和职业钓手两相宜"
        OCEANFISHINGBOBBER_OVAL = "浮标在浮！",		-- 物品名:"硬物浮标" 制造描述:"在经典浮标的基础上融入了时尚设计"
		OCEANFISHINGBOBBER_CROW = "羽毛在浮！",		-- 物品名:"黑羽浮标" 制造描述:"深受职业钓手的喜爱"
		OCEANFISHINGBOBBER_ROBIN = "羽毛在浮！",		-- 物品名:"红羽浮标" 制造描述:"深受职业钓手的喜爱"
		OCEANFISHINGBOBBER_ROBIN_WINTER = "羽毛在浮！",		-- 物品名:"蔚蓝羽浮标" 制造描述:"深受职业钓手的喜爱"
		OCEANFISHINGBOBBER_CANARY = "羽毛在浮！",		-- 物品名:"番红花羽浮标" 制造描述:"深受职业钓手的喜爱"
		OCEANFISHINGBOBBER_GOOSE = "大羽毛在浮！",		-- 物品名:"鹅羽浮标" 制造描述:"高级羽绒浮标"
		OCEANFISHINGBOBBER_MALBATROSS = "大羽毛在浮！",		-- 物品名:"邪天翁羽浮标" 制造描述:"高级巨鸟浮标"
		OCEANFISHINGLURE_SPINNER_RED = "不会伤到鱼，对吧？",		-- 物品名:"日出旋转亮片" 制造描述:"早起的鱼儿有虫吃"
		OCEANFISHINGLURE_SPINNER_GREEN = "不会伤到鱼，对吧？",		-- 物品名:"黄昏旋转亮片" 制造描述:"低光照环境里效果最好"
		OCEANFISHINGLURE_SPINNER_BLUE = "不会伤到鱼，对吧？",		-- 物品名:"夜飞侠旋转亮片" 制造描述:"适用于夜间垂钓"
		OCEANFISHINGLURE_SPOON_RED = "不会伤到鱼，对吧？",		-- 物品名:"日出匙型假饵" 制造描述:"早起的鱼儿有虫吃"
		OCEANFISHINGLURE_SPOON_GREEN = "不会伤到鱼，对吧？",		-- 物品名:"黄昏匙型假饵" 制造描述:"在夕阳中继续垂钓"
		OCEANFISHINGLURE_SPOON_BLUE = "不会伤到鱼，对吧？",		-- 物品名:"匙型假饵" 制造描述:"适用于夜间垂钓"
		OCEANFISH_SMALL_1 = "嗷，真小！",		-- 物品名:"小孔雀鱼"
		OCEANFISH_SMALL_2 = "当我的新宠物哇！会喂你、疼你",		-- 物品名:"针鼻喷墨鱼"
		OCEANFISH_SMALL_3 = "嗨小鱼儿！",		-- 物品名:"小饵鱼"
		OCEANFISH_SMALL_4 = "小鱼宝宝！",		-- 物品名:"三文鱼苗"
		OCEANFISH_SMALL_5 = "嘿嘿，看着有点傻！",		-- 物品名:"爆米花鱼"
		OCEANFISH_MEDIUM_1 = "好粘糊！",		-- 物品名:"泥鱼"
		OCEANFISH_MEDIUM_2 = "又大又美的眼睛！",		-- 物品名:"斑鱼"
		OCEANFISH_MEDIUM_3 = "头上戴了个刺刺的皇冠！",		-- 物品名:"浮夸狮子鱼"
		OCEANFISH_MEDIUM_4 = "你当我的新宠物好吗？",		-- 物品名:"黑鲶鱼"
		OCEANFISH_MEDIUM_5 = "感觉……有点怪啊",		-- 物品名:"玉米鳕鱼"
		OCEANFISH_MEDIUM_6 = "你真美",		-- 物品名:"花锦鲤"
		OCEANFISH_MEDIUM_7 = "喜欢你的鳞片！",		-- 物品名:"金锦鲤"
		PONDFISH = "啊，太可爱了！",		-- 物品名:"淡水鱼"
		PONDEEL = "你好长鱼！",		-- 物品名:"鳗鱼"
        FISHMEAT = "不！！",		-- 物品名:"生鱼肉"
        FISHMEAT_COOKED = "我就不吃！",		-- 物品名:"鱼排"
        FISHMEAT_SMALL = "它曾是个孩子……",		-- 物品名:"小鱼块"
        FISHMEAT_SMALL_COOKED = "谁会做这种事！",		-- 物品名:"烤小鱼块"
		SPOILED_FISH = "有人没有照顾好宠物鱼！",		-- 物品名:"变质的鱼"
		FISH_BOX = "他就把宠物鱼放这儿啊？",		-- 物品名:"锡鱼桶" 制造描述:"保持鱼与网捕之日一样新鲜"
        POCKET_SCALE = "古怪的测量设备",		-- 物品名:"弹簧秤" 制造描述:"随时称鱼的重量！"
		TROPHYSCALE_FISH =
		{
			GENERIC = "这是鱼类的好家园",		-- 物品名:"鱼类计重器"->默认 制造描述:"炫耀你的斩获"
			HAS_ITEM = "重量: {weight}\n捕获人: {owner}",		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获"
			BURNING = "啊啊啊！不不不！",		-- 物品名:"鱼类计重器"->正在燃烧 制造描述:"炫耀你的斩获"
			BURNT = "(闻) 可怜的鱼房子……",		-- 物品名:"鱼类计重器"->烧焦的 制造描述:"炫耀你的斩获"
			OWNER = "重量: {weight}\n捕获人: {owner}\n嘿嘿我的鱼儿最棒",		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获"
		},
		OCEANFISHABLEFLOTSAM = "噢！找到泥巴了！",		-- 物品名:"海洋残骸"
		CALIFORNIAROLL = "等等……里面有鱼！",		-- 物品名:"加州卷"
		SEAFOODGUMBO = "鱼在里面看起来好悲伤……",		-- 物品名:"海鲜浓汤"
		SURFNTURF = "啵！不想吃！",		-- 物品名:"海鲜大排档"
		GHOSTLYELIXIR_SLOWREGEN = "噢！我也想做些手工,",		-- 物品名:"亡者补药" 制造描述:"时间会抚平所有伤口"
		GHOSTLYELIXIR_FASTREGEN = "噢！我也想做些手工,",		-- 物品名:"灵魂万灵药" 制造描述:"治疗重伤的强力药剂"
		GHOSTLYELIXIR_SHIELD = "噢！我也想做些手工,",		-- 物品名:"不屈药剂" 制造描述:"保护你的姐妹不受伤害"
		GHOSTLYELIXIR_ATTACK = "噢！我也想做些手工,",		-- 物品名:"易怒药水" 制造描述:"重燃阿比盖尔的战斗精神"
		GHOSTLYELIXIR_SPEED = "噢！我也想做些手工,",		-- 物品名:"强健精油" 制造描述:"给你的灵魂来一剂强心针"
		GHOSTLYELIXIR_RETALIATION = "噢！我也想做些手工,",		-- 物品名:"蒸馏复仇" 制造描述:"对敌人以牙还牙"
		SISTURN =
		{
			GENERIC = "罐子里有什么？",		-- 物品名:"姐妹骨灰罐"->默认 制造描述:"让你疲倦的灵魂休息的地方"
			SOME_FLOWERS = "她喜欢把东西放在这",		-- 物品名:"姐妹骨灰罐" 制造描述:"让你疲倦的灵魂休息的地方"
			LOTS_OF_FLOWERS = "原来不是……？",		-- 物品名:"姐妹骨灰罐" 制造描述:"让你疲倦的灵魂休息的地方"
		},
        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "把食物放里面就会新不一样的吃的出来？",		-- 物品名:"便携烹饪锅"->默认 制造描述:"随时随地为美食家服务"
            DONE = "哇！",		-- 物品名:"便携烹饪锅"->完成了 制造描述:"随时随地为美食家服务"
			COOKING_LONG = "这个要好久！",		-- 物品名:"便携烹饪锅"->饭还需要很久 制造描述:"随时随地为美食家服务"
			COOKING_SHORT = "食物！食物！食物！",		-- 物品名:"便携烹饪锅"->饭快做好了 制造描述:"随时随地为美食家服务"
			EMPTY = "哈？里面什么都没有！",		-- 物品名:"便携烹饪锅" 制造描述:"随时随地为美食家服务"
        },
        PORTABLEBLENDER_ITEM = "摇摇晃晃！",		-- 物品名:"便携研磨器" 制造描述:"把原料研磨成粉状调味品"
        PORTABLESPICER_ITEM =
        {
            GENERIC = "能给食物撒上风味！",		-- 物品名:"便携香料站"->默认 制造描述:"调味让饭菜更可口"
            DONE = "全做完了！",		-- 物品名:"便携香料站"->完成了 制造描述:"调味让饭菜更可口"
        },
        SPICEPACK = "里面放食物的！",		-- 物品名:"厨师袋" 制造描述:"使你的食物保持新鲜"
        SPICE_GARLIC = "唔能让口气变得清新",		-- 物品名:"蒜粉" 制造描述:"用口臭防守是最好的进攻"
        SPICE_SUGAR = "好吃！！",		-- 物品名:"蜂蜜水晶" 制造描述:"令人心平气和的甜美"
        SPICE_CHILI = "辣的小东西！",		-- 物品名:"辣椒面" 制造描述:"刺激十足的粉末"
        SPICE_SALT = "这种沙子真好吃！",		-- 物品名:"调味盐" 制造描述:"为你的饭菜加点咸味"
        MONSTERTARTARE = "光名字起的好没用",		-- 物品名:"怪物鞑靼"
        FRESHFRUITCREPES = "精致的水果煎饼！",		-- 物品名:"鲜果可丽饼"
        FROGFISHBOWL = "……",		-- 物品名:"蓝带鱼排"
        POTATOTORNADO = "嘿嘿，旋转的土豆！",		-- 物品名:"花式回旋块茎"
        DRAGONCHILISALAD = "呣呣，谢谢你，高级厨师！",		-- 物品名:"辣龙椒沙拉"
        GLOWBERRYMOUSSE = "噢，它在发光！！",		-- 物品名:"发光蓝莓慕斯"
        VOLTGOATJELLY = "嗷，它晃来晃去！",		-- 物品名:"闪电羊肉冻"
        NIGHTMAREPIE = "嘿嘿，它有张好玩的脸",		-- 物品名:"恐怖国王饼"
        BONESOUP = "不想要",		-- 物品名:"骨头汤"
        MASHEDPOTATOES = "软软的土豆泥！",		-- 物品名:"奶油土豆泥"
        POTATOSOUFFLE = "啥？这是土豆！！",		-- 物品名:"蓬松土豆酥"
        MOQUECA = "里面有鱼！",		-- 物品名:"海鲜杂烩"
        GAZPACHO = "好粘糊！",		-- 物品名:"芦笋冷汤"
        ASPARAGUSSOUP = "唔...",		-- 物品名:"芦笋汤"
        VEGSTINGER = "精致的辣汁！",		-- 物品名:"辛辣鸡尾酒"
        BANANAPOP = "水果在棍子上味道更好！",		-- 物品名:"香蕉冻"
        CEVICHE = "啵不要-不要",		-- 物品名:"酸橘汁腌鱼"
        SALSA = "麻辣蔬菜糊！",		-- 物品名:"生鲜萨尔萨酱"
        PEPPERPOPPER = "根本没有 \"爆\", 只有辣而已！",		-- 物品名:"爆炒填馅辣椒"
        TURNIP = "脆脆的小吃！",		-- 物品名:"大萝卜"
        TURNIP_COOKED = "烤的真香！",		-- 物品名:"烤大萝卜"
        TURNIP_SEEDS = "能种出更多的萝卜！",		-- 物品名:"萝卜籽"
        GARLIC = "能让口气变得清新",		-- 物品名:"大蒜"
        GARLIC_COOKED = "呣……辛辣发臭的小吃！",		-- 物品名:"烤大蒜"
        GARLIC_SEEDS = "能种出更多的大蒜！",		-- 物品名:"蒜籽"
        ONION = "呣-呣呣，嘎嘣脆!",		-- 物品名:"洋葱"
        ONION_COOKED = "真香！",		-- 物品名:"烤洋葱"
        ONION_SEEDS = "洋葱宝宝",		-- 物品名:"洋葱籽"
        POTATO = "好吃的土里的蔬菜",		-- 物品名:"土豆"
        POTATO_COOKED = "呣，热土豆！",		-- 物品名:"烤土豆"
        POTATO_SEEDS = "埋在地里，多种点土豆！",		-- 物品名:"土豆籽"
        TOMATO = "又大又水的番茄！",		-- 物品名:"番茄"
        TOMATO_COOKED = "黏乎乎的",		-- 物品名:"烤番茄"
        TOMATO_SEEDS = "能种出更多的番茄！",		-- 物品名:"番茄跟籽"
        ASPARAGUS = "小吃棒!", 		-- 物品名:"芦笋"
        ASPARAGUS_COOKED = "热的小吃棒！",		-- 物品名:"烤芦笋"
        ASPARAGUS_SEEDS = "能长出更多的小吃！",		-- 物品名:"芦笋种子"
        PEPPER = "辣！嘴巴着火了！",		-- 物品名:"辣椒"
        PEPPER_COOKED = "为什么要把辣椒做的更辣？",		-- 物品名:"烤辣椒"
        PEPPER_SEEDS = "能种出更多的辣椒！",		-- 物品名:"辣椒籽"
        WEREITEM_BEAVER = "它的肚子在往外淌东西",		-- 物品名:"俗气海狸像" 制造描述:"唤醒海狸人的诅咒"
        WEREITEM_GOOSE = "想跟玩偶玩！",		-- 物品名:"俗气鹅像" 制造描述:"唤醒鹅人的诅咒"
        WEREITEM_MOOSE = "薇克女士说吃东西的时候要把嘴巴闭上",		-- 物品名:"俗气鹿像" 制造描述:"唤醒鹿人的诅咒"
        MERMHAT = "能让他扮成友好的鱼人！",		-- 物品名:"聪明的伪装" 制造描述:"鱼人化你的朋友"
        MERMTHRONE =
        {
            GENERIC = "鱼人王的宝座！",		-- 物品名:"皇家地毯"->默认
            BURNT = "谁干的？！",		-- 物品名:"皇家地毯"->烧焦的
        },        
        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "童话里很多国王……好像很容易做！",		-- 物品名:"皇家手工套装"->默认 制造描述:"建立一个新的鱼人王朝"
            BURNT = "不不不！！",		-- 物品名:"皇家手工套装"->烧焦的 制造描述:"建立一个新的鱼人王朝"
        },        
        MERMHOUSE_CRAFTED = 
        {
            GENERIC = "我也想有一栋房子！",		-- 物品名:"鱼人工艺屋"->默认 制造描述:"适合鱼人的家"
            BURNT = "为什么！？",		-- 物品名:"鱼人工艺屋"->烧焦的 制造描述:"适合鱼人的家"
        },
        MERMWATCHTOWER_REGULAR = "需要皇家卫士守护新国王！",		-- 物品名:"鱼人工艺屋" 制造描述:"适合鱼人的家"
        MERMWATCHTOWER_NOKING = "皇家护卫缺了国王……",		-- 物品名:"鱼人工艺屋" 制造描述:"适合鱼人的家"
        MERMKING = "耶！你看起来就像童话里的国王！",		-- 物品名:"鱼人之王"
        MERMGUARD = "我有天也会像他们一样长大变强！",		-- 物品名:"忠诚鱼人守卫"
        MERM_PRINCE = "要当皇帝先得胖起来",		-- 物品名:"过程中的皇室"
        SQUID = "站住别动，小鱿鱼！",		-- 物品名:"鱿鱼"
		GHOSTFLOWER = "真可怕！",		-- 物品名:"哀悼荣耀"
        SMALLGHOST = "普！你-你吓不倒我！",		-- 物品名:"小惊吓"
    },
    DESCRIBE_GENERIC = "那是什么？",		--检查物品描述的缺省值
    DESCRIBE_TOODARK = "好黑，好黑",		--天太黑
    DESCRIBE_SMOLDERING = "有东西在闷烧……",		--冒烟
    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "啵，谁会想吃那个？",		--吃孵化的高脚鸟蛋
		WINTERSFEASTFUEL = "呣，好甜！",		--暂无注释
    },
}
