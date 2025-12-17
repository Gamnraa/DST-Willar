local assets =
{
    Asset("ANIM", "anim/ui_backpack_2x4.zip"),

    Asset("ANIM", "anim/squiremonkey.zip"),
    Asset("ANIM", "anim/squiremonkey_nightmare_skin.zip"),
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

local function DoFx(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/ghost_spawn")

    local x, y, z = inst.Transform:GetWorldPosition()
    local fx = SpawnPrefab("statue_transition_2")
    if fx ~= nil then
        fx.Transform:SetPosition(x, y, z)
        fx.Transform:SetScale(.8, .8, .8)
    end
    fx = SpawnPrefab("statue_transition")
    if fx ~= nil then
        fx.Transform:SetPosition(x, y, z)
        fx.Transform:SetScale(.8, .8, .8)
    end
end

local function DoForceNightmareFx(inst, isnightmare)
	--Only difference is we use "shadow_despawn" instead of "statue_transition"
	--Same anim, but shadow_despawn has its own sfx and can be attached to platforms.
	--For consistency, shadow_despawn is what shadow_trap uses when forcing nightmare state.

	local x, y, z = inst.Transform:GetWorldPosition()
	local fx = SpawnPrefab("statue_transition_2")
	fx.Transform:SetPosition(x, y, z)
	fx.Transform:SetScale(.8, .8, .8)

	--When forcing into nightmare state, shadow_trap would've already spawned this fx
	if not isnightmare then
		fx = SpawnPrefab("shadow_despawn")
		local platform = inst:GetCurrentPlatform()
		if platform ~= nil then
			fx.entity:SetParent(platform.entity)
			fx.Transform:SetPosition(platform.entity:WorldToLocalSpace(x, y, z))
			fx:ListenForEvent("onremove", function()
				fx.Transform:SetPosition(fx.Transform:GetWorldPosition())
				fx.entity:SetParent(nil)
			end, platform)
		else
			fx.Transform:SetPosition(x, y, z)
		end
	end
end


local function IsForcedNightmare(inst)
	return inst.components.timer:TimerExists("forcenightmare")
end

local function IsWorldNightmare(inst, phase)
	return phase == "wild" or phase == "dawn"
end

local function SetNormalMonkey(inst)
    inst:RemoveTag("nightmare")
    inst.AnimState:SetBuild("squiremonkey")
    inst.AnimState:SetMultColour(1, 1, 1, 1)
end

local function SetNightmareMonkey(inst)
    inst:AddTag("nightmare")
    inst.AnimState:SetMultColour(1, 1, 1, .6)
    inst.AnimState:SetBuild("squiremonkey_nightmare_skin")
    inst.soundtype = "_nightmare"
end

local function OnTimerDone(inst, data)
	if not data then
        return
    end

    if data.name == "forcenightmare" then
		if IsWorldNightmare(inst, TheWorld.state.nightmarephase) and inst:HasTag("nightmare") then
		else
			if not (inst:IsInLimbo() or inst:IsAsleep()) then
				if inst.sg:HasStateTag("busy") and not inst.sg:HasStateTag("sleeping") then
					inst.components.timer:StartTimer("forcenightmare", 1)
					return
				end
				DoForceNightmareFx(inst, false)
			end
			SetNormalMonkey(inst)
		end
		inst:RemoveEventCallback("timerdone", OnTimerDone)
	end
end

local function OnForceNightmareState(inst, data)
	if data ~= nil and data.duration ~= nil then
		if inst.components.health:IsDead() then
			return
		end
		local t = inst.components.timer:GetTimeLeft("forcenightmare")
		if t ~= nil then
			if t < data.duration then
				inst.components.timer:SetTimeLeft("forcenightmare", data.duration)
			end
			return
		end
		inst.components.timer:StartTimer("forcenightmare", data.duration)
		inst:ListenForEvent("timerdone", OnTimerDone)
		if not inst:HasTag("nightmare") then
			DoForceNightmareFx(inst, true)
			SetNightmareMonkey(inst)
		end
	end
end

local function TestNightmarePhase(inst, phase)
	if not IsForcedNightmare(inst) then
		if IsWorldNightmare(inst, phase) then
			if inst.components.areaaware:CurrentlyInTag("Nightmare") and not inst:HasTag("nightmare") then
				DoFx(inst)
				SetNightmareMonkey(inst)
			end
		elseif inst:HasTag("nightmare") then
			DoFx(inst)
			SetNormalMonkey(inst)
		end
	end
end

local function TestNightmareArea(inst)--, area)
	TestNightmarePhase(inst, TheWorld.state.nightmarephase)
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
    inst.AnimState:SetBuild("squiremonkey")
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

    inst:AddComponent("areaaware")
    inst:AddComponent("sleeper")

    inst:AddComponent("embarker")
    inst:AddComponent("drownable")

    inst:AddComponent("follower")
    inst:AddComponent("knownlocations")

    inst:AddComponent("timer")

    MakeHauntableDropFirstItem(inst)

    inst.soundtype = ""
    inst:SetStateGraph("SGmonkey")
    inst:SetBrain(brain)

    inst:DoTaskInTime(0, function() 
        if TheWorld.willartapestrypowered then 
            Gram_DoTapestryBuff(inst)
        end
    end)

    inst:WatchWorldState("nightmarephase", TestNightmarePhase)
    inst:ListenForEvent("changearea", TestNightmareArea)

    return inst
end

return Prefab("willarsquire", fn, assets, prefabs)