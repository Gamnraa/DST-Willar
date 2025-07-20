local assets =
{
    Asset("ANIM", "anim/monkeygoldsword.zip"),
    Asset("ANIM", "anim/monkeygoldsword_ground.zip"),
}


local SpDamageUtil = require"components/spdamageutil"


local function onequip(inst, owner)
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("equipskinneditem", inst:GetSkinName())
        owner.AnimState:OverrideItemSkinSymbol("swap_object", skin_build, "monkeygoldsword", inst.GUID, "swap_nightmaresword")
    else
        owner.AnimState:OverrideSymbol("swap_object", "monkeygoldsword", "swap_goldsword")
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

local function onattack(inst, attacker, target)
    if target.components.health:IsDead() and target.components.lootdropper then
        inst:DoTaskInTime(0, function() 
            if not Gram_LootDropped[target.GUID] then return end
            local loot = Gram_LootDropped[target.GUID][math.random(#Gram_LootDropped[target.GUID])]
            local loot = SpawnPrefab(loot)
            target.components.lootdropper:FlingItem(loot, target:GetPosition())

            if Gram_DroppedChanceLoot[target.GUID] and Gram_DroppedChanceLoot[target.GUID] ~= true and math.random(100) < 25 then
                print("drop chance loot")
                local loots = {}
                local t = LootTables[lootdropper.chanceloottable]
				if t then
					for k, v in pairs(LootTables[lootdropper.chanceloottable]) do
						if v[2] < 1.00 then table.insert(loots, v[1]) end
					end
				end

                local loot = loots[math.random(#loots)]
			    loot = SpawnPrefab(loot)
			    lootdropper:FlingItem(loot, target:GetPosition())
            end 
        end)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("monkeygoldsword_ground")
    inst.AnimState:SetBuild("monkeygoldsword_ground")
    inst.AnimState:PlayAnimation("anim")
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
    inst.components.weapon:SetOnAttack(onattack)

    -------

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(100)
    inst.components.finiteuses:SetUses(100)
    inst.components.finiteuses:SetOnFinished(inst.Remove)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.inventory = inst.components.inventoryitem

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