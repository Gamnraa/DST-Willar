require("worldsettingsutil")
require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/monkey_barrel.zip"),
    Asset("SOUND", "sound/monkey.fsb"),
}

local prefabs =
{
    "farmer_monkey",
    "collapse_small",
}

local spawntime = 8 * 60 * 4 -- four days


local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or "GENERIC"
end

local function onhammered(inst)
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if inst.components.childspawner ~= nil then
        inst.components.childspawner:ReleaseAllChildren(worker)
    end
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation("idle", false)
end

local function OnStartDay(inst)
    if not inst:HasTag("burnt")
    and inst.components.spawner:IsOccupied() then
        inst.components.spawner:ReleaseChild()
    end
end

local function onvacate(inst, child)
    if not inst:HasTag("burnt") then
        if child then
            local child_platform = TheWorld.Map:GetPlatformAtPoint(child.Transform:GetWorldPosition())
            if (child_platform == nil and not child:IsOnValidGround()) then
                local fx = SpawnPrefab("splash_sink")
                fx.Transform:SetPosition(child.Transform:GetWorldPosition())

                child:Remove()
            else
                if child.components.health then
                    child.components.health:SetPercent(1)
                end
			    child:PushEvent("onvacatehome")
            end
        end
    end
end

local function OnIgniteFn(inst)
    if inst.components.spawner ~= nil and inst.components.spawner:IsOccupied() then
        inst.components.spawner:ReleaseChild()
    end
end

local function ongohome(inst, child)
    if child.components.inventory ~= nil then
        child.components.inventory:DropEverything(false, false)
    end
end


local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
end

local function spawncheckday(inst)
    inst.inittask = nil
    inst:WatchWorldState("startcaveday", OnStartDay)
    if inst.components.spawner ~= nil and inst.components.spawner:IsOccupied() then
        if TheWorld.state.iscaveday or
            (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
            inst.components.spawner:ReleaseChild()
        end
    end
end

local function oninit(inst)
    inst.inittask = inst:DoTaskInTime(math.random(), spawncheckday)
    if inst.components.spawner ~= nil and
        inst.components.spawner.child == nil and
        inst.components.spawner.childname ~= nil and
        not inst.components.spawner:IsSpawnPending() then
        local child = SpawnPrefab(inst.components.spawner.childname)
        if child ~= nil then
            inst.components.spawner:TakeOwnership(child)
            inst.components.spawner:GoHome(child)
        end
    end
end


local function OnPreLoad(inst, data)
    WorldSettings_Spawner_PreLoad(inst, data, spawntime)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("monkeybarrel.png")

    MakeObstaclePhysics(inst, 1)

    inst.AnimState:SetBank("barrel")
    inst.AnimState:SetBuild("monkey_barrel")
    inst.AnimState:PlayAnimation("idle", true)

    inst:AddTag("structure")

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("spawner")
    WorldSettings_Spawner_SpawnDelay(inst, spawntime, true) --4 Days
    inst.components.spawner:Configure("farmer_monkey", spawntime)
    --inst.components.spawner.onoccupied = onoccupied
    inst.components.spawner.onvacate = onvacate
    inst.components.spawner:SetWaterSpawning(false, true)
    inst.components.spawner:CancelSpawning()

    inst:AddComponent("lootdropper")
    local workable = inst:AddComponent("workable")
    workable:SetWorkAction(ACTIONS.HAMMER)
    workable:SetWorkLeft(4)
    workable:SetOnFinishCallback(onhammered)
    workable:SetOnWorkCallback(onhit)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    MakeLargeBurnable(inst)
	MakeLargePropagator(inst)
    inst:ListenForEvent("onignite", OnIgniteFn)

    MakeHauntableWork(inst)

    inst.OnPreLoad = OnPreLoad
    inst.OnSave = onsave
    inst.OnLoad = onload

    inst.inittask = inst:DoTaskInTime(0, oninit)

    return inst
end

return Prefab("farmermonkeypod", fn, assets, prefabs),
    MakePlacer("farmermonkeypod_placer", "barrel", "monkey_barrel", "idle"),
    MakePlacer("monkeybarrel_placer", "barrel", "monkey_barrel", "idle"),
    MakePlacer("monkeyhut_placer", "monkeyhut", "monkeyhut", "idle")
