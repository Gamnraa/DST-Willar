
local assets =
{
    Asset("ANIM", "anim/hat_ruins.zip"),
}

local function dobuff(inst, owner)
    for follower, _ in pairs(owner.components.leader.followers) do
        if follower:HasTag("monkey") then
            follower.components.combat.externaldamagemultipliers:SetModifier(follower, inst.prefab == "willarcrown" and 1.15 or 1.35, "willarcrownbuff")
            print(owner.willar_nightmaremode)
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
    owner.AnimState:OverrideSymbol("swap_hat", "hat_ruins", "hat_ruins")
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
    
    removebuff(inst, owner)
end

local function ondepleted(inst)
    local owner = inst.components.inventoryitem:GetGrandOwner()
    if owner then
        removebuff(inst, owner)
    end

    if inst == "willarcrown" then inst:Remove() end
end

local function ontakefuel(inst)
    if inst.components.equippable:IsEquipped() and not inst.components.fueled:IsEmpty() then
        dobuff(inst, inst.components.inventoryitem:GetGrandOwner())
    end
end

local function makecrown(name)
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("ruinshat")
        inst.AnimState:SetBuild("hat_ruins")
        inst.AnimState:PlayAnimation("anim")

        inst:AddTag("hat")
        inst:AddTag("willarcrown")
        MakeInventoryFloatable(inst)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED

        inst:AddComponent("fueled")
        inst.components.fueled.fueltype = FUELTYPE.NIGHTMARE
        inst.components.fueled:InitializeFuelLevel(30 * 16 * 3) --3 days
        inst.components.fueled:SetDepletedFn(ondepleted)
        inst.components.fueled:SetTakeFuelFn(ontakefuel)
        inst.components.fueled.accepting = true

        inst:AddComponent("inventoryitem")
        inst.inventory = inst.components.inventoryitem
        inst.inventory.imagename = "ruinshat"
        --inst.inventory.atlasname = "images/inventoryimages/ruinshat.xml"
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

        --inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED_LARGE

        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses(150)
        inst.components.finiteuses:SetUses(150)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
	
    return Prefab(name, fn, assets)
end

--MOVE TO OWN STRINGS FILE WHEN SET UP
STRINGS.NAMES.WILLARCROWN = "Placeholder"

return makecrown("willarcrown"),
        makecrown("willarcrown_ruins")
