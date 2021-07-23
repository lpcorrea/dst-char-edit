local assets =
{
	Asset( "ANIM", "anim/neza.zip" ),
	Asset( "ANIM", "anim/ghost_neza_build.zip" ),
}

local skins =
{
	normal_skin = "neza",
	ghost_skin = "ghost_neza_build",
}

local base_prefab = "neza"

local tags = {"BASE", "NEZA", "CHARACTER"}

return CreatePrefabSkin("neza_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	skin_tags = tags,

	build_name_override = "neza",
	rarity = "Character",
})