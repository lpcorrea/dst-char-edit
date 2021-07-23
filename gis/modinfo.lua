
name = "gis" 
description = "n12i4i214nio124onio2i1n4oin124o" 
author = "apenas o mito hahahahahahhhhhhhaaaa" 
version = "1.5"

forumthread = ""

api_version = 6  
api_version_dst = 10 

dst_compatible = true 

dont_starve_compatible = false
reign_of_giants_compatible = false 
shipwrecked_compatible = false  

all_clients_require_mod = true
-- client_only_mod = true

icon_atlas = "modicon.xml" 
icon = "modicon.tex"

priority = -1000000000
server_filter_tags = {  "character", }

configuration_options =
{
    {
        name = 'Skillbadge',
        label = 'Skill badge',
        hover = 'Show skill badge/显示角色技能按钮',
        options = 
        {
            {description = 'On', data = true},
            {description = 'Off', data = false},
        },
        default = true
    },
}


StaticAssetsReg = {'monkey_king', 'myth_skins_prefab'}