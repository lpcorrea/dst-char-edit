local assets =
{
	Asset( "ANIM", "anim/zoro.zip" ),
	Asset( "ANIM", "anim/ghost_zoro_build.zip" ),
}

local skins =
{
	normal_skin = "zoro",
	ghost_skin = "ghost_zoro_build",
}

local base_prefab = "zoro"

local tags = {"ZORO", "CHARACTER"}

return CreatePrefabSkin("zoro_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})