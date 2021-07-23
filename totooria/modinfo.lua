name = " [ggggggggggg.]托托莉Totooria"
description =
[[V2.4.1
Totooria Helmold, Alchemist of Arland
High sanity, low health, low damage
Can level up by doing anything.
Eating Mandrake will reset skill points with penalty.
Able to read, able to make multiple items.
Starts the game with Totooria's Wand (upgradable).
Upgraded Totooria's Wand will have more functions.
]]
author = "柴柴"
version = "2.4.3"

forumthread = ""

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true


icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {
	"character",
}

configuration_options =
{
    {
        name = "Language",
        label = "Language",
        options =   {
                        {description = "English", data = false},
                        {description = "Chinese", data = true},
                    },
        default = false,
    },

    {
        name = "GameMode",
        label = "GameMode",
        options =   {
                        {description = "Balance", data = true, hover = ""},
                        {description = "Easy", data = false, hover = ""},
                    },
        default = true,
    },

    {
        name = "Sound",
        label = "Totooria Sound",
        options =   {
                        {description = "Wendy", data = false},
                        {description = "Willow", data = true},
                    },
        default = true,
    },
	
	{
        name = "TotooriaSpeech",
        label = "Totooria Speech",
        options =   {
                        {description = "Wilson", data = 1},
                        {description = "Willow", data = 2},
						{description = "Wigfrid", data = 3},
						{description = "Wickerbottom", data = 4},
                    },
        default = 1,
    },
	
	{
        name = "Dig",
        label = "Use the staff as a shovel",
        options =   {
                        {description = "Yes", data = true},
                        {description = "No", data = false},
                    },
        default = false,
    },
	
	{
        name = "Hammer",
        label = "Use the staff as a hammer",
        options =   {
                        {description = "Yes", data = true},
                        {description = "No", data = false},
                    },
        default = false,
    },

    {
        name = "UIHeight",
        label = "UI Height",
        options =   {
                        {description = "Default", data = 80},
                        {description = "High", data = 120},
                        {description = "Super High", data = 160},
                    },
        default = 80,
    },

    {
        name = "UIScale",
        label = "UI Scale",
        options =   {
                        {description = "Default", data = .75},
                        {description = "Large", data = 1},
                        {description = "Small", data = .5},
                    },
        default = .75,
    },

    {
        name = "TotooriaAnim",
        label = "Totooria Anim",
        options =   {
                        {description = "New Ver.", data = "totooria"},
                        {description = "Old Ver.", data = "totooriaold"},
                    },
        default = "totooria",
    },
 }

