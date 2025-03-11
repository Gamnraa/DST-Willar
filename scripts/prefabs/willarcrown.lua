
local assets =
{
    Asset("ANIM", "anim/hat_ruins.zip"),
}

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

    for follower, _ in pairs(owner.components.leader.followers) do
        if follower:HasTag("monkey") then
            follower.components.combat.externaldamagemultipliers:SetModifier(follower, inst.prefab == "willarcrown" and 1.25 or 1.50, "willarcrownbuff")
            if follower.prefab == "monkey" then
                follower.keepnightmareform = follower:DoPeriodicTask(55, function() owner.nightmaremonkeyloop(follower) end)
				follower:PushEvent("changearea", follower.components.areaaware.current_area_data)
            end
        end
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

    for follower, _ in pairs(owner.components.leader.followers) do
        if follower:HasTag("monkey") then
            follower.components.combat.externaldamagemultipliers:SetModifier(follower, 1.00, "willarcrownbuff")
            if follower.prefab == "monkey" then
                follower.components.timer:StopTimer("forcenightmare")
				follower.keepnightmareform:Cancel()
				follower:PushEvent("changearea", follower.components.areaaware.current_area_data)
            end
        end
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
