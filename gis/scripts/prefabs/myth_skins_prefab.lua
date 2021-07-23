local assets = {}
for _,v in ipairs{
	"monkey_king_sea", "monkey_king_fire", "monkey_king_horse", "monkey_king_opera","monkey_king_ear",
	"neza_green", "neza_fire",
	"white_bone_white", "white_bone_opera",
	"pigsy_marry", 
	"yangjian_black", "yangjian_dao", "yangjian_gold",
	"myth_yutu_frog", "myth_yutu_winter",
}do
	table.insert(assets, Asset("ATLAS", "bigportraits/"..v..".xml"))
end

local Skin = Mythwords_AddSkin
--(prefab, skin, skins, tags)

local MK_TAG = {"BASE","MONKEY_KING", "CHARACTER"}
local NZ_TAG = {"BASE","NEZA", "CHARACTER"}
local WB_TAG = {"BASE","WHITE_BONE", "CHARACTER"}
local PG_TAG = {"BASE", "PIGSY", "CHARACTER"}
local YJ_TAG = {"BASE", "YANGJIAN", "CHARACTER"}
local YT_TAG = {"BASE", "MYTH_YUTU", "CHARACTER"}
return 
	Skin('monkey_king', 'none', {normal_skin = 'monkey_king', ghost_skin = 'ghost_monkey_king_build'}, MK_TAG),
	Skin('monkey_king', 'sea', {normal_skin = 'monkey_king_sea', ghost_skin = 'ghost_monkey_king_build'}, MK_TAG),
	Skin('monkey_king', 'horse', {normal_skin = 'monkey_king_horse', ghost_skin = 'ghost_monkey_king_build'}, MK_TAG),
	Skin('monkey_king', 'fire', {normal_skin = 'monkey_king_fire', ghost_skin = 'ghost_monkey_king_build'}, MK_TAG),
	Skin('monkey_king', 'opera', {normal_skin = 'monkey_king_opera', ghost_skin = 'ghost_monkey_king_build'}, MK_TAG),
	Skin('monkey_king', 'ear', {normal_skin = 'monkey_king_ear', ghost_skin = 'ghost_monkey_king_build'}, MK_TAG),
	
	Skin('neza', 'none', {normal_skin = 'neza', ghost_skin = 'ghost_neza_build'}, NZ_TAG),
	Skin('neza', 'green', {normal_skin = 'neza_green', ghost_skin = 'ghost_neza_build'}, NZ_TAG),
	Skin('neza', 'fire', {normal_skin = 'neza_fire', ghost_skin = 'ghost_neza_build'}, NZ_TAG),

	Skin('white_bone', 'none', {normal_skin = 'white_bone', ghost_skin = 'ghost_white_bone_build'}, WB_TAG),
	Skin('white_bone', 'white', {normal_skin = 'white_bone_white', ghost_skin = 'ghost_white_bone_build'}, WB_TAG),
	Skin('white_bone', 'opera', {normal_skin = 'white_bone_opera', ghost_skin = 'ghost_white_bone_build'}, WB_TAG),

	Skin('pigsy', 'none', {normal_skin = "pigsy", ghost_skin = 'ghost_pigsy_build'}, PG_TAG),
	Skin('pigsy', 'marry', {normal_skin = 'pigsy_marry', ghost_skin = 'ghost_pigsy_build'}, PG_TAG),

	Skin('yangjian', 'none', {normal_skin = "yangjian", ghost_skin = "ghost_yangjian_build"}, YJ_TAG),
	Skin('yangjian', 'black', {normal_skin = 'yangjian_black', ghost_skin = "ghost_yangjian_build"}, YJ_TAG),
	Skin('yangjian', 'dao', {normal_skin = 'yangjian_dao', ghost_skin = "ghost_yangjian_build"}, YJ_TAG),
	Skin('yangjian', 'gold', {normal_skin = 'yangjian_gold', ghost_skin = 'ghost_yangjian_build'}, YJ_TAG),

	Skin('myth_yutu', 'none', {normal_skin = "myth_yutu", ghost_skin = "ghost_myth_yutu_build"}, YT_TAG),
	Skin('myth_yutu', 'frog', {normal_skin = "myth_yutu_frog", ghost_skin = "ghost_myth_yutu_build"}, YT_TAG),
	Skin('myth_yutu', 'winter', {normal_skin = "myth_yutu_winter", ghost_skin = "ghost_myth_yutu_build"}, YT_TAG),

	Prefab('myth_skins_prefab', function() return CreateEntity() end, assets)