local assets =
{
    Asset("ANIM", "anim/kiki_nightmare_skin.zip"),
    Asset("SOUND", "sound/monkey.fsb"),
}

local prefabs =
{
    "poop",
    "monkeyprojectile",
    "smallmeat",
    "cave_banana",
    "beardhair",
    "nightmarefuel",
	"shadow_despawn",
}

local brain = require "brains/umbramonkeybrain"

local function SaveSpawnPoint(inst, dont_overwrite)
	if not dont_overwrite or
		(	inst.components.knownlocations:GetLocation("spawn") == nil and
			inst.components.knownlocations:GetLocation("spawnplatform") == nil
		) then
		local x, y, z = inst.Transform:GetWorldPosition()
		local platform = TheWorld.Map:GetPlatformAtPoint(x, z)
		if platform ~= nil then
			x, y, z = platform.entity:WorldToLocalSpace(x, 0, z)
			inst.components.knownlocations:ForgetLocation("spawn")
			inst.components.knownlocations:RememberLocation("spawnplatform", Vector3(x, 0, z))
			inst.components.entitytracker:TrackEntity("spawnplatform", platform)
		else
			inst.components.entitytracker:ForgetEntity("spawnplatform")
			inst.components.knownlocations:ForgetLocation("spawnplatform")
			inst.components.knownlocations:RememberLocation("spawn", Vector3(x, 0, z))
		end
	end
end

local function GetSpawnPoint(inst)
	local pt = inst.components.knownlocations:GetLocation("spawn")
	if pt ~= nil then
		return pt
	end
	pt = inst.components.knownlocations:GetLocation("spawnplatform")
	if pt ~= nil then
		local platform = inst.components.entitytracker:GetEntity("spawnplatform")
		if platform ~= nil then
			local x, y, z = platform.entity:LocalToWorldSpace(pt:Get())
			return Vector3(x, 0, z)
		end
	end
end

local function MakeSpawnPointTracker(inst)
	inst:AddComponent("knownlocations")
	inst:AddComponent("entitytracker")
	inst.SaveSpawnPoint = SaveSpawnPoint
	inst.GetSpawnPoint = GetSpawnPoint
end

local function OnAttacked(inst, data)
    if data.attacker ~= nil then
        if data.attacker.components.petleash ~= nil and
            data.attacker.components.petleash:IsPet(inst) then
			if inst.despawnpetloot then
				if inst.components.lootdropper == nil then
					inst:AddComponent("lootdropper")
				end
				inst.components.lootdropper:SpawnLootPrefab("nightmarefuel", inst:GetPosition())
			end
            data.attacker.components.petleash:DespawnPet(inst)
        elseif data.attacker.components.combat ~= nil then
            inst.components.combat:SuggestTarget(data.attacker)
        end
    end
end

local function DoRemove(inst)
	if inst.components.inventory ~= nil then
		inst.components.inventory:DropEverything(true)
	end
	inst:Remove()
end

local function OnSeekOblivion(inst)
	if inst:IsAsleep() then
		DoRemove(inst)
		return
	end
	inst.components.timer:StopTimer("obliviate")
	if inst.components.health == nil then
		inst.sg:GoToState("quickdespawn")
	elseif inst.components.health:IsInvincible() then
		--reschedule
		inst.components.timer:StartTimer("obliviate", .5)
	else
		inst:SetBrain(nil)
		inst.components.health:Kill()
	end
end

local function OnTimerDone(inst, data)
    if data and data.name == "obliviate" then
        OnSeekOblivion(inst)
    end
end

local function OnEntitySleep(inst)
	if inst._obliviatetask == nil then
		inst._obliviatetask = inst:DoTaskInTime(TUNING.SHADOWWAXWELL_MINION_IDLE_DESPAWN_TIME, DoRemove)
	end
end

local function OnEntityWake(inst)
	if inst._obliviatetask ~= nil then
		inst._obliviatetask:Cancel()
		inst._obliviatetask = nil
	end
end

local function MakeOblivionSeeker(inst, duration)
    inst:ListenForEvent("timerdone", OnTimerDone)
    inst:AddComponent("timer")
    inst.components.timer:StartTimer("obliviate", duration)
	inst.OnEntitySleep = OnEntitySleep
	inst.OnEntityWake = OnEntityWake
end

local function DropAggro(inst)
	local leader = inst.components.follower:GetLeader()
	if leader ~= nil and
		(	(leader.components.health ~= nil and leader.components.health:IsDead()) or
			(leader.sg ~= nil and leader.sg:HasStateTag("hiding")) or
			not inst:IsNear(leader, TUNING.SHADOWWAXWELL_PROTECTOR_TRANSFER_AGGRO_RANGE) or
			not leader.entity:IsVisible() or
			leader:HasTag("playerghost")
		) then
		--dead, hiding, or too far
		leader = nil
	end
	--nil leader will just drop target
	inst:PushEvent("transfercombattarget", leader)
end

local function OnDancingPlayerData(inst, data)
    if data == nil then
        return
    end

    local player = data.inst
    if player == nil or player ~= inst.components.follower:GetLeader() then
        return
    end

    inst._brain_dancedata = data.dancedata
end

local RETARGET_MUST_TAGS = { "_combat" } -- see entityreplica.lua
local RETARGET_CANT_TAGS = { "playerghost", "INLIMBO" }
local function spearretargetfn(inst)
    --Find things attacking leader
    local leader = inst.components.follower:GetLeader()
    return leader ~= nil
        and FindEntity(
            leader,
            TUNING.SHADOWWAXWELL_TARGET_DIST,
            function(guy)
                return guy ~= inst
                    and (guy.components.combat:TargetIs(leader) or
                        guy.components.combat:TargetIs(inst))
                    and inst.components.combat:CanTarget(guy)
            end,
            RETARGET_MUST_TAGS,
            RETARGET_CANT_TAGS
        )
        or nil
end
local function spearkeeptargetfn(inst, target)
    --Is your leader nearby and your target not dead? Stay on it.
    --Match KEEP_WORKING_DIST in brain
    return inst.components.follower:IsNearLeader(14)
        and inst.components.combat:CanTarget(target)
		and target.components.minigame_participator == nil
end
--deprecated
local function spearfn(inst)
    inst.components.health:SetMaxHealth(TUNING.SHADOWWAXWELL_LIFE)
    inst.components.health:StartRegen(TUNING.SHADOWWAXWELL_HEALTH_REGEN, TUNING.SHADOWWAXWELL_HEALTH_REGEN_PERIOD)

    inst.components.combat:SetDefaultDamage(TUNING.SHADOWWAXWELL_DAMAGE)
    inst.components.combat:SetAttackPeriod(TUNING.SHADOWWAXWELL_ATTACK_PERIOD)
    inst.components.combat:SetRetargetFunction(2, spearretargetfn) --Look for leader's target.
    inst.components.combat:SetKeepTargetFunction(spearkeeptargetfn) --Keep attacking while leader is near.

	inst.despawnpetloot = true

    return inst
end

--[=[local function protectorretargetfn_test(inst, target)
    if inst == target then
        return false
    end

	if target.components.minigame_participator ~= nil then
		return false
	end

    if (target:HasTag("player") and not TheNet:GetPVPEnabled()) or target:HasTag("ghost") then
        return false
    end

    local leader = inst.components.follower.leader
    if leader ~= nil
        and (leader == target
            or (target.components.follower ~= nil and
                target.components.follower.leader == leader)) then
        return false
    end

    if inst.components.combat.target == target then
        print("target is target")
        return true
    end

    local targettarget = target.components.combat.target
    if targettarget ~= nil
        and (targettarget:HasTag("player") or targettarget:HasTag("shadowminion"))
        and inst.components.combat:CanTarget(target) then
        print("target is attacking a friend")
        return true
    end

    local ismonster = target:HasTag("monster")
    if ismonster and not TheNet:GetPVPEnabled() and 
       ((target.components.follower and target.components.follower.leader ~= nil and 
         target.components.follower.leader:HasTag("player")) or target.bedazzled) then
        return false
    end

    if target:HasTag("companion") then
        return false
    end

    return ismonster or target:HasTag("prey")
end]=]

local COMBAT_MUSHAVE_TAGS = { "_combat", "_health" }
local COMBAT_CANTHAVE_TAGS = { "INLIMBO", "companion" }
local COMBAT_MUSTONEOF_TAGS_AGGRESSIVE = { "monster", "prey", "insect", "hostile", "character", "animal" }
local function HasFriendlyLeader(inst, target)
    local leader = inst.components.follower.leader
    if leader ~= nil then
        local target_leader = (target.components.follower ~= nil) and target.components.follower.leader or nil

        if target_leader and target_leader.components.inventoryitem then
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
    end

    return false
end
local function protectorretargetfn(inst)
	if inst.sg:HasStateTag("dancing") then
		return nil
	end

	local spawn = inst:GetSpawnPoint()
    if spawn == nil then
        return nil
    end

    local target = nil
    local ents = TheSim:FindEntities(spawn.x, spawn.y, spawn.z, TUNING.SHADOWWAXWELL_PROTECTOR_DEFEND_RADIUS, COMBAT_MUSHAVE_TAGS, COMBAT_CANTHAVE_TAGS, COMBAT_MUSTONEOF_TAGS_AGGRESSIVE)
    for _, ent in ipairs(ents) do
        --if protectorretargetfn_test(inst, ent) then
        if ent ~= inst and ent.entity:IsVisible()
        and inst.components.combat:CanTarget(ent)
        and ent.components.minigame_participator == nil
        and not HasFriendlyLeader(inst, ent) then
            target = ent
            break
        end
    end

    return target
end
local function protectorkeeptargetfn(inst, target)
    -- Maintain the target if it is able to.
    return inst.components.combat:CanTarget(target)
		and not inst.sg:HasStateTag("dancing")
		and target.components.minigame_participator == nil
        and (not target:HasTag("player") or TheNet:GetPVPEnabled())
end
local function protector_updatehealthclamp(inst)
	local cap = math.abs(inst.components.health.maxdamagetakenperhit)
	cap = cap + math.abs(TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_INCREASE)
	cap = math.min(cap, math.max(1, inst.components.health.maxhealth - 1))
	inst.components.health:SetMaxDamageTakenPerHit(cap)
end
local function protector_onengaged(inst)
	if inst.disengagetask ~= nil then
		inst.disengagetask:Cancel()
		inst.disengagetask = nil
	end
	if inst.engagedtask == nil then
		inst.engagedtask = inst:DoPeriodicTask(TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_PERIOD, protector_updatehealthclamp, TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_INITIAL_PERIOD)
	end
end
local function protector_resethealthclamp(inst)
	inst.disengagetask = nil
	if inst.engagedtask ~= nil then
		inst.engagedtask:Cancel()
		inst.engagedtask = nil
	end
	inst.components.health:SetMaxDamageTakenPerHit(TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_TAKEN)
end
local function protector_ondisengaged(inst)
	if inst.disengagetask == nil then
		inst.disengagetask = inst:DoTaskInTime(TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_INITIAL_PERIOD, protector_resethealthclamp)
	end
end
local function protector_attacked(inst, data)
	if data ~= nil and data.damage ~= nil and data.damage > 0 then
		inst.components.health:SetMaxDamageTakenPerHit(TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_TAKEN)
		if inst.engagedtask ~= nil then
			inst.engagedtask:Cancel()
			inst.engagedtask = inst:DoPeriodicTask(TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_PERIOD, protector_updatehealthclamp, TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_INITIAL_PERIOD)
		end
	end
end

local function _ForgetTarget(inst)
    inst.components.combat:SetTarget(nil)
end

local MONKEY_TAGS = { "monkey" }
local function OnAttacked(inst, data)
    inst.components.combat:SetTarget(data.attacker)
    if inst.task ~= nil then
        inst.task:Cancel()
    end
    inst.task = inst:DoTaskInTime(math.random(55, 65), _ForgetTarget) --Forget about target after a minute

    local x, y, z = inst.Transform:GetWorldPosition()
    local monkeys = TheSim:FindEntities(x, y, z, 30, MONKEY_TAGS)
    for _, monkey in ipairs(monkeys) do
        if monkey ~= inst and monkey.components.combat then
            monkey.components.combat:SuggestTarget(data.attacker)
            if monkey.task ~= nil then
                monkey.task:Cancel()
            end
            monkey.task = monkey:DoTaskInTime(math.random(55, 65), _ForgetTarget) --Forget about target after a minute
        end
    end
end

local RETARGET_MUST_TAGS = { "_combat" }
local RETARGET_CANT_TAGS = { "playerghost" }
local RETARGET_ONEOF_TAGS = {"monster" }
local function retargetfn(inst)
    return 
        FindEntity(
                inst,
                20,
                function(guy)
                    return inst.components.combat:CanTarget(guy)
                end,
                RETARGET_MUST_TAGS, --see entityreplica.lua
                RETARGET_CANT_TAGS,
                RETARGET_ONEOF_TAGS
            )
        or nil
end

local function shouldKeepTarget(inst)
    return true
end

local function nodebrisdmg(inst, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
    return afflicter ~= nil and afflicter:HasTag("quakedebris")
end

local function MakeUmbra(name, fighter)
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddDynamicShadow()
        inst.entity:AddNetwork()

        inst.DynamicShadow:SetSize(2, 1.25)

        inst.Transform:SetSixFaced()

        inst:SetPhysicsRadiusOverride(.5)
        MakeGhostPhysics(inst, 1, inst.physicsradiusoverride)

        inst.AnimState:SetBank("kiki")
        inst.AnimState:SetBuild("kiki_nightmare_skin")
        inst.AnimState:PlayAnimation("idle_loop", true)

        inst:AddTag("cavedweller")
        inst:AddTag("monkey")
        inst:AddTag("animal")

        inst.entity:SetPristine()
        if not TheWorld.ismastersim then
            return inst
        end

        inst.soundtype = ""

        MakeMediumBurnableCharacter(inst)
        MakeMediumFreezableCharacter(inst)

        inst:AddComponent("bloomer")

        inst:AddComponent("inventory")

        inst:AddComponent("inspectable")

        local locomotor = inst:AddComponent("locomotor")
        locomotor:SetSlowMultiplier( 1 )
        locomotor:SetTriggersCreep(false)
        locomotor.pathcaps = { ignorecreep = false }
        locomotor.walkspeed = TUNING.MONKEY_MOVE_SPEED + 2
        local combat = inst:AddComponent("combat")
        inst.components.combat.hiteffectsymbol = "torso"
        inst.components.combat:SetRange(2)

        inst:AddComponent("follower")
        inst.components.follower:KeepLeaderOnAttacked()
        inst.components.follower.keepdeadleader = true
        inst.components.follower.keepleaderduringminigame = true

        if fighter then
            
            inst.components.combat:SetDefaultDamage(TUNING.SHADOWWAXWELL_PROTECTOR_DAMAGE)
            inst.components.combat:SetAttackPeriod(TUNING.SHADOWWAXWELL_PROTECTOR_ATTACK_PERIOD)
            inst.components.combat:SetRetargetFunction(1, protectorretargetfn)
            inst.components.combat:SetKeepTargetFunction(protectorkeeptargetfn)
        else
            inst:AddComponent("inventory")
            inst.components.inventory.maxslots = 1
            inst.components.combat:SetKeepTargetFunction(function(inst) return false end)
	        inst.components.follower.noleashing = true
        end

        inst:AddComponent("health")
        inst.components.health:SetMaxHealth(25)
        inst.components.health:SetMaxDamageTakenPerHit(TUNING.SHADOWWAXWELL_PROTECTOR_HEALTH_CLAMP_TAKEN)
        inst.components.health.nofadeout = true
        inst.components.health.redirect = nodebrisdmg

        inst:AddComponent("lootdropper")
        --inst.components.lootdropper:SetLoot(LOOT)

        inst:AddComponent("eater")
        inst.components.eater:SetDiet({ FOODTYPE.VEGGIE }, { FOODTYPE.VEGGIE })
        --inst.components.eater:SetOnEatFn(oneat)

        inst:SetBrain(brain)
        inst:SetStateGraph("SGumbramonkey")

        inst:AddComponent("timer")
    
        --inst.listenfn = function(listento, data) OnMonkeyDeath(inst, data) end

        inst:ListenForEvent("newcombattarget", protector_onengaged)
        inst:ListenForEvent("droppedtarget", protector_ondisengaged)
        inst:ListenForEvent("attacked", protector_attacked)
        inst:ListenForEvent("seekoblivion", OnSeekOblivion)
        inst:ListenForEvent("death", DropAggro)
        inst:ListenForEvent("dancingplayerdata", function(world, data) OnDancingPlayerData(inst, data) end, TheWorld)

        MakeSpawnPointTracker(inst)
        MakeOblivionSeeker(inst, TUNING.SHADOWWAXWELL_PROTECTOR_DURATION + math.random())

        --inst.weaponitems = {}
        --EquipWeapons(inst)

        return inst
    end
    return Prefab(name, fn, assets, prefabs)
end

return MakeUmbra("umbramonkeywarrior", true),
    MakeUmbra("umbramonkeyservant", false)