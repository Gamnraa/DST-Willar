PrefabFiles = {
	"willar",
	"willar_none",
    "willarcrown",
    "willarsword",
    "monkeyball",
    "monkeydisguise",
    "farmermonkey",
    "farmermonkeypod",
    "willartapestry",
    --"skilltree_willar"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/willar.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/willar.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/willar.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/willar.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/willar_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/willar_silho.xml" ),

    Asset( "IMAGE", "bigportraits/willar.tex" ),
    Asset( "ATLAS", "bigportraits/willar.xml" ),

    Asset( "IMAGE", "bigportraits/willar_none.tex" ),
    Asset( "ATLAS", "bigportraits/willar_none.xml" ),
	
	
	Asset( "IMAGE", "images/map_icons/willar.tex" ),
	Asset( "ATLAS", "images/map_icons/willar.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_willar.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_willar.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_willar.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_willar.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_willar.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_willar.xml" ),
	
	Asset( "IMAGE", "images/names_willar.tex" ),
    Asset( "ATLAS", "images/names_willar.xml" ),
	
	Asset( "IMAGE", "images/names_gold_willar.tex" ),
    Asset( "ATLAS", "images/names_gold_willar.xml" ),

    Asset( "IMAGE", "images/inventoryimages/willarsword.tex" ),
	Asset( "ATLAS", "images/inventoryimages/willarsword.xml" ),

    Asset( "IMAGE", "images/inventoryimages/willarcrown.tex" ),
	Asset( "ATLAS", "images/inventoryimages/willarcrown.xml" ),

    Asset( "IMAGE", "images/inventoryimages/willarcrown_ruins.tex" ),
	Asset( "ATLAS", "images/inventoryimages/willarcrown_ruins.xml" ),

    Asset( "IMAGE", "images/inventoryimages/monkeydisguise.tex" ),
	Asset( "ATLAS", "images/inventoryimages/monkeydisguise.xml" ),

    Asset( "IMAGE", "images/inventoryimages/farmermonkeypod.tex" ),
	Asset( "ATLAS", "images/inventoryimages/farmermonkeypod.xml" ),

    Asset( "IMAGE", "images/inventoryimages/willarblanket.tex" ),
	Asset( "ATLAS", "images/inventoryimages/willarblanket.xml" ),

    Asset( "IMAGE", "images/inventoryimages/monkeybarrelrecipe.tex" ),
	Asset( "ATLAS", "images/inventoryimages/monkeybarrelrecipe.xml" ),

    Asset( "IMAGE", "images/inventoryimages/monkeyhutrecipe.tex" ),
	Asset( "ATLAS", "images/inventoryimages/monkeyhutrecipe.xml" ),

    Asset( "IMAGE", "images/willar_skilltree.tex"),
    Asset( "ATLAS", "images/willar_skilltree.xml"),
}

AddMinimapAtlas("images/map_icons/willar.xml")


GLOBAL.IsWillarLeader = function(inst) return inst.components.follower and inst.components.follower.leader and inst.components.follower.leader:HasTag("willar") end
local IsWillarLeader = GLOBAL.IsWillarLeader

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local TUNING = GLOBAL.TUNING
local RECIPETABS = GLOBAL.RECIPETABS
local Ingredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS
--local TheWorld = GLOBAL.TheWorld

-- The character select screen lines
STRINGS.CHARACTER_TITLES.willar = "The Usurper"
STRINGS.CHARACTER_NAMES.willar = "Willar"
STRINGS.CHARACTER_DESCRIPTIONS.willar = "*Easily misunderstood, has a dark side\n*Is a monkey, with BIG ideas\n*Is both a warrior and king (sorta)"
STRINGS.CHARACTER_QUOTES.willar = "\"...\""
STRINGS.CHARACTER_SURVIVABILITY.willar = "Slim"

TUNING.WILLAR_HEALTH = 150
TUNING.WILLAR_HUNGER = 150
TUNING.WILLAR_SANITY = 130


-- Custom speech strings
STRINGS.CHARACTERS.WILLAR = {}

-- The character's name as appears in-game 
STRINGS.NAMES.WILLAR = "Willar"
STRINGS.SKIN_NAMES.willar_none = "Willar"

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

GLOBAL.GramHasSkill = function(inst, skill)
    return inst.components.skilltreeupdater:IsActivated(skill)
end


--modimport("scripts/willarskilltree")
modimport("scripts/strings")
-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("willar", "MALE", skin_modes)

RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/willarsword.xml"), "willarsword.tex")
RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/willarcrown.xml"), "willarcrown.tex")
RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/willarcrown_ruins.xml"), "willarcrown_ruins.tex")
RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/monkeydisguise.xml"), "monkeydisguise.tex")

local FOODTYPE = GLOBAL.FOODTYPE
FOODTYPE.NIGHTMAREFUEL = "NIGHTMAREFUEL" --DST is EXTREMELY picky about how it handles new edibles...

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

local NIGHTVISION_COLOURCUBES =
{
    day = "images/colour_cubes/mole_vision_off_cc.tex",
    dusk = "images/colour_cubes/mole_vision_on_cc.tex",
    night = "images/colour_cubes/mole_vision_on_cc.tex",
    full_moon = "images/colour_cubes/mole_vision_off_cc.tex",
}
AddClientModRPCHandler("willarstatewatcher", "onworldstatechange", function(inst, isnightmare)

    print(isnightmare, GLOBAL.TheWorld.state.isnight)
    if isnightmare and (GLOBAL.TheWorld.state.isnight or GLOBAL.TheWorld:HasTag("cave")) then
        inst.components.playervision:PushForcedNightVision(inst, 2, NIGHTVISION_COLOURCUBES, false)
    else
        inst.components.playervision:PopForcedNightVision(inst)
    end
end)


--Code related to taming monkeys
modimport("scripts/monkeytaming")

--Code related to the blanket
local function tapestry_rpc(inst, key)
    inst.willartapestrykey = key
end
AddModRPCHandler("GramWillarTapestryRPC", "GramWillarTapestry", tapestry_rpc)

AddSimPostInit(function()
    GLOBAL.TheInput:AddKeyHandler(function(key, down)
        --I'm gonna be nice for once
        if not GLOBAL.ThePlayer then return end
        if key == GLOBAL.KEY_LALT and down then
            GLOBAL.ThePlayer.willartapestrykey = GLOBAL.KEY_ALT
            if not GLOBAL.TheWorld.ismastersim then
                GLOBAL.SendModRPCToServer(GLOBAL.GetModRPC("GramWillarTapestryRPC", "GramWillarTapestry"), GLOBAL.KEY_ALT)
            end
        elseif key == GLOBAL.KEY_LALT and not down then
            GLOBAL.ThePlayer.willartapestrykey = nil
            if not GLOBAL.TheWorld.ismastersim then
                GLOBAL.SendModRPCToServer(GLOBAL.GetModRPC("GramWillarTapestryRPC", "GramWillarTapestry"), nil)
            end
        end
    end)
end)

modimport("scripts/willarstates")

local oldconstructstrfn = GLOBAL.ACTIONS.CONSTRUCT.strfn

GLOBAL.ACTIONS.CONSTRUCT.strfn = function(act)
    return act.target.prefab == "willartapestry" and "TURNON" or oldconstructstrfn(act)
end

local sleepinfn = GLOBAL.ACTIONS.SLEEPIN.fn
AddAction("SLEEPBLANKET", "Sleep", GLOBAL.ACTIONS.SLEEPIN.fn)
GLOBAL.ACTIONS.SLEEPBLANKET.priority = 10

AddComponentAction("SCENE", "doubleactionfix", function(inst, doer, actions, right)
    if doer.willartapestrykey == GLOBAL.KEY_ALT and (doer:HasTag("player") and not doer:HasTag("insomniac") and not inst:HasTag("hassleeper")) and
        (not inst:HasTag("spiderden") or doer:HasTag("spiderwhisperer")) then
            table.insert(actions, GLOBAL.ACTIONS.SLEEPBLANKET)
    end
end)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.SLEEPBLANKET, function(inst, action) return "willar_blanket" end))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.SLEEPBLANKET, "willar_blanket"))

--Code related to the sword looting ability
GLOBAL.Gram_DroppedChanceLoot = {}
GLOBAL.Gram_LootDropped = {}
local function onspawnloot(inst, data)
    if not inst.components.health then return end 
    if not inst.components.health:IsDead() then return end

    if not GLOBAL.Gram_LootDropped[inst.GUID] then GLOBAL.Gram_LootDropped[inst.GUID] = {} end

    local lootdropper = inst.components.lootdropper
    local chanceloot = {}

    local t = GLOBAL.LootTables[lootdropper.chanceloottable]
	if t then
		for k, v in pairs(GLOBAL.LootTables[lootdropper.chanceloottable]) do
			if v[2] < 1.00 then chanceloot[v[1]] = v[2] end
            print(v[1])
		end
	end
    
    if data.loot and chanceloot[data.loot.prefab] then
        GLOBAL.Gram_DroppedChanceLoot[inst.GUID] = true
    else
        table.insert(GLOBAL.Gram_LootDropped[inst.GUID], data.loot.prefab)
    end
end

AddPrefabPostInitAny(function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    if inst.components.lootdropper then
        inst:ListenForEvent("loot_prefab_spawned", onspawnloot)
    end
end)

--Farmer Pod widget
local containers = require("containers")
local farmerpod = 
{
    widget = {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        animbank_upgraded = "ui_chest_upgraded_3x3",
        animbuild_upgraded = "ui_chest_upgraded_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}

for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(farmerpod.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

containers.params.farmerpod = farmerpod

function containers.params.farmerpod.itemtestfn(container, item, slot)
	return (item:HasTag("deployedfarmplant") or item:HasTag("weighable_OVERSIZEDVEGGIES") or item:HasTag("edible_"..FOODTYPE.VEGGIE) or item:HasTag("cutgrass") or item:HasTag("twigs"))
end


--Swashbuckler dash
AddComponentAction("POINT", "piratelunge", function(inst, doer, pos, actions, right, target)
    if GLOBAL.GramHasSKill(doer, "swashbuck") then
        table.insert(actions, GLOBAL.ACTIONS.CASTAOE)
    end
end)

local function AddDashAttack(inst)
    inst:AddComponent("piratelunge")
    inst:AddTag("aoeweapon_lunge")
end

AddPrefabPostInit("cutless", AddDashAttack)
AddPrefabPostInit("nightsword", AddDashAttack)
AddPrefabPostInit("willarsword", AddDashAttack)
AddPrefabPostInit("oar_monkey", AddDashAttack)
AddPrefabPostInit("glasscutter", AddDashAttack)
AddPrefabPostInit("sword_lunarplant", AddDashAttack)

--Recipes
AddCharacterRecipe("cutless",
	{Ingredient("boards", 1),
	 Ingredient("rope", 1),
     Ingredient("log", 1)
    },
	 GLOBAL.TECH.SEAFARING_ONE,
	 {
		product = "cutless",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"WEAPONS",
	})
STRINGS.RECIPE_DESC.CUTLESS = "A sword for stealing riches."

AddCharacterRecipe("willarsword",
	{Ingredient("cutless", 1),
	 Ingredient("thulecite", 2),
     Ingredient("goldnugget", 3)
    },
	 GLOBAL.TECH.ANCIENT_TWO,
	 {
		product = "willarsword",
		builder_tag = "willar",
		numtogive = 1,
        description = "Luicas"
	},
	{
		"WEAPONS",
	})
STRINGS.RECIPE_DESC.WILLARSWORD = "A sword made of riches, for taking lives."


AddCharacterRecipe("monkeydisguise",
	{Ingredient("cave_banana", 2),
	 Ingredient("twigs", 2),
     Ingredient("beardhair", 2)
    },
	 GLOBAL.TECH.SCIENCE_TWO,
	 {
		product = "monkeydisguise",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"CLOTHING", "MAGIC"
	})
STRINGS.RECIPE_DESC.MONKEYDISGUISE = "Look like the best."

AddCharacterRecipe("willarcrown",
	{Ingredient("cave_banana", 3),
	 Ingredient("goldnugget", 3),
     Ingredient("nightmarefuel", 2)
    },
	 GLOBAL.TECH.MAGIC_THREE,
	 {
		product = "willarcrown",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"ARMOUR", "MAGIC"
	})
STRINGS.RECIPE_DESC.WILLARCROWN = "Good start, helps kings lead."

AddCharacterRecipe("willarcrown_ruins",
	{Ingredient("willarcrown", 1),
	 Ingredient("thulecite", 3),
     Ingredient("dreadstone", 1)
    },
	 GLOBAL.TECH.ANCIENT_TWO,
	 {
		product = "willarcrown_ruins",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"ARMOUR", "MAGIC"
	})
STRINGS.RECIPE_DESC.WILLARCROWN_RUINS = "The real deal, fit for a king."

AddCharacterRecipe("farmermonkeypod",
	{Ingredient("boards", 4),
	 Ingredient("cave_banana", 4),
     Ingredient("strawhat", 1)
    },
	 GLOBAL.TECH.SCIENCE_TWO,
	 {
		placer = "farmermonkeypod_placer",
		builder_tag = "willar",
		numtogive = 1,
        atlas = "images/inventoryimages/farmermonkeypod.xml",
        image = "farmermonkeypod.tex"
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.FARMERMONKEYPOD = "Handles all the busywork."

AddCharacterRecipe("monkeybarrel",
	{Ingredient("boards", 2),
	 Ingredient("poop", 4),
     Ingredient("cave_banana", 4)
    },
	 GLOBAL.TECH.SCIENCE_TWO,
	 {
		placer = "monkeybarrel_placer",
		builder_tag = "willar",
		numtogive = 1,
        atlas = "images/inventoryimages/monkeybarrelrecipe.xml",
        image = "monkeybarrelrecipe.tex"
        
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.MONKEYBARREL = "A barrel of friends."

AddCharacterRecipe("monkeyhut",
	{Ingredient("boards", 2),
	 Ingredient("rocks", 4),
     Ingredient("palmcone_scale", 2)
    },
	 GLOBAL.TECH.SEAFARING_ONE,
	 {
		placer = "monkeyhut_placer",
		builder_tag = "willar",
		numtogive = 1,
        atlas = "images/inventoryimages/monkeyhutrecipe.xml",
        image = "monkeyhutrecipe.tex"
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.MONKEYHUT = "Subjects from across the big lake."

AddCharacterRecipe("willartapestry",
    {Ingredient("goldnugget", 3),
     Ingredient("beefalowool", 3),
     Ingredient("cave_banana", 2)
    },
    GLOBAL.TECH.SCIENCE_TWO,
    {
        placer = "willartapestry_placer",
        builder_tag = "willar",
        numtogive = 1,
        atlas = "images/inventoryimages/willarblanket.xml",
        image = "willarblanket.tex"
    },
    {
        "STRUCTURES",
    })
STRINGS.RECIPE_DESC.WILLARTAPESTRY = "Looks comfy, and magical."
