require "behaviours/follow"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/findfarmplant"
require "behaviours/doaction"
local BrainCommon = require("brains/braincommon")

local MIN_FOLLOW_DIST = 0
local MAX_FOLLOW_DIST = 10
local TARGET_FOLLOW_DIST = 5

local MAX_WANDER_DIST = 20


local MUSTNOTTAGS = {"INLIMBO"}

local function GetFaceTargetFn(inst)
    return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower.leader == target
end

local function GetFollowPos(inst)
    return inst.components.follower.leader and inst.components.follower.leader:GetPosition() or
        inst:GetPosition()
end

local function GoHomeAction(inst)

    local home = inst.components.homeseeker ~= nil and inst.components.homeseeker.home or nil

    if home and inst.components.inventory then
        inst.components.inventory:DropEverything(false, true)
    end

    if home ~= nil and (home.components.burnable ~= nil and home.components.burnable:IsBurning()) then
        home = nil
    end 

    return home ~= nil
        and home:IsValid()
        and home.components.spawner ~= nil
        and (home.components.health == nil or not home.components.health:IsDead())
        and BufferedAction(inst, home, ACTIONS.GOHOME)
        or nil
end

local function HasFoodToStore(inst)
    local b =  inst.components.inventory:FindItem(function(item) return item:HasTag("deployedfarmplant") or item:HasTag("weighable_OVERSIZEDVEGGIES") or item:HasTag("edible_"..FOODTYPE.VEGGIE) end)
    if not b then inst.storing = nil end 
    return b
end

local function GetStorageSpace(inst, musttags)
    local target = FindEntity(inst, MAX_WANDER_DIST, nil, musttags, MUSTNOTTAGS)
    return target and (not target.components.container:IsFull()) and target or nil
end

local function WantsToStore(inst, tags)
    --If our current storage choice is a chest but we want a fridge, or our current storage choice is full:
    if inst.storing and (inst.storing:HasTag("chest") and tags[1] == "fridge" or inst.storing.components.container:IsFull()) then
        inst.storing = GetStorageSpace(inst, tags)
    --We have no current storage option
    elseif not inst.storing then
        inst.storing = GetStorageSpace(inst, tags)
    end
    return inst.storing and inst.components.inventory:IsFull()
end

local function StoreInContainer(inst)
    if inst.sg:HasStateTag("busy") then
        return nil
    end

    if inst.storing == nil then return nil end

    local item = inst.components.inventory:FindItem(function(item) return item:HasTag("deployedfarmplant") or item:HasTag("weighable_OVERSIZEDVEGGIES") or item:HasTag("edible_"..FOODTYPE.VEGGIE) end)

    if item then
        local act = BufferedAction(inst, inst.storing, ACTIONS.STORE, item)
        return act
    end
end

local function PickupCrop(inst)
    if inst.sg:HasStateTag("busy") then
        return nil
    end

    local target = FindEntity(inst, MAX_WANDER_DIST, nil, nil, MUSTNOTTAGS, {"deployedfarmplant", "edible_"..FOODTYPE.VEGGIE, "weighable_OVERSIZEDVEGGIES"})
    return target and BufferedAction(inst, target, ACTIONS.PICKUP) or nil
end

local function HarvestCrop(inst)
    if inst.sg:HasStateTag("busy") then
        return nil
    end

    local target = FindEntity(inst, MAX_WANDER_DIST, nil, nil, MUSTNOTTAGS, {"bush", "bananabush", "readyforharvest"})
    if target and target.components.pickable then
        return target and target.components.pickable:CanBePicked() and BufferedAction(inst, target, ACTIONS.PICK) or nil
    end
    return target and BufferedAction(inst, target, ACTIONS.HARVEST) or nil
end

local function WantsToFertilze(inst)
    --there is a plant that needs fertilizing, there is fertlizer, we have room in inventory to pick up fertlizer
    local plant = FindEntity(inst, MAX_WANDER_DIST, nil, {"barren"}, MUSTNOTTAGS, {"bush", "bananabush", "plant"})
    local fertilzer = FindEntity(inst, MAX_WANDER_DIST, nil, {"fertilizer"}, MUSTNOTTAGS)
    print(plant, inst.components.inventory:HasItemWithTag("fertilizer", -2), not inst.components.inventory:IsFull() and fertilzer, plant and (inst.components.inventory:HasItemWithTag("fertilizer", -2) or (not inst.components.inventory:IsFull() and fertilzer))) 
    return plant and (inst.components.inventory:HasItemWithTag("fertilizer", -2) or (not inst.components.inventory:IsFull() and fertilzer))
end

local function PickupFertilzer(inst)
    if inst.sg:HasStateTag("busy") then
        return nil
    end

    local fertilzer = FindEntity(inst, MAX_WANDER_DIST, nil, {"fertilizer"}, MUSTNOTTAGS)
    return fertilzer and BufferedAction(inst, fertilzer, ACTIONS.PICKUP) or nil
end

local function FertilzeBush(inst)
    if inst.sg:HasStateTag("busy") then
        return nil
    end

    local plant = FindEntity(inst, MAX_WANDER_DIST, nil, {"barren"}, MUSTNOTTAGS, {"bush", "bananabush", "plant"})
    local item = inst.components.inventory:FindItem(function(item) return item:HasTag("fertilizer") end)
    if item and plant then
        return BufferedAction(inst, plant, ACTIONS.FERTILIZE, item)
    end
end

local INTERACT_COOLDOWN_NAME = "picked_something_up_recently"
local function TryDroppingFertilizer(inst)
    -- Test for the interact state cooldown so that we don't end up dropping multiple items
    if inst.sg:HasStateTag("busy") then
        return nil
    end

    local item = inst.components.inventory:FindItem(function(item) return item:HasTag("fertilizer") end)
    if not item then return nil end

    local buffered_action = BufferedAction(inst, nil, ACTIONS.DROP, item, inst:GetPosition())
    return buffered_action
end

local FarmerMonkeyBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

local fridge_tags = {"fridge", "structure"}
local chest_tags = {"chest", "structure"}



function FarmerMonkeyBrain:OnStart()
    local root =
    PriorityNode(
    {
		BrainCommon.PanicTrigger(self.inst),
        WhileNode(function() return not TheWorld.state.iscaveday end, "Day Over",
            DoAction(self.inst, function()return GoHomeAction(self.inst) end)),
        --If our inventory is full put stuff away first!
        IfNode(function() return WantsToStore(self.inst, fridge_tags) end, "Store Food in Fridge",
            WhileNode(function() return HasFoodToStore(self.inst) and self.inst.storing end, "Storing Food",
                PriorityNode({
                    DoAction(self.inst, StoreInContainer, "Store Food")
                })
        )),
        --Prioritize Icebox over Chest
        IfNode(function() return WantsToStore(self.inst, chest_tags) end, "Store Food in Chest",
            WhileNode(function() return HasFoodToStore(self.inst) and self.inst.storing end, "Storing Food",
                PriorityNode({
                    DoAction(self.inst, StoreInContainer, "Store Food")
                })
        )),
        DoAction(self.inst, PickupCrop, "Pick Up Crop"),
        DoAction(self.inst, HarvestCrop, "Haverst Crop"),
        WhileNode(function() return WantsToFertilze(self.inst) end, "Fertilizing Bushes",
            PriorityNode({
                DoAction(self.inst, PickupFertilzer, "Pick Up Fertlizer"),
                DoAction(self.inst, FertilzeBush, "FertilzeBush"),
            })
        ),
        DoAction(self.inst, TryDroppingFertilizer, "Drop Fertilizer"),
        FindFarmPlant(self.inst, ACTIONS.INTERACT_WITH, true),
        DoAction(self.inst, StoreInContainer, "Store Food No Work"),
        Wander(self.inst, function() return self.inst.components.knownlocations:GetLocation("home") end, MAX_WANDER_DIST), 
    }, .25)
    self.bt = BT(self.inst, root)
end

return FarmerMonkeyBrain

