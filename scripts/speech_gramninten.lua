-----------------------------------
-- This file is the template for other speech files. Once a new string is added here, simply run PropagateSpeech.bat
-- If you are adding strings that are character specific, or not required by all characters, you will still need to add the strings to speech_wilson.lua,
-- and then add the context string to speech_from_generic.lua. Once you run the PropagateSpeech.bat, you can go into your character's speech file and simply uncomment the new lines.
--
-- There are some caveats about maintaining sane formatting in this file. 
--      -No single line lua tables
--      -Opening and closing brackets should be on their own line
--      -If wilson's speech has X unnamed strings in a table, then all other speech files must have at least X unnamed strings in that context too (example, CHESSPIECE_MOOSEGOOSE has 1 string in wilson, but 2 in wortox), this requirement could be relaxed if required by motifying po_vault.lua) 

return {
	ACTIONFAIL =
	{
        APPRAISE = 
        {
            NOTNOW = "I'll bother them later.",
        },
        REPAIR =
        {
            WRONGPIECE = "That's not quite right, huh?",
        },
        BUILD =
        {
            MOUNTED = "No way am I reaching that.",
            HASPET = "I've already got a pet.",
			TICOON = "I got my own fat cat.",													   
        },
		SHAVE =
		{
			AWAKEBEEFALO = "Um. Don't think that'd be the brightest idea while they're awake...",
			GENERIC = "I can't shave that!",
			NOBITS = "Nothing left for me to shave, really.",
            REFUSE = "only_used_by_woodie",
            SOMEONEELSESBEEFALO = "Doing that to someone's beefalo would just be too cruel.",
		},
		STORE =
		{
			GENERIC = "Nah, that won't fit.",
			NOTALLOWED = "Hmmmm, don't think that goes in there...",
			INUSE = "Hurry up!",
            NOTMASTERCHEF = "I have no idea how to cook, to be frank.",
		},
        CONSTRUCT =
        {
            INUSE = "Looks like they got it under wraps.",
            NOTALLOWED = "Well that's not gonna work...",
            EMPTY = "Hold on, where I'd put those construction tools again?",
            MISMATCH = "That's not right.",
        },
		RUMMAGE =
		{	
			GENERIC = "Nah.",
			INUSE = "Think I'd like to respect their personal space.",
            NOTMASTERCHEF = "I have no idea how to cook, to be frank.",
		},
		UNLOCK =
        {
        	WRONGKEY = "It doesn't fit.",
        },
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "Damn, wrong key!",
        	KLAUS = "UMMMMMM...",
			QUAGMIRE_WRONGKEY = "Damn, wrong key!",
        },
		ACTIVATE = 	 
		{
			LOCKED_GATE = "Locked.",
			HOSTBUSY = "Hurry it up, will ya?",
            CARNIVAL_HOST_HERE = "Oh, there he is.",
            NOCARNIVAL = "He's not gonna show up. Whatever.",						   
		},
		OPEN_CRAFTING =
		{
            PROFESSIONALCHEF = "I just let mom do the cooking.",
			SHADOWMAGIC = "That's not science.",
		},
        COOK =
        {
            GENERIC = "Don't feel like cooking.",
            INUSE = "Someone's got dinner covered. Good.",
            TOOFAR = "It's too far away!",
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "I think I'm missing something here.",
        },
        
		DISMANTLE =
		{
			COOKING = "Let's wait for our meal to finish.",
			INUSE = "I'll take a look once they're done with it",
			NOTEMPTY = "Hold on, let's clean it out first.",
        },
        FISH_OCEAN =
		{
			TOODEEP = "This rod wasn't made for deep sea fishing.",
		},
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "This rod wasn't made for pond fishing.",
		},
        --wickerbottom specific action
        READ =
        {
            GENERIC = "only_used_by_wickerbottom",
            NOBIRDS = "only_used_by_wickerbottom"
        },

        GIVE =
        {
            GENERIC = "Let's not put that there, on second thought.",
            DEAD = "Um. That's a dead body.",
            SLEEPING = "I'll bother them when they wake up.",
            BUSY = "I'll bother them later.",
            ABIGAILHEART = "Can't blame me for thinking outside the box.",
            GHOSTHEART = "Maybe this is a bad idea.",
            NOTGEM = "Let's not do that, Ninten.",
            WRONGGEM = "That's not doing anything.",
            NOTSTAFF = "It... won't... fit!",
            MUSHROOMFARM_NEEDSSHROOM = "I think I need a mushroom.",
            MUSHROOMFARM_NEEDSLOG = "I need those living log things, right?",
            MUSHROOMFARM_NOMOONALLOWED = "I can't plant these right now.",
            SLOTFULL = "I dunno, looks pretty full.",
            FOODFULL = "There's already a meal there.",
            NOTDISH = "Nah, nah, can't feed it that.",
            DUPLICATE = "I already know that one.",
            NOTSCULPTABLE = "I have no clue how to make that into a sculpture.",
            NOTATRIUMKEY = "That's not it.",
            CANTSHADOWREVIVE = "I can't bring that back.",
            WRONGSHADOWFORM = "That's not right.",
            NOMOON = "I need to see the moon for that to work.",
			PIGKINGGAME_MESSY = "I need to clean up first.",
			PIGKINGGAME_DANGER = "I got some friends to deal with first.",
			PIGKINGGAME_TOOLATE = "It's too late for that now.",
			CARNIVALGAME_INVALID_ITEM = "Outta tokens.",
			CARNIVALGAME_ALREADY_PLAYING = "It's already on, Ninten.",
            SPIDERNOHAT = "I am NOT picking you up.",
            TERRARIUM_REFUSE = "You don't want that? Tch. Picky eater.",
            TERRARIUM_COOLDOWN = "It's lost its power.",
            NOTAMONKEY = "I have no idea what you want.",
            QUEENBUSY = "I'll bother her later.",																									   
        },
        GIVETOPLAYER =
        {
            FULL = "Dude, maybe clean out those pockets first!",
            DEAD = "Um. Considering they're dead...",
            SLEEPING = "I'll bother them when they wake up.",
            BUSY = "I'll bother them later.",
        },
        GIVEALLTOPLAYER =
        {
            FULL = "Dude, maybe clean out those pockets first!",
            DEAD = "Um. Considering they're dead...",
            SLEEPING = "I'll bother them when they wake up.",
            BUSY = "I'll bother them later.",
        },
        WRITE =
        {
            GENERIC = "I think it's fine as is.",
            INUSE = "Looks like someone has it under control.",
        },
		REPAIRBOAT = 
		{
			GENERIC = "Looks in tip-top shape to me.",
		},
        DRAW =
        {
            NOIMAGE = "I'm not an artist. I need a reference!",
        },
        CHANGEIN =
        {
            GENERIC = "I don't want to change right now.",
            BURNING = "We can worry about looks later!",
            INUSE = "I'll wait.",
            NOTENOUGHHAIR = "I need more fur.",
            NOOCCUPANT = "It needs something hitched up.",
        },
        ATTUNE =
        {
            NOHEALTH = "I don't feel well enough.",
        },
        MOUNT =
        {
            TARGETINCOMBAT = "Now seems like a bad time to try to get on that thing.",
            INUSE = "Ah. Someone's riding it already.",
			SLEEPING = "Hey, get up!",
        },
        SADDLE =
        {
            TARGETINCOMBAT = "Maybe I should wait...",
        },
        TEACH =
        {
            --Recipes/Teacher
            KNOWN = "I already know that one.",
            CANTLEARN = "I can't learn that one.",

            --MapRecorder/MapExplorer
            WRONGWORLD = "This map was made for some other place.",
			
			--MapSpotRevealer/messagebottle
			MESSAGEBOTTLEMANAGER_NOT_FOUND = "I can't make anything out in this lighting!",--Likely trying to read messagebottle treasure map in caves
			STASH_MAP_NOT_FOUND = "There's no X. What kind of stupid treasure map is this?!",-- Likely trying to read stash map  in world without stash
        },
        WRAPBUNDLE =
        {
            EMPTY = "I need to have something to wrap.",
        },
        PICKUP =
        {
			RESTRICTION = "I'm not skilled enough to use that.",
			INUSE = "Someone's got it covered.",
			NOTMINE_SPIDER = "only_used_by_webber",	
            NOTMINE_YOTC =
            {
                "You're not my Carrat.",
                "OW, it bit me!",
            },
			NO_HEAVY_LIFTING = "only_used_by_wanda",
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
        	REPAIR = "The sail looks good.",
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "W-wait, how do I row again?!",
            BAD_TIMING1 = "I'm not in the flow of things!",
            BAD_TIMING2 = "That wasn't right!",
        },
        LOWER_SAIL_FAIL =
        {
            "Whoops!",
            "Wait, that didn't seem right.",
            "That's not right.",
        },
        BATHBOMB =
        {
            GLASSED = "I can't, the surface is glassed over.",
            ALREADY_BOMBED = "That would be a waste of a bath bomb.",
        },
		GIVE_TACKLESKETCH =
		{
			DUPLICATE = "I've already tackled this one.",
		},
		COMPARE_WEIGHABLE =
		{
            FISH_TOO_SMALL = "Tch. Way too small.",
            OVERSIZEDVEGGIES_TOO_SMALL = "That's not heavy enough.",
		},
        BEGIN_QUEST =
        {
            ONEGHOST = "only_used_by_wendy",
        },
		TELLSTORY = 
		{
			GENERIC = "only_used_by_walter",
			NOT_NIGHT = "only_used_by_walter",
			NO_FIRE = "only_used_by_walter",
		},
        SING_FAIL =
        {
            SAMESONG = "only_used_by_wathgrithr",
        },
        PLANTREGISTRY_RESEARCH_FAIL =
        {
            GENERIC = "I have nothing left to learn.",
            FERTILIZER = "I'd rather not know anything further.",
        },
        FILL_OCEAN =
        {
            UNSUITABLE_FOR_PLANTS = "I can't feed plants salt water, right?",
        },
        POUR_WATER =
        {
            OUT_OF_WATER = "I'll have to get more water.",
        },
        POUR_WATER_GROUNDTILE =
        {
            OUT_OF_WATER = "I'll have to get more water.",
        },
        USEITEMON =
        {
            --GENERIC = "I can't use this on that!",

            --construction is PREFABNAME_REASON
            BEEF_BELL_INVALID_TARGET = "That won't work on that, dude.",
            BEEF_BELL_ALREADY_USED = "Nah, that beefalo's tamed.",
            BEEF_BELL_HAS_BEEF_ALREADY = "I have enough beefalo.",
        },
        HITCHUP =
        {
            NEEDBEEF = "If I had a bell I could befriend a beefalo.",
            NEEDBEEF_CLOSER = "My beefalo is too far.",
            BEEF_HITCHED = "My beefalo is already hitched up.",
            INMOOD = "Um. Maybe another time...",
        },
        MARK = 
        {
            ALREADY_MARKED = "I've already made my pick.",
            NOT_PARTICIPANT = "I've got no steak in this contest.",
        },
        YOTB_STARTCONTEST = 
        {
            DOESNTWORK = "I guess they don't support the arts here.",
            ALREADYACTIVE = "He must be busy with another contest somewhere.",
        },
        YOTB_UNLOCKSKIN = 
        {
            ALREADYKNOWN = "I'm seeing a familiar pattern... I've learned this already!",
        },
		CARNIVALGAME_FEED =
        {
            TOO_LATE = "Dang, too late.",
        },
        HERD_FOLLOWERS =
        {
            WEBBERONLY = "Nah, I'd rather leave it that Webber kid.",
        },
        BEDAZZLE =
        {
            BURNING = "only_used_by_webber",
            BURNT = "only_used_by_webber",
            FROZEN = "only_used_by_webber",
            ALREADY_BEDAZZLED = "only_used_by_webber",
        },
        UPGRADE = 
        {
            BEDAZZLED = "only_used_by_webber",
        },
		CAST_POCKETWATCH = 
		{
			GENERIC = "only_used_by_wanda",
			REVIVE_FAILED = "only_used_by_wanda",
			WARP_NO_POINTS_LEFT = "only_used_by_wanda",
			SHARD_UNAVAILABLE = "only_used_by_wanda",
		},
        DISMANTLE_POCKETWATCH =
        {
            ONCOOLDOWN = "only_used_by_wanda",
        },

        ENTER_GYM =
        {
            NOWEIGHT = "only_used_by_wolfang",
            UNBALANCED = "only_used_by_wolfang",
            ONFIRE = "only_used_by_wolfang",
            SMOULDER = "only_used_by_wolfang",
            HUNGRY = "only_used_by_wolfang",
            FULL = "only_used_by_wolfang",
        },			   										
		APPLYMODULE =
        {
            COOLDOWN = "only_used_by_wx78",
            NOTENOUGHSLOTS = "only_used_by_wx78",
        },
        REMOVEMODULES =
        {
            NO_MODULES = "only_used_by_wx78",
        },
        CHARGE_FROM =
        {
            NOT_ENOUGH_CHARGE = "only_used_by_wx78",
            CHARGE_FULL = "only_used_by_wx78",
        },

        HARVEST =
        {
            DOER_ISNT_MODULE_OWNER = "It doesn't want anything to do with humans.",
        },
    },

	ANNOUNCE_CANNOT_BUILD =
	{
		NO_INGREDIENTS = "I'm missing something...",
		NO_TECH = "I don't even understand how to make that.",
		NO_STATION = "I'm missing some important tools.",
	},												
	ACTIONFAIL_GENERIC = "No can do.",
	ANNOUNCE_MAGIC_FAIL = "I can't seem to tap into my PSI...",
	ANNOUNCE_BOAT_LEAK = "Don't panic, but we may have sprung a leak.",
	ANNOUNCE_BOAT_SINK = "Someone help, I'm not ready to die!",
	ANNOUNCE_DIG_DISEASE_WARNING = "It looks better already.",
	ANNOUNCE_PICK_DISEASE_WARNING = "Uh, is it supposed to smell like that?",
	ANNOUNCE_ADVENTUREFAIL = "Ugh. I had an easier time saving Earth from aliens...",
    ANNOUNCE_MOUNT_LOWHEALTH = "I think the poor thing has had enough.",

    --waxwell and wickerbottom specific strings
    ANNOUNCE_TOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
    ANNOUNCE_WAYTOOMANYBIRDS = "only_used_by_waxwell_and_wicker",

    --wolfgang specific
    ANNOUNCE_NORMALTOMIGHTY = "only_used_by_wolfang",
    ANNOUNCE_NORMALTOWIMPY = "only_used_by_wolfang",
    ANNOUNCE_WIMPYTONORMAL = "only_used_by_wolfang",
    ANNOUNCE_MIGHTYTONORMAL = "only_used_by_wolfang",
	ANNOUNCE_EXITGYM = {
        MIGHTY = "only_used_by_wolfang",
        NORMAL = "only_used_by_wolfang",
        WIMPY = "only_used_by_wolfang",
    },												 			

	ANNOUNCE_BEES = "Hey, don't sting me, man!",
	ANNOUNCE_BOOMERANG = "Ouch! Dang butterfingers!",
	ANNOUNCE_CHARLIE = "Something's here with me!!",
	ANNOUNCE_CHARLIE_ATTACK = "Ow ow ow ow ow ow ow!",
	ANNOUNCE_CHARLIE_MISSED = "only_used_by_winona", --winona specific 
	ANNOUNCE_COLD = "I'm freezing!",
	ANNOUNCE_HOT = "It's so hot out!",
	ANNOUNCE_CRAFTING_FAIL = "I'm missing something.",
	ANNOUNCE_DEERCLOPS = "I got a bad feeling about that.",
	ANNOUNCE_CAVEIN = "It's a cave in!",
	ANNOUNCE_ANTLION_SINKHOLE = 
	{
		"Earthquake!",
		"Wh-what's happening?!",
		"Everything's shaking!",
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "Chill, chill. Just take it.",
        "Yeah, yeah, just take it, ya baby.",
        "Are we good, now?",
	},
	ANNOUNCE_SACREDCHEST_YES = "I guess I'm worthy.",
	ANNOUNCE_SACREDCHEST_NO = "It didn't like that.",
    ANNOUNCE_DUSK = "The day's about done.",
    
    --wx-78 specific
    ANNOUNCE_CHARGE = "only_used_by_wx78",
	ANNOUNCE_DISCHARGE = "only_used_by_wx78",

	ANNOUNCE_EAT =
	{
		GENERIC = "It's not primed ribs, but it'll do.",
		PAINFUL = "I probably shouldn't have eaten that...",
		SPOILED = "Oh God, I'm gonna be sick...",
		STALE = "That was pretty gross.",
		INVALID = "I can't eat that.",
        YUCKY = "No way am I eating that.",
        
        --Warly specific ANNOUNCE_EAT strings
		COOKED = "only_used_by_warly",
		DRIED = "only_used_by_warly",
        PREPARED = "only_used_by_warly",
        RAW = "only_used_by_warly",
		SAME_OLD_1 = "only_used_by_warly",
		SAME_OLD_2 = "only_used_by_warly",
		SAME_OLD_3 = "only_used_by_warly",
		SAME_OLD_4 = "only_used_by_warly",
        SAME_OLD_5 = "only_used_by_warly",
		TASTY = "only_used_by_warly",
    },
    
    ANNOUNCE_ENCUMBERED =
    {
        "*Wheeze*",
        "Careful, Ninten...",
        "Nice... and... easy...",
        "HOO BOY, that's heavier than it looks...",
        "*Cough* This probably... isn't good... for my asthma!",
        "Nice and slow...",
        "I-I think I got it...",
    },
    ANNOUNCE_ATRIUM_DESTABILIZING = 
    {
		"Time to go!",
		"Oh boy, think I should get out of here.",
		"How about I 4D Slip to safety?",
	},
    ANNOUNCE_RUINS_RESET = "Everything came back!",
    ANNOUNCE_SNARED = "Help, help!!",
    ANNOUNCE_SNARED_IVY = "Ummm, someone get me out of these vines?!",
    ANNOUNCE_REPELLED = "It's shielded!",
	ANNOUNCE_ENTER_DARK = "H-hey, anyone got a light?!",
	ANNOUNCE_ENTER_LIGHT = "Oh thank God, I can see!",
	ANNOUNCE_FREEDOM = "Hah! I'm outta here!",
	ANNOUNCE_HIGHRESEARCH = "Not bad, Ninten.",
	ANNOUNCE_HOUNDS = "Something's coming...",
	ANNOUNCE_WORMS = "Something's coming...",
	ANNOUNCE_SHARX = "If this is anything like Jaws, I'm in big trouble...",
	ANNOUNCE_HUNGRY = "I could totally go for something to eat...",
	ANNOUNCE_HUNT_BEAST_NEARBY = "Fresh tracks...",
	ANNOUNCE_HUNT_LOST_TRAIL = "Hmmmmm. Dunno where to go from here.",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "It's raining too hard to follow these tracks.",
	ANNOUNCE_INV_FULL = "Pockets are full.",
	ANNOUNCE_KNOCKEDOUT = "Ouch!",
	ANNOUNCE_LOWRESEARCH = "Ugh. Reminds me of school.",
	ANNOUNCE_MOSQUITOS = "Gross, mosquitos!",
    ANNOUNCE_NOWARDROBEONFIRE = "I can't change while it's on fire!",
    ANNOUNCE_NODANGERGIFT = "I can't open presents with monsters about!",
    ANNOUNCE_NOMOUNTEDGIFT = "I should get off my beefalo first.",
	ANNOUNCE_NODANGERSLEEP = "Now's not the time to sleep, Ninten!",
	ANNOUNCE_NODAYSLEEP = "Don't feel like sleeping.",
	ANNOUNCE_NODAYSLEEP_CAVE = "I'm not tired.",
	ANNOUNCE_NOHUNGERSLEEP = "How about a snack before bed?",
	ANNOUNCE_NOSLEEPONFIRE = "Uh. Probably should do something about that fire, first.",
	ANNOUNCE_NOSLEEPHASPERMANENTLIGHT = "only_used_by_wx78",														
	ANNOUNCE_NODANGERSIESTA = "We can relax after we LIVE!",
	ANNOUNCE_NONIGHTSIESTA = "Nah, I should sleep at this point.",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "I don't think I could really relax down here.",
	ANNOUNCE_NOHUNGERSIESTA = "I should eat before I relax",
	ANNOUNCE_NODANGERAFK = "Stand your ground, Ninten!",
	ANNOUNCE_NO_TRAP = "Too easy!",
	ANNOUNCE_PECKED = "HEY! Knock that off!",
	ANNOUNCE_QUAKE = "That doesn't sound good.",
	ANNOUNCE_RESEARCH = "Hm. Guess I learned a thing or two.",
	ANNOUNCE_SHELTER = "Finally, some shade!",
	ANNOUNCE_THORNS = "Ow ow ow!",
	ANNOUNCE_BURNT = "Put it out, put it out!",
	ANNOUNCE_TORCH_OUT = "There's goes my light...",
	ANNOUNCE_THURIBLE_OUT = "It needs more fuel, I guess.",
	ANNOUNCE_FAN_OUT = "Crap, my fan's busted.",
    ANNOUNCE_COMPASS_OUT = "Hey, wont isn't this thing working anymore?",
	ANNOUNCE_TRAP_WENT_OFF = "Well, good job there, Ninten...",
	ANNOUNCE_UNIMPLEMENTED = "OW! I don't think it's ready yet.",
	ANNOUNCE_WORMHOLE = "Where am I now?",
	ANNOUNCE_TOWNPORTALTELEPORT = "Niiiice, teleportation.",
	ANNOUNCE_CANFIX = "\nI could probably fix it.",
	ANNOUNCE_ACCOMPLISHMENT = "Who's awesome? Me!",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "Oh yeah, Ninten!",	
	ANNOUNCE_INSUFFICIENTFERTILIZER = "Needs more fertilizer.",
	ANNOUNCE_TOOL_SLIP = "Whoops! Slipped right out of my hands",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "Jesus! I almost got struck by that!",
	ANNOUNCE_TOADESCAPING = "The toad is losing interest.",
	ANNOUNCE_TOADESCAPED = "The toad got away.",							
	ANNOUNCE_DAMP = "It's raining?",
	ANNOUNCE_WET = "I should find shelter from the rain.",
	ANNOUNCE_WETTER = "I really hope this rain lets up, I'm getting soaked!",
	ANNOUNCE_SOAKED = "Christ, I'm soaked!",
	ANNOUNCE_TREASURE = "A treasure map, oh boy!",
	ANNOUNCE_MORETREASURE = "I'm a pirate king!",
	ANNOUNCE_OTHER_WORLD_TREASURE = "This map is USELESS. Just my luck.",
	ANNOUNCE_OTHER_WORLD_PLANT = "It doesn't like look like it'll be growing here.",
	ANNOUNCE_MESSAGEBOTTLE = 
	{
		"I can't make anything out. Ugh.",
	},
	ANNOUNCE_WASHED_ASHORE = "Ugh... what happened? Where am I?",

    ANNOUNCE_DESPAWN = "Later.",
	ANNOUNCE_BECOMEGHOST = "I'm spooky ghoooost, OoooOOOOoo!!",
	ANNOUNCE_GHOSTDRAIN = "Goodbye...",
	ANNOUNCE_PETRIFED_TREES = "Did that tree... just... scream?",
	ANNOUNCE_KLAUS_ENRAGE = "Oh God, now it's mad!!",
	ANNOUNCE_KLAUS_UNCHAINED = "It's still got some bite left!",
	ANNOUNCE_KLAUS_CALLFORHELP = "Oh, bring it on!",

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "There's a form trapped inside.",
		GLASS_LOW = "I've almost got it out.",
		GLASS_REVEAL = "You're free!",
		IDOL_MED = "There's a form trapped inside.",
		IDOL_LOW = "I've almost got it out.",
		IDOL_REVEAL = "You're free!",
		SEED_MED = "There's a form trapped inside.",
		SEED_LOW = "I've almost got it out.",
		SEED_REVEAL = "You're free!",
	},
	ANNOUNCE_VOLCANO_ERUPT = "Ah! What was that?!",
	ANNOUNCE_MAPWRAP_WARN = "Um... I don't think I'm alone out here...",
	ANNOUNCE_MAPWRAP_LOSECONTROL = "I'm not doing that, I'm not doing that!",
	ANNOUNCE_MAPWRAP_RETURN = "I hate this...",
	ANNOUNCE_CRAB_ESCAPE = "I'll getcha next time.",
	ANNOUNCE_TRAWL_FULL = "Look at my catches!",
	ANNOUNCE_BOAT_DAMAGED = "This boat's seen better days.",
	ANNOUNCE_BOAT_SINKING = "Uh oh.",
	ANNOUNCE_BOAT_SINKING_IMMINENT = "I don't wanna go out, not like this!",
	ANNOUNCE_WAVE_BOOST = "Kowabunga!",

	ANNOUNCE_WHALE_HUNT_BEAST_NEARBY = "Yaaar, yer mine, Moby Dick!",
	ANNOUNCE_WHALE_HUNT_LOST_TRAIL = "How does one lose a whale...",
	ANNOUNCE_WHALE_HUNT_LOST_TRAIL_SPRING = "I can't track anything in these stupid waves.",	

	-- PORKLAND SPEECH
	ANNOUCE_UNDERLEAFCANOPY = "Nice and shady.",
	ANNOUCE_ALARMOVER = "Phew, I'm in the clear.",	
	ANNOUCE_BATS = "Oh boy.",
	ANNOUCE_OTHERWORLD_DEED = "Pretty useless without civilization.",
	ANNOUNCE_TOOLCORRODED = "What th-, I was using that!",
	ANNOUNCE_TURFTOOHARD = "This ground's going nowhere.",
	ANNOUNCE_GAS_DAMAGE = "Ack! That's... *HACK* not good... for an asthmatic...",
	ANNOUNCE_GNATS_DIED = "Annoying little pests...",	
	ANNOUNCE_SNEEZE = "AHHH CHOOOO!",	
	ANNOUNCE_HAYFEVER = "I don't feel good...",	
	ANNOUNCE_HAYFEVER_OFF = "Asthma is enough for me to deal with.",	
	ANNOUNCE_PICKPOOP = {"I hate everything.","Grooooss...","I'm gonna puke!","Ugh."},	
	ANNOUNCE_TOO_HUMID = {"This %s makes it... hard to breathe...","This %s is too hot."},	
	ANNOUNCE_DEHUMID = {"My lungs thank you."},	
	ANNOUNCE_PUGALISK_INVULNERABLE = {"I'll break you like a piñata, don't worry!", "Come on, open up!", "It's only a matter of time!"},
	ANNOUNCE_MYSTERY_FOUND = "I'm on to something...",
	ANNOUNCE_MYSTERY_NOREWARD = "Lame. Nothing's here.",
	ANNOUNCE_MYSTERY_DOOR_FOUND = "I found a door! Now to open it.",
	ANNOUNCE_MYSTERY_DOOR_NOT_FOUND = "Lame, there's nothing...",
	ANNOUNCE_TAXDAY = "Heh heh, I could get used to this whole taxes thing.",
	ANNOUNCE_HOUSE_DOOR = "I need some boring paperwork I'm not gonna read to do that.",
	ANNOUNCE_ROOM_STUCK = "A way out would be thoughtful.",
	ANNOUNCE_NOTHING_FOUND = "I'm not sensing anything.",
	ANNOUNCE_SUITUP = "Watch out, world, Ninten is ready!",
    --hallowed nights
    ANNOUNCE_SPOOKED = "EEEK!! You scared me!",
	ANNOUNCE_BRAVERY_POTION = "I'm more than capable now!",
	ANNOUNCE_MOONPOTION_FAILED = "Whoops.",

	--winter's feast
	ANNOUNCE_EATING_NOT_FEASTING = "What's a Christmas dinner by yourself??",
	ANNOUNCE_WINTERS_FEAST_BUFF = "The holiday's got me in a great mood!",
	ANNOUNCE_IS_FEASTING = "Happy Winter's Feast!",
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "I miss celebrating Christmas.",

    --lavaarena event
    ANNOUNCE_REVIVING_CORPSE = "I got you, don't worry!",
    ANNOUNCE_REVIVED_OTHER_CORPSE = "There we are!",
    ANNOUNCE_REVIVED_FROM_CORPSE = "Thanks!",

    ANNOUNCE_FLARE_SEEN = "A flare! Should I check it out?",
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "That's not good.",

    --willow specific
	ANNOUNCE_LIGHTFIRE =
	{
		"only_used_by_willow",
    },

    --winona specific
    ANNOUNCE_HUNGRY_SLOWBUILD = 
    {
	    "only_used_by_winona",
    },
    ANNOUNCE_HUNGRY_FASTBUILD = 
    {
	    "only_used_by_winona",
    },

    --wormwood specific
    ANNOUNCE_KILLEDPLANT = 
    {
        "only_used_by_wormwood",
    },
    ANNOUNCE_GROWPLANT = 
    {
        "only_used_by_wormwood",
    },
    ANNOUNCE_BLOOMING = 
    {
        "only_used_by_wormwood",
    },

    --wortox specfic
    ANNOUNCE_SOUL_EMPTY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_FEW =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_MANY =
    {
        "only_used_by_wortox",
    },
    ANNOUNCE_SOUL_OVERLOAD =
    {
        "only_used_by_wortox",
    },

    --walter specfic
	ANNOUNCE_SLINGHSOT_OUT_OF_AMMO =
	{
		"only_used_by_walter",
		"only_used_by_walter",
	},
	ANNOUNCE_STORYTELLING_ABORT_FIREWENTOUT =
	{
        "only_used_by_walter",
	},
	ANNOUNCE_STORYTELLING_ABORT_NOT_NIGHT =
	{
        "only_used_by_walter",
	},

	-- wx specific
    ANNOUNCE_WX_SCANNER_NEW_FOUND = "only_used_by_wx78",
    ANNOUNCE_WX_SCANNER_FOUND_NO_DATA = "only_used_by_wx78",			  
	
    --quagmire event
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "I'm just throwing in ingredients randomly and hope it works, huh?",
    QUAGMIRE_ANNOUNCE_MEALBURNT = "Darnit, I burned my meal!",
    QUAGMIRE_ANNOUNCE_LOSE = "Oh boy.",
    QUAGMIRE_ANNOUNCE_WIN = "Time to go!",

    ANNOUNCE_ROYALTY =
    {
        "Yeah, yeah, your highness...",
        "Majesty, schmajesty.",
        "Whatever dude.",
    },

    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "Electrifying!",
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "I can take 'em!",
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "Thanks. I feel much safer now!",
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "So much energy, I'm just rarin' to go!",
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "I all dry, awesome!",
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "I feel so refreshed!",
    
    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "The electricity's no more now.",
    ANNOUNCE_DETACH_BUFF_ATTACK            = "On second thought, I'll let you handle it.",
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "Well that was nice while it lasted.",
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "Working is lame.",
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "Looks like my dry spell is over.",
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "Meh. I'm gonna go take a nap...",
    
	ANNOUNCE_OCEANFISHING_LINESNAP = "Dang it, my line!",
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "I need to reel it in a bit.",
	ANNOUNCE_OCEANFISHING_GOTAWAY = "Nooooo, my lunch!",
	ANNOUNCE_OCEANFISHING_BADCAST = "That was a bad cast, Ninten, sheesh.",
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE = 
	{
		"Hereeeee, fishy fishy!",
		"Nothing's biting...",
		"I'm bored.",
		"I hate fishing.",
	},

	ANNOUNCE_WEIGHT = "Weight: {weight}",
	ANNOUNCE_WEIGHT_HEAVY  = "Weight: {weight}\nI'm a fishing champ!",


	ANNOUNCE_WINCH_CLAW_MISS = "Come on Ninten, it's just like this claw games, you're great at this!",
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "Nothing? Ugh.",

    --Wurt announce strings
    ANNOUNCE_KINGCREATED = "only_used_by_wurt",
    ANNOUNCE_KINGDESTROYED = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_THRONE = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_HOUSE = "only_used_by_wurt",
    ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "only_used_by_wurt",
    ANNOUNCE_READ_BOOK = 
    {
        BOOK_SLEEP = "only_used_by_wurt",
        BOOK_BIRDS = "only_used_by_wurt",
        BOOK_TENTACLES =  "only_used_by_wurt",
        BOOK_BRIMSTONE = "only_used_by_wurt",
        BOOK_GARDENING = "only_used_by_wurt",
		BOOK_SILVICULTURE = "only_used_by_wurt",
		BOOK_HORTICULTURE = "only_used_by_wurt",
    },
    ANNOUNCE_WEAK_RAT = "This Carrat is in no shape to be training.",

    ANNOUNCE_CARRAT_START_RACE = "Let the race begin!",

    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = {
        "No, no! You're going the wrong way!",
        "Turn around, white eyes!",
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "Don't you dare! Wake up, we have a race to win!",    
    ANNOUNCE_CARRAT_ERROR_WALKING = "Don't walk, RUN!",    
    ANNOUNCE_CARRAT_ERROR_STUNNED = "Get up! GO GO!",

    ANNOUNCE_GHOST_QUEST = "only_used_by_wendy",
    ANNOUNCE_GHOST_HINT = "only_used_by_wendy",
    ANNOUNCE_GHOST_TOY_NEAR = {
        "only_used_by_wendy",
    },
	ANNOUNCE_SISTURN_FULL = "only_used_by_wendy",
    ANNOUNCE_ABIGAIL_DEATH = "only_used_by_wendy",
    ANNOUNCE_ABIGAIL_RETRIEVE = "only_used_by_wendy",
	ANNOUNCE_ABIGAIL_LOW_HEALTH = "only_used_by_wendy",
    ANNOUNCE_ABIGAIL_SUMMON = 
	{
		LEVEL1 = "only_used_by_wendy",
		LEVEL2 = "only_used_by_wendy",
		LEVEL3 = "only_used_by_wendy",
	},

    ANNOUNCE_GHOSTLYBOND_LEVELUP = 
	{
		LEVEL2 = "only_used_by_wendy",
		LEVEL3 = "only_used_by_wendy",
	},

    ANNOUNCE_NOINSPIRATION = "only_used_by_wathgrithr",
    ANNOUNCE_BATTLESONG_INSTANT_TAUNT_BUFF = "only_used_by_wathgrithr",
    ANNOUNCE_BATTLESONG_INSTANT_PANIC_BUFF = "only_used_by_wathgrithr",

	ANNOUNCE_WANDA_YOUNGTONORMAL = "only_used_by_wanda",
    ANNOUNCE_WANDA_NORMALTOOLD = "only_used_by_wanda",
    ANNOUNCE_WANDA_OLDTONORMAL = "only_used_by_wanda",
    ANNOUNCE_WANDA_NORMALTOYOUNG = "only_used_by_wanda",
	ANNOUNCE_POCKETWATCH_PORTAL = "It's like, 4D Slip, but cooler.",
	
	ANNOUNCE_POCKETWATCH_MARK = "only_used_by_wanda",
	ANNOUNCE_POCKETWATCH_RECALL = "only_used_by_wanda",
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "only_used_by_wanda",
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD = "only_used_by_wanda",
	
    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "Wow, so interesting!",
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "I already knew that.",
    ANNOUNCE_ARCHIVE_NO_POWER = "Maybe it needs more juice.",


    ANNOUNCE_PLANT_RESEARCHED =
    {
        "Ah, I understand this plant better!",
    },

    ANNOUNCE_PLANT_RANDOMSEED = "I wonder what it will grow into.",

    ANNOUNCE_FERTILIZER_RESEARCHED = "Interesting, so that's how that works.",

	ANNOUNCE_FIRENETTLE_TOXIN = 
	{
		"Hot hot hot hot!",
		"I'm burning!",
	},
	ANNOUNCE_FIRENETTLE_TOXIN_DONE = "Christ, dude...",

	ANNOUNCE_TALK_TO_PLANTS = 
	{
        "Come on, grow into something delicious!",
        "Grow, darn it, grow!",
		"Hurry, hurry!",
        "Hey, no shirking your work! Come on, grow!",
        "Grow plant, grow!",					   
	},

	ANNOUNCE_KITCOON_HIDEANDSEEK_START = "3, 2, 1... Ready or not, here I come!",
	ANNOUNCE_KITCOON_HIDEANDSEEK_JOIN = "Aww, they're playing hide and seek.",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND =
	{
		"Found you!",
		"There you are.",
		"I knew you'd be hiding there!",
		"I see you!",
	},
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_ONE_MORE = "Now where's that last one hiding?",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE = "I found the last one!",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE_TEAM = "{name} found the last one!",
	ANNOUNCE_KITCOON_HIDANDSEEK_TIME_ALMOST_UP = "These little guys must be getting impatient...",
	ANNOUNCE_KITCOON_HIDANDSEEK_LOSEGAME = "I guess they don't want to play any more...",
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR = "They probably wouldn't hide this far away, would they?",
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR_RETURN = "The kitcoons should be nearby.",
	ANNOUNCE_KITCOON_FOUND_IN_THE_WILD = "I knew I saw something hiding over here!",

	ANNOUNCE_TICOON_START_TRACKING	= "He's caught the scent!",
	ANNOUNCE_TICOON_NOTHING_TO_TRACK = "Looks like he couldn't find anything.",
	ANNOUNCE_TICOON_WAITING_FOR_LEADER = "I should follow him!",
	ANNOUNCE_TICOON_GET_LEADER_ATTENTION = "He really wants me to follow him.",
	ANNOUNCE_TICOON_NEAR_KITCOON = "He must have found something!",
	ANNOUNCE_TICOON_LOST_KITCOON = "Looks like someone else found what he was looking for.",
	ANNOUNCE_TICOON_ABANDONED = "I'll find those little guys on my own.",
	ANNOUNCE_TICOON_DEAD = "Poor guy... Now where was he leading me?",																		  
    -- YOTB
    ANNOUNCE_CALL_BEEF = "C'mere big guy!",
    ANNOUNCE_CANTBUILDHERE_YOTB_POST = "The judge won't be able to see my beefalo from here.",
    ANNOUNCE_YOTB_LEARN_NEW_PATTERN =  "My mind has been filled with beefalo styling inspiration!",

	-- AE4AE
    ANNOUNCE_EYEOFTERROR_ARRIVE = "First aliens, now a giant eyeball?!",
    ANNOUNCE_EYEOFTERROR_FLYBACK = "Poke 'em in the eye!",
    ANNOUNCE_EYEOFTERROR_FLYAWAY = "Yeah, you better run!",																		 
	 -- PIRATES
    ANNOUNCE_CANT_ESCAPE_CURSE = "Hello?? 4D Slip?? Please?!",
    ANNOUNCE_MONKEY_CURSE_1 = "I don't feel good...",
    ANNOUNCE_MONKEY_CURSE_CHANGE = "AH! What's happening to me?!",
    ANNOUNCE_MONKEY_CURSE_CHANGEBACK = "Thanks, I'd like to stick with my human form.",

    ANNOUNCE_PIRATES_ARRIVE = "There be pirates in these waters...",		  
	BATTLECRY =
	{
		GENERIC = "You want some?!",
		PIG = "Fight me!",
		PREY = "You're mine!",
		SPIDER = "Gross gross gross gross, stomp it dead!!",
		SPIDER_WARRIOR = "No creepy crawlies!!",
		DEER = "You want some?!",
	},
	COMBAT_QUIT =
	{
		GENERIC = "On second thought, I on the other hand want none.",
		PIG = "*Huff* *Huff* You're lucky I got asthma...",
		PREY = "Hey, come back!",
		SPIDER = "Ewwwww!",
		SPIDER_WARRIOR = "Ewwwww!",
	},

	DESCRIBE =
	{
		WILDBOREGUARD = "He looks angry.",
		MULTIPLAYER_PORTAL = "Huh. Wonder what that is.",
        MULTIPLAYER_PORTAL_MOONROCK = "I have no clue.",
        MOONROCKIDOL = "Is this some sort of religious thing?",
        CONSTRUCTION_PLANS = "Some sort of plans.",

        ANTLION =
        {
            GENERIC = "What do you want?",
            VERYHAPPY = "Happy?",
            UNHAPPY = "Hm. Looks mad.",
        },
        ANTLIONTRINKET = "Cool!",
        SANDSPIKE = "Christ, that could have killed me!",
        SANDBLOCK = "So sandy.",
        GLASSSPIKE = "Whoa.",
        GLASSBLOCK = "Whoa.",
        ABIGAIL_FLOWER =
        {
            GENERIC ="What sort of flower is this?",
			LEVEL1 = "Hm. Nothing special about it.",
			LEVEL2 = "I can sense your presence, you know.",
			LEVEL3 = "That's the spirit! Heh... Get it?",

			-- deprecated
            LONG = "It hurts my soul to look at that thing.",
            MEDIUM = "It's giving me the creeps.",
            SOON = "Something is up with that flower!",
            HAUNTED_POCKET = "I don't think I should hang on to this.",
            HAUNTED_GROUND = "I'd die to find out what it does.",
        },

        BALLOONS_EMPTY = "Balloons?",
        BALLOON = "Balloons!",
		BALLOONPARTY = "SO MANY BALLOONS!!",
		BALLOONSPEED =
        {
            DEFLATED = "Could use some air. Not from me though.",
            GENERIC = "There we go.",
        },
		BALLOONVEST = "Please don't pop.",
		BALLOONHAT = "Reminds me of those balloon crowns we'd do for my birthday parties.",

        BERNIE_INACTIVE =
        {
            BROKEN = "Poor thing is no more.",
            GENERIC = "Looks like the poltergeist is gone.",
        },

        BERNIE_ACTIVE = "Poltergeist!",
        BERNIE_BIG = "Whoa, that's a big teddy bear!",

        BOOK_BIRDS = "Birds, huh. Okay...",
        BOOK_TENTACLES = "If this was a comic, I'd be so down with it!",
        BOOK_GARDENING = "Reading is so boring. What is this? Gardening?! Yuck!",
		BOOK_SILVICULTURE = "I don't even know.",
		BOOK_HORTICULTURE = "Farming's laaaame.",
        BOOK_SLEEP = "Oh this'll put me to sleep all right, no spell needed.",
        BOOK_BRIMSTONE = "The end is nigh, all right, I'm reading a book.",

        PLAYER =
        {
            GENERIC = "What's up, %s!",
            ATTACKER = "Chill out %s!",
            MURDERER = "Now that's just cruel, dude.",
            REVIVER = "Back from the dead, oh yeah! Thanks, %s.",
            GHOST = "%s is my ghost friend now.",
            FIRESTARTER = "Whoa, man, careful with the fires.",
        },
		WILLAR = 
		{
			GENERIC = "Lookin' handsome. Charmed, I'm sure. Heheheh.",
            ATTACKER = "Wow, I'm kind of a jerk.",
            MURDERER = "There can only be one!",
            REVIVER = "Clones stick together!",
            GHOST = "Looks like I'm the better Ninten!",
            FIRESTARTER = "Whoa, man, careful with the fires.",
		},
		LUCAS = 
		{
			GENERIC = "Sup, Lucas.",
            ATTACKER = "You're pretty violent for a \"Gentle Boy.\"",
            MURDERER = "Yeah, I don't buy it. You're nothing but trouble.",
            REVIVER = "Back from the dead, oh yeah! Thanks, %s.",
            GHOST = "Yeah yeah, stop your crying...",
            FIRESTARTER = "Whoa, man, careful with the fires.",
		},
		CLAUS =
		{
			GENERIC = "Ey, Claus!",
            ATTACKER = "Whoa. Chill out dude, you're strong, we believe you.",
            MURDERER = "...Just what are you really?",
            REVIVER = "Back from the dead, oh yeah! Thanks, %s.",
            GHOST = "He looks almost at peace.",
            FIRESTARTER = "Whoa, man, careful with the fires.",
		},
		NESS =
		{
			GENERIC = "That's my dude, Ness!",
            ATTACKER = "I don't remember you being like this.",
            MURDERER = "Yeah, I'm cooler. By a long shot.",
            REVIVER = "I guess I owe you one, dude!",
            GHOST = "You would think dying is fun...",
            FIRESTARTER = "Whoa, man, careful with the fires.",
		},
		GRAMNESS = 
		{
			GENERIC = "That's my dude, Ness!",
            ATTACKER = "I don't remember you being like this.",
            MURDERER = "Yeah, I'm cooler. By a long shot.",
            REVIVER = "I guess I owe you one, dude!",
            GHOST = "You would think dying is fun...",
            FIRESTARTER = "Whoa, man, careful with the fires.",
		},
        WILSON =
        {
            GENERIC = "Hey hey, Mr. Science dude! What's up?",
            ATTACKER = "You're not one of those mad-scientist types like in the movies, right?",
            MURDERER = "Where are your morals, %s!",
            REVIVER = "Thanks, %s.",
            GHOST = "%s's a ghost now. Sweeeet.",
            FIRESTARTER = "Watch the fires, %s.",
        },
        WOLFGANG =
        {
            GENERIC = "Sup, %s.",
            ATTACKER = "Dude looks like he'd crack my head wide open...",
            MURDERER = "Now that's just cruel.",
            REVIVER = "Just needed me back that bad, huh? Heh. Thanks, %s!",
            GHOST = "Oh, %s's spirit. Cool.",
            FIRESTARTER = "Careful with those fires, %s!",
        },
        WAXWELL =
        {
            GENERIC = "Sup, old man.",
            ATTACKER = "For a twig, you hit pretty hard.",
            MURDERER = "How cruel!",
            REVIVER = "I figured you wouldn't leave me dead. Thanks, %s.",
            GHOST = "You're a lot less grumpier dead, gotta say.",
            FIRESTARTER = "All right, all right, let's not play with fire too much.",
        },
        WX78 =
        {
            GENERIC = "Yo, it's a robot! What's up?",
            ATTACKER = "We're cool, right, %s? Right?",
            MURDERER = "Help! Robot's gone evil, robot's gone evil!",
            REVIVER = "Good robot!",
            GHOST = "%s's a ghost! Didn't even think that was possible.",
            FIRESTARTER = "Sheesh, you start this fire, %s?",
        },
        WILLOW =
        {
            GENERIC = "What's up, %s.",
            ATTACKER = "Uh. You okay, %s?",
            MURDERER = "Please don't burn me alive!",
            REVIVER = "Ninten, back from the dead, oh yeah %s!",
            GHOST = "%s's died and now they're haunting me, I guess. Great. Grrrreat.",
            FIRESTARTER = "Gee, I wonder who started the fire THIS time...",
        },
        WENDY =
        {
            GENERIC = "Hey, %s!",
            ATTACKER = "%s is scary when she's mad.",
            MURDERER = "Not cool, not cool!",
            REVIVER = "Awesome, I'm alive thanks to %s!",
            GHOST = "Hey uh, mind not haunting me %s?",
            FIRESTARTER = "Let's be careful with the fires!",
        },
        WOODIE =
        {
            GENERIC = "Hey hey, %s!",
            ATTACKER = "Careful with that axe, %s!",
            MURDERER = "Canadian AND a murderer, this can't get any worse!",
            REVIVER = "I owe ya, %s!",
            GHOST = "Sweet, %s's ghost!",
            BEAVER = "What th-!",
            BEAVERGHOST = "A beaver ghost? Must be %s.",
            MOOSE = "Seriously, what th-!",
            MOOSEGHOST = "Sup %s. Enjoying being a moose ghost?",
            GOOSE = "Oh come on!",
            GOOSEGHOST = "Oh, a goose ghost. Sorry about that Christmas dinner last year...",
            FIRESTARTER = "Hey now, let's not get crazy with the fires %s.",
        },
        WICKERBOTTOM =
        {
            GENERIC = "You remind me of my English teacher, %s.",
            ATTACKER = "Yikes, %s hits pretty hard for an old bag.",
            MURDERER = "Books are cool %s, I promise! Don't hurt me!",
            REVIVER = "Hey, uh, thanks %s, but I don't have to do that book report, now, right? New life and all.",
            GHOST = "Shush yourself, %s, I'm working on it.",
            FIRESTARTER = "Whoa, I thought you liked paper!",
        },
        WES =
        {
            GENERIC = "Gross, it's that mime!",
            ATTACKER = "...",
            MURDERER = "Always had a bad feeling about mimes.",
            REVIVER = "Tch. Thanks.",
            GHOST = "Leave me alone, %s.",
            FIRESTARTER = "Wait, don't tell me. You lit a fire.",
        },
        WEBBER =
        {
            GENERIC = "HOLY- Oh, it's just you, %s...",
            ATTACKER = "You know, I saw a b movie that went something like this once. Think I prefer it stay in the movies...",
            MURDERER = "Oh God, the abomination is out for blood!!",
            REVIVER = "I guess you're not so bad, %s.",
            GHOST = "Good, you're dead, %s. WAIT, I mean, uh!",
            FIRESTARTER = "What is this? Why are we starting fires?",
        },
        WATHGRITHR =
        {
            GENERIC = "What's up %s!",
            ATTACKER = "Hey, hey, I got no problems with you, %s.",
            MURDERER = "%s's out for all of us!",
            REVIVER = "Thanks %s.",
            GHOST = "A warrior even in ghost form.",
            FIRESTARTER = "%s is fond of fire.",
        },
        WINONA =
        {
            GENERIC = "Nice to see you, %s!",
            ATTACKER = "%s seems like trouble.",
            MURDERER = "Not cool, %s!",
            REVIVER = "I'm alive! Hah, thanks a bunch %s!",
            GHOST = "%s's ghost. Someone ought to do something about that.",
            FIRESTARTER = "Guess we're starting fires.",
        },
        WORTOX =
        {
            GENERIC = "Hey %s!",
            ATTACKER = "I knew %s couldn't be trusted!",
            MURDERER = "I'll bash you for that!",
            REVIVER = "Just couldn't get enough of me? I know, I'm just too cool, heh heh.",
            GHOST = "%s is dead, huh? Dang.",
            FIRESTARTER = "%s sure likes fire.",
        },
        WORMWOOD =
        {
            GENERIC = "%s! What's up what's up?!",
            ATTACKER = "You okay, %s?",
            MURDERER = "Well that's not very plant-positive...",
            REVIVER = "I'm back! Thanks %s.",
            GHOST = "A plant ghost? Huh.",
            FIRESTARTER = "I thought you hated fire, %s.",
        },
        WARLY =
        {
            GENERIC = "What's shakin, %s!",
            ATTACKER = "Man, so confrontational.",
            MURDERER = "You're not like, a cannibal, right? Just asking.",
            REVIVER = "Awesome, glad to be alive, %s!",
            GHOST = "%s's spirit. Pay him no mind.",
            FIRESTARTER = "I don't think you need THAT much fire to cook, man.",
        },

        WURT =
        {
            GENERIC = "Erm, hey %s!",
            ATTACKER = "%s. Seriously.",
            MURDERER = "Wait, you're telling me the monster is acting like a monstser? Crazy.",
            REVIVER = "Ninten's back for me, %s!",
            GHOST = "Even %s's smells like fish, gross.",
            FIRESTARTER = "Fire! Seriously, %s?",
        },

        WALTER =
        {
            GENERIC = "Oh, it's the Pinetree Pinoneer! What's up, %s!",
            ATTACKER = "Hey now, %s, let's chill out.",
            MURDERER = "Whoa man, you're taking things too far!",
            REVIVER = "Thanks, dude! I was never that good at this Boy Scouts stuff, heh.",
            GHOST = "Great, %s's ghost.",
            FIRESTARTER = "We uh, doing a bonfire thing, what is this?",																					 
        },

		WANDA =
        {
            GENERIC = "Wait, how old are you again, %s?",
            ATTACKER = "Woah.",
            MURDERER = "She's gonna kill me and hide my body in the Middle Ages or something!!",
            REVIVER = "Thanks, %s!",
            GHOST = "Looks like time traveling couldn't save you this time, huh?",
            FIRESTARTER = "Why is everything on fire %s?",
        },

		WONKEY =
        {
            GENERIC = "Ooh ooh aah aah!",
            ATTACKER = "My experiences with monkeys has always been mixed.",
            MURDERER = "Bad monkey, bad!",
            REVIVER = "You saved me?",
            GHOST = "Great, I'm being haunted by an ape.", 
            FIRESTARTER = "...Really?",  
        },
		
        MIGRATION_PORTAL =
        {
            GENERIC = "I could use to teleport to a friend!",
            OPEN = "That's a portal just begging to be jumped into!",
            FULL = "Too crowded.",
        },
        GLOMMER = 
        {
            GENERIC = "Hey, watch the clothes!",
            SLEEPING = "Heh. Pretty cute, I guess.",
        },
        GLOMMERFLOWER =
        {
            GENERIC = "Shiny.",
            DEAD = "Huh, guess it's dead.",
        },
        GLOMMERWINGS = "Sweet.",
        GLOMMERFUEL = "Gross!",
        BELL = "Oh, a  bell.",
        STATUEGLOMMER =
        {
            GENERIC = "Oh, what's this?",
            EMPTY = "Oops.",
        },

        LAVA_POND_ROCK = "Careful.",
		LAVA_POND_ROCK2 = "Careful.",
		LAVA_POND_ROCK3 = "Careful.",
		LAVA_POND_ROCK4 = "Careful.",
		LAVA_POND_ROCK5 = "Careful.",
		LAVA_POND_ROCK6 = "Careful.",
		LAVA_POND_ROCK7 = "Careful.",

		WEBBERSKULL = "Oh.",
		WORMLIGHT = "Looks delicious.",
		WORMLIGHT_LESSER = "Wrinkly.",
		WORM =
		{
		    PLANT = "Huh?",
		    DIRT = "What's this dirt?",
		    WORM = "It's a worm!",
		},
        WORMLIGHT_PLANT = "What might this be?",
		MOLE =
		{
			HELD = "Never thought of keeping these things as a pet.",
			UNDERGROUND = "Huh? What's that burrowing?",
			ABOVEGROUND = "Ah! A mole!",
		},
		MOLEHILL = "A molehill.",
		MOLEHAT = "Erm, I dunno if I wanna wear that.",

		EEL = "It's all slimy, gross.",
		EEL_COOKED = "Eel, huh? Well, if it's all I have...",
		UNAGI = "Doesn't look too bad...",
		EYETURRET = "Whoa, creepy, but cool!",
		EYETURRET_ITEM = "It's asleep, now.",
		MINOTAURHORN = "That's a big horn!",
		MINOTAURCHEST = "Wonder what's inside.",
		THULECITE_PIECES = "It's like, alien rocks, or something.",
		POND_ALGAE = "Algae.",
		GREENSTAFF = "This will come in handy.",
		GIFT = "Oh boy, Christmas all ready?",
        GIFTWRAP = "How nice!",
		POTTEDFERN = "Never been the decorating type, but not bad.",
        SUCCULENT_POTTED = "Some potted plants might spruce things up!",
		SUCCULENT_PLANT = "Some plant, I dunno.",
		SUCCULENT_PICKED = "What am I doing with this, I wonder?",
		SENTRYWARD = "Um. Sup?",
        TOWNPORTAL =
        {
			GENERIC = "Wonder where this leads.",
			ACTIVE = "Better than walking.",
		},
        TOWNPORTALTALISMAN = 
        {
			GENERIC = "What's this, some sort of teleportation thingy?",
			ACTIVE = "I could just 4D Slip...",
		},
        WETPAPER = "I need to dry this off.",
        WETPOUCH = "Wonder what's inside.",
        MOONROCK_PIECES = "Whoa, cool.",
        MOONBASE =
        {
            GENERIC = "Hmmmmm.",
            BROKEN = "Don't think that'll be doing anything anytime soon.",
            STAFFED = "Now what?",
            WRONGSTAFF = "Something's off.",
            MOONSTAFF = "The stone lit it up?",
        },
        MOONDIAL = 
        {
			GENERIC = "I think this measures the moon?",
			NIGHT_NEW = "It's a new moon.",
			NIGHT_WAX = "The moon is waxing.",
			NIGHT_FULL = "It's a full moon.",
			NIGHT_WANE = "The moon is waning.",
			CAVE = "Can't see the moon down here.",
			WEREBEAVER = "only_used_by_woodie", --woodie specific
			GLASSED = "Yeah yeah, I see you too.",												   
        },
		THULECITE = "I wonder where this is from?",
		ARMORRUINS = "Not into armor, to be frank with you.",
		ARMORSKELETON = "Okay, that's just weird!",
		SKELETONHAT = "I am NOT putting that on my head.",
		RUINS_BAT = "Not bad, not bad.",
		RUINSHAT = "Seems pretty tacky to me.",
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "I'm not reading anything.",
            WARN = "My psychic senses are tingling...",
            WAXING = "This power! It's off the charts!",
            STEADY = "Oh God oh God oh God, it's too much to take!",
            WANING = "The power's weakening!",
            DAWN = "Phew... I'm not sensing much left.",
            NOMAGIC = "Whatever force was here is no more.",
		},
		BISHOP_NIGHTMARE = "Wh, what is that thing?!",
		ROOK_NIGHTMARE = "Holy-!",
		KNIGHT_NIGHTMARE = "Um, no thanks!",
		MINOTAUR = "N-nice rhino... monster... thing!",
		SPIDER_DROPPER = "AIEEEEEEEE!!! E-e-ewwwwwww!!",
		NIGHTMARELIGHT = "Huh. Well, if it keeps the dark away, I guess...",
		NIGHTSTICK = "Cooool.",
		GREENGEM = "It's some sort of emerald, I guess.",
		MULTITOOL_AXE_PICKAXE = "Oh, cool, 2 for 1 special!",
		ORANGESTAFF = "I could just 4D Slip, you know.",
		YELLOWAMULET = "Wonder where the heat is coming from.",
		GREENAMULET = "A lazy American boy's best friend.",
		SLURPERPELT = "Poor thing was just hungry.",	

		SLURPER = "Is that a sentient hairball?",
		SLURPER_PELT = "Poor thing was just hungry.",
		ARMORSLURPER = "I dunno how it works, but it keeps me full.",
		ORANGEAMULET = "Useless junk. I already know how to teleport!",
		YELLOWSTAFF = "The power of the sun on a stick.",
		YELLOWGEM = "Some yellow gem.",
		ORANGEGEM = "It's a gem, but orange.",
        OPALSTAFF = "Genius, a rock on a stick!",
        OPALPRECIOUSGEM = "This is a pretty sweet looking gem!",
        TELEBASE = 
		{
			VALID = "Looks good to go.",
			GEMS = "It needs more purple gems.",
		},
		GEMSOCKET = 
		{
			VALID = "Looks goods to go.",
			GEMS = "It needs a gem.",
		},
		STAFFLIGHT = "That almost seems too warm.",
        STAFFCOLDLIGHT = "I'm freezing just looking at it!",
		ANCIENT_ALTAR = "Looks like some sort of old ruin.",
		ANCIENT_ALTAR_BROKEN = "Whatever this was ain't doing much now.",
		ANCIENT_STATUE = "Creepy.",
		
		LICHEN = "What's this stuff?",
		CUTLICHEN = "Oh, yuck! Why would I eat this?",
		CAVE_BANANA = "Bananas are pretty good.",
		CAVE_BANANA_COOKED = "Not bad.",
		CAVE_BANANA_TREE = "I had no idea bananas could grow down here.",
		ROCKY = "It's like some sort of crab made of stone.",
		
		COMPASS =
		{
			GENERIC="Man, how do am I supposed to read this?",
			N = "North.",
			S = "South.",
			E = "East.",
			W = "West.",
			NE = "Northeast.",
			SE = "Southeast.",
			NW = "Northwest.",
			SW = "Southwest.",
		},

        HOUNDSTOOTH = "Bet it'd hurt to be bit by that.",
        ARMORSNURTLESHELL = "That thing looks dumb.",
        BAT = "Oh, a bat!",
        BATBAT = "Well, it's not your typical bat.",
        BATWING = "Ah. Guess this is pretty cool.",
        BATWING_COOKED = "Uh, I don't have to eat that, right?",
        BATCAVE = "Best not disturb them.",
        BEDROLL_FURRY = "A could sleep all my problems away in a roll like this!",
        BUNNYMAN = "Half man, half bunny. Like some sort of comic!",
        FLOWER_CAVE = "It's like I'm on some sort of alient planet.",
		FLOWER_CAVE_DOUBLE="It's like I'm on some sort of alient planet.",
		FLOWER_CAVE_TRIPLE="Science makes it glow.",
        GUANO = "Oh, gross.",
        LANTERN = "Light for when you're on the go.",
        LIGHTBULB = "Cool.",
        MANRABBIT_TAIL = "A rabbit's tail. It's pretty cute.",
        MUSHROOMHAT = "A mushroom hat, huh? Well it's new, I'll give you that.",
        MUSHROOM_LIGHT2 =
        {
            ON = "Awesome!",
            OFF = "Hmmmm, what color should I make?",
            BURNT = "Darn.",
        },
        MUSHROOM_LIGHT =
        {
            ON = "Hm, I like it.",
            OFF = "How exactly does this work?",
            BURNT = "Well it's not lighting anything up now.",
        },
        SLEEPBOMB = "A nap in bomb form.",
        MUSHROOMBOMB = "I don't trust that!",
        SHROOM_SKIN = "Oooo, so slimy and bumpy!",
        TOADSTOOL_CAP =
        {
            EMPTY = "Nothing to see here.",
            INGROUND = "Hold on, I see something.",
            GENERIC = "Hmmmm.",
        },
        TOADSTOOL =
        {
            GENERIC = "That's a big frog, er, toad!",
            RAGE = "Oh boy, now you've done it Ninten!",
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "Now that's a big shroom!",
            BURNT = "Geez, it reeks!",
        },
        MUSHTREE_TALL =
        {
            GENERIC = "Holy moly, how'd it get so big?",
            BLOOM = "Now that's probably not good for my asthma.",
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "That's a big mushroom.",
            BLOOM = "Hey, watch the spores!",
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "A mushroom tree?",
            BLOOM = "Now that's probably not the best for my asthma.",
        },
        MUSHTREE_TALL_WEBBED = "It belongs to the spiders, I guess. Good, they can keep it.",
        SPORE_TALL =
        {
            GENERIC = "I probably don't wanna breathe that in.",
            HELD = "Sweet.",
        },
        SPORE_MEDIUM =
        {
            GENERIC = "No way is that safe for me to breathe in!",
            HELD = "Pretty cool.",
        },
        SPORE_SMALL =
        {
            GENERIC = "Careful Ninten, don't breathe it in.",
            HELD = "Cool.",
        },
        RABBITHOUSE =
        {
            GENERIC = "A carrot house? Stylish.",
            BURNT = "Aw, that sucks.",
        },
        SLURTLE = "Half slug, half turtle? Gross, but cool.",
        SLURTLE_SHELLPIECES = "Shell fragment, I guess.",
        SLURTLEHAT = "I am NOT getting that slimy filth anywhere near my hair.",
        SLURTLEHOLE = "It's all slimy!",
        SLURTLESLIME = "Oh, gross.",
        SNURTLE = "Hey, come here! I need to get a closer look at these things!",
        SPIDER_HIDER = "Sheesh, I thought the surface spiders were creepy!",
        SPIDER_SPITTER = "No no no no no that is some nightmare fuel, dude!",
        SPIDERHOLE = "A home for creepy crawlies.",
        SPIDERHOLE_ROCK = "The spiders can keep that.",
        STALAGMITE = "A stalagmite. Or cave rocks, I guess.",
		STALAGMITE_FULL= "Cave rocks, I guess.",
		STALAGMITE_LOW= "Cave rocks, I guess.",
		STALAGMITE_MED= "Cave rocks, I guess.",
        STALAGMITE_TALL = "Very rocky.",
		STALAGMITE_TALL_FULL= "Very rocky.",								   
		STALAGMITE_TALL_LOW= "Very rocky.",
		STALAGMITE_TALL_MED= "Very rocky.",
        TURF_CARPETFLOOR = "Some carpet.",				  
        TURF_CHECKERFLOOR = "Not bad.",
        TURF_DIRT = "Just some dirt.",
        TURF_FOREST = "Some earth I got from a forest.",				 
        TURF_GRASS = "It's soft.",
        TURF_MARSH = "Gross.",
        TURF_METEOR = "Space rocks.",
        TURF_PEBBLEBEACH = "Some beach rocks.",
        TURF_ROAD = "I could make my own roads with this.",					 
        TURF_ROCKY = "Just some rocks.",
        TURF_SAVANNA = "I could use some grass.",
        TURF_WOODFLOOR = "Wooden flooring.",

		TURF_CAVE="Wait, this stuff is?",
		TURF_FUNGUS="It's all squishy.",
		TURF_FUNGUS_MOON = "Whoa, this stuff looks out of this world!",
		TURF_ARCHIVE = "Looks kinda cool.",
		TURF_SINKHOLE="Rocky.",
		TURF_UNDERROCK="Cave rocks.",
		TURF_MUD="Mud. Dunno what I need this for to be frank with ya.",

		TURF_DECIDUOUS = "It has a nice color to it.",
		TURF_SANDY = "Sandy.",
		TURF_BADLANDS = "Just some chunk of the earth.",
		TURF_DESERTDIRT = "Some very dry ground..",
		TURF_FUNGUS_GREEN = "Squishy.",
		TURF_FUNGUS_RED = "How squishy.",
		TURF_DRAGONFLY = "It's fireproof",
		TURF_SHELLBEACH = "Sandy.",
        TURF_MONKEY_GROUND = "Sandy.",

		POWCAKE = "Dude, I don't even know if this junk is edible.",
        CAVE_ENTRANCE =  
		{
			GENERIC = "I feel something beneath this rock.",
			OPEN = "I'm never one to say no to adventure...",
		},
		CAVE_EXIT = "I can get back out through this.",
        CAVE_ENTRANCE_RUINS = "There's something beneath this.",
       	CAVE_ENTRANCE_OPEN = 
        {
            GENERIC = "Not sure about that one.",
            OPEN = "I'm curious, now.",
            FULL = "Too many people, that's just asking for a cave in.",
        },
        CAVE_EXIT = 
        {
            GENERIC = "I kinda like it down here.",
            OPEN = "That leads back up to the surface.",
            FULL = "I'm gonna stay down here for now.",
        },

		MAXWELLPHONOGRAPH = "Sounds like something my grandparents would listen to.",
		BOOMERANG = "I'm a boomerang master!",
		PIGGUARD = "Looks like he wants me to keep my distance",
		ABIGAIL =
		{
            LEVEL1 =
            {
                "This ghost seems friendlier than ones I'm familiar with.",
                "A ghost that fights on your behalf? Pretty sweet!",
            },
            LEVEL2 = 
            {
                "This ghost seems friendlier than ones I'm familiar with.",
                "A ghost that fights on your behalf? Pretty sweet!",
            },
            LEVEL3 = 
            {
                "This ghost seems friendlier than ones I'm familiar with.",
                "A ghost that fights on your behalf? Pretty sweet!",
            },
		},
		ADVENTURE_PORTAL = "That door gives me a bad feeling.",
		AMULET = "I sense this might be a good thing to hold on to.",
		ANIMAL_TRACK = "I'm no survival expert, but looks like animal tracks to me.",
		ARMORGRASS = "That looks so uncomfortable. Why would I wear that?",
		ARMORMARBLE = "How would I even walk in that garbage?",
		ARMORWOOD = "That's just asking for splinters.",
		ARMOR_SANITY = "Putting that on is a bad idea.",
		ASH =
		{
			GENERIC = "Remains of a fire.",
			REMAINS_GLOMMERFLOWER = "The flower burned up...",
			REMAINS_EYE_BONE = "Dang, it burned it!",
			REMAINS_THINGIE = "I have no idea what this was supposed to be.",
		},
		AXE = "I can use this for gathering wood, right?",
		BABYBEEFALO = 
		{
			GENERIC = "It's a baby. Pretty cute.",
		    SLEEPING = "Get some rest, little guy.",
        },
        BUNDLE = "Stuff. Things. Junk. Ya know.",
        BUNDLEWRAP = "For carrying lots of stuff.",
		BACKPACK = "Not as cool as my bookbag, but it'll do.",
		BACONEGGS = "Breakfast food. Don't mind if I do.",
		BANDAGE = "This'll come in handy if I get hurt.",
		BASALT = "That's a tough boulder.",
		BEARDHAIR = "Oh, gross. Someone clean that up.",
		BEARGER = "Holy mama, who's been feeding THAT bear?!",
		BEARGERVEST = "Pretty cozy. I could sleep forever wearing this!",
		ICEPACK = "My own icepack, nice, Ninten.",
		BEARGER_FUR = "That's some hefty fur..",
		BEDROLL_STRAW = "A bed is a bed, I guess.",
		BEEQUEEN = "That's one angry mama bee!!",
		BEEQUEENHIVE = 
		{
			GENERIC = "Mmmmm, the bee stings would be so worth that honey, Ninten.",
			GROWING = "Huh. Don't recall that being there.",
		},
        BEEQUEENHIVEGROWN = "Now that's a big bee hive!",
        BEEGUARD = "I'd rather not get stung by that.",
        HIVEHAT = "Oh, that's just gonna get honey all in my hair. No thanks.",
        MINISIGN =
        {
            GENERIC = "Hmmm. Not bad.",
            UNDRAWN = "I'm bored, I guess I draw something.",
        },
        MINISIGN_ITEM = "Where to put, where to put...",
		BEE =
		{
			GENERIC = "It's a bee!",
			HELD = "Watch that stinger, pal.",
		},
		BEEBOX =
		{
			READY = "So much honey... So tasty...",
			FULLHONEY = "So much honey... So tasty...",
			GENERIC = "A little home for bees.",
			NOHONEY = "There's no honey right now.",
			SOMEHONEY = "There's some honey, but I'll wait.",
			BURNT = "Nooooooooo!!",
		},
		MUSHROOM_FARM =
		{
			STUFFED = "Looks ready!",
			LOTS = "These guys are growing fast!",
			SOME = "Hey, some mushrooms!",
			EMPTY = "Nothing's here. I might have to do something.",
			ROTTEN = "This log is no good.",
			BURNT = "Dang it.",
			SNOWCOVERED = "Nothing's gonna grow in the Winter.",
		},
		BEEFALO =
		{
			FOLLOWER = "Come on, now.",
			GENERIC = "Hello!",
			NAKED = "Sorry, I needed the wool.",
			SLEEPING = "Let's not bother them.",
            --Domesticated states:
            DOMESTICATED = "This ones like a pet. I guess.",
            ORNERY = "Hoo boy, let's not get on this one's bad side!",
            RIDER = "He's fast as lightning!",
            PUDGY = "Man, how'd you get so big?",
            MYPARTNER = "My very own pet!",
		},

		BEEFALOHAT = "They think I'm one of them, I think.",
		BEEFALOWOOL = "Ugh, it smells.",
		BEEHAT = "This'll help keep me safe from angry bees.",
        BEESWAX = "Waxy!",
		BEEHIVE = "A beehive. I wonder if I could snag some honey...",
		BEEMINE = "A nasty surprise...",
		BEEMINE_MAXWELL = "Oh jeez, definitely don't wanna trigger that.",
		BERRIES = "Berries. Hopefully they're safe to eat.",
		BERRIES_COOKED = "Roasted berries? Well, when it comes to survival, I guess it'll do.",
        BERRIES_JUICY = "Pretty tasty!",
        BERRIES_JUICY_COOKED = "This things spoil fast!",
		BERRYBUSH =
		{
			BARREN = "It's needs something to grow.",
			WITHERED = "It's way to hot to grow anything.",
			GENERIC = "Oh, berries!",
			PICKED = "Let's hope they grow back.",
			DISEASED = "Something's wrong with that bush.",
			DISEASING = "That doesn't look good.",
			BURNING = "Oh boy, someone do something about the fire!",
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "Hm. Needs something to grow, I think.",
			WITHERED = "It's too hot to grow anything.",
			GENERIC = "Berries!",
			PICKED = "Nothing left to take.",
			DISEASED = "Something's wrong here.",
			DISEASING = "That does not look good.",
			BURNING = "Someone do something about that fire!",
		},
		BIGFOOT = "Wow!",
		BIRDCAGE =
		{
			GENERIC = "Think I could keep a bird in this?",
			OCCUPIED = "Hello little birdie!",
			SLEEPING = "Rest up!",
			HUNGRY = "Ah, you hungry? Me too.",
			STARVING = "Someone oughta feed you...",
			DEAD = "Do you think it's... dead?",
			SKELETON = "Oh.",
		},
		BIRDTRAP = "Never thought I'd be bird hunting.",
		CAVE_BANANA_BURNT = "It won't be growing anything now.",
		BIRD_EGG = "An egg.",
		BIRD_EGG_COOKED = "Ahhh, breakfast...",
		BISHOP = "I'd rather not meet my maker, thanks.",
		BLOWDART_FIRE = "Careful with this, Ninten.",
		BLOWDART_SLEEP = "I wonder if I could put something to sleep.",
		BLOWDART_PIPE = "Cool!",
		BLOWDART_YELLOW = "Careful, don't wanna get shocked!",
		BLUEAMULET = "It's so cold!",
		BLUEGEM = "I can feel the cold energy inside.",
		BLUEPRINT = 
		{ 
            COMMON = "Hmmm, what's this?",
            RARE = "Hmmm, what's this? Looks cool.",
        },
		BELL_BLUEPRINT = "Hmmmm, what's this?",
        SKETCH = "I wonder...",
		BLUE_CAP = "How blue.",
		BLUE_CAP_COOKED = "Is this good to eat??",
		BLUE_MUSHROOM =
		{
			GENERIC = "A blue mushroom?",
			INGROUND = "Hey, what's that?",
			PICKED = "Nothing there now.",
		},
		BOARDS = "Some planks, doing a whole lot of nothing.",
		BOAT = "Ugh. That wasn't my brightest idea...",
		BONESHARD = "Wonder whose bones these are.",
		BONESTEW = "That's a lot of meat!",
		BUGNET = "I wonder what I could catch with this.",
		BUSHHAT = "Now this'd be a great way to hide from my responsibilities.",
		BUTTER = "Butter? Where the- NO.",
		BUTTERFLY =
		{
			GENERIC = "Ah, a butterfly...",
			HELD = "Heh heh, 'sup little guy?",
		},
		BUTTERFLYMUFFIN = "The wings add the flavor.",
		BUTTERFLYWINGS = "They're kinda cool.",
		BUZZARD = "Vultures! Hopefully they're not waiting for me to croak.",

		SHADOWDIGGER = "Whoa, that's a cool trick! Maybe he's a psychic like me...",

		CACTUS = 
		{
			GENERIC = "I'd rather not poke that.",
			PICKED = "Watch the spines!",
		},
		CACTUS_MEAT_COOKED = "Smells sweet.",
		CACTUS_MEAT = "Uh, I dunno if I should eat it like that.",
		CACTUS_FLOWER = "I like it.",

		COLDFIRE =
		{
			EMBERS = "Fire's just about done for.",
			GENERIC = "Chilly.",
			HIGH = "That's overdoing it!",
			LOW = "Looks pretty low.",
			NORMAL = "How Chilly.",
			OUT = "Yeah, fire's done for.",
		},
		CAMPFIRE =
		{
			EMBERS = "Not much left in ya, huh?",
			GENERIC = "It keeps the darkness away.",
			HIGH = "That's overdoing it dude!",
			LOW = "Maybe I should add some fuel.",
			NORMAL = "Keeps me warm!",
			OUT = "Fire's done for.",
		},
		CANE = "My gramps has something like this.",
		CATCOON = "I'm more of a dog person.",
		CATCOONDEN = 
		{
			GENERIC = "A cute little home.",
			EMPTY = "I don't think anything lives there.",
		},
		CATCOONHAT = "Hmmmm. I like it!",
		COONTAIL = "Oh, man...",
		CARROT = "Mom says they help with your eyesight.",
		CARROT_COOKED = "It's not too bad.",
		CARROT_PLANTED = "Looks like a carrot.",
		CARROT_SEEDS = "Carrot seeds.",
		CARTOGRAPHYDESK =
		{
			GENERIC = "A nerd desk.",
			BURNING = "Ah, it's burning.",
			BURNT = "Oh, well.",
		},
		WATERMELON_SEEDS = "Watermelon seeds.",
		CAVE_FERN = "Some sort of fern.",
		CHARCOAL = "Reminds me of barbeques.",
        CHESSPIECE_PAWN = "Chess is not for Ninten",
        CHESSPIECE_ROOK =
        {
            GENERIC = "It's a castle thingie.",
            STRUGGLE = "Um, it's moving?!",
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "Well that's a horse, duh.",
            STRUGGLE = "Hey, how's it moving?",
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "I have no idea what that piece is to be honest with you.",
            STRUGGLE = "Uh, it's moving?!",
        },
        CHESSPIECE_MUSE = "Need a head for that mask?",
        CHESSPIECE_FORMAL = "King, huh? You uh, missing a few limbs there buddy.",
        CHESSPIECE_HORNUCOPIA = "A feast would be pretty awesome.",
        CHESSPIECE_PIPE = "Seems something gramps would use.",
        CHESSPIECE_DEERCLOPS = "I'd rather not be reminded of that thing.",
        CHESSPIECE_BEARGER = "Cool.",
        CHESSPIECE_MOOSEGOOSE =
        {
            "Why?",
        },
        CHESSPIECE_DRAGONFLY = "Looks just as angry in statue form.",
		CHESSPIECE_MINOTAUR = "That's a big horn!",
        CHESSPIECE_BUTTERFLY = "Beutiful.",
        CHESSPIECE_ANCHOR = "I've never been an ocean kid, honestly.",
        CHESSPIECE_MOON = "Not bad.",
        CHESSPIECE_CARRAT = "We have a winner!",
        CHESSPIECE_MALBATROSS = "That's not a very endearing bird.",
        CHESSPIECE_CRABKING = "I kinda like this one.",
        CHESSPIECE_TOADSTOOL = "Now why would I want to be reminded of that?",
        CHESSPIECE_STALKER = "That's just creepy.",
        CHESSPIECE_KLAUS = "Christmas if it wasn't fun.",
        CHESSPIECE_BEEQUEEN = "Your majesty!",
        CHESSPIECE_ANTLION = "Annoying little thing...",
		CHESSPIECE_KITCOON = "Adorable.",
		CHESSPIECE_CATCOON = "Adorable-ish.",
        CHESSPIECE_GUARDIANPHASE3 = "That wasn't very fun.",
        CHESSPIECE_EYEOFTERROR = "Can't hurt me in stone form!",
        CHESSPIECE_TWINSOFTERROR = "Can't hurt me in stone form!",
        CHESSJUNK1 = "Just some broken chess pieces.",
        CHESSJUNK2 = "It's supposed be chess pieces, but just looks like junk to me.",			 
        CHESSJUNK3 = "Some broken chess pieces.",
		CHESTER = "A living chest thingie.",
		CHESTER_EYEBONE =
		{
			GENERIC = "Um, hi.",
			WAITING = "Goodbye, I guess.",
		},
		COOKEDMANDRAKE = "Hope you taste good, at least.",
		COOKEDMEAT = "Let's eat!",
		COOKEDMONSTERMEAT = "I dunno, man...",
		COOKEDSMALLMEAT = "This'll make a good snack.",
		COOKPOT =
		{
			COOKING_LONG = "Hurry up, I wanna eat!",
			COOKING_SHORT = "Can't wait can't wait!",
			DONE = "Food's ready!",
			EMPTY = "We can use that to prepare meals.",
			BURNT = "Well it's not cooking anything now.",
		},
		CORN = "Mmmm, corn.",
		CORN_COOKED = "Now if only I had a movie...",
		CORN_SEEDS = "Corn seeds.",
        CANARY =
		{
			GENERIC = "Hello little birdie.",
			HELD = "How about you come with me for a little while?",
		},
        CANARY_POISONED = "It's not feeling well.",

		CRITTERLAB = "Hello?",
        CRITTER_GLOMLING = "Whoa, cool!",
        CRITTER_DRAGONLING = "Much cuter at this size.",
		CRITTER_LAMB = "Ey ey, watch the mucus!",
        CRITTER_PUPPY = "I love puppies!",
        CRITTER_KITTEN = "Aw, hey there, kitty.",
        CRITTER_PERDLING = "Pet bird? Not bad.",
		CRITTER_LUNARMOTHLING = "It's beutiful!",

		CROW =
		{
			GENERIC = "I think that's a crow.",
			HELD = "It looks mad.",
		},
		CUTGRASS = "Grass has all sorts of use.",
		CUTREEDS = "I wonder what I could do with these.",
		CUTSTONE = "Some carefully crafted stone.",
		DEADLYFEAST = "Definitely shouldn't eat that.",
		DEER =
		{
			GENERIC = "Where's your eyes, buddy?",
			ANTLER = "I like the antler.",
		},
        DEER_ANTLER = "I'll take that I guess.",
        DEER_GEMMED = "It's under that monster's control!",
		DEERCLOPS = "It's on a rampage!",
		DEERCLOPS_EYEBALL = "That's a big eye ball.",
		EYEBRELLAHAT =	"Well it'll keep me dry.",
		DEPLETED_GRASS =
		{
			GENERIC = "I think it's a tuft of grass.",
		},
        GOGGLESHAT = "Goggles are in, I hear.",
        DESERTHAT = "Reminds me of something an aviator would wear.",
		DEVTOOL = "It smells of bacon!",
		DEVTOOL_NODEV = "I'm not strong enough to wield it.",
		DIRTPILE = "Hmmm, wonder what that is.",
		DIVININGROD =
		{
			COLD = "I got nothing.",
			GENERIC = "I think it's some sort of search device.",
			HOT = "Looks like something's close!",
			WARM = "I'm getting a signal.",
			WARMER = "Warmer...",
		},
		DIVININGRODBASE =
		{
			GENERIC = "I wonder what it does.",
			READY = "It looks like it needs a large key.",
			UNLOCKED = "Now the machine can work!",
		},
		DIVININGRODSTART = "I'll take that!",
		DRAGONFLY = "Hot mama, now that's a dragon fly all right!",
		ARMORDRAGONFLY = "I don't know if scales is exactly my thing.",
		DRAGON_SCALES = "It's all scaly.",
		DRAGONFLYCHEST = "A dragon chest, sweet!",
		DRAGONFLYFURNACE = 
		{
			HAMMERED = "I don't think it's supposed to look like that.",
			GENERIC = "I'll never be cold again with this!", --no gems
			NORMAL = "Is it winking at me?", --one gem
			HIGH = "It's scalding!", --two gems
		},
        
        HUTCH = "Awww, it's a little chest guy.",
        HUTCH_FISHBOWL =
        {
            GENERIC = "He reminds me of the goldfish I used to have when I was little.",
            WAITING = "Wake up little guy!",
        },
		LAVASPIT = 
		{
			HOT = "Watch that spit!",
			COOL = "It's cooled down now.",
		},
		LAVA_POND = "Careful now, don't get too close.",
		LAVAE = "Whoa, those are some hot little guys!",
		LAVAE_COCOON = "They're cooled off now.",
		LAVAE_PET = 
		{
			STARVING = "I'll get you something to eat, I promise.",
			HUNGRY = "Hmmm. So what do you eat?",
			CONTENT = "It's in a good mood.",
			GENERIC = "It's kinda cute.",
		},
		LAVAE_EGG = 
		{
			GENERIC = "I wonder when the little thing will hatch.",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "Oh, do you need warmth?",
			COMFY = "There you go, my man!",
		},
		LAVAE_TOOTH = "That's your tooth?",	  

		DRAGONFRUIT = "What kind of fruit is this?",
		DRAGONFRUIT_COOKED = "Huh.",
		DRAGONFRUIT_SEEDS = "I can make more of that fruit with this.",
		DRAGONPIE = "Mmmmm, looks delicious!",
		DRUMSTICK = "I'm getting hungry just looking at it.",
		DRUMSTICK_COOKED = "Let's eat!",
		DUG_BERRYBUSH = "Don't mind if I take this.",
		DUG_BERRYBUSH_JUICY = "I'll take this with me.",
		DUG_GRASS = "I could use this somewhere else.",
		DUG_MARSH_BUSH = "You're coming with me.",
		DUG_SAPLING = "I'll plant you somehwere nicer.",
		DURIAN = "Ugh, that smell!",
		DURIAN_COOKED = "I can't eat this if it smells like that, man.",
		DURIAN_SEEDS = "Why I would want more of this, I have no clue.",
		EARMUFFSHAT = "Now my ears are warm!",
		EGGPLANT = "I've never really had eggplant.",
		EGGPLANT_COOKED = "I wonder if it's good.",
		EGGPLANT_SEEDS = "I could use this for more eggplants",
		
		ENDTABLE = 
		{
			BURNT = "Well it was nice while it lasted.",
			GENERIC = "A table.",
			EMPTY = "We could use some decor.",
			WILTED = "I think it's about time we get a fresh plant.",
			FRESHLIGHT = "Nice and bright.",
			OLDLIGHT = "Might need a new light, I think.", -- will be wilted soon, light radius will be very small at this point
		},
		DECIDUOUSTREE = 
		{
			BURNING = "Oh boy.",
			BURNT = "Well, the fire's out...",
			CHOPPED = "Nothing but a stump now.",
			POISON = "That's one angry tree!",
			GENERIC = "I used to climb these all the time back in Podunk.",
		},
		ACORN = 
		{
			GENRIC = "A tree for your pockets.",
			PLANTED = "Grow all ready!",
		},
        ACORN_SAPLING = "Grow all ready!",
		ACORN_COOKED = "They make for a good snack.",
		BIRCHNUTDRAKE = "Ey ey, chill little dude!",
		EVERGREEN =
		{
			BURNING = "Oh boy.",
			BURNT = "Well, the fire's out...",
			CHOPPED = "I could use this as a seat.",
			GENERIC = "It looks like a pine tree. We have lots of these back home.",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "Oh boy.",
			BURNT = "Fire's out now...",
			CHOPPED = "Cool, I could use this as a seat.",
			GENERIC = "Huh. This pine tree has no pine cones...",
		},
		TWIGGYTREE = 
		{
			BURNING = "Oh boy.",
			BURNT = "Well the fire's out.",
			CHOPPED = "Just me and a stump.",
			GENERIC = "Sticky.",			
			DISEASED = "Is that tree okay?",
		},
		TWIGGY_NUT_SAPLING = "Grow!!",
        TWIGGY_OLD = "It's an old tree now.",
		TWIGGY_NUT = "I'll plant you somewhere nice.",
		EYEPLANT = "Creepy.",
		INSPECTSELF = "Not bad, Ninten, not bad.",
		FARMPLOT =
		{
			GENERIC = "We should get farming. And by we, I mean not me.",
			GROWING = "Groooooow!!",
			NEEDSFERTILIZER = "It needs something.",
			BURNT = "Well nothing's gonna grow now...",
		},
		FEATHERHAT = "I'm a little Indian!",
		FEATHER_CROW = "A very dark feather.",
		FEATHER_ROBIN = "I like the color red.",
		FEATHER_ROBIN_WINTER = "White as snow.",
		FEATHER_CANARY = "Shocking.",
		FEATHERPENCIL = "It's like in the old times, I think.",
        COOKBOOK = "Oh good, this'll help me cook!",
		FEM_PUPPET = "Are you stuck?",
		FIREFLIES =
		{
			GENERIC = "We'd capture and put these in jars all the time!",
			HELD = "Light up my world, please!",
		},
		FIREHOUND = "That hound is hot to the touch!",
		FIREPIT =
		{
			EMBERS = "There's not much fire left.",
			GENERIC = "This'll keep me warm.",
			HIGH = "Might have over done it a little.",
			LOW = "Fire's looking a little low.",
			NORMAL = "Ah, so warm and fuzzy.",
			OUT = "Fire's out.",
		},
		COLDFIREPIT =
		{
			EMBERS = "Fire's just about done for.",
			GENERIC = "It keeps the darkness away.",
			HIGH = "That's quite the fire!",
			LOW = "The fire is a little low.",
			NORMAL = "So chilly!",
			OUT = "Fire's out.",
		},
		FIRESTAFF = "I'm a flame wizard!",
		FIRESUPPRESSOR = 
		{	
			ON = "Cool!",
			OFF = "I wanna try it!",
			LOWFUEL = "Hey, someone refuel that!",
		},
		FISH = "Fish outta water!",
		FISHINGROD = "I've never really fished that much before.",
		FISHSTICKS = "Fish sticks are pretty good!",
		FISH_MED = "Caught ya.",
		FISH_MED_COOKED = "You can never go wrong with cooked fish.",
		FISHTACOS = "Looks yummy!",
		FISH_COOKED = "Let's see how it is.",
		FISH3 = "Its scales are so shiny.",
		FISH3_COOKED = "Let's give it a bite.",
		FLINT = "Some sort of rock.",
		FLOWER = 
		{
            GENERIC = "Flowers are always a nice sight.",
            ROSE = "Ooo, a rose.",
        },
        FLOWER_WITHERED = "Does someone need some sunlight?",
		FLOWERHAT = "Looks pretty.",
		FLOWER_EVIL = "What sort of flower is that?!",
		FOLIAGE = "Foliage, I guess.",
		FOOTBALLHAT = "I've always been a baseball kid anyways.",
        FOSSIL_PIECE = "Whoa, fossils!",
        FOSSIL_STALKER =
        {
			GENERIC = "I'm missing something still.",
			FUNNY = "Hold on, that's not it.",
			COMPLETE = "Oh cool. What is it?",
        },
        STALKER = "Oh my nightmare fuel!!",
        STALKER_ATRIUM = "NopeNopeNopeNopeNopeNopeNopeNopeNope!!",
        STALKER_MINION = "Come here, you little squirt!",
        THURIBLE = "That thing seems to like this. Dunno if that's a good thing...",
        ATRIUM_OVERGROWTH = "Huh?",
		FROG =
		{
			DEAD = "I think it's dead...",
			GENERIC = "Hello little frog!",
			SLEEPING = "Sleep tight.",
		},
		FROGGLEBUNWICH = "Are the frog legs really needed?",
		FROGLEGS = "They're still twitching. Cooooool.",
		FROGLEGS_COOKED = "It can't be that bad.",
		FRUITMEDLEY = "Looks delicious.",
		FURTUFT = "A whole lot of fur.", 
		GEARS = "It's a bunch of junk.",
		GHOST = "Ah, we got a lot of you in Spookane!",
		GHOST_SAILOR = "Ah! Shiver me timbers!",
		GOLDENAXE = "Now this is an axe!",
		GOLDENPICKAXE = "I could do all sorts of mining with this.",
		GOLDENPITCHFORK = "A golden pitchfork!",
		GOLDENSHOVEL = "Nice and shiny.",
		GOLDNUGGET = "My very own gold.",
		GRASS =
		{
			BARREN = "It's not gonna grow without some help.",
			WITHERED = "Too hot? I feel ya.",
			BURNING = "Fire!",
			GENERIC = "Some grass.",
			PICKED = "Not much left now.",				
			DISEASED = "That's not right.",
			DISEASING = "That's not right.",															   
		},
		GRASSGEKKO = 
		{
			GENERIC = "Hey, a gecko!",	
			DISEASED = "Get well soon!",
		},
		GREEN_CAP = "It's green. Green means good, right?",
		GREEN_CAP_COOKED = "It's got quite the strong smell.",
		GREEN_MUSHROOM =
		{
			GENERIC = "A green mushroom.",
			INGROUND = "Hello, are you there?",
			PICKED = "Nothing there now.",
		},
		GUNPOWDER = "This stuff's explosive, right? Guess I should be careful.",
		HAMBAT = "It's not a baseball bat, but it'll do.",
		HAMMER = "A hammer for hammering, of course.",
		HEALINGSALVE = "This'll help with cuts and bruises.",
		HEATROCK =									 
		{
			FROZEN = "I can barely hold it, it's so cold!",
			COLD = "Pretty chilly.",
			GENERIC = "Don't know how it works, but it stores temperatures.",
			WARM = "Nice and warm.",
			HOT = "Ah! That's hot!",
		},
		HOME = "Home is what you make of it.",
		HOMESIGN =
		{
			GENERIC = "It says \"You are here\".",
            UNWRITTEN = "The sign is currently blank.",
			BURNT = "\"Don't play with matches.\"",										
		},
		ARROWSIGN_POST =
		{
			GENERIC = "It says \"Thataway\".",
            UNWRITTEN = "The sign is currently blank.",
			BURNT = "\"Don't play with matches.\"",										
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "It says \"Thataway\".",
            UNWRITTEN = "The sign is currently blank.",
			BURNT = "\"Don't play with matches.\"",
		},
		HONEY = "So sweet, so sticky!",
		HONEYCOMB = "It comes from beehives.",
		HONEYHAM = "Heaven on Earth.",
		HONEYNUGGETS = "I love these!",
		HORN = "They're pretty cool to blow into!",
		HOUND = "That's one mean dog!",
		HOUNDCORPSE =
		{
			GENERIC = "Oh, now I feel bad.",
			BURNING = "Goodbye.",
			REVIVING = "Nevermind that!",
		},
		HOUNDBONE = "Bones? Let me take a closer look.",
		HOUNDMOUND = "That seems to be the home of those horrible dogs. Better not get too close.",
		ICEBOX = "Nice, I'll be needing a fridge!",
		ICEHAT = "I used to do something similar with ice cubes from the fridge, but isn't THIS taking it a bit too far?",
		ICEHOUND = "Now, nice doggy!",
		INSANITYROCK =
		{
			ACTIVE = "It speaks to me...",
			INACTIVE = "Hm. Nothing to see here, then.",
		},
		JAMMYPRESERVES = "A quarter of the way to PB&J.",
		KABOBS = "Not bad, not bad.",
		KILLERBEE =				
		{
			GENERIC = "That's an angry bee!",
			HELD = "Watch the stinger, mister.",
		},
		KNIGHT = "I got a feeling that horse doesn't wanna play nice.",
		KOALEFANT_SUMMER = "What's up, big guy?",
		KOALEFANT_WINTER = "Man, you have no clue the sort of trouble I had tracking you down!",
		KRAMPUS = "Ey ey ey, get your mitts off my things!",
		KRAMPUS_SACK = "I think I'll use it store my things, if you will!",
		LEIF = "Whoa, he's like a guardian of the forest!",
		LEIF_SPARSE = "Whoa, he's like a guardian of the forest!",
		LIGHTER  = "Oh, a lighter. It could be useful.",
		LIGHTNING_ROD =
		{
			CHARGED = "It's brimming with electricity!",
			GENERIC = "Don't stand too close during a rainstorm!",
		},
		LIGHTNINGGOAT = 			
		{
			GENERIC = "Ah, I've never seen a goat in the wild!",
			CHARGED = "Whoa now, you okay there dude?",				
		},
		LIGHTNINGGOATHORN = "It's shaped like a lightning bolt.",
		GOATMILK = "Mmm, milk.",
		LITTLE_WALRUS = "Not so tough without your hounds, are ya?",
		LIVINGLOG = "Yeah, sorry about the time I chopped you up.",
		LOCKEDWES = "That evil man trapped that mime.\n...Good...",
		LOG =
		{
			BURNING = "Firewood! Get it? Ah, nevermind",
			GENERIC = "It's a log.",										
		},
		LUCY = "Nice axe!",
		LUREPLANT = "What is that thing? Maybe I should take a closer look...",
		LUREPLANTBULB = "I wonder if I should plant this thing.",
		MALE_PUPPET = "Are you stuck?",
		MANDRAKE = 
		{
			DEAD = "Finally...",
			GENERIC = "Whoa, that's a weird plant.",
			PICKED = "Gah, shut up!",
		},
		MANDRAKE_ACTIVE = "Gah, shut up!",
		MANDRAKE_PLANTED = "Whoa, that's a weird plant.",
		MANDRAKE = "Finally...",

        MANDRAKESOUP = "Let's eat.",
        MANDRAKE_COOKED = "Nice and quiet.",
        MAPSCROLL = "Just a blank scroll.",
        MARBLE = "Just some chunk of marble.",
        MARBLEBEAN = "A marble bean? So I plant this, and?",
        MARBLEBEAN_SAPLING = "Um. Grow?",
        MARBLESHRUB = "Whoa, it's actually growing!",
        MARBLEPILLAR = "It's a pillar.",
        MARBLETREE = "It's solid rock!",
        MARSH_BUSH =
        {
			BURNT = "Well the fire's out now.",
            BURNING = "Fire!",
            GENERIC = "Watch your fingers.",
            PICKED = "Ow!",
        },
        BURNT_MARSH_BUSH = "Nothing's left of it now.",
        MARSH_PLANT = "Some swamp plants.",
        MARSH_TREE =
        {
            BURNING = "Oh, it's on fire!",
            BURNT = "Well, the fire's out..",
            CHOPPED = "Just a stump now.",
            GENERIC = "That's quite the thorns.",
        },
        MAXWELL = "He gives me bad vibes.",
        MAXWELLHEAD = "I can see into his pores.",
        MAXWELLLIGHT = "It's got some sort of motion sensor, I think.",
        MAXWELLLOCK = "Looks almost like a key hole.",
        MAXWELLTHRONE = "That thing's bad news, I can sense it.",
        MEAT = "Some raw meat, waiting to be cooked.",
        MEATBALLS = "Looks pretty good.",
        MEATRACK =
        {
            DONE = "Oh boy, it's done!",
            DRYING = "Still drying...",
            DRYINGINRAIN = "Ugh, this rain is NOT helping!",
            GENERIC = "Ready to dry some meat.",
            BURNT = "Well the rack is done.",
            DONE_NOTMEAT = "It's done.",
            DRYING_NOTMEAT = "Still drying...",
            DRYINGINRAIN_NOTMEAT = "Could we not with the rain?",
        },
        MEAT_DRIED = "I love beef jerky!",
        MERM = "That fish creature doesn't look too friendly.",
        MERMHEAD =
        {
            GENERIC = "Oh jeez!",
            BURNT = "I'm gonna be sick...",
        },
        MERMHOUSE =
        {
            GENERIC = "It's all leaky.",
            BURNT = "That's not doing anyone any good now.",
        },
        MINERHAT = "Portable light for the noggin, not bad.",
        MONKEY = "Hello Mr. Monkey!",
        MONKEYBARREL = "A little home for primates!",
        MONSTERLASAGNA = "I really don't wanna eat that.",
        FLOWERSALAD = "I think that counts as a salad.",
        ICECREAM = "Ahhhh, reminds me of Summers back home.",
        WATERMELONICLE = "My very own fruity popsicle!",
        TRAILMIX = "A great snack on the baseball field.",
        HOTCHILI = "Sets my mouth on fire!",
        GUACAMOLE = "I like this snack.",
        MONSTERMEAT = "That doesn't seem safe to eat.",
        MONSTERMEAT_DRIED = "I dunno, man.",
        MOOSE = "Hoo boy, that's a big mama!",
        MOOSE_NESTING_GROUND = "A big nest for a big bird.",
        MOOSEEGG = "That's a big egg!",
        MOSSLING = "Hello!",
        FEATHERFAN = "This'll keep me cool in style.",
        MINIFAN = "I used to love these when I was little.",
		TROPICALFAN = "Now we're talking paradise.",
        GOOSE_FEATHER = "It's so soft.",
        STAFF_TORNADO = "It has the power to summon cyclones.",
        MOSQUITO =
        {
            GENERIC = "Ugh. Mosquitos.",
            HELD = "You watch it, mister!",
        },
        MOSQUITOSACK = "Oh, gross!",
        MOUND =
        {
            DUG = "That probably wasn't very courteous.",
            GENERIC = "Someone's final resting place.",
        },
        NIGHTLIGHT = "I don't like the feeling it's giving off.",
        NIGHTMAREFUEL = "Oh my!",
        NIGHTSWORD = "So sharp, so scary...",
        NITRE = "I'm not really sure what this stuff is.",
        ONEMANBAND = "I'm an electric guitar kid, but still cool!",
        OASISLAKE =
		{
			GENERIC = "Water!",
			EMPTY = "No water...",
		},
        PANDORASCHEST = "Hm. Wonder what's in there.",
        PANFLUTE = "I'm not really sure how to play it.",
        PAPYRUS = "Paper.",
        WAXPAPER = "Waxy paper.",
        PENGUIN = "EEEEEEEE!!! I LOVE penguins!!",
        PERD = "What's up, turkey?",
        PEROGIES = "I wonder if it's good.",
        PETALS = "Some picked flowers.",
        PETALS_EVIL = "You give me a bad feeling.",
        PHLEGM = "Gross.",
        PICKAXE = "Let's get to work.",
        PIGGYBACK = "A big sack to carry my things.",
        PIGHEAD =
        {
            GENERIC = "Oh God!",
            BURNT = "Smells... N-no, I don't wanna think about that!",
        },
        PIGHOUSE =
        {
            FULL = "Looks like they're home for the night.",
            GENERIC = "A home for pigs.",
            LIGHTSOUT = "You're not slick, mister!",
            BURNT = "Dang, that sucks.",
        },
        PIGKING = "That's quite the pig.",
        PIGMAN =
        {
            DEAD = "Rest in peace.",
            FOLLOWER = "Come along with me!",
            GENERIC = "What's up, pig dude?",
            GUARD = "That pig dude doesn't like me getting close.",
            WEREPIG = "Chill, dude!",
        },
        PIGSKIN = "Skinned pig.",
        PIGTENT = "Smells like bacon.",
        PIGTORCH = "That's some nice decor you got there.",
        PINECONE = 
		{
			GENERIC = "Pinecones are pretty neat.",
			PLANTED = "Grow, grow!",
		},
        PINECONE_SAPLING = "Grow, grow!",
        LUMPY_SAPLING = "Grow!!",
        PITCHFORK = "I don't even know what to do with this.",
        PLANTMEAT = "It's plant... meat?",
        PLANTMEAT_COOKED = "I dunno, man.",
        PLANT_NORMAL =
        {
            GENERIC = "It's a plant!",
            GROWING = "Groooww!!",
            READY = "Ready to harvest!",
            WITHERED = "I feel ya on the heat, buddy.",
        },
        POMEGRANATE = "I don't really know this fruit that well.",
        POMEGRANATE_COOKED = "How's it taste?",
        POMEGRANATE_SEEDS = "It's a seed.",
        POND = "Oh a pond. Let's swim!",
        POOP = "Oh, gross.",
        FERTILIZER = "It helps plants grow, somehow.",
        PUMPKIN = "A nice and big pumpkin.",
        PUMPKINCOOKIE = "Mmmmm!",
        PUMPKIN_COOKED = "Let's eat.",
        PUMPKIN_LANTERN = "I miss Halloween...",
        PUMPKIN_SEEDS = "I love pumpkin seeds.",
        PURPLEAMULET = "Get out of my head...",
        PURPLEGEM = "You give me horrible thougts, you know that?",
        RABBIT =
        {
            GENERIC = "Hey little guy!",
            HELD = "Wanna carrot?",
        },
        RABBITHOLE =
        {
            GENERIC = "A little home for a little rabbit.",
            SPRING = "Nothing's coming out.",
        },
        RAINOMETER =
        {
            GENERIC = "I can be like the weather man on TV!",
            BURNT = "Well that's no good.",
        },
        RAINCOAT = "Staying dry is a must!",
        RAINHAT = "Rain is nice and all, but keeping dry is too.",
        RATATOUILLE = "I've never had anything like this before.",
        RAZOR = "What do I need a razor for??",
        REDGEM = "It's pretty nice, I'll be honest.",
        RED_CAP = "What's the deal with this mushroom?",
        RED_CAP_COOKED = "Hmmm...",
        RED_MUSHROOM =
        {
            GENERIC = "A red mushroom.",
            INGROUND = "What's that?",
            PICKED = "Nothing's to see here.",
        },
        REEDS =
        {
            BURNING = "Uh, fire?",
            GENERIC = "Some reeds.",
            PICKED = "There's not enough to really take.",
        },
        RELIC = 
		{
			GENERIC = "Just a bunch of dusty furniture.",
			BROKEN = "Nothing but junk."
		},
        RUINS_RUBBLE = "Nothing but a buncha rocks.",
        RUBBLE = "Just a buncha rocks.",
        RESEARCHLAB =
        {
            GENERIC = "I have no clue what that thing is.",
            BURNT = "It's a bunch of nothing now.",
        },
        RESEARCHLAB2 =
        {
            GENERIC = "I guess it's for research? I guess?",
            BURNT = "I guess not.",
        },
        RESEARCHLAB3 =
        {
            GENERIC = "I'm one for adventure always, but something about this thing...",
            BURNT = "Well that adventure's over.",
        },
        RESEARCHLAB4 =
        {
            GENERIC = "Magic, huh?",
            BURNT = "Hold on, I'll try to cast an 'unburn-down' spell.",
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "Weird.",
            BURNT = "Weird and useless.",
        },
        RESURRECTIONSTONE = "It's giving off a lot of energy.",
        ROBIN =
        {
            GENERIC = "What's up bird?",
            HELD = "You comfy in there?",
        },
        ROBIN_WINTER =
        {
            GENERIC = "A winter bird?",
            HELD = "Keep me company.",
        },
        ROBOT_PUPPET = "You stuck?",
        ROCK_LIGHT =
        {
            GENERIC = "A crusted over lava pit.",
            OUT = "Looks fragile.",
            LOW = "The lava's crusting over.",
            NORMAL = "Nice and comfy.",
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "I could probably lift that.",
            RAISED = "I have my limits.",
        },
        ROCK = "A boulder.",
        PETRIFIED_TREE = "That's not right.",
        ROCK_PETRIFIED_TREE = "What happened here?",
        ROCK_PETRIFIED_TREE_OLD = "That's more rock than tree.",
        ROCK_ICE =
        {
            GENERIC = "Ah, I could use some ice!",
            MELTED = "Just a big sad puddle now.",
        },
        ROCK_ICE_MELTED = "Just a big sad puddle now.",
        ICE = "I love to suck on these.",
        ROCKS = "Rocks.",
        ROOK = "Hey, watch out!",
        ROPE = "Rope.",
        ROTTENEGG = "It's gone bad.",
        ROYAL_JELLY = "Mmmmmm...!",
        JELLYBEAN = "Delicious!",
        SADDLE_BASIC = "Saddle up, yee-haw!",
        SADDLE_RACE = "I'd be an awesome jockey!",
        SADDLE_WAR = "Stylish.",
        SADDLEHORN = "Let's get that saddle off of ya, hm?",
        SALTLICK = "It's real salty.",
        BRUSH = "I could use one for my own hair, you know.",
		SANITYROCK =
		{
			ACTIVE = "This thing gives me the heeby-jeebies...",
			INACTIVE = "Hm? Where'd it go?",
		},
		SAPLING =
		{
			BURNING = "Fire!",
			WITHERED = "Too hot, huh?",
			GENERIC = "Gimmie your sticks!",
			PICKED = "Thanks for the sticks.",
			DISEASED = "You okay?",
			DISEASING = "That doesn't look good.",
		},
   		SCARECROW = 
   		{
			GENERIC = "That'll keep the birds away.",
			BURNING = "My scarecrow!!",
			BURNT = "Well, darn it.",
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "I'm not really a crafts guy.",
			BLOCK = "Now what?",
			SCULPTURE = "Not bad!",
			BURNT = "Well then.",
   		},
        SCULPTURE_KNIGHTHEAD = "It's missing something.",
		SCULPTURE_KNIGHTBODY = 
		{
			COVERED = "What a dumb statue.",
			UNCOVERED = "Hm.",
			FINISHED = "There we are.",
			READY = "It's moving?",
		},
        SCULPTURE_BISHOPHEAD = "What's that?",
		SCULPTURE_BISHOPBODY = 
		{
			COVERED = "It's some stupid statue.",
			UNCOVERED = "What do we have here?",
			FINISHED = "There we go!",
			READY = "It's moving!",
		},
        SCULPTURE_ROOKNOSE = "I wonder what that's supposed to be",
		SCULPTURE_ROOKBODY = 
		{
			COVERED = "It's a statue",
			UNCOVERED = "Ah, I see.",
			FINISHED = "Done.",
			READY = "It's moving...",
		},
        GARGOYLE_HOUND = "Creepy...",
        GARGOYLE_WEREPIG = "Whoa...",
		SEEDS = "I got some seeds.",
		SEEDS_COOKED = "A baseball kid's favorite snack!",
		SEWING_KIT = "This'll keep my clothes in style!",
		SEWING_TAPE = "Tape fixes everything!",
		SHOVEL = "Let's dig for treasure.",
		SILK = "It's so soft!",
		SKELETON = "A dead guy. What's up dude?",
		SCORCHED_SKELETON = "Man, today is not your day.",
		SKELETON_PLAYER = "Whoa, so that's what I look like on the inside!",
		SKULLCHEST = "That's a creepy chest.",
		SMALLBIRD =
		{
			GENERIC = "You're not so bad when you're little.",
			HUNGRY = "I think it's hungry.",
			STARVING = "I know, I know, I'm working on it!",
			SLEEPING = "Aw.",
		},
		SMALLMEAT = "Tiny meat.",
		SMALLMEAT_DRIED = "Pocket jerky.",
		SPAT = "Oh, gross!",
		SPEAR = "A spear for self defense.",
		SPEAR_WATHGRITHR = "Cool!",
		WATHGRITHRHAT = "Eh.",
		SPIDER =
		{
			DEAD = "It's dead, I think.",
			GENERIC = "Normal spiders are all ready too much for me!",
			SLEEPING = "Don't mind me.",
		},
		SPIDERDEN = "I probably shouldn't mess with that!",
		SPIDEREGGSACK = "No thanks.",
		SPIDERGLAND = "Oh, gross.",
		SPIDERHAT = "I don't know about wearing that.",
		SPIDERQUEEN = "NOPE!!",
		SPIDER_WARRIOR =
		{
			DEAD = "Phew, it's dead!",
			GENERIC = "That is not a friendly spider!",
			SLEEPING = "Please don't wake up",
		},
		SPOILED_FOOD = "It's no good anymore.",
        STAGEHAND =
        {
			AWAKE = "Gah! It's alive!",
			HIDING = "Hmmm...",
        },
        STATUE_MARBLE = 
        {
            GENERIC = "It's a fancy marble statue.",
            TYPE1 = "Don't lose your head now!",
            TYPE2 = "Statuesque.",
            TYPE3 = "I wonder who the artist is.", --bird bath type statue
        },
		STATUEHARP = "Cool.",
		STATUEMAXWELL = "That guy...",
		STEAMEDHAMSANDWICH = "More power to you, I guess.",
		STEELWOOL = "My mom uses this stuff.",
		STINGER = "A bee's stinger. Watch your fingers!",
		STRAWHAT = "I'm like a farmer, now!",
		STUFFEDEGGPLANT = "Not bad for veggies.",
		SWEATERVEST = "Looking good, Ninten!",
		REFLECTIVEVEST = "Looks nice and keeps me cool, win-win!",
		HAWAIIANSHIRT = "Reminds me of vacation.",
		TAFFY = "Not my favorite candy.",
		TALLBIRD = "A very mean bird.",
		TALLBIRDEGG = "A very big egg.",
		TALLBIRDEGG_COOKED = "I love eggs.",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "It needs heat, right?",
			GENERIC = "There we are!",
			HOT = "Too much heat!",
			LONG = "Nothing to do but wait.",
			SHORT = "Come on out!",
		},
		TALLBIRDNEST =
		{
			GENERIC = "It's protecting it's egg!",
			PICKED = "Where'd your egg go?",
		},
		TEENBIRD =
		{
			GENERIC = "Wow, you're getting pretty tall.",
			HUNGRY = "Hungry?",
			STARVING = "Hey, quit it! I'll feel you, I promise!",
			SLEEPING = "Night night.",								
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "Why not just 4D slip?",
			GENERIC = "There's another world on the other side.",
			LOCKED = "It needs something.",
			PARTIAL = "Almost there.",
		},
		TELEPORTATO_BOX = "What with this junk?",
		TELEPORTATO_CRANK = "Some crank.",
		TELEPORTATO_POTATO = "It's a fake potato.",
		TELEPORTATO_RING = "A ring for that thingy. You know.",
		TELESTAFF = "4D Slip on a stick.",
		TENT = 
		{
			GENERIC = "A nice little tent to keep me safe at night.",
			BURNT = "Well it's not much of a shelter now.",
		},
		SIESTAHUT = 
		{
			GENERIC = "The laziness monster is calling my name.",
			BURNT = "Darn it.",
		},
		TENTACLE = "Watch out!",
		TENTACLESPIKE = "It's covered in slime...",
		TENTACLESPOTS = "Grooooooss.",
		TENTACLE_PILLAR = "Whoa, how'd it get so massive?",
        TENTACLE_PILLAR_HOLE = "How much to jump in that hole?",
		TENTACLE_PILLAR_ARM = "Get away!",
		TENTACLE_GARDEN = "Watch the hair, man.",
		TOPHAT = "Lookin' stylish, heh heh.",
		TORCH = "It lets me see in the dark.",
		TRANSISTOR = "Junk.",
		TRAP = "Very useful for capturing little critters.",
		TRAP_TEETH = "Watch your step.",
		TRAP_TEETH_MAXWELL = "Heh, you think I'm dumb enough to fall for that?",
		TREASURECHEST = 
		{
			GENERIC = "For storing my things.",
			BURNT = "No!",
		},
		TREASURECHEST_TRAP = "What do we have here!",
		SACRED_CHEST = 
		{
			GENERIC = "Hm? What do you need?",
			LOCKED = "What do you think?",
		},
		TREECLUMP = "Where in the world did this come from?",															
		TRINKET_1 = "Oh, cool.", --Melted Marbles
		TRINKET_2 = "Dang, it doesn't work.", --Fake Kazoo
		TRINKET_3 = "Just use a knife, dummies!", --Gord's Knot
		TRINKET_4 = "Some of our neighbors have these in their garden.", --Gnome
		TRINKET_5 = "Space is so cool.", --Toy Rocketship
		TRINKET_6 = "Some wires, I dunno.", --Frazzled Wires
		TRINKET_7 = "What a dumb toy.", --Ball and Cup
		TRINKET_8 = "Not gonna do me any good without a tub.", --Rubber Bung
		TRINKET_9 = "Might be useful for sewing.", --Mismatched Buttons
		TRINKET_10 = "Someone lose their teeth?", --Dentures
		TRINKET_11 = "Never trust a robot.", --Lying Robot
		TRINKET_12 = "Oh.", --Dessicated Tentacle
		TRINKET_13 = "You stay in the garden.", --Gnomette
		TRINKET_14 = "I've never had tea.", --Leaky Teacup
		TRINKET_15 = "Chess is lame.", --Pawn
		TRINKET_16 = "Chess is lame.", --Pawn
		TRINKET_17 = "Reminds me of when I found out about my powers.", --Bent Spork
		TRINKET_18 = "A toy horse. I bet my sisters would love it!", --Trojan Horse
		TRINKET_19 = "What the- It doesn't work! Lame.", --Unbalanced Top
		TRINKET_20 = "What'd I'd need this for?", --Backscratcher
		TRINKET_21 = "I've never been a cook.", --Egg Beater
		TRINKET_22 = "It's so soft.", --Frayed Yarn
		TRINKET_23 = "What's this?", --Shoehorn
		TRINKET_24 = "I'm a dog guy, but not bad.", --Lucky Cat Jar
		TRINKET_25 = "It's no good. Must  be old.", --Air Unfreshener
		TRINKET_26 = "Yeah, how about I just use a cup.", --Potato Cup
		TRINKET_27 = "I could use for inventing, or something. I dunno.", --Coat Hanger
		TRINKET_28 = "Yawn.", --Rook
        TRINKET_29 = "Yawn.", --Rook
        TRINKET_30 = "I don't like chess.", --Knight
        TRINKET_31 = "I don't like chess.", --Knight
        TRINKET_32 = "What even is it?", --Cubic Zirconia Ball
        TRINKET_33 = "Cool.", --Spider Ring
        TRINKET_34 = "It's good luck, apparently.", --Monkey Paw
        TRINKET_35 = "For potions!", --Empty Elixir
        TRINKET_36 = "Now I can be a vampire!", --Faux fangs
        TRINKET_37 = "Not gonna do any good against vampires in that state.", --Broken Stake
        TRINKET_38 = "This'll be useful!", -- Binoculars Griftlands trinket
        TRINKET_39 = "Well this isn't going to do me any good in this state.", -- Lone Glove Griftlands trinket
        TRINKET_40 = "I kinda like the design.", -- Snail Scale Griftlands trinket
        TRINKET_41 = "I wish I had a lava lamp for my room.", -- Goop Canister Hot Lava trinket
        TRINKET_42 = "Reminds me of kindergarten.", -- Toy Cobra Hot Lava trinket
        TRINKET_43 = "Reminds me of kindergarten.", -- Crocodile Toy Hot Lava trinket
        TRINKET_44 = "It's like some sort of snowglobe but without the snow.", -- Broken Terrarium ONI trinket						 
        TRINKET_45 = "What's with this radio?", -- Odd Radio ONI trinket
        TRINKET_46 = "A hairdryer. It doesn't work.", -- Hairdryer ONI trinket
        -- The numbers align with the trinket numbers above.
        LOST_TOY_1  = "Huh?",
        LOST_TOY_2  = "Huh?",
        LOST_TOY_7  = "Huh?",
        LOST_TOY_10 = "Huh?",
        LOST_TOY_11 = "Huh?",
        LOST_TOY_14 = "Huh?",
        LOST_TOY_18 = "Huh?",
        LOST_TOY_19 = "Huh?",
        LOST_TOY_42 = "Huh?",
        LOST_TOY_43 = "Huh?",
        
        HALLOWEENCANDY_1 = "It's not my favorite candy.", --Candy Apple
        HALLOWEENCANDY_2 = "These are all right, I guess.", --Candy Corn
        HALLOWEENCANDY_3 = "Oh. Lame!", --Not-So-Candy Corn
        HALLOWEENCANDY_4 = "Gummies are pretty good.", --Gummy Spider
        HALLOWEENCANDY_5 = "Mm, sweet!", --Catcoon Candy
        HALLOWEENCANDY_6 = "Suspicious.", --"Raisins"
        HALLOWEENCANDY_7 = "It's not candy, but they're all right.", --Raisins
        HALLOWEENCANDY_8 = "You can never go wrong with a lollipop!", --Ghost Pop
        HALLOWEENCANDY_9 = "I love gummy worms!", --Jelly Worm
        HALLOWEENCANDY_10 = "I'm gonna eat it all!", --Tentacle Lolli
        HALLOWEENCANDY_11 = "Chocolates, yay!", --Choco Pigs
        HALLOWEENCANDY_12 = "Oh, gross.", --ONI meal lice candy
        HALLOWEENCANDY_13 = "Man, I never liked these things.", --Griftlands themed candy
        HALLOWEENCANDY_14 = "I can take it!", --Hot Lava pepper candy
        CANDYBAG = "Trick or treat!",
		HALLOWEEN_ORNAMENT_1 = "A little poltergeist. Nothing but trouble.", --Ghost Decoration
		HALLOWEEN_ORNAMENT_2 = "It's a little bat.", --Bat Decoration
		HALLOWEEN_ORNAMENT_3 = "I'm fine with them in toy form.", --Spider Decoration
		HALLOWEEN_ORNAMENT_4 = "Some nice decor to lighten the mood.", --Tentacle Decoration
		HALLOWEEN_ORNAMENT_5 = "I'm fine with them in toy form.", --Dangling Depth Dweller Decoration
		HALLOWEEN_ORNAMENT_6 = "A crow, perfect for Halloween!", --Crow Decoration 																 

		HALLOWEENPOTION_DRINKS_WEAK = "Mmmmmm. Needs something more.",
		HALLOWEENPOTION_DRINKS_POTENT = "Now this, this is a potion.",
        HALLOWEENPOTION_BRAVERY = "Stow your fear!", --Brew of Phobic Abatement
		HALLOWEENPOTION_MOON = "I dunno how it works, but it seems to transform things", --Steep Lunar Essence
		HALLOWEENPOTION_FIRE_FX = "When your fire isn't cool enough.", --Sulfuric Crystals of Lime
		MADSCIENCE_LAB = "Mad scientists are some cool, crazy nerds.",
		LIVINGTREE_ROOT = "Something's in there! I'll have to root it out.", 
		LIVINGTREE_SAPLING = "Just as scary as a baby.",

        DRAGONHEADHAT = "Cool!",
        DRAGONBODYHAT = "Being the body is so lame.",
        DRAGONTAILHAT = "At least I'm not in the middle, I guess.",								
        PERDSHRINE =													 
				  
        {
            GENERIC = "It needs an offering.",
            EMPTY = "What do you want?",
            BURNT = "Guess not, then.",
        },
        REDLANTERN = "Now this is pretty sweet!",
        LUCKY_GOLDNUGGET = "I should hold on to this.",
        FIRECRACKERS = "I love playing with these! Hopefully mom never finds out.",
        PERDFAN = "This'll keep me nice and cool.",
        REDPOUCH = "What do we have here?",
        WARGSHRINE = 
        {
            GENERIC = "A cute little shrine.",
            EMPTY = "Let's get you a torch.",
            BURNING = "I should make something fun.", --for willow to override
            BURNT = "Whoops.",
        },
        CLAYWARG = 
        {
        	GENERIC = "Just as mean as the real deal!",
        	STATUE = "I don't trust that statue.",
        },
        CLAYHOUND = 
        {
        	GENERIC = "H-hey, stay back!",
        	STATUE = "Are you sure this thing's just a statue.",
        },
        HOUNDWHISTLE = "Dog whistles seem so cruel.",
        CHESSPIECE_CLAYHOUND = "Such detail!",
        CHESSPIECE_CLAYWARG = "Memories of the time I almost got mauled by a dog.",

		PIGSHRINE =
		{
            GENERIC = "Pig worship?",
            EMPTY = "I feed this thing meat??",
            BURNT = "Well that's done for.",
		},
		PIG_TOKEN = "I'll take that.",
		PIG_COIN = "It's some sort of money.",
		YOTP_FOOD1 = "Looks delicious!",
		YOTP_FOOD2 = "A meal fit for pigs.",
		YOTP_FOOD3 = "It's food I guess.",
		PIGELITE1 = "What are you looking at?", --BLUE
		PIGELITE2 = "Bring it on!", --RED
		PIGELITE3 = "I can take you!", --WHITE
		PIGELITE4 = "You want some?!", --GREEN

		PIGELITEFIGHTER1 = "What are you looking at?", --BLUE
		PIGELITEFIGHTER2 = "Bring it on!", --RED
		PIGELITEFIGHTER3 = "I can take you!", --WHITE
		PIGELITEFIGHTER4 = "You want some?!", --GREEN

		CARRAT_GHOSTRACER = "That's...",

        YOTC_CARRAT_RACE_START = "It's a good enough place to start.",
        YOTC_CARRAT_RACE_CHECKPOINT = "You've made your point.",
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "It's really more of a finish circle than a line.",
            BURNT = "It's all gone up in flames!",
            I_WON = "Heh, heh, what can I say, I'm just great at everything, I guess!",
            SOMEONE_ELSE_WON = "This loss is only motivation for next time, {winner}!",
        },						
		YOTC_CARRAT_RACE_START_ITEM = "Well, it's a start.",
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "That checks out.",
		YOTC_CARRAT_RACE_FINISH_ITEM = "The end's in sight.",
		YOTC_SEEDPACKET = "Looks pretty seedy, if you ask me.",
		YOTC_SEEDPACKET_RARE = "Hey there, fancy-plants!",
		MINIBOATLANTERN = "It's a latern.",
        YOTC_CARRATSHRINE =
        {
            GENERIC = "We're really worshipping rodents, now, huh.",
            EMPTY = "What do you even want from me?",
            BURNT = "Yeah it's for the best.",										
        },
        YOTC_CARRAT_GYM_DIRECTION = 		  
        {
            GENERIC = "This'll get things moving in the right direction.",
            RAT = "That way!",
            BURNT = "Well then.",
        },
        YOTC_CARRAT_GYM_SPEED = 			   
        {
            GENERIC = "I'll make you a star!",
            RAT = "Give it your all!",
            BURNT = "I may have overdone it.",
							 
        },
        YOTC_CARRAT_GYM_REACTION = 
														 
					   
        {
            GENERIC = "There's more training to do!",
            RAT = "Think fast!",
            BURNT = "No good, no good.",
        },
        YOTC_CARRAT_GYM_STAMINA = 
        {
            GENERIC = "Let's work that cardio!",
            RAT = "Keep going, you got it!",
            BURNT = "Oops.",
        }, 

        YOTC_CARRAT_GYM_DIRECTION_ITEM = "Let's get training.",
        YOTC_CARRAT_GYM_SPEED_ITEM = "This'll get you up to speed.",
        YOTC_CARRAT_GYM_STAMINA_ITEM = "This'll help your stamina.",
        YOTC_CARRAT_GYM_REACTION_ITEM = "This'll help your reaction. Just need to put it together.",

        YOTC_CARRAT_SCALE_ITEM = "I can find out how good my rat is.",           
        YOTC_CARRAT_SCALE = 
        {
            GENERIC = "Let's see how we're doing.",
            CARRAT = "Meh. Needs work.",
            CARRAT_GOOD = "We're ready.",
            BURNT = "Well.",
        },                

        YOTB_BEEFALOSHRINE =
        {
            GENERIC = "What to make...",
            EMPTY = "What do beefalo like?",
            BURNT = "It's a bunch of nothing now.",
        },

        BEEFALO_GROOMER =
        {
            GENERIC = "Now I just need a beefalo.",
            OCCUPIED = "I've never been the ranching type... Let's see how this goes.",
            BURNT = "It's not grooming anything now.",
        },
        BEEFALO_GROOMER_ITEM = "Let's set up shop.",

		BISHOP_CHARGE_HIT = "Ow ow ow!",
		TRUNKVEST_SUMMER = "I prefer my own coat.",
		TRUNKVEST_WINTER = "Not bad. Could be a bit more stylish, but it'll do.",
		TRUNK_COOKED = "I've never had trunk before...",
		TRUNK_SUMMER = "It's a trunk. Why I have it, I'm not sure.",
		TRUNK_WINTER = "It feels so rough.",
		TUMBLEWEED = "Reminds me of cowboys.",
		
		
		
		
		
		
		
		TURKEYDINNER = "Thanksgiving already?!",
		TWIGS = "It's just a stick.",
		UMBRELLA = "It'll keep me dry.",
		GRASS_UMBRELLA = "This'll do.",
		PALMLEAF_UMBRELLA = "Had to improvise, but hey, that's what Ninten does best.",
		UNIMPLEMENTED = "Needs work.",
		WAFFLES = "I love waffles!",
		WALL_HAY = 
		{	
			GENERIC = "I don't know about this, man.",
			BURNT = "Yeah, I had a feeling something like that would happen.",
		},
		WALL_HAY_ITEM = "What am I gonna do with this?",
		WALL_STONE = "I'll build myself an entire castle!",
		WALL_STONE_ITEM = "A proper wall.",
		WALL_RUINS = "A very old wall.",
		WALL_RUINS_ITEM = "It's very old.",
		WALL_WOOD = 
		{
			GENERIC = "Careful, watch the spikes!",
			BURNT = "It's gone up in flames.",
		},
		WALL_WOOD_ITEM = "Wooden walls.",
		WALL_MOONROCK = "They're from out of this world.",
		WALL_MOONROCK_ITEM = "Light but sturdy.",
		FENCE = "It's a fence.",
        FENCE_ITEM = "It's about time we put up a fence.",
        FENCE_GATE = "It's a gate.",
        FENCE_GATE_ITEM = "It's a gate.",
		WALRUS = "He's hunting me.",
		WALRUSHAT = "Now this, this is my style!",
		WALRUS_CAMP =
		{
			EMPTY = "Whoever was here is long gone.",
			GENERIC = "Yoooo, let me in?",
		},
		WALRUS_TUSK = "Cool, a tusk.",
		WARDROBE = 
		{
			GENERIC = "Even in the wild, a variety of dress is a must.",
            BURNING = "Fire!",
			BURNT = "It's not holding anything now.",
		},
		WARG = "That dog does not look friendly.",
		WASPHIVE = "Aah! Wasps!!",
		WATERBALLOON = "Summer time is here, woo-hoo!",
		WATERMELON = "It tastes great, but it makes my fingers all sticky.",
		WATERMELON_COOKED = "Mmmmm, yum.",
		WATERMELONHAT = "Oh jeez, that's gonna take forever to get out of my hair.",
		WAXWELLJOURNAL = "It's that one dude's weird book.",
		WETGOOP = "Gross.",
        WHIP = "I'm Indiana Jones!",
		WINTERHAT = "It'll be good for when winter comes.",
		WINTEROMETER = 
		{
			GENERIC = "Knowing the weather is important.",
			BURNT = "Darn.",
		},

        WINTER_TREE =
        {
            BURNT = "Christmas is canceled...",
            BURNING = "No no no no!",
            CANDECORATE = "I love this time of the year!",
            YOUNG = "I can't wait!",
        },
		WINTER_TREESTAND = 
		{
			GENERIC = "Now I just need a tree.",
            BURNT = "*Sigh...*",
		},
        WINTER_ORNAMENT = "I love hanging ornaments.",
        WINTER_ORNAMENTLIGHT = "What's a Christmas tree without lights?",
        WINTER_ORNAMENTBOSS = "Memories of being scared out of my mind.",
		WINTER_ORNAMENTFORGE = "I should hang this one over a fire.",
		WINTER_ORNAMENTGORGE = "For some reason it makes me hungry.",

        WINTER_FOOD1 = "Mom made the best gingerbread houses.", --gingerbread cookie
        WINTER_FOOD2 = "I love these.", --sugar cookie
        WINTER_FOOD3 = "They're fun to suck on.", --candy cane
        WINTER_FOOD4 = "Gross.", --fruitcake
        WINTER_FOOD5 = "Not bad.", --yule log cake
        WINTER_FOOD6 = "You can never go wrong with pudding.", --plum pudding
        WINTER_FOOD7 = "Apple cider, oh boy!", --apple cider
        WINTER_FOOD8 = "I miss home.", --hot cocoa
        WINTER_FOOD9 = "Eggnog's good.", --eggnog

		WINTERSFEASTOVEN =
		{
			GENERIC = "Let's cook!",
			COOKING = "It's cooking.",
			ALMOST_DONE_COOKING = "I can smell the deliciousness!",
			DISH_READY = "Yum!",
		},
		BERRYSAUCE = "Some delicious sauce.",
		BIBINGKA = "Soft and spongy.",
		CABBAGEROLLS = "Hmmm.",
		FESTIVEFISH = "Seafood?",
		GRAVY = "It's all gravy.",
		LATKES = "Not bad.",
		LUTEFISK = "What's this stuff?",
		MULLEDDRINK = "Punch, huh?",
		PANETTONE = "This Yuletide bread really rose to the occasion.",
		PAVLOVA = "I love good Pavlova.",
		PICKLEDHERRING = "Pickles are alright, I guess.",
		POLISHCOOKIE = "I'll polish off this whole plate!",
		PUMPKINPIE = "It tastes great!",
		ROASTTURKEY = "I see a big juicy drumstick with my name on it.",
		STUFFING = "That's the good stuff!",
		SWEETPOTATO = "Yes please!",
		TAMALES = "If I eat much more I'm going to start feeling a bit husky.",
		TOURTIERE = "Pleased to eat you.",

		TABLE_WINTERS_FEAST = 
		{
			GENERIC = "A feastival table.",
			HAS_FOOD = "Time to eat!",
			WRONG_TYPE = "It's not the season for that.",
			BURNT = "Who would do such a thing?",
		},

		GINGERBREADWARG = "Time to desert this dessert.", 
		GINGERBREADHOUSE = "Room and board all rolled into one.", 
		GINGERBREADPIG = "I'd better follow him.",
		CRUMBS = "A crummy way to hide yourself.",
		WINTERSFEASTFUEL = "The spirit of the season!",

        KLAUS = "It's pure evil!",
        KLAUS_SACK = "Do I mess with that thing?",
		KLAUSSACKKEY = "Let's give it a shot.",
		WORMHOLE =
		{
			GENERIC = "What in the world?",
			OPEN = "Wait, it wants me to jump in??",
		},
		WORMHOLE_LIMITED = "I dunno, dude.",
		ACCOMPLISHMENT_SHRINE = "The name's Ninten and don't you forget it!",        
		LIVINGTREE = "I got a bad feeling about that tree.",
		ICESTAFF = "I'll freeze anything that gets in my way!",
		REVIVER = "I can bring a friend back to life with this.",
		SHADOWHEART = "Creepy.",
        ATRIUM_RUBBLE = 
        {
			LINE_1 = "This gives me a bad feeling.",
			LINE_2 = "I can't tell what this is.",
			LINE_3 = "I don't like the looks of that.",
			LINE_4 = "Oh gosh! What are they doing?",
			LINE_5 = "It's a city from the future. Or past, I guess? I dunno.",
		},
        ATRIUM_STATUE = "These creep me out.",
        ATRIUM_LIGHT = 
        {
			ON = "I really don't wanna be down here anymore...",
			OFF = "What's this?",
		},
        ATRIUM_GATE =
        {
			ON = "It's on.",
			OFF = "It's not doing a whole lot.",
			CHARGING = "What's it doing?",
			DESTABILIZING = "Hang on to something!",
			COOLDOWN = "...Christ...",
        },
        ATRIUM_KEY = "This looks useful.",
		LIFEINJECTOR = "This'll get anyone in tip-top shape!",
		SKELETON_PLAYER =
		{
			MALE = "Dang, sorry %s.",
			FEMALE = "Dang, sorry %s",
			ROBOT = "Dang, sorry %s",
			DEFAULT = "Dang, sorry %s",
		},
		HUMANMEAT = "Oh God...",
		HUMANMEAT_COOKED = "Is survival worth this... Ninten?",
		HUMANMEAT_DRIED = "I can't...",
		ROCK_MOON = "From another world.",
		MOONROCKNUGGET = "I wonder what it's like on the moon.",
		MOONROCKCRATER = "It's a crater.",
		MOONROCKSEED = "Huh.",

        REDMOONEYE = "I can sense this things energy from miles away!",
        PURPLEMOONEYE = "It speaks to me. I can hear it from miles away.",
        GREENMOONEYE = "It watches things for me.",
        ORANGEMOONEYE = "My PSI allows me to know where it always is.",
        YELLOWMOONEYE = "I always know where it is.",
        BLUEMOONEYE = "I can sense it from miles away.",
		
		FLOTSAM = "I wonder if there's any sunken goodies in there.",
		
		SUNKEN_BOAT = 
		{
			GENERIC = "Ooh, a parrot!",
			ABANDONDED = "They're a lot meaner in person...",
		},
		SUNKEN_BOAT_BURNT = "Sinking wasn't enough.",
   		SUNKEN_BOAT_TRINKET_1 = "Yuck, looks like something we'd use in geometry.", --sextant
		SUNKEN_BOAT_TRINKET_2 = "I had something like this when I was little!", --toy boat
		SUNKEN_BOAT_TRINKET_3 = "Won't be much use now.", --candle
		SUNKEN_BOAT_TRINKET_4 = "It's like some alien... thing. I dunno.", --sea worther
		SUNKEN_BOAT_TRINKET_5 = "I prefer my sneakers.", --boot
		
		--- CAPY DLC ------------------------------------------------------------------------------------------------
		
		--STUFFEDEGGPLANT = "I'll be stuffed after eating this!",
		SUNKBOAT = "Unlucky.",
		--BANANAPOP = "No, not brain freeze! I need that for science!",
		--BISQUE = "Cooking that sure kept me bisque-y!",
		--CEVICHE = "Can I get a bigger bowl? This one looks a little shrimpy.",
		--SEAFOODGUMBO = "It's a jumbo seafood gumbo.",
		--SURFNTURF = "It's perf!",
		SHARKFINSOUP = "I've heard of this stuff before, but to try it...!",
		--LOBSTERDINNER = "If I eat it in the morning is it still dinner?",
		--LOBSTERBISQUE = "Could use more salt, but that's none of my bisque-ness.",
		JELLYOPOP = "Jelly-O pop it right in my mouth!",
		--SWEATERVEST = "This vest is dapper as all get-out.",
		--REFLECTIVEVEST = "Keep off, evil sun!",
		--HAWAIIANSHIRT = "It's not lab safe!",
		--TAFFY = "My dentist'd get mad if I ate this... but I don't have one.",

		ANTIVENOM = "Yeesh, that's bitter...",
		VENOMGLAND = "My biology teach says venom is actually used to cure poisoning.",
		BLOWDART_POISON = "Very useful for murder mysteries.",
		OBSIDIANMACHETE = "Cooool.",
		SPEARGUN_POISON = "Careful, the tip has an extra surprise.",
		OBSIDIANSPEARGUN = "I could take anything with this!",
		LUGGAGECHEST = "We got one of these in the cellar back home.",
		PIRATIHATITATOR =
		{
			GENERIC = "Very... thematic.",
			BURNT = "Oh well.",
		},
		COFFEEBEANS = "I found coffee beans!",
		COFFEE = "Mom says it stunts my growth.",
		COFFEEBEANS_COOKED = "But how do I get the coffee?",
		COFFEEBUSH =
		{
			BARREN = "Doesn't look right...",
			WITHERED = "It's not liking this heat.",
			GENERIC = "I think I know what that stuff is!",
			PICKED = "They'll grow back.",
		},
		COFFEEBOT = "One espresso, please!",
		MUSSEL = "Shellfish? Don't mind if I do.",
		MUSSEL_FARM =
		{
			 GENERIC = "There's a lotta clams down there.",
			 STICKPLANTED = "We're eating good tonight!"
		},

		MUSSEL_STICK = "Time to fish me some mussel.",
		LOBSTER = "It's a real lobster!",
		LOBSTERHOLE = "A home for lobsters.",
		SEATRAP = "Time to find me some dinner.",
		SAND_CASTLE =
		{
			SAND = "A sand castle!",
			GENERIC = "Ahhh, brings back good memories of vacations on the beach..."
		},
		BOATREPAIRKIT = "It'll help in a pinch.",

		BALLPHIN = "Awwww, aren't you cute?",
		BOATCANNON = "What pirate would I be without one?",
		BOTTLELANTERN = "So pretty.",
		BURIEDTREASURE = "YES! I'm the best pirate ever!",
		BUSH_VINE =
		{
			BURNING = "Oh boy.",
			BURNT = "Well, the fire's out.",
			CHOPPED = "I chopped it good.",
			GENERIC = "They're just waiting to trip me, I know it.",
		},
		CAPTAINHAT = "That's Captain Ninten to you!",
		COCONADE =
		{
			BURNING = "Fire in the hole!",
			GENERIC = "Oh yeaaah, the fuse.",
		},
		CORAL = "Cool!",
		CORALREEF = "Wow, so pretty!",
		CRABHOLE = "I know you're in there.",
		CUTLASS = "Yaar!",
		DUBLOON = "I tell ya, once I'm outta here I'm set for life!",
		FABRIC = "It feels nice to touch.",
		FISHINHOLE = "There's lots of fish down there.",
		GOLDENMACHETE = "Now I'm ready to explore!",
		JELLYFISH = "Careful, don't get stung!",
		JELLYFISH_DEAD = "Poor thing.",
		JELLYFISH_COOKED = "Do I have to eat this?",
		JELLYFISH_PLANTED = "Excuse me?",
		JELLYJERKY = "Well, mom says never to waste food...",

		LIMPETROCK =
		{
			GENERIC = "Look at all the snails!",
			PICKED = "There's nothing left.",
		},
		LOGRAFT = "If it floats, it works for me.",
		MACHETE = "What kind of explorer would I be without one?",
		MESSAGEBOTTLEEMPTY = "I like blowing into it.",
		MOSQUITO_POISON = "Those aren't normal mosquitos...",
		OBSIDIANCOCONADE = "Make sure to cover your ears for this one!",
		OBSIDIANFIREPIT =
		{
			EMBERS = "Fire's about done.",
			GENERIC = "It's very warm.",
			HIGH = "I can feel the heat from so far away!",
			LOW = "It's a little low.",
			NORMAL = "So cozy.",
			OUT = "Fire's out.",
		},
		OX = "Why, hello.",
		PIRATEHAT = "Yaaaar matey, where ye be hiding the booty?",
		RAFT = "Well it floats, at least.",
		ROWBOAT = "We're getting somewhere now.",
		SAIL = "I've always wanted to try sailing.",
		SANDBAG_ITEM = "It'll help with flooding.",
		SANDBAG = "It'll help with flooding.",
		SEASACK = "It'll keep my snacks fresh!",
		SEASHELL_BEACHED = "This one's all white.",
		SEAWEED = "It's all slimy.",

		SEAWEED_PLANTED = "It's very useful for wrapping sushi, you know.",
		SLOTMACHINE = "Mom doesn't like me messing with them.",
		SNAKE_POISON = "Poison out here woudln't be good!",
		SNAKESKIN = "Oh, cool.",
		SNAKESKINHAT = "It's very scaly.",
		SOLOFISH = "I miss Mick.",
		SPEARGUN = "Seems dangerous. Awesome!",
		--SPOILED_FISH = "I'm not terribly curious about the smell.",
		SWORDFISH = "That fish doesn't look happy to see me.",
		TRIDENT = "Whoa, cool!",
		--TRINKET_13 = "What is this substance?",
		--TRINKET_14 = "This thing gives me the creeps...",
		--TRINKET_15 = "Incredible! This guitar has undergone shrinkification!",
		--TRINKET_16 = "How did this get all the way out here?",
		--TRINKET_17 = "Where's the other one?",
		--TRINKET_18 = "A relic of a bygone era!",
		--TRINKET_19 = "Clouding of the brain. Never heard of it...",
		TURBINE_BLADES = "Ugh, what a nuissance you were, you know that?",
		TURF_BEACH = "Take paradise with you.",
		TURF_JUNGLE = "It's very tropical.",
		VOLCANO_ALTAR =
		{
			GENERIC = "Nothing's there.",
			OPEN = "Does it want something?",
		},
		VOLCANO_ALTAR_BROKEN = "Oops...",
		WHALE_BLUE = "Why so sad?",
		WHALE_CARCASS_BLUE = "Oh God...",
		WHALE_CARCASS_WHITE = "Oh God...",

		ARMOR_SNAKESKIN = "So vibrant! I'd love a raincoat like this back home!",
		CLOTHSAIL = "A proper sail, I'd say!",
		DUG_COFFEEBUSH = "Where to plant, where to plant...",
		LAVAPOOL = "Careful.",
		BAMBOO = "I can could probably thwack something good with this!",
		AERODYNAMICHAT = "I've skateboard helmets like this, they're pretty cool.",
		POISONHOLE = "That looks dangerous.",
		BOAT_LANTERN = "I'll need it if I wanna go night sailing.",
		DEAD_SWORDFISH = "Your nose is really sharp.",
		LIMPETS = "I'd rather not resort to eating these.",
		OBSIDIANAXE = "Cool!",
		COCONUT = 
		{
		    GENERIC = "It's much larger than a baseball.",
		    PLANTED = "It'll grow into a nice palm tree.",
		},
		COCONUT_COOKED = "It's very sweet!",
		BERMUDATRIANGLE = "What in the world?",
		SNAKE = "He's territorial.",
		SNAKEOIL = "What a bunch of baloney",
		ARMORSEASHELL = "No. Thanks.",
		SNAKE_FIRE = "Is that snake smoldering?", --idk if this is implemented
		MUSSEL_COOKED = "Roasted it real nice.",

		PACKIM_FISHBONE = "Ew.",
		PACKIM = "You're a very useful bird!",

		ARMORLIMESTONE = "Looks uncomfy!",
		TIGERSHARK = "I think I'd prefer Jaws.",
		WOODLEGS_KEY1 = "Now I just need a lock.",
		WOODLEGS_KEY2 = "Oh a ke- oh JEEZ, I totally misplaced the house key... Mom's gonna mad...",
		WOODLEGS_KEY3 = "What do you unlock?",
		WOODLEGS_CAGE = "They really don't want him getting out.",
		OBSIDIAN_WORKBENCH = "I can make all sorts of cool things here.",

		NEEDLESPEAR = "JEEEEEZ that's a big needle!",
		LIMESTONE = "It's really soft.",
		DRAGOON = "Nothing but trouble.",

		ICEMAKER = 
		{
			OUT = "Outta juice.",
			VERYLOW = "Aw, just a little longer?",
			LOW = "It doesn't have much energy left.",
			NORMAL = "Look at it go!",
			HIGH = "Wow, look at it go!",
		},

		DUG_BAMBOOTREE = "I should plant this.",
		BAMBOOTREE =
		{
			BURNING = "Someone should do something about that.",
			BURNT = "Well, the fire's out.",
			CHOPPED = "I got all the bamboo I can carry!",
			GENERIC = "Kung-fu masters use this stuff to train, I think!",
		},
		JUNGLETREE =
		{
			BURNING = "Well, that's not good.",
			BURNT = "At least the fire's out.",
			CHOPPED = "What a big stump!",
			GENERIC = "It's very pretty.",
		},
		SHARK_GILLS = "Fish need them to breathe. What if I had gills?",
		TREEGUARD = "He hates people harming the trees!",
		OBSIDIAN = "I think this comes from lava.",
		BABYOX = "Aw!",
		STUNGRAY = "If it's anything like normal skunks, I'll be staying away.",
		SHARK_FIN = "Cool.",
		FROG_POISON = "I should be careful with these frogs.",
		ARMOUREDBOAT = "Try and sink me now!",
		ARMOROBSIDIAN = "Way too heavy.",
		BIOLUMINESCENCE = "Wow, that's beautiful!",
		SPEAR_POISON = "Just stabbing things wasn't enough.",
		SPEAR_OBSIDIAN = "It's much stronger.",
		SNAKEDEN =
		{
			BURNING = "Oh boy.",
			BURNT = "Well, the fire's out.",
			CHOPPED = "I chopped it good.",
			GENERIC = "They're just waiting to trip me, I know it.",
		},
		TOUCAN = "I like your beak.",
		--MESSAGEBOTTLE = "Maybe it's a treasure map!",
		SAND = "Sandy.",
		SANDHILL = "It's asking to be kicked.",
		PEACOCK = "Aren't you pretty?",
		VINE = "It's pretty strong, actually.",
		SUPERTELESCOPE = "Land ho!",
		SEAGULL = "Ugh. Stay in Ellay!",
		SEAGULL_WATER = "Ugh. Stay in Ellay!",
		PARROT = "Parrots are cool.",
		ARMOR_LIFEJACKET = "Better safe than sorry.",
		WHALE_BUBBLES = "Is something down there?",
		EARRING = "Mom says I can't get my ears pierced if I wanna be a professional baseball player.",
		ARMOR_WINDBREAKER = "It'll help with those nasty winds!",
		SEAWEED_COOKED = "If only I had sushi.",
		CARGOBOAT = "It has lots of storage.",
		GASHAT = "My lungs will love this.",
		ELEPHANTCACTUS = "Holy catcus!",
		DUG_ELEPHANTCACTUS = "I know just the spot for you.",
		ELEPHANTCACTUS_ACTIVE = "I'll keep my distance.",
		ELEPHANTCACTUS_STUMP = "All the needles are gone.",
		FEATHERSAIL = "It's so light, but so fast!",
		WALL_LIMESTONE_ITEM = "I should place these.",
		JUNGLETREESEED =
        {
            GENERIC = "Don't let the size fool you.",
            PLANTED = "Grow grow grow!",
        },
		VOLCANO = "Wouldn't be paradise without a catch.",
		IRONWIND = "Now we're talkin.",
		SEAWEED_DRIED = "I dried it nice!",
		TELESCOPE = "It'll be useful at sea.",
		
		DOYDOY = "I thought you were extinct.",
		DOYDOYBABY = "Awwwww, what a cutie.",
		DOYDOYEGG = "It's still alive.",
		DOYDOYEGG_CRACKED = "Oops...",
		DOYDOYFEATHER = "It's so pretty, almost makes me- ACHOO!",

		PALMTREE =
		{
			BURNING = "Well that's on fire.",
			BURNT = "Fire's out...",
			CHOPPED = "It was me or you, tree.",
			GENERIC = "It's very fitting for a paradise.",
		},
		PALMLEAF = "These are cool.",
		CHIMINEA = "We could use of this in our backyard in Podunk.",
		DOUBLE_UMBRELLAHAT = "Fancy!",
		CRAB = 
		{
			GENERIC = "How is your day, crab?",
			HIDDEN = "You don't gotta hide for me.",
		},
		TRAWLNET = "I'll catch everything now!",
		TRAWLNETDROPPED = 
		{
			SOON = "Well then.",
			SOONISH = "Hey, my net!",
			GENERIC = "Let's look at the goodies I got!",
		},
		VOLCANO_EXIT = "That leads to outside.",
		SHARX = "Nice shark...! I don't taste good, probably! I promise!",
		SEASHELL = "They're fun to collect. Maybe I'll hold on to some for Ana...",
		WHALE_BUBBLES = "I think something's down there.",
		MAGMAROCK = "Whoa, it's all shiny.",
		MAGMAROCK_GOLD = "It's REALLY shiny.",
		CORAL_BRAIN_ROCK = "Whoa.",
		CORAL_BRAIN = "It's messing with my brain...",
		SHARKITTEN = "You're adorable, but your mom hates me.",
		SHARKITTENSPAWNER = 
		{
			GENERIC = "Home to kitties.",
			INACTIVE = "Nothing's there right now.",
		},
		LIVINGJUNGLETREE = "Sup, dude?",
		WALLYINTRO_DEBRIS = "Ugh... that was not a good idea.",
		MERMFISHER = "You keep your distance, I keep mine.",
        PRIMEAPE = "Good thing these ones don't know any PSI.",
        PRIMEAPEBARREL = "A home for some up to no good monkeys.",
        REDBARREL = "I should be careful around that.",
        PORTAL_SHIPWRECKED = "It's broken.",
		MARSH_PLANT_TROPICAL = "It's very tropical.",
		TELEPORTATO_SW_POTATO = "It's a fake potato.",
		PIKE_SKULL = "Oh, jeez...",
		PALMLEAF_HUT = "Ahhhh, I could get used to this.",
		FISH_RAW_SMALL_COOKED = "More a snack than a meal.",
		LOBSTER_DEAD = "I've never had lobster before...",
		MERMHOUSE_FISHER = "What a dump.",
		WILDBORE = "He's looking much less civilized.",
		PIRATEPACK = "Best be carrying me booty with me.",
		TUNACAN = "Well if tuna is all I've got...",
		MOSQUITOSACK_YELLOW = "Gross.",
		SANDBAGSMALL = "It'll help with flooding.",
		FLUP = "What an obnoxious little... whatever you are!",
		OCTOPUSKING = "It's the pirate king!",
		OCTOPUSCHEST = "Oh. Thanks!",
		GRASS_WATER = "It seems to like the water.",
		WILDBOREHOUSE = "It's a nice house. Too bad I'm not allowed in.",
		FISH_RAW_SMALL = "Tiny bite-sized fish.",
		TURF_SWAMP = "It's all... gross.",
		FLAMEGEYSER = "Ah! Careful.",
		KNIGHTBOAT = "Oh. Uh, hi. You're not mean like the others, right?",
		MANGROVETREE_BURNT = "That's unfortuanate.",
		TIDAL_PLANT = "It's a plant.",
		WALL_LIMESTONE = "Nice and strong.",
		FISH_RAW = "A nice piece of fish meat.",
		LOBSTER_DEAD_COOKED = "Looks tasty!",
		BLUBBERSUIT = "That's. GROSS.",
		BLOWDART_FLUP = "Weird.",
		TURF_MEADOW = "Quaint. Ninten likes.",
		TURF_VOLCANO = "It's very black.",
		SWEET_POTATO = "Mmmmm!",
		SWEET_POTATO_COOKED = "It's a nice side to prime ribs...",
		SWEET_POTATO_PLANTED = "I found sweet potatos!",
		SWEET_POTATO_SEEDS = "I can make more sweet potatos now.",
		BLUBBER = "Gross.",
		TELEPORTATO_SW_RING = "A ring for that thingy. You know.",
		TELEPORTATO_SW_BOX = "What's with this junk?",
		TELEPORTATO_SW_CRANK = "Some crank.",
		TELEPORTATO_SW_BASE = "It's missing something.",
		VOLCANOSTAFF = "Armageddon whenever I want!",
		THATCHPACK = "It'll store some stuff. Not much though.",
		TURF_DESERTDIRT = "Dirty turf.",
		SHARK_TEETHHAT = "I'd make an awesome prince.",
		TURF_ASH = "Ashy.",
		TURF_FUNGUS_GREEN = "It's all green and fungusy",
		BOAT_TORCH = "It'll be useful at sea.",
		MANGROVETREE = "These trees really love water.",
		HAIL_ICE = "Are these safe to suck on?",
		TROPICAL_FISH = "I like your scales.",
		TIDALPOOL = "It's thriving with little fishy guys.",
		WHALE_WHITE = "Yar, it's Moby Dick!",
		VOLCANO_SHRUB = "It's covered in ash.",
		ROCK_OBSIDIAN = "It's way too hard to mine.",
		ROCK_CHARCOAL = "Imagine how many barbeques you could have with that thing!",
		DRAGOONDEN = "A reptilian home.",
		WILBUR_UNLOCK = "Aren't you fancy?",
		WILBUR_CROWN = "It's kinda tiny.",
		TWISTER = "Oh no, that's big trouble!",
		TWISTER_SEAL = "Oh, I can't stay mad at you...",
		MAGIC_SEAL = "It's brimming with power.",
		SAIL_STICK = "I control the winds, ME!!",
		WIND_CONCH = "The winds are calling.",
		DRAGOONEGG = "That's a massive egg!",
		BUOY = "It'll help me find me way back to shore!", 
		TURF_SNAKESKINFLOOR = "Cool.",
        DOYDOYNEST = "Those bird guys live there.",
		ARMORCACTUS = "I don't trust it!",
		BIGFISHINGROD = "I'll show you how the pros do it.",
		BRAINJELLYHAT = "I could use this for school!",
		COCONUT_HALVED = "They'd make for fitting cups.",
		CRATE = "I wonder what's inside.",
		DEPLETED_BAMBOOTREE = "It'll grow back!",
		DEPLETED_BUSH_VINE = "It'll grow back eventually.",
		DEPLETED_GRASS_WATER = "Maybe it'll grow back.",
		DOYDOYEGG_COOKED = "I made scrambled eggs!",
		DRAGOONHEART = "Cooool. Also gross!",
		DRAGOONSPIT = "Hey! You watch it!",
		DUG_BUSH_VINE = "I can take it with me.",
		--FRESHFRUITCREPES = "Sugary fruit! Part of a balanced breakfast.",
		KRAKEN = "I think I need a bigger boat.",
		KRAKENCHEST = "Hah! I wasn't scared at! Please don't come back...",
		KRAKEN_TENTACLE = "Watch those tentacles!",
		MAGMAROCK_FULL = "Whoa, it's all shiny.",
		MAGMAROCK_GOLD_FULL = "It's REALLY shiny.",
		MONKEYBALL = "It's a nice distraction!",
		--MONSTERTARTARE = "There's got to be something else to eat around here.",
		MUSSELBOUILLABAISE = "Soupy.",
		MYSTERYMEAT = "It makes ME wanna hurl.",
		OXHAT = "Not for me!",
		OX_FLUTE = "I prefer this over a rain dance.",
		OX_HORN = "I'll hold on to your horn, at least.",
		PARROT_PIRATE = "Where ye be hiding the booty?",
		PEG_LEG = "Mom wouldn't like me losing a leg just because I wanted to try it.",
		PIRATEGHOST = "Yaaar...?",
		SANDBAGSMALL_ITEM = "I'll keep the waters at bay all by myself!",
		SHADOWSKITTISH_WATER = "No no no no no NOPE!",
		SHIPWRECKED_ENTRANCE = "Adventure awaits!",
		SHIPWRECKED_EXIT = "I've had enough paradise.",
		SNAKESKINSAIL = "Very intuitive, Ninten. Heh, thanks Ninten.",
		SPEAR_LAUNCHER = "Awesome!!",
		SWEETPOTATOSOUFFLE = "Grandma made something like this once.",
		SWIMMINGHORROR = "NopeNopeNopeNopeNopeNopeNopeNopeNope!",
		TIGEREYE = "Sorry!",
		--TRINKET_20 = "I'm not sure what it is, but it makes me feel smarter!",
		--TRINKET_21 = "I ought to measure it to ensure it's to scale.",
		--TRINKET_22 = "I'm sure someone would like this.",
		TURF_FUNGUS_RED = "Half red, half fungus.",
		TURF_MAGMAFIELD = "Do I trust this flooring?",
		TURF_TIDALMARSH = "It's all soggy...",
		VOLCANO_ALTAR_TOWER = "Oh, man what am I getting myself into...",
		WATERYGRAVE = "I feel bad.",
		WHALE_TRACK = "I'm on your trail!",
		WILDBOREHEAD = "Oh God!",
		WOODLEGSBOAT = "Yarr, a proper ship for a pirate!",
		WOODLEGSHAT = "A proper hat for the young pirate, Ninten!",
		WOODLEGSSAIL = "Now everyone knows I'm a real pirate!",
		WRECK = "Someone wasn't careful.",
		INVENTORYGRAVE = "Who does this belong to?",
        INVENTORYMOUND = "Who does this belong to?",
		LIMPETS_COOKED = "I'd still rather not.",
		RAWLING = "I guess I have been pretty lonely...",
		--CALIFORNIAROLL = "But I don't have chopsticks.",



	--- 5C DLC ------------------------------------------------------------------------------------------------

        ENCRUSTEDBOAT = "I don't know how I did it, but it floats.",
        BABYOX = "Hey little guy.",
        BALLPHINHOUSE = "What a nice home!",
        DORSALFIN = "Sorry.",
        NUBBIN = "I wonder if I could make my own reef.",
        CORALLARVE = "They're so tiny.",
        RAINBOWJELLYFISH = "Pretty!",
        RAINBOWJELLYFISH_PLANTED = "Huh?",
        RAINBOWJELLYFISH_DEAD = "I'm sorry.",
        RAINBOWJELLYFISH_COOKED = "I don't think I wanna try it.",
        RAINBOWJELLYJERKY = "Well, it's never right to waste food...",
        WALL_ENFORCEDLIMESTONE = "It's extra strong.",
        WALL_ENFORCEDLIMESTONE_ITEM = "It's extra strong.",
        CROCODOG = "I'd prefer normal hounds over these!",
        POISONCROCODOG = "He looks extra dangerous!",
        WATERCROCODOG = "Stay back!",
        QUACKENBEAK = "Nobody messes with Ninten.",
        QUACKERINGRAM = "I'll mess you up good if you mess with me!",
    
    --- DLC ------------------------------------------------------------------------------------------------    

        CAVIAR = "Mmmm, I'm never one to say no to seafood, but...",
        CORMORANT = "Sup, bird?",

        --FISH3 = "Surf and turf, hold the turf.",
        FISH4 = "I love the colors.", --Pierrot Fish
        FISH5 = "So bright and vibrant!", --Neon Quattro

        FISH3_COOKED = "I cooked it good.",
        FISH4_COOKED = "Niced and grilled.",
        FISH5_COOKED = "I think it's good to eat.",

        FISH_FARM = 
        {
        	EMPTY = "I need fish eggs first.",
			STOCKED = "Give it some time.",
			ONEFISH = "Look, look: fish!",
			TWOFISH = "There's so much fish now!",
			REDFISH = "Holy moly, look at all the fish!",
			BLUEFISH  = "Awesome, now to harvest!",
        },

        ROE = "Fish eggs.",
        ROE_COOKED = "I think it's edible.",
        
        SEA_YARD =
       	{
            ON = "It'll keep my boat in great condition.",
            OFF = "It's off now.",
            LOWFUEL = "It's running out of fuel.",
        },

        SEA_CHIMINEA = 
        {
            EMBERS = "Fire's about done.",
			GENERIC = "It's very warm.",
			HIGH = "I can feel the heat from so far away!",
			LOW = "It's a little low.",
			NORMAL = "So cozy.",
			OUT = "Fire's out.",
        }, 

        TAR = "Ugh, it's all... sticky!",
        TAR_EXTRACTOR =
        {
            ON = "Look at it go!",
            OFF = "It needs fuel.",
            LOWFUEL = "Not much juice left.",
        },
        TAR_POOL = "I wonder if I could get that tar.",

        TARLAMP = "A proper lamp!",
        TARSUIT = "It's tough to move in, that's for sure.",
        TAR_TRAP = "Heh heh. A nasty suprise.",

        TROPICALBOUILLABAISSE = "Fancy soup.",

        RESEARCHLAB5 = "I've never really done anything like this before.",
        WATERCHEST = "It'll keep my things nice and dry.",

		--PORKLAND SPEECH STARTS HERE

		PIG_PALACE = "I'd make a cool prince.",
		PIGMAN_QUEEN = "She's no Queen Mary.",
        PIG_SCEPTER = "It's very royal.",
        PIGCROWNHAT = "Prince Ninten, at your service.",
		PIGMAN_BEAUTICIAN = 
		{
			GENERIC = "Getting hair styled as nice as mine takes talent!",
			SLEEPING = "I'll bother them later.",
		},
		PIGMAN_ROYALGUARD = 
		{
			GENERIC = "Ye olde copper.",
			SLEEPING = "Sleeping on the job.",
		},
		PIGMAN_COLLECTOR = 
		{
			GENERIC = "Got anything cool?",
			SLEEPING = "I'll bother them later.",
		},
		PIGMAN_MAYOR = 
		{
			GENERIC = "Saving zoos and lost children is at the top of my resume, between you and me, heh.",
			SLEEPING = "Telling other people to do your job gets tiring.",
		},
		PIGMAN_BANKER = 
		{
			GENERIC = "He is very rich.",
			SLEEPING = "Hope your money is secured dude.",
		},
		PIGMAN_MINER = 
		{
			GENERIC = "Looking for truffles?",
			SLEEPING = "They look tired.",
		},
		PIGMAN_MECHANIC = 
		{
			GENERIC = "Hello!",
			SLEEPING = "I'll bother them another time.",
		},
		PIGMAN_FARMER = 
		{
			GENERIC = "Looking forward to good harvests!",
			SLEEPING = "Must be hard work.",
		},
		PIGMAN_FLORIST = 
		{
			GENERIC = "Hey, hey, flower-gal!",
			SLEEPING = "Ah, good night...",
		},
		PIGMAN_STOREOWNER = 
		{
			GENERIC = "Sup?",
			SLEEPING = "I'll leave them alone.",
		},
		PIGMAN_ERUDITE = 
		{
			GENERIC = "I'm not quite in my goth phase yet.",
			SLEEPING = "Don't let the bed bugs bite.",
		},
		PIGMAN_HATMAKER = 
		{
			GENERIC = "Note quite as cool as my baseball cap.",
			SLEEPING = "Someone should get you a sleeping cap.",
		},
		PIGMAN_PROFESSOR = 
		{
			GENERIC = "Ugh. I thought I escaped school...",
			SLEEPING = "I'll leave them alone.",
		},
		PIGMAN_HUNTER =
		{
			GENERIC = "Happy hunting!",
			SLEEPING = "Night night.",
		},
		RECONSTRUCTION_PROJECT = 
		{
			SCAFFOLD = "We're building something tubular, just you wait!",
			RUBBLE = "What a dump.",
		},
		PIG_SHOP_FLORIST = 
		{
			GENERIC = "Perfect for Mother's Day.",
			BURNING = "This place needs a fire department!",
		},
        PIG_SHOP_GENERAL = 
        {
        	GENERIC = "It's kinda like convenience strores of the time.",
        	BURNING = "This place needs a fire department!",
		},
        PIG_SHOP_HOOFSPA = 
        {
        	GENERIC = "I've never been to a spa before.",
        	BURNING = "Well that's not good.",
		},
        PIG_SHOP_PRODUCE = 
        {
        	GENERIC = "It's like a department store.",
        	BURNING = "Oh boy.",
		},
        PIG_SHOP_ARCANE = 
        {
        	GENERIC = "My PSI is bit like the occult, I think.",
        	BURNING = "Looks like someone put out a hex.",
        },
        PIG_SHOP_WEAPONS = 
        {
        	GENERIC = "A baseball bat is all I need.",
        	BURNING = "We could really use a fire department.",
        },
        PIG_SHOP_HATSHOP = 
        {
        	GENERIC = "Let's see if there's anything fashionable.",
        	BURNING = "Well that's not good.",
        },
        PIG_SHOP_ACADEMY = 
        {
        	GENERIC = "Ugh. Learning...",
        	BURNING = "Oh nooooo, it's on fire...",
        },
        TREE_PILLAR = "It's like that one story with the beans!",
        PIGHOUSE_CITY = 
        {
        	GENERIC = "Very homely.",
        	BURNING = "Oh no!",
		},
        PIGHOUSE_FARM = 
        {
        	GENERIC = "I've never been the farmer type, despite my rural upbringing.",
        	BURNING = "That's not good!",
		},
		PIGHOUSE_MINE = 
        {
        	GENERIC = "Hopefully we dig up some gold!",
        	BURNING = "We really oughta invest in a fire department...",
		},
        PIG_GUARD_TOWER = 
        {
        	GENERIC = "Think of it like a police station.",   
        	BURNING = "We're under siege!",
		},     
        CITY_LAMP = 
        {
        	GENERIC = "Gets the job done.",
        	ON = "Gets the job done.", --off
    	},
        DUNGBEETLE = 
        {
        	GENERIC = "Oh, I've heard of these guys before.",
        	UNDUNGED = "It's missing something...",
        	SLEEPING = "It's asleep.",
        	DEAD = "Circle of life my dude.",
        },
        DUNGBALL = "Gross.",
        DUNGPILE = 
		{
			GENERIC = "Yuck.",
			PICKED = "Okay, why'd I do that?",
		},
        PIGEON = 
        {
        	GENERIC = "Ah, a city bird.",
        	SLEEPING = "It's sleeping.",
        	DEAD = "It's sleeping forever.",
        },
        SPIDER_MONKEY = 
        {
        	GENERIC = "NOPE.",
        	SLEEPING = "Eh heh heh, get me out of heeeere duuuuuude!!",
        	DEAD = "Please be dead...",
        },

        SPIDER_MONKEY_TREE = "It's those thing's now, and they can keep it!",
        SPIDER_MONKEY_NEST = "I'll keep my distance, thanks.",
        TOPIARY = "Fancy.",
        LAWNORNAMENT = 
        {
        	GENERIC = "It makes your lawn feel special.",
        	BURNING = "Well that seems a little much.",
        	BURNT = "I guess charred is in.",
        },
        HEDGE = 
        {
        	GENERIC = "Nature's wall.",
        	SHAVEABLE = "We both could use a haircut.",
        	BURNING = "Oh that's on fire.",
        	BURNT = "So it's a no on hedges? Noted.",
        },
        RAINFORESTTREE = 
        {
        	GENERIC = "It's so vibrant!",
        	CHOPPED = "I chopped it.",
        	BURNING = "Someone should do something about that.",
        	BURNT = "Fire's out.",
        },
        RAINFORESTTREE_ROT = "Must be the poison.",
        
        FLOWER_RAINFOREST = "Ah... my allergies... don't like thaa-choo!",
        HALBERD = "Seems dangerous.",
        CHICKEN = 
        {
        	GENERIC = "Baak baak baaaak!",
        	SLEEPING = "Sleep tight.",
        	DEAD = "Well. Anyone for dinner?",
        },
        RUIN_GIANT_HEAD = "Someone let their ego get to them.",
        RUINS_ARTICHOKE = "...Why?",
        PIG_RUINS_ENTRANCE = 
        {
        	GENERIC = "Only one way to find out what waits.",
        	LOCKED = "I wonder what's inside",
        },
        PIG_RUINS_EXIT = "Freedom!",
        PIG_COIN = "Money.",
        GRASS_TALL = 
        {
        	GENERIC = "My hands are too stubby to pick this.",
        	PICKED = "There we go.",
        	BURNING = "Well.",
        },
        GLOWFLY = 
        {
        	GENERIC = "Whoa.",
        	SLEEPING = "Even bugs need sleep.",
        	DEAD = "Aw.",
        },
        GLOWFLY_COCOON = "It's turning into something horrible.",
        CHITIN = "It's bug skin.",
        HANGING_VINE = "I wanna swing on it!",
        GRABBING_VINE = "I wanna swing on it!",
        VENUS_STALK = "What can I do with this?",
        WALKINGSTICK = "It makes for a very nice cane. My gramps would love it.",
        ADULT_FLYTRAP = 
        {
        	GENERIC = "What big teeth you have!",
        	SLEEPING = "Better asleep.",
        	DEAD = "Much better dead.",
        },
        MEAN_FLYTRAP = 
        {
        	GENERIC = "Stay away, stay away, I don't wanna be your next meal!",
        	SLEEPING = "Let's not disturb it.",
        	DEAD = "Thank God...",
        },
        SNAPDRAGON = 
        {
        	GENERIC = "It looks like it hates human boys!",
        	SLEEPING = "I should be careful not to disturb.",
        	DEAD = "It's better that way.",
        },
        LILYPAD = "Pretty neat.",

        ZEB = 
        {
        	GENERIC = "Oh, hello!",
        	SLEEPING = "Sleep well.",
        	DEAD = "Oh, I'm sorry.",
        },
        SCORPION = 
        {
        	GENERIC = "Hey man, what the stinger!",
        	SLEEPING = "As long as it's not trying to kill me, we're cool.",
        	DEAD = "I think I got it.",
        },

        PEAGAWK = 
        {
        	GENERIC = "Um, hi! It's looking at me. A lot.", 
        	SLEEPING = "So long as it's not staring, we're cool.",
        	DEAD = "Dead.",
        },
        PEEKHEN = 
        {
        	GENERIC = "Um, hi! It's looking at me. A lot.", 
        	SLEEPING = "So long as it's not staring, we're cool.",
        	DEAD = "Dead.",
        }, 
        PEAGAWKFEATHERHAT = "Now I have extra eyesight!",
        PEAGAWK_BUSH = "Weird...",
        PEAGAWKFEATHER = "What're you looking at?",
        PEAGAWKFEATHER_PRISM = "What're you looking at?",
        ANTMAN = 
        {
        	GENERIC = "Man, what do they feed this things out here!",
        	SLEEPING = "Good night.",
        	DEAD = "Sorry, no pests.",
        },
        ANTHILL = "A giant ant's home.",
        ANTMASKHAT = "I am NOT putting that on my face.",
        ANTSUIT = "Nah, I don't desperately need to be a bug.",
        ANTMAN_WARRIOR = "This one is extra mean.",
 		ANTCHEST = "It's feeling to the brim with delicous honey!",
 		NECTAR_POD = "I wonder if I could make honey out of this.",
        
        PHEROMONESTONE = "I can understand those ant guys with this.",
        PIKO = 
        {
        	GENERIC = "Hey little squirrel guy.",
        	SLEEPING = "Sleep tight.",
        	DEAD = "Oh...",
        },
        
        RELIC_1 = {
        	GENERIC = "It's some sort of old relic.",
        	SUNKEN = "Old junk.",
        },
        RELIC_2 = {
        	GENERIC = "I'm like an archaeologist!",
        	SUNKEN = "There's something there.",
        },
        RELIC_3 = {
         	GENERIC = "It belongs in a museum.",
         	SUNKEN = "What's down there?",
        },
        RELIC_4 = {
        	GENERIC = "Looks old, but fancy.",
        	SUNKEN = "What's this?",
        },
        RELIC_5 = {
         	GENERIC = "Old  treasure, I think.",
         	SUNKEN = "I got something!",
        },

        REEDS_WATER = "Reeds.",
        LOTUS = "It's in bloom!", 

		LOTUS_FLOWER ="Pretty.",
        LOTUS_FLOWER_COOKED ="I wonder how it tastes.",

        VAMPIREBAT = 
        {
        	GENERIC = "First zombies, now vampires?!",
        	SLEEPING = "Please stay alseep.",
        	DEAD = "Phew.",
        },
        VAMPIREBATCAVE = "I'd like to stay human, thanks.",  

        FROGLEGS_POISON = "Cool, they're twitching still.",
        FROGLEGS_POISON_COOKED = "I probably shouldn't eat this.",
		FROG_POISON =
		{
        	GENERIC = "Hmmm, bright colors are usually bad, right?",
        	SLEEPING = "Sleeping.",
        	DEAD = "It's dead.",
        },

        PIG_RUINS_TORCH_WALL = "Very ancient looking.",
        PIG_RUINS_TORCH = "Very ancient looking.",
        PIG_RUINS_HEAD = "I could climb it no problem!",
        PIG_RUINS_ARTICHOKE = "...Intersting.",

        OINC = "Money.",
        OINC10 = "I could probably buy something nice!",
        OINC100 = "I'm a bit of an entrepreneur.",

        RABID_BEETLE = 
		{
        	GENERIC = "I should probably stay away.",
        	SLEEPING = "Let's not test it.",
        	DEAD = "A good bug is a dead bug.",
        },

        PARROT_BLUE = 
		{
        	GENERIC = "Hello blue bird.",
        	SLEEPING = "Get some rest.",
        	DEAD = "Poor thing.",
        },
        KINGFISHER = 
		{
        	GENERIC = "That could poke an eye out!",
        	SLEEPING = "It's asleep.",
        	DEAD = "Poor thing.",
        },

        BURR = "It's a jungle tree seed.",   
        BURR_SAPLING = "Grow, you can do it!",
        {
			BURNING = "Oops!",
			WITHERED = "It doesn't look right.",
			GENERIC = "Grow!",
			PICKED = "A boy has needs, sorry.",
		},        	

        PIG_LATIN_1 = "It says \"Ightlay iresfay\"", -- light fires in pig latin

		DECO_RUINS_BEAM_ROOM ="Looks like foundation.",
		DECO_CAVE_BEAM_ROOM = "Looks like foundation.",
        DECO_CAVE_BAT_BURROW = "I'd prefer the bats of South Cemetary over this.",
        DECO_RUINS_BEAM_ROOM_BLUE = "Looks like foundation.",        		

        SMASHINGPOT = "I'll break it good!",

        HIPPOPOTAMOOSE ="Nice antlers you got.",
		PIGGHOST = "Ah! Sorry about all the times I've had bacon!",        

        ANTCOMBHOME = "Bugs live here.",        
        SECURITYCONTRACT = "I can use it to hire some guards!",
        
        PLAYERHOUSE_CITY = {
        	BURNT = "Well looks like I'm homeless.",
        	FORSALE = "Looks like it's for sale.",
        	SOLD = "Homeowner at 12. Not bad, Ninten."
        },

        JELLYBUG = "Time to never eat jellybeans again.",
        JELLYBUG_COOKED = "I really don't want to.",
        SLUGBUG = "Ewwww...",
        SLUGBUG_COOKED = "Is living worth it if it comes to this?",

        PLAYER_HOUSE_COTTAGE_CRAFT = "I could make a cozy little cottage with this.",
        PLAYER_HOUSE_VILLA_CRAFT = "Supplies for a villa.",           
		PLAYER_HOUSE_TUDOR_CRAFT = "I could build a decent home now.",
        PLAYER_HOUSE_GOTHIC_CRAFT = "It's very European.",           
		PLAYER_HOUSE_TURRET_CRAFT = "Supplies for a home.",
        PLAYER_HOUSE_BRICK_CRAFT = "Supplies for a brick home.",
		PLAYER_HOUSE_MANOR_CRAFT = "Now we're talking.",        

        CLIPPINGS = "Remains of shaved hedge. Someone should take care of that.",

        CUTNETTLE = "It keeps my sinuses clear.",

        NETTLE =
        {
        	WITHERED = "It's not going great.",
        	MOIST = "Nice and nurished.",
        	EMPTY = "It'll grow back.",
        	DEFAULT = "It helps with allergies.",
        },

        DECO_RUINS_FOUNTAIN = "Make a wish!", -- this is a "wishing well". You throw coins in it and it might randomly heal you. 
        PUGALISK = "Oh. That's not good.",        
        SNAKE_BONE = "Snake remains.", 
        SNAKEBONESOUP = "Ooh, fancy.", 

        BANDITMAP = "Stupid bandit. Now I know where your goodies are!", 
        BANDITTREASURE = "YES! It's mine, all mine!", 

        BLUNDERBUSS = "It packs a punch!", 

        PUGALISK_FOUNTAIN = "Fancy.", 
        PUGALISK_RUINS_PILLAR = "What waits inside?", 
        PUGALISK_TRAP_DOOR = "I don't trust that.",  

        TEA = "I've never really had tea before!",      
        TEATREE = "It grows tea!",    
        TEATREE_SAPLING = "Grow!!",    
        TEATREE_NUT = "I can make more tea trees now.",    

        WALL_PIG_RUINS = "It's an old wall.", 

        PIG_RUINS_DART_TRAP = "That's not cool, dude.", 
        PIG_RUINS_SPEAR_TRAP = "Yeah that's not suspicious.", 
        PIG_RUINS_SPEAR_TRAP_TRIGGERED = "I knew it!", 
        PIG_RUINS_SPEAR_TRAP_BROKEN = "No more traps here!", 
        PIG_RUINS_PRESSURE_PLATE = "Wouldn't be fullfilling my Indiana Jones fantasy without booby traps...",
        PIG_RUINS_DART_STATUE = "You're not fooling me.",                                           
        
        DISARMING_KIT = "I can take apart those stupid booby traps now!", 

        BALLPEIN_HAMMER = "For hammering.",

        GOLD_DUST = "My asthma doesn't like it.",

        ALOE = "It's more useful than it looks.", 
        ALOE_COOKED = "I'll be honest: I have no idea what do with it.", 
        ALOE_PLANTED = "I've heard of these.",

        --ASPARAGUS = "A vegetable.", 
        --ASPARAGUS_COOKED = "Science says it's good for me.", 
        --ASPARAGUS_PLANTED = "I should pick those!", 

        RADISH = "A radish.", 
        RADISH_COOKED = "Still bitter.",
        RADISH_PLANTED = "It's a radish.", 

        SNAKE_AMPHIBIOUS = "Don't even think about biting me!", 
        
        GASMASKHAT = "This'll come in handy!",
        PITHHAT = "Now I can be an explorer!", 
        
        BILL = 
        {
        	GENERIC = "It's adorable. Just watch those spines, buddy.",
        	SLEEPING = "Sleep well.",
        	DEAD = "It's dead.",
        },
        
        ROCK_ANTCAVE = "It's some sort of rock.",
        ANT_CAVE_LANTERN = "Useful for planting lights.",
        PROP_DOOR = "Doors, doors.",

        PIKO_ORANGE = "A cute little squirrel.",

        TURF_PIGRUINS = "Old rock.",
        TURF_RAINFOREST = "It comes from the rainforest.",
        TURF_DEEPRAINFOREST = "It comes from the rainforest.",
        TURF_LAWN = "Get off my lawn!",
        TURF_GASJUNGLE = "It comes from the rainforest.",
        TURF_MOSS = "It's mossy.",
        TURF_FIELDS = "It's a chunk of ground.",
        TURF_FOUNDATION = "Nice foundation.",
        TURF_COBBLEROAD = "Makes for good roads.",

        MANDRAKEMAN = "Gah, shut up!",
        MANDRAKEHOUSE = "Great, they're civilizing.",

         -- HOME DECO ITEMS
        INTERIOR_FLOOR_MARBLE = "Fancy fancy.",
        INTERIOR_FLOOR_CHECK = "I'm not normally into this sort of deco.",
        INTERIOR_FLOOR_PLAID_TILE = "Fancy fancy.",
        INTERIOR_FLOOR_SHEET_METAL = "Not the most comfortable.",
        INTERIOR_FLOOR_WOOD = "You can never go wrong with hardwood.",
        INTERIOR_FLOOR_GARDENSTONE = "It's not exactly home-y.",        
        INTERIOR_FLOOR_GEOMETRICTILES = "It has personality.",
        INTERIOR_FLOOR_SHAG_CARPET = "Just like home.",
        INTERIOR_FLOOR_TRANSITIONAL = "Needs finish.",
        INTERIOR_FLOOR_WOODPANELS = "You can never go wrong with hardwood.",
        INTERIOR_FLOOR_HERRINGBONE = "It's cold.",
        INTERIOR_FLOOR_HEXAGON = "It has personality.",
        INTERIOR_FLOOR_HOOF_CURVY = "Fancy fancy.",
        INTERIOR_FLOOR_OCTAGON = "It has personality.",

        INTERIOR_WALL_WOOD = "It's basic, but basic is good.",
        INTERIOR_WALL_CHECKERED = "Looks like a fast food joint.",
        INTERIOR_WALL_FLORAL = "It's not my taste.",
        INTERIOR_WALL_SUNFLOWER = "It's not my taste.",
        INTERIOR_WALL_HARLEQUIN = "It's not my taste.",
        INTERIOR_WALL_PEAGAWK = "It's not my taste.",
        INTERIOR_WALL_PLAIN_DS = "You can never go wrong with simple.",
        INTERIOR_WALL_PLAIN_ROG = "You can never go wrong with simple.",
        INTERIOR_WALL_ROPE = "Intersting.",
        INTERIOR_WALL_CIRCLES = "Fancy fancy.",
        INTERIOR_WALL_MARBLE = "'Fancy fancy.",
        INTERIOR_WALL_MAYORSOFFICE = "It's has that bureaucratic feel to it.",
        INTERIOR_WALL_FULLWALL_MOULDING = "It'll do.",
        INTERIOR_WALL_UPHOLSTERED = "It's a wall.",   

        DECO_CHAIR_CLASSIC = "Just a chair.",
        DECO_CHAIR_CORNER = "Just a chair.",
        DECO_CHAIR_BENCH = "It's a bench.",
        DECO_CHAIR_HORNED = "It has personality.",
        DECO_CHAIR_FOOTREST = "Ah, kick back... and relax.",
        DECO_CHAIR_LOUNGE = "Looks comfy.",
        DECO_CHAIR_MASSAGER = "I've seen this in malls before.",
        DECO_CHAIR_STUFFED = "I could totally chillax to some tunes in this.",
        DECO_CHAIR_ROCKING = "Gramps has one of these!",
        DECO_CHAIR_OTTOMAN = "Pretty nice.",

        DECO_LAMP_FRINGE = "Fancy fancy.",
        DECO_LAMP_STAINGLASS = "Ooooh, I like this.",
        DECO_LAMP_DOWNBRIDGE = "Fancy fancy.",
        DECO_LAMP_2EMBROIDERED = "Fancy fancy.",
        DECO_LAMP_CERAMIC = "Made from hardend clay.",
        DECO_LAMP_GLASS = "Oooh, classy glassy.",
        DECO_LAMP_2FRINGES = "Very fancy.",
        DECO_LAMP_CANDELABRA = "Fancy fancy.",
        DECO_LAMP_ELIZABETHAN = "It has personality.",
        DECO_LAMP_GOTHIC = "It has personality.",
        DECO_LAMP_ORB = "Fancy fancy.",
        DECO_LAMP_BELLSHADE = "A nice little lamp.",
        DECO_LAMP_CRYSTALS = "Cool.",
        DECO_LAMP_UPTURN = "Fancy fancy.",
        DECO_LAMP_2UPTURNS = "Nice and fancy.",
        DECO_LAMP_SPOOL = "A little plain.",
        DECO_LAMP_EDISON = "Primitive.",
        DECO_LAMP_ADJUSTABLE = "It has utility.",
        DECO_LAMP_RIGHTANGLES = "Fancy fancy.",
        DECO_LAMP_HOOFSPA = "Fancy fancy.",

        DECO_CHAISE = "It's nice.",

        DECO_PLANTHOLDER_BASIC = "Plants spice up the room.",
        DECO_PLANTHOLDER_WIP = "Not quite ready.",
        DECO_PLANTHOLDER_FANCY = "Fancy fancy.",
        DECO_PLANTHOLDER_BONSAI = "Ah, reminds me of my trap of Japan.",
        DECO_PLANTHOLDER_DISHGARDEN = "Plants always spice up the room.",
        DECO_PLANTHOLDER_PHILODENDRON = "Fancy fancy.",
        DECO_PLANTHOLDER_ORCHID = "It colors up the room.",
        DECO_PLANTHOLDER_DRACEANA = "Fancy fancy.",
        DECO_PLANTHOLDER_XEROGRAPHICA = "Fancy fancy.",
        DECO_PLANTHOLDER_BIRDCAGE = "It has personality.",
        DECO_PLANTHOLDER_PALM = "Tropical!",
        DECO_PLANTHOLDER_ZZ = "A holder for a fancy plant.",
        DECO_PLANTHOLDER_FERNSTAND = "You can never go wrong with ferns.",
        DECO_PLANTHOLDER_FERN = "You can never go wrong with ferns.",
        DECO_PLANTHOLDER_TERRARIUM = "Exotic.",
        DECO_PLANTHOLDER_PLANTPET = "Better than pet rocks.",
        DECO_PLANTHOLDER_TRAPS = "Cool!",
        DECO_PLANTHOLDER_PITCHERS = "Fancy fancy.",
        DECO_PLANTHOLDER_MARBLE = "Fancy fancy.",

        DECO_PLANTHOLDER_WINTERFEASTTREEOFSADNESS = "That's depressing.",  
        DECO_PLANTHOLDER_WINTERFEASTTREE = "I miss Christmas...",

        DECO_TABLE_ROUND = "A table.",
        DECO_TABLE_BANKER = "It's a good studying desk.",
        DECO_TABLE_DIY = "Simple enough.",
        DECO_TABLE_RAW = "Well, it's a table.",
        DECO_TABLE_CRATE = "It works I guess.",
        DECO_TABLE_CHESS = "I've never been good at chess.",

        DECO_ANTIQUITIES_WALLFISH = "Seems like something dad would like.",        
        DECO_ANTIQUITIES_BEEFALO = "Creepy.",
        DECO_WALLORNAMENT_PHOTO = "Too bad I don't have photos out here.",
        DECO_WALLORNAMENT_FULLLENGTH_MIRROR = "Lookin' handsome.",
        DECO_WALLORNAMENT_EMBROIDERY_HOOP = "Cozy.",
        DECO_WALLORNAMENT_MOSAIC = "It makes me almost forget about all of this.",
        DECO_WALLORNAMENT_WREATH = "It looks good.",
        DECO_WALLORNAMENT_AXE = "I've never been the lumberjack type, but doesn't hurt to give that impression.",
        DECO_WALLORNAMENT_HUNT = "Well, it adds personality.",
        DECO_WALLORNAMENT_PERIODIC_TABLE = "Ugh. No thanks...",
        DECO_WALLORNAMENT_GEARS_ART = "Mmph.",
        DECO_WALLORNAMENT_CAPE = "Cool.",
        DECO_WALLORNAMENT_NO_SMOKING = "Now that wouldn't be good for my asthma.",
        DECO_WALLORNAMENT_BLACK_CAT = "I'm more of a dog person?",

        WINDOW_ROUND_CURTAINS_NAILS = "Looks nice.",
        WINDOW_ROUND_BURLAP = "It lets me see the outside world.",
        WINDOW_SMALL_PEAKED = "It's not the best view.",
        WINDOW_LARGE_SQUARE = "It doesn't offer the best view, but it'll do.",
        WINDOW_TALL = "It offers a great view!",
        WINDOW_LARGE_SQUARE_CURTAIN = "Privacy when I want it, good views when I don't.",
        WINDOW_TALL_CURTAIN = "It offers a great view!",
        WINDOW_SMALL_PEAKED_CURTAIN = "Nice and cozy.",
        WINDOW_GREENHOUSE = "I could get used to this.",
        WINDOW_ROUND = "I can't say no to a good view.",

        DECO_WOOD_CORNERBEAM = "It keeps the house stable.",
        DECO_MARBLE_CORNERBEAM = "Fancy fancy.",
        DECO_WOOD       = "It keeps the house stable.",
        DECO_MILLINERY  = "It keeps the house stable.",
        DECO_ROUND      = "It keeps the house stable.",
        DECO_MARBLE     = "Fancy fancy.",

        SWINGING_LIGHT_BASIC_BULB = "A light bulb.",
        SWINGING_LIGHT_FLORAL_BLOOMER = "Fancy fancy.",
        SWINGING_LIGHT_CHANDALIER_CANDLES = "Fancy fancy.",
        SWINGING_LIGHT_ROPE_1 = "It gives me light.",
        SWINGING_LIGHT_ROPE_2 = "It gives me light.",
        SWINGING_LIGHT_FLORAL_BULB = "Looks cool.",
        SWINGING_LIGHT_PENDANT_CHERRIES = "Fancy fancy.",
        SWINGING_LIGHT_FLORAL_SCALLOP = "Cool.",
        SWINGING_LIGHT_FLORAL_BLOOMER = "Cool.",
        SWINGING_LIGHT_BASIC_METAL = "Looks good.",
        SWINGING_LIGHT_TOPHAT = "Huh.",
        SWINGING_LIGHT_DERBY = "Huh.",
        SWINGING_LIGHT1 = "Good enough.",

        RUG_ROUND = "It gives a more home-y feel.",
        RUG_SQUARE = "It helps bring the room together.",
        RUG_OVAL = "Nothing special.",
        RUG_RECTANGLE = "Just your normal rug.",
        RUG_FUR = "It's so soft.",
        RUG_HEDGEHOG = "That feels nice!",
        RUG_PORCUPUSS = "It has a nice feel to it.",
        RUG_HOOFPRINT = "Stylish.",
        RUG_OCTAGON = "Just your normal rug.",
        RUG_SWIRL = "It really brings the room together.",
        RUG_CATCOON = "It's so soft.",
        RUG_RUBBERMAT = "I'm not a fan.",
        RUG_WEB = "Silky.",
        RUG_METAL = "Well that's not very comfy.",
        RUG_WORMHOLE = "Why'd I do this?",
        RUG_BRAID = "It's got a stylish texture.",
        RUG_BEARD = "Gross!",
        RUG_NAILBED = "Well... it's unique.",
        RUG_CRIME = "I dunno what I was thinking.",
        RUG_TILES = "Fancy fancy.",

        SHELVES_WOOD = "It's a shelf.",
        SHELVES_CINDERBLOCKS = "I never claimed to be good at this stuff.",
        SHELVES_MARBLE = "Real fancy, for a shelf.",
        SHELVES_MIDCENTURY = "A shelf.",
        SHELVES_GLASS = "Careful, it's fragile.",
        SHELVES_LADDER = "Well I mean. That works.",
        SHELVES_HUTCH = "A shelf.",
        SHELVES_INDUSTRIAL = "Totally clashes with my style, but a shelf is a shelf.",
        SHELVES_ADJUSTABLE = "Now ol' five foot Ninten can reach!",
        SHELVES_WALLMOUNT = "Goes on the wall, holds my stuff. Simple.",
        SHELVES_AFRAME = "It's a shelf.",
        SHELVES_CRATES = "Well, I tried.",
        SHELVES_FRIDGE = "That's not right.",
        SHELVES_HOOKS = "Someone to keep my baseball cap safe.",
        SHELVES_PIPE = "Well. It does hang stuff.",
        SHELVES_HATTREE = "If only I had my baseball cap collection.",
        SHELVES_PALLET = "Looks tacky.",
        SHELVES_BASIC = "It holds things.",
        SHELVES_FLOATING = "A place to put stuff.",
        SHELVES_METAL = "It's a shelf.",

        WOOD_DOOR = "A door.",
		STONE_DOOR = "Heavy.",
		ORGANIC_DOOR = "Hmmmm.",
		IRON_DOOR = "Very clinical.",
		PILLAR_DOOR = "Weird.",
		CURTAIN_DOOR = "It's a bit of a statement.",
		ROUND_DOOR = "Weird.",
		PLATE_DOOR = "A door.",

        ROCK_FLIPPABLE = "I used to love flipping rocks when I was little.",

        PLAYER_HOUSE_COTTAGE = "I could make a cozy little cottage with this.",
        PLAYER_HOUSE_VILLA = "Supplies for a villa.",  
        PLAYER_HOUSE_TUDOR = "I could build a decent home now.",
        PLAYER_HOUSE_MANOR = "Now we're talking.",              
        PLAYER_HOUSE_GOTHIC = "It's very European",                
        PLAYER_HOUSE_BRICK = "Supplies for a brick home.",  
        PLAYER_HOUSE_TURRET = "Supplies for a home.",
        
        BRAMBLESPIKE = "Those thorns look painful.",

		SUNKEN_RELIC = "It's belongs to the fish now, I guess.",  

        IRON = "Raw iron? What do I do with this?",
        
        CLAWPALMTREE = "It looks like hands.",  
        DUG_NETTLE = "I should plant it.", 

        THUNDERBIRD = "Don't worry, I'll be keeping my distance.", 
        THUNDERBIRDNEST = "Those bird, electric... thingies live here.",

        FEATHER_THUNDER = "The static messes with my hair.", 
        THUNDERHAT = "Pretty cool!",

        WEEVOLE = "Hey, watch it!",
        WEEVOLE_CARAPACE = "Whoa.",
        ARMOR_WEEVOLE = "No thanks.",
        
        TUBERTREE = "What kind of tree is this?",
        CORK = "If only I had a bottle.",

        CANDLEHAT = "Not bad. Just hopefully it doesn't get my hair all ashy.", 
        CORK_BAT = "Batter up!",

        LEATHER = "You can use leather for all sorts of stuff.",
        BAT_HIDE = "I don't know what I'm doing with it.",

        ANCIENT_ROBOT_RIBS = "Whoa.",
        ANCIENT_ROBOT_CLAW = "Who built you?",
        ANCIENT_ROBOT_LEG = "This isn't my first rodeo with robots!",    
        ANCIENT_ROBOT_HEAD = "Reminds me of EVE.", 

        TEATREE_NUT_COOKED = "A nice little snack",

        DEED = "Officially a landowner! I'm pretty talented, I know, heh heh.",
        CONSTRUCTION_PERMIT = "Time to build a home!",
        DEMOLITION_PERMIT = "Destruction sounds like fun!",
		
		CLAWPALMTREE_SAPLING = "It's groing.",

        CORKBOAT = "Cork is pretty floaty, after all.",
        CORKCHEST = "It keeps my stuff extra safe.",

        BANDITHAT = "I look like an old school gangster in it.",
        PIGBANDIT = "I don't the way you're eyeing my pockets.",

        PIG_RUINS_CREEPING_VINES = "That's a lot of vines.", 

        MAGNIFYING_GLASS = "I'm a detective!",

        SEDIMENTPUDDLE = "Sparkly.",
        GOLDPAN = "Now I can be a prospector!",

        PORKLAND_ENTRANCE = "Looks like fun.",
        PORKLAND_EXIT = "Looks like fun.",

        POG = 
        {
        	GENERIC = "Awwwww, it's so cute!",
        	FOLLOWER = "You remind me of Mick.",
        	SLEEPING = "Sleep well little guy.",
        	APORKALYPSE = "Not cute, not cute!",
        },

        PANGOLDEN = "It eats gold.",

        ROC_LEG = "It's massive!",
        ROC_HEAD = "Creepy!",
        ROC_TAIL = "How'd you get so big?",

        GNATMOUND = "Gnats...",
        GNAT = "Gnats..",
        
        PORKLAND_INTRO = "Whatever, jerk.",

        ROC_NEST_TREE1 = "It's a little tree.",
        ROC_NEST_TREE2 = "Just a small tree.",
        ROC_NEST_BUSH = "It's a bush.",
        ROC_NEST_BRANCH1 = "Might be useful. Might not be.",
        ROC_NEST_BRANCH2 = "Looks brittle.",
        ROC_NEST_TRUNK = "Something tore this tree clean out.",
        ROC_NEST_HOUSE = "Creepy...",
        ROC_NEST_RUSTY_LAMP = "It's been here a while.",

        ROC_NEST_EGG1 = "Is this... rock?",
        ROC_NEST_EGG2 = "Is this... rock?",
        ROC_NEST_EGG3 = "Is this... rock?",
        ROC_NEST_EGG4 = "Is this... rock?",

        ROC_ROBIN_EGG = "It's very durable.",

        TUBER_CROP = "Doesn't look apetizing.",
        TUBER_BLOOM_CROP = "Not very apetizing, but safe to eat at least.",
        TUBER_CROP_COOKED = "I don't think I should.",
        TUBER_BLOOM_CROP_COOKED = "Nice and roasted.",

        ALLOY = "It's an ingot, and... heavy... too!",

        ARMOR_METALPLATE = "What am I, the Tin Man?",
        METALPLATEHAT = "Way too heavy and it'll mess up my hair. No thank you.",

        SMELTER = "Sup?",

        BUGREPELLENT = "I'll be needing for sure.",
        
        HOGUSPORKUSATOR = "Pigs and magic. Sounds like an awful idea.",

        GASCLOUD = "Definitely don't want to breathe that in.",

        SHEARS = "A gardener's best friend.",
    	BATHAT = "The things I do to survive.",
    	
    	WATERDROP = "This is no ordinary water.",

    	LIFEPLANT = "It's kinda like literal life insurance.",

    	TRINKET_GIFTSHOP_1 = "Eh, what's this? Whatever.",
    	TRINKET_GIFTSHOP_3 = "Cool. Ana would like it.",        

	    KEY_TO_CITY = "Heh, yeah, yeah, I'm a hero, no need to gloat.",

    	PEDESTAL_KEY = "It's very important.",

    	ROYAL_GALLERY = "Looks... er... boring.",

    	APORKALYPSE_CLOCK = "That's concerning.",
    	ANCIENT_HERALD = "What do you want from me?!",

    	--ASPARAGUSSOUP = "Smells like it tastes.",
    	SPICYVEGSTINGER = "It's got a nice kick to it.",
    	FEIJOADA = "Is this really all we have?",
    	HARDSHELL_TACOS = "Yup. Totally tacos... heh heh... gross...",
    	GUMMY_CAKE = "Well... food is food.",
    	STEAMEDHAMSANDWICH = "I haven't had a burger in forever... Don't mind if I do!",

    	ROC_NEST_DEBRIS1 = "Looks really brittle.",
    	ROC_NEST_DEBRIS2 = "I could snap it no problem.",
    	ROC_NEST_DEBRIS3 = "It's a stick.",
    	ROC_NEST_DEBRIS4 = "It's a stick.",

    	ANTQUEEN = "That must be the queen.",
    	ANTQUEEN_CHAMBERS = "The queen resides here.",
    	ANTQUEEN_THRONE = "For royalty. Bug royalty.",
    	ANTMAN_WARRIOR_EGG = "I'd better leave those alone.",
		
		PIG_SHOP_DELI =
        {
            GENERIC = "I could get a nice meal here.",
            BURNING = "Someone call the fire department!",
        },

        PIG_SHOP_CITYHALL =
         {
            GENERIC = "City hall.",
            BURNING = "Well that might be a problem.",
        },
        PIG_SHOP_CITYHALL_PLAYER = 
         {
            GENERIC = "Mayor Ninten. I like the sound of that.",
            BURNING = "My power! Up in smokes!",
        },
        PIG_GUARD_TOWER_PALACE =
        {
            GENERIC = "The royal guards stay here.",   
            BURNING = "Well!",
        },

        PIG_RUINS_PIG = "This one looks a lot harder to climb.",
        PIG_RUINS_IDOL = "Coooool.",
        PIG_RUINS_PLAQUE = "It's got some markings on it. I can't really make it out.",

        BASEFAN = "It helps with the fevers.",
        SPRINKLER = "Summer memories.",

        NETTLELOSANGE = "A snack that helps my sinuses. Win win.",

        ICEDTEA = "I love iced tea!",

        TRINKET_GIFTSHOP_4 = "It's fun when you're not the one cleaning up the mess.",

        WALLCRACK_RUINS = "Hmmmm, what's this?",

        DEFLATED_BALLOON = "It's not gonna be useful anytime soon.",
		DEFLATED_BALLOON_BASKET = "It's just a stupid basket now.",

		--SNAKE_FIRE = "Ugh! Stay away!",

		DISGUISEHAT = "It tricks the pigs.",

		ALOE_SEEDS = "It's an aloe seed.",
		--ASPARAGUS_SEEDS = "It's asparagus seeds.",
		RADISH_SEEDS = "It's a radish seed.",

		CAVE_EXIT_ROC = "There's something behind this.",

        PORKLAND_INTRO_BASKET = "It's just a stupid basket now.",
        PORKLAND_INTRO_BALLOON = "It's doing a whole lot of nothing now.",
        PORKLAND_INTRO_TRUNK = "Stupid trunk...",
        PORKLAND_INTRO_SUITCASE = "Stupid suitcase!",
        PORKLAND_INTRO_FLAGS = "Stupid everything!",
        PORKLAND_INTRO_SANDBAG = "Ugh.",

        TURF_BEARD_HAIR = "Why??", 

        HIPPO_ANTLER = "I'll hold to it, don't worry.",
        BILL_QUILL = "So sharp yet so delicate!",

        ANTLER = "Birds seem to like it.",

        PUGALISK_SKULL = "Man.",
        PUGALISK_CORPSE = "I did not enjoy that.",
        BONESTAFF = "Now I'm a wizard!",
        CITY_HAMMER = "Order in the court!",
        TURF_PAINTED = "It's a chunk of ground.", 
		TURF_PLAINS = "It's a chunk of ground.", 

		PIG_SHOP_BANK = 
        {
          GENERIC = "We keep the money there.",
          BURNING = "We kept the money there.",
        },
 	    PIGMAN_USHER = 
        {
          GENERIC = "What's up pig guy?",
          SLEEPING = "What's he dreaming about?.",
        },
        PIGMAN_ROYALGUARD_2 = 
        {
          GENERIC = "Ye olde copper.",
          SLEEPING = "Lazy.",
        },
        PIG_SHOP_ANTIQUITIES = 
        {
          GENERIC = "An antique store. You know. For grandmas.",
          BURNING = "Someone should do something about that.",
        },

        PIG_RUINS_ENTRANCE2 = "It's screaming to be explored.",
        PIG_RUINS_EXIT2 = "Don't forget the way out now.",
        PIG_RUINS_ENTRANCE3 = "Adventure awaits.",   
        PIG_RUINS_ENTRANCE4 = "Should I take a look?",           
        PIG_RUINS_EXIT4 = "This is the way out.",
        PIG_RUINS_ENTRANCE5 = "I wonder wait goodies await.",           
        PIG_RUINS_ENTRANCE_SMALL = "Seems safe for a small child.",

        RO_BIN = "It's kinda cute.",
        RO_BIN_GIZZARD_STONE = "That bird thing seems to follow it.",
        GIANTGRUB = "That is some nightmare fuel!",
        MUSSEL_BED = "Mussels grow here.",
        SEAWEED_STALK = "I can plant seaweed now.",
        HARPOON = "Man the harpoons!",

		DECO_RUINS_ENDSWELL = "I don't like the looks of that.",
		QUACKENDRILL = "It might be useful for drilling tar.",
		-------rewards update-------

		TURF_DEEPRAINFOREST_NOCANOPY = "It's a chunk of ground.",

		BRAMBLE_CORE = "Don't let its looks deceive you.",
        BRAMBLE_BULB = "You're mine now.",
        ROOTTRUNK_CHILD = "It's connected to other roots. That's pretty neat.",

		PIG_SHOP_TINKER =
        {
            GENERIC = "Get tinkering!",
            BURNING = "That is not tinkering, in fact.",
        },
        ARMORVORTEXCLOAK = "Too... emo.",    
        ANCIENT_REMNANT = "Mine now.",

        GOGGLESNORMALHAT = "I tried on Lloyd's glasses before. They don't work for me.",
        GOGGLESHEATHAT = "I didn't wanna wear them, glasses are for nerds anyways!",
        GOGGLESARMORHAT = "Tackyyyyyyy.",
        GOGGLESSHOOTHAT = "I don't need them.",     
        THUMPER = "It's a little earthquake machine.",
        TELEBRELLA = "Looks useful. If you're not Ninten, HAH!",
        TELIPAD = "4D slip for normies.",
        TRUSTY_SHOOTER = "I dunno how it works but thank God it does.",
        WHEELER_TRACKER = "It's great for finding things you all ready have. Wait.",

        ANCIENT_HULK = "It is NOT friendly!",
        ROCK_BASALT = "Basalt.",
        LIVING_ARTIFACT = "I'm like Iron Man with it!",
        INFUSED_IRON = "Looks very alien.",

        TELEPORTATO_HAMLET_POTATO = "It's a fake potato.",
        TELEPORTATO_HAMLET_RING = "A ring for that thingy. You know.",
        TELEPORTATO_HAMLET_BOX = "What's with this junk?",
        TELEPORTATO_HAMLET_CRANK = "Some crank.",
        TELEPORTATO_HAMLET_BASE = "There's a world on the other side.",

        ANCIENT_ROBOTS_ASSEMBLY = "Build-your-own-robot kit patent pending.",

        HEDGE_BLOCK_ITEM = "For hedges.",
        HEDGE_CONE_ITEM = "Topiary, huh?",
        HEDGE_LAYERED_ITEM = "Where to plant?",
        --Arena Event
		--Lol skipping
        LAVAARENA_BOARLORD = "That's the guy in charge here.",
        BOARRIOR = "You sure are big!",
        BOARON = "I can take him!",
        PEGHOOK = "That spit is corrosive!",
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
        LAVAARENA_RECHARGERHAT = "Those crystals will quicken my abilities.",
        LAVAARENA_HEALINGGARLANDHAT = "This garland will restore a bit of my vitality.",
        LAVAARENA_CROWNDAMAGERHAT = "That could cause some major destruction.",

		LAVAARENA_ARMOR_HP = "That should keep me safe.",

		LAVAARENA_FIREBOMB = "It smells like brimstone.",
		LAVAARENA_HEAVYBLADE = "A sharp looking instrument.",

        --Quagmire
		--No
        QUAGMIRE_ALTAR = 
        {
        	GENERIC = "We'd better start cooking some offerings.",
        	FULL = "It's in the process of digestinating.",
    	},
		QUAGMIRE_ALTAR_STATUE1 = "It's an old statue.",
		QUAGMIRE_PARK_FOUNTAIN = "Been a long time since it was hooked up to water.",
		
        QUAGMIRE_HOE = "It's a farming instrument.",
        
        QUAGMIRE_TURNIP = "It's a raw turnip.",
        QUAGMIRE_TURNIP_COOKED = "Cooking is science in practice.",
        QUAGMIRE_TURNIP_SEEDS = "A handful of odd seeds.",
        
        QUAGMIRE_GARLIC = "The number one breath enhancer.",
        QUAGMIRE_GARLIC_COOKED = "Perfectly browned.",
        QUAGMIRE_GARLIC_SEEDS = "A handful of odd seeds.",
        
        QUAGMIRE_ONION = "Looks crunchy.",
        QUAGMIRE_ONION_COOKED = "A successful chemical reaction.",
        QUAGMIRE_ONION_SEEDS = "A handful of odd seeds.",
        
        QUAGMIRE_POTATO = "The apples of the earth.",
        QUAGMIRE_POTATO_COOKED = "A successful temperature experiment.",
        QUAGMIRE_POTATO_SEEDS = "A handful of odd seeds.",
        
        QUAGMIRE_TOMATO = "It's red because it's full of science.",
        QUAGMIRE_TOMATO_COOKED = "Cooking's easy if you understand chemistry.",
        QUAGMIRE_TOMATO_SEEDS = "A handful of odd seeds.",
        
        QUAGMIRE_FLOUR = "Ready for baking.",
        QUAGMIRE_WHEAT = "It looks a bit grainy.",
        QUAGMIRE_WHEAT_SEEDS = "A handful of odd seeds.",
        --NOTE: raw/cooked carrot uses regular carrot strings
        QUAGMIRE_CARROT_SEEDS = "A handful of odd seeds.",
        
        QUAGMIRE_ROTTEN_CROP = "I don't think the altar will want that.",
        
		QUAGMIRE_SALMON = "Mm, fresh fish.",
		QUAGMIRE_SALMON_COOKED = "Ready for the dinner table.",
		QUAGMIRE_CRABMEAT = "No imitations here.",
		QUAGMIRE_CRABMEAT_COOKED = "I can put a meal together in a pinch.",
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

		
		QUAGMIRE_RUBBLE_CARRIAGE = "On the road to nowhere.",
        QUAGMIRE_RUBBLE_CLOCK = "Someone beat the clock. Literally.",
        QUAGMIRE_RUBBLE_CATHEDRAL = "Preyed upon.",
        QUAGMIRE_RUBBLE_PUBDOOR = "No longer a-door-able.",
        QUAGMIRE_RUBBLE_ROOF = "Someone hit the roof.",
        QUAGMIRE_RUBBLE_CLOCKTOWER = "That clock's been punched.",
        QUAGMIRE_RUBBLE_BIKE = "Must have mis-spoke.",
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "No one's here.",
            "Something destroyed this town.",
            "I wonder who they angered.",
        },
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
        
        QUAGMIRE_PORTAL = "Another dead end.",
        QUAGMIRE_SALTROCK = "Salt. The tastiest mineral.",
        QUAGMIRE_SALT = "It's full of salt.",
        --food--
        QUAGMIRE_FOOD_BURNT = "That one was an experiment.",
        QUAGMIRE_FOOD =
        {
        	GENERIC = "I should offer it on the Altar of Gnaw.",
            MISMATCH = "That's not what it wants.",
            MATCH = "Science says this will appease the sky God.",
            MATCH_BUT_SNACK = "It's more of a light snack, really.",
        },
        
        QUAGMIRE_FERN = "Probably chock full of vitamins.",
        QUAGMIRE_FOLIAGE_COOKED = "We cooked the foliage.",
        QUAGMIRE_COIN1 = "I'd like more than a penny for my thoughts.",
        QUAGMIRE_COIN2 = "A decent amount of coin.",
        QUAGMIRE_COIN3 = "Seems valuable.",
        QUAGMIRE_COIN4 = "We can use these to reopen the Gateway.",
        QUAGMIRE_GOATMILK = "Good if you don't think about where it came from.",
        QUAGMIRE_SYRUP = "Adds sweetness to the mixture.",
        QUAGMIRE_SAP_SPOILED = "Might as well toss it on the fire.",
        QUAGMIRE_SEEDPACKET = "Sow what?",
        
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
        	GENERIC = "Can I try it?",
        	OFF = "Hey, why isn't it working?",
        	BURNING = "Well it's on fire.",
        	BURNT = "Sorry about that.",
        },
        WINONA_SPOTLIGHT = 
        {
        	GENERIC = "Nice, it lets us see in the dark!",
        	OFF = "No power.",
        	BURNING = "I don't think the fire is necessary",
        	BURNT = "Oh, I should have done something to put that out I guess.",
        },
        WINONA_BATTERY_LOW = 
        {
        	GENERIC = "It provides us with power. Good, getting tired of this wilderness stuff.",
        	LOWPOWER = "It's running out of juice.",
        	OFF = "Let's turn it on.",
        	BURNING = "Well that's probably not good.",
        	BURNT = "Well.",
        },
        WINONA_BATTERY_HIGH = 
        {
        	GENERIC = "I don't know how it works, but thank God it does!",
        	LOWPOWER = "We need to get it power.",
        	OFF = "It's doing us no good now.",
        	BURNING = "Don't think it's supposed to be on fire.",
        	BURNT = "Oh, you wanted me to put it out? Oh!",
        },

        --Wormwood
        COMPOSTWRAP = "Dude, that stuff might work for you but it's not gonna work for me.",
        ARMOR_BRAMBLE = "No thanks.",
        TRAP_BRAMBLE = "Watch your step.",

        BOATFRAGMENT03 = "Man, we really have to be careful out here.",
        BOATFRAGMENT04 = "Man, we really have to be careful out here.",
        BOATFRAGMENT05 = "Man, we really have to be careful out here.",
		BOAT_LEAK = "S-someone should do something about that leak, right",
        MAST = "What's a ship without a sail?",
        SEASTACK = "Watch the rocks!",
        FISHINGNET = "Now we're talking.",
        ANTCHOVIES = "Anchovies are fine, I guess.",
        STEERINGWHEEL = "I call captain!",
        ANCHOR = "It's heavy.",
        BOATPATCH = "This'll be useful if we get into trouble.",
        DRIFTWOOD_TREE = 
        {
            BURNING = "Ah, it's on fire.",
            BURNT = "Fire's out.",
            CHOPPED = "I chopped it up good, oh yeah.",
            GENERIC = "Where'd you come from, I wonder?",
        },

        DRIFTWOOD_LOG = "Some wood in the middle of the ocean? Where'd it come, who knows.",

        MOON_TREE = 
        {
            BURNING = "Someone do something about that fire!",
            BURNT = "Nevermind...",
            CHOPPED = "Phew, finally chopped it all down.",
            GENERIC = "I don't remember these being on the moon...",
        },
		MOON_TREE_BLOSSOM = "Oooooo...",

        MOONBUTTERFLY = 
        {
        	GENERIC = "Hey little guy.",
        	HELD = "I wonder what I could do with you.",
        },
		MOONBUTTERFLYWINGS = "They're all dusty.",
        MOONBUTTERFLY_SAPLING = "Um. What?",
        ROCK_AVOCADO_FRUIT = "No fruit is too strong for me!",
        ROCK_AVOCADO_FRUIT_RIPE = "What do I do with this??",
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "I guess I can eat it now.",
        ROCK_AVOCADO_FRUIT_SPROUT = "There's nothing to take right now.",
        ROCK_AVOCADO_BUSH = 
        {
        	BARREN = "It's not gonna grow anything.",
			WITHERED = "Way too hot for this.",
			GENERIC = "What kind of fruit is this?",
			PICKED = "Just gotta wait, I guess.",
			DISEASED = "It looks pretty sick.",
            DISEASING = "Err, something's not right.",
			BURNING = "It's burning!",
		},
        DEAD_SEA_BONES = "Dang...",
        HOTSPRING = 
        {
        	GENERIC = "That looks relaxing.",
        	BOMBED = "Whoa, cool!",
        	GLASS = "Glass? Where'd that come from?",
			EMPTY = "It's empty now.",
        },
        MOONGLASS = "Careful, it's sharp.",
		MOONGLASS_CHARGED = "The energy is immense!",
        MOONGLASS_ROCK = "Oh! Looking good, Ninten, heh heh.",
        BATHBOMB = "It has been a while since I've bathed out here.",											   
        TRAP_STARFISH =
        {
            GENERIC = "It's just begging to poked.",
            CLOSED = "Wow, I almost lost a finger there!",
        },
        DUG_TRAP_STARFISH = "I could get into all sorts of fun with you.",
        SPIDER_MOON = 
        {
        	GENERIC = "No thanks.",
        	SLEEPING = "Pay no mind to the young child... I don't taste good, I promise...",
        	DEAD = "It's still twitching...",
        },
        MOONSPIDERDEN = "Way too creepy for me.",
		FRUITDRAGON =
		{
			GENERIC = "I've always wanted a pet lizard.",
			RIPE = "Whoa, cool.",
			SLEEPING = "Reptiles need to spend a lot of time basking in the sun.",
		},
        PUFFIN =
        {
            GENERIC = "They kinda look like penguins!",
            HELD = "You're pretty cute.",
            SLEEPING = "Night night!",
        },

		MOONGLASSAXE = "It's sharp, but fragile.",
		GLASSCUTTER = "This'll be useful.",

        ICEBERG =
        {
            GENERIC = "Careful.",
            MELTED = "Nothing left of it.",
        },
        ICEBERG_MELTED = "Nothing left of it.",

        MINIFLARE = "It'll be useful if I need to get someone's attention... assuming that someone is someone GOOD.",

		MOON_FISSURE = 
		{
			GENERIC = "I understand everything and nothing, in death there is life: an end a new beginning!", 
			NOLIGHT = "Huh? Where did the voices go??",
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "What do you need from me?",
            GENERIC = "The voices teach me so much...",
        },

        MOON_ALTAR_IDOL = "How do you know my name?",
        MOON_ALTAR_GLASS = "I should take this.",
        MOON_ALTAR_SEED = "I understand.",

        MOON_ALTAR_ROCK_IDOL = "Hm? Free us? Who's us?",
        MOON_ALTAR_ROCK_GLASS = "I see something in the rock.",
        MOON_ALTAR_ROCK_SEED = "Yes?",

        MOON_ALTAR_CROWN = "It speaks to me.",
        MOON_ALTAR_COSMIC = "Yes?",

        MOON_ALTAR_ASTRAL = "What am I getting myself into?",
        MOON_ALTAR_ICON = "You want me to do what?",
        MOON_ALTAR_WARD = "I see...",        

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "I've never really done anything like this before.",
            BURNT = "Well then.",
        },
        BOAT_ITEM = "Maybe I have a chance to get out of here.",
		BOAT_GRASS_ITEM = "I sure hope it floats.",											 
        STEERINGWHEEL_ITEM = "That's the steering wheel.",
        ANCHOR_ITEM = "Now I can build an anchor.",
        MAST_ITEM = "Now I can build a mast.",
        MUTATEDHOUND = 
        {
        	DEAD = "Phew...",
        	GENERIC = "It's back for more!!",
        	SLEEPING = "Let's just get out of here.",
        },

        MUTATED_PENGUIN = 
        {
			DEAD = "I'm gonna have nightmares over this for weeks.",
			GENERIC = "How could you do something so cruel to something so precious!",
			SLEEPING = "...",
		},
        CARRAT = 
        {
        	DEAD = "Poor thing.",
        	GENERIC = "Hey that carrot is... moving?",
        	HELD = "I wonder if it tastes like carrots...",
        	SLEEPING = "Hmph.",
        },

		BULLKELP_PLANT = 
        {
            GENERIC = "Seaweed.",
            PICKED = "Not much left now.",
        },
		BULLKELP_ROOT = "I guess I could plant this somewhere deep.",
        KELPHAT = "Gross! Do you have any idea what that'll do to my hair?",
		KELP = "A bunch of seaweed. It's edible.",
		KELP_COOKED = "It's not too bad.",
		KELP_DRIED = "It's not my favorite snack but it'll do.",

		GESTALT = "What do you want from me?",
        GESTALT_GUARD = "Please leave me alone.",

		COOKIECUTTER = "It's going to sink us if we don't do something!",
		COOKIECUTTERSHELL = "Good riddance.",
		COOKIECUTTERHAT = "I'm not wearing that.",
		SALTSTACK =
		{
			GENERIC = "Salty.",
			MINED_OUT = "There's nothing left.",
			GROWING = "It's growing.",
		},
		SALTROCK = "Mmmmm. Salty.",
		SALTBOX = "I think it helps keep things fresh.",

		TACKLESTATION = "Any fisherman needs a place to store their tackle.",
		TACKLESKETCH = "I could probably make this.",

        MALBATROSS = "Hey, watch it! Stupid bird...",
        MALBATROSS_FEATHER = "It's massive.",
        MALBATROSS_BEAK = "Now what am I gonna do with this??",
        MAST_MALBATROSS_ITEM = "Wow that's light.",
        MAST_MALBATROSS = "Let's sail!",
		MALBATROSS_FEATHERED_WEAVE = "For such a big bird, these feathers are surprisingly light!",

        GNARWAIL =
        {
            GENERIC = "Hey dude.",
            BROKENHORN = "Oh, sorry about that...",
            FOLLOWER = "He likes me.",
            BROKENHORN_FOLLOWER = "Maybe we could get you a new one?",
        },
        GNARWAIL_HORN = "It's like a lance!",

        WALKINGPLANK = "It's like my very own diving board.",
        OAR = "Ugh. Seems like too much work.",
		OAR_DRIFTWOOD = "Too much work for me.",

		OCEANFISHINGROD = "I've never been sea fishing!",
		OCEANFISHINGBOBBER_NONE = "I need a bobber.",
        OCEANFISHINGBOBBER_BALL = "Here fishy fishy!",
        OCEANFISHINGBOBBER_OVAL = "Now I'm proper fisherman!",
		OCEANFISHINGBOBBER_CROW = "Now we're talking.",
		OCEANFISHINGBOBBER_ROBIN = "I'm ready to catch some fish!",
		OCEANFISHINGBOBBER_ROBIN_WINTER = "I'll have some fun with this.",
		OCEANFISHINGBOBBER_CANARY = "This'll do.",
		OCEANFISHINGBOBBER_GOOSE = "Let's fish.",
		OCEANFISHINGBOBBER_MALBATROSS = "I'm a fishing master!",

		OCEANFISHINGLURE_SPINNER_RED = "They'll love this!",
		OCEANFISHINGLURE_SPINNER_GREEN = "They'll love this!",
		OCEANFISHINGLURE_SPINNER_BLUE = "I can catch some decent fish with this!",
		OCEANFISHINGLURE_SPOON_RED = "It's for smaller fish.",
		OCEANFISHINGLURE_SPOON_GREEN = "It's for smaller fish.",
		OCEANFISHINGLURE_SPOON_BLUE = "The proper bait is a must!",
		OCEANFISHINGLURE_HERMIT_RAIN = "For a rainy day.",
		OCEANFISHINGLURE_HERMIT_SNOW = "It works great in the Winter!",
		OCEANFISHINGLURE_HERMIT_DROWSY = "They won't know what hit 'em!",
		OCEANFISHINGLURE_HERMIT_HEAVY = "I'll catch the big one!",

		OCEANFISH_SMALL_1 = "Little guy was no match for me!", --Runty Guppy
		OCEANFISH_SMALL_2 = "What nose you have!", --Needlenosed Squirt
		OCEANFISH_SMALL_3 = "Lots of energy for such a small fish!", --Bitty Baitfish
		OCEANFISH_SMALL_4 = "It's tiny.", --Smolt Fry
		OCEANFISH_SMALL_5 = "It's made of popcorn?", --Popperfish
		OCEANFISH_SMALL_6 = "It's half plant.", --Fallounder
		OCEANFISH_SMALL_7 = "I like your scales!", --Bloomfin Tuna
		OCEANFISH_SMALL_8 = "So bright!", --Scorching Sunfish
        OCEANFISH_SMALL_9 = "Hey hey, watch it with the water!", --Spittlefish

		OCEANFISH_MEDIUM_1 = "It's a bottom feeder.", --Mudfish
		OCEANFISH_MEDIUM_2 = "I caught it, yes!", --Deep Bass
		OCEANFISH_MEDIUM_3 = "Hey big guy.", --Dandy Lionfish
		OCEANFISH_MEDIUM_4 = "You were a real pain to catch, you know that?", --Black Catfish
		OCEANFISH_MEDIUM_5 = "It's made of corn!", --Corn Cod
		OCEANFISH_MEDIUM_6 = "Very pretty scales you have!", --Dappled Koi
		OCEANFISH_MEDIUM_7 = "Very pretty scales you have!", --Golden Koi
		OCEANFISH_MEDIUM_8 = "It's so cold.", --Ice Bream
		OCEANFISH_MEDIUM_9 = "Wait, the candy?? Grossss...",																			

		PONDFISH = "I caught it!",
		PONDEEL = "Whoa, an eel!",

        FISHMEAT = "Some raw fish.",
        FISHMEAT_COOKED = "Ready to eat.",
        FISHMEAT_SMALL = "Tiny fish pieces.",
        FISHMEAT_SMALL_COOKED = "Now it's safe to eat.",
		SPOILED_FISH = "Ugh, that smells awful!",

		FISH_BOX = "I can keep my catches here.",
        POCKET_SCALE = "Good for weighing things.",

		TACKLECONTAINER = "A fishman needs somewhere to store tackle!",
		SUPERTACKLECONTAINER = "Now this is a keeper.",

		TROPHYSCALE_FISH =
		{
			GENERIC = "Fishermen love to show off their catches, for some reason.",
			HAS_ITEM = "Weight: {weight}\nCaught by: {owner}",
			HAS_ITEM_HEAVY = "Weight: {weight}\nCaught by: {owner}\nWow!",
			BURNING = "Oh not's that good.",
			BURNT = "Well then.",
			OWNER = "\nWeight: {weight}\nCaught by: {owner}\nYeah, I'm kind a natural, heh heh.",
			OWNER_HEAVY = "Weight: {weight}\nCaught by: {owner}\nStill surprised I caught it and it didn't catch me!",
		},

		OCEANFISHABLEFLOTSAM = "Just some muddy grass.",
		CALIFORNIAROLL = "I had sushi when my dad took me to Japan. I love it!",
		SEAFOODGUMBO = "Yum!",
		SURFNTURF = "Yum!",
        WOBSTER_SHELLER = "Oh, a lobster!", 
        WOBSTER_DEN = "It's a home for crabs.",
        WOBSTER_SHELLER_DEAD = "I've never had one of these before.",
        WOBSTER_SHELLER_DEAD_COOKED = "Dinner time!",

        LOBSTERBISQUE = "Looks good!",
        LOBSTERDINNER = "Fancy!",

        WOBSTER_MOONGLASS = "Whoa, that's cool.",
        MOONGLASS_WOBSTER_DEN = "It's a glass home.",

		TRIDENT = "Cool!",
		
		WINCH =
		{
			GENERIC = "I can hunt for treasure with this.",
			RETRIEVING_ITEM = "It has something!",
			HOLDING_ITEM = "Let's have a look.",
		},

        HERMITHOUSE = {
            GENERIC = "It's that old crab's place.",
            BUILTUP = "I should probably build a home for myself.",
        }, 
        
        SHELL_CLUSTER = "It's a bunch of shells.",
        --
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "Cool.",
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "They make great decor.",
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "It's very high pitched.",
        },

        CHUM = "It's a fish meal!",

        SUNKENCHEST =
        {
            GENERIC = "I found some treasure!",
            LOCKED = "Darn it! Hey, open up!",
        },
        
        HERMIT_BUNDLE = "Hey, thanks!",
        HERMIT_BUNDLE_SHELLS = "I'll take it!",

        RESKIN_TOOL = "I can have all sorts of fun with this!",
        MOON_FISSURE_PLUGGED = "What's with the plugs?",


		----------------------- ROT STRINGS GO ABOVE HERE ------------------

		-- Walter
        WOBYBIG = 
        {
            "That's a big dog!",
            "Cool!",
        },
        WOBYSMALL = 
        {
            "Aw, she's so cute!",
            "Makes me miss Mick...",
        },
		WALTERHAT = "Reminds me of being a Boy Scout.",
		SLINGSHOT = "I'm an amazing shot!",
		SLINGSHOTAMMO_ROCK = "Slingshot ammo.",		
		SLINGSHOTAMMO_MARBLE = "Slingshot ammo",		
		SLINGSHOTAMMO_THULECITE = "Slingshot ammo.",	
        SLINGSHOTAMMO_GOLD = "Give 'em the gold!",
        SLINGSHOTAMMO_SLOW = "It'll stop 'em in their tracks!",
        SLINGSHOTAMMO_FREEZE = "Teach them to chill out.",
		SLINGSHOTAMMO_POOP = "If it works, it works.",
        PORTABLETENT = "I've been camping before. It was alright.",
        PORTABLETENT_ITEM = "Camping on the go.",

        -- Wigfrid
        BATTLESONG_DURABILITY = "The only singing I do is in the shower.",
        BATTLESONG_HEALTHGAIN = "The only singing I do is in the shower.",
        BATTLESONG_SANITYGAIN = "The only singing I do is in the shower.",																							
        BATTLESONG_SANITYAURA = "Take a melody!",
        BATTLESONG_FIRERESISTANCE = "Simple as can be!",
        BATTLESONG_INSTANT_TAUNT = "Give it some words, and,",
        BATTLESONG_INSTANT_PANIC = "Sweet harmony.",
        
        -- Webber
        MUTATOR_WARRIOR = "Looks yummy. Too bad I know what it's made of.",
        MUTATOR_DROPPER = "Keep the spider treats to spiders, dude.",
        MUTATOR_HIDER = "No thanks.",
        MUTATOR_SPITTER = "Yeesh! I'm good, man...",
        MUTATOR_MOON = "No.",
        MUTATOR_HEALER = "Keep that away from me, dude.",
        SPIDER_WHISTLE = "That's that Webber kid's.",
        SPIDERDEN_BEDAZZLER = "Arts and crafts are the least of my priorities right now.",
        SPIDER_HEALER = "Whhhhhhhhy?!!",
        SPIDER_REPELLENT = "I could use for the cellar back at home!",
        SPIDER_HEALER_ITEM = "Now why would I want to heal those... things?",		
		
		-- Wendy
		GHOSTLYELIXIR_SLOWREGEN = "Let's not mess with that.",
		GHOSTLYELIXIR_FASTREGEN = "Let's not mess with that.",
		GHOSTLYELIXIR_SHIELD = "Let's not mess with that.",
		GHOSTLYELIXIR_ATTACK = "Let's not mess with that.",
		GHOSTLYELIXIR_SPEED = "Let's not mess with that.",
		GHOSTLYELIXIR_RETALIATION = "Let's not mess with that.",
		SISTURN =
		{
			GENERIC = "Let's get you some flowers.",
			SOME_FLOWERS = "Needs more.",
			LOTS_OF_FLOWERS = "There you go!",
		},

        --Wortox
        WORTOX_SOUL = "only_used_by_wortox", --only wortox can inspect souls

        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "Barbaques on the move, oh yeah!",
            DONE = "Food's ready!",

			COOKING_LONG = "Hurry up!",
			COOKING_SHORT = "Can't wait can't wait!",
			EMPTY = "Ready for the next meal.",
        },
        
        PORTABLEBLENDER_ITEM = "It's a blender!",
        PORTABLESPICER_ITEM =
        {
            GENERIC = "For spices.",
            DONE = "Mmmmm, spicy.",
        },
        SPICEPACK = "Don't mind if I do!",
        SPICE_GARLIC = "Whoo, that's some strong stuff.",
        SPICE_SUGAR = "This'll satisfy my sweet tooth!",
        SPICE_CHILI = "Looks good.",
        SPICE_SALT = "Some salt'll never hurt you.",
        MONSTERTARTARE = "Looks filling, but probably not the best meal.",
        FRESHFRUITCREPES = "Fruit is an important part of your diet.",
        FROGFISHBOWL = "Dude, what th- ...No thnaks.",
        POTATOTORNADO = "Better than potato chips!",
        DRAGONCHILISALAD = "My mouth is on fire just looking at it!",
        GLOWBERRYMOUSSE = "Gimmie!",
        VOLTGOATJELLY = "I like it.",
        NIGHTMAREPIE = "Um, do I have to eat this?",
        BONESOUP = "Creative.",
        MASHEDPOTATOES = "This'd be great with prime ribs. Oh, a boy can dream...",
        POTATOSOUFFLE = "I'm gonna put on a few pounds if I keep eating like this.",
        MOQUECA = "Wow, my mom's cooking doesn't even compare!",
        GAZPACHO = "This would be a great way to get my sisters to eat their veggies.",
        ASPARAGUSSOUP = "I'm not a fan, but I can down it.",
        VEGSTINGER = "How do you even learn to cook like this?",
        BANANAPOP = "It's a healthy snack.",
        CEVICHE = "It's okay I guess.",
        SALSA = "I love me some salsa!",
        PEPPERPOPPER = "They look delicious!",
		
        TURNIP = "It's a turnip.",
        TURNIP_COOKED = "I roasted it.",
        TURNIP_SEEDS = "Some turnip seeds.",
        
        GARLIC = "It'll be useful against vampires.",
        GARLIC_COOKED = "Why'd I do this?",
        GARLIC_SEEDS = "Garlic seeds.",
        
        ONION = "Don't these make people cry?",
        ONION_COOKED = "*Sniffle*",
        ONION_SEEDS = "I can make more onions now.",
        
        POTATO = "Potato potato.",
        POTATO_COOKED = "Baked potatos!",
        POTATO_SEEDS = "Potato seeds.",
        
        TOMATO = "Tomatos have all sorts of good use.",
        TOMATO_COOKED = "I roasted it!",
        TOMATO_SEEDS = "More tomatos when I need them.",

        ASPARAGUS = "I'm not a fan of this veggie.", 
        ASPARAGUS_COOKED = "Ugh, do I really have to?",
        ASPARAGUS_SEEDS = "It's some asparagus seeds.",

        PEPPER = "Nothing's too hot for me!",
        PEPPER_COOKED = "I can take it!",
        PEPPER_SEEDS = "I got some pepper seeds.",

        WEREITEM_BEAVER = "Now that's creepy.",
        WEREITEM_GOOSE = "Dude, what in the world!?",
        WEREITEM_MOOSE = "...",

        MERMHAT = "It might be the tackiest thing I've ever seen, but it'll stop those dumb fish people from attacking me.",						   
        MERMTHRONE =
        {
            GENERIC = "Not bad.",
            BURNT = "Well you tried.",
        },        
        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "What's all this?",
            BURNT = "Nevermind.",
        },        
        MERMHOUSE_CRAFTED = 
        {
            GENERIC = "Looks good.",
            BURNT = "Well then.",
        },

        MERMWATCHTOWER_REGULAR = "It house the king's guards.",
        MERMWATCHTOWER_NOKING = "Don't worry, I'll be your king!",
        MERMKING = "Oh God, ever hear of a shower?!",
        MERMGUARD = "We're good, right?",
        MERM_PRINCE = "Guess he's in charge now.",

        SQUID = "Hey, it's a squid!",

		GHOSTFLOWER = "A gift from a ghostly friend.",
        SMALLGHOST = "What's wrong? Besides the obvious...",

        CRABKING = 
        {
            GENERIC = "Watch out, it's alive!",
            INERT = "What's a castle doing all the way out here?",
        },
		CRABKING_CLAW = "Hey! Let go of my boat!",
		
		MESSAGEBOTTLE = "Maybe it's a treasure map!",
		MESSAGEBOTTLEEMPTY = "It's a bottle.",

        MEATRACK_HERMIT =
        {
            DONE = "Oh boy, it's done!",
            DRYING = "Still drying...",
            DRYINGINRAIN = "Ugh, this rain is NOT helping!",
            GENERIC = "Ready to dry some meat.",
            BURNT = "Well the rack is done.",
            DONE_NOTMEAT = "It's done.",
            DRYING_NOTMEAT = "Still drying...",
            DRYINGINRAIN_NOTMEAT = "Could we not with the rain?",
        },
        BEEBOX_HERMIT =
        {
			READY = "So much honey... So tasty...",
			FULLHONEY = "So much honey... So tasty...",
			GENERIC = "A little home for bees.",
			NOHONEY = "There's no honey right now.",
			SOMEHONEY = "There's some honey, but I'll wait.",
			BURNT = "Nooooooooo!!",
        },

        HERMITCRAB = "A mean old lady.",

        HERMIT_PEARL = "It's her pearl.",
        HERMIT_CRACKED_PEARL = "My bad.",

        -- DSEAS
        WATERPLANT = "What kind of plant are you?",
        WATERPLANT_BOMB = "Take cover!",
        WATERPLANT_BABY = "It's still growing.",
        WATERPLANT_PLANTER = "They like sea rocks.",

        SHARK = "Ah!! No thanks, Jaws!",

        MASTUPGRADE_LAMP_ITEM = "This'll be great for the dark.",
        MASTUPGRADE_LIGHTNINGROD_ITEM = "Lightning is especially dangerous at sea, I think.",

        WATERPUMP = "The last thing you'd want at sea is a fire.",

        BARNACLE = "What am I gonna with these?",
        BARNACLE_COOKED = "Ugh...",

        BARNACLEPITA = "It doesn't look too bad..",
        BARNACLESUSHI = "I've never had this type of sushi.",
        BARNACLINGUINE = "It's been so long since I've had pasta!",
        BARNACLESTUFFEDFISHHEAD = "UGH.",

        LEAFLOAF = "That doesn't look apetizing.",
        LEAFYMEATBURGER = "I don't mind meat, you know.",
        LEAFYMEATSOUFFLE = "I'm not that hungry.",
        MEATYSALAD = "It's salad I guess.",

        -- GROTTO

		MOLEBAT = "What big nose you have!",
        MOLEBATHILL = "I'd rather not mess with their home.",

        BATNOSE = "It's MY nose now.",
        BATNOSE_COOKED = "It can't be that bad, right?",
        BATNOSEHAT = "I had one of these back home. It's pretty useful for watching baseball games!",

        MUSHGNOME = "It's alive, and it's evil!!",

        SPORE_MOON = "Watch out!",

        MOON_CAP = "It makes you sleepy.",
        MOON_CAP_COOKED = "Is this safe?",

        MUSHTREE_MOON = "It's very pretty",

        LIGHTFLIER = "Cool.",

        GROTTO_POOL_BIG = "This'd make amazing decor.",
        GROTTO_POOL_SMALL = "This'd make amazing decor.",

        DUSTMOTH = "Hey watch it, you'll give me an asthma attack with those wings!",

        DUSTMOTHDEN = "A moth home.",

        ARCHIVE_LOCKBOX = "Open!",
        ARCHIVE_CENTIPEDE = "Uh oh! It's moving, and it's mad!",
        ARCHIVE_CENTIPEDE_HUSK = "Looks like junk to me.",

        ARCHIVE_COOKPOT =
        {
            COOKING_LONG = "Hurry up, I wanna eat!",
			COOKING_SHORT = "Can't wait can't wait!",
			DONE = "Food's ready!",
			EMPTY = "We can use that to prepare meals.",
			BURNT = "Well it's not cooking anything now.",
        },

        ARCHIVE_MOON_STATUE = "What sort of statue is that?",
        ARCHIVE_RUNE_STATUE = 
        {
            LINE_1 = "I have no idea what it says.",
            LINE_2 = "These markings...",
            LINE_3 = "No clue what it says.",
            LINE_4 = "These markings...",
            LINE_5 = "What's it say?",
        },        

        ARCHIVE_RESONATOR = {
            GENERIC = "Where are you leading me?",
            IDLE = "There's nothing here.",
        },
        
        ARCHIVE_RESONATOR_ITEM = "What to do with you?",

        ARCHIVE_LOCKBOX_DISPENCER = {
          POWEROFF = "It doesn't work.",
          GENERIC =  "Now what?",
        },

        ARCHIVE_SECURITY_DESK = {
            POWEROFF = "It's off.",
            GENERIC = "Maybe I should just turn that off again.",
        },

        ARCHIVE_SECURITY_PULSE = "Um.",

        ARCHIVE_SWITCH = {
            VALID = "I did it!",
            GEMS = "It needs something.",
        },

        ARCHIVE_PORTAL = {
            POWEROFF = "I wonder where this leads.",
            GENERIC = "I said, I WONDER WHERE THIS LEADS!!",
        },

        WALL_STONE_2 = "Some old wall.",
        WALL_RUINS_2 = "Nothing special.",

        REFINED_DUST = "Just don't breathe it in, Ninten.",
        DUSTMERINGUE = "It's not food for me, I'll say that much.",

        SHROOMCAKE = "I don't know about this 'cake,' man.",

        NIGHTMAREGROWTH = "Well that's no good.",

        TURFCRAFTINGSTATION = "I can make some nice decor with this.",

        MOON_ALTAR_LINK = "It's... doing something...",

        -- FARMING
        COMPOSTINGBIN =
        {
            GENERIC = "Good compost is important.",
            WET = "It's a little on the wet side.",
            DRY = "Too dry.",
            BALANCED = "I think that'll work.",
            BURNT = "Well.",
        },
        COMPOST = "This'll grow some nice and healthy crops.",
        SOIL_AMENDER = 
		{ 
			GENERIC = "It's a drink for plants.",
			STALE = "Almost ready!",
			SPOILED = "Yeesh, that smell! Hopefully my crops like it.",
		},

		SOIL_AMENDER_FERMENTED = "It's almost too make to take...",

        WATERINGCAN = 
        {
            GENERIC = "Good for watering plants.",
            EMPTY = "Now I just need fresh water.",
        },
        PREMIUMWATERINGCAN =
        {
            GENERIC = "Now this is a watering can!",
            EMPTY = "Let's find you some water.",
        },

		FARM_PLOW = "I can start up a farm with this.",
		FARM_PLOW_ITEM = "Where to use you, I wonder?",
		FARM_HOE = "I'm not a farmer, but pretty sure you need to till the soil for seeds, right?",
		GOLDEN_FARM_HOE = "Tilling in style, oh yeah.",
		NUTRIENTSGOGGLESHAT = "Do I have to? I look so dumb with it on.",
		PLANTREGISTRYHAT = "I guess if I need to, I'll wear it.",

        FARM_SOIL_DEBRIS = "I need to get rid of that.",

		FIRENETTLES = "Ow, that's hot!",
		FORGETMELOTS = "What's this?",
		SWEETTEA = "I don't think I've ever had tea.",
		TILLWEED = "Ugh. Weeds.",
		TILLWEEDSALVE = "Guess it's useful for old people, or something.",
		WEED_IVY = "Weeds...",
        IVY_SNARE = "Hey!",										  								

		TROPHYSCALE_OVERSIZEDVEGGIES =
		{
			GENERIC = "What are we running a grocery store now? Lame.",
			HAS_ITEM = "Weight: {weight}\nHarvested on day: {day}\nNot bad, Ninten",
			HAS_ITEM_HEAVY = "Weight: {weight}\nHarvested on day: {day}\nIt'll feed us for days!",
            HAS_ITEM_LIGHT = "Oh cool, it's not working.",
			BURNING = "Oh no, a fire. What will I do.",
			BURNT = "I got rid of the lame.",
        },
        
        CARROT_OVERSIZED = "Holy carrot!",
        CORN_OVERSIZED = "Whoa!",
        PUMPKIN_OVERSIZED = "I could make a jack-o-latern house with this!",
        EGGPLANT_OVERSIZED = "It's massive.",
        DURIAN_OVERSIZED = "It still smells.",
        POMEGRANATE_OVERSIZED = "It's massive.",
        DRAGONFRUIT_OVERSIZED = "We're eating like kings!",
        WATERMELON_OVERSIZED = "Mmmmmm. I could eat it all on my own.",						 
        TOMATO_OVERSIZED = "That's quite the tomato.",
        POTATO_OVERSIZED = "Imagine how much french fries you could make out of this bad boy!",
        ASPARAGUS_OVERSIZED = "Ugh. I'd rather not.",
        ONION_OVERSIZED = "Now that might be a bit MUCH onion...",
        GARLIC_OVERSIZED = "Ninten, vampire slayer.",
        PEPPER_OVERSIZED = "Hot mama!",
        
        VEGGIE_OVERSIZED_ROTTEN = "Darn.",

		FARM_PLANT =
		{
			GENERIC = "It's sprouted!",
			SEED = "And now, we wait.",
			GROWING = "Grow, grow, grow!",
			FULL = "Let's harvest!",
			ROTTEN = "It's no good now.",
			FULL_OVERSIZED = "How'd it get so big?!",
			ROTTEN_OVERSIZED = "Lame.",
			FULL_WEED = "Out! Useless weeds...",

			BURNING = "My foooooood!!",
		},
        FRUITFLY = "Shoo, shoo!",
        LORDFRUITFLY = "What is thaaaaaaat?!",
        FRIENDLYFRUITFLY = "It's not so bad.",
        FRUITFLYFRUIT = "I tamed it, I guess?",

        SEEDPOUCH = "A safe place to store my seeds.",
		-- Crow Carnival
		CARNIVAL_HOST = "We had carnivals back home all the time, you know.",
		CARNIVAL_CROWKID = "The crows back hope are much more spiteful than you.",
		CARNIVAL_GAMETOKEN = "I can play all sorts of fun games with this.",
		CARNIVAL_PRIZETICKET =
		{
			GENERIC = "Tickets.",
			GENERIC_SMALLSTACK = "Now we're talkin'!",
			GENERIC_LARGESTACK = "What can I say, I'm kind of a carnival master!",
		},

		CARNIVALGAME_FEEDCHICKS_NEST = "It's a little trapdoor.",
		CARNIVALGAME_FEEDCHICKS_STATION =
		{
			GENERIC = "I need a token to play.",
			PLAYING = "Go for the high score!",
		},
		CARNIVALGAME_FEEDCHICKS_KIT = "Now, where shall we put this?",
		CARNIVALGAME_FEEDCHICKS_FOOD = "I think I'm supposed to use that to feed them.",

		CARNIVALGAME_MEMORY_KIT = "Now, where shall we put this?",
		CARNIVALGAME_MEMORY_STATION =
		{
			GENERIC = "Needs a token.",
			PLAYING = "Heh, don't worry, I'm a bit of a wiz at these sorts of games.",
		},
		CARNIVALGAME_MEMORY_CARD =
		{
			GENERIC = "It's a little trapdoor.",
			PLAYING = "Pretty sure it's this one. Right?",
		},

		CARNIVALGAME_HERDING_KIT = "Now, where shall we put this?",
		CARNIVALGAME_HERDING_STATION =
		{
			GENERIC = "Where'd my tokens go?",
			PLAYING = "Seems more like a chore than a game.",											 
		},
		CARNIVALGAME_HERDING_CHICK = "Not so fast!",
		
		CARNIVALGAME_SHOOTING_KIT = "Now, where shall we put this?",
		CARNIVALGAME_SHOOTING_STATION =
		{
			GENERIC = "I need a token.",
			PLAYING = "Heh, I'm a bit of a natural at these types of games. Watch.",
		},
		CARNIVALGAME_SHOOTING_TARGET =
		{
			GENERIC = "It's a little trapdoor.",
			PLAYING = "I'll nail 'em!",
		},

		CARNIVALGAME_SHOOTING_BUTTON =
		{
			GENERIC = "I need a token.",
			PLAYING = "Watch and learn!",
		},

		CARNIVALGAME_WHEELSPIN_KIT = "Now, where shall we put this?",
		CARNIVALGAME_WHEELSPIN_STATION =
		{
			GENERIC = "I need a token.",
			PLAYING = "These games are rigged!",
		},

		CARNIVALGAME_PUCKDROP_KIT = "Now, where shall we put this?",
		CARNIVALGAME_PUCKDROP_STATION =
		{
			GENERIC = "I need a token.",
			PLAYING = "I always disliked this arcade game.",
		},
		
		CARNIVAL_PRIZEBOOTH_KIT = "Prizes not included.",
		CARNIVAL_PRIZEBOOTH =
		{
			GENERIC = "I'm gonna win everything!",
		},

		CARNIVALCANNON_KIT = "You can never go wrong with confetti.",
		CARNIVALCANNON =
		{
			GENERIC = "Let 'er rip!",
			COOLDOWN = "Yeah!",
		},

		CARNIVAL_PLAZA_KIT = "The heart of a great carnival, just you wait!",
		CARNIVAL_PLAZA =
		{
			GENERIC = "Seems a bit... bleh.",
			LEVEL_2 = "Doesn't scream fun to me just yet.",
			LEVEL_3 = "Now this, this is a festival!",
		},

		CARNIVALDECOR_EGGRIDE_KIT = "Oh, looks neat.",
		CARNIVALDECOR_EGGRIDE = "Cool.",

		CARNIVALDECOR_LAMP_KIT = "What's a carnival without some proper lighting?",
		CARNIVALDECOR_LAMP = "There we are, lights!",
		CARNIVALDECOR_PLANT_KIT = "Oh cool, it's like a bonsai tree! I learned about them in Japan.",											  
		CARNIVALDECOR_PLANT = "I should get one of these for my room back in Podunk!",
		CARNIVALDECOR_BANNER_KIT = "This'll spice things up.",
		CARNIVALDECOR_BANNER = "Yep, nice and spicy.",

		CARNIVALDECOR_FIGURE =
		{
			RARE = "Sweet!",
			UNCOMMON = "Hmmm, could be better.",
			GENERIC = "Ugh. Just the same thing, over and over again.",
		},
		CARNIVALDECOR_FIGURE_KIT = "I wonder what it'll be?",
		CARNIVALDECOR_FIGURE_KIT_SEASON2 = "I wonder what it'll be?",														

        CARNIVAL_BALL = "It's genius in its simplicity.", --unimplemented
		CARNIVAL_SEEDPACKET = "Eh, it's not sunflower seeds, but it'll do.",
		CARNIVALFOOD_CORNTEA = "It's... new, I'll give you that.",
        CARNIVAL_VEST_A = "Pretty stylish... for a bunch of leaves.",
        CARNIVAL_VEST_B = "I'd rather not wear it.",
        CARNIVAL_VEST_C = "Do I have to wear this?",		  
        -- YOTB
        YOTB_SEWINGMACHINE = "Sewing can't be that hard... can it?",
        YOTB_SEWINGMACHINE_ITEM = "There looks to be a bit of assembly required.",
        YOTB_STAGE = "Strange, I never see him enter or leave...",
        YOTB_POST =  "This contest is going to go off without a hitch! Well, figuratively speaking.",
        YOTB_STAGE_ITEM = "It looks like a bit of building is in order.",
        YOTB_POST_ITEM =  "I'd better get that set up.",


        YOTB_PATTERN_FRAGMENT_1 = "If I put some of these together, I bet I could make a beefalo costume.",
        YOTB_PATTERN_FRAGMENT_2 = "If I put some of these together, I bet I could make a beefalo costume.",
        YOTB_PATTERN_FRAGMENT_3 = "If I put some of these together, I bet I could make a beefalo costume.",

        YOTB_BEEFALO_DOLL_WAR = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },
        YOTB_BEEFALO_DOLL_DOLL = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },
        YOTB_BEEFALO_DOLL_FESTIVE = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },
        YOTB_BEEFALO_DOLL_NATURE = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },
        YOTB_BEEFALO_DOLL_ROBOT = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },
        YOTB_BEEFALO_DOLL_ICE = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },
        YOTB_BEEFALO_DOLL_FORMAL = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },
        YOTB_BEEFALO_DOLL_VICTORIAN = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },
        YOTB_BEEFALO_DOLL_BEAST = {
            GENERIC = "Scientifically formulated for maximum huggableness.",
            YOTB = "I wonder what the Judge would say about this?",
        },


        WAR_BLUEPRINT = "How ferocious!",
        DOLL_BLUEPRINT = "My beefalo will look as cute as a button!",
        FESTIVE_BLUEPRINT = "This is just the occasion for some festivity!",
        ROBOT_BLUEPRINT = "This requires a suspicious amount of welding for a sewing project.",
        NATURE_BLUEPRINT = "You really can't go wrong with flowers.",
        FORMAL_BLUEPRINT = "This is a costume for some Grade A beefalo.",
        VICTORIAN_BLUEPRINT = "I think my grandmother wore something similar.",
        ICE_BLUEPRINT = "I usually like my beefalo fresh, not frozen.",
        BEAST_BLUEPRINT = "I'm feeling lucky about this one!",

        BEEF_BELL = "Those beefalo things seem to like it.",
		-- YOT Catcoon
		KITCOONDEN =
		{
			GENERIC = "You'd have to be pretty small to fit in there.",
            BURNT = "NOOOO!",
			PLAYING_HIDEANDSEEK = "Now where could they be...",
			PLAYING_HIDEANDSEEK_TIME_ALMOST_UP = "Not much time left! Where are they?!",
		},

		KITCOONDEN_KIT = "The whole kit and caboodle.",

		TICOON =
		{
			GENERIC = "He looks like he knows what he's doing!",
			ABANDONED = "I'm sure I can find them on my own.",
			SUCCESS = "Hey, he found one!",
			LOST_TRACK = "Someone else found them first.",
			NEARBY = "Looks like there's something nearby.",
			TRACKING = "I should follow his lead.",
			TRACKING_NOT_MINE = "He's leading the way for someone else.",
			NOTHING_TO_TRACK = "It doesn't look like there's anything left to find.",
			TARGET_TOO_FAR_AWAY = "They might be too far away for him to sniff out.",
		},

		YOT_CATCOONSHRINE =
        {
            GENERIC = "What to make...",
            EMPTY = "Maybe it would like a feather to play with...",
            BURNT = "Smells like scorched fur.",
        },

		KITCOON_FOREST = "Aren't you the cutest little cat thing!",
		KITCOON_SAVANNA = "Aren't you the cutest little cat thing!",
		KITCOON_MARSH = "I must collect more... for research!",
		KITCOON_DECIDUOUS = "Aren't you the cutest little cat thing!",
		KITCOON_GRASS = "Aren't you the cutest little cat thing!",
		KITCOON_ROCKY = "I must collect more... for research!",
		KITCOON_DESERT = "I must collect more... for research!",
		KITCOON_MOON = "I must collect more... for research!",
		KITCOON_YOT = "I must collect more... for research!",		
		-- Moon Storm
        ALTERGUARDIAN_PHASE1 = {
            GENERIC = "Watch out!",
            DEAD = "Is it... dead?",
        },
        ALTERGUARDIAN_PHASE2 = {
            GENERIC = "Not dead, not dead!",
            DEAD = "Phew...",
        },
        ALTERGUARDIAN_PHASE2SPIKE = "Ah! That almost hit me!",
        ALTERGUARDIAN_PHASE3 = "AH!! Help me help me help me!!",
        ALTERGUARDIAN_PHASE3TRAP = "Makes me sleepy.",
        ALTERGUARDIAN_PHASE3DEADORB = "Ugh...",
        ALTERGUARDIAN_PHASE3DEAD = "Ugh...",

        ALTERGUARDIANHAT = "Whoa... I understand, like, everything, now.",
        ALTERGUARDIANHATSHARD = "Teach me what you know.",

        MOONSTORM_GLASS = {
            GENERIC = "It's glassy.",
            INFUSED =  "This energy is from another world!"
        },

        MOONSTORM_STATIC = "Eh eh, watch the hair!",
        MOONSTORM_STATIC_ITEM = "It's like rubbing balloons in your hair.",
        MOONSTORM_SPARK = "Careful, Ninten.",

        BIRD_MUTANT = "Ah! What happened to you?!",
        BIRD_MUTANT_SPITTER = "Weird.",

        WAGSTAFF_NPC = "Another mad scientist, just what I needed.",
        ALTERGUARDIAN_CONTAINED = "So, what exactly are we using this energy for?",

        WAGSTAFF_TOOL_1 = "I don't even know what is. Whatever, just gotta get it back to the old man.",
        WAGSTAFF_TOOL_2 = "I don't even know what is. Whatever, just gotta get it back to the old man.",
        WAGSTAFF_TOOL_3 = "I didn't think books could get any lamer.",
        WAGSTAFF_TOOL_4 = "Dude. This is just a multitoo- you know what, NEVERMIND!",
        WAGSTAFF_TOOL_5 = "Whatever.",

        MOONSTORM_GOGGLESHAT = "I look ridiculous with this.",

        MOON_DEVICE = {
            GENERIC = "All this Moon stuff gives me the heeby-jeebies!",
            CONSTRUCTION1 = "It's not quite ready.",
            CONSTRUCTION2 = "We're getting somewhere now!",
        },

		-- Wanda
        POCKETWATCH_HEAL = {
			GENERIC = "What in the world? You're messing with nature, lady, and I don't like it!",
			RECHARGING = "It's doing a whole lot of nothing now.",
		},

        POCKETWATCH_REVIVE = {
			GENERIC = "You can break back the dead with that? Creepy! But also cool.",
			RECHARGING = "It ain't doing anything now.",
		},

        POCKETWATCH_WARP = {
			GENERIC = "How does it work?",
			RECHARGING = "Just a watch, for now.",
		},

        POCKETWATCH_RECALL = {
			GENERIC = "How does it work?",
			RECHARGING = "Just a watch now.",
			UNMARKED = "only_used_by_wanda",
			MARKED_SAMESHARD = "only_used_by_wanda",
			MARKED_DIFFERENTSHARD = "only_used_by_wanda",
		},

        POCKETWATCH_PORTAL = {
			GENERIC = "How does it work?",
			RECHARGING = "Nothing but your standard watch now.",
			UNMARKED = "only_used_by_wanda unmarked",
			MARKED_SAMESHARD = "only_used_by_wanda same shard",
			MARKED_DIFFERENTSHARD = "only_used_by_wanda other shard",
		},

        POCKETWATCH_WEAPON = {
			GENERIC = "Just don't use it on me and we're cool.",
			DEPLETED = "only_used_by_wanda",
		},

        POCKETWATCH_PARTS = "Just a bunch of junk that old, er, young, er... lady uses.",
        POCKETWATCH_DISMANTLER = "Think my dad has some of these tools in the garage somewhere.",

        POCKETWATCH_PORTAL_ENTRANCE = 
		{
			GENERIC = "Whooooa!",
			DIFFERENTSHARD = "Whooooa!",
		},
        POCKETWATCH_PORTAL_EXIT = "Hopefully I don't get trapped in time or something equally horrible...",

        -- Waterlog
        WATERTREE_PILLAR = "That's tree is huge, dude!",
        OCEANTREE = "Trees? In the ocean?",
        OCEANTREENUT = "Maybe I can make more water trees with this.",
        WATERTREE_ROOT = "I wonder how deep they go.",

        OCEANTREE_PILLAR = "Boy, you've sure grown a lot!",
        
        OCEANVINE = "Bet you I could climb my way to the top!",
        FIG = "Sometimes we'd have these for Christmas. I was never really a fan.",
        FIG_COOKED = "Yeah, I'm still not a fan.",

        SPIDER_WATER = "Get awaaaaay get awaaaaay!!",
        MUTATOR_WATER = "Dude. Why.",
        OCEANVINE_COCOON = "I'd rather not, you know.",
        OCEANVINE_COCOON_BURNT = "Whoops. Oh well.",

        GRASSGATOR = "What kind of animal are you?",

        TREEGROWTHSOLUTION = "It seems to help trees grow!",

        FIGATONI = "Ugh. Just give me raw veggies, dude.",
        FIGKABAB = "It's not bad, actually.",
        KOALEFIG_TRUNK = "Do I have to?",
        FROGNEWTON = "Well, it was the frog or me. I guess.",

        -- The Terrorarium
        TERRARIUM = {
            GENERIC = "That thing gives me a bad feeling.",
            CRIMSON = "I really don't trust this.",
            ENABLED = "I did something?",
			WAITING_FOR_DARK = "Something tell me I won't be getting much sleep tonight.",
			COOLDOWN = "It's doing a whole lot of nothing.",
			SPAWN_DISABLED = "Huh. Think I broke it.",
        },

        -- Wolfgang
        MIGHTY_GYM = 
        {
            GENERIC = "I don't need to work out.",
            BURNT = "Well.",
        },

        DUMBBELL = "Too heavy for me!",
        DUMBBELL_GOLDEN = "I wonder if I could pawn that once I get out of here.",
		DUMBBELL_MARBLE = "I'm way too small for that.",
        DUMBBELL_GEM = "Looks more like a murder weapon than for exercise!",																						
        POTATOSACK = "Some sort of potato sack.",


        TERRARIUMCHEST = 
		{
			GENERIC = "I wonder what's inside.",
			BURNT = "Nothing's inside it now.",
			SHIMMER = "That seems a bit out of place...",
		},
		EYEMASKHAT = "Looks painful. No thanks.",

        EYEOFTERROR = "That is some nightmare fuel!",
        EYEOFTERROR_MINI = "I don't like how it's staring at me.",
        EYEOFTERROR_MINI_GROUNDED = "I don't trust that.",
														 
        FROZENBANANADAIQUIRI = "Looks yummy!",
        BUNNYSTEW = "Stew is alright, I guess.",
        MILKYWHITES = "Yuck.",

        CRITTER_EYEOFTERROR = "What are you looking at?",

        SHIELDOFTERROR ="It's a weapon, it's a shield, what more could you want?",
        TWINOFTERROR1 = "Are you one of Giygas' robots?",
        TWINOFTERROR2 = "Are you one of Giygas' robots?",			 						
	
	-- Year of the Catcoon
        CATTOY_MOUSE = "Mice with wheels, what will science think up next?",
        KITCOON_NAMETAG = "I should think of some names! Let's see, Wilson Jr., Wilson Jr. 2...",

		KITCOONDECOR1 =
        {
            GENERIC = "It's not a real bird, but the kits don't know that.",
            BURNT = "Combustion!",
        },
		KITCOONDECOR2 =
        {
            GENERIC = "Those kits are so easily distracted. Now what was I doing again?",
            BURNT = "It went up in flames.",
        },

		KITCOONDECOR1_KIT = "It looks like there's some assembly required.",
		KITCOONDECOR2_KIT = "It doesn't look too hard to build.",

        -- WX78
        WX78MODULE_MAXHEALTH = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_MAXSANITY1 = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_MAXSANITY = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_MOVESPEED = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_MOVESPEED2 = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_HEAT = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_NIGHTVISION = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_COLD = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_TASER = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_LIGHT = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_MAXHUNGER1 = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_MAXHUNGER = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_MUSIC = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_BEE = "Great Grandpa probably understands this junk better than me.",
        WX78MODULE_MAXHEALTH2 = "Great Grandpa probably understands this junk better than me.",

        WX78_SCANNER =
        {
            GENERIC ="Robots are weird.",
            HUNTING = "It's looking for something.",
            SCANNING = "Whatcha scanning?",
        },

        WX78_SCANNER_ITEM = "This thing's scans are harmless, right?",
        WX78_SCANNER_SUCCEEDED = "It found something!",

        WX78_MODULEREMOVER = "Looks like junk.",

        SCANDATA = "Mumbo-jumbo.",

        -- Pirates
        BOAT_ROTATOR = "Don't spin it too fast!",
        BOAT_ROTATOR_KIT = "For spinning. Duh.",
        BOAT_BUMPER_KELP = "Anyone for a little game of bumper-boats?",
        BOAT_BUMPER_KELP_KIT = "It probably works like a car's.",
        BOAT_BUMPER_SHELL = "I'm unstoppable!",
        BOAT_BUMPER_SHELL_KIT = "It probably works like a car's.",
        BOAT_CANNON = {
            GENERIC = "No ammo, but at least it's intimidating!",
            AMMOLOADED = "Yaaar!",
        },
        BOAT_CANNON_KIT = "Now I just need a boat.",
        CANNONBALL_ROCK_ITEM = "I'll use it for a cannon.",

        OCEAN_TRAWLER = {
            GENERIC = "I'll caught lots of seafood now.",
            LOWERED = "Hopefully I found something.",
            CAUGHT = "Gotcha!",
            ESCAPED = "My food!",
            FIXED = "You won't escape this time.",
        },
        OCEAN_TRAWLER_KIT = "Here fishy fishies!",

        BOAT_MAGNET =
        {
            GENERIC = "I think it's a magnet.",
            ACTIVATED = "Doing magnet things.",
        },
        BOAT_MAGNET_KIT = "I don't what I'm doing with it.",

        BOAT_MAGNET_BEACON =
        {
            GENERIC = "It attracts magnets!",
            ACTIVATED = "Look at it go!",
        },
        DOCK_KIT = "About time we got a dock.",
        DOCK_WOODPOSTS_ITEM = "Yeah, supports seemed important.",

        MONKEYHUT = "Tropical.",
        POWDER_MONKEY = "Hands off my stuff!",
        PRIME_MATE = "Must be their leader.",
		LIGHTCRAB = "Whoa!",
        CUTLESS = "It's the thought that counts.",
        CURSED_MONKEY_TOKEN = "What's thins?",
        OAR_MONKEY = "One of these days I'll get my hands an actual bat.",
        BANANABUSH = "I thought they grew on trees.",
        DUG_BANANABUSH = "Where to put you?",
        PALMCONETREE = "Never seen a palm tree quite like it.",
        PALMCONE_SEED = "I should plant it.",
        PALMCONE_SAPLING = "Grow!!",
        PALMCONE_SCALE = "It's sturdy.",
        MONKEYTAIL = "The things I do to survive.",
        DUG_MONKEYTAIL = "The things I do to survive.",

        MONKEY_MEDIUMHAT = "I knew I'd be an awesome captain.",
        MONKEY_SMALLHAT = "Yaaaar, matey!",
        POLLY_ROGERSHAT = "I look. Awesome.",
        POLLY_ROGERS = "My very own parrot!",

        MONKEYISLAND_PORTAL = "Looks like trouble.",
        MONKEYISLAND_PORTAL_DEBRIS = "I don't know what that scientist dude is up to, but I don't like it.",
        MONKEYQUEEN = "It's the queen!",
        MONKEYPILLAR = "Pretty.",
        PIRATE_FLAG_POLE = "Here be pirates.",

        BLACKFLAG = "Don't mess with Captain Ninten!",
        PIRATE_STASH = "Treasure!",
        STASH_MAP = "A treasure map!",

														 

        BANANAJUICE = "I prefer OJ to be honest.",
														 
																   
    },

    DESCRIBE_GENERIC = "Er, what's that?",
    DESCRIBE_TOODARK = "What am I, an owl? I can't see it!",
    DESCRIBE_SMOLDERING = "That's a fire hazard!",

    DESCRIBE_PLANTHAPPY = "It's happy.",
    DESCRIBE_PLANTVERYSTRESSED = "What's stressing it out so much?",
    DESCRIBE_PLANTSTRESSED = "Something has it upset.",
    DESCRIBE_PLANTSTRESSORKILLJOYS = "I need to do something about those weeds, huh?",
    DESCRIBE_PLANTSTRESSORFAMILY = "It needs other plants of the same type.",
    DESCRIBE_PLANTSTRESSOROVERCROWDING = "There's not enough nutrients to go around.",
    DESCRIBE_PLANTSTRESSORSEASON = "I guess this is a bad season to grow these.",
    DESCRIBE_PLANTSTRESSORMOISTURE = "I need to water my plants.",
    DESCRIBE_PLANTSTRESSORNUTRIENTS = "Some fertilzer might help.",
    DESCRIBE_PLANTSTRESSORHAPPINESS = "I should encourage it.",

    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "Sorry little guy, it was me or you...",
		WINTERSFEASTFUEL = "Mmmmmmm...",
    },
}
