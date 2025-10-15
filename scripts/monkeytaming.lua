TUNING.WILLAR_RECRUIT_TIME = 360

local IsWillarLeader = GLOBAL.IsWillarLeader
local function ShouldMonkeyAccept(inst, item, giver)
    if inst.components.health and inst.components.health:IsDead() then
        return false, "DEAD"
    end

    return 
        (giver:HasTag("willar") and inst.components.eater:CanEat(item)) or
        (item.components.equippable and item.components.equippable.equipslot == EQUIPSLOTS.HEAD) or
        (GLOBAL.GramHasSkill(giver, "diplo") and item.prefab == "pigskin" and not giver.hassquire) 
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

GLOBAL.MakePrimemateRun = function(inst)
    local cs = require("stategraphs/commonstates")
    inst.sg.sg.events.locomote = GLOBAL.CommonHandlers.OnLocomote(true, true)
    .AddRunStates(inst.sg, 
    {
        runtimeline =
        {
            GLOBAL.TimeEvent(0, GLOBAL.PlayFootstep),
            GLOBAL.TimeEvent(10 * FRAMES, GLOBAL.PlayFootstep),
        },
    })
end

local monkeybrain = require "brains/monkeybrain"
local monkeynightmarebrain = require "brains/nightmaremonkeybrain"
local willarmonkeybrain = require "brains/willarmonkeybrain"
local hasskill = GLOBAL.GramHasSkill

local function BecomeFollower(inst, giver)
    if inst.components.combat.target == giver then
        inst.components.combat:SetTarget(nil)
    end
    giver:PushEvent("makefriend")
    giver.components.leader:AddFollower(inst)
    inst.components.follower:AddLoyaltyTime(TUNING.WILLAR_RECRUIT_TIME * (hasskill(giver, "subjects_1") and 1.5 or 1))

    if inst.prefab == "monkey" and not inst:HasTag("willarfollower") then
        UpdateMaxHealth(inst, 75)
        inst.components.inventory:DropEverything()
        local thrower = GLOBAL.CreateEntity()
        thrower.name = "Thrower"
        thrower.entity:AddTransform()
        thrower:AddComponent("weapon")
        thrower.components.weapon:SetDamage(TUNING.MONKEY_RANGED_DAMAGE)
        thrower.components.weapon:SetRange(TUNING.MONKEY_RANGED_RANGE)
        thrower.components.weapon:SetProjectile("monkeyprojectile")
        thrower.components.weapon:SetOnProjectileLaunch(onthrow)
        thrower:AddComponent("inventoryitem")
        thrower.persists = false
        thrower.components.inventoryitem:SetOnDroppedFn(thrower.Remove)
        thrower:AddComponent("equippable")
        thrower:AddTag("nosteal")
        inst.components.inventory:GiveItem(thrower)
        inst.weaponitems.thrower = thrower

        local hitter = GLOBAL.CreateEntity()
        hitter.name = "Hitter"
        hitter.entity:AddTransform()
        hitter:AddComponent("weapon")
        hitter.components.weapon:SetDamage(TUNING.MONKEY_MELEE_DAMAGE)
        hitter.components.weapon:SetRange(0)
        hitter:AddComponent("inventoryitem")
        hitter.persists = false
        hitter.components.inventoryitem:SetOnDroppedFn(hitter.Remove)
        hitter:AddComponent("equippable")
        hitter:AddTag("nosteal")
        inst.components.inventory:GiveItem(hitter)
        inst.weaponitems.hitter = hitter
    elseif inst.prefab == "powder_monkey" then
        UpdateMaxHealth(inst, 100)
    elseif inst.prefab == "prime_mate" then
        UpdateMaxHealth(inst, 150)
        if hasskill(giver, "subjects_2") then
            inst.components.locomotor.runspeed = TUNING.MONKEY_MOVE_SPEED
           GLOBAL.MakePrimemateRun(inst)
        end
    end
            
    inst:SetBrain(willarmonkeybrain)

    inst:ListenForEvent("loseloyalty", function() 
        if inst.prefab == "monkey" then
            inst:SetBrain(inst:HasTag("nightmare") and monkeynightmarebrain or monkeybrain)
            UpdateMaxHealth(inst, -75)
        elseif inst.prefab == "powder_monkey" then
            UpdateMaxHealth(inst, -100)
        elseif inst.prefab == "prime_mate" then
            UpdateMaxHealth(inst, -150)
        end
        inst:RemoveTag("willarfollower")
    end)

    inst:AddTag("willarfollower")
end

local function OnMonkeyGetItem(inst, giver, item)
    local x, y, z = inst.Transform:GetWorldPosition()
    if inst.components.eater:CanEat(item) then
        inst.components.eater:Eat(item)

        if item.prefab == "cave_banana" then
            BecomeFollower(inst, giver)
            if hasskill(giver, "subjects_3") then
                
                local monkeys = TheSim:FindEntities(x,y,z, 10, nil, {"FX", "NOCLICK", "DECOR", "INLIMBO", "willarfollower"}, {"monkey"})
                local maxm = 2
                for _, v in pairs(monkeys) do
                    if giver ~= v then
                        if maxm <= 0 then break end
                        BecomeFollower(v, giver)
                        maxm = maxm - 1
                    end
                end
            end
        end
    elseif item.components.equippable and item.components.equippable.equipslot == EQUIPSLOTS.HEAD then
        local current = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if current ~= nil then
            inst.components.inventory:DropItem(current)
        end
        inst.components.inventory:Equip(item)
        inst.AnimState:Show("hat")
    elseif hasskill(giver, "subjects_2") and inst.prefab == "powder_monkey" and item.prefab == "idk" then
        --turn into prime_mate
        local fx = GLOBAL.SpawnPrefab("statue_transition_2")
        if fx ~= nil then
            fx.Transform:SetPosition(x, y, z)
            fx.Transform:SetScale(.8, .8, .8)
        end
        fx = GLOBAL.SpawnPrefab("statue_transition")
        if fx ~= nil then
            fx.Transform:SetPosition(x, y, z)
            fx.Transform:SetScale(.8, .8, .8)
        end
        
        inst:DoTaskInTime(.25, function()
            local primemate = GLOBAL.SpawnPrefab("prime_mate")
            if primemate then
                primemate.SoundEmitter:PlaySound("dontstarve/common/ghost_spawn")
                primemate.Transform:SetPosition(x,y,z)
                if inst.components.follower.leader then primemate.components.follower:SetLeader(giver) end
                if inst.components.combat:HasTarget() then primemate.components.combat:SetTarget(inst.components.combat.target) end
                inst:Remove()
            end
        end)
    elseif hasskill(giver, "diplo") and inst.prefab == "monkey" and item.prefab == "pigskin" then
        local fx = GLOBAL.SpawnPrefab("statue_transition_2")
        if fx ~= nil then
            fx.Transform:SetPosition(x, y, z)
            fx.Transform:SetScale(.8, .8, .8)
        end
        fx = GLOBAL.SpawnPrefab("statue_transition")
        if fx ~= nil then
            fx.Transform:SetPosition(x, y, z)
            fx.Transform:SetScale(.8, .8, .8)
        end

        inst:DoTaskInTime(.25, function()
            local primemate = GLOBAL.SpawnPrefab("willarsquire")
            if primemate then
                primemate.SoundEmitter:PlaySound("dontstarve/common/ghost_spawn")
                primemate.Transform:SetPosition(x,y,z)
                giver.components.leader:AddFollower(primemate)
                inst:Remove()
                primemate:ListenForEvent("death", function() giver:PushEvent("squiredied") end)
                giver.hassquire = true
            end
        end)
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
GLOBAL.WILLAR_TAPESTRY_BUFF_ATTACK = 13

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
    inst.components.combat.targetfn = function(cm)
        if IsWillarLeader(cm) then
            return nil --Don't attack anything if our leader doesn't
        else 
            local target = oldretargetfn(cm)
            if target and target.prefab == "willar" then return nil end
            return target 
        end
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

    inst:DoTaskInTime(0, function() 
         if GLOBAL.TheWorld.willartapestrypowered then 
            UpdateMaxHealth(inst, GLOBAL.WILLAR_TAPESTRY_BUFF_HEALTH)
            inst.components.combat.damagebonus = inst.prefab == "monkey" and GLOBAL.WILLAR_TAPESTRY_BUFF_ATTACK or (GLOBAL.WILLAR_TAPESTRY_BUFF_ATTACK + 8)
         end
	end)
end

AddPrefabPostInit("monkey", function(inst) MakeMonkeysTamable(inst, 2400) end)
AddPrefabPostInit("powder_monkey", function(inst) MakeMonkeysTamable(inst, 2400) end)
AddPrefabPostInit("prime_mate", function(inst) MakeMonkeysTamable(inst, 2400) end)