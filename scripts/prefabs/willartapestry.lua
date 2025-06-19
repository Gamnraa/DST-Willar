local assets =
{
    Asset("ANIM", "anim/merm_king_carpet.zip"),
    Asset("MINIMAP_IMAGE", "merm_king_carpet"),
}


local function anytapestryhaspower()
    for _, v in pairs(TheSim:FindEntities(0,0,0, 9009, {"willarblanket"})) do
        if v.powered then return true end
    end
    return false
end

local function onpoweredup(inst)
    
    if not TheWorld.willartapestrypowered then
        local x,y,z = inst.Transform:GetWorldPosition()
        for _, v in pairs(TheSim:FindEntities(x,y,z, 9009, nil, nil, {"monkey", "wonkey"})) do
            if v:HasTag("player") then
                Gram_UpdateMaxHealth(v, 10)
                Gram_UpdateMaxSanity(v, 10)
                Gram_UpdateMaxSanity(v, 10)
            else
                Gram_UpdateMaxHealth(v, WILLAR_TAPESTRY_BUFF_HEALTH)
                v.components.combat.externaldamagemultipliers:SetModifier(v, WILLAR_TAPESTRY_BUFF_ATTACK, "willartapestryactive")
            end
        end
    end
    inst.powered = true
    TheWorld.willartapestrypowered = true
end

local function onlosepower(inst)
    inst.powered = false
    if not anytapestryhaspower() then
        local x,y,z = inst.Transform:GetWorldPosition()
        for _, v in pairs(TheSim:FindEntities(x,y,z, 9009, nil, nil, {"monkey", "wonkey"})) do
            if v:HasTag("player") then
                Gram_UpdateMaxHealth(v, -10)
                Gram_UpdateMaxSanity(v, -10)
                Gram_UpdateMaxSanity(v, -10)
            else
                Gram_UpdateMaxHealth(v, -WILLAR_TAPESTRY_BUFF_HEALTH)
                v.components.combat.externaldamagemultipliers:SetModifier(v, 1.00, "willartapestryactive")
            end
        end
        TheWorld.willartapestrypowered = false
    end
end

local function ontimerdone(inst, data)
    if data.name == "willartapestry" then
        --Debuff monkeys
        onlosepower(inst)
        --make component accept materials again
    end
end

local function onconstructed(inst, doer)
end

local function onremoved(inst)
    onlosepower(inst)
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

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.Transform:SetScale(0.9, 0.9, 0.9)

    inst.MiniMapEntity:SetIcon("merm_king_carpet.png")

    inst.AnimState:SetBank("merm_king_carpet")
    inst.AnimState:SetBuild("merm_king_carpet")
    inst.AnimState:PlayAnimation("idle", true)

    inst.AnimState:SetOrientation( ANIM_ORIENTATION.OnGround )
    inst.AnimState:SetLayer( LAYER_BACKGROUND )
    inst.AnimState:SetSortOrder( 3 )

    inst:AddTag("mermthrone")

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("lootdropper")

    local workable = inst:AddComponent("workable")
    workable:SetWorkAction(ACTIONS.HAMMER)
    workable:SetWorkLeft(4)
    workable:SetOnFinishCallback(onhammered_regular)
   
    MakeHauntableWork(inst)

    inst:ListenForEvent("ondeconstructstructure", onremoved)
    inst:ListenForEvent("onremove", onremoved)

    inst.powered = false

    return inst
end

return Prefab("willartapestry", fn, assets)