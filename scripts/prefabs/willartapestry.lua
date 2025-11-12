local assets =
{
    Asset("ANIM", "anim/monkey_carpet.zip"),
    Asset("MINIMAP_IMAGE", "merm_king_carpet"),
}

CONSTRUCTION_PLANS["willartapestry"] = {Ingredient("cave_banana", 2), Ingredient("nightmarefuel", 4)}

local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or "GENERIC"
end

local function anytapestryhaspower()
    for _, v in pairs(TheSim:FindEntities(0,0,0, 9009, {"willarblanket"})) do
        if v.powered then return true end
    end
    return false
end

local function tapestryloop()
    if not (TheWorld.components.piratespawner or TheWorld.components.piratespawner.queen) then return end
    local timer = TheWorld.components.piratespawner.queen.components.timer
	local time = timer:TimerExists("right_of_passage") and timer:GetTimeLeft("right_of_passage") or 0
	timer:StopTimer("right_of_passage")
	timer:StartTimer("right_of_passage", 60 + time)
end

local function onpoweredup(inst)
    
    if not TheWorld.willartapestrypowered then
        local x,y,z = inst.Transform:GetWorldPosition()
        for _, v in pairs(TheSim:FindEntities(x,y,z, 9009, nil, nil, {"monkey", "wonkey"})) do
            if v:HasTag("player") then
                Gram_UpdateMaxHealth(v, 50)
                --Gram_UpdateMaxSanity(v, 100)
                Gram_UpdateMaxHunger(v, 50)
            else
                if v.components.health then Gram_UpdateMaxHealth(v, WILLAR_TAPESTRY_BUFF_HEALTH) end
                if v.components.combat then v.components.combat.damagebonus = inst.prefab == "monkey" and WILLAR_TAPESTRY_BUFF_ATTACK or (WILLAR_TAPESTRY_BUFF_ATTACK + 8) end
            end
        end
    end
    inst.powered = true

    TheWorld.willartapestrypowered = true
    if not TheWorld.willartapestryloop and TheWorld.components.piratespawner and TheWorld.components.piratespawner.queen then
        tapestryloop()
        TheWorld.willartapestryloop = TheWorld:DoPeriodicTask(55, function() tapestryloop() end)
    end

    inst.components.sleepingbag.health_tick = TUNING.SLEEP_HEALTH_PER_TICK * 4
    inst.Light:Enable(true)
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
end

local function onconstructed(inst, doer)
    local concluded = true
    for _, v in ipairs(CONSTRUCTION_PLANS["willartapestry"]) do
        if inst.components.constructionsite:GetMaterialCount(v.type) < v.amount then
            concluded = false
            break
        end
    end

    if concluded then
        onpoweredup(inst)
        inst.SoundEmitter:PlaySound("dontstarve/characters/wurt/merm/throne/build")
        inst.components.timer:StartTimer("willartapestry", 8 * 60 * 3) -- 3 days DST time
        inst:DoTaskInTime(0, function() inst:RemoveComponent("constructionsite") end)
    end
end

local function onlosepower(inst)
    inst.powered = false
    inst.components.sleepingbag.health_tick = TUNING.SLEEP_HEALTH_PER_TICK * 2
    if not inst:HasTag("burnt") then
        local constructionsite = inst:AddComponent("constructionsite")
        constructionsite:SetConstructionPrefab("construction_container")
        constructionsite:SetOnConstructedFn(onconstructed)
    end

    if not anytapestryhaspower() then
        if TheWorld.components.piratespawner and TUNING.PIRATE_RAIDS_ENABLED and not TheWorld.willartapestryloop then
            TheWorld.willartapestryloop:Cancel()
            TheWorld.willartapestryloop = nil
        end
        local x,y,z = inst.Transform:GetWorldPosition()
        for _, v in pairs(TheSim:FindEntities(x,y,z, 9009, nil, nil, {"monkey", "wonkey"})) do
            if v:HasTag("player") then
                Gram_UpdateMaxHealth(v, -50)
                Gram_UpdateMaxSanity(v, -100)
            else
                if v.components.health then Gram_UpdateMaxHealth(v, -WILLAR_TAPESTRY_BUFF_HEALTH) end
                if v.components.combat then v.components.combat.damagebonus = 0 end
            end
        end

        TheWorld.willartapestrypowered = false

        inst.Light:Enable(false)
        inst.AnimState:ClearBloomEffectHandle()
    end
end

local function onremoved(inst)
    onlosepower(inst)
end

local function ontimerdone(inst, data)
    if data.name == "willartapestry" then
        --Debuff monkeys
        onlosepower(inst)
    end
end


local function onhammered_regular(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_big")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onburnt(inst)
    onlosepower(inst)
end

local function onsleep(inst, sleeper)
    sleeper.AnimState:OverrideSymbol("swap_bedroll", "swap_bedroll_straw", "bedroll_straw")
end

local function onsave(inst, data)
    data.powered = inst.powered
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    inst.powered = data and data.powered or false
    if data and data.burnt then inst.components.burnable.onburnt(inst) end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.Transform:SetScale(0.9, 0.9, 0.9)

    inst.MiniMapEntity:SetIcon("merm_king_carpet.png")

    inst.Light:SetFalloff(1.22)
    inst.Light:SetIntensity(.35)
    inst.Light:SetRadius(3)
    inst.Light:SetColour(180 / 255, 195 / 255, 225 / 255)
    inst.Light:Enable(false)
    inst.AnimState:ClearBloomEffectHandle()

    inst.AnimState:SetBank("monkey_carpet")
    inst.AnimState:SetBuild("monkey_carpet")
    inst.AnimState:PlayAnimation("idle")

    inst.AnimState:SetOrientation( ANIM_ORIENTATION.OnGround )
    inst.AnimState:SetLayer( LAYER_BACKGROUND )
    inst.AnimState:SetSortOrder( 3 )

    inst.AnimState:SetLightOverride(0.5)

    inst:AddTag("light")

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("lootdropper")

    local workable = inst:AddComponent("workable")
    workable:SetWorkAction(ACTIONS.HAMMER)
    workable:SetWorkLeft(4)
    workable:SetOnFinishCallback(onhammered_regular)
   
    MakeHauntableWork(inst)
    MakeLargeBurnable(inst, nil, nil, true)

    local constructionsite = inst:AddComponent("constructionsite")
    constructionsite:SetConstructionPrefab("construction_container")
    constructionsite:SetOnConstructedFn(onconstructed)

    inst:DoTaskInTime(0, function()
        if inst.powered then
            inst:RemoveComponent("constructionsite")
            inst:AddTag("construnctionsite")
            inst.Light:Enable(true)
            inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
            TheWorld.willartapestrypowered = true
            if not TheWorld.willartapestryloop and TheWorld.components.piratespawner and TheWorld.components.piratespawner.queen then
                tapestryloop()
                TheWorld.willartapestryloop = TheWorld:DoPeriodicTask(55, function() tapestryloop() end)
            end
        else 
            inst.Light:Enable(false)
            inst.AnimState:ClearBloomEffectHandle()
            TheWorld.willartapestrypowered = false
            if TheWorld.willartapestryloop then
                TheWorld.willartapestryloop:Cancel()
                TheWorld.willartapestryloop = nil
            end
        end
    end)

    inst:ListenForEvent("ondeconstructstructure", onremoved)
    inst:ListenForEvent("onremove", onremoved)
    inst:ListenForEvent("onburnt", onburnt)

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", ontimerdone)

    inst:AddComponent("sleepingbag")
    inst.components.sleepingbag.onsleep = onsleep
    --inst.components.sleepingbag.onwake = onwake
    inst.components.sleepingbag.health_tick = TUNING.SLEEP_HEALTH_PER_TICK * 2
    inst.components.sleepingbag.hunger_tick = -2

    inst:AddComponent("doubleactionfix")

    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

STRINGS.NAMES.CONSTRUCT_WILLAR_TAPESTRY = "Power On"

return Prefab("willartapestry", fn, assets),
    MakePlacer("willartapestry_placer", "monkey_carpet", "monkey_carpet", "idle")