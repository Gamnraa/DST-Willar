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
    "willarsquire",
    "guardmonkey",
    "guardpowdermonkey",
    "guardmonkeytower",
    "umbramonkeywarrior",
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
GLOBAL.PIRATE_WEAPONS = {
	["cutless"] = true,
	--["nightsword"] = true,
	["willarsword"] = true,
	["oar_monkey"] = true,
	["glasscutter"] = true,
	["sword_lunarplant"] = true,
}

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


modimport("scripts/willarskilltree")
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
    inst:AddComponent("tradable")
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

AddComponentAction("SCENE", "constructionsite", function(inst, doer, actions, right)
    if inst.prefab == "willartapestry" and doer.prefab == "wilson" then
        print("true")
        inst.replica.constructionsite:SetEnabled(true)
    else
        print("untrue")
        inst.replica.constructionsite:SetEnabled(false)
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
			if v[2] < 1.00 then 
                chanceloot[v[1]] = v[2]
            else
                table.insert(GLOBAL.Gram_LootDropped[inst.GUID], v[1]) 
            end
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
local function AddDashAttack(inst)
    inst:AddTag("aoeweapon_lunge")

    local function Lightning_ReticuleTargetFn()
        --Cast range is 8, leave room for error (6.5 lunge)
        return GLOBAL.Vector3(GLOBAL.ThePlayer.entity:LocalToWorldSpace(6.5, 0, 0))
    end

    local function Lightning_ReticuleMouseTargetFn(inst, mousepos)
        if mousepos ~= nil then
            local x, y, z = inst.Transform:GetWorldPosition()
            local dx = mousepos.x - x
            local dz = mousepos.z - z
            local l = dx * dx + dz * dz
            if l <= 0 then
                return inst.components.reticule.targetpos
            end
            l = 6.5 / math.sqrt(l)
            return GLOBAL.Vector3(x + dx * l, 0, z + dz * l)
        end
    end

    local function Lightning_ReticuleUpdatePositionFn(inst, pos, reticule, ease, smoothing, dt)
        local x, y, z = inst.Transform:GetWorldPosition()
        reticule.Transform:SetPosition(x, 0, z)
        local rot = -math.atan2(pos.z - z, pos.x - x) / GLOBAL.DEGREES
        if ease and dt ~= nil then
            local rot0 = reticule.Transform:GetRotation()
            local drot = rot - rot0
            rot = GLOBAL.Lerp((drot > 180 and rot0 + 360) or (drot < -180 and rot0 - 360) or rot0, rot, dt * smoothing)
        end
        reticule.Transform:SetRotation(rot)
    end

    local function Lightning_OnLunged(inst, doer, startingpos, targetpos)
        local fx = SpawnPrefab("spear_wathgrithr_lightning_lunge_fx")
        fx.Transform:SetPosition(targetpos:Get())
        fx.Transform:SetRotation(doer:GetRotation())

        inst.components.rechargeable:Discharge(inst._cooldown)

        inst._lunge_hit_count = nil
    end

    local function Lightning_SpellFn(inst, doer, pos)
        doer:PushEvent("combat_lunge", { targetpos = pos, weapon = inst })
    end

    local function Lightning_OnLungedHit(inst, doer, target)
        inst._lunge_hit_count = inst._lunge_hit_count or 0

        if inst._lunge_hit_count < TUNING.SPEAR_WATHGRITHR_LIGHTNING_CHARGED_MAX_REPAIRS_PER_LUNGE and
            inst.components.upgradeable == nil and
            doer.IsValidVictim ~= nil and
            doer.IsValidVictim(target)
        then
            inst.components.finiteuses:Repair(TUNING.SPEAR_WATHGRITHR_LIGHTNING_CHARGED_LUNGE_REPAIR_AMOUNT)
            inst._lunge_hit_count = inst._lunge_hit_count + 1
        end
    end

    inst:AddComponent("aoetargeting")
    inst.components.aoetargeting:SetAllowRiding(false)
    inst.components.aoetargeting.reticule.reticuleprefab = "reticuleline"
    inst.components.aoetargeting.reticule.pingprefab = "reticulelineping"
    inst.components.aoetargeting.reticule.targetfn = Lightning_ReticuleTargetFn
    inst.components.aoetargeting.reticule.mousetargetfn = Lightning_ReticuleMouseTargetFn
    inst.components.aoetargeting.reticule.updatepositionfn = Lightning_ReticuleUpdatePositionFn
    inst.components.aoetargeting.reticule.validcolour = { 1, .75, 0, 1 }
    inst.components.aoetargeting.reticule.invalidcolour = { .5, 0, 0, 1 }
    inst.components.aoetargeting.reticule.ease = true
    inst.components.aoetargeting.reticule.mouseenabled = true

    if not GLOBAL.TheWorld.ismastersim then return end

    local oldequip = inst.components.equippable.onequipfn
    inst.components.equippable:SetOnEquip(function(inst, owner)
        if not owner:HasTag("player") then return end
        oldequip(inst, owner)
        inst.components.aoetargeting:SetEnabled(GLOBAL.GramHasSkill(owner, "swashbuck"))
    end)

    local oldunequip = inst.components.equippable.onunequipfn
    inst.components.equippable:SetOnUnequip(function(inst, owner)
        if not owner:HasTag("player") then return end
        oldunequip(inst, owner)
        inst.components.aoetargeting:SetEnabled(GLOBAL.GramHasSkill(owner, "swashbuck"))
    end)

    inst.components.aoetargeting:SetEnabled(false)

    inst:AddComponent("aoeweapon_lunge")
    inst.components.aoeweapon_lunge:SetDamage(TUNING.SPEAR_WATHGRITHR_LIGHTNING_LUNGE_DAMAGE)
    inst.components.aoeweapon_lunge:SetSound("meta3/wigfrid/spear_lighting_lunge")
    inst.components.aoeweapon_lunge:SetSideRange(1)
    --inst.components.aoeweapon_lunge:SetOnLungedFn(Lightning_OnLunged)
    inst.components.aoeweapon_lunge:SetOnHitFn(Lightning_OnLungedHit)
    --inst.components.aoeweapon_lunge:SetStimuli("electric")
    inst.components.aoeweapon_lunge:SetWorkActions()
    inst.components.aoeweapon_lunge:SetTags("_combat")


    inst:AddComponent("aoespell")
    inst.components.aoespell:SetSpellFn(Lightning_SpellFn)
end

AddPrefabPostInit("cutless", AddDashAttack)
--AddPrefabPostInit("nightsword", AddDashAttack)
AddPrefabPostInit("willarsword", AddDashAttack)
AddPrefabPostInit("oar_monkey", AddDashAttack)
AddPrefabPostInit("glasscutter", AddDashAttack)
AddPrefabPostInit("sword_lunarplant", AddDashAttack)

modimport("scripts/diplorelations")
modimport("scripts/upsurper")

--Recipes
modimport("scripts/willarrecipes")

