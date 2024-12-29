require "behaviours/wander"
require "behaviours/runaway"
require "behaviours/doaction"
require "behaviours/chaseandattack"
require "behaviours/leash"
require "behaviours/follow"
local BrainCommon = require("brains/braincommon")

local MIN_FOLLOW_DIST = 5
local TARGET_FOLLOW_DIST = 7
local MAX_FOLLOW_DIST = 10

local RUN_AWAY_DIST = 7
local STOP_RUN_AWAY_DIST = 15

local SEE_ITEM_DISTANCE = 10
local TRADE_DIST = 20

local MAX_WANDER_DIST = 20

local MAX_CHASE_TIME = 60
local MAX_CHASE_DIST = 40

local TIME_BETWEEN_EATING = 30

local LEASH_RETURN_DIST = 15
local LEASH_MAX_DIST = 20

local NO_LOOTING_TAGS = { "INLIMBO", "catchable", "fire", "irreplaceable", "heavy", "outofreach", "spider" }
local NO_PICKUP_TAGS = deepcopy(NO_LOOTING_TAGS)
table.insert(NO_PICKUP_TAGS, "_container")

local PICKUP_ONEOF_TAGS = { "_inventoryitem", "pickable", "readyforharvest" }

local WillarMonkeyBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)


local function EatFoodAction(inst)
    if math.random() < .75 or
            inst.sg:HasStateTag("busy") or
            (
                inst.components.eater:TimeSinceLastEating() ~= nil and
                inst.components.eater:TimeSinceLastEating() < TIME_BETWEEN_EATING
            ) or (
                inst.components.inventory ~= nil and inst.components.inventory:IsFull()
            ) then
        return
    elseif inst.components.inventory ~= nil and inst.components.eater ~= nil then
        local target = inst.components.inventory:FindItem(function(item) return inst.components.eater:CanEat(item) end)
        if target ~= nil then
            return BufferedAction(inst, target, ACTIONS.EAT)
        end
    end
end

local function GetFaceTargetFn(inst)
    return inst.components.follower.leader
end

local function KeepFaceTargetFn(inst, target)
    return inst.components.follower.leader == target
end

local function GoHome(inst)
    local homeseeker = inst.components.homeseeker
    if homeseeker and homeseeker.home and homeseeker.home:IsValid()
            and (not homeseeker.home.components.burnable or
                not homeseeker.home.components.burnable:IsBurning()) then
        return BufferedAction(inst, inst.components.homeseeker.home, ACTIONS.GOHOME)
    end
end

local function EquipWeapon(inst, weapon)
    if not weapon.components.equippable:IsEquipped() then
        inst.components.inventory:Equip(weapon)
    end
end

local GETTRADER_MUST_TAGS = { "player" }
local function GetTraderFn(inst)
    return inst.components.trader ~= nil
        and FindEntity(inst, TRADE_DIST, function(target) return inst.components.trader:IsTryingToTradeWithMe(target) end, {"player"})
        or nil
end

local function KeepTraderFn(inst, target)
    return inst.components.trader ~= nil
        and inst.components.trader:IsTryingToTradeWithMe(target)
end


function WillarMonkeyBrain:OnStart()

    local root = PriorityNode(
    {
        BrainCommon.PanicWhenScared(self.inst, .3),
		BrainCommon.PanicTrigger(self.inst),
        --In combat (with the player)... Should only ever use poop throwing.
        --[[RunAway(self.inst, "character", RUN_AWAY_DIST, STOP_RUN_AWAY_DIST,
                function(hunter) return ShouldRunFn(self.inst, hunter) end
            ),
        WhileNode(function() return self.inst.components.combat.target and
                                self.inst.components.combat.target.isplayer and
                                self.inst.HasAmmo(self.inst)
                            end, "Attack Player",
            SequenceNode({
                ActionNode(function() EquipWeapon(self.inst, self.inst.weaponitems.thrower) end, "Equip Thrower"),
                ChaseAndAttack(self.inst, MAX_CHASE_TIME, MAX_CHASE_DIST),
            })),]]


        --In combat with everything else
        WhileNode(function() return self.inst.components.combat.target ~= nil
                            end, "Attack NPC", --For everything else
            SequenceNode({
                ActionNode(function() EquipWeapon(self.inst, self.inst.weaponitems.hitter) end, "Equip hitter"),
                ChaseAndAttack(self.inst, MAX_CHASE_TIME, MAX_CHASE_DIST),
            })),


        --Following
        FaceEntity(self.inst, GetTraderFn, KeepTraderFn),
  
        Follow(self.inst, function() return self.inst.components.follower.leader end, 2, 2, 4),
        IfNode(function() return self.inst.components.follower.leader ~= nil end, "HasLeader",
            FaceEntity(self.inst, GetFaceTargetFn, KeepFaceTargetFn))


        --Doing nothing
        --Wander(self.inst, function() return self.inst.components.knownlocations:GetLocation("home") end, MAX_WANDER_DIST)
    }, .25)
    self.bt = BT(self.inst, root)
end

return WillarMonkeyBrain
