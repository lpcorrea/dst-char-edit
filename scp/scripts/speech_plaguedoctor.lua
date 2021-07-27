return {

	ACTIONFAIL =
	{
        REPAIR =
        {
            WRONGPIECE = "Sigh, incorrect.",
        },
        BUILD =
        {
            MOUNTED = "I'm too high up, I'm afraid.",
            HASPET = "I already have company.",
        },
		SHAVE =
		{
			AWAKEBEEFALO = "I would rather my bones stay in one piece.",
			GENERIC = "I don't think that'd work.",
			NOBITS = "I've exfoliated all I can, for now.",
		},
		STORE =
		{
			GENERIC = "I'm afraid it wont fit.",
			NOTALLOWED = "That is against the protocol.",
			INUSE = "Oh my, where are my manners?",
		},
        CONSTRUCT =
        {
            INUSE = "Some else has already taken up the responsibility.",
            NOTALLOWED = "That is against the protocol.",
            EMPTY = "I may be anomolous, but I still need materials.",
            MISMATCH = "Oh, goodness, that's wrong.",
        },
		RUMMAGE =
		{	
			GENERIC = "I'm afraid I can't do that.",
			INUSE = "Oh my, where are my manners?",
		},
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "It wont seem to budge... I sense something behind us.",
        	KLAUS = "That thing surely wouldn't allow me to fiddle with it some more.",
			QUAGMIRE_WRONGKEY = "It's not working.",
        },
		ACTIVATE = 
		{
			LOCKED_GATE = "The gate isn't opening, a shame.",
		},
        COOK =
        {
            GENERIC = "My culinarian knowledge is very rusty.",
            INUSE = "Oh, apologies.",
            TOOFAR = "I need to get closer.",
        },
        GIVE =
        {
            GENERIC = "That is against the protocol.",
            DEAD = "I have better use for this, no doubt.",
            SLEEPING = "They're unconcious.",
            BUSY = "They're busy.",
            ABIGAILHEART = "I'm afraid that child will remain alone.",
            GHOSTHEART = "Do you not wish to return? So be it.",
            NOTGEM = "That would be absurdly foolish.",
            WRONGGEM = "I'm afraid it's shape isn't quite right.",
            NOTSTAFF = "That doesn't quite look right.",
            MUSHROOMFARM_NEEDSSHROOM = "It needs a mushroom.",
            MUSHROOMFARM_NEEDSLOG = "It needs a log, presumably.",
            SLOTFULL = "Something's already there.",
            FOODFULL = "There's already a meal there.",
            NOTDISH = "It won't want to eat that.",
            DUPLICATE = "We already know that one.",
            NOTSCULPTABLE = "I'm afraid that's not possible.",
            NOTATRIUMKEY = "Hmm, no, I need something else.",
            CANTSHADOWREVIVE = "It refuses to rise again.",
            WRONGSHADOWFORM = "The anatomy is incorrect.",
            NOMOON = "I'm afraid the moon isn't reaching it.",
			PIGKINGGAME_MESSY = "It's a mess around here.",
			PIGKINGGAME_DANGER = "I need to deal with this first.",
			PIGKINGGAME_TOOLATE = "I'm afraid it's too late for a game.",
        },
        GIVETOPLAYER =
        {
            FULL = "Make some room, if you please.",
            DEAD = "I have better use for this, no doubt.",
            SLEEPING = "They're blessed with free time.",
            BUSY = "Don't be afraid, I'm simply giving you something.",
        },
        GIVEALLTOPLAYER =
        {
            FULL = "Make some room, if you please.",
            DEAD = "I have better use for this, no doubt.",
            SLEEPING = "They're blessed with free time.",
            BUSY = "Don't be afraid, I'm simply giving you something.",
        },
        WRITE =
        {
            GENERIC = "I'm not quite sure what to write.",
            INUSE = "It'd be rude to interrupt them.",
        },
        DRAW =
        {
            NOIMAGE = "I need something to draw, first of all.",
        },
        CHANGEIN =
        {
            GENERIC = "I'm very well fine with my current attire.",
            BURNING = "... No.",
            INUSE = "Take your time.",
        },
        ATTUNE =
        {
            NOHEALTH = "I need more blood for this to work.",
        },
        MOUNT =
        {
            TARGETINCOMBAT = "I'd like my bones to stay intact.",
            INUSE = "I'm not a fan of such crude forms of transportation, anyways.",
        },
        SADDLE =
        {
            TARGETINCOMBAT = "That's a good way to instigate bloodshed.",
        },
        TEACH =
        {
            --Recipes/Teacher
            KNOWN = "Hm, I already know this.",
            CANTLEARN = "Er, this is rather complex.",

            --MapRecorder/MapExplorer
            WRONGWORLD = "This terrain looks foreign.",
        },
        WRAPBUNDLE =
        {
            EMPTY = "I highly doubt a bag of air will be useful.",
        },
        PICKUP =
        {
			RESTRICTION = "I should stick to my expertise.",
			INUSE = "Apologies.",
        },
        SLAUGHTER =
        {
            TOOFAR = "It got away.",
        },
        REPLATE =
        {
            MISMATCH = "It needs another type of dish.", 
            SAMEDISH = "I only need to use one dish.", 
        },
        SAIL =
        {
        	REPAIR = "It looks well enough.",
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "I'm being too hasty.",
            BAD_TIMING1 = "Slower strokes...",
            BAD_TIMING2 = "Sigh...",
        },
        BATHBOMB =
        {
            GLASSED = "I need to break the glass above it.",
            ALREADY_BOMBED = "A waste of resources.",
        },
	},
	ACTIONFAIL_GENERIC = "I'm afraid I can't do that.",
	ANNOUNCE_BOAT_LEAK = "Oh my, this vessel is in dire need of repairs.",
	ANNOUNCE_BOAT_SINK = "We must abandon this vessel!",
	ANNOUNCE_DIG_DISEASE_WARNING = "This labor is annoying, more so than anything else.",
	ANNOUNCE_PICK_DISEASE_WARNING = "... No, that isn't the disease I speak of.",
	ANNOUNCE_ADVENTUREFAIL = "I will endure a thousand deaths before I yield.",
    ANNOUNCE_MOUNT_LOWHEALTH = "I'm afraid this beast will not go on much longer.",
	ANNOUNCE_BEES = "Bothersome pests.",
	ANNOUNCE_BOOMERANG = "Ergh!",
	ANNOUNCE_CHARLIE = "Oh dear...",
	ANNOUNCE_CHARLIE_ATTACK = "Ergh! A Haunter in the Darkness!",
	ANNOUNCE_COLD = "Ice is... forming...",
	ANNOUNCE_HOT = "The day is breaking me...",
	ANNOUNCE_CRAFTING_FAIL = "I'm afraid I'm missing something.",
	ANNOUNCE_DEERCLOPS = "Oh dear...",
	ANNOUNCE_CAVEIN = "Oh my, mind your head.",
	ANNOUNCE_ANTLION_SINKHOLE = 
	{
		"Oh, an earthquake?",
		"The ground is cracking.",
		"Oh dear, the ground is unstable.",
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "If you may, stop your needless harassment.",
        "I urge you to stop this destruction.",
        "You very well don't deserve this.",
	},
	ANNOUNCE_SACREDCHEST_YES = "Ah, a welcome turn of luck.",
	ANNOUNCE_SACREDCHEST_NO = "Everything is my opposition, it seems.",
	ANNOUNCE_DUSK = "A-Tishoo, A-Tishoo, we all fall down.",
	ANNOUNCE_EAT =
	{
		GENERIC = "Hm.",
		PAINFUL = "Oh good heavens, that was not edible.",
		SPOILED = "I am definitely falling ill.",
		STALE = "Hmph, stale.",
		INVALID = "That is simply not edible.",
		YUCKY = "No.",
	},
    ANNOUNCE_ENCUMBERED =
    {
        "Ergh...",
        "I am not... suited... for this...",
        "Why must... I... do this...",
        "Why cant... my patients... do this for me?",
        "I mourn... for my bones...",
    },
    ANNOUNCE_ATRIUM_DESTABILIZING = 
    {
		"Oh my, that's our queue to leave.",
		"It is time to leave.",
		"Good heavens, time to go.",
	},
    ANNOUNCE_RUINS_RESET = "Everything has regenerated... How useful.",
    ANNOUNCE_SNARED = "I will not be contained for long.",
    ANNOUNCE_REPELLED = "Stop delaying your demise.",
	ANNOUNCE_ENTER_DARK = "...",
	ANNOUNCE_ENTER_LIGHT = "It's bright enough to operate.",
	ANNOUNCE_FREEDOM = "No time to celebrate, I need to get to work.",
	ANNOUNCE_HIGHRESEARCH = "Knowledge is power, after all.",
	ANNOUNCE_HOUNDS = "Why must my work be constantly interrupted?",
	ANNOUNCE_WORMS = "Another obstacle?",
	ANNOUNCE_HUNGRY = "The feeling of famine is becoming immensely distracting.",
	ANNOUNCE_HUNT_BEAST_NEARBY = "I hear you breathing.",
	ANNOUNCE_HUNT_LOST_TRAIL = "I will find you, next time.",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "The ground is too damp, what a shame.",
	ANNOUNCE_INV_FULL = "Oh my, I'm out of space.",
	ANNOUNCE_KNOCKEDOUT = "Dear, my head is pounding.",
	ANNOUNCE_LOWRESEARCH = "That wasn't all that beneficial.",
	ANNOUNCE_MOSQUITOS = "Pests.",
    ANNOUNCE_NOWARDROBEONFIRE = "I'll pass.",
    ANNOUNCE_NODANGERGIFT = "I doubt these monsters will let me open this.",
    ANNOUNCE_NOMOUNTEDGIFT = "I'm too high up, I'm afraid.",
	ANNOUNCE_NODANGERSLEEP = "I need to deal with this, first.",
	ANNOUNCE_NODAYSLEEP = "I cannot rest, I have a cure to research.",
	ANNOUNCE_NODAYSLEEP_CAVE = "I have things to do.",
	ANNOUNCE_NOHUNGERSLEEP = "Famine is rather... bothersome.",
	ANNOUNCE_NOSLEEPONFIRE = "Er, I'll pass.",
	ANNOUNCE_NODANGERSIESTA = "I need to deal with this, first.",
	ANNOUNCE_NONIGHTSIESTA = "I don't think that's the correct use for this.",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "I cannot rest, I have a cure to research.",
	ANNOUNCE_NOHUNGERSIESTA = "Famine is rather... bothersome.",
	ANNOUNCE_NODANGERAFK = "I'm afraid that's not possible.",
	ANNOUNCE_NO_TRAP = "Sigh, a welcome relief.",
	ANNOUNCE_PECKED = "Er-! I will not tolerate this behavior.",
	ANNOUNCE_QUAKE = "Oh my, an earthquake.",
	ANNOUNCE_RESEARCH = "That was beneficial.",
	ANNOUNCE_SHELTER = "The tree is providing sub-par protection.",
	ANNOUNCE_THORNS = "Ergh!",
	ANNOUNCE_BURNT = "Good heavens, I need a tool for this.",
	ANNOUNCE_TORCH_OUT = "One more light has been extinguished.",
	ANNOUNCE_THURIBLE_OUT = "I'm afraid that this thing has run out of fuel.",
	ANNOUNCE_FAN_OUT = "I cannot expect much out of a toy.",
    ANNOUNCE_COMPASS_OUT = "This contraption is broken, I believe.",
	ANNOUNCE_TRAP_WENT_OFF = "Oh?",
	ANNOUNCE_UNIMPLEMENTED = "Er, what is this...?",
	ANNOUNCE_WORMHOLE = "I have a migraine setting in...",
	ANNOUNCE_TOWNPORTALTELEPORT = "Hello.",
	ANNOUNCE_CANFIX = "\nIt's repairable, I believe.",
	ANNOUNCE_ACCOMPLISHMENT = "This feels like a waste of time.",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "That was... not worth it.",	
	ANNOUNCE_INSUFFICIENTFERTILIZER = "It still doesn't look right.",
	ANNOUNCE_TOOL_SLIP = "Oh! My tool has slipped.",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "Oh! ... Ahem.",
	ANNOUNCE_TOADESCAPING = "It's leaving.",
	ANNOUNCE_TOADESCAPED = "I'm afraid it has escaped us.",

	ANNOUNCE_DAMP = "It is simply water, I'll be fine. ",
	ANNOUNCE_WET = "The water is seeping through my garments onto my supplies.",
	ANNOUNCE_WETTER = "My wet garments are very uncomfortable.",
	ANNOUNCE_SOAKED = "Not a spot on my person is dry.",


    ANNOUNCE_DESPAWN = "No, NO! My work... it's not..",
	ANNOUNCE_BECOMEGHOST = "oOooOooo!!",
	ANNOUNCE_GHOSTDRAIN = "My humanity is about to start slipping away...",
	ANNOUNCE_PETRIFED_TREES = "Interesting.",
	ANNOUNCE_KLAUS_ENRAGE = "Let's not kill ourselves. Time to leave.",
	ANNOUNCE_KLAUS_UNCHAINED = "Oh, pleasant.",
	ANNOUNCE_KLAUS_CALLFORHELP = "Good heavens, it has company.",

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "Interesting, I see something inside.",
		GLASS_LOW = "It's almost out.",
		GLASS_REVEAL = "And, there we go.",
		IDOL_MED = "Interesting, I see something inside.",
		IDOL_LOW = "It's almost out.",
		IDOL_REVEAL = "And, there we go.",
		SEED_MED = "Interesting, I see something inside.",
		SEED_LOW = "It's almost out.",
		SEED_REVEAL = "And, there we go.",
	},

    --hallowed nights
    ANNOUNCE_SPOOKED = "Ergh...",
	ANNOUNCE_BRAVERY_POTION = "They are simply harmless bats.",

	--winter's feast
	ANNOUNCE_EATING_NOT_FEASTING = "I myself do not need *this* much food.",
	ANNOUNCE_WINTERS_FEAST_BUFF = "Perhaps the holidays have a use after all.",
	ANNOUNCE_IS_FEASTING = "A lovely meal. It's putting me in the right mind for operation.",
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "Whatever happened to me, it has passed.",

    --lavaarena event
    ANNOUNCE_REVIVING_CORPSE = "Do not be afraid, I am the cure.",
    ANNOUNCE_REVIVED_OTHER_CORPSE = "I have restrained myself from further operation.",
    ANNOUNCE_REVIVED_FROM_CORPSE = "You have my gratitude.",

    ANNOUNCE_FLARE_SEEN = "Oh, is that... a flare, perhaps?",
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "Oh dear, something's in the water.",

    --quagmire event
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "I am not the best culinarian in the world, apologies.",
    QUAGMIRE_ANNOUNCE_MEALBURNT = "Good heavens, I burnt it.",
    QUAGMIRE_ANNOUNCE_LOSE = "No...",
    QUAGMIRE_ANNOUNCE_WIN = "I do not wish to linger here any longer.",

    ANNOUNCE_ROYALTY =
    {
        "...",
        "...",
        "...",
    },

    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "Electroconvulsive therapy has never been easier.",
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "A simple touch won't always solve my problems.",
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "Running will be your only resort.",
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "Oh, a spring in my step?",
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "One less annoyance out of the way.",
    
    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "Hm, back to my normal self.",
    ANNOUNCE_DETACH_BUFF_ATTACK            = "I am not one for needless violence.",
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "Overestimating yourself is a road to death.",
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "I believe that was a satisfactory work day.",
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "My person is permeable again.",
    
	ANNOUNCE_OCEANFISHING_LINESNAP = "Oh! Sigh.",
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "Now to reel it in.",
	ANNOUNCE_OCEANFISHING_GOTAWAY = "Sigh, I do *not* want to be here.",
	ANNOUNCE_OCEANFISHING_BADCAST = "No.",
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE = 
	{
		"Sigh...",
		"I have a disease to cure, why am I here...?",
		"Way, hay, and up she rises...",
		"Hmph.",
	},

	ANNOUNCE_WEIGHT = "Weight: {weight}",

	BATTLECRY =
	{
		GENERIC = "I am the cure.",
		PIG = "Do not be afraid.",
		PREY = "Stop resisting.",
		SPIDER = "Bothersome pest.",
		SPIDER_WARRIOR = "You simply need to go.",
		DEER = "Stop resisting.",
	},
	COMBAT_QUIT =
	{
		GENERIC = "You won't survive our next encounter.",
		PIG = "You won't survive our next encounter.",
		PREY = "I need to try a different approach.",
		SPIDER = "You simply aren't worth my time.",
		SPIDER_WARRIOR = "You simply aren't worth my time.",
	},
	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "I cannot return to the Foundation, for now.",
        MULTIPLAYER_PORTAL_MOONROCK = "Should I return to the Foundation?",
        MOONROCKIDOL = "I'm afraid this is a one-way ticket.",
        CONSTRUCTION_PLANS = "This is mandatory for a project like this.",

        ANTLION =
        {
            GENERIC = "Are you the one causing this weather?",
            VERYHAPPY = "It seems to be in a joyful mood.",
            UNHAPPY = "Are you expecting something of me?",
        },
        ANTLIONTRINKET = "I can't imagine much use I can personally have for this.",
        SANDSPIKE = "Good heavens!",
        SANDBLOCK = "Well then, now you're trapped in here with me.",
        GLASSSPIKE = "That would've been a painful way to go.",
        GLASSBLOCK = "Fascinating.",
        ABIGAIL_FLOWER =
        {
            GENERIC ="So, this flower is the vessel for a human soul?",
            LONG = "I have no time to apprieciate beauty.",
            MEDIUM = "... I sense something from within this flower.",
            SOON = "A human spirit? Interesting.",
            HAUNTED_POCKET = "I believe it's trying to get out.",
            HAUNTED_GROUND = "I believe one of my patients may complete the ritual.",
        },

        BALLOONS_EMPTY = "It's cheeriness is extremely out of place here.",
        BALLOON = "It sticks out like a sore thumb.",

        BERNIE_INACTIVE =
        {
            BROKEN = "It doesn't look completely unrepairable.",
            GENERIC = "This stuffed bear is seemingly burnt in several places.",
        },

        BERNIE_ACTIVE = "Be wary, It may take an ear.", --SCP-1048 reference
        BERNIE_BIG = "I... Er... I give up.",

        BOOK_BIRDS = "It's always nice to sit down and read a book.",
        BOOK_TENTACLES = "I believe this one is quite dangerous.",
        BOOK_GARDENING = "I'm afraid I lack the knowledge to wield it's power.",
        BOOK_SLEEP = "It's just page after page of Special Containment Procedures...",
        BOOK_BRIMSTONE = "It does not contain knowledge I require.",

        PLAYER =
        {
            GENERIC = "Greetings.",
            ATTACKER = "...",
            MURDERER = "Oh my, yet another victim of the disease.",
            REVIVER = "Your contributions are very much welcome.",
            GHOST = "Oh dear, you've seen better days.",
            FIRESTARTER = "What are you up to?",
        },
        WILSON =
        {
            GENERIC = "Greetings, good sir.",
            ATTACKER = "...",
            MURDERER = "You are sick, good sir. I am here to cure you.",
            REVIVER = "Perhaps your meddling with science has proven useful.",
            GHOST = "What an off-putting sight.",
            FIRESTARTER = "Have you lost your mind?",
        },
        WOLFGANG =
        {
            GENERIC = "Hello.",
            ATTACKER = "...",
            MURDERER = "The disease flows through your veins.",
            REVIVER = "You have my thanks for your contributions.",
            GHOST = "Oh dear, it seems that you've met your match.",
            FIRESTARTER = "It is foolish to control flame.",
        },
        WAXWELL =
        {
            GENERIC = "It's hard to control myself, with so much of the disease within you...",
            ATTACKER = "...",
            MURDERER = "You have been spreading the disease for far too long. This ends now.",
            REVIVER = "I still find it hard to resist the urge.",
            GHOST = "He no longer spreads the disease.",
            FIRESTARTER = "My patience is starting to grow thin.",
        },
        WX78 =
        {
            GENERIC = "What a remarkable machine.",
            ATTACKER = "...",
            MURDERER = "The machine appears to have gone rogue.",
            REVIVER = "... Interesting.",
            GHOST = "So, it has no soul, but... Err...?",
            FIRESTARTER = "This thing is starting to become a liability.",
        },
        WILLOW =
        {
            GENERIC = "Hello there, dear.",
            ATTACKER = "...",
            MURDERER = "Like wildfire, the disease spreads.",
            REVIVER = "She's pulling her weight.",
            GHOST = "Oh, that's a shame.",
            FIRESTARTER = "Sigh.",
        },
        WENDY =
        {
            GENERIC = "Hello, child.",
            ATTACKER = "...",
            MURDERER = "You are ill, child. Come here.",
            REVIVER = "I'm guessing she doesnt want another spirit on her hands.",
            GHOST = "Oh my, now she's similar to her sister.",
            FIRESTARTER = "I am dissapointed.",
        },
        WOODIE =
        {
            GENERIC = "Hello, sir.",
            ATTACKER = "...",
            MURDERER = "You are the one I least expected to fall ill.",
            REVIVER = "This man is a delight to be around.",
            GHOST = "Oh my, I should take care of that.",
            BEAVER = "Oh! ...Oh?",
            BEAVERGHOST = "You have a large amount of explaining to do.",
            FIRESTARTER = "Aren't your actions counter-intuitive?",
        },
        WICKERBOTTOM =
        {
            GENERIC = "Greetings, ma'am.",
            ATTACKER = "...",
            MURDERER = "You will suffer from the disease no longer.",
            REVIVER = "You have my gratitude.",
            GHOST = "I'm afraid this was inevitable.",
            FIRESTARTER = "Why would you, of all people, set something alight?",
        },
        WES =
        {
            GENERIC = "Hello.",
            ATTACKER = "...",
            MURDERER = "You are terribly sick, sir. Come here.",
            REVIVER = "I had my doubts about him, but no longer.",
            GHOST = "I'm not sure what I expected.",
            FIRESTARTER = "Your appearance is a facade, it seems.",
        },
        WEBBER =
        {
            GENERIC = "Hello there, child.",
            ATTACKER = "...",
            MURDERER = "As much as I would rather not do this, you need to be cured.",
            REVIVER = "A child's spirit is so innocent. So pure.",
            GHOST = "That's a rough sight.",
            FIRESTARTER = "Silk is flammable, is it not?",
        },
        WATHGRITHR =
        {
            GENERIC = "Greetings, miss.",
            ATTACKER = "...",
            MURDERER = "The disease within her flows like a river.",
            REVIVER = "Perhaps she truly is in touch with spirits.",
            GHOST = "What is this \"Valhalla\" you speak of?",
            FIRESTARTER = "You'd better stop if you want to live.",
        },
        WINONA =
        {
            GENERIC = "Greetings, ma'am.",
            ATTACKER = "...",
            MURDERER = "I'm afraid another one has fallen ill.",
            REVIVER = "She cares for the ones around her.",
            GHOST = "Im assuming this was some sort of malfunction?",
            FIRESTARTER = "Your mechanations are flammable, are they not?",
        },
        WORTOX =
        {
            GENERIC = "Hello there, creature.",
            ATTACKER = "...",
            MURDERER = "A harbringer of disease.",
            REVIVER = "Hmm, so it's pure after all.",
            GHOST = "A soul for a soul, perhaps?",
            FIRESTARTER = "It's a liability, more than anything.",
        },

        MIGRATION_PORTAL =
        {
            GENERIC = "If I had any friends, this could take me to them.",
            OPEN = "If I step through, will I still be me?",
            FULL = "It seems to be popular over there.",
        },
        GLOMMER = "It serves as a decent lab assistant, if not just to keep me company.",
        GLOMMERFLOWER =
        {
            GENERIC = "I wish I had time to appreciate beauty.",
            DEAD = "That smell is horrendous.",
        },
        GLOMMERWINGS = "It's hard to imagine a practical use for these.",
        GLOMMERFUEL = "It looks particularly flammable.",
        BELL = "It has the numbers \"513\" etched on to it.", 
        STATUEGLOMMER =
        {
            GENERIC = "Personally, I'm not one for abstract art.",
            EMPTY = "I guess it was worth it.",
        },

        LAVA_POND_ROCK = "I don't see a reason to pick that up.",

		WEBBERSKULL = "Certainly not the best way to go.",
		WORMLIGHT = "Looks delicious.",
		WORMLIGHT_LESSER = "A rather convienent light.",
		WORM =
		{
		    PLANT = "A rather convienent light.",
		    DIRT = "An unremarkable mound of dirt.",
		    WORM = "Oh, I have been decieved.",
		},
        WORMLIGHT_PLANT = "A rather convienent light.",
		MOLE =
		{
			HELD = "I need to take extreme care not to accidentally kill it.",
			UNDERGROUND = "It's some sort of burrowing animal.",
			ABOVEGROUND = "Hello.",
		},
		MOLEHILL = "It would be a shame to trip on that hole.",
		MOLEHAT = "Darkness no longer opposes me.",

		EEL = "Don't these sting?",
		EEL_COOKED = "Hmm, I guess these are not the electric kind.",
		UNAGI = "Rather exotic, by my tastes.",
		EYETURRET = "It may help me advance the cure unimpeded.",
		EYETURRET_ITEM = "Rather heavy, unsurprisingly.",
		MINOTAURHORN = "I. Am. The cure.",
		MINOTAURCHEST = "Let's hope this makes it worth while.",
		THULECITE_PIECES = "These pieces are too broken to use.",
		POND_ALGAE = "Unremarkable.",
		GREENSTAFF = "Like many things, the way it works is a mystery.",
		GIFT = "I'm normally not one for festivities.",
        GIFTWRAP = "The Pestilence is amok, I unfortunately cannot participate.",
		POTTEDFERN = "A welcome sight, to be sure.",
        SUCCULENT_POTTED = "It brings a welcome touch of civility.",
		SUCCULENT_PLANT = "This new flora is surely exotic.",
		SUCCULENT_PICKED = "It's certainly not the best light snack.",
		SENTRYWARD = "Nothing shall escape my gaze.",
        TOWNPORTAL =
        {
			GENERIC = "A nice luxury to have.",
			ACTIVE = "It is ready.",
		},
        TOWNPORTALTALISMAN = 
        {
			GENERIC = "It's certainly faster than walking.",
			ACTIVE = "Sigh. I suppose I have nothing to lose.",
		},
        WETPAPER = "You can barely do anything with it without the paper ripping.",
        WETPOUCH = "I am astonished that it's still in one piece.",
        MOONROCK_PIECES = "Hmm, strange.",
        MOONBASE =
        {
            GENERIC = "There's a hole in the middle for something to go in.",
            BROKEN = "Like anything else, it is repairable with enough effort.",
            STAFFED = "Now what?",
            WRONGSTAFF = "I have a distinct feeling this isn't right.",
            MOONSTAFF = "I have concluded that the moon itself is an anomaly.",
        },
        MOONDIAL = 
        {
			GENERIC = "Shouldn't we be able to simply look up?",
			NIGHT_NEW = "It appears to reflect a new moon.",
			NIGHT_WAX = "It appears to reflect a waxing moon.",
			NIGHT_FULL = "It reflects the light of a full moon.",
			NIGHT_WANE = "It appears to reflect a waning moon.",
			CAVE = "Why was this built down here?",
        },
 		--MOWER = "I like the cut of this blade.",
		--MACHETE = "I like the cut of this blade.",
		--GOLDENMACHETE = "Hack in style!",
		--OBSIDIANMACHETE = "It's hot to the touch.",
		--BOOK_METEOR = "The foreword just says \"Hope you like dragoons.\"",
		THULECITE = "Hmm, heavy. I presume I can use this.",
		ARMORRUINS = "It proves difficult to penetrate. A perfect armor piece.",
		ARMORSKELETON = "A tad cramped, but the mere power makes up for it.",
		SKELETONHAT = "With this on, the world respects me.",
		RUINS_BAT = "I have no need for such a brutish weapon.",
		RUINSHAT = "I'm not one to wear a crown.",
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "Nothing remarkable.",
            WARN = "Something is happening.",
            WAXING = "It is reaching a climax.",
            STEADY = "It is rising no longer.",
            WANING = "It's on it's way out.",
            DAWN = "It's almost gone.",
            NOMAGIC = "A mere paperweight, at the moment.",
		},
		BISHOP_NIGHTMARE = "Oh my, that's frightening.",
		ROOK_NIGHTMARE = "I need to be smart with this one.",
		KNIGHT_NIGHTMARE = "It's a nightmare down here.",
		MINOTAUR = "And here it is, the fabled minotaur of the labyrinth.",
		SPIDER_DROPPER = "I need to watch my step.",
		NIGHTMARELIGHT = "Im not sure why, but looking at it gives me a headache.",
		NIGHTSTICK = "I'm not sure what this is.",
		GREENGEM = "With power like this, the laws of physics be damned.",
		MULTITOOL_AXE_PICKAXE = "I should've thought of this sooner.",
		ORANGESTAFF = "And for my patients, no more running from the cure.",
		YELLOWAMULET = "My most important garment.",
		GREENAMULET = "Time to throw the laws of physics out the window.",
		SLURPERPELT = "It's... Hmm... No, it's dead.",	

		SLURPER = "It's... I... Have no words to describe what that is.",
		SLURPER_PELT = "It's... Hmm... No, it's dead.",
		ARMORSLURPER = "Oh, I'd much rather not wear this.",
		ORANGEAMULET = "It's convienent, to say the least.",
		YELLOWSTAFF = "Wouldn't the Foundation love to get their hands on this.",
		YELLOWGEM = "It's faintly glowing.",
		ORANGEGEM = "I'm not quite sure what to think of it.",
        OPALSTAFF = "The summer heat will not stop the cure's progress.",
        OPALPRECIOUSGEM = "It seems that it has no practical use removed from it's staff.",
        TELEBASE = 
		{
			VALID = "It's fully stocked.",
			GEMS = "It requires energy to activate.",
		},
		GEMSOCKET = 
		{
			VALID = "It's a seemingly perfect fit. Excellent.",
			GEMS = "It appears that one of those gems fits here.",
		},
		STAFFLIGHT = "Useful, but also a fire hazard.",
        STAFFCOLDLIGHT = "Perhaps I should look further into magic...",

        ANCIENT_ALTAR = "I will do what I must, the cure must progress.",

        ANCIENT_ALTAR_BROKEN = "I believe it's made of the same material I've seen scattered around here.",

        ANCIENT_STATUE = "They tell a tale of woe, another kingdom fallen in the wake of the Pestilence.",

        LICHEN = "These look edible, barely.",
		CUTLICHEN = "It's already decaying.",

		CAVE_BANANA = "It's a welcome change from the usual food I find.",
		CAVE_BANANA_COOKED = "A delightful sweet, compared to everything else.",
		CAVE_BANANA_TREE = "How does this grow, down here?",
		ROCKY = "It is a living rock. How strange.",
		
		COMPASS =
		{
			GENERIC="I'm not well-versed in this contraption.",
			N = "North.",
			S = "South.",
			E = "East.",
			W = "West.",
			NE = "Northeast.",
			SE = "Southeast.",
			NW = "Northwest.",
			SW = "Southwest.",
		},

        HOUNDSTOOTH = "It's practically razor-sharp.",
        ARMORSNURTLESHELL = "I have no inclination to wear such clothing.",
        BAT = "A flying pest.",
        BATBAT = "Holding this feels... invigorating...",
        BATWING = "Flight was always an interesting topic for experimentation.",
        BATWING_COOKED = "Hmm, I don't see why it wouldn't be edible.",
        BATCAVE = "I see no reason to disturb them.",
        BEDROLL_FURRY = " I must not rest in the face of the Pestilence.",
        BUNNYMAN = "My vetinary skills are rudamentary, but I could make do with them.",
        FLOWER_CAVE = "That's rather convienent.",
        GUANO = "Pleasant...",
        LANTERN = "The Pestilence does not cease with the time of day.",
        LIGHTBULB = "It looks... strangely edible.",
        MANRABBIT_TAIL = "Unfortunately, it's the foot that brings good luck. According to myth, at least.",
        MUSHROOMHAT = "I have no use for such headwear.",
        MUSHROOM_LIGHT2 =
        {
            ON = "The blue lighting is very soothing.",
            OFF = "It's a nice luxury to have light that isn't fire for a change.",
            BURNT = "Sigh.",
        },
        MUSHROOM_LIGHT =
        {
            ON = "It's bright enough to do it's job.",
            OFF = "It's a nice luxury to have light that isn't fire for a change.",
            BURNT = "Sigh.",
        },
        SLEEPBOMB = "One last slumber in wake of your cure.",
        MUSHROOMBOMB = "Oh dear, that's going to become a problem.",
        SHROOM_SKIN = "Now, let's hope this was worth the trouble.",
        TOADSTOOL_CAP =
        {
            EMPTY = "How deep is it?",
            INGROUND = "Now, what could this be?",
            GENERIC = "It's severely out of place.",
        },
        TOADSTOOL =
        {
            GENERIC = "You will fall just as easily as the others.",
            RAGE = "Good heavens!",
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "It peaks my curiosity.",
            BURNT = "I suppose we'll never know what it is.",
        },
        MUSHTREE_TALL =
        {
            GENERIC = "It's a rather tall mushroom.",
            BLOOM = "The scent is unpleasant.",
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "The stem looks like it can be felled with an axe.",
            BLOOM = "I need to pay mind not to breathe in the spores.",
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "What a peculiar mushroom.",
            BLOOM = "The spores are a means of reproduction, if i remember correctly.",
        },
        MUSHTREE_TALL_WEBBED = "Infested. Lovely.",
        SPORE_TALL =
        {
            GENERIC = "It goes where the wind takes it.",
            HELD = "It's polluting my doctor bag.",
        },
        SPORE_MEDIUM =
        {
            GENERIC = "It goes where the wind takes it.",
            HELD = "It's polluting my doctor bag.",
        },
        SPORE_SMALL =
        {
            GENERIC = "It goes where the wind takes it.",
            HELD = "It's polluting my doctor bag.",
        },
        RABBITHOUSE =
        {
            GENERIC = "It's comedic, I'll give it that.",
            BURNT = "It has the smell of burnt wood. I'm not sure what I expected.",
        },
        SLURTLE = "Egh, a slimey creature.",
        SLURTLE_SHELLPIECES = "Too much force was used.",
        SLURTLEHAT = "I never thought I'd see myself like this...",
        SLURTLEHOLE = "Sanitary concerns aside, this may have a few uses.",
        SLURTLESLIME = "Flammable.",
        SNURTLE = "That one wears a distinctly different shell.",
        SPIDER_HIDER = "It's shell requires me to apply brute force.",
        SPIDER_SPITTER = "This one's rather annoying.",
        SPIDERHOLE = "This rock formation has been here for a very, very long time.",
        SPIDERHOLE_ROCK = "This rock formation has been here for a very, very long time.",
        STALAGMITE = "Unremarkable.",
        STALAGMITE_TALL = "Unremarkable.",
        TREASURECHEST_TRAP = "Hmm...",

        TURF_CARPETFLOOR = "This would go well with a lounge of sorts.",
        TURF_CHECKERFLOOR = "Flooring for the Foundation.",
        TURF_DIRT = "Hmm, yes, this is dirt.",
        TURF_FOREST = "A part of the earth.",
        TURF_GRASS = "A part of the earth.",
        TURF_MARSH = "A part of the earth.",
        TURF_METEOR = "I should look further into this.",
        TURF_PEBBLEBEACH = "It's tropical, and lunar at the same time.",
        TURF_ROAD = "They're easy to walk on... Yes, I'm aware that makes no sense.",
        TURF_ROCKY = "A part of the earth.",
        TURF_SAVANNA = "A part of the earth.",
        TURF_WOODFLOOR = "This is rather high-quality for a place such as this.",

		TURF_CAVE="A part of the earth.",
		TURF_FUNGUS="A part of the earth.",
		TURF_SINKHOLE="A part of the earth.",
		TURF_UNDERROCK="A part of the earth.",
		TURF_MUD="A part of the earth.",

		TURF_DECIDUOUS = "A part of the earth.",
		TURF_SANDY = "A part of the earth.",
		TURF_BADLANDS = "A part of the earth.",
		TURF_DESERTDIRT = "A part of the earth.",
		TURF_FUNGUS_GREEN = "A part of the earth.",
		TURF_FUNGUS_RED = "A part of the earth.",
		TURF_DRAGONFLY = "I presume it absorbs the fire around it?",

		POWCAKE = "That does not look at all appetizing.",
        CAVE_ENTRANCE = "That rock looks rather out of place.",
        CAVE_ENTRANCE_RUINS = "It's probably hiding something.",
       
       	CAVE_ENTRANCE_OPEN = 
        {
            GENERIC = "I'm having second thoughts.",
            OPEN = "I'm well versed in darkness, I'll be fine.",
            FULL = "I can sense the sheer amount of people down there.",
        },
        CAVE_EXIT = 
        {
            GENERIC = "I'm fine down here.",
            OPEN = "I can't stay down here forever, despite how much it pleases me.",
            FULL = "I can sense the sheer amount of people up there.",
        },

		MAXWELLPHONOGRAPH = "I'm more of a classical music person, myself.",
		BOOMERANG = "It has a learning curve, but it may prove useful.",
		PIGGUARD = "Oh my, yet another victim of the disease.",
		ABIGAIL = "It's a human spirit... with a flower on it's head...",
		ADVENTURE_PORTAL = "Eh-! I- Oh my! The epicenter of the disease!",
		AMULET = "Not even death will cease my cure.",
		ANIMAL_TRACK = "I will find you.",
		ARMORGRASS = "Do not underestimate it.",
		ARMORMARBLE = "As if speed wasn't already an issue for me.",
		ARMORWOOD = "It's very uncomfortable, but unfortunately, I need it.",
		ARMOR_SANITY = "I will embrace these shadows. For the cure.",
		ASH =
		{
			GENERIC = "The outcome of flame.",
			REMAINS_GLOMMERFLOWER = "The outcome of flame.",
			REMAINS_EYE_BONE = "The outcome of flame.",
			REMAINS_THINGIE = "The outcome of flame.",
		},
		AXE = "It's a tool for felling trees. It could double as a weapon.",
		BABYBEEFALO = 
		{
			GENERIC = "Children should not witness the horrors of this world.",
		    SLEEPING = "Sleep well, child.",
        },
        BUNDLE = "A good use of space, to be sure.",
        BUNDLEWRAP = "It allows more efficent use of space.",
		BACKPACK = "For when my garments can hold no more.",
		BACONEGGS = "It puts me in a good mindset to operate.",
		BANDAGE = "I will inevitably need this.",
		BASALT = "This rock isn't moving any time soon.",
		BEARDHAIR = "Goodness, thats... rather unpleasant.",
		BEARGER = "It's hide is too thick to easily slay.",
		BEARGERVEST = "If I must research in the dead of winter, so be it.",
		ICEPACK = "The Pestilence demands me to stay mobile.",
		BEARGER_FUR = "It's a handful of dense fur.",
		BEDROLL_STRAW = "I'd much rather simply not rest.",
		BEEQUEEN = "That is a face to involuntarily remember.",
		BEEQUEENHIVE = 
		{
			GENERIC = "I'll just go around it.",
			GROWING = "Oh, is that... growing?",
		},
        BEEQUEENHIVEGROWN = "I can sense something within. Something big.",
        BEEGUARD = "I'm afraid that fur won't save you.",
        HIVEHAT = "I could see this as an SCP object.",
        MINISIGN =
        {
            GENERIC = "It's a surprisingly well-drawn replica.",
            UNDRAWN = "At the moment, it's simply a tripping hazard.",
        },
        MINISIGN_ITEM = "It's a ground marker. To mark things... On the ground.",
		BEE =
		{
			GENERIC = "I don't see a reason to bother it.",
			HELD = "I could use that stinger as a needle, perhaps.",
		},
		BEEBOX =
		{
			READY = "It is at it's capacity.",
			FULLHONEY = "It is at it's capacity.",
			GENERIC = "Personally, I don't really care for the taste of honey.",
			NOHONEY = "I have better things to do.",
			SOMEHONEY = "I need to come back later.",
			BURNT = "Tsk, tsk.",
		},
		MUSHROOM_FARM =
		{
			STUFFED = "I don't think there's room for any more.",
			LOTS = "Perhaps I should care to that soon.",
			SOME = "Ah, there it goes.",
			EMPTY = "At the moment, it's merely a tripping hazard.",
			ROTTEN = "It appears that the log has expired.",
			BURNT = "Well, now it's useless.",
			SNOWCOVERED = "Sigh, the cold has taken over.",
		},
		BEEFALO =
		{
			FOLLOWER = "It's staring at me, intensely.",
			GENERIC = "Despite it's size, I believe my touch will be sufficient enough.",
			NAKED = "It's cruel, but necessary.",
			SLEEPING = "It's unconcious.",
            --Domesticated states:
            DOMESTICATED = "This one smells, dare I say, pleasant.",
            ORNERY = "It has a face of anger.",
            RIDER = "I never thought I'd see myself using such modes of transportation.",
            PUDGY = "It may have been over-fed.",
		},

		BEEFALOHAT = "It's almost tribal in design.",
		BEEFALOWOOL = "What unsanitary things I must do for progress.",
		BEEHAT = "The netting is inpenetrable to stingers.",
        BEESWAX = "Isn't this some sort of preservative?",
		BEEHIVE = "I see no reason to disturb it.",
		BEEMINE = "It's an interesting way to weaponize animals.",
		BEEMINE_MAXWELL = "Bottled mosquito rage!",
		BERRIES = "A light snack.",
		BERRIES_COOKED = "Well, now I've just made a mess of things.",
        BERRIES_JUICY = "It has a distinctly sweet taste.",
        BERRIES_JUICY_COOKED = "It's already decomposing.",
		BERRYBUSH =
		{
			BARREN = "Oh, joy, it needs to be fertilized.",
			WITHERED = "The heat is killing it.",
			GENERIC = "Red usually indicates poison, does it not?",
			PICKED = "Give it time.",
			DISEASED = "*This* disease is foreign to me.",
			DISEASING = "Good heavens, what is that stench?",
			BURNING = "Well, there goes that bush.",
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "Oh, joy, it needs to be fertilized.",
			WITHERED = "This heat is relentless.",
			GENERIC = "Oh, how fruitful.",
			PICKED = "Give it time.",
			DISEASED = "*This* design is foreign to me.",
			DISEASING = "Good heavens, what is that stench?",
			BURNING = "Well, that's a waste.",
		},
		BIGFOOT = "Oh, I know this one. SCP-... er... 1000?",
		BIRDCAGE =
		{
			GENERIC = "A containment cell, for birds.",
			OCCUPIED = "In a twist of events, now I'm the captor.",
			SLEEPING = "It's taking a well-deserved rest.",
			HUNGRY = "It hasn't been fed in a good while.",
			STARVING = "It desperately needs food.",
			DEAD = "It's not moving, It's dead.",
			SKELETON = "Good heavens, I need to clean that out.",
		},
		BIRDTRAP = "I've heard that my form is associated with birds.",
		CAVE_BANANA_BURNT = "What a waste of a finite resource.",
		BIRD_EGG = "It's just an egg.",
		BIRD_EGG_COOKED = "It feels wrong to eat all on it's own.",
		BISHOP = "A mechanical, religious figure.",
		BLOWDART_FIRE = "I don't have an inclination to use this.",
		BLOWDART_SLEEP = "Now nobody can run from the cure.",
		BLOWDART_PIPE = "For when a patient is just out of reach.",
		BLOWDART_YELLOW = "Never mix water with electricity.",
		BLUEAMULET = "It somehow cools my entire body.",
		BLUEGEM = "This gemstone is faintly cold.",
		BLUEPRINT = 
		{ 
            COMMON = "It describes something in great detail, inside and out.",
            RARE = "This will be of use, no doubt.",
        },
        SKETCH = "Hmm, it's a sketch of, what I'm guessing is a sculpture.",
		--BELL_BLUEPRINT = "It has the numbers \"513\" on it.",
		BLUE_CAP = "I believe this might have medicinal uses.",
		BLUE_CAP_COOKED = "It tastes better, at least.",
		BLUE_MUSHROOM =
		{
			GENERIC = "It's a bright shade of blue.",
			INGROUND = "What's this?",
			PICKED = "Do mushrooms grow back?",
		},
		BOARDS = "Some wooden planks.",
		BONESHARD = "It's a piece of bone.",
		BONESTEW = "This will fill someone up, for sure.",
		BUGNET = "Now to go frolic through the flowers.",
		BUSHHAT = "I'm not one to hide.",
		BUTTER = "How is this possible?",
		BUTTERFLY =
		{
			GENERIC = "A reminder that there is still innocence in the world.",
			HELD = "So beautiful and delicate, one wrong move and it's dead.",
		},
		BUTTERFLYMUFFIN = "I was never known for a sweet tooth.",
		BUTTERFLYWINGS = "It's poetic, but I have no time to recite it.",
		BUZZARD = "If you're waiting on me to perish, you're going to be dissapointed.",

		SHADOWDIGGER = "It carries just as much of the Pestilence as it's commander.",

		CACTUS = 
		{
			GENERIC = "I hear a voice... A very southern voice...",
			PICKED = "I must have pliers or tweezers somewhere.",
		},
		CACTUS_MEAT_COOKED = "The harmful parts are gone, for the most part.",
		CACTUS_MEAT = "That's still going to shred my insides.",
		CACTUS_FLOWER = "Personally, I don't think this was worth it.",

		COLDFIRE =
		{
			EMBERS = "It needs fuel to survive.",
			GENERIC = "Honestly, I shouldn't question logic here, anymore.",
			HIGH = "I may have overfueled it.",
			LOW = "It wouldn't hurt to throw something on it.",
			NORMAL = "Honestly, I shouldn't question logic here, anymore.",
			OUT = "It's extinguished.",
		},
		CAMPFIRE =
		{
			EMBERS = "It needs fuel to survive.",
			GENERIC = "Now I can stop and collect my thoughts.",
			HIGH = "I may have overfueled it.",
			LOW = "It wouldn't hurt to throw something on it.",
			NORMAL = "Now I can stop and collect my thoughts.",
			OUT = "It's extinguished.",
		},
		CANE = "Ah, I've missed having one of these.",
		CATCOON = "Hello.",
		CATCOONDEN = 
		{
			GENERIC = "It appears that an animal lives here.",
			EMPTY = "The owner no longer needs it.",
		},
		CATCOONHAT = "It doesn't fit my taste. Nor does any hat, really.",
		COONTAIL = "That was cruel.",
		CARROT = "It's a common vegetable.",
		CARROT_COOKED = "It's a bit mushy for my tastes.",
		CARROT_PLANTED = "It appears to be a carrot.",
		CARROT_SEEDS = "It's a handful of seeds.",
		CARTOGRAPHYDESK =
		{
			GENERIC = "Perhaps I should leave this to those with more of a spring in their step.",
			BURNING = "There it goes.",
			BURNT = "Sigh.",
		},
		WATERMELON_SEEDS = "It's a handful of seeds..",
		CAVE_FERN = "Uninteresting flora.",
		CHARCOAL = "It's still flammable, oddly enough.",
        CHESSPIECE_PAWN = "Perhaps a game of chess can clear up the mind.",
        CHESSPIECE_ROOK =
        {
            GENERIC = "Oh dear, I'd rather not carry that.",
            STRUGGLE = "Oh my, something is happening.",
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "It's a chess piece of a knight, is it not?",
            STRUGGLE = "Oh my, something is happening.",
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "Perhaps a game of chess can clear up the mind.",
            STRUGGLE = "Oh my, something is happening.",
        },
        CHESSPIECE_MUSE = "Hmm...",
        CHESSPIECE_FORMAL = "This doesn't resemble a king.",
        CHESSPIECE_HORNUCOPIA = "It's taunting, more than anything.",
        CHESSPIECE_PIPE = "I never really bothered with something like that.",
        CHESSPIECE_DEERCLOPS = "It's an amazingly accurate replica.",
        CHESSPIECE_BEARGER = "It's an amazingly accurate replica.",
        CHESSPIECE_MOOSEGOOSE = "It's an amazingly accurate replica.",
        CHESSPIECE_DRAGONFLY = "It's an amazingly accurate replica.",
        CHESSPIECE_BUTTERFLY = "Ah, that's pleasant.",
        CHESSPIECE_ANCHOR = "Oh my, imagine how heavy that is.",
        CHESSPIECE_MOON = "Hmm, interesting.",
        CHESSJUNK1 = "A pile of clockwork.",
        CHESSJUNK2 = "Bits of cog, metal, and nightmares. Lovely.",
        CHESSJUNK3 = "A group of clockwork machinery.",
		CHESTER = "You're a useful companion, aren't you?",
		CHESTER_EYEBONE =
		{
			GENERIC = "That's not how anatomy works.",
			WAITING = "I think it's asleep.",
		},
		COOKEDMANDRAKE = "There is no time for remorse.",
		COOKEDMEAT = "I'm not one to pass a good meal.",
		COOKEDMONSTERMEAT = "It still has an untrustworthy odor to it.",
		COOKEDSMALLMEAT = "It's better than nothing.",
		COOKPOT =
		{
			COOKING_LONG = "I am wasting time.",
			COOKING_SHORT = "It'll be ready, shortly.",
			DONE = "It has finished cooking.",
			EMPTY = "My body isn't as needy as yours.",
			BURNT = "That's... not how it works.",
		},
		CORN = "Food shouldn't be a chore to eat, in my opinion.",
		CORN_COOKED = "I suppose that makes it better.",
		CORN_SEEDS = "It's a handful of seeds.",
        CANARY =
		{
			GENERIC = "I'm guessing that these birds are rare.",
			HELD = "I need to pay mind not to accidentally kill it.",
		},
        CANARY_POISONED = "Oh my, it's visibly ill.",

		CRITTERLAB = "Oh? Are those a pair of eyes staring back at me?",
        CRITTER_GLOMLING = "The noises it makes prove to be bothersome, more often than not.",
        CRITTER_DRAGONLING = "It's much less of a fire hazard than it's ancestor.",
		CRITTER_LAMB = "It's surely a sight for sore eyes.",
        CRITTER_PUPPY = "What would be a suitable name? How about... Malo?",
        CRITTER_KITTEN = "I'm not really one to gawk at something \"cute.\"",
        CRITTER_PERDLING = "Hmm. I'll allow it.",
		CRITTER_LUNARMOTHLING = "Ah, the light it produces is very useful.",

		CROW =
		{
			GENERIC = "Hello.",
			HELD = "It undoubtably needs more space.",
		},
		CUTGRASS = "It's flammable, among other things.",
		CUTREEDS = "I can create... something out of this.",
		CUTSTONE = "Oh, to be reminded of the Foundation walls.",
		DEADLYFEAST = "There are certainly worse ways to go.",
		DEER =
		{
			GENERIC = "I'm surprised that I don't see more of these out here.",
			ANTLER = "Those antlers are indeed impressive.",
		},
        DEER_ANTLER = "This looks like a key. That's... very odd.",
        DEER_GEMMED = "The poor soul is being enslaved.",
		DEERCLOPS = "Good heavens!",
		DEERCLOPS_EYEBALL = "This is, hopefully, worth the effort.",
		EYEBRELLAHAT =	"The eyeball is disturbingly elastic.",
		DEPLETED_GRASS =
		{
			GENERIC = "There's nothing left.",
		},
        GOGGLESHAT = "They might go well with this form. Might.",
        DESERTHAT = "It's better than getting sand in your eyes.",
		DEVTOOL = "Whats this?",
		DEVTOOL_NODEV = "I can't use this.",
		DIRTPILE = "It looks like this dirt was recently disturbed.",
		DIVININGROD =
		{
			COLD = "The rod isn't emitting any noise.",
			GENERIC = "An interesting design, to say the least.",
			HOT = "I'm practically standing on it.",
			WARM = "Whatever it is, it's nearby.",
			WARMER = "This is the right direction.",
		},
		DIVININGRODBASE =
		{
			GENERIC = "This looks like some sort of keyhole.",
			READY = "This looks like some sort of keyhole.",
			UNLOCKED = "Now I can progress.",
		},
		DIVININGRODSTART = "I will need this.",
		DRAGONFLY = "Those scales are blocking my touch.",
		ARMORDRAGONFLY = "This may not be my brightest idea.",
		DRAGON_SCALES = "They're still warm to the touch.",
		DRAGONFLYCHEST = "The place to store valuables.",
		DRAGONFLYFURNACE = 
		{
			HAMMERED = "Now it's useless.",
			GENERIC = "Perhaps we truely are on top of the food chain.", --no gems
			NORMAL = "Perhaps we truely are on top of the food chain.", --one gem
			HIGH = "Perhaps we truely are on top of the food chain.", --two gems
		},
        
        HUTCH = "It might be related to the similar one above-ground.",
        HUTCH_FISHBOWL =
        {
            GENERIC = "It's a neat thing to look at, at the very least.",
            WAITING = "Dead.",
        },
		LAVASPIT = 
		{
			HOT = "Ergh, watch your step.",
			COOL = "I still don't trust it.",
		},
		LAVA_POND = "That's one trip away from a quick death.",
		LAVAE = "It's made of pure magma.",
		LAVAE_COCOON = "It's sufficently cool, for the most part.",
		LAVAE_PET = 
		{
			STARVING = "It desperately needs food.",
			HUNGRY = "It needs to eat something.",
			CONTENT = "It's content, for now.",
			GENERIC = "It's an interesting lab assistant.",
		},
		LAVAE_EGG = 
		{
			GENERIC = "It's faintly warm.",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "It needs heat for incubation.",
			COMFY = "It's coming along just fine.",
		},
		LAVAE_TOOTH = "It's a peculiar tooth.",

		DRAGONFRUIT = "Oh, what an exotic fruit.",
		DRAGONFRUIT_COOKED = "I feel like I can prepare this better.",
		DRAGONFRUIT_SEEDS = "A handful of valuable seeds.",
		DRAGONPIE = "This is practically a delicacy.",
		DRUMSTICK = "Must I resort to such barbaric measures?",
		DRUMSTICK_COOKED = "Less barbaric, at least.",
		DUG_BERRYBUSH = "Now it can be transported.",
		DUG_BERRYBUSH_JUICY = "Now it can be transported.",
		DUG_GRASS = "Now it can be transported.",
		DUG_MARSH_BUSH = "This would be better used as fire fuel.",
		DUG_SAPLING = "Now it can be transported.",
		DURIAN = "Oh my, that stench is horrendous.",
		DURIAN_COOKED = "I'm going to be ill.",
		DURIAN_SEEDS = "It's a handful of seeds.",
		EARMUFFSHAT = "A sub-par method of staying warm.",
		EGGPLANT = "I never understood it's name.",
		EGGPLANT_COOKED = "The name still puzzles me.",
		EGGPLANT_SEEDS = "A handful of seeds.",

		ENDTABLE = 
		{
			BURNT = "A disheartening sight.",
			GENERIC = "Ah, delightful.",
			EMPTY = "Something should be put in there.",
			WILTED = "That's unfortunate.",
			FRESHLIGHT = "Ah, delightful.",
			OLDLIGHT = "It's going to die soon.", -- will be wilted soon, light radius will be very small at this point
		},
		DECIDUOUSTREE = 
		{
			BURNING = "Oh dear, let's hope it doesn't spread.",
			BURNT = "There was no way of saving it.",
			CHOPPED = "Well, now it doubles as a seat.",
			POISON = "Er-! What are you?",
			GENERIC = "It's a rather pleasant-looking tree.",
		},
		ACORN = "Over an open fire.",
        ACORN_SAPLING = "I need to come back later.",
		ACORN_COOKED = "I'm pretty sure these are edible now.",
		BIRCHNUTDRAKE = "It's certainly not happy with me.",
		EVERGREEN =
		{
			BURNING = "Oh dear, let's hope it doesn't spread.",
			BURNT = "There was no way of saving it.",
			CHOPPED = "Well, now it doubles as a seat.",
			GENERIC = "It's an unremarkable tree.",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "Oh dear, let's hope it doesn't spread.",
			BURNT = "There was no way of saving it.",
			CHOPPED = "Well, now it doubles as a seat.",
			GENERIC = "This tree sets the doleful mood, now doesn't it?",
		},
		TWIGGYTREE = 
		{
			BURNING = "Oh dear, let's hope it doesn't spread.",
			BURNT = "There was no way of saving it.",
			CHOPPED = "Now it's simply an eye sore.",
			GENERIC = "Those branches look rather weak. Hm.",			
			DISEASED = "It looks more frail than it usually is.",
		},
		TWIGGY_NUT_SAPLING = "I need to come back later.",
        TWIGGY_OLD = "The cycle will continue.",
		TWIGGY_NUT = "These'd be more useful near my laboratory.",
		EYEPLANT = "Odd.",
		INSPECTSELF = "I'm fine.",
		FARMPLOT =
		{
			GENERIC = "I don't have any previous experience with farming.",
			GROWING = "I have things to do.",
			NEEDSFERTILIZER = "I believe it needs to be fertilized.",
			BURNT = "It's unusable, now.",
		},
		FEATHERHAT = "I would much rather not wear such a garment.",
		FEATHER_CROW = "A black feather.",
		FEATHER_ROBIN = "A red feather.",
		FEATHER_ROBIN_WINTER = "A white, slightly blue feather.",
		FEATHER_CANARY = "A bright yellow feather.",
		FEATHERPENCIL = "The feather is there for the sole purpose of elegance.",
		FEM_PUPPET = "Oh my, miss, are you alright?",
		FIREFLIES =
		{
			GENERIC = "If only they wouldn't disperse when I get close.",
			HELD = "Well, now my pockets are glowing.",
		},
		FIREHOUND = "That red dog only has one voice.",
		FIREPIT =
		{
			EMBERS = "It needs fuel to survive.",
			GENERIC = "A place to call camp.",
			HIGH = "Never underestimate something in containment.",
			LOW = "It wouldn't hurt to throw something on it.",
			NORMAL = "It's at a good size.",
			OUT = "A place to call camp.",
		},
		COLDFIREPIT =
		{
			EMBERS = "It needs fuel to survive.",
			GENERIC = "I should stop questioning logic, at this rate.",
			HIGH = "It's a relief that it's contained.",
			LOW = "It wouldn't hurt to throw something on it.",
			NORMAL = "I should stop questoning logic, at this rate.",
			OUT = "It can be re-ignited.",
		},
		FIRESTAFF = "Such a destructive tool. I have no interest with it.",
		FIRESUPPRESSOR = 
		{	
			ON = "One less thing to worry about.",
			OFF = "It's a well-needed insurance.",
			LOWFUEL = "It requires fuel to function.",
		},

		FISH = "I'd much rather cook this first.",
		FISHINGROD = "There must be better ways of gathering food.",
		FISHSTICKS = "I'm not crazy for it, but it's healthy for you.",
		FISHTACOS = "I'm not a fan of it, personally.",
		FISH_COOKED = "Well, now I have no problems eating it.",
		FLINT = "I can use this for various equipment.",
		FLOWER = 
		{
            GENERIC = "It's a welcome change from the darkness.",
            ROSE = "Mind the thorns.",
        },
        FLOWER_WITHERED = "An unfortunate sight.",
		FLOWERHAT = "I am not sure why, but this eases my headache.",
		FLOWER_EVIL = "What is this place?",
		FOLIAGE = "Unremarkable leaves.",
		FOOTBALLHAT = "It's very unfortunate that this garment is necessary.",
        FOSSIL_PIECE = "Time to put my knowledge of anatomy to work.",
        FOSSIL_STALKER =
        {
			GENERIC = "It's incomplete, I'm afraid.",
			FUNNY = "... No, this is incorrect.",
			COMPLETE = "The anatomy looks correct.",
        },
        STALKER = "I must examine this \"nightmare fuel\" further.",
        STALKER_ATRIUM = "You are not going to stop me.",
        STALKER_MINION = "Oh, goodness.",
        THURIBLE = "Ah, it smells of lavender.",
        ATRIUM_OVERGROWTH = "I don't recognise this language.",
		FROG =
		{
			DEAD = "Dead.",
			GENERIC = "It's a frog. What else is there to say?",
			SLEEPING = "Unconcious.",
		},
		FROGGLEBUNWICH = "It's not that appetizing.",
		FROGLEGS = "A delicacy, when prepared correctly.",
		FROGLEGS_COOKED = "I am fine dining in the wilderness.",
		FRUITMEDLEY = "I prefer a more elegant meal.",
		FURTUFT = "It is a rather large amount of fur.", 
		GEARS = "Various cogs for machinery.",
		GHOST = "Oh, a physical spirit. What an anomoly.",
		GOLDENAXE = "It's an expensive, and durable tool.",
		GOLDENPICKAXE = "Isn't gold a sub-par material for this?",
		GOLDENPITCHFORK = "Why did I make this?",
		GOLDENSHOVEL = "It's a shovel, why does it need to be made out of gold?",
		GOLDNUGGET = "I have seen many civilizations kill each other over this.",
		GRASS =
		{
			BARREN = "It needs to be fertilized.",
			WITHERED = "This heat is killing everything.",
			BURNING = "Oh dear, what a waste.",
			GENERIC = "The grass here appears to have overgrown.",
			PICKED = "Im wasting time, watching grass grow.",
			DISEASED = "This disease is foreign to me.",
			DISEASING = "Oh goodness, what is that stench?",
		},
		GRASSGEKKO = 
		{
			GENERIC = "A mammal that grows... grass... Interesting.",	
			DISEASED = "It looks really sick.",
		},
		GREEN_CAP = "I don't trust it.",
		GREEN_CAP_COOKED = "I think it's edible now.",
		GREEN_MUSHROOM =
		{
			GENERIC = "It's a bright green mushroom.",
			INGROUND = "What is this?",
			PICKED = "Mushrooms grow back, right?",
		},
		GUNPOWDER = "Be wary not to kill yourself with it.",
		HAMBAT = "It's a peculiar way of using food, to say the least.",
		HAMMER = "Mistakes are inevitable, I am no exception.",
		HEALINGSALVE = "Ah, a medicinal salve, I can put this to good use.",
		HEATROCK =
		{
			FROZEN = "It's practically frozen.",
			COLD = "It will do it's job.",
			GENERIC = "I can use this to my advantage.",
			WARM = "It will do it's job.",
			HOT = "Hot enough to warm me through the dead of winter.",
		},
		HOME = "A place to call home. Unfortunately, I can't call it mine.",
		HOMESIGN =
		{
			GENERIC = "I need something to write with.",
            UNWRITTEN = "There is nothing on the sign.",
			BURNT = "Well, now the text is unreadable.",
		},
		ARROWSIGN_POST =
		{
			GENERIC = "I need something to write with.",
            UNWRITTEN = "There is nothing on the sign.",
			BURNT = "Well, now the text is unreadable.",
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "I need something to write with.",
            UNWRITTEN = "There is nothing on the sign.",
			BURNT = "Well, now the text is unreadable.",
		},
		HONEY = "It's a natural, nutritional lubricant.",
		HONEYCOMB = "Isn't this where the honey is made? I'm not sure.",
		HONEYHAM = "It allows me to forget that I'm in the wilderness.",
		HONEYNUGGETS = "Maybe I don't have it bad, out here.",
		HORN = "I will find a use for this, eventually.",
		HOUND = "It is no use to me alive, therefore it must go.",
		HOUNDCORPSE =
		{
			 GENERIC = "I suppose it wishes to be put down a second time.",
			 BURNING = "It's not coming back from that.",
			 REVIVING = "Oh? What is happening?",
		},
		HOUNDBONE = "It pollutes the atmosphere with it's melancholic sight.",
		HOUNDMOUND = "That has to be some sort of underground den.",
		ICEBOX = "My rations will be safe, for now.",
		ICEHAT = "Ergh...",
		ICEHOUND = "That one has a winter coat.",
		INSANITYROCK =
		{
			ACTIVE = "Heh ha ha ha! Progress!",
			INACTIVE = "It has an interesting design.",
		},
		JAMMYPRESERVES = "That's just... messy.",

		KABOBS = "Hm, isn't this saved for tropical events?",
		KILLERBEE =
		{
			GENERIC = "Oh my, that one's aggressive.",
			HELD = "It's furiously trying to escape.",
		},
		KNIGHT = "What an interesting piece of machinery.",
		KOALEFANT_SUMMER = "It will be for my benefit, one way or another.",
		KOALEFANT_WINTER = "This one has a thick winter coat.",
		KRAMPUS = "You have made a grave mistake.",
		KRAMPUS_SACK = "This will be of great use.",
		LEIF = "Oh, that tree is... alive.",
		LEIF_SPARSE = "Oh, that tree is... alive.",
		LIGHTER  = "Not that great visibility, but it lasts long enough.",
		LIGHTNING_ROD =
		{
			CHARGED = "I wonder if I can use this power...",
			GENERIC = "Lightning is, thankfully, no longer a worry.",
		},
		LIGHTNINGGOAT = 
		{
			GENERIC = "The constant chewing is annoying.",
			CHARGED = "It has harnessed the power of electricity, despite being organic.",
		},
		LIGHTNINGGOATHORN = "It's still a decent conductor for electricity.",
		GOATMILK = "This is a delicacy, out here.",
		LITTLE_WALRUS = "You are sick, child. Come here.",
		LIVINGLOG = "It's aptly named, to say the least.",
		LOG =
		{
			BURNING = "It'll be gone soon.",
			GENERIC = "It's an uninteresting log of wood.",
		},
		LUCY = "Oh? Is someone trapped in there?",
		LUREPLANT = "The flora here is bizzare.",
		LUREPLANTBULB = "I can most likely turn this into a food source.",
		MALE_PUPPET = "Oh my, good sir, are you alright?",

		MANDRAKE_ACTIVE = "You, good sir, are a major annoyance.",
		MANDRAKE_PLANTED = "It appears to be a radish of some sort.",
		MANDRAKE = "This was a living thing, but it's also a vegetable, apparently.",

        MANDRAKESOUP = "He's certainly not getting up anytime soon.",
        MANDRAKE_COOKED = "This better be worth the headache.",
        MAPSCROLL = "It's a blank piece of paper.",
        MARBLE = "This better be worth the headache.",
        MARBLEBEAN = "I have no words.",
        MARBLEBEAN_SAPLING = "That worked?",
        MARBLESHRUB = "Why am I surprised? I come from a facility that *houses* anomolies.",
        MARBLEPILLAR = "I could probably use this marble.",
        MARBLETREE = "I've seen stranger objects.",
        MARSH_BUSH =
        {
            BURNING = "No one will miss it.",
            GENERIC = "I don't think it's worth it.",
            PICKED = "I need my tweezers.",
        },
        BURNT_MARSH_BUSH = "It actually didn't change much.",
        MARSH_PLANT = "It's an uninteresting plant.",
        MARSH_TREE =
        {
            BURNING = "It wont be missed.",
            BURNT = "You can still hurt yourself on it.",
            CHOPPED = "The stump is pretty on the eyes.",
            GENERIC = "That certainly sets the mood.",
        },
        MAXWELL = "You. The epicenter of the Pestilence.",
        MAXWELLHEAD = "Flattering.",
        MAXWELLLIGHT = "These would've been useful a long while ago.",
        MAXWELLLOCK = "Hmm, it's a key hole.",
        MAXWELLTHRONE = "It isn't my style, I'm afraid.",
        MEAT = "I'm forced to resort to this, I'm afraid.",
        MEATBALLS = "It will fill me up well enough.",
        MEATRACK =
        {
            DONE = "It is sufficently dried.",
            DRYING = "It will take a good amount of time.",
            DRYINGINRAIN = "The rain is proving bothersome.",
            GENERIC = "I can hang things up there to dry.",
            BURNT = "It's too brittle to function correctly.",
        },
        MEAT_DRIED = "Hard to chew, but healthy.",
        MERM = "I sense... the residue of humanity within it.",
        MERMHEAD =
        {
            GENERIC = "Charming.",
            BURNT = "That smell is going to stick on me for a good while.",
        },
        MERMHOUSE =
        {
            GENERIC = "It is too run down to be considered a house.",
            BURNT = "You never know what you have until it's gone, I suppose.",
        },
        MINERHAT = "It allows for hands-free operation in the darkness.",
        MONKEY = "He's a burden, more than anything.",
        MONKEYBARREL = "I would never expect primates down here.",
        MONSTERLASAGNA = "That is a sure-fire way to sickness.",
        FLOWERSALAD = "I... I guess it's edible.",
        ICECREAM = "I was never known for a sweet tooth.",
        WATERMELONICLE = "This is starting to get silly.",
        TRAILMIX = "It's a healthy snack, I suppose.",
        HOTCHILI = "I am not a fan of spice, or hot foods in general.",
        GUACAMOLE = "I don't really care for it.",
        MONSTERMEAT = "Goodness, it's rancid smell is not appetizing.",
        MONSTERMEAT_DRIED = "I'm still not completely certain that it's safe to eat.",
        MOOSE = "It is time for your swan song.",
        MOOSE_NESTING_GROUND = "Hmm, this place might be dangerous.",
        MOOSEEGG = "Oh, I guess that giant goose is the mother.",
        MOSSLING = "It's a child to that goose.",
        FEATHERFAN = "How luxurious.",
        MINIFAN = "This is childish.",
        GOOSE_FEATHER = "It'd work best in a pillow, no doubt.",
        STAFF_TORNADO = "A sure-fire way to destroy everything in your path.",
        MOSQUITO =
        {
            GENERIC = "Pest.",
            HELD = "I should squish you in my hand.",
        },
        MOSQUITOSACK = "I like blood. It makes me feel safe.",
        MOUND =
        {
            DUG = "If it helps advance my efforts, I will dig a thousand more.",
            GENERIC = "I suppose there *might* be something down there.",
        },
        NIGHTLIGHT = "The light itself is... menacing.",
        NIGHTMAREFUEL = "Dark and Corrosive. Hmm, perhaps that Old Man *was* a nightmare.",
        NIGHTSWORD = "I can feel myself losing a grip on the very world around me...",
        NITRE = "I guess I can hold on to it, until I discover a use.",
        ONEMANBAND = "Attempting to operate it is so draining.",
        OASISLAKE = "I see something at the bottom.",
        PANDORASCHEST = "Well, I'm willing to test my luck.",
        PANFLUTE = "Allow me to play your swan song.",
        PAPYRUS = "It's some smooth paper.",
        WAXPAPER = "The paper is noticably thicker than usual.",
        PENGUIN = "He has an elegant aura to him.",
        PERD = "You are being extremely bothersome.",
        PEROGIES = "Fortunately, these taste wonderful.",
        PETALS = "Ah, they smell of lavender. Delightful.",
        PETALS_EVIL = "These are going nowhere near my face.",
        PHLEGM = "I strongly urge everyone to not let it get in contact with a corpse.",
        PICKAXE = "I'm not one for such back-breaking labor.",
        PIGGYBACK = "As if I didn't have troubles running around already.",
        PIGHEAD =
        {
            GENERIC = "Oh goodness, that barely counts as a cure.",
            BURNT = "It's less of an eye-sore, now.",
        },
        PIGHOUSE =
        {
            FULL = "I will attend to you, shortly.",
            GENERIC = "They use this to hide from me.",
            LIGHTSOUT = "Delaying the inevitable is a foolish mistake.",
            BURNT = "Now the house is unusable.",
        },
        PIGKING = "Good sir, your town reeks of the disease. I am here to help.",
        PIGMAN =
        {
            DEAD = "I need not a reminder on how to perform surgery.",
            FOLLOWER = "I suppose I'll allow it a few more minutes.",
            GENERIC = "I sense the disease in you.",
            GUARD = "Oh my, yet another victim of the disease.",
            WEREPIG = "Your lycanthropy shall not stop me.",
        },
        PIGSKIN = "A byproduct of my operations.",
        PIGTENT = "Smells like bacon.",
        PIGTORCH = "How do they reach to the top?",
        PINECONE = "I'm not an outdoors type.",
        PINECONE_SAPLING = "I should come back later.",
        LUMPY_SAPLING = "How did this happen?",
        PITCHFORK = "I can change the world around me, or rather, the ground at least.",
        PLANTMEAT = "It's merely pretending to be meat.",
        PLANTMEAT_COOKED = "It tastes like thick, warm leaves.",
        PLANT_NORMAL =
        {
            GENERIC = "It's a plant.",
            GROWING = "I have better things to do than watch plants grow.",
            READY = "It's ready to be harvested.",
            WITHERED = "This heat is killing everything.",
        },
        POMEGRANATE = "If I recall correctly, pomegranates stain.",
        POMEGRANATE_COOKED = "All of the juices are melted away.",
        POMEGRANATE_SEEDS = "A handful of seeds.",
        POND = "I see fish in this pond, just out of reach.",
        POOP = "Pleasant...",
        --PORTABLECOOKPOT_ITEM = "It's a very convienent device.",
        FERTILIZER = "It is extraordinarily better than fertilizing by hand.",
        PUMPKIN = "It's a very large pumpkin.",
        PUMPKINCOOKIE = "It's a change from my usual diet, for sure.",
        PUMPKIN_COOKED = "I'm not sure if this is an improvement.",
        PUMPKIN_LANTERN = "I find Autumn festivities to be humorous.",
        PUMPKIN_SEEDS = "It's a handful of seeds.",
        PURPLEAMULET = "I don't like this...",
        PURPLEGEM = "Perhaps I could use it's power, for the cure.",
        RABBIT =
        {
            GENERIC = "Unfortunately, it's too fast to catch on foot.",
            HELD = "You were not fast enough.",
        },
        RABBITHOLE =
        {
            GENERIC = "It's a good way to break your ankle.",
            SPRING = "The hole has collapsed in on itself.",
        },
        RAINOMETER =
        {
            GENERIC = "This contraption is a bit redundant when you can simply look up.",
            BURNT = "It's useless now.",
        },
        RAINCOAT = "I suppose it's more of a luxury.",
        RAINHAT = "Hm, I'd rather an umbrella.",
        RATATOUILLE = "A decent dish, considering the circumstance.",
        RAZOR = "Thankfully, I don't need to worry about facial hair.",
        REDGEM = "This gemstone is faintly warm.",
        RED_CAP = "The smell is a warning enough.",
        RED_CAP_COOKED = "Now the smell is even more potent.",
        RED_MUSHROOM =
        {
            GENERIC = "It's a bright red mushroom.",
            INGROUND = "What is this?",
            PICKED = "Mushrooms grow back, right?",
        },
        REEDS =
        {
            BURNING = "Oh my, I don't think you can grow more of this.",
            GENERIC = "Tall, wet, hollow plants.",
            PICKED = "Everything usable has already been harvested.",
        },
        RELIC = "An ancient piece of civilization.",
        RUINS_RUBBLE = "The Pestilence has been through here, I can sense it.",
        RUBBLE = "The Pestilence leaves it's mark.",
        --RUINSRELIC_PLATE = "There's not much use for it anymore.",
        RESEARCHLAB =
        {
            GENERIC = "This will aid me, no doubt.",
            BURNT = "An unfortunate end to the machine.",
        },
        RESEARCHLAB2 =
        {
            GENERIC = "My own laboratory.",
            BURNT = "This is very unfortunate.",
        },
        RESEARCHLAB3 =
        {
            GENERIC = "Thankfully, I have been blessed with the tools of comprehension.",
            BURNT = "Such a vital piece of lab equipment, destroyed.",
        },
        RESEARCHLAB4 =
        {
            GENERIC = "Surely a better name could've been thought up.",
            BURNT = "Sigh, fire claims another object.",
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "You must sacrifice blood now to save blood later.",
            BURNT = "I'm afraid that it works no longer.",
        },
        RESURRECTIONSTONE = "No prerequesite needed? Sounds too good to be true.",
        ROBIN =
        {
            GENERIC = "Greetings.",
            HELD = "It dislikes the lack of space, understandably.",
        },
        ROBIN_WINTER =
        {
            GENERIC = "It roams these white wastelands.",
            HELD = "I will grant you more space, shortly.",
        },
        ROBOT_PUPPET = "That machine is trapped.",
        ROCK_LIGHT =
        {
            GENERIC = "A crusted over lava pit.",
            OUT = "Looks fragile.",
            LOW = "The lava's crusting over.",
            NORMAL = "Nice and comfy.",
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "I mourn for my backside.",
            RAISED = "I can't quite reach it.",
        },
        ROCK = "It's a large boulder.",
        PETRIFIED_TREE = "Despite it's shape, it's made of stone.",
        ROCK_PETRIFIED_TREE = "Despite it's shape, it's made of stone.",
        ROCK_PETRIFIED_TREE_OLD = "Despite it's shape, it's made of stone.",
        ROCK_ICE =
        {
            GENERIC = "A rather large mass of ice.",
            MELTED = "The puddle of water is rather useless to me.",
        },
        ROCK_ICE_MELTED = "The puddle of water is rather useless to me.",
        ICE = "Winter first-hand.",
        ROCKS = "Ordinary rocks, not much else to say.",
        ROOK = "That machine is large, and brutish.",
        ROPE = "Rope has plenty of uses.",
        ROTTENEGG = "Oh my...",
        ROYAL_JELLY = "I feel like we can make use of this.",
        JELLYBEAN = "It's similar to SCP-500, in some respects.",
        SADDLE_BASIC = "It must be an odd sight, a being such as I utop a smelly beast.",
        SADDLE_RACE = "This saddle is most effective.",
        SADDLE_WAR = "I'm fairly sure brute warriors still valued comfort.",
        SADDLEHORN = "Now there will be less hostility involved.",
        SALTLICK = "No one expects a doctor to be a farmer... I didn't either.",
        BRUSH = "It brings great pleasure to the beast.",
		SANITYROCK =
		{
			ACTIVE = "It has an interesting design.",
			INACTIVE = "Wh-? Where'd it go?",
		},
		SAPLING =
		{
			BURNING = "Oh my, it's on fire.",
			WITHERED = "This heat is killing everything.",
			GENERIC = "I can most likely take the sticks off of that.",
			PICKED = "I'm not sure if it will grow back.",
			DISEASED = "This disease is foreign to me.",
			DISEASING = "Good heavens, what is that stench?",
		},
   		SCARECROW = 
   		{
			GENERIC = "It's a deturrant for the bothersome birds.",
			BURNING = "Oh goodness, that's a borderline haunting sight.",
			BURNT = "That's a shame.",
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "If anyone else wants to spruce up the place, knock yourself out.",
			BLOCK = "I really don't have the time for this.",
			SCULPTURE = "Sigh.",
			BURNT = "Well, that's a shame.",
   		},
        SCULPTURE_KNIGHTHEAD = "I wonder where the rest of it could be.",
		SCULPTURE_KNIGHTBODY = 
		{
			COVERED = "I can't tell what it is.",
			UNCOVERED = "I still can't quite tell.",
			FINISHED = "Ah, I see what it is now.",
			READY = "Something is happening.",
		},
        SCULPTURE_BISHOPHEAD = "This looks like a piece of something.",
		SCULPTURE_BISHOPBODY = 
		{
			COVERED = "What is this?",
			UNCOVERED = "A vital piece is missing.",
			FINISHED = "Ah, so that's what it is.",
			READY = "Something is happening.",
		},
        SCULPTURE_ROOKNOSE = "What is this? A castle, perhaps?",
		SCULPTURE_ROOKBODY = 
		{
			COVERED = "It's a very large piece of marble.",
			UNCOVERED = "I can faintly see the outline of something.",
			FINISHED = "Hmm, interesting.",
			READY = "Something is happening.",
		},
        GARGOYLE_HOUND = "It has each minor detail correct, down to the hairs.",
        GARGOYLE_WEREPIG = "The amount of detail is astonishing.",
		SEEDS = "A handful of seeds.",
		SEEDS_COOKED = "Now they taste faintly better.",
		SEWING_KIT = "I suppose I'm taking up sewing, now.",
		SEWING_TAPE = "An easy way to make repairs, if you don't mind the eyesore.",
		SHOVEL = "Agriculture is foreign to me.",
		SILK = "It can be fashioned into fine garments.",
		SKELETON = "How melancholy.",
		SCORCHED_SKELETON = "How melancholy.",
		SKULLCHEST = "I'm not sure if I want to open it.",
		SMALLBIRD =
		{
			GENERIC = "Greetings, child.",
			HUNGRY = "Are you hungry?",
			STARVING = "You desperately need food.",
		},
		SMALLMEAT = "It's a shame that it's not bigger.",
		SMALLMEAT_DRIED = "It's still only a handful.",
		SPAT = "A disgustingly unsanitary creature.",
		SPEAR = "I'm afraid I'll need this for those that are protected.",
		SPEAR_WATHGRITHR = "It's sharper than your average weapon.",
		WATHGRITHRHAT = "Over-the-top.",
		SPIDER =
		{
			DEAD = "Ergh...",
			GENERIC = "It's sole purpose in life is to eat.",
			SLEEPING = "I see no reason to wake it.",
		},
		SPIDERDEN = "It has no reason to be that big.",
		SPIDEREGGSACK = "Now I can reposition them to somewhere more useful.",
		SPIDERGLAND = "Judging by it's smell, I think I can use it for medicinal purposes.",
		SPIDERHAT = "These spiders are easily manipulatable.",
		SPIDERQUEEN = "Good heavens, that spider is gigantic.",
		SPIDER_WARRIOR =
		{
			DEAD = "Ergh...",
			GENERIC = "These ones jump, I'm afraid.",
			SLEEPING = "I see no reason to wake it.",
		},
		SPOILED_FOOD = "Lovely...",
        STAGEHAND =
        {
			AWAKE = "Oh my.",
			HIDING = "Er, what is something like this doing out here?",
        },
        STATUE_MARBLE = 
        {
            GENERIC = "At least I can blink at this one.",
            TYPE1 = "I have a friend that would adore this.",
            TYPE2 = "At least I can blink at this one.",
        },
		STATUEHARP = "At least I can blink at this one.",
		STATUEMAXWELL = "It requires extraordinary effort to restrain myself. He is very ill.",
		STEELWOOL = "Extraordinary, despite being ill-advised for garments.",
		STINGER = "I can use this as a needle, no doubt.",
		STRAWHAT = "It keeps the sun out of my eyes, at the very least.",
		STUFFEDEGGPLANT = "It's healthy for you.",
		--SUNKBOAT = "It's no use out there.",
		SWEATERVEST = "Not exactly my cup of tea.",
		REFLECTIVEVEST = "Now, the heat will not get so unbearable.",
		HAWAIIANSHIRT = "I'm afraid that I might stain it with blood.",
		TAFFY = "I'm not known for a sweet tooth.",
		TALLBIRD = "That is an extraordinarily tall bird.",
		TALLBIRDEGG = "I can let it live, or satiate my hunger.",
		TALLBIRDEGG_COOKED = "Now that I think of it, I just murdered a child.",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "The egg needs heat for incubation.",
			GENERIC = "It's coming along just fine.",
			HOT = "I believe it needs to be cooled down.",
			LONG = "It won't hatch for a good while.",
			SHORT = "It should be ready at any moment.",
		},
		TALLBIRDNEST =
		{
			GENERIC = "Oh my, that's a tempting meal.",
			PICKED = "There's no egg, I'm afraid.",
		},
		TEENBIRD =
		{
			GENERIC = "It's still a juvenile.",
			HUNGRY = "It requires sustinence.",
			STARVING = "I do not appreciate the hostile look it's giving me.",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "With this I can surely pass through space and time.",
			GENERIC = "This appears to be a nexus to another world!",
			LOCKED = "There's still something missing.",
			PARTIAL = "Soon, the invention will be complete.",
		},
		TELEPORTATO_BOX = "This may control the polarity of the whole universe.",
		TELEPORTATO_CRANK = "Tough enough to handle the most intense experiments.",
		TELEPORTATO_POTATO = "This metal potato contains great and fearful power...",
		TELEPORTATO_RING = "A ring that could focus dimensional energies.",
		TELESTAFF = "I've heard of pretty nasty side effects that come with teleportation.",
		TENT = 
		{
			GENERIC = "The Pestilence does not rest, neither should I.",
			BURNT = "Might as well salvage what's rest of it.",
		},
		SIESTAHUT = 
		{
			GENERIC = "Even I am not impervious to extreme temperatures.",
			BURNT = "Now it serves no use.",
		},
		TENTACLE = "I believe that's one piece of a larger animal.",
		TENTACLESPIKE = "I don't wish to instill suffering. That is a common misconception.",
		TENTACLESPOTS = "Oh, that's pleasant.",
		TENTACLE_PILLAR = "It's enormous.",
	TENTACLE_PILLAR_HOLE = "There is most likely something on the other side.",
		TENTACLE_PILLAR_ARM = "Offspring, perhaps?",
		TENTACLE_GARDEN = "A large tentacle, by the looks of it.",
		TOPHAT = "I suppose a touch of elegance will not hurt.",
		TORCH = "An uncivilized way of seeing in the dark.",
		TRANSISTOR = "My technological knowledge is quite lacking.",
		TRAP = "You cannot outrun intelligence.",
		TRAP_TEETH = "It will most likely puncture vital organs.",
		TRAP_TEETH_MAXWELL = "I need to pay good mind to that.",
		TREASURECHEST = 
		{
			GENERIC = "A permanent place to store, well, anything.",
			BURNT = "Now I can't use it.",
		},
		TREASURECHEST_TRAP = "What is this?",
		SACRED_CHEST = 
		{
			GENERIC = "Do I hear faint whispering?",
			LOCKED = "I can't get it open, unfortunately.",
		},
		TREECLUMP = "It's almost like someone is trying to prevent me from going somewhere.",
		
		TRINKET_1 = "I have no time for games.", --Melted Marbles
		TRINKET_2 = "I don't know how to play instruments.", --Fake Kazoo
		TRINKET_3 = "With enough willpower, you can accomplish anything.", --Gord's Knot
		TRINKET_4 = "I have no use for this.", --Gnome
		TRINKET_5 = "I do not require such playthings.", --Toy Rocketship
		TRINKET_6 = "It's a shame that they no longer work.", --Frazzled Wires
		TRINKET_7 = "No, there is work to be done.", --Ball and Cup
		TRINKET_8 = "Why would I need such an instrument out here?", --Rubber Bung
		TRINKET_9 = "The colors are a bit flashy for my tastes.", --Mismatched Buttons
		TRINKET_10 = "I do not require these, personally.", --Dentures
		TRINKET_11 = "An interesting figure.", --Lying Robot
		TRINKET_12 = "I dislike how moist it is.", --Dessicated Tentacle
		TRINKET_13 = "I have no use for this.", --Gnomette
		TRINKET_14 = "Unfortunately, it has a hole at the bottom.", --Leaky Teacup
		TRINKET_15 = "Perhaps I can allow some time for a game of chess.", --Pawn
		TRINKET_16 = "Perhaps I can allow some time for a game of chess.", --Pawn
		TRINKET_17 = "I'd rather not know where this has been.", --Bent Spork
		TRINKET_18 = "Something may very well be inside.", --Trojan Horse
		TRINKET_19 = "What's the point of this?", --Unbalanced Top
		TRINKET_20 = "If that Viking hits me with this once more, she will be cured.", --Backscratcher
		TRINKET_21 = "I don't know what this is.", --Egg Beater
		TRINKET_22 = "It's no use to me.", --Frayed Yarn
		TRINKET_23 = "What's this?", --Shoehorn
		TRINKET_24 = "I believe this comes from mythology?", --Lucky Cat Jar
		TRINKET_25 = "That is counter-productive. Ergh.", --Air Unfreshener
		TRINKET_26 = "Sigh...", --Potato Cup
		TRINKET_27 = "I personally don't have many uses for something like this.", --Coat Hanger
		TRINKET_28 = "Perhaps I can allow some time for a game of chess.", --Rook
        TRINKET_29 = "Perhaps I can allow some time for a game of chess.", --Rook
        TRINKET_30 = "Perhaps I can allow some time for a game of chess.", --Knight
        TRINKET_31 = "Perhaps I can allow some time for a game of chess.", --Knight
        TRINKET_32 = "I don't personally need it.", --Cubic Zirconia Ball
        TRINKET_33 = "It's something you'd use to entertain a child.", --Spider Ring
        TRINKET_34 = "I don't personally need it.", --Monkey Paw
        TRINKET_35 = "I have my own. Besides, I have no clue where it's been.", --Empty Elixir
        TRINKET_36 = "A child's plaything.", --Faux fangs
        TRINKET_37 = "It's something from folklore.", --Broken Stake
        TRINKET_38 = "I don't personally need this.", -- Binoculars Griftlands trinket
        TRINKET_39 = "It's too thin to prevent my touch.", -- Lone Glove Griftlands trinket
        TRINKET_40 = "I have no personal use for this.", -- Snail Scale Griftlands trinket
        TRINKET_41 = "I have no personal use for this.", -- Goop Canister Hot Lava trinket
        TRINKET_42 = "A child's play thing.", -- Toy Cobra Hot Lava trinket
        TRINKET_43= "A child's play thing.", -- Crocodile Toy Hot Lava trinket
        TRINKET_44 = "Whatever's in it has been dead for a while now.", -- Broken Terrarium ONI trinket
        TRINKET_45 = "I don't hear anything.", -- Odd Radio ONI trinket
        TRINKET_46 = "I have no personal use for this.", -- Hairdryer ONI trinket
        
        HALLOWEENCANDY_1 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_2 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_3 = "That is not candy, why is this here?",
        HALLOWEENCANDY_4 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_5 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_6 = "I'm not a fan of candy, myself..",
        HALLOWEENCANDY_7 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_8 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_9 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_10 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_11 = "I'm not a fan of candy, myself.",
        HALLOWEENCANDY_12 = "I'm not a fan of candy, myself.", --ONI meal lice candy
        HALLOWEENCANDY_13 = "I'm not a fan of candy, myself.", --Griftlands themed candy
        HALLOWEENCANDY_14 = "I'm not a fan of candy, myself.", --Hot Lava pepper candy
        CANDYBAG = "The Foundation would like a word with this.",

		HALLOWEEN_ORNAMENT_1 = "I don't reccall ornaments being a Halloween thing.",
		HALLOWEEN_ORNAMENT_2 = "I don't reccall ornaments being a Halloween thing.",
		HALLOWEEN_ORNAMENT_3 = "I don't reccall ornaments being a Halloween thing.", 
		HALLOWEEN_ORNAMENT_4 = "I don't reccall ornaments being a Halloween thing.",
		HALLOWEEN_ORNAMENT_5 = "I don't reccall ornaments being a Halloween thing.",
		HALLOWEEN_ORNAMENT_6 = "I don't reccall ornaments being a Halloween thing.", 

		HALLOWEENPOTION_DRINKS_WEAK = "Hmm, it's not as potent as I'd like.",
		HALLOWEENPOTION_DRINKS_POTENT = "Ah, this will be sufficent enough.",
        HALLOWEENPOTION_BRAVERY = "It removes your fight or flight response.",
		HALLOWEENPOTION_FIRE_FX = "I'm not sure this is pure science, anymore.", 
		MADSCIENCE_LAB = "Ah, time to put my brewing knowledge to work.",
		LIVINGTREE_ROOT = "I might be able to grow this, perhaps.", 
		LIVINGTREE_SAPLING = "I suppose that's sufficent enough.",

        DRAGONHEADHAT = "I really shouldn't.",
        DRAGONBODYHAT = "I really shouldn't.",
        DRAGONTAILHAT = "I really shouldn't.",
        PERDSHRINE =
        {
            GENERIC = "Hmm..",
            EMPTY = "It requires something.",
            BURNT = "Sigh.",
        },
        REDLANTERN = "How does the fire last? Interesting.",
        LUCKY_GOLDNUGGET = "I suppose I could hold onto it.",
        FIRECRACKERS = "It's a subpar way of dividing attention.",
        PERDFAN = "It's needlessly large.",
        REDPOUCH = "Here's the reward for our \"work\".",
        WARGSHRINE = 
        {
            GENERIC = "Everyone else can enjoy it, I have a cure to develop.",
            EMPTY = "It requires something.",
            BURNT = "Oh no.",
        },
        CLAYWARG = 
        {
        	GENERIC = "That's going to prove difficult.",
        	STATUE = "... This wasn't here before.",
        },
        CLAYHOUND = 
        {
        	GENERIC = "Good heavens, it's alive.",
        	STATUE = "Where did this come from?",
        },
        HOUNDWHISTLE = "It won't necessarily make the dog tame. It'll simply make it submissive.",
        CHESSPIECE_CLAYHOUND = "The Foundation would love it.",
        CHESSPIECE_CLAYWARG = "Such an anomoly.",

		PIGSHRINE =
		{
            GENERIC = "I very well shouldn't be participating in events like these.",
            EMPTY = "It requires something.",
            BURNT = "Sigh.",
		},
		PIG_TOKEN = "One of my patients were wearing this belt.",
		YOTP_FOOD1 = "It's decent.",
		YOTP_FOOD2 = "It's decent.",
		YOTP_FOOD3 = "It's decent.",

		PIGELITE1 = "I apologise, but i refuse to participate in this sport.", --BLUE
		PIGELITE2 = "I apologise, but i refuse to participate in this sport.", --RED
		PIGELITE3 = "I apologise, but i refuse to participate in this sport.", --WHITE
		PIGELITE4 = "I apologise, but i refuse to participate in this sport.", --GREEN

		BISHOP_CHARGE_HIT = "Ergh!",
		TRUNKVEST_SUMMER = "It is rather sub-par.",
		TRUNKVEST_WINTER = "It keeps my vital organs warm.",
		TRUNK_COOKED = "There is a large amount of meat on this.",
		TRUNK_SUMMER = "It is a hefty appendage.",
		TRUNK_WINTER = "It is a thick, hefty appendage.",
		TUMBLEWEED = "Did I just hear an instrument?",
		TURKEYDINNER = "Oh, I yearn for it's delight.",
		TWIGS = "These will undoubtably be of use.",
		UMBRELLA = "Rain is more of a nuisance than anything, really.",
		GRASS_UMBRELLA = "It performs sub-optimally.",
		UNIMPLEMENTED = "It doesn't look finished! It could be dangerous.",
		WAFFLES = "It makes me forget where I am.",
		WALL_HAY = 
		{	
			GENERIC = "It is not at all reassuring.",
			BURNT = "I cannot say that I'm surprised.",
		},
		WALL_HAY_ITEM = "I am not confident with it's ability to protect.",
		WALL_STONE = "I stared at similar walls for a long, long time.",
		WALL_STONE_ITEM = "It only prolongs the inevitable, sadly.",
		WALL_RUINS = "It's made from an ancient metal.",
		WALL_RUINS_ITEM = "I can imagine this holding up well.",
		WALL_WOOD = 
		{
			GENERIC = "That is a fire hazard.",
			BURNT = "This was expected.",
		},
		WALL_WOOD_ITEM = "They are rather flammable.",
		WALL_MOONROCK = "The material come from the stars.",
		WALL_MOONROCK_ITEM = "It's rather light, surprisingly.",
		FENCE = "It's not the sturdiest thing in the world...",
        FENCE_ITEM = "I will not be the one \"contained\" this time.",
        FENCE_GATE = "The fence would just be a nuisance without it.",
        FENCE_GATE_ITEM = "It's secure, relatively speaking.",
		WALRUS = "He's the hunter, or at least, that is what he believes.",
		WALRUSHAT = "It's a very sophisticated garment.",
		WALRUS_CAMP =
		{
			EMPTY = "Someone was here.",
			GENERIC = "I do miss a roof over my head.",
		},
		WALRUS_TUSK = "I could use this for a tool, perhaps.",
		WARDROBE = 
		{
			GENERIC = "I am fine with what I have.",
            BURNING = "Oh my, it is on fire.",
			BURNT = "It is gone.",
		},
		WARG = "Oh my, is that the pack leader?",
		WASPHIVE = "It is not at all inviting.",
		WATERBALLOON = "Do. Not. Throw this at me.",
		WATERMELON = "I dislike the mess it makes.",
		WATERMELON_COOKED = "Suprisingly, it retained it's juices.",
		WATERMELONHAT = "Errgh...",
		WAXWELLJOURNAL = "Perhaps it could help the cure's progress.",
		WETGOOP = "There is absolutely no sustinence to be had.",
	WHIP = "If you want peace this way, you may as well kill the animal.",
		WINTERHAT = "Regardless of weather, the Pestilence never ceases.",
		WINTEROMETER = 
		{
			GENERIC = "I will have ample time to prepare for the next season.",
			BURNT = "Im worried about where the mercury went.",
		},

        WINTER_TREE =
        {
            BURNT = "That is a great shame.",
            BURNING = "Oh, dear.",
            CANDECORATE = "I'll allow the others to celebrate.",
            YOUNG = "It's coming along nicely.",
        },
		WINTER_TREESTAND = 
		{
			GENERIC = "There is surely a spare pinecone somewhere.",
            BURNT = "That is a great shame.",
		},
        WINTER_ORNAMENT = "It is a cheerful sight, but it is not necessary.",
        WINTER_ORNAMENTLIGHT = "I have seen my fair share of blaring red lights.",
        WINTER_ORNAMENTBOSS = "I'm not sure why they had it to begin with.",
		WINTER_ORNAMENTFORGE = "I suppose it would look stunning over a fireplace.",
		WINTER_ORNAMENTGORGE = "Perhaps this could go in a kitchen.",

        WINTER_FOOD1 = "Normally I wouldn't eat something like this.", --gingerbread cookie
        WINTER_FOOD2 = "Normally I wouldn't eat something like this.", --sugar cookie
        WINTER_FOOD3 = "Normally I wouldn't eat something like this.", --candy cane
        WINTER_FOOD4 = "I refuse to eat it.", --fruitcake
        WINTER_FOOD5 = "Normally I wouldn't eat something like this.", --yule log cake
        WINTER_FOOD6 = "Normally I wouldn't eat something like this.", --plum pudding
        WINTER_FOOD7 = "Normally I wouldn't eat something like this.", --apple cider
        WINTER_FOOD8 = "Ah, I can enjoy myself with this.", --hot cocoa
        WINTER_FOOD9 = "Normally I wouldn't eat something like this.", --eggnog

		--Dishes are not final - let these be for now
		WINTERSFEASTOVEN =
		{
			GENERIC = "Hm, it is impressive cookware.",
			COOKING = "It needs no further interaction.",
			ALMOST_DONE_COOKING = "Ah, I can smell it already.",
			DISH_READY = "Delightful.",
		},
		BERRYSAUCE = "A lovely sauce for the main course.",
		BIBINGKA = "A pleasant side dish.",
		CABBAGEROLLS = "I haven't eaten this well since, well, before the Foundation.",
		FESTIVEFISH = "Ah, this seafood has been prepared to my liking.",
		GRAVY = "This gravy is all satisfying.",
		LATKES = "The holiday season *does* have it's charm.",
		LUTEFISK = "These are some wonderful dishes.",
		MULLEDDRINK = "When was the last time I had a proper drink?",
		PANETTONE = "Lovely bread, perhaps we could spread something on it.",
		PAVLOVA = "The smell. Oh, the smell.",
		PICKLEDHERRING = "I love seafood when prepared correctly.",
		POLISHCOOKIE = "I am not one for cookies, but perhaps I could spare a bite.",
		PUMPKINPIE = "Pumpkin pie, simply exquisite.",
		ROASTTURKEY = "Ah, I assume that is the main course?",
		STUFFING = "This stuffing is heavenly.",
		SWEETPOTATO = "Mm, I'd love to pour some gravy on it.",
		TAMALES = "Oh, a spanish dish. I don't normally enjoy those, but these are exquisite.",
		TOURTIERE = "Hm.",

		TABLE_WINTERS_FEAST = 
		{
			GENERIC = "Worry not, I will use a knife and fork.",
			HAS_FOOD = "I should be working on my cure, although I may spare a meal.",
			WRONG_TYPE = "I'm afraid not.",
			BURNT = "One of the few luxuries we have, reduced to ashes.",
		},

		GINGERBREADWARG = "Surely, it can't be too durable.", 
		GINGERBREADHOUSE = "Fascinating.", 
		GINGERBREADPIG = "A living cookie? Perhaps I have gone mad.",
		CRUMBS = "Their version of bread crumbs, I presume?",
		WINTERSFEASTFUEL = "I... must not. I... have a cure to research.",

        KLAUS = "The lord of winter season.",
        KLAUS_SACK = "Oh? What could this be?",
		KLAUSSACKKEY = "It has a very intricate and unique design.",
		WORMHOLE =
		{
			GENERIC = "Oh my, that thing appears to be alive.",
			OPEN = "My self-preservation instincts dislike this, very much.",
		},
		WORMHOLE_LIMITED = "Oh dear, something is wrong with it.",
		ACCOMPLISHMENT_SHRINE = "I would rather not waste time on this.",        
		LIVINGTREE = "Er, greetings...?",
		ICESTAFF = "No more running.",
		REVIVER = "Blood for blood.",
		SHADOWHEART = "It's still beating.",
        ATRIUM_RUBBLE = 
        {
			LINE_1 = "A civilization, obviously struck with the Pestilence.",
			LINE_2 = "These drawings have aged beyond comprehension.",
			LINE_3 = "Something is approaching the sick denizens. A cloud?",
			LINE_4 = "It has encased the city, morphing it into...",
			LINE_5 = " Oh my goodness...!",
		},
        ATRIUM_STATUE = "This feels like a dream, but not.",
        ATRIUM_LIGHT = 
        {
			ON = "I don't like the look of it.",
			OFF = "It's not powered.",
		},
        ATRIUM_GATE =
        {
			ON = "It's working.",
			OFF = "It appears that it's still able to function.",
			CHARGING = "Give it time to charge.",
			DESTABILIZING = "Oh dear, this doesn't look so good.",
			COOLDOWN = "It's not quite ready.",
        },
        ATRIUM_KEY = "The next piece of the puzzle.",
		LIFEINJECTOR = "It regenerates decayed tissue.",
		SKELETON_PLAYER =
		{
			MALE = "%s's corpse. %s was the cause of this.",
			FEMALE = "%s's corpse. %s was the cause of this.",
			ROBOT = "%s's corpse. %s was the cause of this.",
			DEFAULT = "%s's corpse. %s was the cause of this.",
		},
		HUMANMEAT = "Flesh is flesh. Where do I draw the line?",
		HUMANMEAT_COOKED = "Cooked nice and pink, but still morally gray.",
		HUMANMEAT_DRIED = "Letting it dry makes it not come from a human, right?",
		ROCK_MOON = "This rock's origin is far from here.",
		MOONROCKNUGGET = "This rock's origin is far from here.",
		MOONROCKCRATER = "It raises my curiosity.",
		MOONROCKSEED = "It's just as much of an SCP as I am.",

        REDMOONEYE = "It proves itself as a useful map marker.",
        PURPLEMOONEYE = "It proves itself as a useful map marker.",
        GREENMOONEYE = "It proves itself as a useful map marker.",
        ORANGEMOONEYE = "It proves itself as a useful map marker.",
        YELLOWMOONEYE = "It proves itself as a useful map marker.",
        BLUEMOONEYE = "It proves itself as a useful map marker.",

        --Arena Event
        LAVAARENA_BOARLORD = "You reek of the disease, good sir.",
        BOARRIOR = "Oh. I can't handle him on my own.",
        BOARON = "You will fall.",
        PEGHOOK = "Their spit will melt you to the bone if you're not careful.",
        TRAILS = "He's got a strong arm on him.",
        TURTILLUS = "Its shell is so spiky!",
        SNAPPER = "This one's got bite.",
		RHINODRILL = "He's got a nose for this kind of work.",
		BEETLETAUR = "I can smell him from here!",

        LAVAARENA_PORTAL = 
        {
            ON = "I'll just be going now.",
            GENERIC = "That's how we got here. Hopefully how we get back, too.",
        },
        LAVAARENA_KEYHOLE = "It needs a key.",
		LAVAARENA_KEYHOLE_FULL = "That should do it.",
        LAVAARENA_BATTLESTANDARD = "Everyone, break the Battle Standard!",
        LAVAARENA_SPAWNER = "This is where those enemies are coming from.",

        HEALINGSTAFF = "It conducts regenerative energy.",
        FIREBALLSTAFF = "It calls a meteor from above.",
        HAMMER_MJOLNIR = "It's a heavy hammer for hitting things.",
        SPEAR_GUNGNIR = "I could do a quick charge with that.",
        BLOWDART_LAVA = "That's a weapon I could use from range.",
        BLOWDART_LAVA2 = "It uses a strong blast of air to propel a projectile.",
        LAVAARENA_LUCY = "That weapon's for throwing.",
        WEBBER_SPIDER_MINION = "I guess they're fighting for us.",
        BOOK_FOSSIL = "This'll keep those monsters held for a little while.",
		LAVAARENA_BERNIE = "He might make a good distraction for us.",
		SPEAR_LANCE = "It gets to the point.",
		BOOK_ELEMENTAL = "I can't make out the text.",
		LAVAARENA_ELEMENTAL = "It's a rock monster!",

   		LAVAARENA_ARMORLIGHT = "Light, but not very durable.",
		LAVAARENA_ARMORLIGHTSPEED = "Lightweight and designed for mobility.",
		LAVAARENA_ARMORMEDIUM = "It offers a decent amount of protection.",
		LAVAARENA_ARMORMEDIUMDAMAGER = "That could help me hit a little harder.",
		LAVAARENA_ARMORMEDIUMRECHARGER = "I'd have energy for a few more stunts wearing that.",
		LAVAARENA_ARMORHEAVY = "That's as good as it gets.",
		LAVAARENA_ARMOREXTRAHEAVY = "This armor has been petrified for maximum protection.",

		LAVAARENA_FEATHERCROWNHAT = "Those fluffy feathers make me want to run!",
        LAVAARENA_HEALINGFLOWERHAT = "The blossom interacts well with healing magic.",
        LAVAARENA_LIGHTDAMAGERHAT = "My strikes would hurt a little more wearing that.",
        LAVAARENA_STRONGDAMAGERHAT = "It looks like it packs a wallop.",
        LAVAARENA_TIARAFLOWERPETALSHAT = "Looks like it amplifies healing expertise.",
        LAVAARENA_EYECIRCLETHAT = "It has a gaze full of science.",
        LAVAARENA_RECHARGERHAT = "Those crystals will quickened my abilities.",
        LAVAARENA_HEALINGGARLANDHAT = "This garland will restore a bit of my vitality.",
        LAVAARENA_CROWNDAMAGERHAT = "That could cause some major destruction.",

		LAVAARENA_ARMOR_HP = "That should keep me safe.",

		LAVAARENA_FIREBOMB = "It smells like brimstone.",
		LAVAARENA_HEAVYBLADE = "A sharp looking instrument.",

        --Quagmire
        QUAGMIRE_ALTAR = 
        {
        	GENERIC = "We'd better start cooking some offerings.",
        	FULL = "It's in the process of digestinating.",
    	},
		QUAGMIRE_ALTAR_STATUE1 = "It's an old statue.",
		QUAGMIRE_PARK_FOUNTAIN = "Been a long time since it was hooked up to water.",
		--
        QUAGMIRE_HOE = "It's a farming instrument.",
        --
        QUAGMIRE_TURNIP = "It's a raw turnip.",
        QUAGMIRE_TURNIP_COOKED = "Cooking is science in practice.",
        QUAGMIRE_TURNIP_SEEDS = "A handful of odd seeds.",
        --
        QUAGMIRE_GARLIC = "The number one breath enhancer.",
        QUAGMIRE_GARLIC_COOKED = "Perfectly browned.",
        QUAGMIRE_GARLIC_SEEDS = "A handful of odd seeds.",
        --
        QUAGMIRE_ONION = "Looks crunchy.",
        QUAGMIRE_ONION_COOKED = "A successful chemical reaction.",
        QUAGMIRE_ONION_SEEDS = "A handful of odd seeds.",
        --
        QUAGMIRE_POTATO = "The apples of the earth.",
        QUAGMIRE_POTATO_COOKED = "A successful temperature experiment.",
        QUAGMIRE_POTATO_SEEDS = "A handful of odd seeds.",
        --
        QUAGMIRE_TOMATO = "It's red because it's full of science.",
        QUAGMIRE_TOMATO_COOKED = "Cooking's easy if you understand chemistry.",
        QUAGMIRE_TOMATO_SEEDS = "A handful of odd seeds.",
        --
        QUAGMIRE_FLOUR = "Ready for baking.",
        QUAGMIRE_WHEAT = "It looks a bit grainy.",
        QUAGMIRE_WHEAT_SEEDS = "A handful of odd seeds.",
        --NOTE: raw/cooked carrot uses regular carrot strings
        QUAGMIRE_CARROT_SEEDS = "A handful of odd seeds.",
        --
        QUAGMIRE_ROTTEN_CROP = "I don't think the altar will want that.",
        --
		QUAGMIRE_SALMON = "Mm, fresh fish.",
		QUAGMIRE_SALMON_COOKED = "Ready for the dinner table.",
		QUAGMIRE_CRABMEAT = "No imitations here.",
		QUAGMIRE_CRABMEAT_COOKED = "I can put a meal together in a pinch.",
        QUAGMIRE_POT = "This one holds more ingredients.",
        QUAGMIRE_POT_SMALL = "Let's get cooking!",
        QUAGMIRE_POT_HANGER_ITEM = "For suspension-based cookery.",
		QUAGMIRE_SUGARWOODTREE = 
		{
			GENERIC = "It's full of delicious, delicious sap.",
			STUMP = "Where'd the tree go? I'm stumped.",
			TAPPED_EMPTY = "Here sappy, sappy, sap.",
			TAPPED_READY = "Sweet golden sap.",
			TAPPED_BUGS = "That's how you get ants.",
			WOUNDED = "It looks ill.",
		},
		QUAGMIRE_SPOTSPICE_SHRUB = 
		{
			GENERIC = "It reminds me of those tentacle monsters.",
			PICKED = "I can't get anymore out of that shrub.",
		},
		QUAGMIRE_SPOTSPICE_SPRIG = "I could grind it up to make a spice.",
		QUAGMIRE_SPOTSPICE_GROUND = "Flavorful.",
		QUAGMIRE_SAPBUCKET = "We can use it to gather sap from the trees.",
		QUAGMIRE_SAP = "It tastes sweet.",
		QUAGMIRE_SALT_RACK =
		{
			READY = "Salt has gathered on the rope.",
			GENERIC = "Science takes time.",
		},
		
		QUAGMIRE_POND_SALT = "A little salty spring.",
		QUAGMIRE_SALT_RACK_ITEM = "For harvesting salt from the pond.",

		QUAGMIRE_SAFE = 
		{
			GENERIC = "It's a safe. For keeping things safe.",
			LOCKED = "It won't open without the key.",
		},

		QUAGMIRE_KEY = "Safe bet this'll come in handy.",
		QUAGMIRE_KEY_PARK = "I'll park it in my pocket until I get to the park.",
        QUAGMIRE_PORTAL_KEY = "This looks science-y.",

		
		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "Are those mushrooms? I'm stumped.",
			PICKED = "I don't think it's growing back.",
		},
		QUAGMIRE_MUSHROOMS = "These are edible mushrooms.",
        QUAGMIRE_MEALINGSTONE = "The daily grind.",
		QUAGMIRE_PEBBLECRAB = "That rock's alive!",

		--
		QUAGMIRE_RUBBLE_CARRIAGE = "On the road to nowhere.",
        QUAGMIRE_RUBBLE_CLOCK = "Someone beat the clock. Literally.",
        QUAGMIRE_RUBBLE_CATHEDRAL = "Preyed upon.",
        QUAGMIRE_RUBBLE_PUBDOOR = "No longer a-door-able.",
        QUAGMIRE_RUBBLE_ROOF = "Someone hit the roof.",
        QUAGMIRE_RUBBLE_CLOCKTOWER = "That clock's been punched.",
        QUAGMIRE_RUBBLE_BIKE = "Must have mis-spoke.",
        QUAGMIRE_RUBBLE_HOUSE = {"No one's here.", "Something destroyed this town.", "I wonder who they angered.",},
        QUAGMIRE_RUBBLE_CHIMNEY = "Something put a damper on that chimney.",
        QUAGMIRE_RUBBLE_CHIMNEY2 = "Something put a damper on that chimney.",
        QUAGMIRE_MERMHOUSE = "What an ugly little house.",
        QUAGMIRE_SWAMPIG_HOUSE = "It's seen better days.",
        QUAGMIRE_SWAMPIG_HOUSE_RUBBLE = "Some pig's house was ruined.",
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "I guess you're in charge around here?",
            SLEEPING = "It's sleeping, for now.",
        },
        QUAGMIRE_SWAMPIG = "It's a super hairy pig.",
        --
        QUAGMIRE_PORTAL = "Another dead end.",
        QUAGMIRE_SALTROCK = "Salt. The tastiest mineral.",
        QUAGMIRE_SALT = "It's full of salt.",
        --food--
        QUAGMIRE_FOOD_BURNT = "That one was an experiment.",
        --QUAGMIRE_FOOD_PLATE = "It has a lot on its plate.",
        --QUAGMIRE_FOOD_BOWL = "Well bowl me over.",
        --QUAGMIRE_FOOD_SOUP = "Soup's on!",
        --QUAGMIRE_FOOD_SNACK = "This should tide me over.",
        --QUAGMIRE_FOOD_BREAD = "That's what all the wheat is for.",
        --QUAGMIRE_FOOD_PASTA = "I've masta-d this pasta.",
        --QUAGMIRE_FOOD_VEGGIE = "Full of fresh vegetables.",
        --QUAGMIRE_FOOD_MEAT = "I'm pro-protein.",
        --QUAGMIRE_FOOD_FISH = "Science says fatty acids are good for me.",
        --QUAGMIRE_FOOD_CRAB = "Not as crabby as I thought.",
        --QUAGMIRE_FOOD_CHEESE = "Cheese it!",
        --QUAGMIRE_FOOD_SWEET = "This dessert won't desert you.",
        QUAGMIRE_FOOD =
        {
        	GENERIC = "I should offer it on the Altar of Gnaw.",
            MISMATCH = "That's not what it wants.",
            MATCH = "Science says this will appease the sky God.",
            MATCH_BUT_SNACK = "It's more of a light snack, really.",
        },
        --
        QUAGMIRE_FERN = "Probably chock full of vitamins.",
        QUAGMIRE_FOLIAGE_COOKED = "We cooked the foliage.",
        QUAGMIRE_COIN1 = "I'd like more than a penny for my thoughts.",
        QUAGMIRE_COIN2 = "A decent amount of coin.",
        QUAGMIRE_COIN3 = "Seems valuable.",
        QUAGMIRE_COIN4 = "We can use these to reopen the Gateway.",
        QUAGMIRE_GOATMILK = "Good if you don't think about where it came from.",
        QUAGMIRE_SYRUP = "Adds sweetness to the mixture.",
        QUAGMIRE_SAP_SPOILED = "Might as well toss it on the fire.",
        --QUAGMIRE_SEEDPACKET = "It's a packet of seeds.",
        QUAGMIRE_SEEDPACKET = "Sow what?",
        --QUAGMIRE_SEEDPACKET_MEDIUM = "Gone to seed.",
        --QUAGMIRE_SEEDPACKET_LARGE = "I think someone planted this on me.",
        --QUAGMIRE_SEEDPACKET_MIX_SMALL = "A little seedy.",
        --QUAGMIRE_SEEDPACKET_MIX_MEDIUM = "A mixed bag.",
        --QUAGMIRE_SEEDPACKET_MIX_LARGE = "A packet packed with seeds.",
        ---
        QUAGMIRE_POT = "This pot holds more ingredients.",
        QUAGMIRE_POT_SMALL = "Let's get cooking!",
        QUAGMIRE_POT_SYRUP = "I need to sweeten this pot.",
        QUAGMIRE_POT_HANGER = "It has hang-ups.",
        QUAGMIRE_POT_HANGER_ITEM = "For suspension-based cookery.",
        QUAGMIRE_GRILL = "Now all I need is a backyard to put it in.",
        QUAGMIRE_GRILL_ITEM = "I'll have to grill someone about this.",
        QUAGMIRE_GRILL_SMALL = "Barbecurious.",
        QUAGMIRE_GRILL_SMALL_ITEM = "For grilling small meats.",
        QUAGMIRE_OVEN = "It needs ingredients to make the science work.",
        QUAGMIRE_OVEN_ITEM = "For scientifically burning things.",
        QUAGMIRE_CASSEROLEDISH = "A dish for all seasonings.",
        QUAGMIRE_CASSEROLEDISH_SMALL = "For making minuscule motleys.",
        QUAGMIRE_PLATE_SILVER = "A silver plated plate.",
        QUAGMIRE_BOWL_SILVER = "A bright bowl.",
        QUAGMIRE_CRATE = "Kitchen stuff.",
        ---
        QUAGMIRE_MERM_CART1 = "Any science in there?", --sammy's wagon
        QUAGMIRE_MERM_CART2 = "I could use some stuff.", --pipton's cart
        QUAGMIRE_PARK_ANGEL = "Take that, creature!",
        QUAGMIRE_PARK_ANGEL2 = "So lifelike.",
        QUAGMIRE_PARK_URN = "Ashes to ashes.",
        QUAGMIRE_PARK_OBELISK = "A monumental monument.",
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "Turns out a key was the key to getting in.",
            LOCKED = "Locked tight.",
        },
        QUAGMIRE_PARKSPIKE = "The scientific term is: \"Sharp pointy thing\".",
        QUAGMIRE_CRABTRAP = "A crabby trap.",
        QUAGMIRE_TRADER_MERM = "Maybe they'd be willing to trade.",
        QUAGMIRE_TRADER_MERM2 = "Maybe they'd be willing to trade.",
        --
        QUAGMIRE_GOATMUM = "Reminds me of my old nanny.",
        QUAGMIRE_GOATKID = "This goat's much smaller.",
        QUAGMIRE_PIGEON =
        {
            DEAD = "They're dead.",
            GENERIC = "He's just winging it.",
            SLEEPING = "It's sleeping, for now.",
        },
        QUAGMIRE_LAMP_POST = "Huh. Reminds me of home.",

        QUAGMIRE_BEEFALO = "Science says it should have died by now.",
        QUAGMIRE_SLAUGHTERTOOL = "Laboratory tools for surgical butchery.",

        QUAGMIRE_SAPLING = "I can't get anything else out of that.",
        QUAGMIRE_BERRYBUSH = "Those berries are all gone.",

        QUAGMIRE_ALTAR_STATUE2 = "What are you looking at?",
        QUAGMIRE_ALTAR_QUEEN = "A monumental monument.",
        QUAGMIRE_ALTAR_BOLLARD = "As far as posts go, this one is adequate.",
        QUAGMIRE_ALTAR_IVY = "Kind of clingy.",

        QUAGMIRE_LAMP_SHORT = "Enlightening.",

        --v2 Winona
        WINONA_CATAPULT = 
        {
        	GENERIC = "It's useful enough.",
        	OFF = "It requires power.",
        	BURNING = "Oh my.",
        	BURNT = "What a shame.",
        },
        WINONA_SPOTLIGHT = 
        {
        	GENERIC = "It proves to be useful.",
        	OFF = "It requires power.",
        	BURNING = "Oh my.",
        	BURNT = "What a shame.",
        },
        WINONA_BATTERY_LOW = 
        {
        	GENERIC = "It appears to work just like any other generator.",
        	LOWPOWER = "It'll run out of power soon.",
        	OFF = "It doesn't have any fuel left.",
        	BURNING = "Oh my.",
        	BURNT = "What a shame.",
        },
        WINONA_BATTERY_HIGH = 
        {
        	GENERIC = "These gems are quite useful.",
        	LOWPOWER = "It'll run out of power soon.",
        	OFF = "It doesn't have any fuel left.",
        	BURNING = "Oh my.",
        	BURNT = "What a shame.",
        },

        BOATFRAGMENT01 = "Not much left of it.",
        BOATFRAGMENT02 = "Not much left of it.",
        BOATFRAGMENT03 = "Not much left of it.",
        BOATFRAGMENT04 = "Not much left of it.",
        BOATFRAGMENT05 = "Not much left of it.",
		BOAT_LEAK = "Oh dear, that desperately needs my attention.",
        MAST = "Who knows what I can find out there.",
        SEASTACK = "That's going to easily wreck this vessel if I'm not careful.",
        FISHINGNET = "It's a fishing net. What else is there to say?",
        ANTCHOVIES = "It's not good on the eyes, to say the least.",
        STEERINGWHEEL = "Now, let's see what we can find.",
        ANCHOR = "It keeps the vessel where it should be.",
        BOATPATCH = "It's smart to prepare for the worst.",
        DRIFTWOOD_TREE = 
        {
            BURNING = "Oh dear, that's a shame.",
            BURNT = "A shame.",
            CHOPPED = "Perhaps I can still get the rest of it.",
            GENERIC = "Oh, what could this be?",
        },

        DRIFTWOOD_LOG = "It's notably buoyant.",

        MOON_TREE = 
        {
            BURNING = "Oh dear, that's a shame.",
            BURNT = "A shame.",
            CHOPPED = "I'm surprised it was able to be chopped down in the first place.",
            GENERIC = "The flora here is incredibly bizzare.",
        },
		MOON_TREE_BLOSSOM = "I wouldn't be opposed to putting these in my mask.",

        MOONBUTTERFLY = 
        {
        	GENERIC = "This is such a bizzare place.",
        	HELD = "I need to examine you further.",
        },
		MOONBUTTERFLYWINGS = "To fly, no more.",
        MOONBUTTERFLY_SAPLING = "Did-... Did that moth turn into a tree...?",
        ROCK_AVOCADO_FRUIT = "I don't quite think that's edible.",
        ROCK_AVOCADO_FRUIT_RIPE = "I still don't think it's edible.",
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "Hmm, perhaps now you can eat it.",
        ROCK_AVOCADO_FRUIT_SPROUT = "It's growing.",
        ROCK_AVOCADO_BUSH = 
        {
        	BARREN = "I suppose it won't bear anymore fruit.",
			WITHERED = "The heat is killing it.",
			GENERIC = "It's a bush that bears... rocks.",
			PICKED = "Give it time to grow.",
			DISEASED = "This disease is foreign to me.",
            DISEASING = "Good heavens, what is that stench?",
			BURNING = "Oh dear, there goes that bush.",
		},
        DEAD_SEA_BONES = "Melancholy.",
        HOTSPRING = 
        {
        	GENERIC = "I'd advise against getting in it.",
        	BOMBED = "That worked perfectly. Excellent.",
        	GLASS = "... This entire island can be an SCP.",
        },
        MOONGLASS = "This glass is extraordinarily sharp.",
        MOONGLASS_ROCK = "It doubles as a mirror, practically.",
        BATHBOMB = "I suppose I can throw one into one of those springs.",
        TRAP_STARFISH =
        {
            GENERIC = "Im guessing it washed up from the ocean.",
            CLOSED = "Good heavens, that hurts.",
        },
        DUG_TRAP_STARFISH = "Perhaps I can exploit it for my own uses.",
        SPIDER_MOON = 
        {
        	GENERIC = "An abomination.",
        	SLEEPING = "I should put it out of it's misery.",
        	DEAD = "Sigh.",
        },
        MOONSPIDERDEN = "Oh my, I think that's still alive.",
		FRUITDRAGON =
		{
			GENERIC = "They appear to be territorial over these ponds.",
			RIPE = "It's rich colors remind me of exotic fruit.",
			SLEEPING = "It's unconcious.",
		},
        PUFFIN =
        {
            GENERIC = "I'm not sure what this is.",
            HELD = "Whatever it is, I caught it.",
            SLEEPING = "It's unconcious.",
        },

		MOONGLASSAXE = "It's sharper than anything flint or gold can accomplish.",
		GLASSCUTTER = "You could use this for amputation.",

        ICEBERG =
        {
            GENERIC = "I'd rather not crash into it.",
            MELTED = "It melted, for now.",
        },
        ICEBERG_MELTED = "It melted, for now.",

        MINIFLARE = "Now I'll never lose my colleagues.",

		MOON_FISSURE = 
		{
			GENERIC = "The very island itself is promising me knowledge to advance the cure.", 
			NOLIGHT = "Those cracks are becoming more and more noticable.",
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "It's asking to be a whole again.",
            GENERIC = "The Pestilence? What about the Pestilence?",
        },

        MOON_ALTAR_IDOL = "It looks like a piece to something.",
        MOON_ALTAR_GLASS = "It looks like a piece to something.",
        MOON_ALTAR_SEED = "It looks like a piece to something.",

        MOON_ALTAR_ROCK_IDOL = "Something's in there.",
        MOON_ALTAR_ROCK_GLASS = "Something's in there.",
        MOON_ALTAR_ROCK_SEED = "Something's in there.",

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "It allows for sea exploration.",
            BURNT = "Well, time to make another one.",
        },
        SEAFARER_KIT = "It has the materials for a decent-sized vessel.",
        BOAT_ITEM = "It has the materials for a decent-sized vessel.",
        STEERINGWHEEL_ITEM = "It's a necessity for any boat.",
        ANCHOR_ITEM = "It's a necessity for any boat.",
        MUTATEDHOUND = 
        {
        	DEAD = "... Excuse me?",
        	GENERIC = "Oh my. this could help me with my cure efforts.",
        	SLEEPING = "Ah, lovely. Now I have a moment to study it.",
        },

        MUTATED_PENGUIN = 
        {
			DEAD = "Ergh...",
			GENERIC = "Oh my, I can see it's organs.",
			SLEEPING = "I should put it out of it's misery.",
		},
        CARRAT = 
        {
        	DEAD = "Hopefully it tastes like a carrot.",
        	GENERIC = "That's not a carrot.",
        	HELD = "You definitely don't have the prettiest face.",
        	SLEEPING = "That animal is absurdly strange.",
        },

		BULLKELP_PLANT = 
        {
            GENERIC = "Hmm, judging by it's look, I suppose it would suffice as a makeshift weapon.",
            PICKED = "It's been harvested.",
        },
		BULLKELP_ROOT = "It should probably be put back in the ocean.",
        KELPHAT = "Oh. I don't want to wear that, thank you very much.",
		KELP = "I want it nowhere near my garments.",
		KELP_COOKED = "It's still extremely wet.",
		KELP_DRIED = "I've heard this is good for you.",

		GESTALT = "Advancements to my cure, you say?",

		COOKIECUTTER = "Oh, splendid, they possess a thick shell.",
		COOKIECUTTERSHELL = "This was rather annoying to break through.",
		COOKIECUTTERHAT = "I suppose it's more durable.",
		SALTSTACK =
		{
			GENERIC = "Those appear to be in the shape of human beings. Odd.",
			MINED_OUT = "Nothing left.",
			GROWING = "I don't need to know the workings of it.",
		},
		SALTROCK = "Perhaps these could have culinary uses?",
		SALTBOX = "It's better than the conventional ice box.",

		TACKLESTATION = "Must I really take up fishing, with the Pestilence about?",
		TACKLESKETCH = "A simple sketch. I have no further interest in it.",

        MALBATROSS = "A legend of the ocean.",
        MALBATROSS_FEATHER = "A feather plucked straight from myth.",
        MALBATROSS_BEAK = "I don't see many uses for it.",
        MAST_MALBATROSS_ITEM = "I have several technical questions about this.",
        MAST_MALBATROSS = "We are metaphorically soaring across the water.",
		MALBATROSS_FEATHERED_WEAVE = "Individual feathers aren't useful on their own.",

        GNARWAIL =
        {
            GENERIC = "The protruding horn is surely a recipe for a bad day.",
            BROKENHORN = "I suppose it's mine now.",
            FOLLOWER = "I am wary to trust it.",
            BROKENHORN_FOLLOWER = "I will put the horn to good use.",
        },
        GNARWAIL_HORN = "I can surely fashion it into a stabbing weapon.",

        WALKINGPLANK = "I hope this remains unused.",
        OAR = "Must I be the one to do this?",
		OAR_DRIFTWOOD = "It helps get from point A to point B.",

		OCEANFISHINGROD = "I do not care for robust fishing.",
		OCEANFISHINGBOBBER_NONE = "I do not care for robust fishing.",
        OCEANFISHINGBOBBER_BALL = "I suppose it's just a visible marker?",
        OCEANFISHINGBOBBER_OVAL = "Must I...?",
		OCEANFISHINGBOBBER_CROW = "We don't *need* to fish, we have sufficient food on land.",
		OCEANFISHINGBOBBER_ROBIN = "We don't *need* to fish, we have sufficient food on land.",
		OCEANFISHINGBOBBER_ROBIN_WINTER = "We don't *need* to fish, we have sufficient food on land.",
		OCEANFISHINGBOBBER_CANARY = "We don't *need* to fish, we have sufficient food on land.",
		OCEANFISHINGBOBBER_GOOSE = "We don't *need* to fish, we have sufficient food on land.",
		OCEANFISHINGBOBBER_MALBATROSS = "We don't *need* to fish, we have sufficient food on land.",

		OCEANFISHINGLURE_SPINNER_RED = "The most vital part. I still don't care for it.",
		OCEANFISHINGLURE_SPINNER_GREEN = "The most vital part. I still don't care for it.",
		OCEANFISHINGLURE_SPINNER_BLUE = "The most vital part. I still don't care for it.",
		OCEANFISHINGLURE_SPOON_RED = "The most vital part. I still don't care for it.",
		OCEANFISHINGLURE_SPOON_GREEN = "The most vital part. I still don't care for it.",
		OCEANFISHINGLURE_SPOON_BLUE = "The most vital part. I still don't care for it.",

		OCEANFISH_SMALL_1 = "This is not worth my time...",
		OCEANFISH_SMALL_2 = "Fishing is a misuse of my important time.",
		OCEANFISH_SMALL_3 = "I urge you, get someone else to do this.",
		OCEANFISH_SMALL_4 = "We have much larger sources of food on land.",
		OCEANFISH_SMALL_5 = "Not even a light snack.",
		OCEANFISH_MEDIUM_1 = "It's sizable enough. Still not worth the time.",
		OCEANFISH_MEDIUM_2 = "Not worth it.",
		OCEANFISH_MEDIUM_3 = "I admit, the fish are exotic.",
		OCEANFISH_MEDIUM_4 = "Yes, yes, it's interesting. May I leave now?",
		OCEANFISH_MEDIUM_5 = "Sigh.",

		PONDFISH = "I'd much rather cook this first.",
		PONDEEL = "Don't these sting?",

        FISHMEAT = "I suppose it's a sizable amount of fish meat.",
        FISHMEAT_COOKED = "I will admit, the taste is satisfactory.",
        FISHMEAT_SMALL = "A bite.",
        FISHMEAT_SMALL_COOKED = "A small snack..",
		SPOILED_FISH = "Goodness, this must be thrown out.",

		FISH_BOX = "A container for fish. I am in awe.",
        POCKET_SCALE = "It is used to weigh fish.",

		TROPHYSCALE_FISH =
		{
			GENERIC = "I personally don't care for it.",
			HAS_ITEM = "Weight: {weight}\nCaught by: {owner}",
			BURNING = "Oh no, our most valuable possessions.",
			BURNT = "Oh, how I mourn for it...",
			OWNER = "There, I caught one, now stop pestering me.\nWeight: {weight}\nCaught by: {owner}",
		},

		OCEANFISHABLEFLOTSAM = "Splendid.",

		CALIFORNIAROLL = "I was never big on sushi, but I appriciate it's taste.",
		SEAFOODGUMBO = "It's an adequate meal.",
		SURFNTURF = "This is, dare I say, enjoyable.",

        WOBSTER_SHELLER = "They are more of a luxurious meal, eaten on occasion.", 
        WOBSTER_DEN = "I'm too busy with the Pestilence to watch sealife.",
        WOBSTER_SHELLER_DEAD = "I can let it cook whilst I work.",
        WOBSTER_SHELLER_DEAD_COOKED = "I'd rather it be prepared more.",

        LOBSTERBISQUE = "Ah, wonderful.",
        LOBSTERDINNER = "A luxury meal like this helps to clear your mind.",

        WOBSTER_MOONGLASS = "Anyone knows better than to eat glass, surely.",
        MOONGLASS_WOBSTER_DEN = "Very fascinating, it's unfortunate that I'm busy.",

		TRIDENT = "Goodness, not exactly my way of getting food.",
		
		WINCH =
		{
			GENERIC = "Operating with wet hands is certainly not ideal.",
			RETRIEVING_ITEM = "It has something.",
			HOLDING_ITEM = "Hm.",
		},

		HERMITHOUSE_CONSTRUCTION1 = "It lightens the mood.",
        HERMITHOUSE = "A home is a home. All that matters is a roof and sufficient workspace.",
        
        SHELL_CLUSTER = "Do you expect me to start a collection? Heavens no.",
        --
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "I'll let others play with them, I'm eternally busy.",
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "I'll let others play with them, I'm eternally busy.",
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "I'll let others play with them, I'm eternally busy.",
        },

        CHUM = "I'm not disgusted. I simply don't like it.",

        SUNKENCHEST =
        {
            GENERIC = "Like Schrodinger's cat, it could contain everything or nothing.",
            LOCKED = "You can't brute force a lock like this.",
        },

        RESKIN_TOOL = "I don't mind blood in my workspace. Dirt and dust, however, is a different story.",
        MOON_FISSURE_PLUGGED = "That's certainly one way to deal with it.",

		----------------------- ROT STRINGS GO ABOVE HERE ------------------

        --Wortox
        WORTOX_SOUL = "only_used_by_wortox", --only wortox can inspect souls

        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "There are better culinarians than me.",
            DONE = "It proves to be a valuable kitchen asset.",

			COOKING_LONG = "It will be a moment.",
			COOKING_SHORT = "A few seconds.",
			EMPTY = "It's a bit complicated for my liking.",
        },
        
        PORTABLEBLENDER_ITEM = "I will leave that to those who know how to operate it.",
        PORTABLESPICER_ITEM =
        {
            GENERIC = "If I didn't have a job to do, I'd take up cooking.",
            DONE = "That looks delightful, congratulations.",
        },
        SPICEPACK = "It's simply a hat, how would it prevent rations spoiling?",
        SPICE_GARLIC = "It reminds me of delightful Italian food.",
        SPICE_SUGAR = "Sugar helps offset bitterness.",
        SPICE_CHILI = "Spice should be used sparingly, in my opinion.",
        SPICE_SALT = "Spice is lovely when used in moderation.",
        MONSTERTARTARE = "I will pass, despite it being a lovely culinary piece.",
        FRESHFRUITCREPES = "I don't like the overuse of sugar.",
        FROGFISHBOWL = "Hmm...",
        POTATOTORNADO = "I have no words.",
        DRAGONCHILISALAD = "It is more spice than I'd like.",
        GLOWBERRYMOUSSE = "Is the ingredients anomalous? The pot? The chef?",
        VOLTGOATJELLY = "Perhaps I could further increase the efficacy of my grasp.",
        NIGHTMAREPIE = "I am certain that this \"Warly\" fellow is also anomalous.",
        BONESOUP = "Bones aren't exactly edible, but rules do not exist around here.",
        MASHEDPOTATOES = "A simple dish for sure, but a delightful one.",
        POTATOSOUFFLE = "It has a remarkable taste. The chef has my gratitude.",
        MOQUECA = "Absolutely exquisite.",
        GAZPACHO = "A fantastic taste.",
        ASPARAGUSSOUP = "The smell leaves to be desired.",
        VEGSTINGER = "Where did the celery come from?",
        BANANAPOP = "Eat it slowly.",
        CEVICHE = "The chef has my compliments.",
        SALSA = "Oh my, this is not exactly my cup of tea.",
        PEPPERPOPPER = "Goodness...",

        TURNIP = "Another common vegetable.",
        TURNIP_COOKED = "Anything is better when warmed up, I suppose.",
        TURNIP_SEEDS = "It's a handful of seeds.",
        
        GARLIC = "The smell is nauseating if overused.",
        GARLIC_COOKED = "Delightful.",
        GARLIC_SEEDS = "It's a handful of seeds.",
        
        ONION = "One of the few times I shed a tear.",
        ONION_COOKED = "It costed tears.",
        ONION_SEEDS = "It's a handful of seeds.",
        
        POTATO = "The apples of the earth.",
        POTATO_COOKED = "A successful temperature experiment.",
        POTATO_SEEDS = "It's a handful of seeds.",
        
        TOMATO = "A \gift\" to those who insist on subpar jokes.",
        TOMATO_COOKED = "Perhaps it would do well on a salad?",
        TOMATO_SEEDS = "It's a handful of seeds.",

        ASPARAGUS = "A rough vegetable.", 
        ASPARAGUS_COOKED = "I believe it has healing properties.",
        ASPARAGUS_SEEDS = "It's a handful of seeds.",

        PEPPER = "I'd prefer not eating it.",
        PEPPER_COOKED = "The fire, in fact, hasn't reduced it's temperature.",
        PEPPER_SEEDS = "It's a handful of seeds.",

        WEREITEM_BEAVER = "I would like to examinate this \"curse\" further.",
        WEREITEM_GOOSE = "I would like to examinate this \"curse\" further.",
        WEREITEM_MOOSE = "I would like to examinate this \"curse\" further.",

        MERMHAT = "Silly, but it keeps the fishmen docile.",
        MERMTHRONE =
        {
            GENERIC = "It lacks a throne.",
            BURNT = "I am afraid there will not be a ruler anytime soon.",
        },        
        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "That child has plans, from the looks of it.",
            BURNT = "An infuriating setback, for the child at least.",
        },        
        MERMHOUSE_CRAFTED = 
        {
            GENERIC = "A child made that? Impressive.",
            BURNT = "Hm, unfortunate.",
        },

        MERMWATCHTOWER_REGULAR = "A king is defenseless without royal guardsmen.",
        MERMWATCHTOWER_NOKING = "There is no use to it, without a king.",
        MERMKING = "Do kings not have thrones here?",
        MERMGUARD = "They have a glare of distrust.",
        MERM_PRINCE = "... Really?",

        SQUID = "Oh dear, their ink gets everywhere.",

		GHOSTFLOWER = "I am not the only anomalous being in these woods.",
        SMALLGHOST = "A spirit of a deceased child, I presume. You have my condolences.",

        CRABKING = 
        {
            GENERIC = "Hm. How large is it, truly?",
            INERT = "Oddly out of place. Are those gem holes?",
        },
		CRABKING_CLAW = "It can take a limb off, careful.",
		
		MESSAGEBOTTLE = "I remember when such crude forms of communications existed.",
		MESSAGEBOTTLEEMPTY = "A bottle.",

        MEATRACK_HERMIT =
        {
            DONE = "It is sufficently dried.",
            DRYING = "It will take a good amount of time.",
            DRYINGINRAIN = "The rain is proving bothersome.",
            GENERIC = "I can hang things up there to dry.",
            BURNT = "It's too brittle to function correctly.",
            DONE_NOTMEAT = "I suppose it's dry enough.",
            DRYING_NOTMEAT = "I'm not one to sit around.",
            DRYINGINRAIN_NOTMEAT = "Sigh.",
        },
        BEEBOX_HERMIT =
        {
            READY = "It is at it's capacity.",
            FULLHONEY = "It is at it's capacity.",
            GENERIC = "Personally, I don't really care for the taste of honey.",
            NOHONEY = "I have better things to do.",
            SOMEHONEY = "I need to come back later.",
            BURNT = "Tsk, tsk.",
        },

        MOON_FISSURE_PLUGGED = "That's certainly one way to deal with it.",

        HERMITCRAB = "No disease present; I see no reason to harm them.",

        HERMIT_PEARL = "I don't see how this would aid me.",
        HERMIT_CRACKED_PEARL = "It's foolish to give an item sentimental value in the wilderness.",
    },
    DESCRIBE_GENERIC = "I... I am not sure what that is.",
    DESCRIBE_TOODARK = "It is too dark to operate.",
    DESCRIBE_SMOLDERING = "I can still save it.",
    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "Hm.",
    },
}
