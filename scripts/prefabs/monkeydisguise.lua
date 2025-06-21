
local assets = {
    Asset("ANIM", "anim/hat_dustmonkey.zip"),
}

local function onequip(inst, owner)
	local skin_build = inst:GetSkinBuild()
	if skin_build then
		owner.AnimState:OverrideItemSkinSymbol("swap_hat", skin_build, "swap_hat", inst.GUID, "hat_dustmonkey")
    else
		owner.AnimState:OverrideSymbol("swap_hat", "hat_dustmonkey", "swap_hat")
    end

	owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    owner.AnimState:Show("HEAD")
    owner.AnimState:Hide("HEAD_HAT")
	owner.AnimState:Hide("HEAD_HAT_NOHELM")
	owner.AnimState:Hide("HEAD_HAT_HELM")

	if owner.components.leader then
	    --owner.components.leader:RemoveFollowersByTag("pig")
    end

	if not owner:HasTag("monkey") then
		owner.notamonkey = true
	    owner:AddTag("monkey")
	    owner:AddTag("monkeydisguise")
	end

    --[[if inst.components.fueled ~= nil then
        inst.components.fueled:StartConsuming()
    end]]
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

    if owner.notamonkey then
        owner.notamonkey = nil
        owner:RemoveTag("monkey")
        owner:RemoveTag("monkeydisguise")
    end

    --[[if inst.components.fueled ~= nil then
		inst.components.fueled:StopConsuming()
    end]]
	
end

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("dustmonkeyhat")
    inst.AnimState:SetBuild("hat_dustmonkey")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("hat")
    inst:AddTag("open_top_hat")
    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
	inst.inventory = inst.components.inventoryitem
    inst:AddComponent("inspectable")

    inst:AddComponent("tradable")

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

    --[[inst:AddComponent("fueled")
    inst.components.fueled.fueltype = FUELTYPE.USAGE
    inst.components.fueled:InitializeFuelLevel(30 * 16 * 2) --2 days
    inst.components.fueled:SetDepletedFn(inst.Remove)]]
	
    return inst
end

return Prefab("monkeydisguise", fn, assets)