
name = "gis" 
description = "Characters here!\n人物都在这儿!" 
author = "羽中, 幼儿园小班花, lw老王，老司饥, 杨柳, ti_Tout, 逸尘, 八戒Godfrey, 小明" 
version = "6.7.23" --更新日期

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

priority = -1000000000 --后加载
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

--兼容动态加载mod
StaticAssetsReg = {'monkey_king', 'myth_skins_prefab'}