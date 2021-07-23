local assets =
{
	Asset( "ANIM", "anim/white_bone.zip" ),
	Asset( "ANIM", "anim/white_bone_beautiful.zip" ),
	Asset( "ANIM", "anim/ghost_white_bone_build.zip" ),
}

local skins =
{
	normal_skin = "white_bone",
	ghost_skin = "ghost_white_bone_build",
}

local base_prefab = "white_bone"

local tags = {"BASE" ,"WHITE_BONE", "CHARACTER"}

return CreatePrefabSkin("white_bone_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	skin_tags = tags,
	
	build_name_override = "white_bone",
	rarity = "Character",
})