name = "Eng (ninjx)"
description = "xxx"
author = "ninjx"
version = "1.3"
forumthread = ""
api_version = 10
dont_starve_compatible = false --Not compatible with Singleplayer
reign_of_giants_compatible = false
dst_compatible = true
forge_compatible = true
gorge_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"

all_clients_require_mod = true
client_only_mod = false
server_filter_tags = {"engie", "character", "engineer", "tf2", "team fortress 2"}

configuration_options =
{

	{
        name = "buildinglimit",
        label = "Building Limits",
		hover = "Disable or Enable having all buildings be limited. Disable will allow you to have infinite amount of buildings. Enable will have it limited to the set # amount.",
        options = 
        {
            {description = "Enable", data = "y"},--(Default)
            {description = "Disable", data = "n"},
        }, 
        default = "n",
    },
	
	{
		name    = "toolbox_penalty",
		label   = "Building Haul Speed Debuff",
        hover	= "How fast you are when carrying all your buildings. Default is same as Marble Sculptures etc.",
		options =
		{
			{description = "5%", data = .05},
			{description = "10%", data = .1},
			{description = "15%(Default)", data = .15},
			{description = "25%", data = .25},
			{description = "30%", data = .3},
			{description = "40%", data = .4},
			{description = "50%", data = .5},
			{description = "60%", data = .6},
			{description = "70%", data = .7},
			{description = "80%", data = .8},
			{description = "90%", data = .9},
			{description = "100%", data = 1},
		},
		default = 1,
	},

	{
		name="Sentry_Difficulty",
		label="Sentry Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "15 Scrap, 1 Gear"},
			{data="default",description="Default",
			   hover = "20 Scrap, 3 Gears"},
			{data="hard",description="Hard",
			   hover = "30 Scrap, 5 Gears, 5 Cut Stone"},
		    {data="harder",description="Harder",
			   hover = "40 Scrap, 6 Gears, 5 Gold Nuggets (Alchemy Engine)"},
		},
		default="easy"
	},

	{
		name="Dispenser_Difficulty",
		label="Dispenser Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "10 Scrap, 1 Red Gem"},
			{data="default",description="Default",
			   hover = "15 Scrap, 3 Red Gems"},
			{data="hard",description="Hard",
			   hover = "25 Scrap, 5 Red Gems, 5 Electrical Doodads"},
		    {data="harder",description="Harder",
			   hover = "35 Scrap, 6 Red Gems, 5 Gears"},
		},
		default="easy"
	},

	{
		name="Teleporter_Difficulty",
		label="Teleporter Recipe Difficulty",
		hover = "Crafting recipe difficulty levels. For both the Entrance and Exit.",
		options = {
			{data="easy",description="Easy",
			   hover = "10 Scrap, 6 Nightmare Fuels (Alchemy Engine)"},
			{data="default",description="Default",
			   hover = "15 Scrap, 10 Nightmare Fuels"},
			{data="hard",description="Hard",
			   hover = "20 Scrap, 10 Nightmare Fuels, 5 Marble"},
		    {data="harder",description="Harder",
			   hover = "25 Scrap, 15 Nightmare Fuels, 1 Orange Gem"},
		},
		default="easy"
	},

	{
        name = "sentrylimit",
        label = "Sentry Limits",
		hover = "Disable or Enable having The Sentry have limited build amounts.",
        options = 
        {
            {description = "Enable", data = "y"},
            {description = "Disable", data = "n"},
        }, 
        default = "y",
    },

	{
		name="sentryamount",
		label="Sentry Limit Amount",
		hover = "The # of Sentries one can have built at a time.",
		options = {
		    {data=1,description="1"},
		    {data=2,description="2"},
			{data=3,description="3"},
			{data=4,description="4"},
		    {data=5,description="5"},
			{data=6,description="6"},
		    {data=7,description="7"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=10,description="10"},
			{data=11,description="11"},
		    {data=12,description="12"},
			{data=13,description="13"},
			{data=14,description="14"},
			{data=15,description="15"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=18,description="18"},
			{data=19,description="19"},
			{data=20,description="20"},
			{data=21,description="21"},
			{data=22,description="22"},
			{data=23,description="23"},
			{data=24,description="25"},
			{data=25,description="25"},
			{data=26,description="26"},
			{data=27,description="27"},
			{data=28,description="28"},
			{data=29,description="29"},
			{data=30,description="30"},
			{data=40,description="40"},
			{data=50,description="50"},
			{data=60,description="60"},
			{data=70,description="70"},
			{data=80,description="80"},
			{data=90,description="90"},
			{data=100,description="100"},
		},
		default=100,
	},

	{
		name="Sentry_Range",
		label="Sentry Range",
		hover = "The range a Sentry can find targets.",
		options = {
		    {data=1,description="1"},
		    {data=2,description="2"},
			{data=3,description="3"},
			{data=4,description="4"},
		    {data=5,description="5"},
			{data=6,description="6"},
		    {data=7,description="7"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=10,description="10"},
			{data=11,description="11"},
		    {data=12,description="12"},
			{data=13,description="13(Default)"},
			{data=14,description="14"},
			{data=15,description="15"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=18,description="18"},
			{data=19,description="19"},
			{data=20,description="20"},
			{data=21,description="21"},
			{data=22,description="22"},
			{data=23,description="23"},
			{data=24,description="25"},
			{data=25,description="25"},
			{data=26,description="26"},
			{data=27,description="27"},
			{data=28,description="28"},
			{data=29,description="29"},
			{data=30,description="30"},
			{data=50,description="50"},
		},
		default=20,
	},

	{
		name="Sentry_Damage",
		label="Sentry Damage",
		hover = "The damage output of the Sentry.",
		options = {
		    {data=1,description="1"}, 
		    {data=1.5,description="1.5"},
		    {data=2,description="2"},
		    {data=3,description="3"},
		    {data=3.5,description="3.5"},
		    {data=4,description="4"},
			{data=5,description="5"},
			{data=6,description="6"},
			{data=7,description="7"},
			{data=7.5,description="7.5"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=9.5,description="9.5(Default)"},
			{data=9.7,description="9.7"},
			{data=10,description="10"},
			{data=10.5,description="10.5"},
			{data=15,description="15"},
			{data=15.5,description="15.5"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=20,description="20"},
			{data=25,description="25"},
			{data=27.2,description="27.2"},
			{data=30,description="30"},
			{data=34,description="34"},
			{data=35,description="35"},
			{data=40,description="40"},
			{data=40.5,description="40.5"},
			{data=45,description="45"},
			{data=50,description="50"},
			{data=50.5,description="50.5"},
			{data=60,description="60"},
			{data=65,description="65"},
			{data=70,description="70"},
			{data=75,description="75"},
			{data=80,description="80"},
			{data=85,description="85"},
			{data=90,description="90"},
			{data=95,description="95"},
			{data=100,description="100"},
			{data=105,description="105"},
			{data=110,description="110"},
			{data=115,description="115"},
			{data=120,description="120"},
			{data=125,description="125"},
			{data=150,description="150"},
			{data=200,description="200"},
			{data=250,description="250"},
			{data=300,description="300"},
		},
		default=15,
	},

	{
		name="Sentry_ROF",
		label="Sentry Rate of Fire",
		hover = "The rate at which the sentry fires bullets, in seconds.",
		options = {
			{data=0,description="Instant(0)"},
			{data=1,description="Default(1)"},
			{data=2,description="Medium(2)"},
			{data=3,description="Slow(3)"},
			{data=4,description="Slower(4)"},
			{data=5,description="Slowest(5)"},
		},
		default=1,
	},

	{
		name="Sentry_Health",
		label="Sentry Health",
		hover = "The amount of health a sentry has. Multiplies with each level. (x2, x3)",
		options = {
		    {data=10,description="10"},
		    {data=15,description="15"},
		    {data=20,description="20"},
		    {data=50,description="50"},
		    {data=100,description="100"},
		    {data=110,description="110"},
		    {data=120,description="120"},
			{data=130,description="130"},
			{data=140,description="140"},
			{data=150,description="150(TF2)"},
			{data=170,description="170"},
			{data=180,description="180"},
			{data=190,description="190"},
			{data=200,description="200(Default)"},
			{data=210,description="210"},
			{data=225,description="225"},
			{data=230,description="230"},
			{data=250,description="250"},
			{data=260,description="260"},
			{data=285,description="285"},
			{data=300,description="300"},
			{data=330,description="330"},
			{data=350,description="350"},
			{data=400,description="400"},
			{data=450,description="450"},
			{data=500,description="500"},
			{data=550,description="550"},
			{data=600,description="600"},
			{data=700,description="700"},
			{data=800,description="800"},
			{data=900,description="900"},
			{data=1000,description="1000"},
		},
		default=300,
	},

	{
        name = "sentryh_regen",
        label = "Sentry Health Regen?",
		hover = "Allow Sentries to have health regen?",
        options = 
        {
            {description = "Yes", data = "y"},
            {description = "No(Default)", data = "n"},
        }, 
        default = "n",
    },

	{
        name = "rocketsplashdmg",
        label = "Sentry Rocket Splash Damage?",
		hover = "Disable or Enable the Sentry's rockets causing splash damage.",
        options = 
        {
            {description = "Yes(Default)", data = "y"},
            {description = "No", data = "n"},
        }, 
        default = "y",
    },
	{
        name = "sentry_ff",
        label = "Sentry Friendly Fire",
		hover = "Disable or Enable The Sentry dealing friendly fire to players.",
        options = 
        {
            {description = "Enable(Default)", data = "yesff"},
            {description = "Disable", data = "noff"},
        }, 
        default = "noff",
    },
	--Dispenser
	{
        name = "dispenserlimit",
        label = "Dispenser Limits",
		hover = "Disable or Enable having The Dispenser have limited build amounts.",
        options = 
        {
            {description = "Enable", data = "y"},
            {description = "Disable", data = "n"},
        }, 
        default = "y",
    },	

	{
		name="dispenseramount",
		label="Dispenser Limit Amount",
		hover = "The # of Dispensers one can have built at a time.",
		options = {
		    {data=1,description="1"},
		    {data=2,description="2"},
			{data=3,description="3"},
			{data=4,description="4"},
		    {data=5,description="5"},
			{data=6,description="6"},
		    {data=7,description="7"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=10,description="10"},
			{data=11,description="11"},
		    {data=12,description="12"},
			{data=13,description="13"},
			{data=14,description="14"},
			{data=15,description="15"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=18,description="18"},
			{data=19,description="19"},
			{data=20,description="20"},
			{data=21,description="21"},
			{data=22,description="22"},
			{data=23,description="23"},
			{data=24,description="25"},
			{data=25,description="25"},
			{data=26,description="26"},
			{data=27,description="27"},
			{data=28,description="28"},
			{data=29,description="29"},
			{data=30,description="30"},
			{data=40,description="40"},
			{data=50,description="50"},
			{data=60,description="60"},
			{data=70,description="70"},
			{data=80,description="80"},
			{data=90,description="90"},
			{data=100,description="100"},
		},
		default=100,
	},

	{
		name="disprange",
		label="Dispenser Range",
		hover = "The range a Dispenser needs to be in with the player to heal them.",
		options = {
		    {data=1,description="1"}, 
			{data=1.2,description="1.2"},
		    {data=1.5,description="1.5"},
			{data=1.8,description="1.8"},
		    {data=2,description="2"},
			{data=2.2,description="2.2"},
			{data=2.5,description="2.5"},
			{data=2.7,description="2.7"},
			{data=2.9,description="2.9"},
		    {data=3,description="3(Default)"},
			{data=3.2,description="3.2"},
			{data=3.5,description="3.5"},
			{data=3.7,description="3.7"},
			{data=4,description="4"},
			{data=4.2,description="4.2"},
			{data=4.5,description="4.5"},
			{data=4.7,description="4.7"},
			{data=5,description="5"},
		},
		default=5,
	},

	{
		name="dispenserhealingrate",
		label="Dispenser Healing Rate",
		hover = "How quickly, in seconds, a Dispenser takes to heal. Increases with each level. The higher, the slower.",
		options = {
		    {data=1,description="1"},
		    {data=2,description="2"},
		    {data=3,description="3"},
			{data=4,description="4"},
			{data=5,description="5"},
			{data=5,description="5"},
			{data=6,description="6"},
			{data=7,description="7"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=10,description="10"},
			{data=11,description="11"},
			{data=12,description="12"},
			{data=13,description="13"},
			{data=14,description="14"},
			{data=15,description="15"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=18,description="18"},
			{data=19,description="19"},
			{data=20,description="20"},
			{data=30,description="30"},
			{data=40,description="40"},
			{data=50,description="50"},
			{data=100,description="100"},
		},
		default=2,
	},
	--Teles
	{
        name = "teleporterlimit",
        label = "Teleporter Limits",
		hover = "Disable or Enable having The Teleporter Entrance and Exit having limited build amounts.",
        options = 
        {
            {description = "Enable", data = "y"},
            {description = "Disable", data = "n"},
        }, 
        default = "y",
    },	

	{
		name="teleporteramount",
		label="Teleporter Limit Amount",
		hover = "The # of Teleporter Exits and Entrances one can have built at a time.",
		options = {
		    {data=1,description="1"},
		    {data=2,description="2"},
			{data=3,description="3"},
			{data=4,description="4"},
		    {data=5,description="5"},
			{data=6,description="6"},
		    {data=7,description="7"},
			{data=8,description="8"},
			{data=9,description="9"},
			{data=10,description="10"},
			{data=11,description="11"},
		    {data=12,description="12"},
			{data=13,description="13"},
			{data=14,description="14"},
			{data=15,description="15"},
			{data=16,description="16"},
			{data=17,description="17"},
			{data=18,description="18"},
			{data=19,description="19"},
			{data=20,description="20"},
			{data=21,description="21"},
			{data=22,description="22"},
			{data=23,description="23"},
			{data=24,description="25"},
			{data=25,description="25"},
			{data=26,description="26"},
			{data=27,description="27"},
			{data=28,description="28"},
			{data=29,description="29"},
			{data=30,description="30"},
			{data=40,description="40"},
			{data=50,description="50"},
			{data=60,description="60"},
			{data=70,description="70"},
			{data=80,description="80"},
			{data=90,description="90"},
			{data=100,description="100"},
			{data=150,description="100"},
			{data=200,description="100"},
		},
		default=200,
	},
	{
		name    = "eteleport_penalty",
		label   = "Teleport Sanity Penalty",
        hover	= "How much a non-Engineer loses sanity upon using the Teleporter.",
		options =
		{
		    {description = "0", data = 0},
			{description = "-1", data = 1},
			{description = "-5", data = 5},
			{description = "-10", data = 10},
			{description = "-15", data = 15},
			{description = "-20", data = 20},
			{description = "-25", data = 25},
			{description = "-30", data = 30},
			{description = "-35", data = 35},
			{description = "-40", data = 40},
			{description = "-45", data = 45},
			{description = "-50", data = 50},
			{description = "-60", data = 60},
			{description = "-90", data = 90},
			{description = "-100", data = 100},
		},
		default = 0,
	},

	{
		name = "tf2wrenchdmg",
		label = "Wrench Base Damage",
		options =
		{
		    {description = "4.25", data = 4.25},
			{description = "8", data = 8},
			{description = "10", data = 10},
			{description = "13.6", data = 13.6},
			{description = "15", data = 15},
			{description = "17(Default)", data = 17},
			{description = "20", data = 20},
			{description = "25", data = 25},
			{description = "27.2", data = 27.2},
			{description = "29", data = 29},
			{description = "30", data = 30},
			{description = "30.6", data = 30.6},
			{description = "34", data = 34},
			{description = "37", data = 37},
			{description = "40", data = 40},
			{description = "50", data = 50},
		},
		default = 50,
	},

	{
		name = "tf2wrenchuses",
		label = "Wrench Uses",
		options =
		{
		    {description = "10", data = 10},
		    {description = "15", data = 15},
			{description = "50", data = 50},
			{description = "75", data = 75},
			{description = "100", data = 100},
			{description = "150(Default)", data = 150},
			{description = "175", data = 175},
			{description = "200", data = 200},
			{description = "250", data = 250},
			{description = "260", data = 260},
			{description = "270", data = 270},
			{description = "300", data = 300},
			{description = "375", data = 375},
			{description = "400", data = 400},
			{description = "700000", data = 700000},
		},
		default = 700000,
	},

	{
		name="tf2Wrench_Difficulty",
		label="Wrench Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "5 Scrap, 2 Twigs"},
			{data="default",description="Default",
			   hover = "5 Scrap, 2 Twigs, 1 Gold Nugget"},
			{data="hard",description="Hard",
			   hover = "10 Scrap, 5 Twigs, 3 Gold Nuggets"},
		    {data="harder",description="Harder",
			   hover = "12 Scrap, 5 Twigs, 1 Gear"},
		},
		default="easy"
	},

	{
		name="Scrap_Difficulty",
		label="Scrap Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easier",description="Easiest",
			   hover = "1 Flint (Gain 6)"},
			{data="easy",description="Easier",
			   hover = "1 Flint, 1 Twig"},
			{data="default",description="Default",
			   hover = "2 Flint, 2 Twigs"},
			{data="hard",description="Hard",
			   hover = "3 Flint, 3 Twigs, 1 Gold Nugget"},
		    {data="harder",description="Harder",
			   hover = "4 Flint, 4 Twigs, 1 Electrical Doodad"},
		},
		default="easier"
	},
	
	{
		name = "hardhatabsorb",
		label = "Hard Hat Damage Absorption",
		options =
		{
			{description = "5%", data = .05},
			{description = "10%", data = .1},
			{description = "15%", data = .15},
			{description = "20%", data = .2},
			{description = "30%", data = .3},
			{description = "40%", data = .4},
			{description = "50%", data = .5},
			{description = "55%", data = .55},
			{description = "60%", data = .6},
			{description = "65%", data = .65},
			{description = "70%(Default)", data = .7},
			{description = "75%", data = .75},
			{description = "80%(Football)", data = .8},
			{description = "85%", data = .85},
			{description = "90%", data = .9},
			{description = "95%", data = .95},
		},
		default = .9,
	},

	{
		name = "ehardhatdura",
		label = "Hard Hat Durability",
		options =
		{
		    {description = "100", data = 100},
			{description = "110", data = 110},
		    {description = "120", data = 120},
		    {description = "125", data = 125},
		    {description = "130", data = 130},
		    {description = "140", data = 140},
		    {description = "150", data = 150},
		    {description = "160", data = 160},
		    {description = "170", data = 170},
		    {description = "180", data = 180},
		    {description = "190", data = 190},
		    {description = "200", data = 200},
		    {description = "210", data = 210},
		    {description = "220", data = 220},
		    {description = "230", data = 230},
		    {description = "240", data = 240},
		    {description = "250", data = 250},
			{description = "255", data = 255},
			{description = "260", data = 260},
			{description = "265", data = 265},
			{description = "270", data = 270},
			{description = "275", data = 275},
			{description = "280", data = 280},
			{description = "285", data = 285},
			{description = "290", data = 290},
			{description = "295(Default)", data = 295},
			{description = "300", data = 300},
			{description = "305", data = 305},
			{description = "310", data = 310},
			{description = "315(Football)", data = 315},
			{description = "320", data = 320},
			{description = "325", data = 325},
			{description = "330", data = 330},
			{description = "340", data = 340},
			{description = "350", data = 350},
			{description = "360", data = 360},
			{description = "370", data = 370},
			{description = "380", data = 380},
			{description = "390", data = 390},
			{description = "395", data = 395},
			{description = "400", data = 400},
			{description = "410", data = 410},
			{description = "420", data = 420},
			{description = "425", data = 425},
			{description = "430", data = 430},
			{description = "440", data = 440},
			{description = "450", data = 450},
			{description = "460", data = 460},
			{description = "470", data = 470},
			{description = "480", data = 480},
			{description = "490", data = 490},
			{description = "500", data = 500},
			{description = "530", data = 530},
			{description = "70000000", data = 70000000},
		},
		default = 70000000,
	},

	{
		name="EHat_Difficulty",
		label="Hard Hat Recipe Difficulty",
		hover = "Crafting recipe difficulty levels.",
		options = {
			{data="easy",description="Easy",
			   hover = "2 Scrap, 1 Gold Nugget"},
			{data="default",description="Default",
			   hover = "4 Scrap, 2 Gold Nuggets"},
			{data="hard",description="Hard",
			   hover = "6 Scrap, 2 Gold Nuggets"},
		    {data="harder",description="Harder",
			   hover = "8 Scrap, 3 Gold Nuggets, 1 Straw Hat"},
		},
		default="easy"
	},

	{
		name="Building_SD",
		label="Building Sanity Loss",
		hover = "The amount of sanity lost when Engie has one of his buildings destroyed.",
		options = {
		    {data=0,description="0"},
		    {data=3,description="3"},
		    {data=5,description="5"},
		    {data=10,description="10"},
		    {data=15,description="15"},
			{data=20,description="20"},
			{data=25,description="25"},
			{data=30,description="30"},
			{data=33,description="33(Default)"},
			{data=35,description="35"},
			{data=40,description="40"},
			{data=45,description="45"},
			{data=50,description="50"},
			{data=55,description="55"},
			{data=60,description="60"},
			{data=70,description="70"},
			{data=80,description="80"},
			{data=90,description="90"},
			{data=100,description="100"},
			{data=150,description="150"},
			{data=200,description="200"},
		},
		default=0,
	},

	{
		name="engiesciencebonus",
		label="Engineer's Science Bonus",
		hover = "Allow Engineer to have a science bonus by default? (Like Wickerbottom)",
		options = {
			{data=0,description="No"},
			{data=1,description="Yes"},
		},
		default = 1,
	},

	{
		name="engiedmgdebuff",
		label="Engineer's Damage Debuff",
		hover = "How much base damage an Engineer does less compared to a basic Wilson.",
		options = {
			{data=0.50,description="50% Less"}, 
		    {data=0.60,description="40% Less"}, 
			{data=0.65,description="35% Less"},
		    {data=0.70,description="30% Less"},
			{data=0.75,description="25% Less"},
		    {data=0.80,description="20% Less"},
			{data=0.85,description="15% Less"},
			{data=0.90,description="10% Less"},
			{data=0.95,description="5% Less"},
			{data=1,description="No Debuff"},
		},
		default=1,
	},

}