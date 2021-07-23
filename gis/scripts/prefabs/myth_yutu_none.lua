local assets =
{
	Asset( "ANIM", "anim/myth_yutu.zip" ),
	Asset( "ANIM", "anim/ghost_myth_yutu_build.zip" ),
}

local skins =
{
	normal_skin = "myth_yutu",
	ghost_skin = "ghost_myth_yutu_build",
}

local base_prefab = "myth_yutu"

local tags = {"YUTU", "CHARACTER"}

return CreatePrefabSkin("myth_yutu_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	build_name_override = "myth_yutu",
	rarity = "Character",
})