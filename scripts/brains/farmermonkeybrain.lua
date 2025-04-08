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
    return (not target.components.container:IsFull()) and target or nil
end

local function WantsToStore(inst, tags)
    inst.storing = GetStorageSpace(inst, tags)
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
    local target = inst.components.inventory FindEntity(inst, MAX_WANDER_DIST, nil, {"deployedfarmplant", "weighable_OVERSIZED_VEGGIES"})
    return target and BufferedAction(inst, target, ACTIONS.PICKUP) or nil
end

local FarmerMonkeyBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

function FarmerMonkeyBrain:OnStart()
    local root =
    PriorityNode(
    {
		BrainCommon.PanicTrigger(self.inst),
        IfNode(function() return WantsToStore(self.inst, {"fridge", "structure"}) end, "Store Food in Fridge",
            WhileNode(function() return self.inst.storing and HasFoodToStore(self.inst) end, "Storing Food",
                PriorityNode({
                    DoAction(self.inst, StoreInContainer, "Store Food")
                })
        )),
        DoAction(self.inst, PickupCrop, "Pick Up Crop"),
        FindFarmPlant(self.inst, ACTIONS.INTERACT_WITH, true, GetFollowPos),
        --Follow(self.inst, function() return self.inst.components.follower.leader end, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
        --FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn),
        Wander(self.inst, function() return self.inst.components.knownlocations:GetLocation("home") end, MAX_WANDER_DIST), 
    }, .25)
    self.bt = BT(self.inst, root)
end

return FarmerMonkeyBrain

