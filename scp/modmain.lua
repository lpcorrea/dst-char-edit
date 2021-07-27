STRINGS = GLOBAL.STRINGS
TUNING = GLOBAL.TUNING

GLOBAL.TUNING.SCPHUNGERRATE = GetModConfigData("scphungerrate")
GLOBAL.TUNING.SCPPESTILENCERATE = GetModConfigData("scppestilencerate")
GLOBAL.TUNING.SCPONESHOT = GetModConfigData("scponeshot")


PrefabFiles = {
	"plaguedoctor",
	"plaguedoctor_none",
    "scpzombie",
    "scp035host",
    --"custom_max_fx",
    "custom_pigcorpse_fx",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/plaguedoctor.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/plaguedoctor.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/plaguedoctor.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/plaguedoctor.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/plaguedoctor_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/plaguedoctor_silho.xml" ),

    Asset( "IMAGE", "bigportraits/plaguedoctor.tex" ),
    Asset( "ATLAS", "bigportraits/plaguedoctor.xml" ),
	
	Asset( "IMAGE", "images/map_icons/plaguedoctor.tex" ),
	Asset( "ATLAS", "images/map_icons/plaguedoctor.xml" ),

    Asset( "IMAGE", "images/map_icons/035mask.tex" ),
    Asset( "ATLAS", "images/map_icons/035mask.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_plaguedoctor.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_plaguedoctor.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_plaguedoctor.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_plaguedoctor.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_plaguedoctor.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_plaguedoctor.xml" ),
	
	Asset( "IMAGE", "images/names_plaguedoctor.tex" ),
    Asset( "ATLAS", "images/names_plaguedoctor.xml" ),
	
    Asset( "IMAGE", "bigportraits/plaguedoctor_none.tex" ),
    Asset( "ATLAS", "bigportraits/plaguedoctor_none.xml" ),

    Asset( "IMAGE", "bigportraits/plaguedoctor_survivor.tex" ),
    Asset( "ATLAS", "bigportraits/plaguedoctor_survivor.xml" ),

    Asset( "IMAGE", "bigportraits/plaguedoctor_old.tex" ),
    Asset( "ATLAS", "bigportraits/plaguedoctor_old.xml" ),

    Asset("SOUNDPACKAGE", "sound/plaguedoctor.fev"),
	Asset("SOUND", "sound/plaguedoctor.fsb"),
	
    Asset( "ANIM", "anim/plaguedoctorbadge.zip" ),
}

RemapSoundEvent( "dontstarve/characters/plaguedoctor", "plaguedoctor/plaguedoctor" )
RemapSoundEvent( "dontstarve/characters/plaguedoctor/death_voice", "plaguedoctor/plaguedoctor/death_voice" )
RemapSoundEvent( "dontstarve/characters/plaguedoctor/hurt", "plaguedoctor/plaguedoctor/hurt" )
RemapSoundEvent( "dontstarve/characters/plaguedoctor/talk_LP", "plaguedoctor/plaguedoctor/talk_LP" )
RemapSoundEvent( "dontstarve/characters/plaguedoctor/ghost_LP", "plaguedoctor/plaguedoctor/ghost_LP" )
RemapSoundEvent( "dontstarve/characters/plaguedoctor/emote", "plaguedoctor/plaguedoctor/emote" )
RemapSoundEvent( "dontstarve/characters/plaguedoctor/pose", "plaguedoctor/plaguedoctor/pose" )
RemapSoundEvent( "dontstarve/characters/plaguedoctor/yawn", "plaguedoctor/plaguedoctor/yawn" )
RemapSoundEvent( "dontstarve/characters/plaguedoctor/carol", "plaguedoctor/plaguedoctor/carol" )

local _G = GLOBAL
local require = _G.require
local STRINGS = _G.STRINGS
local SpawnPrefab = _G.SpawnPrefab

local resolvefilepath = GLOBAL.resolvefilepath
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH

-- SCP crafting tab

scptab = AddRecipeTab("SCP NINJA", 998, "images/hud/e_scythe.xml", "e_scythe.tex", "scp049")

local scpscythe_recipe = AddRecipe("e_scythe",
{GLOBAL.Ingredient("twigs", 2), GLOBAL.Ingredient("rope", 1), GLOBAL.Ingredient("razor", 1)},
scptab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/e_scythe.xml", "e_scythe.tex")
anniebearhat_recipe.tagneeded = false
anniebearhat_recipe.builder_tag = "scp049"

-----------------------------------------------------------------------------------------------------

local SPAWN049_2 = GLOBAL.Action({ priority= 10, mount_valid=true })
SPAWN049_2.str = "Perform Surgery on"
SPAWN049_2.id = "SPAWN049_2"
SPAWN049_2.fn = function(act)
    if act.doer ~= nil and act.target ~= nil and act.doer:HasTag("scp049") and act.target.components.scpinteractioncomponent.lifetime >= 0 and act.target:HasTag("scppigcorpse") then
        act.target.components.scpinteractioncomponent:DoSpawn(act.doer)
        return true
    else
        return false
    end
end
AddAction(SPAWN049_2)

local USESCP035 = GLOBAL.Action({ priority= 10, mount_valid=true })
USESCP035.str = "Use"
USESCP035.id = "USESCP035"
USESCP035.fn = function(act)
	if act.doer ~= nil and act.target ~= nil and act.invobject ~= nil and act.doer:HasTag("scp049") then
        act.invobject.components.scp035itemcomponent:PossessPig(act.doer, act.target)
		return true
	else
		return false
    end
end
AddAction(USESCP035)
-----------------------------------------------------------------------------------------------------

AddComponentAction("SCENE", "scpinteractioncomponent", function(inst, doer, actions, right)
    --if right then
        if doer:HasTag("scp049") and inst:HasTag("scppigcorpse") then
            table.insert(actions, GLOBAL.ACTIONS.SPAWN049_2)
        end
    --end
end)

AddComponentAction("USEITEM", "scp035itemcomponent", function(inst, doer, target, actions)
    --if right then
        if doer:HasTag("scp049") and (target.prefab == "pigman" or target:HasTag("scppigcorpse")) then
            table.insert(actions, GLOBAL.ACTIONS.USESCP035)
        end
    --end
end)

-----------------------------------------------------------------------------------------------------

--[[
local state_scplongaction = GLOBAL.State{ name = "scplongaction",
    tags = { "doing", "busy" },

    onenter = function(inst)
        inst.sg:GoToState("dolongaction", 3)
    end,
}
]]
--AddStategraphState("wilson", state_scplongaction)
--AddStategraphState("wilson_client", state_scplongaction)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.USESCP035, "give"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.USESCP035, "give"))

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.SPAWN049_2, "dolongaction"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.SPAWN049_2, "dolongaction"))

-----------------------------------------------------------------------------------------------------

-- The character select screen lines
STRINGS.CHARACTER_TITLES.plaguedoctor = "The Plague Doctor"
STRINGS.CHARACTER_NAMES.plaguedoctor = "SCP-049"
STRINGS.CHARACTER_DESCRIPTIONS.plaguedoctor = "*Has a Lethal Touch; some mobs are immune\n*Can reanimate the dead\n*Eternally combatting the Pestilence\n*Can't run that fast"
STRINGS.CHARACTER_QUOTES.plaguedoctor = "\"The Pestilence is here, and I can sense it.\""

-- Custom speech strings
STRINGS.CHARACTERS.PLAGUEDOCTOR = require "speech_plaguedoctor"

-- The character's name as appears in-game 
STRINGS.NAMES.PLAGUEDOCTOR = "SCP-049"

STRINGS.CHARACTER_SURVIVABILITY.plaguedoctor= "[REDACTED]"

TUNING.PLAGUEDOCTOR_HEALTH = 175
TUNING.PLAGUEDOCTOR_HUNGER = 150
TUNING.PLAGUEDOCTOR_SANITY = 175

AddMinimapAtlas("images/map_icons/plaguedoctor.xml")
AddMinimapAtlas("images/map_icons/035mask.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("plaguedoctor", "MALE")

-----------------------------------------------------------------------------------------------------

local KnownModIndex = GLOBAL.KnownModIndex
local Text = require "widgets/text"
local Image = require "widgets/image"
local NUMBERFONT = GLOBAL.NUMBERFONT

local function GetModName(modname) -- modinfo's modname and internal modname is different.
    for _, knownmodname in ipairs(KnownModIndex:GetModsToLoad()) do
        if KnownModIndex:GetModInfo(knownmodname).name == modname  then
            return knownmodname
        end
    end
end

local function GetModOptionValue(knownmodname, known_option_name)
    local modinfo = KnownModIndex:GetModInfo(knownmodname)
    for _,option in pairs(modinfo.configuration_options) do
        if option.name == known_option_name then
            return option.saved
        end
    end
end

AddPlayerPostInit(function(inst)
    if inst:HasTag("scp049") then

        inst.counter_max = GLOBAL.net_shortint(inst.GUID, "counter_max", "counter_maxdirty") 
        inst.counter_current = GLOBAL.net_shortint(inst.GUID, "counter_current", "counter_currentdirty") 

        if GLOBAL.TheWorld.ismastersim then
            inst:AddComponent("pestilencecounter")
        end 
    end
end)

local function PlaguedoctorbadgeDisplays(self)
    if self.owner:HasTag("scp049") then
        local Plaguedoctorbadge = require "widgets/plaguedoctorbadge"

        self.combinedmod = GetModName("Combined Status")

        self.pestilence = self:AddChild(Plaguedoctorbadge(self.owner))
        if self.combinedmod ~= nil then
            self.brain:SetPosition(0, 35, 0)
            self.stomach:SetPosition(-62, 35, 0)
            self.heart:SetPosition(62, 35, 0)

            self.pestilence:SetScale(.9,.9,.9)
            self.pestilence:SetPosition(-62, -50, 0)
            self.pestilence.combinedmod = true
            self.pestilence.showmaxonnumbers = GetModOptionValue(self.combinedmod, "SHOWMAXONNUMBERS")

            self.pestilence.bg = self.pestilence:AddChild(Image("images/status_bgs.xml", "status_bgs.tex"))
            self.pestilence.bg:SetScale(.4,.43,0)
            self.pestilence.bg:SetPosition(-.5, -40, 0)
        
            self.pestilence.num:SetFont(NUMBERFONT)
            self.pestilence.num:SetSize(28)
            self.pestilence.num:SetPosition(3.5, -40.5, 0)
            self.pestilence.num:SetScale(1,.78,1)

            self.pestilence.num:MoveToFront()
            self.pestilence.num:Show()

            self.pestilence.maxnum = self.pestilence:AddChild(Text(NUMBERFONT, self.pestilence.showmaxonnumbers and 25 or 33))
            self.pestilence.maxnum:SetPosition(6, 0, 0)
            self.pestilence.maxnum:MoveToFront()
            self.pestilence.maxnum:Hide()
        else
            self.pestilence:SetPosition(-40, -50,0)
            self.brain:SetPosition(40, -50, 0)
            self.stomach:SetPosition(-40,17,0)
        end
        
        --self.inst:ListenForEvent("pestilencedetla", function(inst, data) self.pestilence:SetPercent(data.newpercent, self.owner.components.pestilencecounter:Max()) end, self.owner)

        local _SetGhostMode = self.SetGhostMode
        function self:SetGhostMode(ghostmode)
            if not self.isghostmode == not ghostmode then --force boolean
                return
            end

            _SetGhostMode(self, ghostmode)
            if ghostmode then
                self.pestilence:Hide()
            else
                self.pestilence:Show()
            end
        end
    end
end

AddClassPostConstruct("widgets/statusdisplays", PlaguedoctorbadgeDisplays)

-----------------------------------------------------------------------------------------------------

local PREFAB_SKINS = _G.PREFAB_SKINS
local PREFAB_SKINS_IDS = _G.PREFAB_SKINS_IDS
local SKIN_AFFINITY_INFO = GLOBAL.require("skin_affinity_info")

modimport("skins_api") --Hornet: We import the file! If you named your file something else other than skins_api then youll want to rename this function to the name of the file

SKIN_AFFINITY_INFO.plaguedoctor = {
    "plaguedoctor_survivor", --Hornet: These skins will show up for the character when the Survivor filter is enabled
}

PREFAB_SKINS["plaguedoctor"] = {"plaguedoctor_none", "plaguedoctor_survivor", "plaguedoctor_old",}


PREFAB_SKINS["plaguedoctor"] = {
    "plaguedoctor_none", 
    "plaguedoctor_survivor",
    "plaguedoctor_old",
}


PREFAB_SKINS_IDS = {} --Make sure this is after you  change the PREFAB_SKINS["character"] table
for prefab,skins in pairs(PREFAB_SKINS) do
    PREFAB_SKINS_IDS[prefab] = {}
    for k,v in pairs(skins) do
          PREFAB_SKINS_IDS[prefab][v] = k
    end
end

AddSkinnableCharacter("plaguedoctor") --Hornet: The character youd like to skin, make sure you use the prefab name. And MAKE sure you run this function AFTER you import the skins_api file

--Skin STRINGS

STRINGS.SKIN_NAMES.plaguedoctor_none = "SCP-049"
STRINGS.SKIN_NAMES.plaguedoctor_survivor = "The Survivor"
STRINGS.SKIN_NAMES.plaguedoctor_old = "The Oldschool"

STRINGS.SKIN_QUOTES.plaguedoctor_survivor = "\"Stop resisting.\""
STRINGS.SKIN_QUOTES.plaguedoctor_old = "\"Looking back, this appearance is silly...\""

STRINGS.SKIN_DESCRIPTIONS.plaguedoctor_none = "He will cure you of the disease, whether you want it or not."
STRINGS.SKIN_DESCRIPTIONS.plaguedoctor_survivor = "SCP-049 has spent lifetimes perfecting his cure, and will spend many more if necessary."
STRINGS.SKIN_DESCRIPTIONS.plaguedoctor_old = "Allegedly being present during the medieval crusades of Europe, SCP-049 says that he's been around for a long, long time."


-----------------------------------------------------------------------------------------------------

STRINGS.NAMES.SCPZOMBIE = "SCP-049-2"
STRINGS.NAMES.CUSTOM_PIGCORPSE_FX = "Corpse"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCPZOMBIE = "You have been cured."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCPZOMBIE = "I really, really don't like the look it constantly gives me."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.SCPZOMBIE = "Yeesh, that guy smells!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.SCPZOMBIE = "Aaagh! Zombie Pig!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.SCPZOMBIE = "It has been stripped of life. Perhaps it is a cure."
STRINGS.CHARACTERS.WX78.DESCRIBE.SCPZOMBIE = "RE-ANIMATED SWINE"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.SCPZOMBIE = "Goodness, the doctor has re-animated that swine!"
STRINGS.CHARACTERS.WOODIE.DESCRIBE.SCPZOMBIE = "That ain't right."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.SCPZOMBIE = "That doctor has made a freak of nature!"
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.SCPZOMBIE = "It is alive to fight again!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.SCPZOMBIE = "Eep! A zombie!"
STRINGS.CHARACTERS.WINONA.DESCRIBE.SCPZOMBIE = "It keeps looking at me..."
STRINGS.CHARACTERS.WORTOX.DESCRIBE.SCPZOMBIE = "It truly is a curse, a soul trapped in a body it cannot control."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SCPZOMBIE = "You have been cured."
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.SCPZOMBIE = "Twirly tail alive?"
STRINGS.CHARACTERS.WARLY.DESCRIBE.SCPZOMBIE = "I refuse to let that near my kitchen!"
STRINGS.CHARACTERS.WURT.DESCRIBE.SCPZOMBIE = "Glurph, pigfolk look smellier than normal."

STRINGS.NAMES.SCP035HOST = "SCP-035 Host"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCP035HOST = "That's terrifying!"
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SCP035HOST = "I suppose this is like old times, old friend."

STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SCP035ITEM = "How are you, old friend?"
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SCP035CRYPT = "A familiar sense...! I need to get this door open."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SCP035CRYPT_OPEN  = "Goodness, how long were they in there?"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "%s looks pretty unnerving...",
            ATTACKER = "I am going to stay far, far away from %s.",
            MURDERER = "S-Stay away from me!!",
            REVIVER = "You gotta tell me, %s, how do you reanimate the dead?",
            GHOST = "%s is looking more anomalous than usual.",
            FIRESTARTER = "Are you planning to burn out the Pestilence, %s?",
}
STRINGS.CHARACTERS.WILLOW.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "O-oh, hi there, %s....",
            ATTACKER = "I don't like the look of %s.",
            MURDERER = "You can't make me a zombie if you can't catch me!",
            REVIVER = "I still don't trust %s.",
            GHOST = "Looks like your touch failed you, %s!",
            FIRESTARTER = "I'm almost starting to warm up to you, %s. Almost.",
}
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "H-hello scary b-bird doctor!",
            ATTACKER = "D-don't come close to Wolfgang!",
            MURDERER = "No!! Please!! Do not make Wolfgang zombie!",
            REVIVER = "Scary bird doctor not evil?",
            GHOST = "Scary bird doctor is dead?",
            FIRESTARTER = "Scary bird doctor is light fire!",
}
STRINGS.CHARACTERS.WENDY.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "%s, a harbringer of death.",
            ATTACKER = "I welcome you with open arms, %s.",
            MURDERER = "No point in delaying the inevitable. Take me, %s.",
            REVIVER = "I like you, %s.",
            GHOST = "How did you die, %s?",
            FIRESTARTER = "%s is commencing the apocalypse.",
}
STRINGS.CHARACTERS.WX78.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "ERROR: ANOMALY DETECTED ",
            ATTACKER = "%s IS PUTTING THEIR POWER TO GOOD USE.",
            MURDERER = "YOUR GRASP DOES NOT AFFECT ME. HA HA HA.",
            REVIVER = "%s SPECIALIZES IN KILLING MEATBAGS.",
            GHOST = "EVEN WITH YOUR GIFT OF DEATH, YOU ARE INFERIOR",
            FIRESTARTER = "THERE IS ASH ON YOUR DRESS, %s.",
}
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "Oh my, %s's hands are stained with blood.",
            ATTACKER = "%s is a liability.",
            MURDERER = "Fighting %s would be suicide. I'd advise running away.",
            REVIVER = "Despite their appearance, %s is a well-mannered gentlemen.",
            GHOST = "Perhaps that is for the best.",
            FIRESTARTER = "%s is a liability.",
}
STRINGS.CHARACTERS.WOODIE.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "I don't trust him.",
            ATTACKER = "I don't want him near me, or Lucy.",
            MURDERER = "Don't you dare put your hands on Lucy!",
            REVIVER = "Perhaps I misjudged you, eh %s?",
            GHOST = "Hmph.",
            FIRESTARTER = "%s is a liability!",
}
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "What is this \"Pestilence\" that you keep going on about?!",
            ATTACKER = "It was a mistake bringing you here, %s.",
            MURDERER = "No! I refuse to be reduced to a braindead abomination!",
            REVIVER = "So... Uh... No hard feelings?",
            GHOST = "Good riddance.",
            FIRESTARTER = "What, do you think you can burn the disease out of us?",
}
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "%s has blood on their hands!",
            ATTACKER = "%s is untrustworthy.",
            MURDERER = "Your method of combat has no honor, %s!",
            REVIVER = "Come, let me teach you how to fight like a real warrior!",
            GHOST = "We are blessed to have %s's power on our side!",
            FIRESTARTER = "%s is seeking to burn us alive!",
}
STRINGS.CHARACTERS.WEBBER.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "H-hi... %s...",
            ATTACKER = "We don't want to be near him.",
            MURDERER = "P-Please don't (sob) hurt me!",
            REVIVER = "We can't hold hands, but we're still friends! Right, %s?",
            GHOST = "We still think you're scary, %s!",
            FIRESTARTER = "%s is lighting fires!",
}
STRINGS.CHARACTERS.WINONA.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "Woah there, that's a lot of blood on your hands, %s.",
            ATTACKER = "I don't like the look you're givin' me, %s!",
            MURDERER = "Run!",
            REVIVER = "You're still a tad off-puttin', %s.",
            GHOST = "He can't make any more zombies like this.",
            FIRESTARTER = "%s is trying to cure us with fire!",
}
STRINGS.CHARACTERS.WARLY.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "Don't put those hands anywhere near my food, %s!",
            ATTACKER = "%s is starting to become scary.",
            MURDERER = "%s is going to kill us all!!",
            REVIVER = "%s, please stop letting your \"followers\" in my kitchen.",
            GHOST = "It's a relieving sight, more than anything.",
            FIRESTARTER = "Oh, I didn't know fire was your thing, %s!",
}
STRINGS.CHARACTERS.WORTOX.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "%s's touch is much more potent than mine. Hmph.",
            ATTACKER = "%s is being naughty!",
            MURDERER = "That's not a prank! You're enslaving those poor souls!",
            REVIVER = "Playing nice, %s?",
            GHOST = "Not even your death released those poor souls.",
            FIRESTARTER = "I knew you were a prankster at heart, %s! Hyuyu!",
}
STRINGS.CHARACTERS.WORMWOOD.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "Beak doctor?",
            ATTACKER = "Beak doctor scary.",
            MURDERER = "Beak doctor killing us!",
            REVIVER = "Beak doctor good?",
            GHOST = "Beak doctor died.",
            FIRESTARTER = "No! Bad beak doctor!",
}
STRINGS.CHARACTERS.WURT.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "You scary!",
            ATTACKER = "Run! Run!",
            MURDERER = "M-my scales protect my skin! ...Right?",
            REVIVER = "You're still scary, florp.",
            GHOST = "Not so scary anymore, florp!",
            FIRESTARTER = "No! Stop burning things!",
}
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.PLAGUEDOCTOR =
{
            GENERIC = "Oh, another version of myself?",
            ATTACKER = "...",
            MURDERER = "We do what we must to fight the Pestilence.",
            REVIVER = "The most reliable ally is myself, after all.",
            GHOST = "Good heavens, that is an unnerving sight.",
            FIRESTARTER = "I am disappointed in myself.",
}
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.ROSIE = --Because GetNerfedOn wanted me to lmao
{
            GENERIC = "You come from the stars, you say?",
            ATTACKER = "%s is more violent than what she may seem.",
            MURDERER = "Royalty or not, you are diseased, and require the cure.",
            REVIVER = "%s's knowledge from beyond the stars is proving helpful.",
            GHOST = "It is like looking into the abyss.",
            FIRESTARTER = "If you keep this up, I will be forced to intervene, %s.",
}
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.WURT =
{
            GENERIC = "Oh? Hello, fish child.",
            ATTACKER = "...",
            MURDERER = "Your kind is not immune to the disease. Come here, child.",
            REVIVER = "%s is an amazing ambassador for their species.",
            GHOST = "The wastelands is no place for a child.",
            FIRESTARTER = "I refuse to tolerate this behavior.",
}

--Uncompromising Mode quotes
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.TOAD = "It is easily dealt with."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.MUSHROOMSPROUT_OVERWORLD = "I don't need a nuisance like this distracting me from the *real* disease."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.UNCOMPROMISING_RAT = "Common rodents. I've seen plenty of them in Europe."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.RATPOISON = "I could've had other uses for it."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.RATPOISONBOTTLE = "An interesting ingredient."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.GASMASK = "I can handle airborne toxins without aid."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.PLAGUEMASK = "I'm flattered."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SPIDERQUEENCORPSE = "Hm, I could see what I can do with it."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.FLAMEGEYSER = "Oh, splendid, lava is being spat everywhere."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.MOCK_DRAGONFLY = "Good heavens! Why is it here?"
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SNOWPILE = "My laboratory cannot be operational if it's covered in snow."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SNOWBALL_THROWABLE = "A child's game. I'm not interested."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SNOWGOGGLES = "The ability to see *may* prove useful."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SHOCKWORM = "Once again, another unexplanable anomaly."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.ZASPBERRY = "It provides an anomalous vigor."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SNOWMONG = "As if I don't have enough predators after me."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.ICEBOOMERANG = "A double-edged sword."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.MINOTAUR_BOULDER = "Something about this design interests me."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.MINOTAUR_BOULDER_BIG = "This brute can be outsmarted, most likely."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.BUSHCRAB = "Oh, hello there."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.TOADLING = "It carries a contagion, but not the disease."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.DISEASECUREBOMB = "It helps me focus on the disease, and not menial yardwork."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SHROOM_SKIN_FRAGMENT = "I'm afraid a piece this size is... less than useful."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SCORPION = "I haven't seen a scorpion in person before my time here."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.AIR_CONDITIONER = "I've learned to simply not pay mind to horrid stenches."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SPOREPACK = "Ah, the amount of instruments I could fit in this."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SALTPACK = "It keeps my operating table free of snow."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.TRAPDOOR = "A simple mound of dirt."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SPIDER_TRAPDOOR = "You chose the wrong being to ambush."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.RAT_TAIL = "What could I possibly do with something like this?"
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.MONSTERSMALLMEAT = "I do not plan to ever be this hungry."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.COOKEDMONSTERSMALLMEAT = "I do not like taking unnecessary chances."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.MONSTERSMALLMEAT_DRIED = "I doubt the toxins are completely gone."
STRINGS.CHARACTERS.PLAGUEDOCTOR.DESCRIBE.SKELETONMEAT = "Unlike the other creatures contained alongside me, I am no savage."
