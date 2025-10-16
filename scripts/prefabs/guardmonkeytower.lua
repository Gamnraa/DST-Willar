require("worldsettingsutil")

local assets =
{
    Asset("ANIM", "anim/monkeytower.zip"),
    --Asset("MINIMAP_IMAGE", "merm_guard_tower"),
}

local prefabs =
{
    "monkeyguard",
    "collapse_big",
}

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst:RemoveComponent("childspawner")
    inst.components.lootdropper:DropLoot()

    local fx = SpawnPrefab("collapse_big")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        if inst.components.childspawner ~= nil then
            inst.components.childspawner:ReleaseAllChildren(worker)
        end
        --inst.AnimState:PlayAnimation("hit")
        inst.AnimState:PushAnimation("idle", true)
        testforflag(inst)
    end
end

local function StartSpawning(inst)
    inst.components.childspawner:StartSpawning()
    inst.components.spawner:Configure("powdermonkeyguard", 3 * 8 * 60)
end

local function StopSpawning(inst)
    if inst.components.childspawner ~= nil and not inst:HasTag("burnt") then
        inst.components.childspawner:StopSpawning()
        inst.components.spawn:CancelSpawning()
    end
end

local function OnSpawned(inst, child)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("dontstarve/common/pighouse_door")
        if TheWorld.state.isnight and
                inst.components.childspawner ~= nil and
                inst.components.childspawner:CountChildrenOutside() >= 1 and
                child.components.combat.target == nil then
            StopSpawning(inst)
        end
    end
end


local function OnGoHome(inst, child)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("dontstarve/common/pighouse_door")
        if inst.components.childspawner ~= nil and
                inst.components.childspawner:CountChildrenOutside() < 1 then
            StartSpawning(inst)
        end
    end
end


local function onbuilt(inst)
    inst.SoundEmitter:PlaySound("dontstarve/characters/wurt/merm/hut/guard_place")
end

local function OnPreLoad(inst, data)
    WorldSettings_ChildSpawner_PreLoad(inst, data, TUNING.MERMWATCHTOWER_RELEASE_TIME, TUNING.MERMWATCHTOWER_REGEN_TIME)
end

local function UpdateSpawningTime(inst, data)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, 1)

    --inst.MiniMapEntity:SetIcon("merm_guard_tower.png")

    inst.AnimState:SetBank("monkeytower")
    inst.AnimState:SetBuild("monkeytower")
    inst.AnimState:PlayAnimation("idle", true)

    inst:AddTag("structure")

    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("lootdropper")

    local workable = inst:AddComponent("workable")
    workable:SetWorkAction(ACTIONS.HAMMER)
    workable:SetWorkLeft(2)
    workable:SetOnFinishCallback(onhammered)
    workable:SetOnWorkCallback(onhit)

    local childspawner = inst:AddComponent("childspawner")
    childspawner.childname = "monkeyguard"
    childspawner:SetSpawnedFn(OnSpawned)
    childspawner:SetGoHomeFn(OnGoHome)
    childspawner:SetRegenPeriod(2 * 8 * 60)
    childspawner:SetSpawnPeriod(5)
    childspawner:SetMaxChildren(2)
    childspawner:StartSpawning()

    local spawner = inst:AddComponent("spawner")
    spawner:Configure("powdermonkeyguard", 3 * 8 * 60)
    --spawner:ReleaseChild()

    --WorldSettings_ChildSpawner_SpawnPeriod(inst, TUNING.MERMWATCHTOWER_RELEASE_TIME, true)
    --WorldSettings_ChildSpawner_RegenPeriod(inst, TUNING.MERMWATCHTOWER_REGEN_TIME, true)
    --[[if not TUNING.MERMWATCHTOWER_ENABLED then
        childspawner.childreninside = 0
    end]]

    inst:AddComponent("inspectable")
    --inst.components.inspectable.descriptionfn = DescriptionFn

    --StartSpawning(inst)

    MakeHauntableWork(inst)
    MakeMediumBurnable(inst, nil, nil, true)
    MakeLargePropagator(inst)
    MakeSnowCovered(inst)

    inst.UpdateSpawningTime = UpdateSpawningTime

    inst:ListenForEvent("onbuilt", onbuilt)

    inst.OnPreLoad = OnPreLoad

    return inst
end

return Prefab("guardmonkeytower", fn, assets, prefabs),
    MakePlacer("guardmonkeytower_placer", "guardmonkeytower", "guardmonkeytower", "idle")
