local assets =
{
    Asset("ANIM", "anim/nightmaresword.zip"),
    Asset("ANIM", "anim/swap_nightmaresword.zip"),
}

local function onequip(inst, owner)
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("equipskinneditem", inst:GetSkinName())
        owner.AnimState:OverrideItemSkinSymbol("swap_object", skin_build, "swap_nightmaresword", inst.GUID, "swap_nightmaresword")
    else
        owner.AnimState:OverrideSymbol("swap_object", "swap_nightmaresword", "swap_nightmaresword")
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

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("nightmaresword")
    inst.AnimState:SetBuild("nightmaresword")
    inst.AnimState:PlayAnimation("idle")
	-- inst:AddTag("propweapon")

    --weapon (from weapon component) added to pristine state for optimization
    inst:AddTag("weapon")
    inst:AddTag("sharp")
    inst:AddTag("shadowlevel")

    inst:AddTag("shadow_item")

    MakeInventoryFloatable(inst, "med", 0.1, {0.7, 0.5, 0.7})

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(42)

    -------

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(100)
    inst.components.finiteuses:SetUses(100)
    inst.components.finiteuses:SetOnFinished(inst.Remove)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.inventory = inst.components.inventoryitem
	inst.inventory.imagename = "nightmaresword"
	--inst.inventory.atlasname = ""

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("planardamage")
    inst.components.planardamage:SetBaseDamage(18)

    inst:AddComponent("damagetypebonus")
    inst.components.damagetypebonus:AddBonus("lunar_aligned", inst, TUNING.WEAPONS_VOIDCLOTH_VS_LUNAR_BONUS) --%10 bonus to lunar aligned

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("willarsword", fn, assets)