PrefabFiles = {
	"willar",
	"willar_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/gramninten.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/gramninten.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/gramninten.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/gramninten.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/gramninten_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/gramninten_silho.xml" ),

    Asset( "IMAGE", "bigportraits/gramninten.tex" ),
    Asset( "ATLAS", "bigportraits/gramninten.xml" ),
	
	Asset( "IMAGE", "bigportraits/gramninten_none.tex" ),
    Asset( "ATLAS", "bigportraits/gramninten_none.xml" ),
	
	
	Asset( "IMAGE", "images/map_icons/gramninten.tex" ),
	Asset( "ATLAS", "images/map_icons/gramninten.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_gramninten.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_gramninten.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_gramninten.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_gramninten.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_gramninten.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_gramninten.xml" ),
	
	Asset( "IMAGE", "images/names_gramninten.tex" ),
    Asset( "ATLAS", "images/names_gramninten.xml" ),
	
	Asset( "IMAGE", "images/names_gold_gramninten.tex" ),
    Asset( "ATLAS", "images/names_gold_gramninten.xml" ),
}

AddMinimapAtlas("images/map_icons/gramninten.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local TUNING = GLOBAL.TUNING
local RECIPETABS = GLOBAL.RECIPETABS
local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH
--local TheWorld = GLOBAL.TheWorld

-- The character select screen lines
STRINGS.CHARACTER_TITLES.gramninten = "The Original"
STRINGS.CHARACTER_NAMES.gramninten = "Willar"
STRINGS.CHARACTER_DESCRIPTIONS.gramninten = "*Gifted with Powers\n*Dresses with Style\n*Lovable Asthmatic"
STRINGS.CHARACTER_QUOTES.gramninten = "\"Now that the Earth's crisis is over...\""
STRINGS.CHARACTER_SURVIVABILITY.gramninten = "Slim"

STRINGS.SKIN_DESCRIPTIONS.gramninten_none = "Ninten's favorite outfit."

-- Custom speech strings
STRINGS.CHARACTERS.GRAMNINTEN = require "speech_gramninten"

-- The character's name as appears in-game 
STRINGS.NAMES.GRAMNINTEN = "Willar"
STRINGS.SKIN_NAMES.gramninten_none = "Willar"

-- The skins shown in the cycle view window on the character select screen.
-- A good place to see what you can put in here is in skinutils.lua, in the function GetSkinModes
local skin_modes = {
    { 
        type = "ghost_skin",
        anim_bank = "ghost",
        idle_anim = "idle", 
        scale = 0.75, 
        offset = { 0, -25 } 
    },
}

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("gramninten", "MALE", skin_modes)


--RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/nintens_coat.xml"), "nintens_coat.tex")

GLOBAL.FOODTYPE.NIGHTMAREFUEL = "NIGHTMAREFUEL" --DST is EXTREMELY picky about how it handles new edibles...

local function SetNightmareFuelEdible(inst)
    if not GLOBAL.TheWorld.ismastersim then return end

    inst:AddComponent("edible")
    inst.components.edible.foodtype = "NIGHTMAREFUEL"
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = 0
end

AddPrefabPostInit("nightmarefuel", SetNightmareFuelEdible)
AddPrefabPostInit("horrorfuel", SetNightmareFuelEdible)