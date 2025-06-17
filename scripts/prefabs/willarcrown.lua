
local assets =
{
    Asset("ANIM", "anim/willarcrown.zip"),
    Asset("ANIM", "anim/willarcrown_ruins.zip")
}

local function dobuff(inst, owner)
    for follower, _ in pairs(owner.components.leader.followers) do
        if follower:HasTag("monkey") then
            follower.components.combat.externaldamagemultipliers:SetModifier(follower, inst.prefab == "willarcrown" and 1.15 or 1.35, "willarcrownbuff")
            if follower.prefab == "monkey" and owner.willar_nightmaremode then
                follower.keepnightmareform = follower:DoPeriodicTask(55, function() owner.nightmaremonkeyloop(follower) end)
                follower:DoTaskInTime(.15, function() follower:PushEvent("ms_forcenightmarestate", {duration = 60}) end)
            end
        end
    end
end

local function removebuff(inst, owner)
    for follower, _ in pairs(owner.components.leader.followers) do
        if follower:HasTag("monkey") then
            follower.components.combat.externaldamagemultipliers:SetModifier(follower, 1.00, "willarcrownbuff")
            if follower.prefab == "monkey" then
                follower.components.timer:StopTimer("forcenightmare")
				if follower.keepnightmareform then follower.keepnightmareform:Cancel() end
				follower:PushEvent("changearea", follower.components.areaaware.current_area_data)
            end
        end
    end
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", inst.prefab, "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    owner.AnimState:Show("HEAD")
    owner.AnimState:Hide("HEAD_HAT")
	owner.AnimState:Hide("HEAD_HAT_NOHELM")
	owner.AnimState:Hide("HEAD_HAT_HELM")

    owner:DoTaskInTime(.15, dobuff, owner)

    if inst.components.fueled ~= nil then
        inst.components.fueled:StartConsuming()
    end

    if inst.prefab == "willarcrown_ruins" then
        inst.onattach(owner)
    end
end

local function onunequip(inst, owner)
	local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("unequipskinneditem", inst:GetSkinName())
    end

    owner.AnimState:ClearOverrideSymbol("swap_hat")
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end

    if inst.components.fueled ~= nil then
        inst.components.fueled:StopConsuming()
    end

    if inst.components.fueled ~= nil then
		inst.components.fueled:StopConsuming()
    end
    
    if inst._fx ~= nil then
        inst._fx:kill_fx()
        inst._fx = nil
    end

    removebuff(inst, owner)

    if inst.prefab == "willarcrown_ruins" then
        inst.ondetach()
    end
end

local function ondepleted(inst)
    local owner = inst.components.inventoryitem:GetGrandOwner()
    if owner then
        removebuff(inst, owner)
    end

    if inst._fx ~= nil then
        inst._fx:kill_fx()
        inst._fx = nil
    end

    if inst == "willarcrown" then inst:Remove() end
end

local function ontakefuel(inst)
    if inst.components.equippable:IsEquipped() and not inst.components.fueled:IsEmpty() then
        dobuff(inst, inst.components.inventoryitem:GetGrandOwner())
    end
end

local function ruinshat_fxanim(inst)
    inst._fx.AnimState:PlayAnimation("hit")
    inst._fx.AnimState:PushAnimation("idle_loop")
end

local function ruinshat_oncooldown(inst)
    inst._task = nil
end

local function ruinshat_unproc(inst)
    if inst:HasTag("forcefield") then
        inst:RemoveTag("forcefield")
        if inst._fx ~= nil then
            inst._fx:kill_fx()
            inst._fx = nil
        end
        inst:RemoveEventCallback("armordamaged", ruinshat_fxanim)

        inst.components.armor:SetAbsorption(0)
        inst.components.armor.ontakedamage = nil

        if inst._task ~= nil then
            inst._task:Cancel()
        end
        inst._task = inst:DoTaskInTime(TUNING.ARMOR_RUINSHAT_COOLDOWN, ruinshat_oncooldown)
    end
end

local function ruinshat_proc(inst, owner)
    inst:AddTag("forcefield")
    if inst._fx ~= nil then
        inst._fx:kill_fx()
    end
    inst._fx = SpawnPrefab("forcefieldfx")
    inst._fx.entity:SetParent(owner.entity)
    inst._fx.Transform:SetPosition(0, 0.2, 0)
    inst:ListenForEvent("armordamaged", ruinshat_fxanim)

    inst.components.armor:SetAbsorption(TUNING.FULL_ABSORPTION)
    inst.components.armor.ontakedamage = function(inst, damage_amount)
        if owner ~= nil and owner.components.sanity ~= nil then
            owner.components.sanity:DoDelta(-damage_amount * TUNING.ARMOR_RUINSHAT_DMG_AS_SANITY, false)
        end
    end

    if inst._task ~= nil then
        inst._task:Cancel()
    end
    inst._task = inst:DoTaskInTime(TUNING.ARMOR_RUINSHAT_DURATION, ruinshat_unproc)
end

local function tryproc(inst, owner, data)
    if inst._task == nil and
        not data.redirected and
        math.random(100) < 13 then
        ruinshat_proc(inst, owner)
    end
end

local function makecrown(name)
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank(name)
        inst.AnimState:SetBuild(name)
        inst.AnimState:PlayAnimation("anim")

        inst:AddTag("hat")
        inst:AddTag("willarcrown")
        MakeInventoryFloatable(inst)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("fueled")
        inst.components.fueled.fueltype = FUELTYPE.NIGHTMARE
        inst.components.fueled:InitializeFuelLevel(30 * 16 * 3) --3 days
        inst.components.fueled:SetDepletedFn(ondepleted)
        inst.components.fueled:SetTakeFuelFn(ontakefuel)
        inst.components.fueled.accepting = true

        inst:AddComponent("inventoryitem")
        inst.inventory = inst.components.inventoryitem
        inst:AddComponent("inspectable")

        --inst:AddComponent("tradable")

        inst:AddComponent("equippable")
        inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
        inst.components.equippable:SetOnEquip(onequip)
        inst.components.equippable:SetOnUnequip(onunequip)

        MakeHauntableLaunch(inst)
            

        inst.components.floater:SetSize("med")
        inst.components.floater:SetVerticalOffset(0.1)
        inst.components.floater:SetScale(0.65)

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("armor")
        inst.components.armor:InitCondition(TUNING.ARMOR_RUINSHAT, 0)

        if name == "willarcrown_ruins" then
            inst._fx = nil
            inst._task = nil
            inst._owner = nil
            inst.procfn = function(owner, data) tryproc(inst, owner, data) end
            inst.onattach = function(owner)
                if inst._owner ~= nil then
                    inst:RemoveEventCallback("attacked", inst.procfn, inst._owner)
                    inst:RemoveEventCallback("onremove", inst.ondetach, inst._owner)
                end
                inst:ListenForEvent("attacked", inst.procfn, owner)
                inst:ListenForEvent("onremove", inst.ondetach, owner)
                inst._owner = owner
                inst._fx = nil
                end
            inst.ondetach = function()
                ruinshat_unproc(inst)
                if inst._owner ~= nil then
                    inst:RemoveEventCallback("attacked", inst.procfn, inst._owner)
                    inst:RemoveEventCallback("onremove", inst.ondetach, inst._owner)
                    inst._owner = nil
                    inst._fx = nil
                end
            end
        end

        inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED_LARGE

        return inst
    end
	
    return Prefab(name, fn, assets)
end

return makecrown("willarcrown"),
        makecrown("willarcrown_ruins")
