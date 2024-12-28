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
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS
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

local function ShouldMonkeyAccept(inst, item, giver)
    if inst.components.health and inst.components.health:IsDead() then
        return false, "DEAD"
    end

    return 
        (giver:HasTag("willar") and inst.components.eater:CanEat(item)) or
        (item.components.equippable and item.components.equippable.equipslot == EQUIPSLOTS.HEAD)
end

local monkeybrain = require "brains/monkeybrain"
local monkeynightmarebrain = require "brains/nightmaremonkeybrain"
local willarmonkeybrain = require "brains/willarmonkeybrain"

local function OnMonkeyGetItem(inst, giver, item)
    if inst.components.eater:CanEat(item) then
        inst.components.eater:Eat(item)

        if item:HasTag("monkeyqueenbribe") then
            if inst.components.combat.target == giver then
                inst.components.combat:SetTarget(nil)
            end

            giver:PushEvent("makefriend")
            giver.components.leader:AddFollower(inst)
            inst.components.follower:AddLoyaltyTime(240)
            inst:SetBrain(willarmonkeybrain)

            if inst.prefab == "monkey" then
                inst:WatchWorldState("nighmarephase", function()
                    inst:DoTaskInTime(0, function() inst:SetBrain(willarmonkeybrain) end)
                end)
                inst:ListenForEvent("ms_forcenightmarestate", function()
                    inst:DoTaskInTime(0, function() inst:SetBrain(willarmonkeybrain) end)
                end)
                inst:ListenForEvent("ms_forcenightmarestate", function()
                    inst:DoTaskInTime(0, function() inst:SetBrain(willarmonkeybrain) end)
                end)
            end

            inst:ListenForEvent("loseloyalty", function() 
                if inst.prefab == "monkey" then
                    inst:SetBrain(inst:HasTag("nightmare") and monkeynightmarebrain or monkeybrain)
                end
            end)
        end
    elseif item.components.equippable and item.components.equippable.equipslot == EQUIPSLOTS.HEAD then
        local current = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if current ~= nil then
            inst.components.inventory:DropItem(current)
        end
        inst.components.inventory:Equip(item)
        inst.AnimState:Show("hat")
    end
end

local function OnMonkeyRefuseItem(inst, item)
    inst.sg:GoToState("taunt")
    if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
    end
end

--Straight from Spider logic
local function HasFriendlyLeader(inst, target)
    local leader = inst.components.follower.leader
    local target_leader = (target.components.follower ~= nil) and target.components.follower.leader or nil
    
    if leader ~= nil and target_leader ~= nil then

        if target_leader.components.inventoryitem then
            target_leader = target_leader.components.inventoryitem:GetGrandOwner()
            -- Don't attack followers if their follow object has no owner
            if target_leader == nil then
                return true
            end
        end

        local PVP_enabled = TheNet:GetPVPEnabled()
        return leader == target or (target_leader ~= nil 
                and (target_leader == leader or (target_leader:HasTag("player") 
                and not PVP_enabled))) or
                (target.components.domesticatable and target.components.domesticatable:IsDomesticated() 
                and not PVP_enabled) or
                (target.components.saltlicker and target.components.saltlicker.salted
                and not PVP_enabled)
    
    elseif target_leader ~= nil and target_leader.components.inventoryitem then
        -- Don't attack webber's chester
        target_leader = target_leader.components.inventoryitem:GetGrandOwner()
        return target_leader ~= nil and target_leader:HasTag("willar")
    end

    return false
end

local function NewMonkeyRetarget(inst)
    return GLOBAL.FindEntity(
        inst, 20, function(guy)
            return inst.components.combat:CanTarget(guy)
            and not (inst.components.follower and inst.components.follower.leader == guy)
            and not HasFriendlyLeader(inst, guy)
            and not (inst.components.follower.leader ~= nil and inst.components.follower.leader:HasTag("player") 
                and guy:HasTag("player") and not TheNet:GetPVPEnabled())
        end,
        {"_combat", "character"}, --Must tags
        {"willar"} --Cant tags
    )
end

local function MakeMonkeysTamable(inst, duration)
    if not GLOBAL.TheWorld.ismastersim then return end
    inst:AddComponent("follower")
    inst.components.follower.maxfollowtime = duration

    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldMonkeyAccept)
    inst.components.trader:SetAbleToAcceptTest(ShouldMonkeyAccept)
    inst.components.trader.onaccept = OnMonkeyGetItem
    inst.components.trader.onrefuse = OnMonkeyRefuseItem
    inst.components.trader.deleteitemonaccept = false

    if inst.components.sleeper then 
        inst.components.sleeper.sleeptestfn = function(inst)
            return GLOBAL.NocturnalSleepTest(inst) and (inst.components.follower == nil or inst.components.follower.leader) == nil
        end
    end

    local oldretargetfn = inst.components.combat.targetfn
    inst.components.combat.targetfn = function()
        if inst.components.follower and inst.components.follower.leader and inst.components.follower.leader:HasTag("willar") then
            return NewMonkeyRetarget(inst)
        else return oldretargetfn(inst) end
    end
end

AddPrefabPostInit("monkey", function(inst) MakeMonkeysTamable(inst, 2400) end)

AddPrefabPostInit("spider", function(inst)
    if not GLOBAL.TheWorld.ismastersim then return end
    inst:WatchWorldState("nightmarephase", function(dst) return end)
end)