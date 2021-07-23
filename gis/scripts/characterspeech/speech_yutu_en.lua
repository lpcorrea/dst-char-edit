return
{
	ACTIONFAIL =
	{
        REPAIR =
        {
            WRONGPIECE = "Doesn't look creepy at all?",		--化石骨架拼接错误
        },
        BUILD =
        {
            MOUNTED = "Ummm...Yutu gotta grow longer hands!",		--建造失败（骑乘状态）
            HASPET = "One is good~",		--建造失败（已经有一个宠物了）
        },
		SHAVE =
		{
			AWAKEBEEFALO = "Beefalo-lo doesn't let me!",		--给醒着的牛刮毛
			GENERIC = "Ouch~Cut my fingers~",		--刮牛毛失败
			NOBITS = "Don't be a greedy rabbit!",		--给没毛的牛刮毛
		},
		STORE =
		{
			GENERIC = "No room left...Sorry!",		--存放东西失败
			NOTALLOWED = "Why am I not permitted???",		--存放东西--不被允许
			INUSE = "Good rabbit stands in quene, right?",		--别人正在用箱子
            NOTMASTERCHEF = "Let the gaudy cook finish the work.",		--暂无注释
		},
        CONSTRUCT =
        {
            INUSE = "Gotta wait a bit...",		--建筑正在使用
            NOTALLOWED = "Why am I not allowed?",		--建筑不允许使用
            EMPTY = "Gotta find food for this little rabbit!",		--建筑空了
            MISMATCH = "Wrong?",		--升级套件错误（目前用不到）
        },
		RUMMAGE =
		{	
			GENERIC = "Nonono...",		--打开箱子失败
			INUSE = "Find a big caroot?",		--打开箱子 正在使用
            NOTMASTERCHEF = "Let the gaudy cook finish the job",		--暂无注释
		},
		UNLOCK =
        {
        },
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "Opps! Wrong key!",		--使用克劳斯钥匙
        	KLAUS = "Not at the right moment!",		--克劳斯
        },
		ACTIVATE = 
		{
			LOCKED_GATE = "I wanna get in also!",		--远古钥匙
		},
        COOK =
        {
            GENERIC = "Rabbit hates cooking!",		--做饭失败
            INUSE = "Wow~ Smells so good!!!",		--做饭失败-别人在用锅
            TOOFAR = "You want me to cook with magic?",		--做饭失败-太远
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "Don't start! Gotta find a fresh veggie first.",		--暂无注释
        },
        FISH_OCEAN =
		{
			TOODEEP = "Come closer, you fingerling!",		--暂无注释
		},
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "Tis too much for a pond!",		--暂无注释
		},
        GIVE =
        {
            GENERIC = "Oh? You don't want this?",		--给予失败
            DEAD = "How much I wish you can use this!",		--给予 -目标死亡
            SLEEPING = "Get up get up! Got gifts for you!",		--给予--目标睡觉
            BUSY = "Too busy to even take a gift?",		--给予--目标正忙
            ABIGAILHEART = "Oh sorry! Better stay with Wendy this way.",		--给阿比盖尔 救赎之心
            GHOSTHEART = "Emmm...I don't think so...",		--给鬼魂 救赎之心
            NOTGEM = "Nope!",		--给的不是宝石
            WRONGGEM = "A donkey with a rabbit tail?",		--给错了宝石
            NOTSTAFF = "Need a staff, a true staff!",		--给月石祭坛的物品不是法杖
            MUSHROOMFARM_NEEDSSHROOM = "Gotta find a colorful mushroom!",		--蘑菇农场需要蘑菇
            MUSHROOMFARM_NEEDSLOG = "Gotta find a screaming log!",		--蘑菇农场需要活木
            SLOTFULL = "Got something already!",		--已经放了材料后，再给雕像桌子再给一个材料
            FOODFULL = "Something boiling!",		--没调用
            NOTDISH = "Boo!",		--没调用
            DUPLICATE = "Yay she learnt that before!",		--给雕像桌子已经学习过的图纸
            NOTSCULPTABLE = "She doesn't like it!",		--给陶艺圆盘的东西不对
            NOTATRIUMKEY = "She looks disapproving.",		--中庭钥匙不对
            CANTSHADOWREVIVE = "Not yet? All right...",		--中庭仍在CD
            WRONGSHADOWFORM = "That looks abnormal?",		--没调用
            NOMOON = "Without the moon's power it won't work!",		--洞穴里建造月石科技
			PIGKINGGAME_MESSY = "Gotta clean up a little bit first!",		--猪王旁边有建筑，不能开始抢元宝
			PIGKINGGAME_DANGER = "No! Too dangerous for game!",		--危险，不能开始抢元宝
			PIGKINGGAME_TOOLATE = "Too late! Let's play tomorrow!",		--不是白天，不能开始抢元宝
        },
        GIVETOPLAYER =
        {
            FULL = "Oh? You don't want this?",		--给玩家一个东西 -但是背包满了
            DEAD = "How much I wish you can use this!",		--给死亡的玩家一个东西
            SLEEPING = "Get up get up! Got gifts for you!",		--给睡觉的玩家一个东西
            BUSY = "Come get this!",		--给忙碌的玩家一个东西
        },
        GIVEALLTOPLAYER =
        {
            FULL = "Oh? You don't want this?",		--给人一组东西 但是背包满了
            DEAD = "How much I wish you can use this!",		--给于死去的玩家一组物品
            SLEEPING = "Get up get up! Got gifts for you!",		--给于正在睡觉的玩家一组物品
            BUSY = "Come get this!",		--给于正在忙碌的玩家一组物品
        },
        WRITE =
        {
            GENERIC = "Can anyone remind me how to write?",		--鞋子失败
            INUSE = "Let me do it the next!",		--写字 正在使用中
        },
        DRAW =
        {
            NOIMAGE = "I forgot what to draw...A carrot?",		--画图缺乏图像
        },
        CHANGEIN =
        {
            GENERIC = "Rabbits don't like it.",		--换装失败 
            BURNING = "Help me! Fire!",		--换装失败-着火了
            INUSE = "In Moon Palace, everyone got their own wardrobe...",		--衣橱有人占用
        },
        ATTUNE =
        {
            NOHEALTH = "I am a feeble rabbit now...",		--制造肉雕像血量不足
        },
        MOUNT =
        {
            TARGETINCOMBAT = "She looks like an angry rabbit!",		--骑乘，牛正在战斗
            INUSE = "Why? Can't you share with a rabbit?",		--骑乘（牛被占据）
        },
        SADDLE =
        {
            TARGETINCOMBAT = "She's in bad mood now!",		--给战斗状态的牛上鞍
        },
        TEACH =
        {
            KNOWN = "I am an erudite rabbit of this!",		--学习已经知道的蓝图
            CANTLEARN = "Too difficult! My little head hurts!",		--学习无法学习的蓝图
            WRONGWORLD = "Don't fool rabbits, you poor map!",		--学习另外一个世界的地图
        },
        WRAPBUNDLE =
        {
            EMPTY = "Nothing in there?",		--打包纸是空的
        },
        PICKUP =
        {
			RESTRICTION = "Don't like it...",		--熔炉模式下捡起错误的武器
			INUSE = "Gotta wait.",		--捡起已经打开的容器
            NOTMINE_YOTC =
            {
                "It doesn't move!",		--暂无注释
                "You got a Mama already?",		--暂无注释
            },
        },
        SLAUGHTER =
        {
            TOOFAR = "Come back here!",		--屠杀？？ 因为太远而失败
        },
        REPLATE =
        {
            MISMATCH = "She can't hold it!", 		--暴食-换盘子换错了 比如用碗换碟子
            SAMEDISH = "She has it already!", 		--暴食-换盘子已经换了
        },
        SAIL =
        {
        	REPAIR = "Huh, good enough!",		--暂无注释
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "Why can't I just fly!",		--暂无注释
            BAD_TIMING1 = "My arms aches...",		--暂无注释
            BAD_TIMING2 = "Anyhow I am a fairy hare!",		--暂无注释
        },
        LOWER_SAIL_FAIL =
        {
            "Ouch!",		--暂无注释
            "Opps!",		--暂无注释
            "Nonono...",		--暂无注释
        },
        BATHBOMB =
        {
            GLASSED = "Too hard a water!",		--暂无注释
            ALREADY_BOMBED = "Ok! Hot enough!",		--暂无注释
        },
		GIVE_TACKLESKETCH =
		{
			DUPLICATE = "Hee-hee! I know it all along!",		--暂无注释
		},
		COMPARE_WEIGHABLE =
		{
			TOO_SMALL = "It's just a fingerling!",		--暂无注释
		},
        BEGIN_QUEST =
        {
            ONEGHOST = "only_used_by_wendy",		--暂无注释
        },
	},
	ACTIONFAIL_GENERIC = "Can't do it...",		--动作失败
	ANNOUNCE_BOAT_LEAK = "No! The ship gets wetter!",		--暂无注释
	ANNOUNCE_BOAT_SINK = "Probably it's too wet now...",		--暂无注释
	ANNOUNCE_DIG_DISEASE_WARNING = "Hmmm looks better now!",		--挖起生病的植物
	ANNOUNCE_PICK_DISEASE_WARNING = "Ah it stinks!",		--（植物生病）
	ANNOUNCE_ADVENTUREFAIL = "Ah I messed up...",		--没调用（废案）
    ANNOUNCE_MOUNT_LOWHEALTH = "The hairy big guy is wounded so badly!",		--牛血量过低
	ANNOUNCE_BEES = "Sorry! I just want a little honey!",		--戴养蜂帽被蜜蜂蛰
	ANNOUNCE_BOOMERANG = "Huhuhu~ There it flies!",		--回旋镖
	ANNOUNCE_CHARLIE = "Help me Chang'e sis!",		--查理即将攻击
	ANNOUNCE_CHARLIE_ATTACK = "Hem! If only the moon is dimmer tonight!",		--被查理攻击
	ANNOUNCE_COLD = "I shouldn't've shed my cony hair!",		--过冷
	ANNOUNCE_HOT = "I don't want to be a fried coney!!!",		--过热
	ANNOUNCE_CRAFTING_FAIL = "No! I need something else!",		--没调用
	ANNOUNCE_DEERCLOPS = "Sinister besieging!",		--boss来袭
	ANNOUNCE_CAVEIN = "Rocks falling!!!",		--要地震了？？？
	ANNOUNCE_ANTLION_SINKHOLE = 
	{
		"The land looks lazy...",		--蚁狮地震
		"Why is the ground trembling?!",		--蚁狮地震
		"I gotta ask the rabbits to find the source!",		--蚁狮地震
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "Take this and bahave!",		--向蚁狮致敬
        "Now you have this.",		--给蚁狮上供
        "Fairy will punish you sooner or later!",		--给蚁狮上供
	},
	ANNOUNCE_SACREDCHEST_YES = "Woo-hoo! Yeah!",		--远古宝箱物品正确给出蓝图
	ANNOUNCE_SACREDCHEST_NO = "Abominable chest!",		--远古宝箱
    ANNOUNCE_DUSK = "Mr.Sun is about to sleep.",		--进入黄昏
	ANNOUNCE_EAT =
	{
		GENERIC = "Umm~!",		--吃东西
		PAINFUL = "My stomache hurts!",		--吃怪物肉
		SPOILED = "What! Eat this?!",		--吃腐烂食物
		STALE = "Taste weird...",		--吃黄色食物
		INVALID = "Fairy NEVER eats this!!",		--拒吃
        YUCKY = "Chang'e sis never lets me have such bad food~",		--吃红色食物
    },
    ANNOUNCE_ENCUMBERED =
    {
        "Ho~",		--搬运雕像、可疑的大理石
        "Exhausted...",		--搬运雕像、可疑的大理石
        "Don't want this...",		--搬运雕像、可疑的大理石
        "Fairies...hates....weights......",		--搬运雕像、可疑的大理石
        "Not...willing...",		--搬运雕像、可疑的大理石
        "(Groaning)",		--搬运雕像、可疑的大理石
        "/(ㄒoㄒ)/~~",		--搬运雕像、可疑的大理石
        "Can...anybody...give a hand....",		--搬运雕像、可疑的大理石
        "Ouch! My waist!",		--搬运雕像、可疑的大理石
    },
    ANNOUNCE_ATRIUM_DESTABILIZING = 
    {
		"This world is shaking!",		--中庭击杀boss后即将刷新
		"Something wrong happened!",		--中庭震动
		"Let's slip away!",		--中庭击杀boss后即将刷新
	},
    ANNOUNCE_RUINS_RESET = "Here comes a Samsara",		--地下重置
    ANNOUNCE_SNARED = "No! Let me out!",		--远古嘤嘤怪的骨笼
    ANNOUNCE_REPELLED = "He grows a turtle shell!",		--嘤嘤怪保护状态
	ANNOUNCE_ENTER_DARK = "The night holds me with her hands!",		--进入黑暗
	ANNOUNCE_ENTER_LIGHT = "There's always light on the Moon.",		--进入光源
	ANNOUNCE_FREEDOM = "Catch you later!",		--没调用（废案）
	ANNOUNCE_HIGHRESEARCH = "Feel like I am so so smart!",		--没调用（废案）
	ANNOUNCE_HOUNDS = "I, I, I will kick the dogs' ass...maybe.",		--猎犬将至
	ANNOUNCE_WORMS = "Gross worms are about to come out!",		--蠕虫袭击
	ANNOUNCE_HUNGRY = "I wanna eat 800 big carrots!",		--饥饿
	ANNOUNCE_HUNT_BEAST_NEARBY = "Finally some rewards after hard work!",		--即将找到野兽
	ANNOUNCE_HUNT_LOST_TRAIL = "The butterfly flies out of sight...",		--猎物（大象脚印丢失）
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "No! Water blurs my way to carrots!",		--大猎物丢失踪迹
	ANNOUNCE_INV_FULL = "Ain't got enough pockets.",		--身上的物品满了
	ANNOUNCE_KNOCKEDOUT = "Ah my head...",		--被催眠
	ANNOUNCE_LOWRESEARCH = "Still can't understand...",		--没调用（废案）
	ANNOUNCE_MOSQUITOS = "Leave me alone! Worms!",		--没调用
    ANNOUNCE_NOWARDROBEONFIRE = "Noooooo!",		--橱柜着火
    ANNOUNCE_NODANGERGIFT = "I'm afraid monsters will rob my gifts.",		--周围有危险的情况下打开礼物
    ANNOUNCE_NOMOUNTEDGIFT = "Gotta get down first.",		--骑牛的时候打开礼物
	ANNOUNCE_NODANGERSLEEP = "How can I sleep now!",		--危险，不能睡觉
	ANNOUNCE_NODAYSLEEP = "Broad day light stares my eyes!",		--白天睡帐篷
	ANNOUNCE_NODAYSLEEP_CAVE = "Rabbit ain't sleepy yet.",		--洞穴里白天睡帐篷
	ANNOUNCE_NOHUNGERSLEEP = "My stomach is rumbling.",		--饿了无法睡觉
	ANNOUNCE_NOSLEEPONFIRE = "I don't wanna eat myself in dream!",		--营帐着火无法睡觉
	ANNOUNCE_NODANGERSIESTA = "Are you serious?",		--危险，不能午睡
	ANNOUNCE_NONIGHTSIESTA = "I don't wanna chill now.",		--夜晚睡凉棚
	ANNOUNCE_NONIGHTSIESTA_CAVE = "It's too scary here!",		--在洞穴里夜晚睡凉棚
	ANNOUNCE_NOHUNGERSIESTA = "My stomack is rumbling.",		--饱度不足无法午睡
	ANNOUNCE_NODANGERAFK = "Gotta be careful!",		--战斗状态下线（已经移除）
	ANNOUNCE_NO_TRAP = "Easy piecie.",		--没有陷阱？？？没调用
	ANNOUNCE_PECKED = "Oh! Oh! Wow！",		--被小高鸟啄
	ANNOUNCE_QUAKE = "The ground's belly is rumbling!",		--地震
	ANNOUNCE_RESEARCH = "Feels like enlightened!",		--没调用
	ANNOUNCE_SHELTER = "Mr.Tree! Thank you for your protection!",		--下雨天躲树下
	ANNOUNCE_THORNS = "Fragrant thorns!",		--玫瑰、仙人掌、荆棘扎手
	ANNOUNCE_BURNT = "Scalding!",		--烧完了
	ANNOUNCE_TORCH_OUT = "Looks like I gotta rub another one.",		--火把用完了
	ANNOUNCE_THURIBLE_OUT = "Oh it's gone.",		--香炉燃尽
	ANNOUNCE_FAN_OUT = "Phew phew phew...Tis not my fault!",		--小风车停了
    ANNOUNCE_COMPASS_OUT = "The pointy is pointless now.",		--指南针用完了
	ANNOUNCE_TRAP_WENT_OFF = "Hmm...slimy stuff.",		--触发陷阱（例如冬季陷阱）
	ANNOUNCE_UNIMPLEMENTED = "The trap's ain't set!",		--没调用
	ANNOUNCE_WORMHOLE = "The big mouth swallowed me!",		--跳虫洞
	ANNOUNCE_TOWNPORTALTELEPORT = "Feels so...weird!",		--豪华传送
	ANNOUNCE_CANFIX = "I could fix this!",		--墙壁可以修理
	ANNOUNCE_ACCOMPLISHMENT = "Nailed!",		--没调用
	ANNOUNCE_ACCOMPLISHMENT_DONE = "Nailed!",			--没调用
	ANNOUNCE_INSUFFICIENTFERTILIZER = "This place won't even grow one single carrot!",		--土地肥力不足
	ANNOUNCE_TOOL_SLIP = "My claws...what the hell with you guys?",		--工具滑出
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "How dare you, Thunder God! I will report this!",		--规避闪电
	ANNOUNCE_TOADESCAPING = "No! Stay!",		--蟾蜍正在逃跑
	ANNOUNCE_TOADESCAPED = "Come back, Mr.Toad!",		--蟾蜍逃走了
	ANNOUNCE_DAMP = "A breeze with a drizzle, smells nicely as soil~",		--潮湿（1级）
	ANNOUNCE_WET = "My furs are getting wet!",		--潮湿（2级）
	ANNOUNCE_WETTER = "I'm as well as a drenched rat...rabbit, I mean.",		--潮湿（3级）
	ANNOUNCE_SOAKED = "Wait, am I swimming?!",		--潮湿（4级）
	ANNOUNCE_WASHED_ASHORE = "I enjoy swimming!",		--暂无注释
    ANNOUNCE_DESPAWN = "Feels, so, cold...",		--下线
	ANNOUNCE_BECOMEGHOST = "Ah!",		--变成鬼魂
	ANNOUNCE_GHOSTDRAIN = "Emmm...Ah-Oh...",		--队友死亡掉san
	ANNOUNCE_PETRIFED_TREES = "Mr.Tree! You look so scary today!",		--石化树
	ANNOUNCE_KLAUS_ENRAGE = "Ah! Awful and horrible!!",		--克劳斯被激怒（杀死了鹿）
	ANNOUNCE_KLAUS_UNCHAINED = "He got fangs on his belly! Help!!!",		--克劳斯-未上锁的  猜测是死亡准备变身？
	ANNOUNCE_KLAUS_CALLFORHELP = "He is calling someone!",		--克劳斯召唤小偷
	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "Got a carrot inside?",		--暂无注释
		GLASS_LOW = "Finished right away!",		--暂无注释
		GLASS_REVEAL = "Freedom!",		--暂无注释
		IDOL_MED = "Got a carrot inside?",		--暂无注释
		IDOL_LOW = "Finished right away!",		--暂无注释
		IDOL_REVEAL = "Freedom!",		--暂无注释
		SEED_MED = "Got a carrot inside?",		--暂无注释
		SEED_LOW = "Finished right away!",		--暂无注释
		SEED_REVEAL = "Freedom!",		--暂无注释
	},
    ANNOUNCE_SPOOKED = "I, I, I believe I saw something...",		--被吓到
	ANNOUNCE_BRAVERY_POTION = "I've never been afraid!",		--勇气药剂
	ANNOUNCE_MOONPOTION_FAILED = "Huh, nothing happened.",		--暂无注释
	ANNOUNCE_EATING_NOT_FEASTING = "I should share it.",		--暂无注释
	ANNOUNCE_WINTERS_FEAST_BUFF = "Oh! Feels shiny!",		--暂无注释
	ANNOUNCE_IS_FEASTING = "So many yummy food!",		--暂无注释
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "Hey, where's the twinkling?",		--暂无注释
    ANNOUNCE_REVIVING_CORPSE = "Guess we are friends now?",		--没调用（熔炉）
    ANNOUNCE_REVIVED_OTHER_CORPSE = "Much better!",		--没调用（熔炉）
    ANNOUNCE_REVIVED_FROM_CORPSE = "Ah, so scary!",		--没调用（熔炉）
    ANNOUNCE_FLARE_SEEN = "The firmament's on fire!",		--暂无注释
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "Incoming?",		--暂无注释
    ANNOUNCE_ROYALTY =
    {
        "A big big Somebody!",		--向带着蜂王帽的队友鞠躬
        "A royal rabbit with a crown!",		--向带着蜂王帽的队友鞠躬
        "Are you from the Fairy Tale?",		--向带着蜂王帽的队友鞠躬
    },
    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "Electro-Blot!",		--暂无注释
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "Ya wanna fight me now?",		--暂无注释
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "I'm tougher than you!!",		--暂无注释
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "Why do I suddenly feel like wanna work right now?",		--暂无注释
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "Dull and dry at the moment.",		--暂无注释
    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "Ahhhhh~",		--暂无注释
    ANNOUNCE_DETACH_BUFF_ATTACK            = "Wanna fight no more.",		--暂无注释
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "Stop fighting!",		--暂无注释
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "My claws are tired now.",		--暂无注释
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "Wet and slimy at the moment.",		--暂无注释
	ANNOUNCE_OCEANFISHING_LINESNAP = "Yo-hey!",		--暂无注释
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "The thread isn't tight enough.",		--暂无注释
	ANNOUNCE_OCEANFISHING_GOTAWAY = "No, no! Back here, fish!",		--暂无注释
	ANNOUNCE_OCEANFISHING_BADCAST = "That's so hard...",		--暂无注释
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE = 
	{
		"Fish! Fish! Would you mind getting closer?",		--暂无注释
		"Tick-tick Tick-tock...",		--暂无注释
		"Where are you, fish?",		--暂无注释
		"So time-comsuming...",		--暂无注释
	},
	ANNOUNCE_WEIGHT = "You are: {weight}.",		--暂无注释
    ANNOUNCE_KINGCREATED = "Merms got a new king elected!",		--暂无注释
    ANNOUNCE_KINGDESTROYED = "Last term the king sucks, this time somebody gotta find better.",		--暂无注释
    ANNOUNCE_CANTBUILDHERE_THRONE = "This place doesn't fit the King of Swamp.",		--暂无注释
    ANNOUNCE_CANTBUILDHERE_HOUSE = "Spectacular!",		--暂无注释
    ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "Soilders will defend this place!",		--暂无注释
    ANNOUNCE_READ_BOOK = 
    {
        BOOK_SLEEP = "Long, long, ago...zzz...",		--暂无注释
        BOOK_BIRDS = "Are there magpies to help Ms.Weaver?",		--暂无注释
        BOOK_TENTACLES =  "It's a good book!",		--暂无注释
        BOOK_BRIMSTONE = "I long to know the ending of the story!",		--暂无注释
        BOOK_GARDENING = "So many rarely used words!",		--暂无注释
    },
    ANNOUNCE_WEAK_RAT = "Doesn't look suitable.",		--暂无注释
    ANNOUNCE_CARRAT_START_RACE = "Charge! Charge! Charge!",		--暂无注释
    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = 
    {
        "Hey! That way! There!",		--暂无注释
        "The Carrat headed wrong.",		--暂无注释
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "Don't fall asleep! Get up and win the game!",    		--暂无注释
    ANNOUNCE_CARRAT_ERROR_WALKING = "It doesn't run fast enough...",    		--暂无注释
    ANNOUNCE_CARRAT_ERROR_STUNNED = "What the hell! Why did you stop?!",		--暂无注释
    ANNOUNCE_GHOST_QUEST = "only_used_by_wendy",		--暂无注释
    ANNOUNCE_ABIGAIL_SUMMON = 
	{
	},
    ANNOUNCE_GHOSTLYBOND_LEVELUP = 
	{
	},
	BATTLECRY =
	{
		GENERIC = "I, I'm not afraid of you!",		--战斗
		PIG = "Big and fat guys are no good at all!",		--战斗 猪人
		PREY = "Stay...stay!",		--战斗 猎物？？大象？
		SPIDER = "If you hand over your silk, I will beat you lighter.",		--战斗 蜘蛛
		SPIDER_WARRIOR = "You wanna have a good fight with me?",		--战斗 蜘蛛战士
		DEER = "Don't get me in rumors of bullying the disable!",		--战斗 无眼鹿
	},
	COMBAT_QUIT =
	{
		GENERIC = "Hahahahahaha!",		--攻击目标被卡住，无法攻击
		PIG = "The piggy asshole gone!",		--退出战斗-猪人
		PREY = "Hey! Come back!",		--退出战斗 猎物？？大象？
		SPIDER = "Oh...you might be a friend of Mrs.Spiders.",		-- 退出战斗 蜘蛛
		SPIDER_WARRIOR = "Never liked you from the beginning!",		--退出战斗 蜘蛛战士
	},
	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "Hope twines with despair, breeds florid roses!",		-- 物品名:"绚丽之门"
        MULTIPLAYER_PORTAL_MOONROCK = "Can this gate take me home?",		-- 物品名:"天体传送门"
        MOONROCKIDOL = "It's staring at me.",		-- 物品名:"月岩雕像" 制造描述:"重要人物"
        CONSTRUCTION_PLANS = "Looks like easy to do it, doesn't it?",		-- 物品名:未找到
        ANTLION =
        {
            GENERIC = "What do you want!",		-- 物品名:"蚁狮"->默认
            VERYHAPPY = "She looks much happier!",		-- 物品名:"蚁狮"
            UNHAPPY = "Hahaha, don't be that mad at me!",		-- 物品名:"蚁狮"
        },
        ANTLIONTRINKET = "Okay...I know somebody that definitely likes you.",		-- 物品名:"沙滩玩具"
        SANDSPIKE = "Ah, spikes!",		-- 物品名:"沙刺"
        SANDBLOCK = "Come and build a castle with me.",		-- 物品名:"沙堡"
        GLASSSPIKE = "It'll look even better with a pighead on it.",		-- 物品名:"玻璃狼牙棒"
        GLASSBLOCK = "Looks brittle.",		-- 物品名:"玻璃城堡"
        ABIGAIL_FLOWER =
        {
            GENERIC ="A flower with a soul in it...",		-- 物品名:"阿比盖尔之花"->默认 制造描述:"一个神奇的纪念品"
			LEVEL1 = "Ms.Abigail is hiding!",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
			LEVEL2 = "She really takes her time, doesn't she?",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
			LEVEL3 = "Come out!",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
            LONG = "Oh, so gorgeous!",		-- 物品名:"阿比盖尔之花"->还需要很久 制造描述:"一个神奇的纪念品"
            MEDIUM = "Huh?",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
            SOON = "Something's about to happen!",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
            HAUNTED_POCKET = "Down there, flower.",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
            HAUNTED_GROUND = "Shouldn't've been here.",		-- 物品名:"阿比盖尔之花" 制造描述:"一个神奇的纪念品"
        },
        BALLOONS_EMPTY = "Looks nice~",		-- 物品名:"韦斯的气球" 制造描述:"要是有更简单的方法该多好"
        BALLOON = "Let me have one!",		-- 物品名:"气球"
        BERNIE_INACTIVE =
        {
            BROKEN = "Ah...I, I want one too...",		-- 物品名:"伯尼" 制造描述:"这个疯狂的世界总有你熟悉的人"
            GENERIC = "Had enough fun?",		-- 物品名:"伯尼"->默认 制造描述:"这个疯狂的世界总有你熟悉的人"
        },
        BERNIE_ACTIVE = "Wanna have fun with it!",		-- 物品名:"伯尼"
        BERNIE_BIG = "Lovely toys!",		-- 物品名:"伯尼！"
        BOOK_BIRDS = "Magpies build a bridge up in the air, so that lovers may unite.",		-- 物品名:"世界鸟类手册" 制造描述:"涵盖1000个物种：习性、栖息地及叫声"
        BOOK_TENTACLES = "This is gross...",		-- 物品名:"触手的召唤" 制造描述:"让我们来了解一下地下的朋友们！"
        BOOK_GARDENING = "Creamy Fairy Herbs at Moon Palace are all planted by ME~",		-- 物品名:"应用园艺学" 制造描述:"讲述培育和照料植物的相关知识"
        BOOK_SLEEP = "Sister Chang'e usually lulled me with a lullaby.",		-- 物品名:"睡前故事" 制造描述:"送你入梦的睡前故事"
        BOOK_BRIMSTONE = "Just a trick for kids~",		-- 物品名:"末日将至！" 制造描述:"世界将在火焰和灾难中终结！"
        PLAYER =
        {
            GENERIC = "Hello, %s!",		-- 物品名:未找到
            ATTACKER = "Do not trust %s",		-- 物品名:未找到
            MURDERER = "………… %s is a murderer! ",		-- 物品名:未找到
            REVIVER = "I don't need help...Thanks anyway.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "You are so scary, %s",		-- 物品名:"幽灵"
            FIRESTARTER = "You will burn everything, %s!!",		-- 物品名:未找到
        },
        WILSON =
        {
            GENERIC = "Hello, lovely Wilson!",		-- 物品名:"威尔逊"->默认
            ATTACKER = "This is not friendly!",		-- 物品名:"威尔逊"
            MURDERER = "I knew you guys aren't trustworthy!",		-- 物品名:"威尔逊"
            REVIVER = "That \"Science\" looks nice.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Heh-heh, you looks a little silly.",		-- 物品名:"幽灵"
            FIRESTARTER = "All this is for \" Science\"?",		-- 物品名:"威尔逊"
        },
        WOLFGANG =
        {
            GENERIC = "Hello, Mr. Moustache!",		-- 物品名:"沃尔夫冈"->默认
            ATTACKER = "Unfair! Your size is bigger than me!",		-- 物品名:"沃尔夫冈"
            MURDERER = "You douchebag!",		-- 物品名:"沃尔夫冈"
            REVIVER = "So you are not afraid of me anymore?",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Don't be afraid! I'll get you a heart!",		-- 物品名:"幽灵"
            FIRESTARTER = "This, is a terrible idea!",		-- 物品名:"沃尔夫冈"
        },
        WAXWELL =
        {
            GENERIC = "I sense the darkness in you...",		-- 物品名:"麦斯威尔"->默认
            ATTACKER = "You scoundrel!",		-- 物品名:"麦斯威尔"
            MURDERER = "I understand why people dislike you.",		-- 物品名:"麦斯威尔"
            REVIVER = "Ok, you are not that bad.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Stop it! I'm here to help you.",		-- 物品名:"幽灵"
            FIRESTARTER = "He did it! Yes, he did it!",		-- 物品名:"麦斯威尔"
        },
        WX78 =
        {
            GENERIC = "Hello, little Iron Man!",		-- 物品名:"WX-78"->默认
            ATTACKER = "Ouch! Stop it!",		-- 物品名:"WX-78"
            MURDERER = "What a cruel war...",		-- 物品名:"WX-78"
            REVIVER = "Never thought you would do this!",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "You don't seem happy.",		-- 物品名:"幽灵"
            FIRESTARTER = "You did too much!",		-- 物品名:"WX-78"
        },
        WILLOW =
        {
            GENERIC = "Hello, Ms.Flame!",		-- 物品名:"薇洛"->默认
            ATTACKER = "You guys are not that tough.",		-- 物品名:"薇洛"
            MURDERER = "Bad girl!",		-- 物品名:"薇洛"
            REVIVER = "Actually you are nice.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "You...Can I play with your bear? Okay I will go find a heart.",		-- 物品名:"幽灵"
            FIRESTARTER = "She looks rather happy.",		-- 物品名:"薇洛"
        },
        WENDY =
        {
            GENERIC = "Hello, how are you and your sister today?",		-- 物品名:"温蒂"->默认
            ATTACKER = "Hey, stop!",		-- 物品名:"温蒂"
            MURDERER = "You call this just wanna play with sister?",		-- 物品名:"温蒂"
            REVIVER = "I'll say hi to Abigail for you.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "You...you sure you really want a heart?",		-- 物品名:"幽灵"
            FIRESTARTER = "Why would you do something like this?",		-- 物品名:"温蒂"
        },
        WOODIE =
        {
            GENERIC = "Hello, Mr.Feller!",		-- 物品名:"伍迪"->默认
            ATTACKER = "Don't hurt people! Go find yourself a tree!",		-- 物品名:"伍迪"
            MURDERER = "Should've anticipated you are a murderer!",		-- 物品名:"伍迪"
            REVIVER = "Mr.Feller is a good man.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Need any help?",		-- 物品名:"幽灵"
            BEAVER = "Where's the feller guy?",		-- 物品名:"伍迪"
            BEAVERGHOST = "I will find a heart and bring the feller back!",		-- 物品名:"伍迪"
            MOOSE = "Where's the feller guy?",		-- 物品名:"伍迪"
            MOOSEGHOST = "I will find a heart and bring the feller back!",		-- 物品名:"伍迪"
            GOOSE = "Where's the feller guy?",		-- 物品名:"伍迪"
            GOOSEGHOST = "I will find a heart and bring the feller back!",		-- 物品名:"伍迪"
            FIRESTARTER = "Didn't you like trees? Why are you burning now?",		-- 物品名:"伍迪"
        },
        WICKERBOTTOM =
        {
            GENERIC = "Could you tell me a story? Please...",		-- 物品名:"薇克巴顿"->默认
            ATTACKER = "Why mad at me? I ain't done nothing!",		-- 物品名:"薇克巴顿"
            MURDERER = "I regret I trusted you so much!",		-- 物品名:"薇克巴顿"
            REVIVER = "Thank you very much!",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "I'll go get you heart at once.",		-- 物品名:"幽灵"
            FIRESTARTER = "Don't set campfire anywhere!",		-- 物品名:"薇克巴顿"
        },
        WES =
        {
            GENERIC = "Hello, little clown.",		-- 物品名:"韦斯"->默认
            ATTACKER = "Move away!",		-- 物品名:"韦斯"
            MURDERER = "Shouldn't've been here at the beginning.",		-- 物品名:"韦斯"
            REVIVER = "Oh...thanks.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Paler than usual.",		-- 物品名:"幽灵"
            FIRESTARTER = "You are such a freak!",		-- 物品名:"韦斯"
        },
        WEBBER =
        {
            GENERIC = "Hi, little Mr.Spider Monster.",		-- 物品名:"韦伯"->默认
            ATTACKER = "Why are you so mean!",		-- 物品名:"韦伯"
            MURDERER = "I thought we are friends!",		-- 物品名:"韦伯"
            REVIVER = "I knew we are friends! I just knew it!",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Don't worry. I'll go find heart now!",		-- 物品名:"幽灵"
            FIRESTARTER = "You will get in trouble with this.",		-- 物品名:"韦伯"
        },
        WATHGRITHR =
        {
            GENERIC = "Hello, Viking lady.",		-- 物品名:"薇弗德"->默认
            ATTACKER = "And Viking lady wants a fight?",		-- 物品名:"薇弗德"
            MURDERER = "Don't hunt me down!",		-- 物品名:"薇弗德"
            REVIVER = "......Thank you.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Oh, you look scary.",		-- 物品名:"幽灵"
            FIRESTARTER = "Ain't that Ms.Flame's job?",		-- 物品名:"薇弗德"
        },
        WINONA =
        {
            GENERIC = "Do you know anything about the night lady?",		-- 物品名:"薇诺娜"->默认
            ATTACKER = "That's not safe!",		-- 物品名:"薇诺娜"
            MURDERER = "You betrayed my trust to you!",		-- 物品名:"薇诺娜"
            REVIVER = "It's all fixed.",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "I thought you are attentive all the time.",		-- 物品名:"幽灵"
            FIRESTARTER = "Maybe she grew tired of fixing things.",		-- 物品名:"薇诺娜"
        },
        WORTOX =
        {
            GENERIC = "Little\"Demon\"?",		-- 物品名:"沃拓克斯"->默认
            ATTACKER = "You are such a jerk!",		-- 物品名:"沃拓克斯"
            MURDERER = "I knew I can't trust you!",		-- 物品名:"沃拓克斯"
            REVIVER = "......Messing up again?",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Just a phew and your soul then flew!",		-- 物品名:"幽灵"
            FIRESTARTER = "He looks scary at the moment.",		-- 物品名:"沃拓克斯"
        },
        WORMWOOD =
        {
            GENERIC = "Hi! Little Vegetable!",		-- 物品名:"沃姆伍德"->默认
            ATTACKER = "Ouch! You old and bad weed!",		-- 物品名:"沃姆伍德"
            MURDERER = "We can't be friends any more!",		-- 物品名:"沃姆伍德"
            REVIVER = "Oh! You are a nice veggie!",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Give me a sec, I'll find somebody for help.",		-- 物品名:"幽灵"
            FIRESTARTER = "It's a dangerous move!",		-- 物品名:"沃姆伍德"
        },
        WARLY =
        {
            GENERIC = "Hello, Mr.Cook!",		-- 物品名:"沃利"->默认
            ATTACKER = "Thought you are a good dude!",		-- 物品名:"沃利"
            MURDERER = "You are never my friend!",		-- 物品名:"沃利"
            REVIVER = "You're...helping me?",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "No! Who's gonna cook me feasts from now on...",		-- 物品名:"幽灵"
            FIRESTARTER = "He wants everything cooked as food.",		-- 物品名:"沃利"
        },
        WURT =
        {
            GENERIC = "Hello, little merm!",		-- 物品名:"沃特"->默认
            ATTACKER = "We should unite together!",		-- 物品名:"沃特"
            MURDERER = "Certainly you are our worst enemy!",		-- 物品名:"沃特"
            REVIVER = "I am always loyal!",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
            GHOST = "Some place or another would I find a heart.",		-- 物品名:"幽灵"
            FIRESTARTER = "Stop! You'll get us in trouble!",		-- 物品名:"沃特"
        },
        MIGRATION_PORTAL =
        {
            GENERIC = "Where does it lead?",		-- 物品名:"Matic 朋友之门"->默认
            OPEN = "Not sure what's on the other side...",		-- 物品名:"Matic 朋友之门"->打开
            FULL = "No space left.",		-- 物品名:"Matic 朋友之门"->满了
        },
        GLOMMER = 
        {
            GENERIC = "Heh-heh, the worm got slimy stuffs attached.",		-- 物品名:"罗姆"->默认
            SLEEPING = "Good night, little worm.",		-- 物品名:"罗姆"->睡着了
        },
        GLOMMERFLOWER =
        {
            GENERIC = "Most florid of all?",		-- 物品名:"罗姆花"->默认
            DEAD = "Oh! So sad!",		-- 物品名:"罗姆花"->死了
        },
        GLOMMERWINGS = "The big worm's small wings.",		-- 物品名:"罗姆翅膀"
        GLOMMERFUEL = "The slime dropped by the worm.",		-- 物品名:"罗姆的黏液"
        BELL = "It creates melodious sound.",		-- 物品名:"远古铃铛" 制造描述:"这可不是普通的铃铛"
        STATUEGLOMMER =
        {
            GENERIC = "Stone with a shape of a worm?",		-- 物品名:"罗姆雕像"->默认
            EMPTY = "Ouch! It wasn't me!",		-- 物品名:"罗姆雕像"
        },
        LAVA_POND_ROCK = "Perhaps we should make a bowl out of it?",		-- 物品名:"岩石"
		WEBBERSKULL = "Bone in a wrong place!",		-- 物品名:"韦伯的头骨"
		WORMLIGHT = "Big and shiny berry!",		-- 物品名:"发光蓝莓"
		WORMLIGHT_LESSER = "With some fluorescent composition.",		-- 物品名:"较少发光蓝莓"
		WORM =
		{
		    PLANT = "Danger always comes with opportunity!",		-- 物品名:"洞穴蠕虫"
		    DIRT = "Pile of soil.",		-- 物品名:"洞穴蠕虫"
		    WORM = "Monster worm!!!",		-- 物品名:"洞穴蠕虫"
		},
        WORMLIGHT_PLANT = "So gorgeous!",		-- 物品名:"神秘植物"
		MOLE =
		{
			HELD = "Little brat, stop wriggling.",		-- 物品名:"鼹鼠"->拿在手里
			UNDERGROUND = "Where are you heading Mr. Gnome?",		-- 物品名:"鼹鼠"
			ABOVEGROUND = "You are so nosy!",		-- 物品名:"鼹鼠"
		},
		MOLEHILL = "Mole's home.",		-- 物品名:"鼹鼠丘"
		MOLEHAT = "Ah it stinks!",		-- 物品名:"鼹鼠帽" 制造描述:"为穿戴者提供夜视能力"
		EEL = "Hello, Mr. Long Fish!",		-- 物品名:"鳗鱼"
		EEL_COOKED = "Now you can't electrify anything!",		-- 物品名:"烤鳗鱼"
		UNAGI = "We shouldn't treat fishes like this!",		-- 物品名:"鳗鱼料理"
		EYETURRET = "You, you won't shoot me, right?",		-- 物品名:"眼睛炮塔"
		EYETURRET_ITEM = "Is this a good idea?",		-- 物品名:"眼睛炮塔" 制造描述:"要远离讨厌的东西，就得杀了它们"
		MINOTAURHORN = "Mortal worldly stuff, can't shield me from anything.",		-- 物品名:"守护者之角"
		MINOTAURCHEST = "Captain Rabbit found a treasure!",		-- 物品名:"大号华丽箱子"
		THULECITE_PIECES = "Puny pieces.",		-- 物品名:"铥矿碎片"
		POND_ALGAE = "Ohh, slimy!",		-- 物品名:"水藻"
		GREENSTAFF = "With a beautiful green stone inseted.",		-- 物品名:"拆解魔杖" 制造描述:"干净而有效的摧毁"
		GIFT = "A gift for me!!",		-- 物品名:"礼物"
        GIFTWRAP = "Why don't we just pack one stuff with another?",		-- 物品名:"礼物包装" 制造描述:"把东西打包起来，好看又可爱！"
		POTTEDFERN = "This flora has a sweet home~",		-- 物品名:"蕨类盆栽" 制造描述:"做个花盆，里面栽上蕨类植物"
        SUCCULENT_POTTED = "Now you arrive home!",		-- 物品名:"多肉盆栽" 制造描述:"塞进陶盆的漂亮多肉植物"
		SUCCULENT_PLANT = "Why are you sitting in a place like this?",		-- 物品名:"多肉植物"
		SUCCULENT_PICKED = "Let me help you find a home~",		-- 物品名:"多肉植物"
		SENTRYWARD = "The eye of a moon?",		-- 物品名:"月眼守卫" 制造描述:"绘图者最有价值的武器"
        TOWNPORTAL =
        {
			GENERIC = "Bring my friend to me!",		-- 物品名:"强征传送塔"->默认 制造描述:"用沙子的力量聚集你的朋友们"
			ACTIVE = "Everything ready!",		-- 物品名:"强征传送塔"->激活了 制造描述:"用沙子的力量聚集你的朋友们"
		},
        TOWNPORTALTALISMAN = 
        {
			GENERIC = "Teleport stone.",		-- 物品名:"沙漠石头"->默认
			ACTIVE = "Jump through a portal to my friends!",		-- 物品名:"沙漠石头"->激活了
		},
        WETPAPER = "It can bear infinite knowledge.",		-- 物品名:"纸张"
        WETPOUCH = "I discovered a treasure of the lake!",		-- 物品名:"起皱的包裹"
        MOONROCK_PIECES = "What! Moon Palace?!",		-- 物品名:"月亮石碎块"
        MOONBASE =
        {
            GENERIC = "It leads the power of the moon.",		-- 物品名:"月亮石"->默认
            BROKEN = "Someone messed it up!",		-- 物品名:"月亮石"
            STAFFED = "Something's about to happen...any second now...",		-- 物品名:"月亮石"
            WRONGSTAFF = "This may not seem right?",		-- 物品名:"月亮石"->插错法杖
            MOONSTAFF = "It's the moon light coming!",		-- 物品名:"月亮石"->已经插了法杖的（月杖）
        },
        MOONDIAL = 
        {
			GENERIC = "It reflects the light of hometown.",		-- 物品名:"月晷"->默认 制造描述:"追踪月相！"
			NIGHT_NEW = "Like crescent curved, like willow brushed, like an eyebrow.",		-- 物品名:"月晷"->新月 制造描述:"追踪月相！"
			NIGHT_WAX = "First quarter of a bow, shooting my heart in its whole.",		-- 物品名:"月晷"->上弦月 制造描述:"追踪月相！"
			NIGHT_FULL = "Full wheel of a moon, sprinkles the ground with its light.",		-- 物品名:"月晷"->满月 制造描述:"追踪月相！"
			NIGHT_WANE = "Cloud covers La Lune, fragrance comes from blossoms.",		-- 物品名:"月晷"->下弦月 制造描述:"追踪月相！"
			CAVE = "I can't alleviate my nostalgia here.",		-- 物品名:"月晷"->洞穴 制造描述:"追踪月相！"
        },
		THULECITE = "It looks strangely magical!",		-- 物品名:"铥矿石" 制造描述:"将小碎片合成一大块"
		ARMORRUINS = "Powerful protection!",		-- 物品名:"铥矿甲" 制造描述:"炫目并且能提供保护"
		ARMORSKELETON = "Looks creepy...",		-- 物品名:"骨头盔甲"
		SKELETONHAT = "My head starts to hallucinate?",		-- 物品名:"骨头头盔"
		RUINS_BAT = "Waving the sticks!",		-- 物品名:"铥矿岩棒" 制造描述:"尖钉让一切变得更好"
		RUINSHAT = "Now I am a king!",		-- 物品名:"远古王冠" 制造描述:"附有远古力场！"
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "It seems in peace.",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            WARN = "Getting stranger and stranger.",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            WAXING = "Something's about to happen!",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            STEADY = "It's not changing anyhow.",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            WANING = "It's disappearing.",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            DAWN = "It's about to end, to the final end...",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
            NOMAGIC = "Probably it's good!",		-- 物品名:"铥矿奖章" 制造描述:"跟踪周围魔力水平的流动"
		},
		BISHOP_NIGHTMARE = "She doesn't look right.",		-- 物品名:"损坏的发条主教"
		ROOK_NIGHTMARE = "What happens to them?!",		-- 物品名:"损坏的发条战车"
		KNIGHT_NIGHTMARE = "There's something terrible about them!",		-- 物品名:"损坏的发条骑士"
		MINOTAUR = "She looks in tantrum!!",		-- 物品名:"远古守护者"
		SPIDER_DROPPER = "I say you hiding up there!",		-- 物品名:"穴居悬蛛"
		NIGHTMARELIGHT = "Dream will break, and it sometimes hurts...",		-- 物品名:"梦魇灯座"
		NIGHTSTICK = "Oh! Dazzling light.",		-- 物品名:"晨星锤" 制造描述:"用于夜间战斗的晨光"
		GREENGEM = "Sculpt a crown with emerald jade.",		-- 物品名:"绿宝石"
		MULTITOOL_AXE_PICKAXE = "This is so smart a design!",		-- 物品名:"多用斧镐" 制造描述:"加倍实用"
		ORANGESTAFF = "With the power to tear the air apart!",		-- 物品名:"瞬移魔杖" 制造描述:"适合那些不喜欢走路的人"
		YELLOWAMULET = "Has a warming touch.",		-- 物品名:"魔光护符" 制造描述:"从天堂汲取力量"
		GREENAMULET = "Helpful with crafting.",		-- 物品名:"建造护符" 制造描述:"用更少的材料合成物品！"
		SLURPERPELT = "It still looks alive!",			-- 物品名:"铥矿奖章"->啜食者皮 制造描述:"跟踪周围魔力水平的流动"
		SLURPER = "Un, unbearbly i, itchy...hahaha...",		-- 物品名:"啜食者"
		SLURPER_PELT = "The skin of that thing.",		-- 物品名:"啜食者皮"
		ARMORSLURPER = "Flexible belt!",		-- 物品名:"饥饿腰带" 制造描述:"保持肚子不饿"
		ORANGEAMULET = "Makes me feel a sense of high status.",		-- 物品名:"懒人护符" 制造描述:"适合那些不喜欢捡东西的人"
		YELLOWSTAFF = "A golden crow warbling.",		-- 物品名:"唤星者法杖" 制造描述:"召唤一个小星星"
		YELLOWGEM = "There is sunlight within.",		-- 物品名:"黄宝石"
		ORANGEGEM = "A eccentric orange...sorry, orange stone.",		-- 物品名:"橙宝石"
        OPALSTAFF = "The Moon lends some power to it!",		-- 物品名:"唤月者魔杖"
        OPALPRECIOUSGEM = "Cohesive colors of a rainbow.",		-- 物品名:"彩虹宝石"
        TELEBASE = 
		{
			VALID = "Now it's ready!",		-- 物品名:"传送焦点"->有效 制造描述:"装上宝石试试"
			GEMS = "It needs something...",		-- 物品名:"传送焦点"->需要宝石 制造描述:"装上宝石试试"
		},
		GEMSOCKET = 
		{
			VALID = "The gems are anchored properly.",		-- 物品名:"宝石底座"->有效
			GEMS = "Gotta find a shiny gem to fit inside...or outside?",		-- 物品名:"宝石底座"->需要宝石
		},
		STAFFLIGHT = "The light on fire!",		-- 物品名:"矮人之星"
        STAFFCOLDLIGHT = "It's like a dew on Moon Palace!",		-- 物品名:"极光"
        ANCIENT_ALTAR = "Looks like pretty worn.",		-- 物品名:"远古祭坛"
        ANCIENT_ALTAR_BROKEN = "It's only partially functioning.",		-- 物品名:"损坏的远古祭坛"
        ANCIENT_STATUE = "It scared me, on my first glance.",		-- 物品名:"远古雕像"
        LICHEN = "Food of the cavers.",		-- 物品名:"洞穴苔藓"
		CUTLICHEN = "Crispy taste.",		-- 物品名:"苔藓"
		CAVE_BANANA = "Delicious fruits.",		-- 物品名:"洞穴香蕉"
		CAVE_BANANA_COOKED = "Yummy!",		-- 物品名:"烤香蕉"
		CAVE_BANANA_TREE = "There're fruits on it!",		-- 物品名:"洞穴香蕉树"
		ROCKY = "Hello!",		-- 物品名:"石虾"
		COMPASS =
		{
			GENERIC="A tiny sting, rotating inside.",		-- 物品名:"指南针"->默认 制造描述:"指向北方"
			N = "North.",		-- 物品名:"指南针" 制造描述:"指向北方"
			S = "South.",		-- 物品名:"指南针" 制造描述:"指向北方"
			E = "East.",		-- 物品名:"指南针" 制造描述:"指向北方"
			W = "West.",		-- 物品名:"指南针" 制造描述:"指向北方"
			NE = "North-East.",		-- 物品名:"指南针" 制造描述:"指向北方"
			SE = "South-East.",		-- 物品名:"指南针" 制造描述:"指向北方"
			NW = "North_West.",		-- 物品名:"指南针" 制造描述:"指向北方"
			SW = "South-West.",		-- 物品名:"指南针" 制造描述:"指向北方"
		},
        HOUNDSTOOTH = "A tooth from a big doggie.",		-- 物品名:"犬牙"
        ARMORSNURTLESHELL = "It clings to my back!",		-- 物品名:"蜗壳护甲"
        BAT = "Never eat it raw!",		-- 物品名:"洞穴蝙蝠"
        BATBAT = "Let's get on it!",		-- 物品名:"蝙蝠棒" 制造描述:"所有科技都如此...耗费精神"
        BATWING = "This is no bat left.",		-- 物品名:"洞穴蝙蝠翅膀"
        BATWING_COOKED = "Yuck!!!",		-- 物品名:"烤蝙蝠翅膀"
        BATCAVE = "I'm not scared of it!",		-- 物品名:"蝙蝠洞"
        BEDROLL_FURRY = "Soft and furry.",		-- 物品名:"毛皮铺盖" 制造描述:"舒适地一觉睡到天亮！"
        BUNNYMAN = "Let's go and sunbathe?",		-- 物品名:"兔人"
        FLOWER_CAVE = "Useless flowers.",		-- 物品名:"荧光花"
        GUANO = "Bat also poops?",		-- 物品名:"鸟粪"
        LANTERN = "Can you give more light than this?",		-- 物品名:"提灯" 制造描述:"可加燃料、明亮、便携！"
        LIGHTBULB = "What do you mean by, don't put me in mouth?",		-- 物品名:"荧光果"
        MANRABBIT_TAIL = "Eh? This is not from my body, right?",		-- 物品名:"兔绒"
        MUSHROOMHAT = "Makes my head look pretty and slimy.",		-- 物品名:"蘑菇帽"
        MUSHROOM_LIGHT2 =
        {
            ON = "Oh! Beautiful colors.",		-- 物品名:"炽菇灯"->开启 制造描述:"受到火山岩浆灯饰学问的激发"
            OFF = "What's the use of it?",		-- 物品名:"炽菇灯"->关闭 制造描述:"受到火山岩浆灯饰学问的激发"
            BURNT = "It used to be so gorgeous!",		-- 物品名:"炽菇灯"->烧焦的 制造描述:"受到火山岩浆灯饰学问的激发"
        },
        MUSHROOM_LIGHT =
        {
            ON = "Glowing strangely.",		-- 物品名:"蘑菇灯"->开启 制造描述:"任何蘑菇的完美添加物"
            OFF = "Intersting design!",		-- 物品名:"蘑菇灯"->关闭 制造描述:"任何蘑菇的完美添加物"
            BURNT = "I didn't do it!",		-- 物品名:"蘑菇灯"->烧焦的 制造描述:"任何蘑菇的完美添加物"
        },
        SLEEPBOMB = "Hee-hee! Good night~",		-- 物品名:"睡袋" 制造描述:"可以扔掉的袋子睡意沉沉"
        MUSHROOMBOMB = "RUN!!!",		-- 物品名:"炸弹蘑菇"
        SHROOM_SKIN = "Knotty and bloated.",		-- 物品名:"蘑菇皮"
        TOADSTOOL_CAP =
        {
            EMPTY = "Hello? Anybody home?",		-- 物品名:"毒菌蟾蜍"
            INGROUND = "Let me greet you undergroud!",		-- 物品名:"毒菌蟾蜍"->在地里面
            GENERIC = "You have a nice cap.",		-- 物品名:"毒菌蟾蜍"->默认
        },
        TOADSTOOL =
        {
            GENERIC = "I wanna get away from him!",		-- 物品名:"毒菌蟾蜍"->默认
            RAGE = "Oh we pissed him off!",		-- 物品名:"毒菌蟾蜍"->愤怒
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "Big big mushroom!",		-- 物品名:"孢子帽"->默认
            BURNT = "Opps~",		-- 物品名:"孢子帽"->烧焦的
        },
        MUSHTREE_TALL =
        {
            GENERIC = "Looks delicious!",		-- 物品名:"蓝蘑菇树"->默认
            BLOOM = "Something small is falling from it.",		-- 物品名:"蓝蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "It's so big!",		-- 物品名:"红蘑菇树"->默认
            BLOOM = "And so beautiful!",		-- 物品名:"红蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "Short stump.",		-- 物品名:"绿蘑菇树"->默认
            BLOOM = "A floating light!",		-- 物品名:"绿蘑菇树"->蘑菇树繁殖？？
        },
        MUSHTREE_TALL_WEBBED = "This one is conquered by spider guys.",		-- 物品名:"蛛网蓝蘑菇树"
        SPORE_TALL =
        {
            GENERIC = "So gorgeous!",		-- 物品名:"蓝色孢子"->默认
            HELD = "Now these floating fluffs are mine!",		-- 物品名:"蓝色孢子"->拿在手里
        },
        SPORE_MEDIUM =
        {
            GENERIC = "It can fly!",		-- 物品名:"红色孢子"->默认
            HELD = "Now these floating fluffs are mine!",		-- 物品名:"红色孢子"->拿在手里
        },
        SPORE_SMALL =
        {
            GENERIC = "It's dancing with me!",		-- 物品名:"绿色孢子"->默认
            HELD = "Now these floating fluffs are mine!",		-- 物品名:"绿色孢子"->拿在手里
        },
        RABBITHOUSE =
        {
            GENERIC = "Hello~Is a cute rabbit at home?(●'◡'●)",		-- 物品名:"兔屋"->默认 制造描述:"可容纳一只巨大的兔子及其所有物品"
            BURNT = "What a pity...so can I eat it now?",		-- 物品名:"兔屋"->烧焦的 制造描述:"可容纳一只巨大的兔子及其所有物品"
        },
        SLURTLE = "Looks very much like a friend of mine.",		-- 物品名:"尖壳蜗牛"
        SLURTLE_SHELLPIECES = "Ouch, it's broken.",		-- 物品名:"蜗壳碎片"
        SLURTLEHAT = "Now it's my shell!",		-- 物品名:"蜗牛帽"
        SLURTLEHOLE = "Oh! Slimy.",		-- 物品名:"尖壳蜗牛窝"
        SLURTLESLIME = "Explosible slime.",		-- 物品名:"尖壳蜗牛黏液"
        SNURTLE = "With a kinda trustworthy face.",		-- 物品名:"圆壳蜗牛"
        SPIDER_HIDER = "A sacred spider!",		-- 物品名:"洞穴蜘蛛"
        SPIDER_SPITTER = "A spider that spits phlegm.",		-- 物品名:"喷射蜘蛛"
        SPIDERHOLE = "Spider Man's hole!",		-- 物品名:"蛛网岩"
        SPIDERHOLE_ROCK = "Hello? Any rabbit home?",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品"
        STALAGMITE = "The rocks of caveman.",		-- 物品名:"石笋"
        STALAGMITE_TALL = "A gigantic cave rock.",		-- 物品名:"石笋"
        TREASURECHEST_TRAP = "Must be a treasure!",		-- 物品名:"宝箱"
        TURF_CARPETFLOOR = "Fluffy ground.",		-- 物品名:"地毯地板" 制造描述:"超级柔软气味像牦牛"
        TURF_CHECKERFLOOR = "A piece of checkered ground.",		-- 物品名:"棋盘地板" 制造描述:"精心制作成棋盘状的大理石地砖"
        TURF_DIRT = "A piece of the ground.",		-- 物品名:"泥土地皮"
        TURF_FOREST = "A piece of the ground.",		-- 物品名:"森林地皮"
        TURF_GRASS = "A piece of the ground.",		-- 物品名:"长草地皮"
        TURF_MARSH = "A piece of the ground.",		-- 物品名:"沼泽地皮" 制造描述:"沼泽在哪，家就在哪！"
        TURF_METEOR = "A piece of the ground.",		-- 物品名:"月坑地皮" 制造描述:"月球表面的月坑"
        TURF_PEBBLEBEACH = "A piece of the ground.",		-- 物品名:"岩石海滩地皮"
        TURF_ROAD = "It makes walking easier and happier.",		-- 物品名:"卵石路" 制造描述:"修建你自己的道路，通往任何地方"
        TURF_ROCKY = "A piece of the ground.",		-- 物品名:"岩石地皮"
        TURF_SAVANNA = "A piece of the ground.",		-- 物品名:"热带草原地皮"
        TURF_WOODFLOOR = "A piece from Mr.Tree.",		-- 物品名:"木地板" 制造描述:"优质复合地板"
		TURF_CAVE="A piece of the ground.",		-- 物品名:"鸟粪地皮"
		TURF_FUNGUS="A piece of the ground.",		-- 物品名:"菌类地皮"
		TURF_SINKHOLE="A piece of the ground.",		-- 物品名:"黏滑地皮"
		TURF_UNDERROCK="A piece of the ground.",		-- 物品名:"洞穴岩石地皮"
		TURF_MUD="A piece of the ground.",		-- 物品名:"泥泞地皮"
		TURF_DECIDUOUS = "A piece of the ground.",		-- 物品名:"桦树地皮"
		TURF_SANDY = "A piece of the ground.",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品"
		TURF_BADLANDS = "A piece of the ground.",		-- 物品名:"兔屋" 制造描述:"可容纳一只巨大的兔子及其所有物品"
		TURF_DESERTDIRT = "A piece of the ground.",		-- 物品名:"沙漠地皮"
		TURF_FUNGUS_GREEN = "A piece of the ground.",		-- 物品名:"菌类地皮"
		TURF_FUNGUS_RED = "A piece of the ground.",		-- 物品名:"菌类地皮"
		TURF_DRAGONFLY = "Wow! A scaled ground!",		-- 物品名:"鳞状地板" 制造描述:"消除火灾蔓延速度"
		POWCAKE = "It hurts my stomache, but it smells really nice!",		-- 物品名:"芝士蛋糕"
        CAVE_ENTRANCE = "Blocked by a cap stone.",		-- 物品名:"堵住的陷洞"
        CAVE_ENTRANCE_RUINS = "What's beneath there?",		-- 物品名:"被堵住的陷洞"->单机 洞二入口
       	CAVE_ENTRANCE_OPEN = 
        {
            GENERIC = "There's a world beneath there.",		-- 物品名:"陷洞"->默认
            OPEN = "I wanna take an adventure inside!",		-- 物品名:"陷洞"->打开
            FULL = "Let me in, please!",		-- 物品名:"陷洞"->满了
        },
        CAVE_EXIT = 
        {
            GENERIC = "I kinda like this under world.",		-- 物品名:"楼梯"->默认
            OPEN = "But I also miss the world outside!",		-- 物品名:"楼梯"->打开
            FULL = "Let's get out.",		-- 物品名:"楼梯"->满了
        },
		MAXWELLPHONOGRAPH = "Music coming out of it!",		-- 物品名:"麦斯威尔的留声机"->单机 麦斯威尔留声机
		BOOMERANG = "An attack that goes back.",		-- 物品名:"回旋镖" 制造描述:"来自澳洲土著"
		PIGGUARD = "He's more terrifying than others.",		-- 物品名:"猪人守卫"
		ABIGAIL =
		{
            LEVEL1 =
            {
                "Are, are you a good guy?",		-- 物品名:未找到 制造描述:未找到
                "Are, are you a good guy?",		-- 物品名:未找到 制造描述:未找到
            },
            LEVEL2 = 
            {
                "Are, are you a good guy?",		-- 物品名:未找到 制造描述:未找到
                "Are, are you a good guy?",		-- 物品名:未找到 制造描述:未找到
            },
            LEVEL3 = 
            {
                "Are, are you a good guy?",		-- 物品名:未找到 制造描述:未找到
                "Are, are you a good guy?",		-- 物品名:未找到 制造描述:未找到
            },
		},
		ADVENTURE_PORTAL = "Where does this lead, I wonder?",		-- 物品名:"麦斯威尔之门"->单机 麦斯威尔之门
		AMULET = "Ah! Sorcerer's Stone!",		-- 物品名:"重生护符" 制造描述:"逃离死神的魔爪"
		ANIMAL_TRACK = "A trail to a feast!",		-- 物品名:"动物足迹"
		ARMORGRASS = "A straw suit covers a fisherman...",		-- 物品名:"草甲" 制造描述:"提供少许防护"
		ARMORMARBLE = "This is really weighty.",		-- 物品名:"大理石甲" 制造描述:"它很重，但能够保护你"
		ARMORWOOD = "A wooden shirt!",		-- 物品名:"木甲" 制造描述:"为你抵御部分伤害"
		ARMOR_SANITY = "It...Ah! It's trying to take my soul from me!!!",		-- 物品名:"魂甲" 制造描述:"保护你的躯体，但无法保护你的心智"
		ASH =
		{
			GENERIC = "Beauty ends, with a tinge of aroma in the hands.",		-- 物品名:"灰烬"->默认
			REMAINS_GLOMMERFLOWER = "Aww, it's all gone.",		-- 物品名:"灰烬"->单机专用
			REMAINS_EYE_BONE = "See ya!",		-- 物品名:"灰烬"->单机专用
			REMAINS_THINGIE = "It's gone...",		-- 物品名:"灰烬"->单机专用
		},
		AXE = "Let me carve a carrot mini-statue with an axe like this!",		-- 物品名:"斧头" 制造描述:"砍倒树木！"
		BABYBEEFALO = 
		{
			GENERIC = "It's so tiny and lovely!",		-- 物品名:"小牦牛"->默认
		    SLEEPING = "Good night, little baby!",		-- 物品名:"小牦牛"->睡着了
        },
        BUNDLE = "For later use.",		-- 物品名:"捆绑物资"
        BUNDLEWRAP = "Can pack lots of big big carrots~",		-- 物品名:"捆绑包装" 制造描述:"打包你的东西的部分和袋子"
		BACKPACK = "I got my own luggage now!",		-- 物品名:"背包" 制造描述:"携带更多物品"
		BACONEGGS = "Move this away!",		-- 物品名:"培根煎蛋"
		BANDAGE = "Makes my wound less painful.",		-- 物品名:"蜂蜜药膏" 制造描述:"愈合小伤口"
		BASALT = "So solid! This is a real stone.",		-- 物品名:"玄武岩"
		BEARDHAIR = "He's so weird...",		-- 物品名:"胡子"
		BEARGER = "No! Runnnn!",		-- 物品名:"狂暴熊獾"
		BEARGERVEST = "Has a warm and flurry touch.",		-- 物品名:"熊皮背心" 制造描述:"熊皮背心"
		ICEPACK = "A back pack covered by thick fur.",		-- 物品名:"保鲜背包" 制造描述:"容量虽小，但能保持东西新鲜"
		BEARGER_FUR = "Streaked down.",		-- 物品名:"熊皮" 制造描述:"毛皮再生"
		BEDROLL_STRAW = "Have a nice sleep.",		-- 物品名:"草席卷" 制造描述:"一觉睡到天亮"
		BEEQUEEN = "Her honey food are the sweetest.",		-- 物品名:"蜂王"
		BEEQUEENHIVE = 
		{
			GENERIC = "Does it have honey reserve?",		-- 物品名:"蜂蜜地块"->默认
			GROWING = "This is weird...Will there be another queen?",		-- 物品名:"蜂蜜地块"->正在生长
		},
        BEEQUEENHIVEGROWN = "I got a bad feeling about this.",		-- 物品名:"巨大蜂巢"
        BEEGUARD = "Big big bees.",		-- 物品名:"嗡嗡蜜蜂"
        HIVEHAT = "Now I'm your queen, bees!",		-- 物品名:"蜂王帽"
        MINISIGN =
        {
            GENERIC = "Oh, just a picture.",		-- 物品名:"小木牌"->默认
            UNDRAWN = "Nothing written on it.",		-- 物品名:"小木牌"->没有画画
        },
        MINISIGN_ITEM = "Where shall I put this?",		-- 物品名:"小木牌" 制造描述:"用羽毛笔在这些上面画画"
		BEE =
		{
			GENERIC = "Hundreds flowers for few honey, whom I'm hard for and to whom I'm sweet?",		-- 物品名:"蜜蜂"->默认
			HELD = "Ha, bee-have yourself in my pocket, ok?",		-- 物品名:"蜜蜂"->拿在手里
		},
		BEEBOX =
		{
			READY = "Honey honey, sweet honey~",		-- 物品名:"蜂箱"->准备好的 满的 制造描述:"贮存你自己的蜜蜂"
			FULLHONEY = "Let me make a dessert.",		-- 物品名:"蜂箱"->蜂蜜满了 制造描述:"贮存你自己的蜜蜂"
			GENERIC = "Home of little bees~",		-- 物品名:"蜂箱"->默认 制造描述:"贮存你自己的蜜蜂"
			NOHONEY = "Ah, no hoeny left.",		-- 物品名:"蜂箱"->没有蜂蜜 制造描述:"贮存你自己的蜜蜂"
			SOMEHONEY = "I don't want to wait...",		-- 物品名:"蜂箱"->有一些蜂蜜 制造描述:"贮存你自己的蜜蜂"
			BURNT = "Bees no longer buzzing.",		-- 物品名:"蜂箱"->烧焦的 制造描述:"贮存你自己的蜜蜂"
		},
		MUSHROOM_FARM =
		{
			STUFFED = "No room for Mush...",		-- 物品名:"蘑菇农场"->塞，满了？？ 制造描述:"种蘑菇"
			LOTS = "Hmm~ here grows lots of treats.",		-- 物品名:"蘑菇农场"->很多 制造描述:"种蘑菇"
			SOME = "They are thriving.",		-- 物品名:"蘑菇农场"->有一些 制造描述:"种蘑菇"
			EMPTY = "Need a kid with big big cap.",		-- 物品名:"蘑菇农场" 制造描述:"种蘑菇"
			ROTTEN = "Need to find him a creepy log.",		-- 物品名:"蘑菇农场"->腐烂的--需要活木 制造描述:"种蘑菇"
			BURNT = "Mush got their rooms burnt.",		-- 物品名:"蘑菇农场"->烧焦的 制造描述:"种蘑菇"
			SNOWCOVERED = "Maybe they are sleeping?",		-- 物品名:"蘑菇农场"->被雪覆盖 制造描述:"种蘑菇"
		},
		BEEFALO =
		{
			FOLLOWER = "Follow me!",		-- 物品名:"牦牛"->追随者
			GENERIC = "Big thick fur.",		-- 物品名:"牦牛"->默认
			NAKED = "You look prettier with your coat on.些",		-- 物品名:"牦牛"->牛毛被刮干净了
			SLEEPING = "Have a lovely night, Mr. Beefalo~",		-- 物品名:"牦牛"->睡着了
            DOMESTICATED = "My friend!",		-- 物品名:"牦牛"->驯化牛
            ORNERY = "Please don't be mad at me.",		-- 物品名:"牦牛"->战斗牛
            RIDER = "I wanna ride on you, can I?",		-- 物品名:"牦牛"->骑行牛
            PUDGY = "Big fluffy is so big!",		-- 物品名:"牦牛"->胖牛
		},
		BEEFALOHAT = "With even larger horn?",		-- 物品名:"牛角帽" 制造描述:"成为牛群中的一员！连气味也变得一样"
		BEEFALOWOOL = "Soft and tight fur wool.",		-- 物品名:"牛毛"
		BEEHAT = "Can't see anything with this on.",		-- 物品名:"养蜂帽" 制造描述:"防止被愤怒的蜜蜂蜇伤"
        BEESWAX = "Hush! I stole this from bees' home.",		-- 物品名:"蜂蜡" 制造描述:"一种有用的防腐蜂蜡"
		BEEHIVE = "Yeah this is the home of bees.",		-- 物品名:"野生蜂窝"
		BEEMINE = "Watch out for this.",		-- 物品名:"蜜蜂地雷" 制造描述:"变成武器的蜜蜂会出什么问题？"
		BEEMINE_MAXWELL = "I don't like it buzzing...",		-- 物品名:"麦斯威尔的蚊子陷阱"->单机 麦斯威尔的蚊子陷阱
		BERRIES = "Fruit of a sweet taste.",		-- 物品名:"浆果"
		BERRIES_COOKED = "Even sweeter when it's cooked.",		-- 物品名:"烤浆果"
        BERRIES_JUICY = "Oh! Big and juicy.",		-- 物品名:"多汁浆果"
        BERRIES_JUICY_COOKED = "I wanna eat them all.",		-- 物品名:"烤多汁浆果"
		BERRYBUSH =
		{
			BARREN = "Get some poop on it, then.",		-- 物品名:"浆果丛"
			WITHERED = "The weather's too dry.",		-- 物品名:"浆果丛"->枯萎了
			GENERIC = "A snack shop, for free!",		-- 物品名:"浆果丛"->默认
			PICKED = "Gotta wait for a while.",		-- 物品名:"浆果丛"->被采完了
			DISEASED = "The sick fruit is no longer edible.",		-- 物品名:"浆果丛"->生病了
			DISEASING = "It doesn't look alright...",		-- 物品名:"浆果丛"->正在生病？？
			BURNING = "Oh...good bye.",		-- 物品名:"浆果丛"->正在燃烧
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "Get some poop on it, then.",		-- 物品名:"多汁浆果丛"
			WITHERED = "It ain't like dry, either.",		-- 物品名:"多汁浆果丛"->枯萎了
			GENERIC = "I gotta eat the snack right after picking it.",		-- 物品名:"多汁浆果丛"->默认
			PICKED = "Another little treat waiting for me?",		-- 物品名:"多汁浆果丛"->被采完了
			DISEASED = "You, you don't look wholesome, do you?",		-- 物品名:"多汁浆果丛"->生病了
			DISEASING = "It doesn't look alright...",		-- 物品名:"多汁浆果丛"->正在生病？？
			BURNING = "It must be suffering!",		-- 物品名:"多汁浆果丛"->正在燃烧
		},
		BIGFOOT = "Big big, so big a foot and toes.",		-- 物品名:"大脚怪"->单机 大脚怪
		BIRDCAGE =
		{
			GENERIC = "A warm home for birds.",		-- 物品名:"鸟笼"->默认 制造描述:"为你的鸟类朋友提供一个幸福的家"
			OCCUPIED = "And now the bird can't go anywhere.",		-- 物品名:"鸟笼"->被占领 制造描述:"为你的鸟类朋友提供一个幸福的家"
			SLEEPING = "Have a nice sleep, little bird~",		-- 物品名:"鸟笼"->睡着了 制造描述:"为你的鸟类朋友提供一个幸福的家"
			HUNGRY = "My bird needs something to feed.",		-- 物品名:"鸟笼"->有点饿了 制造描述:"为你的鸟类朋友提供一个幸福的家"
			STARVING = "Oh, it looks so hungry.",		-- 物品名:"鸟笼"->挨饿 制造描述:"为你的鸟类朋友提供一个幸福的家"
			DEAD = "Ouch, I'm a terrible bird keeper.",		-- 物品名:"鸟笼"->死了 制造描述:"为你的鸟类朋友提供一个幸福的家"
			SKELETON = "......",		-- 物品名:"骷髅"
		},
		BIRDTRAP = "Used to catch a bird.",		-- 物品名:"捕鸟陷阱" 制造描述:"捕捉会飞的动物"
		CAVE_BANANA_BURNT = "It's terrible...",		-- 物品名:"鸟笼"->烧焦的洞穴香蕉树 制造描述:"为你的鸟类朋友提供一个幸福的家"
		BIRD_EGG = "Is there a small bird inside?",		-- 物品名:"鸟蛋"
		BIRD_EGG_COOKED = "Don't like it.",		-- 物品名:"煎蛋"
		BISHOP = "An active metal man!",		-- 物品名:"发条主教"
		BLOWDART_FIRE = "I wanna try this!",		-- 物品名:"火焰吹箭" 制造描述:"向你的敌人喷火"
		BLOWDART_SLEEP = "Time to sleep, baby~",		-- 物品名:"催眠吹箭" 制造描述:"催眠你的敌人"
		BLOWDART_PIPE = "Biu biu biu!",		-- 物品名:"吹箭" 制造描述:"向你的敌人喷射利齿"
		BLOWDART_YELLOW = "Looks powerful!",		-- 物品名:"雷电吹箭" 制造描述:"朝你的敌人放闪电"
		BLUEAMULET = "Cold like the ice.",		-- 物品名:"寒冰护符" 制造描述:"多么冰冷酷炫的护符"
		BLUEGEM = "I'd love to have this beauty insetted in my Moon Palace bedroom.",		-- 物品名:"蓝宝石"
		BLUEPRINT = 
		{ 
            COMMON = "Oh! You got meticulous instructions!",		-- 物品名:"蓝图"
            RARE = "So complicated...",		-- 物品名:"蓝图"->罕见的
        },
        SKETCH = "Oh! A carcass of a miserable guy.",		-- 物品名:"{item}骨架"
		BLUE_CAP = "Good for my stomach, but bad for my head.",		-- 物品名:"采摘的蓝蘑菇"
		BLUE_CAP_COOKED = "Now it smells so different.",		-- 物品名:"烤蓝蘑菇"
		BLUE_MUSHROOM =
		{
			GENERIC = "Oh, food for the dinner soup!",		-- 物品名:"蓝蘑菇"->默认
			INGROUND = "I'll come back when its color got deeper.",		-- 物品名:"蓝蘑菇"->在地里面
			PICKED = "Grow up again, buddy!",		-- 物品名:"蓝蘑菇"->被采完了
		},
		BOARDS = "Construction material from Mr. Tree.",		-- 物品名:"木板" 制造描述:"更平直的木头"
		BONESHARD = "Could it be a legacy?",		-- 物品名:"骨头碎片"
		BONESTEW = "Dirty stuff mixed with worldly stuffs.",		-- 物品名:"炖肉汤"
		BUGNET = "Let's go camping and catch butterflies.",		-- 物品名:"捕虫网" 制造描述:"抓虫子用的"
		BUSHHAT = "Hee-hee, you can't see me~",		-- 物品名:"灌木丛帽" 制造描述:"很好的伪装！"
		BUTTER = "Smells like a fragrant flower~ Nice!",		-- 物品名:"黄油"
		BUTTERFLY =
		{
			GENERIC = "At night, butterfires fly into the candle curtain...",		-- 物品名:"蝴蝶"->默认
			HELD = "I got you!",		-- 物品名:"蝴蝶"->拿在手里
		},
		BUTTERFLYMUFFIN = "Delicious little muffin.",		-- 物品名:"蝴蝶松饼"
		BUTTERFLYWINGS = "Poor little thing...",		-- 物品名:"蝴蝶翅膀"
		BUZZARD = "Bald black bird.",		-- 物品名:"秃鹫"
		SHADOWDIGGER = "Opps! This is his dark magic!",		-- 物品名:"蝴蝶"
		CACTUS = 
		{
			GENERIC = "With many spikes...",		-- 物品名:"仙人掌"->默认
			PICKED = "It's ok if you don't grow back.",		-- 物品名:"仙人掌"->被采完了
		},
		CACTUS_MEAT_COOKED = "Now it's good to eat!",		-- 物品名:"烤仙人掌肉"
		CACTUS_MEAT = "Ouch! Still so many spikes!",		-- 物品名:"仙人掌肉"
		CACTUS_FLOWER = "It looks doesn't very nice but tastes great!",		-- 物品名:"仙人掌花"
		COLDFIRE =
		{
			EMBERS = "Fire's about to die.",		-- 物品名:"冰火"->即将熄灭 制造描述:"这火是越烤越冷的冰火"
			GENERIC = "Let's get around the campfire and share stories~",		-- 物品名:"冰火"->默认 制造描述:"这火是越烤越冷的冰火"
			HIGH = "It's getting too big!",		-- 物品名:"冰火"->高 制造描述:"这火是越烤越冷的冰火"
			LOW = "The fire's fading away, so is the light.",		-- 物品名:"冰火"->低？ 制造描述:"这火是越烤越冷的冰火"
			NORMAL = "Fire that feels like ice?",		-- 物品名:"冰火"->普通 制造描述:"这火是越烤越冷的冰火"
			OUT = "Good bye, Mrs. Fire.",		-- 物品名:"冰火"->出去？外面？ 制造描述:"这火是越烤越冷的冰火"
		},
		CAMPFIRE =
		{
			EMBERS = "Fire's about to die.",		-- 物品名:"营火"->即将熄灭 制造描述:"燃烧时发出光亮"
			GENERIC = "Let's get around the campfire and share stories~",		-- 物品名:"营火"->默认 制造描述:"燃烧时发出光亮"
			HIGH = "It's getting too big!",		-- 物品名:"营火"->高 制造描述:"燃烧时发出光亮"
			LOW = "The fire's fading away, so is the light.",		-- 物品名:"营火"->低？ 制造描述:"燃烧时发出光亮"
			NORMAL = "Warm and comfortable.",		-- 物品名:"营火"->普通 制造描述:"燃烧时发出光亮"
			OUT = "Good bye, Mrs. Fire.",		-- 物品名:"营火"->出去？外面？ 制造描述:"燃烧时发出光亮"
		},
		CANE = "Do you think I need to walk with this?",		-- 物品名:"拐棍" 制造描述:"泰然自若地快步走"
		CATCOON = "Hey you are so cute!",		-- 物品名:"浣熊猫"
		CATCOONDEN = 
		{
			GENERIC = "Somebody is scratching it from inside...",		-- 物品名:"空心树桩"->默认
			EMPTY = "Seems that nobody's at home.",		-- 物品名:"空心树桩"
		},
		CATCOONHAT = "I can remember you from this hat.",		-- 物品名:"浣熊猫帽子" 制造描述:"适合那些重视温暖甚于朋友的人"
		COONTAIL = "I miss playing with you...",		-- 物品名:"浣熊猫尾巴"
		CARROT = "Sweet and crispy big carrots!",		-- 物品名:"胡萝卜"
		CARROT_COOKED = "Raw carrots are actually crispier, but I like you too.",		-- 物品名:"烤胡萝卜"
		CARROT_PLANTED = "I wanna grow more carrots!",		-- 物品名:"胡萝卜"
		CARROT_SEEDS = "One seed, one bunch of carrots!!! Hopefully...",		-- 物品名:"胡萝卜种子"
		CARTOGRAPHYDESK =
		{
			GENERIC = "I need a map!",		-- 物品名:"制图桌"->默认 制造描述:"准确地告诉别人你去过哪里"
			BURNING = "My way to future is on fire...",		-- 物品名:"制图桌"->正在燃烧 制造描述:"准确地告诉别人你去过哪里"
			BURNT = "Gone...",		-- 物品名:"制图桌"->烧焦的 制造描述:"准确地告诉别人你去过哪里"
		},
		WATERMELON_SEEDS = "Can get me more watermelons.",		-- 物品名:"西瓜种子"
		CAVE_FERN = "Thriving little life in the cave.",		-- 物品名:"蕨类植物"
		CHARCOAL = "It gets my paws dirty.",		-- 物品名:"木炭"
        CHESSPIECE_PAWN = "The smallest of them all!",		-- 物品名:"卒子棋子"
        CHESSPIECE_ROOK =
        {
            GENERIC = "The castle's so small.",		-- 物品名:"战车棋子"->默认
            STRUGGLE = "Ah it's moving!!!",		-- 物品名:"战车棋子"->三基佬棋子晃动
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "Looks so much like the metal guy!",		-- 物品名:"骑士棋子"->默认
            STRUGGLE = "Ah it's moving!!!",		-- 物品名:"骑士棋子"->三基佬棋子晃动
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "So sharp on the top!",		-- 物品名:"主教棋子"->默认
            STRUGGLE = "Ah it's moving!!!",		-- 物品名:"主教棋子"->三基佬棋子晃动
        },
        CHESSPIECE_MUSE = "Scary lady...",		-- 物品名:"女王棋子"
        CHESSPIECE_FORMAL = "Why are people around here so weird?",		-- 物品名:"国王棋子"
        CHESSPIECE_HORNUCOPIA = "Full of feasts!",		-- 物品名:"丰饶角雕刻"
        CHESSPIECE_PIPE = "It's so weird without a cover.",		-- 物品名:"泡泡烟斗雕塑"
        CHESSPIECE_DEERCLOPS = "Bothers us no more.",		-- 物品名:"独眼巨鹿棋子"
        CHESSPIECE_BEARGER = "Ah!",		-- 物品名:"熊獾棋子"
        CHESSPIECE_MOOSEGOOSE =
        {
            "Haha! Look at her face!",		-- 物品名:"驼鹿棋子" 制造描述:未找到
        },
        CHESSPIECE_DRAGONFLY = "Surprised, and with eyes wide open.",		-- 物品名:"龙蝇棋子"
        CHESSPIECE_BUTTERFLY = "Looks ugly.",		-- 物品名:"月蛾棋子"
        CHESSPIECE_ANCHOR = "Why is there an anchor on the ground?",		-- 物品名:"锚棋子"
        CHESSPIECE_MOON = "Ha, looks just like real!",		-- 物品名:"\\“月亮\\” 棋子"
        CHESSPIECE_CARRAT = "Oh-ho! Looks just as delicious!",		-- 物品名:"胡萝卜鼠雕像"
        CHESSJUNK1 = "It's broken metal trash.",		-- 物品名:"损坏的发条装置"
        CHESSJUNK2 = "I'm not the spoiler of this.",		-- 物品名:"损坏的发条装置"
        CHESSJUNK3 = "It's such a mess!",		-- 物品名:"损坏的发条装置"
		CHESTER = "Furry Mr. Chest, I like you!",		-- 物品名:"切斯特"
		CHESTER_EYEBONE =
		{
			GENERIC = "It's looking at me...",		-- 物品名:"眼骨"->默认
			WAITING = "No! Wake up! It's all my fault...",		-- 物品名:"眼骨"->需要等待
		},
		COOKEDMANDRAKE = "Why this ginseng has an old man's face? Shouldn't it be a baby's",		-- 物品名:"烤曼德拉草"
		COOKEDMEAT = "A fairy lady never eat meat.",		-- 物品名:"烤大肉"
		COOKEDMONSTERMEAT = "I don't want to embarrass",		-- 物品名:"烤怪物肉"
		COOKEDSMALLMEAT = "I don't want it.",		-- 物品名:"烤小肉"
		COOKPOT =
		{
			COOKING_LONG = "A feast need time...",		-- 物品名:"烹饪锅"->饭还需要很久 制造描述:"制作更好的食物"
			COOKING_SHORT = "It's coming out, just a few seconds...",		-- 物品名:"烹饪锅"->饭快做好了 制造描述:"制作更好的食物"
			DONE = "Time to enjoy!!",		-- 物品名:"烹饪锅"->完成了 制造描述:"制作更好的食物"
			EMPTY = "Hope there's food in it...",		-- 物品名:"烹饪锅" 制造描述:"制作更好的食物"
			BURNT = "Ouch...",		-- 物品名:"烹饪锅"->烧焦的 制造描述:"制作更好的食物"
		},
		CORN = "I like gnawing corncob!",		-- 物品名:"玉米"
		CORN_COOKED = "It's cracked open.",		-- 物品名:"爆米花"
		CORN_SEEDS = "Can cultivate more corns!",		-- 物品名:"玉米种子"
        CANARY =
		{
			GENERIC = "Little yellow bird.",		-- 物品名:"金丝雀"->默认
			HELD = "Caught ya!",		-- 物品名:"金丝雀"->拿在手里
		},
        CANARY_POISONED = "What happens to you, friend?",		-- 物品名:"金丝雀（有翅膀的动物）"
		CRITTERLAB = "I saw some tiny shadows moving around inside...",		-- 物品名:"岩石巢穴"
        CRITTER_GLOMLING = "Light-hearted little worm!",		-- 物品名:"小罗姆"
        CRITTER_DRAGONLING = "We are a cohesive team!",		-- 物品名:"蜂群卫士"
		CRITTER_LAMB = "Don't worry, I'll protect you!",		-- 物品名:"小钢羊"
        CRITTER_PUPPY = "Wanna jump on my lap?",		-- 物品名:"小座狼"
        CRITTER_KITTEN = "I know you always love me~",		-- 物品名:"小浣猫"
        CRITTER_PERDLING = "Hey what's up bird~",		-- 物品名:"小火鸡"
		CRITTER_LUNARMOTHLING = "You are my childhood's favorite friend!",		-- 物品名:"小蛾子"
		CROW =
		{
			GENERIC = "A black bird.",		-- 物品名:"乌鸦"->默认
			HELD = "I'll go find you a new home.",		-- 物品名:"乌鸦"->拿在手里
		},
		CUTGRASS = "Can knit a lot of stuffs.",		-- 物品名:"草"
		CUTREEDS = "The muds is full of useful stuffs.",		-- 物品名:"采下的芦苇"
		CUTSTONE = "Stone and stone pieces.",		-- 物品名:"石砖" 制造描述:"切成正方形的石头"
		DEADLYFEAST = "I shouldn't eat that.",		-- 物品名:"致命的盛宴"->致命盛宴 单机
		DEER =
		{
			GENERIC = "You need a hair cut, buddy.",		-- 物品名:"无眼鹿"->默认
			ANTLER = "The antler grew up.",		-- 物品名:"无眼鹿"
		},
        DEER_ANTLER = "A deer antler!",		-- 物品名:"鹿角"
        DEER_GEMMED = "There's something wrong with this deer's head.",		-- 物品名:"无眼鹿"
		DEERCLOPS = "She, she doesn't look happy...",		-- 物品名:"独眼巨鹿"
		DEERCLOPS_EYEBALL = "Oh wow! Can I touch it?",		-- 物品名:"独眼巨鹿眼球"
		EYEBRELLAHAT =	"What is she looking at?",		-- 物品名:"眼球伞" 制造描述:"面向天空的眼球让你保持干燥"
		DEPLETED_GRASS =
		{
			GENERIC = "Some grass.",		-- 物品名:"草"->默认
		},
        GOGGLESHAT = "I am a fancy fairy hare~",		-- 物品名:"时髦的护目镜" 制造描述:"你可以瞪大眼睛看装饰性护目镜"
        DESERTHAT = "I hate desert, but with this desert feels better.",		-- 物品名:"沙漠护目镜" 制造描述:"从你的眼睛里把沙子揉出来"
		DEVTOOL = "I like this!",		-- 物品名:"开发工具"
		DEVTOOL_NODEV = "Can't craft this.",		-- 物品名:"草"
		DIRTPILE = "Is there someone living under this?",		-- 物品名:"可疑的土堆"
		DIVININGROD =
		{
			COLD = "The voice fades away...",		-- 物品名:"冻伤"->冷了
			GENERIC = "What's inside of this box?",		-- 物品名:"探测杖"->默认 制造描述:"肯定有方法可以离开这里..."
			HOT = "It, it's shouting to me?!",		-- 物品名:"中暑"->热了
			WARM = "The voice's getting louder.",		-- 物品名:"探测杖"->温暖 制造描述:"肯定有方法可以离开这里..."
			WARMER = "It begins screaming!!",		-- 物品名:"探测杖" 制造描述:"肯定有方法可以离开这里..."
		},
		DIVININGRODBASE =
		{
			GENERIC = "What is this?",		-- 物品名:"探测杖底座"->默认
			READY = "Lacks something to be ready.",		-- 物品名:"探测杖底座"->准备好的 满的
			UNLOCKED = "I can now use it, I think.",		-- 物品名:"探测杖底座"->解锁了
		},
		DIVININGRODSTART = "This is really weird.",		-- 物品名:"探测杖底座"->单机探测杖底座
		DRAGONFLY = "Do your big eyes have medicinal value?",		-- 物品名:"龙蝇"
		ARMORDRAGONFLY = "Now I'm covered with scales~",		-- 物品名:"鳞甲" 制造描述:"脾气火爆的盔甲"
		DRAGON_SCALES = "So beautiful~",		-- 物品名:"鳞片"
		DRAGONFLYCHEST = "I like the desgin of this chest.",		-- 物品名:"巨鳞宝箱" 制造描述:"一种结实且防火的容器"
		DRAGONFLYFURNACE = 
		{
			HAMMERED = "I got it broken...",		-- 物品名:"龙鳞火炉"->被锤了 制造描述:"给自己建造一个苍蝇暖炉"
			GENERIC = "Sleep beside this is very warm, I think...", --no gems		-- 物品名:"龙鳞火炉"->默认 制造描述:"给自己建造一个苍蝇暖炉"
			NORMAL = "You looks friendly, haha, and bit funny.", --one gem		-- 物品名:"龙鳞火炉"->普通 制造描述:"给自己建造一个苍蝇暖炉"
			HIGH = "Hot!!! So hot!!!", --two gems		-- 物品名:"龙鳞火炉"->高 制造描述:"给自己建造一个苍蝇暖炉"
		},
        HUTCH = "I love your cute little face!",		-- 物品名:"哈奇"
        HUTCH_FISHBOWL =
        {
            GENERIC = "Hello! My fishy friend~",		-- 物品名:"星空"->默认
            WAITING = "Taking a nap?",		-- 物品名:"星空"->需要等待
        },
		LAVASPIT = 
		{
			HOT = "Hot and scolding stones!",		-- 物品名:"中暑"->热了
			COOL = "Now it's simply a quiet stone.",		-- 物品名:"龙蝇唾液"
		},
		LAVA_POND = "Unbearable to swim inside.",		-- 物品名:"岩浆池"
		LAVAE = "Oh, you are just a baby, aren't you?",		-- 物品名:"岩浆虫"
		LAVAE_COCOON = "Time to take a nap, a long one.",		-- 物品名:"冷冻虫卵"
		LAVAE_PET = 
		{
			STARVING = "Gotta find something to eat for you quick!",		-- 物品名:"超级可爱岩浆虫"->挨饿
			HUNGRY = "Ya want food?",		-- 物品名:"超级可爱岩浆虫"->有点饿了
			CONTENT = "You look excited and happy~",		-- 物品名:"超级可爱岩浆虫"->内容？？？、
			GENERIC = "Her hug is so warm~",		-- 物品名:"超级可爱岩浆虫"->默认
		},
		LAVAE_EGG = 
		{
			GENERIC = "The baby is scratching the shell from inside.",		-- 物品名:"岩浆虫卵"->默认
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "You want a hug from your sister?",		-- 物品名:"冻伤"->冷了
			COMFY = "The inside feels so warm.",		-- 物品名:"岩浆虫卵"->舒服的
		},
		LAVAE_TOOTH = "This is the baby's deciduous tooth.",		-- 物品名:"岩浆虫尖牙"
		DRAGONFRUIT = "Would you spit your seed out?",		-- 物品名:"火龙果"
		DRAGONFRUIT_COOKED = "Tastes like a kind of medicine herb.",		-- 物品名:"烤火龙果"
		DRAGONFRUIT_SEEDS = "Beautiful fruit seed, though small.",		-- 物品名:"火龙果种子"
		DRAGONPIE = "Hmmm~ This is the best pie ever!",		-- 物品名:"火龙果派"
		DRUMSTICK = "What a pity~",		-- 物品名:"鸟腿"
		DRUMSTICK_COOKED = "What! You put a bird in fire?",		-- 物品名:"炸鸟腿"
		DUG_BERRYBUSH = "Follow me to my garden!",		-- 物品名:"浆果丛"
		DUG_BERRYBUSH_JUICY = "I'm taking you to my garden, ok?",		-- 物品名:"多汁浆果丛"
		DUG_GRASS = "Where shall I put this?",		-- 物品名:"草丛"
		DUG_MARSH_BUSH = "A tiny sense of home~",		-- 物品名:"尖刺灌木"
		DUG_SAPLING = "I'll go get you a nice place!",		-- 物品名:"树苗"
		DURIAN = "Smells like poop...",		-- 物品名:"榴莲"
		DURIAN_COOKED = "What a stench!",		-- 物品名:"超臭榴莲"
		DURIAN_SEEDS = "Smelly seed of a smelly fruit.",		-- 物品名:"榴莲种子"
		EARMUFFSHAT = "Can...can we not catch them/(ㄒoㄒ)/~~",		-- 物品名:"兔耳罩" 制造描述:"毛茸茸的保暖物品"
		EGGPLANT = "Big and purple and tastes really good~",		-- 物品名:"茄子"
		EGGPLANT_COOKED = "Has a purple cuisine taste.",		-- 物品名:"烤茄子"
		EGGPLANT_SEEDS = "Grows more purple veggies for me, please!",		-- 物品名:"茄子种子"
		ENDTABLE = 
		{
			BURNT = "This definitely is done by that incendiary girl!",		-- 物品名:"茶几"->烧焦的 制造描述:"一张装饰桌"
			GENERIC = "The flower isn't pretty at all...",		-- 物品名:"茶几"->默认 制造描述:"一张装饰桌"
			EMPTY = "I think having a fishbowl here is better than a flower...",		-- 物品名:"茶几" 制造描述:"一张装饰桌"
			WILTED = "At least a fishbowl won't wither like this flower does.",		-- 物品名:"茶几"->枯萎的 制造描述:"一张装饰桌"
			FRESHLIGHT = "A friendly little light.",		-- 物品名:"茶几"->茶几-新的发光的 制造描述:"一张装饰桌"
			OLDLIGHT = "I need a new light for this...", -- will be wilted soon, light radius will be very small at this point		-- 物品名:"茶几"->茶几-旧的发光的 制造描述:"一张装饰桌"
		},
		DECIDUOUSTREE = 
		{
			BURNING = "How can I help you Mr. Tree!",		-- 物品名:"桦树"->正在燃烧
			BURNT = "...Good bye, Mr. Tree...",		-- 物品名:"桦树"->烧焦的
			CHOPPED = "Into small pieces...",		-- 物品名:"桦树"->被砍了
			POISON = "Who are you staring at?",		-- 物品名:"桦树"->毒化的
			GENERIC = "A thriving sir, Tree.",		-- 物品名:"桦树"->默认
		},
		ACORN = "A baby tree.",		-- 物品名:"桦木果"
        ACORN_SAPLING = "Grow up!",		-- 物品名:"桦树树苗"
		ACORN_COOKED = "Tastes good.",		-- 物品名:"烤桦木果"
		BIRCHNUTDRAKE = "Haha, you look funny.",		-- 物品名:"桦木果精"
		EVERGREEN =
		{
			BURNING = "I should chop it down first, then for fire.",		-- 物品名:"常青树"->正在燃烧
			BURNT = "Good bye, Mr. Tree...",		-- 物品名:"常青树"->烧焦的
			CHOPPED = "A piece of Mr. Tree...",		-- 物品名:"常青树"->被砍了
			GENERIC = "I got experience on caring plants~",		-- 物品名:"常青树"->默认
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "I should chop it down first, then for fire.",		-- 物品名:"粗壮常青树"->正在燃烧
			BURNT = "Good bye, Mr. Tree...",		-- 物品名:"粗壮常青树"->烧焦的
			CHOPPED = "A piece of Mr. Tree...",		-- 物品名:"粗壮常青树"->被砍了
			GENERIC = "Mr. tree looks skinny, gotta take more care of it.",		-- 物品名:"粗壮常青树"->默认
		},
		TWIGGYTREE = 
		{
			BURNING = "I should chop it down first, then for fire.",		-- 物品名:"繁茂的树木"->正在燃烧
			BURNT = "Good bye, Mr. Tree...",		-- 物品名:"繁茂的树木"->烧焦的
			CHOPPED = "A piece of Mr. Tree...",		-- 物品名:"繁茂的树木"->被砍了
			GENERIC = "Another skinny Mr. Tree...",					-- 物品名:"繁茂的树木"->默认
			DISEASED = "I think he went sick.",		-- 物品名:"繁茂的树木"->生病了
		},
		TWIGGY_NUT_SAPLING = "You will grow up one day!",		-- 物品名:"繁茂的树苗"
        TWIGGY_OLD = "She's lived in forest for a long time.",		-- 物品名:"繁茂的树木"
		TWIGGY_NUT = "A Tree baby.",		-- 物品名:"繁茂的针叶树"->多枝树果
		EYEPLANT = "Is she looking around?",		-- 物品名:"眼球草"
		INSPECTSELF = "Wanna see my grimace?",		-- 物品名:"繁茂的树木"->检查自己
		FARMPLOT =
		{
			GENERIC = "Can grow veggies of my own?!!",		-- 物品名:未找到
			GROWING = "A growing snack~",		-- 物品名:未找到
			NEEDSFERTILIZER = "Let's find some poop for it.",		-- 物品名:未找到
			BURNT = "Too scorched to plant anything.",		-- 物品名:未找到
		},
		FEATHERHAT = "Not only looks like birds, but also thinks like birds.",		-- 物品名:"羽毛帽" 制造描述:"头上的装饰"
		FEATHER_CROW = "Black birds' feather.",		-- 物品名:"黑色羽毛"
		FEATHER_ROBIN = "Red birds' feather.",		-- 物品名:"红色羽毛"
		FEATHER_ROBIN_WINTER = "Snowy birds' feather.",		-- 物品名:"雪雀羽毛"
		FEATHER_CANARY = "Yellow birds' feather.",		-- 物品名:"橙黄羽毛"
		FEATHERPENCIL = "One delicate member of the Stationaries.",		-- 物品名:"羽毛笔" 制造描述:"是的，羽毛是必须的"
		FEM_PUPPET = "Are you stuck?",		-- 物品名:未找到
		FIREFLIES =
		{
			GENERIC = "The clear blue moonlight is dancing around it.",		-- 物品名:"萤火虫"->默认
			HELD = "Don't fly in my clothes, haha!",		-- 物品名:"萤火虫"->拿在手里
		},
		FIREHOUND = "I don't like the look of it.",		-- 物品名:"火猎犬"
		FIREPIT =
		{
			EMBERS = "Fire's about to die.",		-- 物品名:"石头营火"->即将熄灭 制造描述:"一种更安全、更高效的营火"
			GENERIC = "Let's get around the campfire and share stories~",		-- 物品名:"石头营火"->默认 制造描述:"一种更安全、更高效的营火"
			HIGH = "What a flame!",		-- 物品名:"石头营火"->高 制造描述:"一种更安全、更高效的营火"
			LOW = "The flame is sitting in the pit, tired.",		-- 物品名:"石头营火"->低？ 制造描述:"一种更安全、更高效的营火"
			NORMAL = "Comfy warmth.",		-- 物品名:"石头营火"->普通 制造描述:"一种更安全、更高效的营火"
			OUT = "We can kindle it again later.",		-- 物品名:"石头营火"->出去？外面？ 制造描述:"一种更安全、更高效的营火"
		},
		COLDFIREPIT =
		{
			EMBERS = "Fire's about to die.",		-- 物品名:"石头冰火"->即将熄灭 制造描述:"燃烧效率更高，但仍然越烤越冷"
			GENERIC = "Let's get around the campfire and share stories~",		-- 物品名:"石头冰火"->默认 制造描述:"燃烧效率更高，但仍然越烤越冷"
			HIGH = "What a flame!",		-- 物品名:"石头冰火"->高 制造描述:"燃烧效率更高，但仍然越烤越冷"
			LOW = "The flame is sitting in the pit, tired.",		-- 物品名:"石头冰火"->低？ 制造描述:"燃烧效率更高，但仍然越烤越冷"
			NORMAL = "A cold flame?",		-- 物品名:"石头冰火"->普通 制造描述:"燃烧效率更高，但仍然越烤越冷"
			OUT = "We can kindle it again later.",		-- 物品名:"石头冰火"->出去？外面？ 制造描述:"燃烧效率更高，但仍然越烤越冷"
		},
		FIRESTAFF = "A relic of Fire God?",		-- 物品名:"火魔杖" 制造描述:"利用火焰的力量！"
		FIRESUPPRESSOR = 
		{	
			ON = "A diligent machine!",		-- 物品名:"雪球发射器"->开启 制造描述:"拯救植物，扑灭火焰，可添加燃料"
			OFF = "It's having a rest.",		-- 物品名:"雪球发射器"->关闭 制造描述:"拯救植物，扑灭火焰，可添加燃料"
			LOWFUEL = "It needs some fuel.",		-- 物品名:"雪球发射器"->燃料不足 制造描述:"拯救植物，扑灭火焰，可添加燃料"
		},
		FISH = "Ah! So cute~",		-- 物品名:"鱼"
		FISHINGROD = "Let's go fishing!",		-- 物品名:"钓竿" 制造描述:"去钓鱼为了鱼"
		FISHSTICKS = "Why do you do this to friendly fish?!",		-- 物品名:"炸鱼排"
		FISHTACOS = "Fish ain't happy in there...",		-- 物品名:"鱼肉玉米卷"
		FISH_COOKED = "Fish is friend! Not food!",		-- 物品名:"烤鱼"
		FLINT = "Sharp stones!",		-- 物品名:"燧石"
		FLOWER = 
		{
            GENERIC = "Jade grows out of a fragrant wind, flourishes as water ripples.",		-- 物品名:"花"->默认
            ROSE = "Roses locks a window, other flowers urge it to open~",		-- 物品名:"花"->玫瑰
        },
        FLOWER_WITHERED = "Withered failure of a beauty...",		-- 物品名:"枯萎的花"
		FLOWERHAT = "Petals protect my mind!",		-- 物品名:"花环" 制造描述:"放松神经的东西"
		FLOWER_EVIL = "Of evils...",		-- 物品名:"邪恶花"
		FOLIAGE = "Purple is my favorite colors~",		-- 物品名:"蕨叶"
		FOOTBALLHAT = "I wanna play football with you!",		-- 物品名:"橄榄球头盔" 制造描述:"保护你的脑壳"
        FOSSIL_PIECE = "A creepy bone piece...",		-- 物品名:"化石碎片"
        FOSSIL_STALKER =
        {
			GENERIC = "Need a few more creepy bones.",		-- 物品名:"化石骨架"->默认
			FUNNY = "Does he look like this always?",		-- 物品名:"化石骨架"->趣味？？
			COMPLETE = "Ok...and why are we doing this?",		-- 物品名:"化石骨架"->准备好了
        },
        STALKER = "Skeleton under dark magic!",		-- 物品名:"复活的骨架"
        STALKER_ATRIUM = "It, it's REAL!!!!",		-- 物品名:"远古织影者"
        STALKER_MINION = "A creepy guy.",		-- 物品名:"编织暗影"
        THURIBLE = "A thurible with shadowy smoke...",		-- 物品名:"影子香炉"
        ATRIUM_OVERGROWTH = "Strange words give a headache...",		-- 物品名:"古代的方尖碑"
		FROG =
		{
			DEAD = "Will he go the quagmire of the heaven?",		-- 物品名:"青蛙"->死了
			GENERIC = "How you doing buddy?",		-- 物品名:"青蛙"->默认
			SLEEPING = "Have a lovely sleep, little prince~",		-- 物品名:"青蛙"->睡着了
		},
		FROGGLEBUNWICH = "Oh, a horrible sandwich...",		-- 物品名:"蛙腿三明治"
		FROGLEGS = "Poor prince...",		-- 物品名:"蛙腿"
		FROGLEGS_COOKED = "Can't even bear to look at it.",		-- 物品名:"烤蛙腿"
		FRUITMEDLEY = "Fruits and...biscuit...just a medley.",		-- 物品名:"水果圣代"
		FURTUFT = "A strange smell.", 		-- 物品名:"毛丛"
		GEARS = "The organs of metal men.",		-- 物品名:"齿轮"
		GHOST = "Leave me alone!",		-- 物品名:"幽灵"
		GOLDENAXE = "Gold is more durable.",		-- 物品名:"黄金斧头" 制造描述:"砍树也要有调！"
		GOLDENPICKAXE = "More solid than regular stone-breaking stuff.",		-- 物品名:"黄金鹤嘴锄" 制造描述:"像大Boss一样砸碎岩石"
		GOLDENPITCHFORK = "High-level agricultural tool.",		-- 物品名:"黄金干草叉" 制造描述:"重新布置整个世界"
		GOLDENSHOVEL = "Advanced digging tool.",		-- 物品名:"黄金铲子" 制造描述:"挖掘作用相同，但使用寿命更长"
		GOLDNUGGET = "Shinny gold! Wow!",		-- 物品名:"金块"
		GRASS =
		{
			BARREN = "It needs more poops.",		-- 物品名:"草"
			WITHERED = "It's vehemently sweating!",		-- 物品名:"草"->枯萎了
			BURNING = "Are you ok there?!",		-- 物品名:"草"->正在燃烧
			GENERIC = "A few stalks of grass.",		-- 物品名:"草"->默认
			PICKED = "Hasn't grown back yet.",		-- 物品名:"草"->被采完了
			DISEASED = "It's sick. I hope to cure it...",		-- 物品名:"草"->生病了
			DISEASING = "It's getting strange...",		-- 物品名:"草"->正在生病？？
		},
		GRASSGEKKO = 
		{
			GENERIC = "I should approach it stealthily...",			-- 物品名:"草地壁虎"->默认
			DISEASED = "A sick gekko...",		-- 物品名:"草地壁虎"->生病了
		},
		GREEN_CAP = "Has a beautiful color. Should taste good.",		-- 物品名:"采摘的绿蘑菇"
		GREEN_CAP_COOKED = "Now it smells different.",		-- 物品名:"烤绿蘑菇"
		GREEN_MUSHROOM =
		{
			GENERIC = "Psychedelic and poisonous.",		-- 物品名:"绿蘑菇"->默认
			INGROUND = "It hides itself.",		-- 物品名:"绿蘑菇"->在地里面
			PICKED = "We got it.",		-- 物品名:"绿蘑菇"->被采完了
		},
		GUNPOWDER = "Explosive powder.",		-- 物品名:"火药" 制造描述:"一把火药"
		HAMBAT = "Even bigger than my Jade Pestle.",		-- 物品名:"火腿棒" 制造描述:"舍不得火腿套不着狼"
		HAMMER = "Hammer everything!",		-- 物品名:"锤子" 制造描述:"敲碎各种东西"
		HEALINGSALVE = "Cool and refreshing~",		-- 物品名:"治疗药膏" 制造描述:"对割伤和擦伤进行消毒杀菌"
		HEATROCK =
		{
			FROZEN = "Icier than ice.",		-- 物品名:"暖石"->冰冻 制造描述:"储存热能供旅行途中使用"
			COLD = "Getting chilly~",		-- 物品名:"冻伤"->冷了
			GENERIC = "Carries thermal energy!",		-- 物品名:"暖石"->默认 制造描述:"储存热能供旅行途中使用"
			WARM = "Getting warm~",		-- 物品名:"暖石"->温暖 制造描述:"储存热能供旅行途中使用"
			HOT = "Close to scalding.",		-- 物品名:"中暑"->热了
		},
		HOME = "Anyone there?",		-- 物品名:"暖石"->没调用 制造描述:"储存热能供旅行途中使用"
		HOMESIGN =
		{
			GENERIC = "What do you wanna tell me?",		-- 物品名:"路牌"->默认 制造描述:"在世界中留下你的标记"
            UNWRITTEN = "Nothing on it.",		-- 物品名:"路牌"->没有写字 制造描述:"在世界中留下你的标记"
			BURNT = "Aw ok...",		-- 物品名:"路牌"->烧焦的 制造描述:"在世界中留下你的标记"
		},
		ARROWSIGN_POST =
		{
			GENERIC = "What do you wanna tell me?",		-- 物品名:"指路标志"->默认 制造描述:"对这个世界指指点点或许只是打下手势"
            UNWRITTEN = "Nothing on it.",		-- 物品名:"指路标志"->没有写字 制造描述:"对这个世界指指点点或许只是打下手势"
			BURNT = "Searing scent.",		-- 物品名:"指路标志"->烧焦的 制造描述:"对这个世界指指点点或许只是打下手势"
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "What do you wanna tell me?",		-- 物品名:"指路标志"->默认
            UNWRITTEN = "Nothing on it.",		-- 物品名:"指路标志"->没有写字
			BURNT = "Dead...",		-- 物品名:"指路标志"->烧焦的
		},
		HONEY = "Hello, my sweet heart~",		-- 物品名:"蜂蜜"
		HONEYCOMB = "Stolen from the bees, hee-hee~",		-- 物品名:"蜂巢"
		HONEYHAM = "The pork ruined the sweetness!!!",		-- 物品名:"蜜汁火腿"
		HONEYNUGGETS = "What a waste of honey!",		-- 物品名:"蜜汁卤肉"
		HORN = "Du~ Du~ Du~",		-- 物品名:"牛角"
		HOUND = "Bad bad puppy! I'm gonna teach you a lesson!",		-- 物品名:"猎犬"
		HOUNDCORPSE =
		{
			GENERIC = "Strange dog corpse...",		-- 物品名:"猎犬"->默认
			BURNING = "It stinks!",		-- 物品名:"猎犬"->正在燃烧
			REVIVING = "It, it's...oh no! It's reviving!",		-- 物品名:"猎犬"
		},
		HOUNDBONE = "Hurts me when I touch it.",		-- 物品名:"犬骨"
		HOUNDMOUND = "Here's ugly puppies' home!",		-- 物品名:"猎犬丘"
		ICEBOX = "Chilly storage~",		-- 物品名:"冰箱" 制造描述:"延缓食物变质"
		ICEHAT = "A exceedingly useful hat~",		-- 物品名:"冰帽" 制造描述:"用科学技术合成的冰帽"
		ICEHOUND = "Blue puppy...I'd rather you stay black.",		-- 物品名:"冰猎犬"
		INSANITYROCK =
		{
			ACTIVE = "Where did you come from?!",		-- 物品名:"方尖碑"->激活了
			INACTIVE = "Rock with tricks.",		-- 物品名:"方尖碑"->没有激活
		},
		JAMMYPRESERVES = "My paws got sticky from it~",		-- 物品名:"果酱"
		KABOBS = "Disgusting!",		-- 物品名:"肉串"
		KILLERBEE =
		{
			GENERIC = "Looks pissed.",		-- 物品名:"杀人蜂"->默认
			HELD = "Your buzzing is somewhat enjoyable!",		-- 物品名:"杀人蜂"->拿在手里
		},
		KNIGHT = "Springing metal man!",		-- 物品名:"发条骑士"
		KOALEFANT_SUMMER = "You got such big eyes!",		-- 物品名:"大象"
		KOALEFANT_WINTER = "You got such big eyes!",		-- 物品名:"大象"
		KRAMPUS = "Big ass hole!",		-- 物品名:"坎普斯"
		KRAMPUS_SACK = "It makes jingling sound~",		-- 物品名:"坎普斯背包"
		LEIF = "Is that you, Mr. Tree?",		-- 物品名:"树精守卫"
		LEIF_SPARSE = "Mr. Tree?",		-- 物品名:"树精守卫"
		LIGHTER  = "This is meaningful to the incendiary lady.",		-- 物品名:"薇洛的打火机" 制造描述:"火焰在雨中彻夜燃烧"
		LIGHTNING_ROD =
		{
			CHARGED = "Sizzling sound.",		-- 物品名:"避雷针" 制造描述:"防雷劈"
			GENERIC = "Shelter us from Sky Lord's power!",		-- 物品名:"避雷针"->默认 制造描述:"防雷劈"
		},
		LIGHTNINGGOAT = 
		{
			GENERIC = "Curl hair!! I like you!",		-- 物品名:"闪电羊"->默认
			CHARGED = "RRRRRun!",		-- 物品名:"闪电羊"
		},
		LIGHTNINGGOATHORN = "Has a crack on it.",		-- 物品名:"闪电羊角"
		GOATMILK = "M-m-milk that ma-makes my m-mouth numb...",		-- 物品名:"带电的羊奶"
		LITTLE_WALRUS = "Hello there! Wanna play with me?",		-- 物品名:"小海象人"
		LIVINGLOG = "This is creepy...",		-- 物品名:"活木头" 制造描述:"用你的身体来代替\n你该干的活吧"
		LOG =
		{
			BURNING = "Camp fire? Too small, isn't it?",		-- 物品名:"木头"->正在燃烧
			GENERIC = "Shall we make a campfire?",		-- 物品名:"木头"->默认
		},
		LUCY = "Are you friend of Mr. Chopper?",		-- 物品名:"露西斧"
		LUREPLANT = "Why does a plant has meat on it?",		-- 物品名:"食人花"
		LUREPLANTBULB = "Nasty plant!",		-- 物品名:"食人花种子"
		MALE_PUPPET = "It looks stuck.",		-- 物品名:"木头"
		MANDRAKE_ACTIVE = "Eh? It's following me...",		-- 物品名:"曼德拉草"
		MANDRAKE_PLANTED = "It's said that we should pick this at night?",		-- 物品名:"曼德拉草"
		MANDRAKE = "And asleep now? Or dead...",		-- 物品名:"曼德拉草"
        MANDRAKESOUP = "But this Veggie bro makes fantastic soup!",		-- 物品名:"曼德拉草汤"
        MANDRAKE_COOKED = "Midnight snack~",		-- 物品名:"木头"
        MAPSCROLL = "Where's my way here?",		-- 物品名:"地图" 制造描述:"向别人展示你看到什么！"
        MARBLE = "Big rock.",		-- 物品名:"大理石"
        MARBLEBEAN = "Ya! It hurts my teeth!",		-- 物品名:"大理石豌豆" 制造描述:"种植一片大理石森林"
        MARBLEBEAN_SAPLING = "Wow! Is that stone growing?",		-- 物品名:"大理石芽"
        MARBLESHRUB = "Bush of stone.",		-- 物品名:"大理石灌木"
        MARBLEPILLAR = "It looks ancient.",		-- 物品名:"大理石柱"
        MARBLETREE = "Hey! Mr. Chopper! Come over here and try chopping this! Haha~",		-- 物品名:"大理石树"
        MARSH_BUSH =
        {
			BURNT = "Burnt...",		-- 物品名:"尖刺灌木"->烧焦的
            BURNING = "Fire! Fire!",		-- 物品名:"尖刺灌木"->正在燃烧
            GENERIC = "Ordinary in quagmire.",		-- 物品名:"尖刺灌木"->默认
            PICKED = "Ah! Hurts my paws!",		-- 物品名:"尖刺灌木"->被采完了
        },
        BURNT_MARSH_BUSH = "So sad about you...",		-- 物品名:"尖刺灌木"
        MARSH_PLANT = "Quagmire plantation.",		-- 物品名:"池塘边植物"
        MARSH_TREE =
        {
            BURNING = "I didn't do this!",		-- 物品名:"针刺树"->正在燃烧
            BURNT = "Burnt...",		-- 物品名:"针刺树"->烧焦的
            CHOPPED = "Chopped down completely...",		-- 物品名:"针刺树"->被砍了
            GENERIC = "I think I shouldn't play around here.",		-- 物品名:"针刺树"->默认
        },
        MAXWELL = "He doesn't look so friendly...",		-- 物品名:"麦斯威尔"->单机 麦斯威尔
        MAXWELLHEAD = "What a big head!",		-- 物品名:"麦斯威尔的头"->单机 麦斯威尔的头
        MAXWELLLIGHT = "I don't like you.",		-- 物品名:"麦斯威尔灯"->单机 麦斯威尔的灯
        MAXWELLLOCK = "Maybe need a key?",		-- 物品名:"噩梦锁"->单机 麦斯威尔的噩梦锁
        MAXWELLTHRONE = "This shouldn't be here...",		-- 物品名:"噩梦王座"->单机 麦斯威尔的噩梦王座
        MEAT = "Meat? Fairy lady never touches meat.",		-- 物品名:"肉"
        MEATBALLS = "Yuck! Lousy!",		-- 物品名:"肉丸"
        MEATRACK =
        {
            DONE = "Don't touch this!",		-- 物品名:"晾肉架"->完成了 制造描述:"晾肉的架子"
            DRYING = "Stinky.",		-- 物品名:"晾肉架"->正在风干 制造描述:"晾肉的架子"
            DRYINGINRAIN = "How could this be possible?",		-- 物品名:"晾肉架"->雨天风干 制造描述:"晾肉的架子"
            GENERIC = "People use this to make disgusting food...",		-- 物品名:"晾肉架"->默认 制造描述:"晾肉的架子"
            BURNT = "Alright.",		-- 物品名:"晾肉架"->烧焦的 制造描述:"晾肉的架子"
            DONE_NOTMEAT = "Uglier than usual.",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子"
            DRYING_NOTMEAT = "That looks incorrect.",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子"
            DRYINGINRAIN_NOTMEAT = "It's been said that this could wind-dry meats?",		-- 物品名:"晾肉架" 制造描述:"晾肉的架子"
        },
        MEAT_DRIED = "Smells terrible.",		-- 物品名:"风干肉"
        MERM = "Hello buddy!",		-- 物品名:"鱼人"
        MERMHEAD =
        {
            GENERIC = "Who would do something like this, I wonder?",		-- 物品名:"鱼头"->默认
            BURNT = "Hope you got a nicer funeral.",		-- 物品名:"鱼头"->烧焦的
        },
        MERMHOUSE =
        {
            GENERIC = "Where there is a bog, there is a hut.",		-- 物品名:"漏雨的小屋"->默认
            BURNT = "Nooo~",		-- 物品名:"漏雨的小屋"->烧焦的
        },
        MINERHAT = "Interesting headlight!",		-- 物品名:"矿工帽" 制造描述:"用你脑袋上的灯照亮夜晚"
        MONKEY = "Funny monkey!",		-- 物品名:"暴躁猴"
        MONKEYBARREL = "I'd say this is a friendly face.",		-- 物品名:"猴子桶"
        MONSTERLASAGNA = "W-w-what is...in...there?",		-- 物品名:"怪物千层饼"
        FLOWERSALAD = "Despite its look, it tastes really good!!",		-- 物品名:"花沙拉"
        ICECREAM = "Chilly dessert!",		-- 物品名:"冰淇淋"
        WATERMELONICLE = "Frozen watermelon!",		-- 物品名:"西瓜冰棍"
        TRAILMIX = "Ka-Bong crispy!",		-- 物品名:"什锦干果"
        HOTCHILI = "Unbearable in both ways.",		-- 物品名:"辣椒炖肉"
        GUACAMOLE = "Delicious green mush!",		-- 物品名:"鳄梨酱"
        MONSTERMEAT = "I'd rather pounding all day than touch it for one moment.",		-- 物品名:"怪物肉"
        MONSTERMEAT_DRIED = "Now it smells even worse!",		-- 物品名:"怪物肉干"
        MOOSE = "Is this Lady Wickerbottom mentioned \"Mother Goose\"？",		-- 物品名:"漏雨的小屋"
        MOOSE_NESTING_GROUND = "This is where she raised babies.",		-- 物品名:"漏雨的小屋"
        MOOSEEGG = "Can I see the babies inside?",		-- 物品名:"漏雨的小屋"
        MOSSLING = "Heehee, a team of lovely wobbly guys!",		-- 物品名:"驼鹿鹅幼崽"
        FEATHERFAN = "From what birds does this fan come?",		-- 物品名:"羽毛扇" 制造描述:"超柔软、超大的扇子"
        MINIFAN = "Wu-hu! Hee-hee!",		-- 物品名:"旋转的风扇" 制造描述:"你得跑起来，才能带来风！"
        GOOSE_FEATHER = "Phew! Watch out for the wind!",		-- 物品名:"鹿鸭羽毛"
        STAFF_TORNADO = "Can turn the wind up!",		-- 物品名:"天气风向标" 制造描述:"把你的敌人吹走"
        MOSQUITO =
        {
            GENERIC = "Trust me! You won't like my blood!",		-- 物品名:"蚊子"->默认
            HELD = "I got you, nasty flies!",		-- 物品名:"蚊子"->拿在手里
        },
        MOSQUITOSACK = "A strong bloody smell!",		-- 物品名:"蚊子血囊"
        MOUND =
        {
            DUG = "Somebody left his or her skeleton here...",		-- 物品名:"坟墓"->被挖了
            GENERIC = "R.I.P.",		-- 物品名:"坟墓"->默认
        },
        NIGHTLIGHT = "Weird source of light.",		-- 物品名:"魂灯" 制造描述:"用你的噩梦点亮夜晚"
        NIGHTMAREFUEL = "Cruelty with nightmare!",		-- 物品名:"噩梦燃料" 制造描述:"傻子和疯子使用的邪恶残渣"
        NIGHTSWORD = "I feel nightmares entered my body through my hand!",		-- 物品名:"暗夜剑" 制造描述:"造成噩梦般的伤害"
        NITRE = "A intersting stone.",		-- 物品名:"硝石"
        ONEMANBAND = "Dong! Dong! Chang!",		-- 物品名:"独奏乐器" 制造描述:"疯子音乐家也有粉丝"
        OASISLAKE =
		{
			GENERIC = "Water! Water!! Water!!!",		-- 物品名:"湖泊"->默认
			EMPTY = "No! Where had the water gone!?",		-- 物品名:"湖泊"
		},
        PANDORASCHEST = "What's inside of it?",		-- 物品名:"华丽箱子"
        PANFLUTE = "May you hear this...",		-- 物品名:"排箫" 制造描述:"抚慰凶猛野兽的音乐"
        PAPYRUS = "Let's record more funny stories!",		-- 物品名:"莎草纸" 制造描述:"用于书写"
        WAXPAPER = "Can't draw anything on this paper.",		-- 物品名:"蜡纸" 制造描述:"用于打包东西"
        PENGUIN = "They are clever birds...rather swim than fly.",		-- 物品名:"企鹅"
        PERD = "Get away! Goo-goo bird!",		-- 物品名:"火鸡"
        PEROGIES = "So there are meats inside, right?",		-- 物品名:"波兰水饺"
        PETALS = "Hee-hee! Flowers!",		-- 物品名:"花瓣"
        PETALS_EVIL = "I don't wanna take these...",		-- 物品名:"恶魔花瓣"
        PHLEGM = "Actually I ate worse stuff than this before...",		-- 物品名:"脓鼻涕"
        PICKAXE = "Tool for stone excavation.",		-- 物品名:"鹤嘴锄" 制造描述:"凿碎岩石"
        PIGGYBACK = "Backpack made of dirty pig skin...",		-- 物品名:"猪皮包" 制造描述:"能装许多东西，但会减慢你的速度"
        PIGHEAD =
        {
            GENERIC = "Haha!",		-- 物品名:"猪头"->默认
            BURNT = "Crispy pig! You deserve this!",		-- 物品名:"猪头"->烧焦的
        },
        PIGHOUSE =
        {
            FULL = "That house lives full of filthy pigs!",		-- 物品名:"猪屋"->满了 制造描述:"可以住一只猪"
            GENERIC = "Smells...smells like piggies.",		-- 物品名:"猪屋"->默认 制造描述:"可以住一只猪"
            LIGHTSOUT = "Save place.",		-- 物品名:"猪屋"->关灯了 制造描述:"可以住一只猪"
            BURNT = "Haha! Burnt for the better!",		-- 物品名:"猪屋"->烧焦的 制造描述:"可以住一只猪"
        },
        PIGKING = "Fat and big never makes a good pig! ",		-- 物品名:"猪王"
        PIGMAN =
        {
            DEAD = "You deserve this!",		-- 物品名:"猪人"->死了
            FOLLOWER = "Keep your distance!",		-- 物品名:"猪人"->追随者
            GENERIC = "You look different from that awful pig.",		-- 物品名:"猪人"->默认
            GUARD = "He looks more horrible than other pig folks.",		-- 物品名:"猪人"->警戒
            WEREPIG = "Stay away!",		-- 物品名:"猪人"->疯猪
        },
        PIGSKIN = "Obtained from filthy pigs.",		-- 物品名:"猪皮"
        PIGTENT = "How could pigs fit in that?",		-- 物品名:"猪人"
        PIGTORCH = "Fire of rituals?",		-- 物品名:"猪火炬"
        PINECONE = "Can't eat it.",		-- 物品名:"松果"
        PINECONE_SAPLING = "A tree baby~",		-- 物品名:"常青树苗"
        LUMPY_SAPLING = "It's doing its best.",		-- 物品名:"有疙瘩的树苗"
        PITCHFORK = "Tool that stings me from time to time.",		-- 物品名:"干草叉" 制造描述:"铲地用具"
        PLANTMEAT = "This is...confusing...",		-- 物品名:"叶子肉"
        PLANTMEAT_COOKED = "I won't eat it anyway.",		-- 物品名:"烤叶子肉"
        PLANT_NORMAL =
        {
            GENERIC = "Leafy green plant.",		-- 物品名:"农作物"->默认
            GROWING = "Nearly ready?",		-- 物品名:"农作物"->正在生长
            READY = "This will be a part of my muscle!",		-- 物品名:"农作物"->准备好的 满的
            WITHERED = "Plants also needs to drink? I reckon so.",		-- 物品名:"农作物"->枯萎了
        },
        POMEGRANATE = "Ok, I usually just bite it.",		-- 物品名:"石榴"
        POMEGRANATE_COOKED = "O...k...?",		-- 物品名:"切片熟石榴"
        POMEGRANATE_SEEDS = "Can offer more pomegranates.",		-- 物品名:"石榴种子"
        POND = "Splash!",		-- 物品名:"池塘"
        POOP = "If you want a nice herb, you gotta find equally nice poops.",		-- 物品名:"肥料"
        FERTILIZER = "Just ordinary poops, actually.",		-- 物品名:"便便桶" 制造描述:"少拉点在手上，多拉点在庄稼上"
        PUMPKIN = "A large piece of sweet dessert.",		-- 物品名:"南瓜"
        PUMPKINCOOKIE = "This is the best pumpkin.",		-- 物品名:"南瓜饼"
        PUMPKIN_COOKED = "Sticky and mushy.",		-- 物品名:"烤南瓜"
        PUMPKIN_LANTERN = "A friendly face!",		-- 物品名:"南瓜灯" 制造描述:"长着鬼脸的照明用具"
        PUMPKIN_SEEDS = "Can offer more pumpkins.",		-- 物品名:"南瓜种子"
        PURPLEAMULET = "This is not fun to meddle with.",		-- 物品名:"噩梦护符" 制造描述:"引起精神错乱"
        PURPLEGEM = "Gorgeous!",		-- 物品名:"紫宝石" 制造描述:"由两种颜色的宝石合成！"
        RABBIT =
        {
            GENERIC = "Don't be afraid. I will protect you!",		-- 物品名:"兔子"->默认
            HELD = "I got a carrot here, you want it or not?",		-- 物品名:"兔子"->拿在手里
        },
        RABBITHOLE =
        {
            GENERIC = "Hee-hee, could you lend me something, something that I won't return?",		-- 物品名:"兔洞"->默认
            SPRING = "Any rabbit at home?",		-- 物品名:"兔洞"->春天 or 潮湿
        },
        RAINOMETER =
        {
            GENERIC = "I wish there's some precipitation.",		-- 物品名:"雨量计"->默认 制造描述:"观测降雨机率"
            BURNT = "Oh...",		-- 物品名:"雨量计"->烧焦的 制造描述:"观测降雨机率"
        },
        RAINCOAT = "Strolling in heavy rain with this on gives a sense of meditation...",		-- 物品名:"雨衣" 制造描述:"让你保持干燥的防水外套"
        RAINHAT = "There's nothing to be afraid of rain.",		-- 物品名:"防雨帽" 制造描述:"手感柔软，防雨必备"
        RATATOUILLE = "This is the best!",		-- 物品名:"蔬菜大杂烩"
        RAZOR = "Used for cutting what?",		-- 物品名:"剃刀" 制造描述:"剃掉你脏脏的山羊胡子"
        REDGEM = "Pretty and warm.",		-- 物品名:"红宝石"
        RED_CAP = "These will only do bad to you.",		-- 物品名:"采摘的红蘑菇"
        RED_CAP_COOKED = "Slightly better...",		-- 物品名:"烤红蘑菇"
        RED_MUSHROOM =
        {
            GENERIC = "Hello Mushroom!",		-- 物品名:"红蘑菇"->默认
            INGROUND = "Get out and say hi!",		-- 物品名:"红蘑菇"->在地里面
            PICKED = "Are you gone forever?",		-- 物品名:"红蘑菇"->被采完了
        },
        REEDS =
        {
            BURNING = "And so is the whole quagmire burning.",		-- 物品名:"芦苇"->正在燃烧
            GENERIC = "Lots of these stuffs in the bog.",		-- 物品名:"芦苇"->默认
            PICKED = "Need to find more of this.",		-- 物品名:"芦苇"->被采完了
        },
        RELIC = "Ancient stuffs.",		-- 物品名:"废墟"
        RUINS_RUBBLE = "Stuff of the sort of rubbles.",		-- 物品名:"损毁的废墟"
        RUBBLE = "Stuff of the sort of rubbles.",		-- 物品名:"碎石"
        RESEARCHLAB =
        {
            GENERIC = "Teaches you more knowledge. ",		-- 物品名:"科学机器"->默认 制造描述:"解锁新的合成配方！"
            BURNT = "Ok...",		-- 物品名:"科学机器"->烧焦的 制造描述:"解锁新的合成配方！"
        },
        RESEARCHLAB2 =
        {
            GENERIC = "Alchemy? I already master turning stones into gold on my own.",		-- 物品名:"炼金引擎"->默认 制造描述:"解锁更多合成配方！"
            BURNT = "Ok...it's gone...了",		-- 物品名:"炼金引擎"->烧焦的 制造描述:"解锁更多合成配方！"
        },
        RESEARCHLAB3 =
        {
            GENERIC = "I shouldn't play with this.",		-- 物品名:"暗影操控器"->默认 制造描述:"这还是科学吗？"
            BURNT = "Better when it's burnt.",		-- 物品名:"暗影操控器"->烧焦的 制造描述:"这还是科学吗？"
        },
        RESEARCHLAB4 =
        {
            GENERIC = "I guess you just made up all you said just now.",		-- 物品名:"灵子分解器"->默认 制造描述:"增强高礼帽的魔力"
            BURNT = "The weird hat was burnt to ash...",		-- 物品名:"灵子分解器"->烧焦的 制造描述:"增强高礼帽的魔力"
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "A Voodoo doll?",		-- 物品名:"替身人偶"->默认 制造描述:"以肉的力量让你重生"
            BURNT = "Such a strong smell!",		-- 物品名:"替身人偶"->烧焦的 制造描述:"以肉的力量让你重生"
        },
        RESURRECTIONSTONE = "The power hidden surprised me!",		-- 物品名:"复活石"
        ROBIN =
        {
            GENERIC = "Red color is jubilant!",		-- 物品名:"红雀"->默认
            HELD = "My little bird~",		-- 物品名:"红雀"->拿在手里
        },
        ROBIN_WINTER =
        {
            GENERIC = "Little snowy bird! Come to my hug, will ya?",		-- 物品名:"雪雀"->默认
            HELD = "It loves to be my pet! Yeah!",		-- 物品名:"雪雀"->拿在手里
        },
        ROBOT_PUPPET = "Are you stuck?",		-- 物品名:"雪雀"
        ROCK_LIGHT =
        {
            GENERIC = "I don't like it.",		-- 物品名:"熔岩坑"->默认
            OUT = "Huh.",		-- 物品名:"熔岩坑"->出去？外面？
            LOW = "Becomes a stone now...",		-- 物品名:"熔岩坑"->低？
            NORMAL = "And with light glowing.",		-- 物品名:"熔岩坑"->普通
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "What a big stone!",		-- 物品名:"岩石"->默认
            RAISED = "I'm too short...Woooo...",		-- 物品名:"岩石"->提高了？
        },
        ROCK = "Ok, here's a stone.",		-- 物品名:"岩石"
        PETRIFIED_TREE = "Mr. Tree was petrified?!",		-- 物品名:"岩石"
        ROCK_PETRIFIED_TREE = "Mr. Tree was petrified?!",		-- 物品名:"石化树"
        ROCK_PETRIFIED_TREE_OLD = "Mr. Tree was petrified?!",		-- 物品名:"岩石"
        ROCK_ICE =
        {
            GENERIC = "Cold when I touch it.",		-- 物品名:"迷你冰山"->默认
            MELTED = "Muddy pool.",		-- 物品名:"迷你冰山"->融化了
        },
        ROCK_ICE_MELTED = "Muddy pool.",		-- 物品名:"融化的冰矿"
        ICE = "Phew! Very cold sense.",		-- 物品名:"冰"
        ROCKS = "Few stone nuggets.",		-- 物品名:"石头"
        ROOK = "Looks fierce.",		-- 物品名:"发条战车"
        ROPE = "For binding things up together.",		-- 物品名:"绳子" 制造描述:"紧密编成的草绳，非常有用"
        ROTTENEGG = "Has a somewhat pleasant odor...",		-- 物品名:"腐烂鸟蛋"
        ROYAL_JELLY = "Hmmm~ Nice~",		-- 物品名:"蜂王浆"
        JELLYBEAN = "Wholesome and tasty beans!",		-- 物品名:"彩虹糖豆"
        SADDLE_BASIC = "Hee-hee! You got little horns on you!",		-- 物品名:"鞍具" 制造描述:"你坐在动物身上仅仅是理论上"
        SADDLE_RACE = "Butterfly buddies finally got some use.",		-- 物品名:"轻鞍具" 制造描述:"抵消掉完成目标所花费的时间或许"
        SADDLE_WAR = "I shall fight on behalf of all fairy hares!",		-- 物品名:"战争鞍具" 制造描述:"战场首领的王位"
        SADDLEHORN = "Tool to take saddles off from furry buddies.",		-- 物品名:"鞍角" 制造描述:"把鞍具撬开"
        SALTLICK = "What do you mean by\"Designed only for beefalos\"?",		-- 物品名:"舔舔盐块" 制造描述:"好好喂养你家的牲畜"
        BRUSH = "Hairs are really strange...",		-- 物品名:"刷子" 制造描述:"减缓牦牛毛发的生长速度"
		SANITYROCK =
		{
			ACTIVE = "Oh no! Let me in!",		-- 物品名:"方尖碑"->激活了
			INACTIVE = "Maybe it's just my own imagination...",		-- 物品名:"方尖碑"->没有激活
		},
		SAPLING =
		{
			BURNING = "No! Flame!",		-- 物品名:"树苗"->正在燃烧
			WITHERED = "Too dry up here.",		-- 物品名:"树苗"->枯萎了
			GENERIC = "Hey Little Sapling, can you spare me a twig?",		-- 物品名:"树苗"->默认
			PICKED = "Here it goes, thanks!",		-- 物品名:"树苗"->被采完了
			DISEASED = "Oh it looks terrible...",		-- 物品名:"树苗"->生病了
			DISEASING = "It doesn't look right...",		-- 物品名:"树苗"->正在生病？？
		},
   		SCARECROW = 
   		{
			GENERIC = "I like this gentleman!",		-- 物品名:"友善的稻草人"->默认 制造描述:"模仿最新的秋季时尚"
			BURNING = "No! No! No! Gotta save him!",		-- 物品名:"友善的稻草人"->正在燃烧 制造描述:"模仿最新的秋季时尚"
			BURNT = "Bye...",		-- 物品名:"友善的稻草人"->烧焦的 制造描述:"模仿最新的秋季时尚"
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "Craft things out of stones~",		-- 物品名:"陶轮" 制造描述:"大理石在你手里将像黏土一样！"
			BLOCK = "I'll do something great!",		-- 物品名:"陶轮"->锁住了 制造描述:"大理石在你手里将像黏土一样！"
			SCULPTURE = "Look! I did this with my own hands...paws!",		-- 物品名:"陶轮"->雕像做好了 制造描述:"大理石在你手里将像黏土一样！"
			BURNT = "Don't need it anymore.",		-- 物品名:"陶轮"->烧焦的 制造描述:"大理石在你手里将像黏土一样！"
   		},
        SCULPTURE_KNIGHTHEAD = "This seems to be the head of the metal man.",		-- 物品名:"可疑的大理石"
		SCULPTURE_KNIGHTBODY = 
		{
			COVERED = "What's that thing?",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "It's malfunctioning...",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "Both in one piece, a complete one!",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "Something's about to happen!",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        SCULPTURE_BISHOPHEAD = "Looks like you are getting lost?",		-- 物品名:"可疑的大理石"
		SCULPTURE_BISHOPBODY = 
		{
			COVERED = "Something's wrong...",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "Ah! It lost its head!",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "Finished!",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "Ha???",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        SCULPTURE_ROOKNOSE = "Emmm, I guess this should be anchored somewhere.",		-- 物品名:"可疑的大理石"
		SCULPTURE_ROOKBODY = 
		{
			COVERED = "What a strange big stone!",		-- 物品名:"大理石雕像"->被盖住了-三基佬雕像可以敲大理石的时候
			UNCOVERED = "Need something on top of it.",		-- 物品名:"大理石雕像"->没有被盖住-三基佬雕像被开采后
			FINISHED = "Looks much much better.",		-- 物品名:"大理石雕像"->三基佬雕像修好了
			READY = "Probably terrible things will occur now...",		-- 物品名:"大理石雕像"->准备好的 满的
		},
        GARGOYLE_HOUND = "It looks very surprised.",		-- 物品名:"可疑的月亮石"
        GARGOYLE_WEREPIG = "I didn't expect to see this awful thing there.",		-- 物品名:"可疑的月亮石"
		SEEDS = "This will work out in soil!",		-- 物品名:"种子"
		SEEDS_COOKED = "Tini-tiny snack!",		-- 物品名:"烤种子"
		SEWING_KIT = "I gotta have Weaver sister teach me how to sewing better...",		-- 物品名:"针线包" 制造描述:"缝补受损的衣物"
		SEWING_TAPE = "Wenona Lady is good at repairing things.",		-- 物品名:"可靠的胶布" 制造描述:"缝补受损的衣物"
		SHOVEL = "For digging things out of earth.",		-- 物品名:"铲子" 制造描述:"挖掘各种各样的东西"
		SILK = "Spiders spit silk!",		-- 物品名:"蜘蛛丝"
		SKELETON = "See ya later.",		-- 物品名:"骷髅"
		SCORCHED_SKELETON = "You got too closed to fluid flame!",		-- 物品名:"易碎骨骼"
		SKULLCHEST = "Maybe something good in there!",		-- 物品名:"骷髅箱"
		SMALLBIRD =
		{
			GENERIC = "It's so tiny!",		-- 物品名:"小鸟"->默认
			HUNGRY = "You want a snack?",		-- 物品名:"小鸟"->有点饿了
			STARVING = "You look like in need of a feast!",		-- 物品名:"小鸟"->挨饿
			SLEEPING = "Have a good sleep, little one!",		-- 物品名:"小鸟"->睡着了
		},
		SMALLMEAT = "I won't eat this.",		-- 物品名:"小肉"
		SMALLMEAT_DRIED = "Now this got even more awful.",		-- 物品名:"小风干肉"
		SPAT = "She looks like in discomfort.",		-- 物品名:"钢羊"
		SPEAR = "A rod to stick enemies.",		-- 物品名:"长矛" 制造描述:"使用尖的那一端"
		SPEAR_WATHGRITHR = "A rod to stick the Vikings' enemies.",		-- 物品名:"战斗长矛" 制造描述:"黄金使它更锋利"
		WATHGRITHRHAT = "Will wearing this make me as tough that Viking lady?",		-- 物品名:"战斗头盔" 制造描述:"独角兽是你的保护神"
		SPIDER =
		{
			DEAD = "You are not that strong.",		-- 物品名:"蜘蛛"->死了
			GENERIC = "Spiderling.",		-- 物品名:"蜘蛛"->默认
			SLEEPING = "Hush...",		-- 物品名:"蜘蛛"->睡着了
		},
		SPIDERDEN = "I stepped on sticky webs!",		-- 物品名:"蜘蛛巢"
		SPIDEREGGSACK = "So, this is where spider larvaes were nourished?",		-- 物品名:"蜘蛛卵" 制造描述:"跟你的朋友寻求点帮助"
		SPIDERGLAND = "A simple medicine.",		-- 物品名:"蜘蛛腺"
		SPIDERHAT = "Haha, this looks like that Webber buddy.",		-- 物品名:"蜘蛛帽" 制造描述:"蜘蛛们会喊你\"妈妈\""
		SPIDERQUEEN = "She is the mighty queen!",		-- 物品名:"蜘蛛女王"
		SPIDER_WARRIOR =
		{
			DEAD = "I'm Moon Palace's battle king! Hahaha!",		-- 物品名:"蜘蛛战士"->死了
			GENERIC = "Tougher spider?",		-- 物品名:"蜘蛛战士"->默认
			SLEEPING = "It's having a spider's dream.",		-- 物品名:"蜘蛛战士"->睡着了
		},
		SPOILED_FOOD = "Let's put this in soil, have it back to mother nature...",		-- 物品名:"腐烂食物"
        STAGEHAND =
        {
			AWAKE = "Don't follow me!",		-- 物品名:"舞台"->醒了
			HIDING = "Strange...",		-- 物品名:"舞台"->藏起来了
        },
        STATUE_MARBLE = 
        {
            GENERIC = "This rock has a bizarre shape...",		-- 物品名:"大理石雕像"->默认
            TYPE1 = "She lost her head!",		-- 物品名:"大理石雕像"->类型1
            TYPE2 = "A miserable story.",		-- 物品名:"大理石雕像"->类型2
            TYPE3 = "Looks advanced, but boring...", --bird bath type statue		-- 物品名:"大理石雕像"
        },
		STATUEHARP = "Someone ruined this.",		-- 物品名:"竖琴雕像"
		STATUEMAXWELL = "Looks like a crispy weak guy.",		-- 物品名:"麦斯威尔雕像"
		STEELWOOL = "It scratches people.",		-- 物品名:"钢丝绵"
		STINGER = "Its butt is buzzing, hee-hee!",		-- 物品名:"蜂刺"
		STRAWHAT = "So itchy...",		-- 物品名:"草帽" 制造描述:"帮助你保持清凉干爽"
		STUFFEDEGGPLANT = "WOW! Veggies hidden in veggie!",		-- 物品名:"酿茄子"
		SWEATERVEST = "He wears so many clothes! Unnecessary!",		-- 物品名:"犬牙背心" 制造描述:"粗糙，但挺时尚"
		REFLECTIVEVEST = "Ah-huh, orange color.",		-- 物品名:"清凉夏装" 制造描述:"穿上这件时尚的背心，保持凉爽和清醒"
		HAWAIIANSHIRT = "Those flowers will inevitably perish...",		-- 物品名:"花衬衫" 制造描述:"适合夏日穿着，或在周五便装日穿着"
		TAFFY = "Hmmm! Thiz sdicks my deeth degather!",		-- 物品名:"太妃糖"
		TALLBIRD = "Long-legged birds.",		-- 物品名:"高脚鸟"
		TALLBIRDEGG = "I hear the sound of lives in there.",		-- 物品名:"高脚鸟蛋"
		TALLBIRDEGG_COOKED = "Poor little thing...",		-- 物品名:"煎高脚鸟蛋"
		TALLBIRDEGG_CRACKED =
		{
			COLD = "Are you cold?",		-- 物品名:"冻伤"->冷了
			GENERIC = "It's hatching! So excited!",		-- 物品名:"孵化中的高脚鸟蛋"->默认
			HOT = "Hmmm...it's too hot.",		-- 物品名:"中暑"->热了
			LONG = "Why it takes so long!",		-- 物品名:"孵化中的高脚鸟蛋"->还需要很久
			SHORT = "Could be in any second now!",		-- 物品名:"孵化中的高脚鸟蛋"->很快了
		},
		TALLBIRDNEST =
		{
			GENERIC = "Long-legged bird's egg!",		-- 物品名:"高脚鸟巢"->默认
			PICKED = "The long leg sleeps here.",		-- 物品名:"高脚鸟巢"->被采完了
		},
		TEENBIRD =
		{
			GENERIC = "You won't be as funny when you grow up.",		-- 物品名:"小高脚鸟"->默认
			HUNGRY = "Want a snack from sister?",		-- 物品名:"小高脚鸟"->有点饿了
			STARVING = "It pissed off when starving.",		-- 物品名:"小高脚鸟"->挨饿
			SLEEPING = "I know it likes naps.",		-- 物品名:"小高脚鸟"->睡着了
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "I can get back, right?",		-- 物品名:"木制传送台"->激活了
			GENERIC = "This leads to...other worlds?",		-- 物品名:"木制传送台"->默认
			LOCKED = "I think it needs something.",		-- 物品名:"木制传送台"->锁住了
			PARTIAL = "Unfinished, right?",		-- 物品名:"木制传送台"->已经有部分了
		},
		TELEPORTATO_BOX = "Funny little box.",		-- 物品名:"盒状零件"
		TELEPORTATO_CRANK = "What is this stuff?",		-- 物品名:"曲柄零件"
		TELEPORTATO_POTATO = "Big metal block.",		-- 物品名:"金属土豆状零件"
		TELEPORTATO_RING = "Huh, too big to fit in a crown.",		-- 物品名:"环状零件"
		TELESTAFF = "Makes my head feel empty.",		-- 物品名:"传送魔杖" 制造描述:"穿越空间的法杖！穿越时间的装置需另外购买"
		TENT = 
		{
			GENERIC = "Take a sleeeep...zzz...",		-- 物品名:"帐篷"->默认 制造描述:"回复精神值，但要花费时间并导致饥饿"
			BURNT = "My bed burnt...",		-- 物品名:"帐篷"->烧焦的 制造描述:"回复精神值，但要花费时间并导致饥饿"
		},
		SIESTAHUT = 
		{
			GENERIC = "I wanna take a afternoon nap...this looks good.",		-- 物品名:"遮阳篷"->默认 制造描述:"躲避烈日，回复精神值"
			BURNT = "Gotta find a new place for afternoon naps.",		-- 物品名:"遮阳篷"->烧焦的 制造描述:"躲避烈日，回复精神值"
		},
		TENTACLE = "I always step on there...",		-- 物品名:"触手"
		TENTACLESPIKE = "Ha! Spikes!",		-- 物品名:"狼牙棒"
		TENTACLESPOTS = "I gotta have its skin.",		-- 物品名:"触手皮"
		TENTACLE_PILLAR = "Let's scratch its itchy belly!",		-- 物品名:"大触手"
        TENTACLE_PILLAR_HOLE = "What's in the bottom of it?",		-- 物品名:"硕大的泥坑"
		TENTACLE_PILLAR_ARM = "They are tiny.",		-- 物品名:"小触手"
		TENTACLE_GARDEN = "Here's its home!",		-- 物品名:"大触手"
		TOPHAT = "Oh! Looks so fancy!",		-- 物品名:"高礼帽" 制造描述:"最经典的帽子款式"
		TORCH = "A stick that carries fire.",		-- 物品名:"火炬" 制造描述:"可携带的光源"
		TRANSISTOR = "It's buzzing...so is there a bee trapped inside?",		-- 物品名:"电子元件" 制造描述:"科学至上！滋滋滋！"
		TRAP = "Suspicious!",		-- 物品名:"陷阱" 制造描述:"捕捉小型生物"
		TRAP_TEETH = "Looks bit horrible!",		-- 物品名:"犬牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西"
		TRAP_TEETH_MAXWELL = "Awful spikes!",		-- 物品名:"麦斯威尔的尖牙陷阱" 制造描述:"弹出来并咬伤任何踩到它的东西"
		TREASURECHEST = 
		{
			GENERIC = "Box-like storage!",		-- 物品名:"木箱"->默认 制造描述:"一种结实的容器"
			BURNT = "No!!!",		-- 物品名:"木箱"->烧焦的 制造描述:"一种结实的容器"
		},
		TREASURECHEST_TRAP = "A treasure!",		-- 物品名:"宝箱"
		SACRED_CHEST = 
		{
			GENERIC = "I wonder what's in its belly?",		-- 物品名:"古老的箱子"->默认
			LOCKED = "Hey!",		-- 物品名:"古老的箱子"->锁住了
		},
		TREECLUMP = "Can't get across there...",		-- 物品名:"古老的箱子"
		TRINKET_1 = "Lovely little shoes~", --Melted Marbles		-- 物品名:"熔化的弹珠"
		TRINKET_2 = "Why the sound died?", --Fake Kazoo		-- 物品名:"假卡祖笛"
		TRINKET_3 = "A ever-forever knot.", --Gord's Knot		-- 物品名:"戈尔迪之结"
		TRINKET_4 = "Strange little buddy.", --Gnome		-- 物品名:"地精玩偶"
		TRINKET_5 = "Pong-Pong-Pong!", --Toy Rocketship		-- 物品名:"迷你火箭"
		TRINKET_6 = "Strange colorful wire?", --Frazzled Wires		-- 物品名:"烂电线"
		TRINKET_7 = "This game is so so hard!", --Ball and Cup		-- 物品名:"杯子和球玩具"
		TRINKET_8 = "Gaw-gaw, looks cracky.", --Rubber Bung		-- 物品名:"硬化橡胶塞"
		TRINKET_9 = "There's a hole in the middle center?", --Mismatched Buttons		-- 物品名:"不搭的纽扣"
		TRINKET_10 = "Short and round teeth.", --Dentures		-- 物品名:"二手假牙"
		TRINKET_11 = "It says everyting'll go well.", --Lying Robot		-- 物品名:"机器人玩偶"
		TRINKET_12 = "Ouch it's dead!", --Dessicated Tentacle		-- 物品名:"干瘪的触手"
		TRINKET_13 = "Strange madam.", --Gnomette		-- 物品名:"可爱的小玩偶"
		TRINKET_14 = "This is for drink or for washing?", --Leaky Teacup		-- 物品名:"漏水的茶杯"
		TRINKET_15 = "Looks like...little metal man?", --Pawn		-- 物品名:"白衣主教"
		TRINKET_16 = "Looks like...little metal man?", --Pawn		-- 物品名:"黑衣主教"
		TRINKET_17 = "Tool to pick up food.", --Bent Spork		-- 物品名:"弯曲的叉子"
		TRINKET_18 = "A sound inside...", --Trojan Horse		-- 物品名:"玩具木马"
		TRINKET_19 = "Whirling and whirling!", --Unbalanced Top		-- 物品名:"失衡上衣"
		TRINKET_20 = "Another paw to scratch! Nice!", --Backscratcher		-- 物品名:"不求人"
		TRINKET_21 = "What a strange design of his!", --Egg Beater		-- 物品名:"破搅拌器"
		TRINKET_22 = "Little worn yarn!", --Frayed Yarn		-- 物品名:"磨损的纱线"
		TRINKET_23 = "This doesn't look like horns...", --Shoehorn		-- 物品名:"鞋拔子"
		TRINKET_24 = "Looks happy!", --Lucky Cat Jar		-- 物品名:"幸运猫扎尔"
		TRINKET_25 = "Why squashed wood so flat?", --Air Unfreshener		-- 物品名:"臭气制造器"
		TRINKET_26 = "Where is the gourd ladle that's supposed to be inside?", --Potato Cup		-- 物品名:"土豆杯"
		TRINKET_27 = "A small paw on the top~", --Coat Hanger		-- 物品名:"钢丝衣架"
		TRINKET_28 = "Is this ants' castle?", --Rook		-- 物品名:"白色战车"
        TRINKET_29 = "Is this ants' castle?", --Rook		-- 物品名:"黑色战车"
        TRINKET_30 = "Looks like...little metal man?", --Knight		-- 物品名:"白色骑士"
        TRINKET_31 = "Looks like...little metal man?", --Knight		-- 物品名:"黑色骑士"
        TRINKET_32 = "Can find a lovely face!", --Cubic Zirconia Ball		-- 物品名:"立方氧化锆球"
        TRINKET_33 = "Who had seen a spider guy so tiny for this?", --Spider Ring		-- 物品名:"蜘蛛指环"
        TRINKET_34 = "Seems safe to me?", --Monkey Paw		-- 物品名:"猴子手掌"
        TRINKET_35 = "Somebody already drank it top to bottom.", --Empty Elixir		-- 物品名:"空的长生不老药"
        TRINKET_36 = "So sharp a tooth!", --Faux fangs		-- 物品名:"人造尖牙"
        TRINKET_37 = "Not me! It was just like this when I found it!", --Broken Stake		-- 物品名:"断桩"
        TRINKET_38 = "You always see.", -- Binoculars Griftlands trinket		-- 物品名:"双筒望远镜"
        TRINKET_39 = "Warms only one paw up.", -- Lone Glove Griftlands trinket		-- 物品名:"单只手套"
        TRINKET_40 = "This is a sleeping snurtle.", -- Snail Scale Griftlands trinket		-- 物品名:"蜗牛秤"
        TRINKET_41 = "So warm~", -- Goop Canister Hot Lava trinket		-- 物品名:"黏液罐"
        TRINKET_42 = "Oh, intersting toy!", -- Toy Cobra Hot Lava trinket		-- 物品名:"玩具眼镜蛇"
        TRINKET_43 = "Hee-hee, it got intersting clothes!", -- Crocodile Toy Hot Lava trinket		-- 物品名:"鳄鱼玩具"
        TRINKET_44 = "Somebody ruined vegetables' homes!", -- Broken Terrarium ONI trinket		-- 物品名:"破碎的玻璃罐"
        TRINKET_45 = "What can it do?", -- Odd Radio ONI trinket		-- 物品名:"奇怪的收音机"
        TRINKET_46 = "Emmm...", -- Hairdryer ONI trinket		-- 物品名:"损坏的吹风机"
        LOST_TOY_1  = "Ha? Why can't I pick it?",		-- 物品名:"遗失的玻璃球"
        LOST_TOY_2  = "Ha? Why can't I pick it?",		-- 物品名:"多愁善感的卡祖笛"
        LOST_TOY_7  = "Ha? Why can't I pick it?",		-- 物品名:"珍视的抽线陀螺"
        LOST_TOY_10 = "Ha? Why can't I pick it?",		-- 物品名:"缺少的牙齿"
        LOST_TOY_11 = "Ha? Why can't I pick it?",		-- 物品名:"珍贵的玩具机器人"
        LOST_TOY_14 = "Ha? Why can't I pick it?",		-- 物品名:"妈妈最爱的茶杯"
        LOST_TOY_18 = "Ha? Why can't I pick it?",		-- 物品名:"宝贵的玩具木马"
        LOST_TOY_19 = "Ha? Why can't I pick it?",		-- 物品名:"最爱的陀螺"
        LOST_TOY_42 = "Ha? Why can't I pick it?",		-- 物品名:"装错的玩具眼镜蛇"
        LOST_TOY_43 = "Ha? Why can't I pick it?",		-- 物品名:"宠爱的鳄鱼玩具"
        HALLOWEENCANDY_1 = "These tastes much better than apples!",		-- 物品名:"糖果苹果"
        HALLOWEENCANDY_2 = "Makes corn even better!",		-- 物品名:"糖果玉米"
        HALLOWEENCANDY_3 = "Not so sweet corns.",		-- 物品名:"不太甜的玉米"
        HALLOWEENCANDY_4 = "I had never thought that spider men could be so delicious!",		-- 物品名:"粘液蜘蛛"
        HALLOWEENCANDY_5 = "I'm gonna eat you with just one bite!",		-- 物品名:"浣猫糖果"
        HALLOWEENCANDY_6 = "Tastes very nice!",		-- 物品名:"\"葡萄干\""
        HALLOWEENCANDY_7 = "I'll have yours if you don't want.",		-- 物品名:"葡萄干"
        HALLOWEENCANDY_8 = "This is so, so, so good!",		-- 物品名:"鬼魂波普"
        HALLOWEENCANDY_9 = "Much better than regular worms.",		-- 物品名:"果冻虫"
        HALLOWEENCANDY_10 = "Huh, the taste of quagmire air...",		-- 物品名:"触须棒棒糖"
        HALLOWEENCANDY_11 = "I'll eat you all! Hahaha!",		-- 物品名:"巧克力猪"
        HALLOWEENCANDY_12 = "I want my belly full of it!", --ONI meal lice candy		-- 物品名:"糖果虱"
        HALLOWEENCANDY_13 = "My foreteeth are complaining.", --Griftlands themed candy		-- 物品名:"无敌硬糖"
        HALLOWEENCANDY_14 = "Hot! Hot! Hot!", --Hot Lava pepper candy		-- 物品名:"熔岩椒"
        CANDYBAG = "Confection!",		-- 物品名:"糖果袋" 制造描述:"只带万圣夜好吃的东西"
		HALLOWEEN_ORNAMENT_1 = "Po! Hey hey hey!",		-- 物品名:"幽灵装饰"
		HALLOWEEN_ORNAMENT_2 = "Can be used for deco!",		-- 物品名:"蝙蝠装饰"
		HALLOWEEN_ORNAMENT_3 = "Looks so much alike Webber buddy.", 		-- 物品名:"蜘蛛装饰"
		HALLOWEEN_ORNAMENT_4 = "This is no scary at all, ok?",		-- 物品名:"触手装饰"
		HALLOWEEN_ORNAMENT_5 = "Strange decoration!",		-- 物品名:"悬垂蜘蛛装饰"
		HALLOWEEN_ORNAMENT_6 = "Beautiful bird!", 		-- 物品名:"乌鸦装饰"
		HALLOWEENPOTION_DRINKS_WEAK = "Not that great actually...",		-- 物品名:"古老的箱子"
		HALLOWEENPOTION_DRINKS_POTENT = "With a strong taste.",		-- 物品名:"古老的箱子"
        HALLOWEENPOTION_BRAVERY = "Not afraid of anything in the world!",		-- 物品名:"古老的箱子"
		HALLOWEENPOTION_MOON = "Gotta be careful, this is so cripsy and fragile...",		-- 物品名:"月亮精华液"
		HALLOWEENPOTION_FIRE_FX = "Spark bottle.", 		-- 物品名:"古老的箱子"
		MADSCIENCE_LAB = "Foams!",		-- 物品名:"疯狂科学家实验室" 制造描述:"疯狂实验无极限唯独神智有极限"
		LIVINGTREE_ROOT = "The root is still growing!", 		-- 物品名:"完全正常的树根"
		LIVINGTREE_SAPLING = "In its second growing period.",		-- 物品名:"完全正常的树苗"
        DRAGONHEADHAT = "As cute as my face!",		-- 物品名:"幸运兽脑袋" 制造描述:"野兽装束的前端"
        DRAGONBODYHAT = "This is really an easy matching.",		-- 物品名:"幸运兽躯体" 制造描述:"野兽装束的中间部分"
        DRAGONTAILHAT = "I've always longed for a tail!",		-- 物品名:"幸运兽尾巴" 制造描述:"野兽装束的尾端"
        PERDSHRINE =
        {
            GENERIC = "Ha? What else do you want? A grunting perd?",		-- 物品名:"火鸡神龛"->默认 制造描述:"供奉庄严的火鸡"
            EMPTY = "Something should be placed here.",		-- 物品名:"火鸡神龛" 制造描述:"供奉庄严的火鸡"
            BURNT = "All burnt down...",		-- 物品名:"火鸡神龛"->烧焦的 制造描述:"供奉庄严的火鸡"
        },
        REDLANTERN = "Emmm, looks kinda good.",		-- 物品名:"红灯笼" 制造描述:"照亮你的路的幸运灯笼"
        LUCKY_GOLDNUGGET = "Shiny rock!",		-- 物品名:"幸运黄金"
        FIRECRACKERS = "With loud noise, and fire crack!",		-- 物品名:"红色爆竹" 制造描述:"用重击来庆祝！"
        PERDFAN = "Feathered stick!",		-- 物品名:"幸运扇" 制造描述:"额外的运气，超级多"
        REDPOUCH = "Inside is a jingling sound~",		-- 物品名:"红袋子"
        WARGSHRINE = 
        {
            GENERIC = "Home of a golden puppy.",		-- 物品名:"座狼龛"->默认 制造描述:"供奉黏土座狼"
            EMPTY = "Needs a bit of light.",		-- 物品名:"座狼龛" 制造描述:"供奉黏土座狼"
            BURNT = "Burnt down completely.",		-- 物品名:"座狼龛"->烧焦的 制造描述:"供奉黏土座狼"
        },
        CLAYWARG = 
        {
        	GENERIC = "Big fang!",		-- 物品名:"黏土座狼"->默认
        	STATUE = "I, I sensed a terrible omen...",		-- 物品名:"黏土座狼"->雕像
        },
        CLAYHOUND = 
        {
        	GENERIC = "It bites me!",		-- 物品名:"黏土猎犬"->默认
        	STATUE = "Who made you?!",		-- 物品名:"黏土猎犬"->雕像
        },
        HOUNDWHISTLE = "It, it can't create a whistle sound?",		-- 物品名:"幸运哨子" 制造描述:"对野猎犬吹哨"
        CHESSPIECE_CLAYHOUND = "Bad, bad puppy!",		-- 物品名:"猎犬棋子"
        CHESSPIECE_CLAYWARG = "!!!",		-- 物品名:"座狼棋子"
		PIGSHRINE =
		{
            GENERIC = "Who built this?",		-- 物品名:"猪神龛"->默认 制造描述:"为富有的猪献贡"
            EMPTY = "I won't give you anything, you moron!",		-- 物品名:"猪神龛" 制造描述:"为富有的猪献贡"
            BURNT = "Nice, it's gone!",		-- 物品名:"猪神龛"->烧焦的 制造描述:"为富有的猪献贡"
		},
		PIG_TOKEN = "I stole this belt from pigman.",		-- 物品名:"金色腰带"
		PIG_COIN = "Shiny pig nose~",		-- 物品名:"猪鼻铸币"
		YOTP_FOOD1 = "Dah! An ugly pig's face.",		-- 物品名:"致敬烤肉" 制造描述:"向猪王敬肉"
		YOTP_FOOD2 = "Usually I loves to play mud, but I can't accept this.",		-- 物品名:"八宝泥馅饼" 制造描述:"那里隐藏着什么？"
		YOTP_FOOD3 = "Turbid barbecue...",		-- 物品名:"鱼头串" 制造描述:"棍子上的荣华富贵"
		PIGELITE1 = "Stay away!", --BLUE		-- 物品名:"韦德"
		PIGELITE2 = "You ass hole!", --RED		-- 物品名:"伊内修斯"
		PIGELITE3 = "Dirty pigs!", --WHITE		-- 物品名:"德米特里"
		PIGELITE4 = "Arch enemy!", --GREEN		-- 物品名:"索耶"
		PIGELITEFIGHTER1 = "Stay away!", --BLUE		-- 物品名:"韦德"
		PIGELITEFIGHTER2 = "You ass hole", --RED		-- 物品名:"伊内修斯"
		PIGELITEFIGHTER3 = "Dirty pigs!", --WHITE		-- 物品名:"德米特里"
		PIGELITEFIGHTER4 = "Arch enemy!", --GREEN		-- 物品名:"索耶"
		CARRAT_GHOSTRACER = "That's so frightening!",		-- 物品名:"查理的胡萝卜鼠"
        YOTC_CARRAT_RACE_START = "The race of veggies begins...here!",		-- 物品名:"起点" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT = "It leads the way.",		-- 物品名:"检查点" 制造描述:"通往光荣之路上的一站"
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "This is the final mark.",		-- 物品名:"终点线"->默认 制造描述:"你走投无路了"
            BURNT = "AHHHHHH!",		-- 物品名:"终点线"->烧焦的 制造描述:"你走投无路了"
            I_WON = "Yo! I beat you! Yeah!",		-- 物品名:"终点线" 制造描述:"你走投无路了"
            SOMEONE_ELSE_WON = " {winner} must have cheated……",		-- 物品名:"终点线" 制造描述:"你走投无路了"
        },
		YOTC_CARRAT_RACE_START_ITEM = "The start line of veggies' race.",		-- 物品名:"起点套装" 制造描述:"冲向比赛！"
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "Helps my carrat find her way.",		-- 物品名:"检查点套装" 制造描述:"通往光荣之路上的一站"
		YOTC_CARRAT_RACE_FINISH_ITEM = "Why's the destination line?",		-- 物品名:"终点线套装" 制造描述:"你走投无路了"
		YOTC_SEEDPACKET = "A little snack~",		-- 物品名:"种子包" 制造描述:"一包普通的混合种子"
		YOTC_SEEDPACKET_RARE = "Dunno whether advanced crops will grow...",		-- 物品名:"高级种子包" 制造描述:"一包高质量的种子"
		MINIBOATLANTERN = "Lovely drifting boat~",		-- 物品名:"漂浮灯笼" 制造描述:"闪着暖暖的光亮"
        YOTC_CARRATSHRINE =
        {
            GENERIC = "Like a carrat!",		-- 物品名:"胡萝卜鼠神龛"->默认 制造描述:"供奉灵活的胡萝卜鼠"
            EMPTY = "Want a present from me? I got it!",		-- 物品名:"胡萝卜鼠神龛" 制造描述:"供奉灵活的胡萝卜鼠"
            BURNT = "Not me! Not me!",		-- 物品名:"胡萝卜鼠神龛"->烧焦的 制造描述:"供奉灵活的胡萝卜鼠"
        },
        YOTC_CARRAT_GYM_DIRECTION = 
        {
            GENERIC = "Hee-hee! My carrat is the best!",		-- 物品名:"方向健身房"->默认
            RAT = "RRRRun!",		-- 物品名:"方向健身房"
            BURNT = "Ouch....",		-- 物品名:"方向健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_SPEED = 
        {
            GENERIC = "Racing wheel!",		-- 物品名:"速度健身房"->默认
            RAT = "Turn here...and there...yeah!",		-- 物品名:"速度健身房"
            BURNT = "Ouch....",		-- 物品名:"速度健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_REACTION = 
        {
            GENERIC = "Very nice running practice.",		-- 物品名:"反应健身房"->默认
            RAT = "Abilities improved!",		-- 物品名:"反应健身房"
            BURNT = "Ouch....",		-- 物品名:"反应健身房"->烧焦的
        },
        YOTC_CARRAT_GYM_STAMINA = 
        {
            GENERIC = "Rope skipping machine!",		-- 物品名:"耐力健身房"->默认
            RAT = "Hop!",		-- 物品名:"耐力健身房"
            BURNT = "Ouch....",		-- 物品名:"耐力健身房"->烧焦的
        }, 
        YOTC_CARRAT_GYM_DIRECTION_ITEM = "I'll make my dude the best!",		-- 物品名:"方向健身房套装" 制造描述:"提高你的胡萝卜鼠的方向感"
        YOTC_CARRAT_GYM_SPEED_ITEM = "For the better carrat.",		-- 物品名:"速度健身房套装" 制造描述:"增加你的胡萝卜鼠的速度"
        YOTC_CARRAT_GYM_STAMINA_ITEM = "Where should I put this?",		-- 物品名:"耐力健身房套装" 制造描述:"增强你的胡萝卜鼠的耐力"
        YOTC_CARRAT_GYM_REACTION_ITEM = "Got a lot more to assemble.",		-- 物品名:"反应健身房套装" 制造描述:"加快你的胡萝卜鼠的反应时间"
        YOTC_CARRAT_SCALE_ITEM = "This can tell which carrat is the best~",           		-- 物品名:"胡萝卜鼠秤套装" 制造描述:"看看你的胡萝卜鼠的情况"
        YOTC_CARRAT_SCALE = 
        {
            GENERIC = "I gotta have the best carrat!",		-- 物品名:"胡萝卜鼠秤"->默认
            CARRAT = "Not quite good.",		-- 物品名:"胡萝卜" 制造描述:"灵巧机敏，富含胡萝卜素"
            CARRAT_GOOD = "Will be quite a competitor!",		-- 物品名:"胡萝卜鼠秤"
            BURNT = "This is literally not me!",		-- 物品名:"胡萝卜鼠秤"->烧焦的
        },                
		BISHOP_CHARGE_HIT = "Lump!",		-- 物品名:"胡萝卜鼠秤"->被主教攻击
		TRUNKVEST_SUMMER = "Put on a nose!",		-- 物品名:"保暖小背心" 制造描述:"暖和，但算不上非常暖和"
		TRUNKVEST_WINTER = "Quite comfy!",		-- 物品名:"寒冬背心" 制造描述:"足以抵御冬季暴雪的保暖背心"
		TRUNK_COOKED = "Bo!",		-- 物品名:"象鼻排"
		TRUNK_SUMMER = "Got its nose.",		-- 物品名:"象鼻"
		TRUNK_WINTER = "A furry nose.",		-- 物品名:"冬象鼻"
		TUMBLEWEED = "Where are you headed?",		-- 物品名:"风滚草"
		TURKEYDINNER = "What a nightmare!",		-- 物品名:"火鸡大餐"
		TWIGS = "A few little twigs.",		-- 物品名:"树枝"
		UMBRELLA = "With this open, rain won't drench me!",		-- 物品名:"雨伞" 制造描述:"遮阳挡雨！"
		GRASS_UMBRELLA = "I still can't appreciate what's so beautiful of this.",		-- 物品名:"花伞" 制造描述:"漂亮轻便的保护伞"
		UNIMPLEMENTED = "What is that?",		-- 物品名:"胡萝卜鼠秤"
		WAFFLES = "Honey sweet flat pies!",		-- 物品名:"华夫饼"
		WALL_HAY = 
		{	
			GENERIC = "I can get the wall down with my mouth blowing!",		-- 物品名:"草墙"->默认
			BURNT = "Ok...the stories usually don't end this way.",		-- 物品名:"草墙"->烧焦的
		},
		WALL_HAY_ITEM = "Lady Wickerbuttom used to tell a story about a hay wall.",		-- 物品名:"草墙" 制造描述:"草墙墙体不太结实"
		WALL_STONE = "Looks rather good!",		-- 物品名:"石墙"
		WALL_STONE_ITEM = "A compacted stone pile.",		-- 物品名:"石墙" 制造描述:"石墙墙体"
		WALL_RUINS = "Why does it look so aged.",		-- 物品名:"铥墙"
		WALL_RUINS_ITEM = "Can build a solid wall out of this.",		-- 物品名:"铥墙" 制造描述:"这些墙可以承受相当多的打击"
		WALL_WOOD = 
		{
			GENERIC = "Would be prettier with a few moon flowers.",		-- 物品名:"木墙"->默认
			BURNT = "Awww, used to be such a good wall.",		-- 物品名:"木墙"->烧焦的
		},
		WALL_WOOD_ITEM = "The pointed top is my favorite!",		-- 物品名:"木墙" 制造描述:"木墙墙体"
		WALL_MOONROCK = "Bit different than my hometown's wall.",		-- 物品名:"月岩壁"
		WALL_MOONROCK_ITEM = "Hard rock.",		-- 物品名:"月岩壁" 制造描述:"月球疯子之墙"
		FENCE = "Can bar those annoying pigmans outside.",		-- 物品名:"木栅栏"
        FENCE_ITEM = "Fence-building material.",		-- 物品名:"木栅栏" 制造描述:"木栅栏部分"
        FENCE_GATE = "What a smart move to set a door to the front fence.",		-- 物品名:"木门"
        FENCE_GATE_ITEM = "Material for fence gate.",		-- 物品名:"木门" 制造描述:"木栅栏的门"
		WALRUS = "He looks big and important.",		-- 物品名:"海象人"
		WALRUSHAT = "Hee-hee, my ears are warm and comfy.",		-- 物品名:"海象的贝雷帽"
		WALRUS_CAMP =
		{
			EMPTY = "Others have been here before.",		-- 物品名:"海象营"
			GENERIC = "Though a house made of ice, still warm inside.",		-- 物品名:"海象营"->默认
		},
		WALRUS_TUSK = "I took his tusk!",		-- 物品名:"海象牙"
		WARDROBE = 
		{
			GENERIC = "Let's have a pajama party.",		-- 物品名:"衣柜"->默认 制造描述:"随心变换面容"
            BURNING = "Fire! No, all my clothes!!",		-- 物品名:"衣柜"->正在燃烧 制造描述:"随心变换面容"
			BURNT = "Awwwwwwwwww!",		-- 物品名:"衣柜"->烧焦的 制造描述:"随心变换面容"
		},
		WARG = "His teeth are gigantic!",		-- 物品名:"座狼"
		WASPHIVE = "Looks frightening, but it has sweet treats inside.",		-- 物品名:"杀人蜂蜂窝"
		WATERBALLOON = "Don't be scared. I won't throw them at you...(Hee-hee)...",		-- 物品名:"水球" 制造描述:"球体灭火"
		WATERMELON = "Give me some!",		-- 物品名:"西瓜"
		WATERMELON_COOKED = "Cooked...watermelon?",		-- 物品名:"烤西瓜"
		WATERMELONHAT = "I love fashion~",		-- 物品名:"西瓜帽" 制造描述:"提神醒脑，但感觉黏黏的"
		WAXWELLJOURNAL = "Never like stories in that book...",		-- 物品名:"暗影魔法书" 制造描述:"这将让你大吃一惊"
		WETGOOP = "Usually muddy foods are my favorite, except this...",		-- 物品名:"失败料理"
        WHIP = "Charge! My pony!",		-- 物品名:"皮鞭" 制造描述:"提出有建设性的反馈意见"
		WINTERHAT = "Looks like it can take good care of my head.",		-- 物品名:"冬帽" 制造描述:"保持脑袋温暖"
		WINTEROMETER = 
		{
			GENERIC = "People need this to tell cold and hot?",		-- 物品名:"温度测量仪"->默认 制造描述:"测量环境气温"
			BURNT = "Eh-huh.",		-- 物品名:"温度测量仪"->烧焦的 制造描述:"测量环境气温"
		},
        WINTER_TREE =
        {
            BURNT = "Used to be what a lovely...",		-- 物品名:"冬季圣诞树"->烧焦的
            BURNING = "Let's put the fire out!",		-- 物品名:"冬季圣诞树"->正在燃烧
            CANDECORATE = "I've never seen a tree as gorgeous as this!",		-- 物品名:"冬季圣诞树"->烛台？？？
            YOUNG = "Grow!",		-- 物品名:"冬季圣诞树"->还年轻
        },
		WINTER_TREESTAND = 
		{
			GENERIC = "Gotta find a tree seed.",		-- 物品名:"圣诞树墩"->默认 制造描述:"种植并装饰一棵冬季圣诞树！"
            BURNT = "Ouch...",		-- 物品名:"圣诞树墩"->烧焦的 制造描述:"种植并装饰一棵冬季圣诞树！"
		},
        WINTER_ORNAMENT = "A cute trinket.",		-- 物品名:"圣诞小玩意"
        WINTER_ORNAMENTLIGHT = "With twinkling light.",		-- 物品名:"圣诞灯"
        WINTER_ORNAMENTBOSS = "These left special positions on the tree.",		-- 物品名:"华丽的装饰"
		WINTER_ORNAMENTFORGE = "Let's put this on the tree also?",		-- 物品名:"熔炉装饰"
		WINTER_ORNAMENTGORGE = "What is this?",		-- 物品名:"舒缓的装饰"
        WINTER_FOOD1 = "Hmm, what's this for?", --gingerbread cookie		-- 物品名:"小姜饼"
        WINTER_FOOD2 = "This snow flake melts slower on my tongue.", --sugar cookie		-- 物品名:"糖曲奇饼"
        WINTER_FOOD3 = "Crispy~", --candy cane		-- 物品名:"拐杖糖"
        WINTER_FOOD4 = "What's the inside?", --fruitcake		-- 物品名:"永远的水果蛋糕"
        WINTER_FOOD5 = "Is it real log?", --yule log cake		-- 物品名:"巧克力树洞蛋糕"
        WINTER_FOOD6 = "Look at this! I can swallow it all at once...", --plum pudding		-- 物品名:"李子布丁"
        WINTER_FOOD7 = "Eh-huh.", --apple cider		-- 物品名:"苹果酒"
        WINTER_FOOD8 = "Top level! Thumbs up!", --hot cocoa		-- 物品名:"热可可"
        WINTER_FOOD9 = "Gu-du, gu-du.", --eggnog		-- 物品名:"美味的蛋酒"
		WINTERSFEASTOVEN =
		{
			GENERIC = "The fire can last really long.",		-- 物品名:"砖砌烤炉"->默认 制造描述:"燃起了喜庆的火焰"
			COOKING = "Cooking at the while...",		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰"
			ALMOST_DONE_COOKING = "Now? Can I do it? Can I eat now? Can...",		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰"
			DISH_READY = "Feast's ready! Come over!",		-- 物品名:"砖砌烤炉" 制造描述:"燃起了喜庆的火焰"
		},
		BERRYSAUCE = "Delicious berries~",		-- 物品名:"快乐浆果酱"
		BIBINGKA = "I like this!",		-- 物品名:"比宾卡米糕"
		CABBAGEROLLS = "Cabbage bag of cabbage!",		-- 物品名:"白菜卷"
		FESTIVEFISH = "It's a trick: it has a fishy outlook, but a veggie nature.",		-- 物品名:"节庆鱼料理"
		GRAVY = "Hmmm~ Chocolate!",		-- 物品名:"好肉汁"
		LATKES = "Crispy delicacy~",		-- 物品名:"土豆饼"
		LUTEFISK = "Potato with the shape of a fish.",		-- 物品名:"苏打鱼"
		MULLEDDRINK = "Hmmm~ My stomach feels warm.",		-- 物品名:"香料潘趣酒"
		PANETTONE = "Honey smell bread! I'm drooling.",		-- 物品名:"托尼甜面包"
		PAVLOVA = "Chief cooks call it egg-white cake.",		-- 物品名:"巴甫洛娃蛋糕"
		PICKLEDHERRING = "It's a trick: it has a fishy outlook, but a veggie nature.",		-- 物品名:"腌鲱鱼"
		POLISHCOOKIE = "Nice nice fruit pockets.",		-- 物品名:"波兰饼干"
		PUMPKINPIE = "Hmm-hmm-hmmm~",		-- 物品名:"南瓜饼"
		ROASTTURKEY = "Looks like a terrible turkey, though smell like veggie?",		-- 物品名:"烤火鸡"
		STUFFING = "Delicious bread crumbs!",		-- 物品名:"烤火鸡面包馅"
		SWEETPOTATO = "Tastier than potatoes!",		-- 物品名:"红薯焗饭"
		TAMALES = "Aww, spicy veggies!",		-- 物品名:"塔马利"
		TOURTIERE = "Hmm, a spicy veggie pie!",		-- 物品名:"饕餮馅饼"
		TABLE_WINTERS_FEAST = 
		{
			GENERIC = "High-level dining table.",		-- 物品名:"冬季盛宴餐桌"->默认 制造描述:"一起来享用冬季盛宴吧"
			HAS_FOOD = "Ready to eat! Ready to eat!",		-- 物品名:"冬季盛宴餐桌" 制造描述:"一起来享用冬季盛宴吧"
			WRONG_TYPE = "Can't put that here.",		-- 物品名:"冬季盛宴餐桌" 制造描述:"一起来享用冬季盛宴吧"
			BURNT = "Oh...feast over?",		-- 物品名:"冬季盛宴餐桌"->烧焦的 制造描述:"一起来享用冬季盛宴吧"
		},
		GINGERBREADWARG = "I wanna eat you full!", 		-- 物品名:"姜饼狼"
		GINGERBREADHOUSE = "Hello~ Anyone home?", 		-- 物品名:"姜饼猪屋"
		GINGERBREADPIG = "I can't let go of those ginger pigs.",		-- 物品名:"姜饼猪"
		CRUMBS = "Leaves a trail of bread crumbs.",		-- 物品名:"饼干屑"
		WINTERSFEASTFUEL = "Looks tasty.",		-- 物品名:"节日欢愉"
        KLAUS = "Have a present for me, Santa?",		-- 物品名:"克劳斯"
        KLAUS_SACK = "Open, please, sir!",		-- 物品名:"赃物袋"
		KLAUSSACKKEY = "Strange and big deer antler.",		-- 物品名:"麋鹿茸"
		WORMHOLE =
		{
			GENERIC = "What's moving in there?!",		-- 物品名:"虫洞"->默认
			OPEN = "Haha, a fanged portal!",		-- 物品名:"虫洞"->打开
		},
		WORMHOLE_LIMITED = "You don't feel good?",		-- 物品名:"生病的虫洞"->一次性虫洞 单机
		ACCOMPLISHMENT_SHRINE = "A lot of achievement!",        		-- 物品名:"奖杯" 制造描述:"证明你作为一个人的价值"
		LIVINGTREE = "Its creepy stare thrilled me...",		-- 物品名:"完全正常的树"
		ICESTAFF = "A magical cold stick.",		-- 物品名:"冰魔杖" 制造描述:"把敌人冰冻在原地"
		REVIVER = "It's still twitching...",		-- 物品名:"告密的心" 制造描述:"鬼魂朋友复活了，好可怕"
		SHADOWHEART = "So pathetic.",		-- 物品名:"暗影心房"
        ATRIUM_RUBBLE = 
        {
			LINE_1 = "A story-telling picture~",		-- 物品名:"古代的壁画"->第一行
			LINE_2 = "The picture's hidden.",		-- 物品名:"古代的壁画"->第二行
			LINE_3 = "Looks like...something bad's happened before.",		-- 物品名:"古代的壁画"->第三行
			LINE_4 = "Here it started to get scary...",		-- 物品名:"古代的壁画"->第四行
			LINE_5 = "They once owned a village here.",		-- 物品名:"古代的壁画"->第五行
		},
        ATRIUM_STATUE = "Something's wrong...",		-- 物品名:"远古雕像"
        ATRIUM_LIGHT = 
        {
			ON = "So horrifying!",		-- 物品名:"古代的灯塔"->开启
			OFF = "You need kindling fire?",		-- 物品名:"古代的灯塔"->关闭
		},
        ATRIUM_GATE =
        {
			ON = "Shouldn't do that...sorry!",		-- 物品名:"古代的通道"->开启
			OFF = "Somebody broke it?",		-- 物品名:"古代的通道"->关闭
			CHARGING = "What's happened to this?",		-- 物品名:"古代的通道"->充能中
			DESTABILIZING = "!!!",		-- 物品名:"古代的通道"->不稳定
			COOLDOWN = "Over?",		-- 物品名:"古代的通道"->冷却中
        },
        ATRIUM_KEY = "This looks quite significant!",		-- 物品名:"古代的钥匙"
		LIFEINJECTOR = "Never like needles...",		-- 物品名:"强心针" 制造描述:"提高下你那日渐衰退的最大健康值吧"
		SKELETON_PLAYER =
		{
			MALE = "They...they met something terrible.",		-- 物品名:"骷髅"->男性
			FEMALE = "They...they met something terrible.",		-- 物品名:"骷髅"->女性
			ROBOT = "They...they met something terrible.",		-- 物品名:"骷髅"->机器人
			DEFAULT = "Goodbye...",		-- 物品名:"物品栏物品"->默认
		},
		HUMANMEAT = "No!!! I said NO!!!",		-- 物品名:"长猪"
		HUMANMEAT_COOKED = "It smells even worse when cooked.",		-- 物品名:"煮熟的长猪"
		HUMANMEAT_DRIED = "No no no!",		-- 物品名:"长猪肉干"
		ROCK_MOON = "Moon rock!",		-- 物品名:"岩石"
		MOONROCKNUGGET = "My hometown's stone.",		-- 物品名:"月岩"
		MOONROCKCRATER = "This eye needs a heart.",		-- 物品名:"有洞的月亮石" 制造描述:"用于划定地盘的岩石"
		MOONROCKSEED = "Enjoy the beauty of the moon, she rowed er boat beside the cloud to buy alchohols.",		-- 物品名:"天体宝球"
        REDMOONEYE = "Scarlet contempt.",		-- 物品名:"红色月眼"
        PURPLEMOONEYE = "Deep gaze.",		-- 物品名:"紫色月眼"
        GREENMOONEYE = "Stare of life.",		-- 物品名:"绿色月眼"
        ORANGEMOONEYE = "A warm contemplation.",		-- 物品名:"橘色月眼"
        YELLOWMOONEYE = "Muddled peep.",		-- 物品名:"黄色月眼"
        BLUEMOONEYE = "Chilly overlook.",		-- 物品名:"蓝色月眼"
        BOARRIOR = "Big-big pigman!",		-- 物品名:"大熔炉猪战士"->大熔炉猪战士
        BOARON = "Are you relative of pigmen?",		-- 物品名:"小猪"
        PEGHOOK = "Evil worms!",		-- 物品名:"蝎子"
        TRAILS = "He actually doesn't look very tough.",		-- 物品名:"大猩猩"
        TURTILLUS = "Why be a prickhead?",		-- 物品名:"坦克龟"
        SNAPPER = "Full of teeth.",		-- 物品名:"鳄鱼指挥官"
		RHINODRILL = "They are not as strong as I thought~",		-- 物品名:"后扣帽犀牛兄弟"
		BEETLETAUR = "Dah!",		-- 物品名:"地狱独眼巨猪"
        LAVAARENA_PORTAL = 
        {
            ON = "Goodbye!",		-- 物品名:"远古传送门"->开启
            GENERIC = "How to operate that gate?",		-- 物品名:"远古传送门"->默认
        },
        HEALINGSTAFF = "Ho! Ugly but refreshing wand.",		-- 物品名:"生存魔杖"
        FIREBALLSTAFF = "Phew-Hong!",		-- 物品名:"地狱魔杖"
        HAMMER_MJOLNIR = "Especially powerful hammer!",		-- 物品名:"锻锤"
        SPEAR_GUNGNIR = "Spear forward!",		-- 物品名:"尖齿矛"
        BLOWDART_LAVA = "I shouldn't play this...but I want to!",		-- 物品名:"吹箭"
        BLOWDART_LAVA2 = "Looks quite dangerous, this one.",		-- 物品名:"熔化吹箭"
        WEBBER_SPIDER_MINION = "Okay, we had truce, remember?",		-- 物品名:"蜘蛛宝宝"
        BOOK_FOSSIL = "What did it say?",		-- 物品名:"石化之书"
		SPEAR_LANCE = "Whirl and whirl!",		-- 物品名:"螺旋矛"
		BOOK_ELEMENTAL = "What did it say? I'm curious...",		-- 物品名:"召唤之书"
        QUAGMIRE_ALTAR = 
        {
        	GENERIC = "Where had the food gone?",		-- 物品名:"饕餮祭坛"->默认
        	FULL = "It's just finished!",		-- 物品名:"饕餮祭坛"->满了
    	},
		QUAGMIRE_SUGARWOODTREE = 
		{
			GENERIC = "There are sweet stuffs inside.",		-- 物品名:"糖木树"->默认
			STUMP = "Someone chopped it, not me!",		-- 物品名:"糖木树"->暴食模式糖木树只剩树桩了
			TAPPED_EMPTY = "Ouch...nothing left.",		-- 物品名:"糖木树"->暴食模式糖木树空了
			TAPPED_READY = "Hmmm, full of sweet substance.",		-- 物品名:"糖木树"->暴食模式糖木树好了
			TAPPED_BUGS = "Dah! Ants got stuck in honey.",		-- 物品名:"糖木树"->暴食模式糖木树上有蚂蚁
			WOUNDED = "Is the tree alright?",		-- 物品名:"糖木树"->暴食糖木树生病了
		},
		QUAGMIRE_SPOTSPICE_SHRUB = 
		{
			GENERIC = "A feeling of home~",		-- 物品名:"带斑点的小灌木"->默认
			PICKED = "Nothing left to pick.",		-- 物品名:"带斑点的小灌木"->被采完了
		},
		QUAGMIRE_SALT_RACK =
		{
			READY = "What's on it?",		-- 物品名:"盐架"->准备好的 满的
			GENERIC = "What's the use of it?",		-- 物品名:"盐架"->默认
		},
		QUAGMIRE_SAFE = 
		{
			GENERIC = "I wonder what did that chest hide?",		-- 物品名:"保险箱"->默认
			LOCKED = "Awww...let me in!",		-- 物品名:"保险箱"->锁住了
		},
		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "Oh! I didn't expect to see a mushroom here.",		-- 物品名:"蘑菇"->默认
			PICKED = "No...mushroom?",		-- 物品名:"蘑菇"->被采完了
		},
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "Hello?",		-- 物品名:"残破的房子" 制造描述:未找到
            "It's so stark here.",		-- 物品名:"残破的房子" 制造描述:未找到
            "Nobody at home...",		-- 物品名:"残破的房子" 制造描述:未找到
        },
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "That pigman looks very different.",		-- 物品名:"沼泽猪长老"->默认
            SLEEPING = "Asleep?",		-- 物品名:"沼泽猪长老"->睡着了
        },
        QUAGMIRE_FOOD =
        {
        	GENERIC = "We should feed it to the mouth in the sky.",		-- 物品名:未找到
            MISMATCH = "It may not like this.",		-- 物品名:未找到
            MATCH = "Fit the mouth in the sky.",		-- 物品名:未找到
            MATCH_BUT_SNACK = "With a mouth big as this, the food is really tiny.",		-- 物品名:未找到
        },
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "Better be something good, I hope.",		-- 物品名:"铁门"->默认
            LOCKED = "Let me in...please...",		-- 物品名:"铁门"->锁住了
        },
        QUAGMIRE_PIGEON =
        {
            DEAD = "Eh? It's dead?",		-- 物品名:"鸽子"->死了 制造描述:"这是一只完整的活鸽"
            GENERIC = "Hello! Special bird!",		-- 物品名:"鸽子"->默认 制造描述:"这是一只完整的活鸽"
            SLEEPING = "A bird in the middle of a sweet dream.",		-- 物品名:"鸽子"->睡着了 制造描述:"这是一只完整的活鸽"
        },
        WINONA_CATAPULT = 
        {
        	GENERIC = "Stone-casting machines.",		-- 物品名:"薇诺娜的投石机"->默认 制造描述:"向敌人投掷大石块"
        	OFF = "Why does it go strike?",		-- 物品名:"薇诺娜的投石机"->关闭 制造描述:"向敌人投掷大石块"
        	BURNING = "This looks really dangerous!",		-- 物品名:"薇诺娜的投石机"->正在燃烧 制造描述:"向敌人投掷大石块"
        	BURNT = "Woo-woo...",		-- 物品名:"薇诺娜的投石机"->烧焦的 制造描述:"向敌人投掷大石块"
        },
        WINONA_SPOTLIGHT = 
        {
        	GENERIC = "What is this?",		-- 物品名:"薇诺娜的聚光灯"->默认 制造描述:"白天夜里都发光"
        	OFF = "I think it's just tired.",		-- 物品名:"薇诺娜的聚光灯"->关闭 制造描述:"白天夜里都发光"
        	BURNING = "This is not the right light!!",		-- 物品名:"薇诺娜的聚光灯"->正在燃烧 制造描述:"白天夜里都发光"
        	BURNT = "Now it runs out of uses.",		-- 物品名:"薇诺娜的聚光灯"->烧焦的 制造描述:"白天夜里都发光"
        },
        WINONA_BATTERY_LOW = 
        {
        	GENERIC = "This chest has strange branches out.",		-- 物品名:"薇诺娜的发电机"->默认 制造描述:"要确保电力供应充足"
        	LOWPOWER = "This light is getting dimmer and dimmer.",		-- 物品名:"薇诺娜的发电机"->没电了 制造描述:"要确保电力供应充足"
        	OFF = "It should have slept already.",		-- 物品名:"薇诺娜的发电机"->关闭 制造描述:"要确保电力供应充足"
        	BURNING = "Not me! I didn't do anything!",		-- 物品名:"薇诺娜的发电机"->正在燃烧 制造描述:"要确保电力供应充足"
        	BURNT = "Lady Winona should make another one.",		-- 物品名:"薇诺娜的发电机"->烧焦的 制造描述:"要确保电力供应充足"
        },
        WINONA_BATTERY_HIGH = 
        {
        	GENERIC = "What can it do?",		-- 物品名:"薇诺娜的宝石发电机"->默认 制造描述:"这玩意烧宝石，所以肯定不会差"
        	LOWPOWER = "I guess it's exhausted.",		-- 物品名:"薇诺娜的宝石发电机"->没电了 制造描述:"这玩意烧宝石，所以肯定不会差"
        	OFF = "Was it supposed to do something?",		-- 物品名:"薇诺娜的宝石发电机"->关闭 制造描述:"这玩意烧宝石，所以肯定不会差"
        	BURNING = "Is it...normal like this?",		-- 物品名:"薇诺娜的宝石发电机"->正在燃烧 制造描述:"这玩意烧宝石，所以肯定不会差"
        	BURNT = "Ouch, give it a rest.",		-- 物品名:"薇诺娜的宝石发电机"->烧焦的 制造描述:"这玩意烧宝石，所以肯定不会差"
        },
        COMPOSTWRAP = "(smell) !!!",		-- 物品名:"肥料包" 制造描述:"\"草本\"的疗法"
        ARMOR_BRAMBLE = "Made of thorns on plants.",		-- 物品名:"荆棘外壳" 制造描述:"让大自然告诉你什么叫\"滚开\""
        TRAP_BRAMBLE = "Plants' revenge!",		-- 物品名:"荆棘陷阱" 制造描述:"都有机会中招的干\n扰陷阱"
        BOATFRAGMENT03 = "Good bye, little boat.",		-- 物品名:"船碎片"
        BOATFRAGMENT04 = "Good bye, little boat.",		-- 物品名:"船碎片"
        BOATFRAGMENT05 = "Good bye, little boat.",		-- 物品名:"船碎片"
		BOAT_LEAK = "I don't think it's a big problem.",		-- 物品名:"漏洞"
        MAST = "Is it used on a boat?",		-- 物品名:"桅杆" 制造描述:"乘风破浪会有时"
        SEASTACK = "Ahoy! Big stones!",		-- 物品名:"浮堆"
        FISHINGNET = "Net a lot of fish!",		-- 物品名:"渔网" 制造描述:"就是一张网"
        ANTCHOVIES = "A fish? Or a worm?",		-- 物品名:"蚁头凤尾鱼"
        STEERINGWHEEL = "Now I'm the captain!",		-- 物品名:"方向舵" 制造描述:"航海必备道具"
        ANCHOR = "Set a solid hydrant!",		-- 物品名:"锚" 制造描述:"船用刹车"
        BOATPATCH = "Why do a patch? I think it's better to let water spill.",		-- 物品名:"船补丁" 制造描述:"打补丁永远不晚"
        DRIFTWOOD_TREE = 
        {
            BURNING = "Hot hot hot!",		-- 物品名:"浮木"->正在燃烧
            BURNT = "Gone.",		-- 物品名:"浮木"->烧焦的
            CHOPPED = "Turn it into piece!",		-- 物品名:"浮木"->被砍了
            GENERIC = "It's drown...",		-- 物品名:"浮木"->默认
        },
        DRIFTWOOD_LOG = "Drift log.",		-- 物品名:"浮木桩"
        MOON_TREE = 
        {
            BURNING = "Let's save her quick!",		-- 物品名:"月树"->正在燃烧
            BURNT = "Moon Palace's property, then.，",		-- 物品名:"月树"->烧焦的
            CHOPPED = "Only a stump left.",		-- 物品名:"月树"->被砍了
            GENERIC = "Please give me a flower.",		-- 物品名:"月树"->默认
        },
		MOON_TREE_BLOSSOM = "Hometown's feeling of aroma.",		-- 物品名:"月树花"
        MOONBUTTERFLY = 
        {
        	GENERIC = "Moon moth flying over the sky, covering the sight.",		-- 物品名:"月蛾"->默认
        	HELD = "So soft.",		-- 物品名:"月蛾"->拿在手里
        },
		MOONBUTTERFLYWINGS = "Bit dusty.",		-- 物品名:"月蛾翅膀"
        MOONBUTTERFLY_SAPLING = "Tree-fied moth, goes back to earth.",		-- 物品名:"月树苗"
        ROCK_AVOCADO_FRUIT = "(bite) Aw, so hard!",		-- 物品名:"石果"
        ROCK_AVOCADO_FRUIT_RIPE = "It's ready, I think.",		-- 物品名:"成熟石果"
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "Even better.",		-- 物品名:"熟石果"
        ROCK_AVOCADO_FRUIT_SPROUT = "Now it's too small to be an edible fruit.",		-- 物品名:"发芽的石果"
        ROCK_AVOCADO_BUSH = 
        {
        	BARREN = "We don't got fruits here currently.",		-- 物品名:"石果灌木丛"
			WITHERED = "It looks thirsty.",		-- 物品名:"石果灌木丛"->枯萎了
			GENERIC = "Ha! These fruits are just like stones.",		-- 物品名:"石果灌木丛"->默认
			PICKED = "Now they grew back!",		-- 物品名:"石果灌木丛"->被采完了
			DISEASED = "Looks like got infected with something...",		-- 物品名:"石果灌木丛"->生病了
            DISEASING = "It's becoming problematic...",		-- 物品名:"石果灌木丛"->正在生病？？
			BURNING = "Fire! Fire!",		-- 物品名:"石果灌木丛"->正在燃烧
		},
        DEAD_SEA_BONES = "Poor fish...you should've stayed in water.",		-- 物品名:"海骨"
        HOTSPRING = 
        {
        	GENERIC = "Let me take a bath, please?",		-- 物品名:"温泉"->默认
        	BOMBED = "Looks warm and comfy.",		-- 物品名:"温泉"
        	GLASS = "So beautiful!",		-- 物品名:"温泉"
			EMPTY = "Got nothing left.",		-- 物品名:"温泉"
        },
        MOONGLASS = "The blade of nostalgia.",		-- 物品名:"月亮碎片"
        MOONGLASS_ROCK = "Perfect as jade!",		-- 物品名:"月光玻璃"
        BATHBOMB = "I wanna throw it into water and take a bath right now!",		-- 物品名:"沐浴球" 制造描述:"春天里来百花香？这点子把地都炸碎了"
        TRAP_STARFISH =
        {
            GENERIC = "Have a desire to poke it.",		-- 物品名:"海星"->默认
            CLOSED = "It almost swallowed me...",		-- 物品名:"海星"
        },
        DUG_TRAP_STARFISH = "I'll go find you a good place.",		-- 物品名:"海星陷阱"
        SPIDER_MOON = 
        {
        	GENERIC = "I've never seen a spider like this before...",		-- 物品名:"破碎蜘蛛"->默认
        	SLEEPING = "Hush...",		-- 物品名:"破碎蜘蛛"->睡着了
        	DEAD = "Bye bye!",		-- 物品名:"破碎蜘蛛"->死了
        },
        MOONSPIDERDEN = "A especially disgusting spider nest!",		-- 物品名:"破碎蜘蛛洞"
		FRUITDRAGON =
		{
			GENERIC = "Green is not a color everyone can accept.",		-- 物品名:"沙拉蝾螈"->默认
			RIPE = "Smell like...a fruit?",		-- 物品名:"沙拉蝾螈"
			SLEEPING = "It's taking a nap.",		-- 物品名:"沙拉蝾螈"->睡着了
		},
        PUFFIN =
        {
            GENERIC = "Little chubby bird.",		-- 物品名:"海鹦鹉"->默认
            HELD = "Caught ya!",		-- 物品名:"海鹦鹉"->拿在手里
            SLEEPING = "Sleeping bird!",		-- 物品名:"海鹦鹉"->睡着了
        },
		MOONGLASSAXE = "Surprisingly handy when chopping.",		-- 物品名:"月光玻璃斧" 制造描述:"脆弱而有效"
		GLASSCUTTER = "So sharp!",		-- 物品名:"玻璃刀" 制造描述:"尖端武器"
        ICEBERG =
        {
            GENERIC = "Be careful!",		-- 物品名:"小冰山"->默认
            MELTED = "It's all melted.",		-- 物品名:"小冰山"->融化了
        },
        ICEBERG_MELTED = "All melted!",		-- 物品名:"融化的冰山"
        MINIFLARE = "Shining sparks!",		-- 物品名:"信号" 制造描述:"为你信任的朋友照亮前路"
		MOON_FISSURE = 
		{
			GENERIC = "Why is my head feeling dizzing...", 		-- 物品名:"天体裂隙"->默认
			NOLIGHT = "Echo~ Echo~ Echo-cho~......",		-- 物品名:"天体裂隙"
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "Still need something.",		-- 物品名:未找到
            GENERIC = "Heed some help?",		-- 物品名:未找到
        },
        MOON_ALTAR_IDOL = "Where do you wanna go?",		-- 物品名:"天体祭坛雕像"
        MOON_ALTAR_GLASS = "It looks sad there.",		-- 物品名:"天体祭坛底座"
        MOON_ALTAR_SEED = "You should go home.",		-- 物品名:"天体祭坛宝球"
        MOON_ALTAR_ROCK_IDOL = "Hello?",		-- 物品名:"在呼唤我"
        MOON_ALTAR_ROCK_GLASS = "Hello?",		-- 物品名:"在呼唤我"
        MOON_ALTAR_ROCK_SEED = "Hello?",		-- 物品名:"在呼唤我"
        SEAFARING_PROTOTYPER =
        {
            GENERIC = "Can craft shipping eqipment.",		-- 物品名:"智囊团"->默认 制造描述:"海上科学"
            BURNT = "This condition happened so often...",		-- 物品名:"智囊团"->烧焦的 制造描述:"海上科学"
        },
        BOAT_ITEM = "Can travel all across water region.",		-- 物品名:"船套装" 制造描述:"让大海成为你的领地"
        STEERINGWHEEL_ITEM = "This is for the boat?？",		-- 物品名:"方向舵套装" 制造描述:"航海必备道具"
        ANCHOR_ITEM = "Tool that anchors the boat.",		-- 物品名:"锚套装" 制造描述:"船用刹车"
        MAST_ITEM = "An unfinished work of a boat tool.",		-- 物品名:"桅杆套装" 制造描述:"乘风破浪会有时"
        MUTATEDHOUND = 
        {
        	DEAD = "See you other day, puppy.",		-- 物品名:"恐怖猎犬"->死了
        	GENERIC = "Looks sick?",		-- 物品名:"恐怖猎犬"->默认
        	SLEEPING = "Let's not wake it up.",		-- 物品名:"恐怖猎犬"->睡着了
        },
        MUTATED_PENGUIN = 
        {
			DEAD = "This way better.",		-- 物品名:"月石企鸥"->死了
			GENERIC = "Oh! I can see its internal guts!",		-- 物品名:"月石企鸥"->默认
			SLEEPING = "Good night, frightening birds!",		-- 物品名:"月石企鸥"->睡着了
		},
        CARRAT = 
        {
        	DEAD = "Not moving?",		-- 物品名:"胡萝卜"->死了 制造描述:"灵巧机敏，富含胡萝卜素"
        	GENERIC = "What is this?",		-- 物品名:"胡萝卜"->默认 制造描述:"灵巧机敏，富含胡萝卜素"
        	HELD = "A food or a pet?",		-- 物品名:"胡萝卜"->拿在手里 制造描述:"灵巧机敏，富含胡萝卜素"
        	SLEEPING = "It's having a sweet dream.",		-- 物品名:"胡萝卜"->睡着了 制造描述:"灵巧机敏，富含胡萝卜素"
        },
		BULLKELP_PLANT = 
        {
            GENERIC = "A snack in the water.",		-- 物品名:"公牛海带"->默认
            PICKED = "Will grow back later.",		-- 物品名:"公牛海带"->被采完了
        },
		BULLKELP_ROOT = "Let's plant more water plants!",		-- 物品名:"公牛海带茎"
        KELPHAT = "I'd rather eat it than wear it...",		-- 物品名:"海花冠" 制造描述:"让人神经焦虑的东西"
		KELP = "A snack in the water!",		-- 物品名:"海带叶"
		KELP_COOKED = "Sticky texture.",		-- 物品名:"熟海带叶"
		KELP_DRIED = "Salty, thin, and crispy.",		-- 物品名:"干海带叶"
		GESTALT = "They want to tell stories.",		-- 物品名:"虚空之影"
		COOKIECUTTER = "Looks rather friendly.",		-- 物品名:"饼干切割机"
		COOKIECUTTERSHELL = "Haha! Now it's mine.",		-- 物品名:"饼干切割机壳"
		COOKIECUTTERHAT = "A nice pointed hat.",		-- 物品名:"饼干切割机帽子" 制造描述:"穿着必须犀利"
		SALTSTACK =
		{
			GENERIC = "A bizarre stone.",		-- 物品名:"盐堆"->默认
			MINED_OUT = "Nothing to take any more.",		-- 物品名:"盐堆"
			GROWING = "It's growing.",		-- 物品名:"盐堆"->正在生长
		},
		SALTROCK = "Strange rock nugget.",		-- 物品名:"盐晶"
		SALTBOX = "Suitable to store tasty food.",		-- 物品名:"盐盒" 制造描述:"用盐来储存食物"
		TACKLESTATION = "Can't do this to fish friends!",		-- 物品名:"钓具容器" 制造描述:"传统的用饵钓鱼"
		TACKLESKETCH = "Oh, pictures.",		-- 物品名:"{item}广告"
        MALBATROSS = "Bad bad birds!",		-- 物品名:"邪天翁"
        MALBATROSS_FEATHER = "Stolen from the bad bird.",		-- 物品名:"邪天翁羽毛"
        MALBATROSS_BEAK = "Shriek! Shriek! Hee-hee.",		-- 物品名:"邪天翁喙"
        MAST_MALBATROSS_ITEM = "A bird mast~",		-- 物品名:"飞翼风帆套装" 制造描述:"像海鸟一样航向深蓝"
        MAST_MALBATROSS = "Can you let a boat fly?",		-- 物品名:"飞翼风帆" 制造描述:"像海鸟一样航向深蓝"
		MALBATROSS_FEATHERED_WEAVE = "Made of birds!",		-- 物品名:"羽毛帆布" 制造描述:"精美的羽毛布料"
        GNARWAIL =
        {
            GENERIC = "What a strange-looking fish.",		-- 物品名:"一角鲸"->默认
            BROKENHORN = "Not so bad without a horn.",		-- 物品名:"一角鲸"
            FOLLOWER = "We are good friends now!",		-- 物品名:"一角鲸"->追随者
            BROKENHORN_FOLLOWER = "Not so bad without a horn.",		-- 物品名:"一角鲸"
        },
        GNARWAIL_HORN = "Haha! Now it's mine!",		-- 物品名:"一角鲸的角"
        WALKINGPLANK = "Jump board.",		-- 物品名:"木板"
        OAR = "Helps a boat walk.",		-- 物品名:"桨" 制造描述:"划，划，划小船"
		OAR_DRIFTWOOD = "Helps a boat run.",		-- 物品名:"浮木桨" 制造描述:"小桨要用浮木造？"
		OCEANFISHINGROD = "I will catch ocean fish!",		-- 物品名:"海钓竿" 制造描述:"像职业选手一样钓鱼吧"
		OCEANFISHINGBOBBER_NONE = "Still need something",		-- 物品名:"鱼钩"
        OCEANFISHINGBOBBER_BALL = "The bouy doesn't sink!",		-- 物品名:"木球浮标" 制造描述:"经典设计，初学者和职业钓手两相宜"
        OCEANFISHINGBOBBER_OVAL = "The bouy doesn't sink!",		-- 物品名:"硬物浮标" 制造描述:"在经典浮标的基础上融入了时尚设计"
		OCEANFISHINGBOBBER_CROW = "A floating feather!",		-- 物品名:"黑羽浮标" 制造描述:"深受职业钓手的喜爱"
		OCEANFISHINGBOBBER_ROBIN = "A floating feather!",		-- 物品名:"红羽浮标" 制造描述:"深受职业钓手的喜爱"
		OCEANFISHINGBOBBER_ROBIN_WINTER = "A floating feather!",		-- 物品名:"蔚蓝羽浮标" 制造描述:"深受职业钓手的喜爱"
		OCEANFISHINGBOBBER_CANARY = "A floating feather!",		-- 物品名:"番红花羽浮标" 制造描述:"深受职业钓手的喜爱"
		OCEANFISHINGBOBBER_GOOSE = "A big floating feather!",		-- 物品名:"鹅羽浮标" 制造描述:"高级羽绒浮标"
		OCEANFISHINGBOBBER_MALBATROSS = "A big floating feather!",		-- 物品名:"邪天翁羽浮标" 制造描述:"高级巨鸟浮标"
		OCEANFISHINGLURE_SPINNER_RED = "This won't hurt the fish, right?",		-- 物品名:"日出旋转亮片" 制造描述:"早起的鱼儿有虫吃"
		OCEANFISHINGLURE_SPINNER_GREEN = "This won't hurt the fish, right?",		-- 物品名:"黄昏旋转亮片" 制造描述:"低光照环境里效果最好"
		OCEANFISHINGLURE_SPINNER_BLUE = "This won't hurt the fish, right?",		-- 物品名:"夜飞侠旋转亮片" 制造描述:"适用于夜间垂钓"
		OCEANFISHINGLURE_SPOON_RED = "This won't hurt the fish, right?",		-- 物品名:"日出匙型假饵" 制造描述:"早起的鱼儿有虫吃"
		OCEANFISHINGLURE_SPOON_GREEN = "This won't hurt the fish, right?",		-- 物品名:"黄昏匙型假饵" 制造描述:"在夕阳中继续垂钓"
		OCEANFISHINGLURE_SPOON_BLUE = "This won't hurt the fish, right?",		-- 物品名:"匙型假饵" 制造描述:"适用于夜间垂钓"
		OCEANFISH_SMALL_1 = "Aww, so small.",		-- 物品名:"小孔雀鱼"
		OCEANFISH_SMALL_2 = "Be my new pet, please! I will feed you and take care of you!",		-- 物品名:"针鼻喷墨鱼"
		OCEANFISH_SMALL_3 = "Hi fishie~",		-- 物品名:"小饵鱼"
		OCEANFISH_SMALL_4 = "Little fish baby!",		-- 物品名:"三文鱼苗"
		OCEANFISH_SMALL_5 = "Hee-hee, looks silly.",		-- 物品名:"爆米花鱼"
		OCEANFISH_MEDIUM_1 = "Muddy and sticky.",		-- 物品名:"泥鱼"
		OCEANFISH_MEDIUM_2 = "Big and beautiful eyes!",		-- 物品名:"斑鱼"
		OCEANFISH_MEDIUM_3 = "With a stingy crown on the head.",		-- 物品名:"浮夸狮子鱼"
		OCEANFISH_MEDIUM_4 = "Could you be my new pet?",		-- 物品名:"黑鲶鱼"
		OCEANFISH_MEDIUM_5 = "Feels...bit weird, isn't it?",		-- 物品名:"玉米鳕鱼"
		OCEANFISH_MEDIUM_6 = "You are so gorgeous!",		-- 物品名:"花锦鲤"
		OCEANFISH_MEDIUM_7 = "Love your scale!",		-- 物品名:"金锦鲤"
		PONDFISH = "Ah so cute!",		-- 物品名:"淡水鱼"
		PONDEEL = "Hello long fish!",		-- 物品名:"鳗鱼"
        FISHMEAT = "No!!!",		-- 物品名:"生鱼肉"
        FISHMEAT_COOKED = "I don't eat this!",		-- 物品名:"鱼排"
        FISHMEAT_SMALL = "It used to be a kid...",		-- 物品名:"小鱼块"
        FISHMEAT_SMALL_COOKED = "Who would do something like this?!",		-- 物品名:"烤小鱼块"
		SPOILED_FISH = "Somebody didn't take good care of pet fish!",		-- 物品名:"变质的鱼"
		FISH_BOX = "And you just put them here? How dare!",		-- 物品名:"锡鱼桶" 制造描述:"保持鱼与网捕之日一样新鲜"
        POCKET_SCALE = "Strange measuring equipment.",		-- 物品名:"弹簧秤" 制造描述:"随时称鱼的重量！"
		TROPHYSCALE_FISH =
		{
			GENERIC = "This is a proper home of fish.",		-- 物品名:"鱼类计重器"->默认 制造描述:"炫耀你的斩获"
			HAS_ITEM = "Weight: {weight}\nCatcher: {owner}",		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获"
			BURNING = "AHHHH! NOOOO!",		-- 物品名:"鱼类计重器"->正在燃烧 制造描述:"炫耀你的斩获"
			BURNT = "(smell) Miserable home of fish.",		-- 物品名:"鱼类计重器"->烧焦的 制造描述:"炫耀你的斩获"
			OWNER = "Weight: {weight}\nCatcher: {owner}\nHee-hee, my fish are the best.",		-- 物品名:"鱼类计重器" 制造描述:"炫耀你的斩获"
		},
		OCEANFISHABLEFLOTSAM = "Ow! Got some mud.",		-- 物品名:"海洋残骸"
		CALIFORNIAROLL = "Wait! Fish inside! No!!!",		-- 物品名:"加州卷"
		SEAFOODGUMBO = "Fish looks miserable inside there...",		-- 物品名:"海鲜浓汤"
		SURFNTURF = "Dah! I won't take this! Never!",		-- 物品名:"海鲜大排档"
		GHOSTLYELIXIR_SLOWREGEN = "I wanna try to refine some of that potion.",		-- 物品名:"亡者补药" 制造描述:"时间会抚平所有伤口"
		GHOSTLYELIXIR_FASTREGEN = "I wanna try to refine some of that potion.",		-- 物品名:"灵魂万灵药" 制造描述:"治疗重伤的强力药剂"
		GHOSTLYELIXIR_SHIELD = "I wanna try to refine some of that potion.",		-- 物品名:"不屈药剂" 制造描述:"保护你的姐妹不受伤害"
		GHOSTLYELIXIR_ATTACK = "I wanna try to refine some of that potion.",		-- 物品名:"易怒药水" 制造描述:"重燃阿比盖尔的战斗精神"
		GHOSTLYELIXIR_SPEED = "I wanna try to refine some of that potion.,",		-- 物品名:"强健精油" 制造描述:"给你的灵魂来一剂强心针"
		GHOSTLYELIXIR_RETALIATION = "I wanna try to refine some of that potion.",		-- 物品名:"蒸馏复仇" 制造描述:"对敌人以牙还牙"
		SISTURN =
		{
			GENERIC = "What's in the box?",		-- 物品名:"姐妹骨灰罐"->默认 制造描述:"让你疲倦的灵魂休息的地方"
			SOME_FLOWERS = "She likes to put stuff here.",		-- 物品名:"姐妹骨灰罐" 制造描述:"让你疲倦的灵魂休息的地方"
			LOTS_OF_FLOWERS = "Wasn't it...",		-- 物品名:"姐妹骨灰罐" 制造描述:"让你疲倦的灵魂休息的地方"
		},
        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "Put food inside and new cuision will come out?",		-- 物品名:"便携烹饪锅"->默认 制造描述:"随时随地为美食家服务"
            DONE = "Wow wow wow!!!",		-- 物品名:"便携烹饪锅"->完成了 制造描述:"随时随地为美食家服务"
			COOKING_LONG = "This takes so long...",		-- 物品名:"便携烹饪锅"->饭还需要很久 制造描述:"随时随地为美食家服务"
			COOKING_SHORT = "Food food food!",		-- 物品名:"便携烹饪锅"->饭快做好了 制造描述:"随时随地为美食家服务"
			EMPTY = "Ha? Nothing inside.",		-- 物品名:"便携烹饪锅" 制造描述:"随时随地为美食家服务"
        },
        PORTABLEBLENDER_ITEM = "Shaky shacky.",		-- 物品名:"便携研磨器" 制造描述:"把原料研磨成粉状调味品"
        PORTABLESPICER_ITEM =
        {
            GENERIC = "Gives food extra flavor.",		-- 物品名:"便携香料站"->默认 制造描述:"调味让饭菜更可口"
            DONE = "All done!",		-- 物品名:"便携香料站"->完成了 制造描述:"调味让饭菜更可口"
        },
        SPICEPACK = "Food should be in there.",		-- 物品名:"厨师袋" 制造描述:"使你的食物保持新鲜"
        SPICE_GARLIC = "Get you a refreshing breath.",		-- 物品名:"蒜粉" 制造描述:"用口臭防守是最好的进攻"
        SPICE_SUGAR = "Yummy!",		-- 物品名:"蜂蜜水晶" 制造描述:"令人心平气和的甜美"
        SPICE_CHILI = "Spicy little thing.",		-- 物品名:"辣椒面" 制造描述:"刺激十足的粉末"
        SPICE_SALT = "This type of sand powder is delicious!",		-- 物品名:"调味盐" 制造描述:"为你的饭菜加点咸味"
        MONSTERTARTARE = "It won't work with simply a better name.",		-- 物品名:"怪物鞑靼"
        FRESHFRUITCREPES = "Delicate fruit pancake!",		-- 物品名:"鲜果可丽饼"
        FROGFISHBOWL = "Oh my gosh...",		-- 物品名:"蓝带鱼排"
        POTATOTORNADO = "Hee-hee! Rotating potatoes!",		-- 物品名:"花式回旋块茎"
        DRAGONCHILISALAD = "Hmm! Thank you Chief Cook!",		-- 物品名:"辣龙椒沙拉"
        GLOWBERRYMOUSSE = "Oh it's glowing!",		-- 物品名:"发光蓝莓慕斯"
        VOLTGOATJELLY = "Aw, it keeping twitching.",		-- 物品名:"闪电羊肉冻"
        NIGHTMAREPIE = "Hee-hee, it carries a funny face.",		-- 物品名:"恐怖国王饼"
        BONESOUP = "Not want it.",		-- 物品名:"骨头汤"
        MASHEDPOTATOES = "Soft potato mash.",		-- 物品名:"奶油土豆泥"
        POTATOSOUFFLE = "What? This is potato?",		-- 物品名:"蓬松土豆酥"
        MOQUECA = "Fish in there! No!",		-- 物品名:"海鲜杂烩"
        GAZPACHO = "Is it stickiness that I feel?",		-- 物品名:"芦笋冷汤"
        ASPARAGUSSOUP = "Hmmm.",		-- 物品名:"芦笋汤"
        VEGSTINGER = "Delicate spicy jam!",		-- 物品名:"辛辣鸡尾酒"
        BANANAPOP = "Fruit tastes better on an icy stick.",		-- 物品名:"香蕉冻"
        CEVICHE = "No! No! No!",		-- 物品名:"酸橘汁腌鱼"
        SALSA = "Spicy veggie medley.",		-- 物品名:"生鲜萨尔萨酱"
        PEPPERPOPPER = "Actually there's not a \"Pop\", just pepper...",		-- 物品名:"爆炒填馅辣椒"
        TURNIP = "Crispy snack!",		-- 物品名:"大萝卜"
        TURNIP_COOKED = "What an excellent roast?",		-- 物品名:"烤大萝卜"
        TURNIP_SEEDS = "Can offer more turnips.",		-- 物品名:"萝卜籽"
        GARLIC = "Gives a refreshing breath.",		-- 物品名:"大蒜"
        GARLIC_COOKED = "A snack that both stinks and spices.",		-- 物品名:"烤大蒜"
        GARLIC_SEEDS = "Can offer more garlics.",		-- 物品名:"蒜籽"
        ONION = "Hmmm! Ka-pong crispy!",		-- 物品名:"洋葱"
        ONION_COOKED = "What a pleasant smell!",		-- 物品名:"烤洋葱"
        ONION_SEEDS = "Onion baby!",		-- 物品名:"洋葱籽"
        POTATO = "Tasty veggie in the ground.",		-- 物品名:"土豆"
        POTATO_COOKED = "Hmmmm! Hot potato!",		-- 物品名:"烤土豆"
        POTATO_SEEDS = "Burried underground, creates more potatoes!",		-- 物品名:"土豆籽"
        TOMATO = "Big and juicy tomatoes!",		-- 物品名:"番茄"
        TOMATO_COOKED = "Kinda sticky.",		-- 物品名:"烤番茄"
        TOMATO_SEEDS = "Can offer more tomatoes!",		-- 物品名:"番茄跟籽"
        ASPARAGUS = "A snack stick.", 		-- 物品名:"芦笋"
        ASPARAGUS_COOKED = "Hot snack stick.",		-- 物品名:"烤芦笋"
        ASPARAGUS_SEEDS = "Can offer more snack sticks!",		-- 物品名:"芦笋种子"
        PEPPER = "Hot! My mouth is on fire!!",		-- 物品名:"辣椒"
        PEPPER_COOKED = "Why are you making spicy spicier!",		-- 物品名:"烤辣椒"
        PEPPER_SEEDS = "Can offer more pepper!",		-- 物品名:"辣椒籽"
        WEREITEM_BEAVER = "Its belly is excreting water...",		-- 物品名:"俗气海狸像" 制造描述:"唤醒海狸人的诅咒"
        WEREITEM_GOOSE = "Wanna play with a puppet.",		-- 物品名:"俗气鹅像" 制造描述:"唤醒鹅人的诅咒"
        WEREITEM_MOOSE = "Lady Wickerbuttom told me to shut mouth while chewing.",		-- 物品名:"俗气鹿像" 制造描述:"唤醒鹿人的诅咒"
        MERMHAT = "Can disguise us as merms.",		-- 物品名:"聪明的伪装" 制造描述:"鱼人化你的朋友"
        MERMTHRONE =
        {
            GENERIC = "Merm's royal carpet.",		-- 物品名:"皇家地毯"->默认
            BURNT = "Who did this?!",		-- 物品名:"皇家地毯"->烧焦的
        },        
        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "For many kings in fairy tales, life seems easy?",		-- 物品名:"皇家手工套装"->默认 制造描述:"建立一个新的鱼人王朝"
            BURNT = "No! No! No!",		-- 物品名:"皇家手工套装"->烧焦的 制造描述:"建立一个新的鱼人王朝"
        },        
        MERMHOUSE_CRAFTED = 
        {
            GENERIC = "I dream of having a house of my own...",		-- 物品名:"鱼人工艺屋"->默认 制造描述:"适合鱼人的家"
            BURNT = "Why?!",		-- 物品名:"鱼人工艺屋"->烧焦的 制造描述:"适合鱼人的家"
        },
        MERMWATCHTOWER_REGULAR = "Need royal guards to protect the king!",		-- 物品名:"鱼人工艺屋" 制造描述:"适合鱼人的家"
        MERMWATCHTOWER_NOKING = "The guards need a king in position.",		-- 物品名:"鱼人工艺屋" 制造描述:"适合鱼人的家"
        MERMKING = "Yeah! You look just like a king in fairy tale!",		-- 物品名:"鱼人之王"
        MERMGUARD = "Someday I will grow up and be as strong as them!",		-- 物品名:"忠诚鱼人守卫"
        MERM_PRINCE = "To be a king, gotta get fatter first.",		-- 物品名:"过程中的皇室"
        SQUID = "Stand still, squid!",		-- 物品名:"鱿鱼"
		GHOSTFLOWER = "Bit scary in some ways...",		-- 物品名:"哀悼荣耀"
        SMALLGHOST = "Phew! You can't scare me!",		-- 物品名:"小惊吓"
    },
    DESCRIBE_GENERIC = "Excuse me, what's that?",		--检查物品描述的缺省值
    DESCRIBE_TOODARK = "So dark...so dark...",		--天太黑
    DESCRIBE_SMOLDERING = "Something is simmering.",		--冒烟
    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "Dah! Who would wanna eat that?",		--吃孵化的高脚鸟蛋
		WINTERSFEASTFUEL = "Hmmm! So sweet!",		--暂无注释
    },
}
