PrefabFiles = {
	"scrap",
	"engineer",
	"engineer_skins",
	"esentry",
	"dispenser",
	"eteleporter",
	"eteleporter_exit",
	"tf2wrench",
	"gibus",
	"ehardhat",
	"esentry_bullet",
	"esentry_rocket",
}

Assets = {
    Asset( "IMAGE", "bigportraits/engineer.tex" ),
    Asset( "ATLAS", "bigportraits/engineer.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_none.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_none.xml" ),
	--Skins
	Asset( "IMAGE", "bigportraits/engineer_blu.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_blu.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_formal.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_formal.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_survivor.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_survivor.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_shadow.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_shadow.xml" ),
	Asset( "IMAGE", "bigportraits/engineer_rose.tex" ),
    Asset( "ATLAS", "bigportraits/engineer_rose.xml" ),
	--
    Asset( "IMAGE", "images/avatars/avatar_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_engineer.xml" ),
    Asset( "IMAGE", "images/avatars/avatar_ghost_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_engineer.xml" ),
    Asset( "IMAGE", "images/avatars/self_inspect_engineer.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_engineer.xml" ),
	
    Asset( "IMAGE", "images/names_engineer.tex" ),
    Asset( "ATLAS", "images/names_engineer.xml" ),
	Asset( "IMAGE", "images/names_gold_engineer.tex" ),
    Asset( "ATLAS", "images/names_gold_engineer.xml" ),

    Asset("ATLAS", "images/inventoryimages/esentry.xml"),
    Asset("IMAGE", "images/inventoryimages/esentry.tex"),
	Asset("ATLAS", "images/inventoryimages/esentry_item.xml"),
    Asset("IMAGE", "images/inventoryimages/esentry_item.tex"),
    Asset("ATLAS", "images/inventoryimages/dispenser.xml"),
    Asset("IMAGE", "images/inventoryimages/dispenser.tex"),
    Asset("ATLAS", "images/inventoryimages/eteleporter.xml"),
    Asset("IMAGE", "images/inventoryimages/eteleporter.tex"),
	Asset("ATLAS", "images/inventoryimages/buildinglocked.xml"),
    Asset("IMAGE", "images/inventoryimages/buildinglocked.tex"),
	
	Asset("IMAGE", "images/minimap/esentry.tex"),
    Asset("ATLAS", "images/minimap/esentry.xml"),
    Asset("IMAGE", "images/minimap/dispenser.tex"),
    Asset("ATLAS", "images/minimap/dispenser.xml"),
    Asset("IMAGE", "images/minimap/eteleporter.tex"),
    Asset("ATLAS", "images/minimap/eteleporter.xml"),
	Asset( "IMAGE", "images/minimap/engineer.tex" ),
    Asset( "ATLAS", "images/minimap/engineer.xml" ),

    Asset("ATLAS", "images/hud/engietab.xml" ),
    Asset("ATLAS", "images/hud/engietab.xml" ),
    Asset("IMAGE", "images/hud/engietab.tex"),

	Asset( "ANIM", "anim/emote_rancho.zip" ),
	Asset( "ANIM", "anim/player_idles_engineer.zip" ),
}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local _G = GLOBAL
local PREFAB_SKINS = _G.PREFAB_SKINS
local PREFAB_SKINS_IDS = _G.PREFAB_SKINS_IDS
local SKIN_AFFINITY_INFO = GLOBAL.require("skin_affinity_info")
GLOBAL.PREFAB_SKINS["engineer"] = {"engineer_none"}
GLOBAL.PREFAB_SKINS_IDS["engineer"] = {["engineer_none"] = 1}

TUNING.ENGIE_DISPENSERMAX = GetModConfigData("dispenseramount")
TUNING.ENGIE_TELEPORTERMAX = GetModConfigData("teleporteramount")
TUNING.ENGIE_SENTRYMAX = GetModConfigData("sentryamount")

TUNING.ENGIE_DMGDEBUFF = GetModConfigData("engiedmgdebuff")
TUNING.ENGIE_SCIENCEBONUS = GetModConfigData("engiesciencebonus")
TUNING.ENGIE_BUILDINGLOSS = GetModConfigData("Building_SD")
TUNING.TOOLBOX_SPEED_MULT = GetModConfigData("toolbox_penalty")
TUNING.TF2WRENCH_DAMAGE = GetModConfigData("tf2wrenchdmg")
TUNING.TF2WRENCH_USES = GetModConfigData("tf2wrenchuses")
TUNING.ARMOR_HARDHAT_ABSORPTION = GetModConfigData("hardhatabsorb")
TUNING.ARMOR_EHARDHAT = GetModConfigData("ehardhatdura")

TUNING.DISP_RANGE = GetModConfigData("disprange")
TUNING.DISP_HEALING = GetModConfigData("dispenserhealingrate")

GLOBAL.SENTRY_RANGE = GetModConfigData("Sentry_Range")
GLOBAL.SENTRY_DAMAGE = GetModConfigData("Sentry_Damage")
GLOBAL.SENTRY_ROF = GetModConfigData("Sentry_ROF")
GLOBAL.SENTRY_HEALTH = GetModConfigData("Sentry_Health")
GLOBAL.SENTRY_FF = GetModConfigData("sentry_ff")

TUNING.ETELEPORT_PENALTY = GetModConfigData("eteleport_penalty")

modimport("scripts/skins_api")

SKIN_AFFINITY_INFO.engineer = {
	"engineer_blu",
	"engineer_rose",
	"engineer_shadow",
	"engineer_formal",
	"engineer_survivor",
}

PREFAB_SKINS["engineer"] = {
	"engineer_none", 
	"engineer_blu",
	"engineer_rose",
	"engineer_shadow",
	"engineer_formal",
	"engineer_survivor",
}

PREFAB_SKINS_IDS = {}
for prefab,skins in pairs(PREFAB_SKINS) do
    PREFAB_SKINS_IDS[prefab] = {}
    for k,v in pairs(skins) do
      	  PREFAB_SKINS_IDS[prefab][v] = k
    end
end

AddSkinnableCharacter("engineer")

if GLOBAL.TheNet:GetServerGameMode() == "lavaarena" then
TUNING.LAVAARENA_STARTING_HEALTH.ENGINEER = 125
TUNING.GAMEMODE_STARTING_ITEMS.LAVAARENA.ENGINEER = { "bacontome", "forge_woodarmor" }
end

modimport("scripts/strings.lua")

local engietab = AddRecipeTab("Construction", 999, "images/hud/engietab.xml", "engietab.tex", "engie")

TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.ENGINEER = { "tf2wrench",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap",
	"scrap"
	}
TUNING.STARTING_ITEM_IMAGE_OVERRIDE["tf2wrench"] = 
{
    atlas = "images/inventoryimages/tf2wrench.xml",
    image = "tf2wrench.tex",
}
TUNING.STARTING_ITEM_IMAGE_OVERRIDE["scrap"] = 
{
    atlas = "images/inventoryimages/scrap.xml",
    image = "scrap.tex",
}

TUNING.ENGINEER_HEALTH = 125
TUNING.ENGINEER_HUNGER = 150
TUNING.ENGINEER_SANITY = 200

if GLOBAL.TheNet:GetServerGameMode() == "lavaarena" then
TUNING.LAVAARENA_STARTING_HEALTH.ENGINEER = 125
TUNING.GAMEMODE_STARTING_ITEMS.LAVAARENA.ENGINEER = { "bacontome", "reedtunic" }
end

--Scrap
local recipe_difficulty = GetModConfigData("Scrap_Difficulty")
if recipe_difficulty == "default" then
local scrap = AddRecipe("scrap", {Ingredient("flint", 2), Ingredient("twigs", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
elseif recipe_difficulty == "easy" then 
local scrap = AddRecipe("scrap", {Ingredient("flint", 1), Ingredient("twigs", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
elseif recipe_difficulty == "easier" then 
local scrap = AddRecipe("scrap", {Ingredient("flint", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 6, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
elseif recipe_difficulty == "hard" then 
local scrap = AddRecipe("scrap", {Ingredient("flint", 3), Ingredient("twigs", 3), Ingredient("goldnugget", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
elseif recipe_difficulty == "harder" then 
local scrap = AddRecipe("scrap", {Ingredient("flint", 4), Ingredient("twigs", 4), Ingredient("transistor", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, 5, "engie", "images/inventoryimages/scrap.xml", "scrap.tex")
end

--Hard Hat
local recipe_difficulty = GetModConfigData("EHat_Difficulty")
if recipe_difficulty == "default" then
local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 4, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
elseif recipe_difficulty == "easy" then 
local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 2, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
elseif recipe_difficulty == "hard" then 
local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 6, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
elseif recipe_difficulty == "harder" then 
local ehardhat = AddRecipe("ehardhat", {Ingredient("scrap", 8, "images/inventoryimages/scrap.xml"), Ingredient("goldnugget", 2), Ingredient("strawhat", 1)}, engietab, GLOBAL.TECH.ONE, nil, nil, nil, nil, "engie", "images/inventoryimages/ehardhat.xml", "ehardhat.tex")
end

--Wrench
local recipe_difficulty = GetModConfigData("tf2Wrench_Difficulty")
if recipe_difficulty == "default" then
local tf2wrench = AddRecipe("tf2wrench", {Ingredient("scrap", 5, "images/inventoryimages/scrap.xml"), Ingredient("twigs", 2), Ingredient("goldnugget", 1)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/tf2wrench.xml", "tf2wrench.tex")
elseif recipe_difficulty == "easy" then 
local tf2wrench = AddRecipe("tf2wrench", {Ingredient("scrap", 5, "images/inventoryimages/scrap.xml"), Ingredient("twigs", 2)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/tf2wrench.xml", "tf2wrench.tex")
elseif recipe_difficulty == "hard" then 
local tf2wrench = AddRecipe("tf2wrench", {Ingredient("scrap", 10, "images/inventoryimages/scrap.xml"), Ingredient("twigs", 5), Ingredient("goldnugget", 3)}, engietab, GLOBAL.TECH.NONE, nil, nil, nil, nil, "engie", "images/inventoryimages/tf2wrench.xml", "tf2wrench.tex")
elseif recipe_difficulty == "harder" then 
local tf2wrench = AddRecipe("tf2wrench", {Ingredient("scrap", 12, "images/inventoryimages/scrap.xml"), Ingredient("twigs", 5), Ingredient("gears", 1)}, engietab, GLOBAL.TECH.ONE, nil, nil, nil, nil, "engie", "images/inventoryimages/tf2wrench.xml", "tf2wrench.tex")
end

--Sentry
local recipe_difficulty = GetModConfigData("Sentry_Difficulty")
if recipe_difficulty == "default" then
local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 20, "images/inventoryimages/scrap.xml"), Ingredient("gears", 3)}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engieturret", "images/inventoryimages/esentry.xml", "esentry.tex")
elseif recipe_difficulty == "hard" then
local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 30, "images/inventoryimages/scrap.xml"), Ingredient("gears", 5), Ingredient("cutstone",5)}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engieturret", "images/inventoryimages/esentry.xml", "esentry.tex")
elseif recipe_difficulty == "harder" then
local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 40, "images/inventoryimages/scrap.xml"), Ingredient("gears", 6), Ingredient("goldnugget",5)}, engietab, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "engieturret", "images/inventoryimages/esentry.xml", "esentry.tex")
elseif recipe_difficulty == "easy" then
local esentry_item = AddRecipe("esentry", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("gears", 1)}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engieturret", "images/inventoryimages/esentry.xml", "esentry.tex")
end

----------------Dud recipes for locking limits
GLOBAL.STRINGS.NAMES.ESENTRY_DUMMY = "Sentry Gun"
GLOBAL.STRINGS.RECIPE_DESC.ESENTRY_DUMMY = "Too Many Sentries Already Built!"
local esentry_dummy = AddRecipe("esentry_dummy", {Ingredient("esentry", 0, "images/inventoryimages/esentry.xml")}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engiesentrydummy", "images/inventoryimages/buildinglocked.xml", "buildinglocked.tex")

--Dispenser
local recipe_difficulty = GetModConfigData("Dispenser_Difficulty")
if recipe_difficulty == "default" then
local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 3)}, engietab, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "engiedis", "images/inventoryimages/dispenser.xml", "dispenser.tex")
elseif recipe_difficulty == "hard" then
local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 25, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 5), Ingredient("transistor",5)}, engietab, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "engiedis", "images/inventoryimages/dispenser.xml", "dispenser.tex")
elseif recipe_difficulty == "harder" then
local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 35, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 6), Ingredient("gears",5)}, engietab, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "engiedis", "images/inventoryimages/dispenser.xml", "dispenser.tex")
elseif recipe_difficulty == "easy" then
local dispenser_item = AddRecipe("dispenser", {Ingredient("scrap", 10, "images/inventoryimages/scrap.xml"), Ingredient("redgem", 1)}, engietab, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "engiedis", "images/inventoryimages/dispenser.xml", "dispenser.tex")
end

GLOBAL.STRINGS.NAMES.DISPENSER_DUMMY = "Dispenser"
GLOBAL.STRINGS.RECIPE_DESC.DISPENSER_DUMMY = "Too Many Dispensers Already Built!"
local dispenser_dummy = AddRecipe("dispenser_dummy", {Ingredient("dispenser", 0, "images/inventoryimages/dispenser.xml")}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engiedispenserdummy", "images/inventoryimages/buildinglocked.xml", "buildinglocked.tex")

--Teleporter
local recipe_difficulty = GetModConfigData("Teleporter_Difficulty")
if recipe_difficulty == "default" then
local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10)}, engietab, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "engietelenter", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "hard" then
local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 20, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10), Ingredient("marble",5)}, engietab, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "engietelenter", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "harder" then
local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 25, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 15), Ingredient("orangegem",1)}, engietab, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "engietelenter", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "easy" then
local eteleporter_item = AddRecipe("eteleporter", {Ingredient("scrap", 10, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel",6)}, engietab, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "engietelenter", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
end

--Exit
local recipe_difficulty = GetModConfigData("Teleporter_Difficulty")
if recipe_difficulty == "default" then
local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 15, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10)}, engietab, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "engietelexit", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "hard" then
local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 20, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 10), Ingredient("marble",5)}, engietab, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "engietelexit", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "harder" then
local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 25, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 15), Ingredient("orangegem",1)}, engietab, GLOBAL.TECH.MAGIC_TWO, nil, nil, nil, nil, "engietelexit", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
elseif recipe_difficulty == "easy" then
local eteleporter_exit_item = AddRecipe("eteleporter_exit", {Ingredient("scrap", 10, "images/inventoryimages/scrap.xml"), Ingredient("nightmarefuel", 6)}, engietab, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "engietelexit", "images/inventoryimages/eteleporter.xml", "eteleporter.tex")
end

GLOBAL.STRINGS.NAMES.ETELEPORTER_DUMMY = "Teleporter Entrance"
GLOBAL.STRINGS.RECIPE_DESC.ETELEPORTER_DUMMY = "Too Many Entrances Already Built!"
local eteleporter_dummy = AddRecipe("eteleporter_dummy", {Ingredient("eteleporter", 0, "images/inventoryimages/eteleporter.xml")}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engietelenterdummy", "images/inventoryimages/buildinglocked.xml", "buildinglocked.tex")

GLOBAL.STRINGS.NAMES.ETELEPORTER_EXIT_DUMMY = "Teleporter Exit"
GLOBAL.STRINGS.RECIPE_DESC.ETELEPORTER_EXIT_DUMMY = "Too Many Exits Already Built!"
local eteleporter_exit_dummy = AddRecipe("eteleporter_exit_dummy", {Ingredient("eteleporter_exit", 0, "images/inventoryimages/eteleporter.xml")}, engietab, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "engietelexitdummy", "images/inventoryimages/buildinglocked.xml", "buildinglocked.tex")

--Gibus
-- Craftable for everyone for all your Gibus needs.
local gibus = AddRecipe("gibus", {Ingredient("silk", 2), Ingredient("charcoal", 2)}, GLOBAL.RECIPETABS.DRESS, GLOBAL.TECH.SCIENCE_NONE, nil, nil, nil, nil, nil, "images/inventoryimages/gibus.xml")

GLOBAL.MATERIALS.SCRAP = "SCRAP"
local scrap = {"scrap", }

-- Actions ------------------------------

local ENGIETELEPORT = AddAction("ENGIETELEPORT", "Teleport", function(act)
	if act.doer ~= nil and act.target ~= nil and act.doer:HasTag("player") and act.target.components.engieteleporter then
		act.target.components.engieteleporter.boundEntrance = act.target
		act.target.components.engieteleporter:TeleportAction(act.doer)
		if act.doer.components.sanity and not act.doer:HasTag("engie") then
            act.doer.components.sanity:DoDelta(-TUNING.ETELEPORT_PENALTY)--Add config
	    end
		return true
	end
end)
--ENGIETELEPORT.ghost_valid = true
ENGIETELEPORT.encumbered_valid = true
ENGIETELEPORT.mount_valid = true

AddAction("ENGIEWORKABLE", "Repair/Reload", function(act)
	if act.doer ~= nil and act.target ~= nil and act.doer:HasTag("player") and act.target.components.engieworkable then
		act.target.components.workable:WorkedBy(act.doer, 0)
		return true
	end
end)

GLOBAL.ACTIONS.PICKUP.oldfn = GLOBAL.ACTIONS.PICKUP.fn --Cheat to make non-engineers not able to toss them about
GLOBAL.ACTIONS.PICKUP.fn = function(act)
	if act.doer ~= nil and act.target ~= nil then
	if act.target:HasTag("ebuild") and not act.doer:HasTag("engie") then
      return false, "restriction"
	else
	  return GLOBAL.ACTIONS.PICKUP.oldfn(act) 
	end
	end
end

-- Component actions ---------------------

AddComponentAction("SCENE", "engieteleporter", function(inst, doer, actions, right)
--	if right then
		table.insert(actions, GLOBAL.ACTIONS.ENGIETELEPORT)
--	end
end)

AddComponentAction("SCENE", "engieworkable", function(inst, doer, actions, right)
	if (inst:HasTag("dispenser") and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) ~= nil and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS).prefab == "tf2wrench") then
	    if inst:HasTag("lvl1") or inst:HasTag("lvl2") then
	    --    if right then
	            GLOBAL.STRINGS.ACTIONS.ENGIEWORKABLE = "Refuel/Upgrade"
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	    --   end
	    end
	    if inst:HasTag("lvl3") then
	    --    if right then
	            GLOBAL.STRINGS.ACTIONS.ENGIEWORKABLE = "Refuel"
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	    --   end
	    end
	end

	if (inst:HasTag("esentry") and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) ~= nil and doer.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS).prefab == "tf2wrench") then
	    if inst:HasTag("lvl1") or inst:HasTag("lvl2") then
	    --    if right then
	            GLOBAL.STRINGS.ACTIONS.ENGIEWORKABLE = "Reload/Upgrade"
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	    --   end
	    end
	    if inst:HasTag("lvl3") then
	    --    if right then
	            GLOBAL.STRINGS.ACTIONS.ENGIEWORKABLE = "Reload"
		    table.insert(actions, GLOBAL.ACTIONS.ENGIEWORKABLE)
	    --   end
	    end
	end
end)

-- Stategraph ----------------------------

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIETELEPORT, "doshortaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIETELEPORT, "doshortaction"))

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIEWORKABLE, --Workaround for previous hammer conflicts ect
        function(inst)
            if inst:HasTag("beaver") then
                return not inst.sg:HasStateTag("gnawing") and "gnaw" or nil
            end
            return not inst.sg:HasStateTag("prehammer")
                and (inst.sg:HasStateTag("hammering") and
                    "hammer" or
                    "hammer_start")
                or nil
        end))

AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.ENGIEWORKABLE,
        function(inst)
            if inst:HasTag("beaver") then
                return not inst.sg:HasStateTag("gnawing") and "gnaw" or nil
            end
            return not inst.sg:HasStateTag("prehammer") and "hammer_start" or nil
        end))


-- Emotes
local ranchocommands = { "ranchorelaxo", "relaxo", "engineer" }

GLOBAL.AddModUserCommand("ranchorelaxo", "rancho", {
	aliases = ranchocommands,
	prettyname = function(command) return "engineer emote" end,
	desc = function() return "Perform an emote!" end,
	permission = "USER",
	params = {},
	emote = true,
	slash = true,
	usermenu = false,
	servermenu = false,
	vote = false,
    serverfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
				player:PushEvent("emote", { anim = { "pre_rancho", "loop_rancho" }, loop = true })
		end
    end,
    localfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
				player:PushEvent("emote", { anim = { "pre_rancho", "loop_rancho" }, loop = true })
		end
	end,
})
--local anim = "emote_rancho.zip"
local kazotskycommands = { "kazotsky", "kazotsky kick", "woowee" }
GLOBAL.AddModUserCommand("kazotsky", "kazotskykick", {
	aliases = kazotskycommands,
	prettyname = function(command) return "engineer emote" end,
	desc = function() return "Perform an emote!" end,
	permission = "USER",
	params = {},
	emote = true,
	slash = true,
	usermenu = false,
	servermenu = false,
	vote = false,
    serverfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
				player:PushEvent("emote", { anim = { "kazotsky_pre", "kazotsky_quick_loop" }, loop = true })
		end
    end,
    localfn = function(params, caller)
		local player = GLOBAL.UserToPlayer(caller.userid)
		if player ~= nil and player.prefab == "engineer" then
				player:PushEvent("emote", { anim = { "kazotsky_pre", "kazotsky_quick_loop" }, loop = true })
		end
	end,
})
--
AddMinimapAtlas("images/minimap/engineer.xml")
AddMinimapAtlas("images/minimap/esentry.xml")
AddMinimapAtlas("images/minimap/dispenser.xml")
AddMinimapAtlas("images/minimap/eteleporter.xml")
--
AddModCharacter("engineer", "MALE")