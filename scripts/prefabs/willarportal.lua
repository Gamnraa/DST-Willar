local assets = {
    Asset("ANIM", "anim/pocketwatch_portal.zip"),
}

local function OnActivate(inst, doer)
    if doer.components.talker ~= nil then
        doer.components.talker:ShutUp()
    end

    if doer.components.sanity ~= nil and not (doer:HasTag("willar") or doer:HasTag("nowormholesanityloss")) then
        doer.components.sanity:DoDelta(-TUNING.SANITY_MEDLARGE)
    end
end

local function Close(inst) 
    if not inst.components.teleporter:IsBusy() then
		inst:Remove()
	elseif not inst.queued_close then
		inst.queued_close = true
		inst:ListenForEvent("doneteleporting", Close)
	end
end

local function OnTimerDone(inst, data)
    if data.name == "closedarkportal" then
        Close(inst) 
    end
end
local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.entity:AddPhysics() -- no collision, this is just for buffered actions
    inst.Physics:ClearCollisionMask()
    inst.Physics:SetSphere(1)

    inst.MiniMapEntity:SetIcon("wormhole.png")
    inst.MiniMapEntity:SetPriority(5)

    inst.AnimState:SetBank("pocketwatch_portal_fx")
    inst.AnimState:SetBuild("pocketwatch_portal_fx")
    inst.AnimState:PlayAnimation("portal_entrance_pre")
    inst.AnimState:PushAnimation("portal_entrance_loop", true)
	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetSortOrder(-1)
	inst.AnimState:Hide("front")
	inst.AnimState:Hide("water_shadow")

    inst:AddTag("antlion_sinkhole_blocker")
    inst:AddTag("willarportal")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("teleporter")
    inst.components.teleporter.onActivate = OnActivate
    --inst.components.teleporter.onActivateByOther = OnActivateByOther
    inst.components.teleporter.offset = 0

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", OnTimerDone)

    return inst
end

return Prefab("willarportal", fn, assets)