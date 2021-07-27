-- This information tells other players more about the mod
name = "SCP-049 (ninjx)"
description = "alou"
author = "ninjx"
version = "1.0" -- This is the version of the template. Change it to your own number.

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""


-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = false

-- Character mods need this set to true
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"SCP",
}

configuration_options = {
	{
		name="scphungerrate",
		label="Hunger rate",
		hover = "SCP-049 has a reduced hunger rate to compensate for his slow speed and preoccupation with the Pestilence.",
		options = {
		    {data=0.8,description="80% (Default)"},
		    {data=0.9,description="90%"},
		    {data=1.0,description="100% (Unchanged)"}, 
		},
		default=0.8,
	},
	{
		name="scppestilencerate",
		label="Cure Meter drain rate",
		hover = "SCP-049's Cure Meter will drain a certain amount per day. Reaching 0 will deactivate his lethal touch. Refill the meter by curing pigmen and bunnymen.",
		options = {
		    {data=-0,description="Neutralized (0/day)"},
		    {data=-0.3125,description="Safe (12/day)"},
		    {data=-0.375,description="Euclid (15/day)"},
		    {data=-0.45,description="Keter (18/day)"}, 
		},
		default=-0,
	},
	{
		name="scponeshot",
		label="Can players be one-shot by 049?",
		hover = "If this config is set to 'No', players are put on the lethal touch's blacklist, making them immune.",
		options = {
		    {data=1,description="No"},
		    {data=0,description="Yes (Default)"},
		},
		default=1,
	},
}