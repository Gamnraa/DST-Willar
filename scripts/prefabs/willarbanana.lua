local assets =
{
    Asset("ANIM", "anim/royalbanana.zip"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("royalbanana")
    inst.AnimState:SetBuild("royalbanana")
    inst.AnimState:PlayAnimation("anim")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("tradable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "royalbanana"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/royalbanana.xml"

    return inst
end

return Prefab("willarbanana", fn, assets)