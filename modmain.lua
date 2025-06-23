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
STRINGS.CHARACTER_TITLES.willar = "Title"
STRINGS.CHARACTER_NAMES.willar = "Willar"
STRINGS.CHARACTER_DESCRIPTIONS.willar = "*Perk/Attribute 1\n*Perk/Attribute 2\n*Perk/Attribute 3"
STRINGS.CHARACTER_QUOTES.willar = "\"...\""
STRINGS.CHARACTER_SURVIVABILITY.willar = "Slim"


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

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("willar", "MALE", skin_modes)


modimport("scripts/strings")

RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/willarsword.xml"), "willarsword.tex")
RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/willarcrown.xml"), "willarcrown.tex")
RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/willarcrown_ruins.xml"), "willarcrown_ruins.tex")
RegisterInventoryItemAtlas(GLOBAL.resolvefilepath("images/inventoryimages/monkeydisguise.xml"), "monkeydisguise.tex")

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

local function UpdateMaxHealth(inst, newmax)
    local factor = inst.components.health:GetPercent()
    inst.components.health:SetMaxHealth(inst.components.health:GetMaxWithPenalty() + newmax)
    inst:DoTaskInTime(0, function() inst.components.health.currenthealth = inst.components.health.currenthealth * factor end)
end

local function UpdateMaxSanity(inst, newmax)
    local factor = inst.components.sanity:GetPercent()
    inst.components.sanity:SetMax(inst.components.sanity:GetMaxWithPenalty() + newmax)
    inst:DoTaskInTime(0, function() inst.components.sanity.current = inst.components.sanity.current * factor end)
end

local function UpdateMaxHunger(inst, newmax)
    local factor = inst.components.hunger:GetPercent()
    inst.components.hunger:SetMax(inst.components.hunger.max + newmax)
    inst:DoTaskInTime(0, function() inst.components.hunger.current = inst.components.hunger.current * factor end)
end

GLOBAL.Gram_UpdateMaxHealth = UpdateMaxHealth
GLOBAL.Gram_UpdateMaxSanity = UpdateMaxSanity
GLOBAL.Gram_UpdateMaxHunger = UpdateMaxHunger


local monkeybrain = require "brains/monkeybrain"
local monkeynightmarebrain = require "brains/nightmaremonkeybrain"
local willarmonkeybrain = require "brains/willarmonkeybrain"

local function OnMonkeyGetItem(inst, giver, item)
    if inst.components.eater:CanEat(item) then
        inst.components.eater:Eat(item)

        if item.prefab == "cave_banana" then
            if inst.components.combat.target == giver then
                inst.components.combat:SetTarget(nil)
            end

            giver:PushEvent("makefriend")
            giver.components.leader:AddFollower(inst)
            inst.components.follower:AddLoyaltyTime(240)

            if inst.prefab == "monkey" and not inst:HasTag("willarfollower") then
                UpdateMaxHealth(inst, 75)
            elseif inst.prefab == "powder_monkey" then
                UpdateMaxHealth(inst, 100)
            elseif inst.prefab == "prime_mate" then
                UpdateMaxHealth(inst, 50)
            end
            
            inst:SetBrain(willarmonkeybrain)

            inst:ListenForEvent("loseloyalty", function() 
                if inst.prefab == "monkey" then
                    inst:SetBrain(inst:HasTag("nightmare") and monkeynightmarebrain or monkeybrain)
                    UpdateMaxHealth(inst, -75)
                elseif inst.prefab == "powder_monkey" then
                    UpdateMaxHealth(inst, -100)
                elseif inst.prefab == "prime_mate" then
                    UpdateMaxHealth(inst, -50)
                end
                inst:RemoveTag("willarfollower")
            end)

            inst:AddTag("willarfollower")
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
GLOBAL.WillarFriendlyLeader = function(inst, target)
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

        local PVP_enabled = GLOBAL.TheNet:GetPVPEnabled()
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
                and guy:HasTag("player") and not GLOBAL.TheNet:GetPVPEnabled())
        end,
        {"_combat", "character"}, --Must tags
        {"willar"} --Cant tags
    )
end

GLOBAL.WILLAR_TAPESTRY_BUFF_HEALTH = 50
GLOBAL.WILLAR_TAPESTRY_BUFF_ATTACK = 1.15

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
        if IsWillarLeader(inst) then
            return nil --Don't attack anything if our leader doesn't
        else return oldretargetfn(inst) end
    end

    inst:DoTaskInTime(1, function() if IsWillarLeader(inst) then print("ChangeBrain") inst:SetBrain(willarmonkeybrain) end end)

    if inst.prefab == "monkey" then
        inst:DoPeriodicTask(0, function()
            if IsWillarLeader(inst) then
                if inst.brain ~= willarmonkeybrain then inst:SetBrain(willarmonkeybrain) end
                if inst.components.combat.target == inst.components.follower.leader then inst.components.combat:SetTarget(nil) end
            end
        end)
    end

    if GLOBAL.TheWorld.willartapestrypowered then 
		 UpdateMaxHealth(v, GLOBAL.WILLAR_TAPESTRY_BUFF_HEALTH)
         inst.components.combat.externaldamagemultipliers:SetModifier(inst, GLOBAL.WILLAR_TAPESTRY_BUFF_ATTACK, "willartapestryactive")
	end
end

AddPrefabPostInit("monkey", function(inst) MakeMonkeysTamable(inst, 2400) end)
AddPrefabPostInit("powder_monkey", function(inst) MakeMonkeysTamable(inst, 2400) end)
AddPrefabPostInit("prime_mate", function(inst) MakeMonkeysTamable(inst, 2400) end)

 local State = GLOBAL.State
 local FRAMES = GLOBAL.FRAMES
 local TimeEvent = GLOBAL.TimeEvent
 local EventHandler = GLOBAL.EventHandler
require "stategraphs/commonstates"
local CommonHandlers = GLOBAL.CommonHandlers

local function SetSleeperSleepState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:AddImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:IgnoreAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Disable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(false)
        inst.components.playercontroller:Enable(false)
    end
    inst:OnSleepIn()
    inst.components.inventory:Hide()
    inst:PushEvent("ms_closepopups")
    inst:ShowActions(false)
end

local function SetSleeperAwakeState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:RemoveImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:StopIgnoringAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Enable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(true)
        inst.components.playercontroller:Enable(true)
    end
    inst:OnWakeUp()
    inst.components.inventory:Show()
    inst:ShowActions(true)
end

local function WillarBlanketSleep(sg)
    local oldsleepinhandler = sg.actionhandlers[GLOBAL.ACTIONS.SLEEPIN]
    sg.actionhandlers[GLOBAL.ACTIONS.SLEEPIN] = GLOBAL.ActionHandler(GLOBAL.ACTIONS.SLEEPIN, function(inst, action)
        if action.target.prefab == "willartapestry" then return "willar_blanket" end
        return oldsleepinhandler.destate(inst, action)
    end)
end
AddStategraphPostInit("wilson", WillarBlanketSleep)
AddStategraphPostInit("wilson_client", WillarBlanketSleep)

local willar_sleep = State({
        name = "willar_blanket",
        tags = { "bedroll", "busy", "nomorph" },

        onenter = function(inst)
            inst.components.locomotor:Stop()

            local failreason =
                (GLOBAL.TheWorld.state.isday and
                    (GLOBAL.TheWorld:HasTag("cave") and "ANNOUNCE_NODAYSLEEP_CAVE" or "ANNOUNCE_NODAYSLEEP")
                )
                or (inst.IsNearDanger(inst) and "ANNOUNCE_NODANGERSLEEP")
                -- you can still sleep if your hunger will bottom out, but not absolutely
                or (inst.components.hunger.current < TUNING.CALORIES_MED and "ANNOUNCE_NOHUNGERSLEEP")
                or nil

            if failreason == nil and inst.components.sleepingbaguser ~= nil then
                local _, sleepingbagfailreason = inst.components.sleepingbaguser:ShouldSleep()
                failreason = sleepingbagfailreason
            end

            if failreason ~= nil then
                inst:PushEvent("performaction", { action = inst.bufferedaction })
                inst:ClearBufferedAction()
                inst.sg:GoToState("idle")
                if inst.components.talker ~= nil then
                    inst.components.talker:Say(GetString(inst, failreason))
                end
                return
            end

            --inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PlayAnimation("dozy")
            inst.AnimState:PushAnimation("sleep_loop", false)
            SetSleeperSleepState(inst)

            --Hack since we've already temp unequipped hand items at this point
            --but we want to show the correct arms for action_uniqueitem_pre
            if inst._sleepinghandsitem ~= nil then
                inst.AnimState:Show("ARM_carry")
                inst.AnimState:Hide("ARM_normal")
            end
        end,

        timeline =
        {
            TimeEvent(20 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_bedroll")
            end),
        },

        events =
        {
            EventHandler("firedamage", function(inst)
                if inst.sg:HasStateTag("sleeping") then
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
                end
            end),
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    if GLOBAL.TheWorld.state.isday or
                        (inst.components.health ~= nil and inst.components.health.takingfiredamage) or
                        (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
                        inst:PushEvent("performaction", { action = inst.bufferedaction })
                        inst:ClearBufferedAction()
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    elseif inst:GetBufferedAction() then
                        inst:PerformBufferedAction()
                        if inst.components.playercontroller ~= nil then
                            inst.components.playercontroller:Enable(true)
                        end
                        inst.sg:AddStateTag("sleeping")
                        inst.sg:AddStateTag("silentmorph")
                        inst.sg:RemoveStateTag("nomorph")
                        inst.sg:RemoveStateTag("busy")
                        inst.AnimState:PlayAnimation("sleep_loop", true)
                    else
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    end
                end
            end),
        },

        onexit = function(inst)
            if not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Hide("ARM_carry")
                inst.AnimState:Show("ARM_normal")
            end
            if inst.sleepingbag ~= nil then
                --Interrupted while we are "sleeping"
                inst.sleepingbag.components.sleepingbag:DoWakeUp(true)
                inst.sleepingbag = nil
                SetSleeperAwakeState(inst)
            elseif not inst.sg.statemem.iswaking then
                --Interrupted before we are "sleeping"
                SetSleeperAwakeState(inst)
            end
        end,
    })

AddStategraphState("wilson", willar_sleep)

local willar_sleep_client = State({
		name = "willar_blanket",
		server_states = { "willar_blanket"},
		forward_server_states = true,
		onenter = function(inst) inst.sg:GoToState("willar_blanket_action") end,
	})

local willar_sleep_action_client = State({
    name = "willar_blanket_action",
    tags = { "busy" },
    onenter = function(inst)
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("dozy")
			inst.AnimState:PushAnimation("sleep_loop", false)
			inst:PerformPreviewBufferedAction()
			inst.sg:SetTimeout(TIMEOUT)
		end,

		onupdate = function(inst)
			if inst.sg:ServerStateMatches() then
				if inst.entity:FlattenMovementPrediction() then
					inst.sg:GoToState("idle", "noanim")
				end
			elseif inst.bufferedaction == nil then
				inst.AnimState:PlayAnimation("flute")
				inst.AnimState:SetFrame(103)
				inst.sg:GoToState("idle", true)
			end
		end,

		ontimeout = function(inst)
			inst:ClearBufferedAction()
			inst.AnimState:PlayAnimation("flute")
			inst.AnimState:SetFrame(103)
			inst.sg:GoToState("idle", true)
		end,
})

AddStategraphState("wilson_client", willar_sleep_client)
AddStategraphState("wilson_client", willar_sleep_action_client)

AddCharacterRecipe("cutless",
	{Ingredient("boards", 1),
	 Ingredient("rope", 1),
     Ingredient("log", 1)
    },
	 GLOBAL.TECH.ANCIENT_TWO,
	 {
		product = "cutless",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"WEAPONS",
	})
STRINGS.RECIPE_DESC.WILLARSWORD = "Great for splinters."

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
	},
	{
		"WEAPONS",
	})
STRINGS.RECIPE_DESC.WILLARSWORD = "Cutmore."


AddCharacterRecipe("monkeydisguise",
	{Ingredient("cave_banana", 2),
	 Ingredient("twigs", 2),
     Ingredient("beardhair", 3)
    },
	 GLOBAL.TECH.SCIENCE_TWO,
	 {
		product = "monkeydisguise",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"WEAPONS",
	})
STRINGS.RECIPE_DESC.MONKEYDISGUISE = "Disguise yourself as a primemate."

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
		"CLOTHING", "MAGIC"
	})
STRINGS.RECIPE_DESC.WILLARCROWN = "Become recognized for your monkey regality."

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
		"CLOTHING", "ARMOUR", "MAGIC"
	})
STRINGS.RECIPE_DESC.WILLARCROWN_RUINS = "Enhance your influence over your subjects."

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
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.FARMERMONKEYPOD = "Houses one Farmer Monkey."

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
        image = "monkeybarrel.tex"
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.MONKEYBARREL = "Construct a Splumonkey Pod."

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
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.MONKEYHUT = "Construct a Powder Monkey Hut."

