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

local function HasFoodToStore(inst)
    local b =  inst.components.inventory:FindItem(function(item) return item:HasTag("deployedfarmplant") or item:HasTag("weighable_OVERSIZEDVEGGIES") end)
    if not b then inst.storing = nil end 
    return b
end

local function GetStorageSpace(inst, musttags)
    local target = FindEntity(inst, MAX_WANDER_DIST, nil, musttags)
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
    local item = inst.components.inventory:FindItem(function(item) return item:HasTag("deployedfarmplant") or item:HasTag("weighable_OVERSIZEDVEGGIES") end)

    if item then
        local act = BufferedAction(inst, inst.storing, ACTIONS.STORE, item)
        return act
    end
end

local function PickupCrop(inst)
    local target = FindEntity(inst, MAX_WANDER_DIST, nil, nil, nil, {"deployedfarmplant", "weighable_OVERSIZEDVEGGIES"})
    return target and BufferedAction(inst, target, ACTIONS.PICKUP) or nil
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
        FindFarmPlant(self.inst, ACTIONS.INTERACT_WITH, true),
        DoAction(self.inst, StoreInContainer, "Store Food No Work"),
        Wander(self.inst, function() return self.inst.components.knownlocations:GetLocation("home") end, MAX_WANDER_DIST), 
    }, .25)
    self.bt = BT(self.inst, root)
end

return FarmerMonkeyBrain

