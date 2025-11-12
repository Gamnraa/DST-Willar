local assets =
{
    Asset("ANIM", "anim/spider_whistle.zip"),
}

local prefabs = 
{
    "spider_whistle_buff",
    "spider_summoned_buff",
}

local function CanHerd(whistle, leader)
    if not leader:HasTag("willar") then
        return false, "WEBBERONLY"
    end

    return true
end

local function OnHerd(whistle, leader)
    local x, y, z = leader.Transform:GetWorldPosition()

    local ents = TheSim:FindEntities(x, y, z, TUNING.SPIDER_WHISTLE_RANGE, {"monkey"}, {"character"})
    for _, v in pairs(ents) do
        if v.components.sleeper and v.components.sleeper:IsAsleep() then
            v.components.sleeper:WakeUp()
        end
        if v.components.inventory ~= nil then
            v.components.inventory:DropEverything(false, true)
        end
        if v.components.homeseeker ~= nil and v.components.homeseeker.home ~= nil then
            v.components.homeseeker.home:PushEvent("monkeydanger")
        end
    end

    for follower, v in pairs(leader.components.leader.followers) do
        if follower:HasTag("monkey") and not follower:HasTag("character") then
            if follower.components.inventory ~= nil then
                follower.components.inventory:DropEverything(false, true)
            end
            if follower.components.homeseeker ~= nil and follower.components.homeseeker.home ~= nil then
                follower.components.homeseeker.home:PushEvent("monkeydanger")
            end
        end
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("spider_whistle")
    inst.AnimState:SetBuild("spider_whistle")
    inst.AnimState:PlayAnimation("idle", true)
    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst, "small", 0.15, 0.9)

	inst:AddTag("willarwhistle")

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst:AddComponent("inspectable")
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetOnFinished(function() inst:Remove() end)

    inst:AddComponent("followerherder")
    inst.components.followerherder:SetCanHerdFn(CanHerd)
    inst.components.followerherder:SetOnHerdFn(OnHerd)
    inst.components.followerherder:SetUseAmount(TUNING.SPIDER_WHISTLE_USE_AMOUNT)

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)

    MakeSmallPropagator(inst)
    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("willarwhistle", fn, assets, prefabs)