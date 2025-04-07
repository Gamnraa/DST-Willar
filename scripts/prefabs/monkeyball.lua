
local assets = 
{
    Asset("ANIM", "anim/monkey_projectile.zip")
}


local function onequip(inst, owner)
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("equipskinneditem", inst:GetSkinName())
        owner.AnimState:OverrideItemSkinSymbol("swap_object", skin_build, "swap_boomerang", inst.GUID, "swap_boomerang")
    else
        owner.AnimState:OverrideSymbol("swap_object", "swap_boomerang", "swap_boomerang")
    end
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("unequipskinneditem", inst:GetSkinName())
    end
end

local function ontimerdone(inst, data)
    if data.name == "monkeydebuffover" then
        inst.components.debuff:Stop()
    end
end

local function ondetachedslow(inst, target)
	if target.components.locomotor then
		target.components.locomotor:SetExternalSpeedMultiplier(target, "willarspeeddebuff", 1.00)
	end
	inst:Remove()
end

local function onattachedslow(inst, target)
    inst.entity:SetParent(target.entity)
	inst.Transform:SetPosition(0, 0, 0)
	inst:ListenForEvent("death", function()
		inst.components.debuff:Stop()
	end, target)

	if target.components.locomotor then
		target.components.locomotor:SetExternalSpeedMultiplier(target, "willarspeeddebuff", .67)
	end
end

local function onhit_normal(inst, owner, target)
    target:AddDebuff("monkeyball_slowbuff", "monkeyball_slowbuff")
end

local function makeball(name, build, damage, onhitfn)
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)
        RemovePhysicsColliders(inst)

        inst.AnimState:SetBank("boomerang")
        inst.AnimState:SetBuild("boomerang")
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:SetRayTestOnBB(true)

        inst:AddTag("thrown")

        --weapon (from weapon component) added to pristine state for optimization
        inst:AddTag("weapon")

        --projectile (from projectile component) added to pristine state for optimization
        inst:AddTag("projectile")

        local swap_data = {sym_build = "swap_boomerang"}
        MakeInventoryFloatable(inst, "small", 0.18, {0.8, 0.9, 0.8}, true, -6, swap_data)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("weapon")
        inst.components.weapon:SetDamage(damage)
        inst.components.weapon:SetRange(30, 31)
        inst:AddComponent("inspectable")

        inst:AddComponent("projectile")
        inst.components.projectile:SetSpeed(25)
        inst.components.projectile:SetOnHitFn(onhitfn)
    
        inst:AddComponent("inventoryitem")
        --inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    
        inst:AddComponent("equippable")
        inst.components.equippable:SetOnEquip(onequip)
        inst.components.equippable:SetOnUnequip(onunequip)
    
        MakeHauntableLaunch(inst)
    
        return inst
    end
    
    return Prefab(name, fn, assets)
end

local function makebuff(name, attachedfn, detachedfn, duration, priority, prefabs)
    local function fn()
        local inst = CreateEntity()
        if not TheWorld.ismastersim then
            inst:DoTaskInTime(0, inst.Remove)
            return inst
        end
        inst.entity:AddTransform()
        --[[Non-networked entity]]
        --inst.entity:SetCanSleep(false)
        inst.entity:Hide()
        inst.persists = false

        inst:AddTag("CLASSIFIED")

        inst:AddComponent("debuff")
        inst.components.debuff:SetAttachedFn(attachedfn)
        inst.components.debuff:SetDetachedFn(detachedfn)
        inst.components.debuff.keepondespawn = true

        inst:AddComponent("timer")
        inst.components.timer:StartTimer("monkeydebuffover", duration)
        inst:ListenForEvent("timerdone", ontimerdone)

        return inst
    end
    return Prefab(name, fn, nil, prefabs)
end

STRINGS.NAMES.MONKEYBALL = "Poo Ball"

return makeball("monkeyball", nil, 4, onhit_normal),
    makebuff("monkeyball_slowbuff", onattachedslow, ondetachedslow, 30, 1, {})