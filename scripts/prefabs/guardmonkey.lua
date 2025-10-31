local assets =
{
    Asset("ANIM", "anim/splumonkey_armoured.zip"),
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

local brain = require "brains/willarmonkeybrain"

local LOOT = { "smallmeat", "cave_banana" }
local FORCED_NIGHTMARE_LOOT = { "nightmarefuel" }
SetSharedLootTable('monkey',
{
    {'smallmeat',     1.0},
    {'cave_banana',   1.0},
    {'beardhair',     1.0},
    {'nightmarefuel', 0.5},
})

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

local function OnCustomHaunt(inst)
    inst.components.periodicspawner:TrySpawn()
    return true
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.DynamicShadow:SetSize(2, 1.25)

    inst.Transform:SetSixFaced()

    MakeCharacterPhysics(inst, 10, 0.25)

    inst.AnimState:SetBank("kiki")
    inst.AnimState:SetBuild("splumonkey_armoured")
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
    combat:SetAttackPeriod(TUNING.MONKEY_ATTACK_PERIOD)
    combat:SetRange(TUNING.MONKEY_MELEE_RANGE)
    combat:SetRetargetFunction(1, retargetfn)
    combat:SetKeepTargetFunction(shouldKeepTarget)
    combat:SetDefaultDamage(35)

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(350)

    local periodicspawner = inst:AddComponent("periodicspawner")
    periodicspawner:SetPrefab("poop")
    periodicspawner:SetRandomTimes(200,400)
    periodicspawner:SetDensityInRange(20, 2)
    periodicspawner:SetMinimumSpacing(15)
    periodicspawner:Start()

    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot(LOOT)

    inst:AddComponent("eater")
    inst.components.eater:SetDiet({ FOODTYPE.VEGGIE }, { FOODTYPE.VEGGIE })
    --inst.components.eater:SetOnEatFn(oneat)

    inst:AddComponent("areaaware")

    inst:AddComponent("acidinfusible")
    inst.components.acidinfusible:SetFXLevel(1)
    inst.components.acidinfusible:SetMultipliers(TUNING.ACID_INFUSION_MULT.WEAKER)

    inst:SetBrain(brain)
    inst:SetStateGraph("SGmonkey")

    inst:AddComponent("knownlocations")
	inst:AddComponent("timer")

    --inst.listenfn = function(listento, data) OnMonkeyDeath(inst, data) end

    inst:ListenForEvent("attacked", OnAttacked)

    MakeHauntablePanic(inst)
    AddHauntableCustomReaction(inst, OnCustomHaunt, true, false, true)

    --inst.weaponitems = {}
    --EquipWeapons(inst)

    return inst
end

return Prefab("monkeyguard", fn, assets, prefabs)