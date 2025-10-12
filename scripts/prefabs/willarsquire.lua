local assets =
{
    Asset("ANIM", "anim/ui_backpack_2x4.zip"),

    Asset("ANIM", "anim/kiki_basic.zip"),
    Asset("SOUND", "sound/monkey.fsb"),
}

local prefabs = 
{
    "backpack",
}

local brain = require "brains/chesterbrain"

local function OnOpen(inst)
    if not inst.components.health:IsDead() then
    --    inst.sg:GoToState("open")
    end
end

local function OnClose(inst)
    if not inst.components.health:IsDead() and inst.sg.currentstate.name ~= "transition" then
		--inst.sg.statemem.closing = true
       -- inst.sg:GoToState("close")
    end
end

local function fn()
     local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeCharacterPhysics(inst, 75, .5)
    inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
	inst.Physics:SetCollisionMask(
		COLLISION.WORLD,
		COLLISION.OBSTACLES,
		COLLISION.CHARACTERS
	)

    inst:AddTag("companion")
    inst:AddTag("character")
    inst:AddTag("scarytoprey")
    inst:AddTag("notraptrigger")
    inst:AddTag("noauradamage")
    inst:AddTag("devourable")
    inst:AddTag("NOBLOCK")
    inst:AddTag("monkey")
    inst:AddTag("animal")

    inst.AnimState:SetBank("kiki")
    inst.AnimState:SetBuild("kiki_basic")
    inst.AnimState:PlayAnimation("idle_loop", true)

    --inst:AddComponent("container_proxy")
	--inst.components.container_proxy:SetCanBeOpened(false)

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("shadowchester") end
        return inst
    end

    inst:AddComponent("container")
	inst.components.container:WidgetSetup("shadowchester")
	inst.components.container.onopenfn = OnOpen
	inst.components.container.onclosefn = OnClose
	--inst.components.container.skipclosesnd = true
	--inst.components.container.skipopensnd = true

    local locomotor = inst:AddComponent("locomotor")
    locomotor:SetSlowMultiplier( 1 )
    locomotor:SetTriggersCreep(false)
    locomotor.pathcaps = { ignorecreep = false }
    locomotor.walkspeed = TUNING.MONKEY_MOVE_SPEED

    inst:AddComponent("combat")

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(300)
    inst.components.health:StartRegen(TUNING.CHESTER_HEALTH_REGEN_AMOUNT, TUNING.CHESTER_HEALTH_REGEN_PERIOD)

    inst:AddComponent("inspectable")

    inst:AddComponent("embarker")
    inst:AddComponent("drownable")

    inst:AddComponent("follower")
    inst:AddComponent("knownlocations")

    MakeHauntableDropFirstItem(inst)

    inst.soundtype = ""
    inst:SetStateGraph("SGmonkey")
    inst:SetBrain(brain)

    return inst
end

return Prefab("willarsquire", fn, assets, prefabs)