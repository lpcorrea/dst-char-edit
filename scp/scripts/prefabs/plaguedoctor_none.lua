--local assets =
--{
--	Asset( "ANIM", "anim/plaguedoctor.zip" ),
--	Asset( "ANIM", "anim/ghost_plaguedoctor_build.zip" ),
--}
--local skins =
--{
--	normal_skin = "plaguedoctor",
--	ghost_skin = "ghost_plaguedoctor_build",
--}
--local base_prefab = "plaguedoctor"
--local tags = {"PLAGUEDOCTOR", "CHARACTER"}
--return CreatePrefabSkin("plaguedoctor_none",
--{
--	base_prefab = base_prefab, 
--	skins = skins, 
--	assets = assets,
--	tags = tags,
--	
--	skip_item_gen = true,
--	skip_giftable_gen = true,
--})

local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("plaguedoctor_none", --This skin is the regular default skin we have, You should already have this
{
	base_prefab = "plaguedoctor", --What Prefab are we skinning? The character of course!
	build_name_override = "plaguedoctor",
	type = "base", --Hornet: Make sure you have this here! You should have it but ive seen some character mods with out
	rarity = "Character",
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "plaguedoctor", },
	skins = {
		normal_skin = "plaguedoctor",
		ghost_skin = "ghost_plaguedoctor_build",
	},
	assets = {
	    Asset( "ANIM", "anim/plaguedoctor.zip" ),
	    Asset( "ANIM", "anim/ghost_plaguedoctor_build.zip" ),
	},

}))

table.insert(prefabs, CreatePrefabSkin("plaguedoctor_survivor",
{
	base_prefab = "plaguedoctor",
	build_name_override = "plaguedoctor_survivor", --The build name of your new skin,
	type = "base",
	rarity = "Elegant", --I did the Elegant Rarity, but you can do whatever rarity you want!
	rarity_modifier = "Woven", --Ive put the rarity_modifier to Woven, Doesnt make a difference other than say youve woven the skin
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "plaguedoctor", "SURVIVOR"}, --Notice in this skin_tags table I have "VICTORIAN", This tag actually makes the little gorge icon show up on the skin! Other tags will do the same thing such as forge, yotc, yotp, yotv, yog and so on!
	skins = {
		normal_skin = "plaguedoctor_survivor", --Rename your "normal_skin" accordingly
		ghost_skin = "ghost_plaguedoctor_build", --And if you did a ghost skin, rename that too!
	},

	assets = {
		Asset( "ANIM", "anim/plaguedoctor_survivor.zip" ),
		Asset( "ANIM", "anim/ghost_plaguedoctor_build.zip" ),
	},
}))

table.insert(prefabs, CreatePrefabSkin("plaguedoctor_old",
{
	base_prefab = "plaguedoctor",
	build_name_override = "plaguedoctor_old", --The build name of your new skin,
	type = "base",
	rarity = "Elegant", --I did the Elegant Rarity, but you can do whatever rarity you want!
	rarity_modifier = "Woven", --Ive put the rarity_modifier to Woven, Doesnt make a difference other than say youve woven the skin
	skip_item_gen = true,
	skip_giftable_gen = true,
	skin_tags = { "BASE", "plaguedoctor"}, --Notice in this skin_tags table I have "VICTORIAN", This tag actually makes the little gorge icon show up on the skin! Other tags will do the same thing such as forge, yotc, yotp, yotv, yog and so on!
	skins = {
		normal_skin = "plaguedoctor_old", --Rename your "normal_skin" accordingly
		ghost_skin = "ghost_plaguedoctor_build", --And if you did a ghost skin, rename that too!
	},

	assets = {
		Asset( "ANIM", "anim/plaguedoctor_old.zip" ),
		Asset( "ANIM", "anim/ghost_plaguedoctor_build.zip" ),
	},

}))

--If youd like to make more skins, simply copy the CreatePrefabSkin function and accordingly make new skins you want!

return unpack(prefabs)