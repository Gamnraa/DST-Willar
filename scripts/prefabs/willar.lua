local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
	Asset("ANIM", "anim/shadow_willar.zip"),
	Asset("SOUND", "sound/webber.fsb"),
}

local prefabs = {
}


-- Custom starting inventory
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.WILLAR = {
	"poop",
	"poop",
	"dug_bananabush",
	"dug_bananabush"
}

local start_item_images = {
}


local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.WILLAR
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

--Used to keep monkey followers in nightmare form when wearing the crown
local function nightmaremonkeyloop(inst)
    local timer = inst.components.timer
	local time = timer:TimerExists("forcenightmare") and timer:GetTimeLeft("forcenightmare") or 0
	timer:StopTimer("forcenightmare")
	timer:StartTimer("forcenightmare", 60 + time)
end


local function NightmareTask(inst)
	local ent =  FindEntity(inst, 20, function(guy)
		return guy.components.combat:CanTarget(inst)
		and (guy.prefab == "powder_monkey" or guy.prefab == "prime_mate")
		and not IsWillarLeader(guy)
	end,
	{"_combat", "monkey"}
)

	if ent then ent.components.combat:SuggestTarget(inst) end
end 

local function CanTransform(inst, into_nightmare)
	return into_nightmare ~= inst.willar_nightmaremode and 
	((inst.willar_nightmaremode and (not inst.components.timer:TimerExists("forcenightmare") and (not TheWorld.state.isnight and not TheWorld:HasTag("cave") or (not TheWorld.state.isnightmarewild and TheWorld:HasTag("cave"))))) or 
	(not inst.willar_nightmaremode and (inst.components.timer:TimerExists("forcenightmare") or (TheWorld.state.isnight and TheWorld.state.isnewmoon and not TheWorld:HasTag("cave")) or (TheWorld.state.isnightmarewild and TheWorld:HasTag("cave")))))
end

local function DoTransform(inst)
	DoFx(inst)
	local health = inst.components.health.current
	inst.components.playervision.nightvision = inst.willar_nightmaremode
	if inst.willar_nightmaremode then
		inst.components.playervision:ForceNightVision(false)
		--inst:PushEvent("nightvision", false)
		inst.AnimState:SetBuild("willar")
		inst:RemoveTag("nightmarewillar")
		inst:RemoveTag("monster")

		inst.components.combat.damagemultiplier = 1
		inst.components.health:SetMaxHealth(150) --VARIABLE GOES HERE
		inst.components.health.current = health
		inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "willar_nightmare_speed_mod")

		if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD) and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD):HasTag("willarcrown") then
			for follower, _ in pairs(inst.components.leader.followers) do
				--We're switching so we need to switch the logic
				if follower.prefab == "monkey" and not inst.willar_nightmaremode and follower.keepnightmareform then 
					follower.components.timer:StopTimer("forcenightmare")
					follower.keepnightmareform:Cancel()
					follower:PushEvent("changearea", follower.components.areaaware.current_area_data)
				end
			end
		end

		if inst.nightmaretask then inst.nightmaretask:Cancel() end
	else
		--inst:PushEvent("nightvision", true)
		inst:DoTaskInTime(.8, function() inst.components.playervision:ForceNightVision(true) end)
		inst.AnimState:SetBuild("shadow_willar")
		inst:AddTag("nightmarewillar")
		inst:AddTag("monster") --make pigs hostile to us

		--inst.components.combat.damagemultiplier = 1.25 shadow aligned only, handled by onequip now
		inst.components.health:SetMaxHealth(200)
		inst.components.health.current = health
		inst.components.health:DoDelta(50)
		inst.components.locomotor:SetExternalSpeedMultiplier(inst, "willar_nightmare_speed_mod", 1.25)

		if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD) and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD):HasTag("willarcrown") then
			for follower, _ in pairs(inst.components.leader.followers) do
				if follower.prefab == "monkey" and not inst.willar_nightmaremode then 
					follower.keepnightmareform = follower:DoPeriodicTask(55, function() nightmaremonkeyloop(follower) end)
					follower:DoTaskInTime(.15, function() follower:PushEvent("ms_forcenightmarestate", {duration = 60}) end)
				end
			end
		end

		inst.nightmaretask = inst:DoPeriodicTask(0, NightmareTask)
	end
	inst.willar_nightmaremode = not inst.willar_nightmaremode
end

local function OnWorldStateChange(inst)
	if CanTransform(inst, not inst.willar_nightmaremode) then DoTransform(inst) end

	local ids = {}
	for _, player in pairs(AllPlayers) do
		table.insert(ids, player == inst and player.userid or nil)
	end

	inst:DoTaskInTime(1, function() SendModRPCToClient(GetClientModRPC("willarstatewatcher", "onworldstatechange"), ids, inst, inst.willar_nightmaremode) end)
end

local function OnTimerDone(inst, data)
	if data and data.name == "forcenightmare" then
		OnWorldStateChange(inst)
	end
end


local banana_food = {
	["cave_banana"] = true,
}
--1 day 2 nf 3 days 1 hf
local function OnEat(inst, food)
	if food.components.edible.foodtype == "NIGHTMAREFUEL" then
		local amt = food.prefab == "horrorfuel" and 6 or 1
		
		inst.willar_nightmaremeter = inst.willar_nightmaremeter or 0

		inst.willar_nightmaremeter = inst.willar_nightmaremeter + amt

		if inst.willar_nightmaremeter >= 3 then
			inst.components.sanity:DoDelta(-30)
			local timer = inst.components.timer
			local time = timer:TimerExists("forcenightmare") and timer:GetTimeLeft("forcenightmare") or 0
			timer:StopTimer("forcenightmare")
			timer:StartTimer("forcenightmare", 60 * 8 * (math.floor(inst.willar_nightmaremeter / 2)) + time)
			OnWorldStateChange(inst)
			inst.willar_nightmaremeter = 0
		end
	elseif banana_food[food.prefab] then 
		inst.components.sanity:DoDelta(10)
	end
end

local pirate_weapons = {
	["cutless"] = true,
	["nightsword"] = true,
	["willarsword"] = true,
	["oar_money"] = true,
	["glasscutter"] = true,
	["sword_lunarplant"] = true,
}

local function OnEquip(inst, data)
	if data.item.components.equippable and data.item.components.equippable.equipslot == EQUIPSLOTS.HANDS then
		inst.components.combat.externaldamagemultipliers:SetModifier(inst, 1.10, "willarpiratebuff")
	end

	if pirate_weapons[data.item.prefab] then
		inst.components.combat.externaldamagemultipliers:SetModifier(inst, 1.25, "willarpiratebuff")
	end

	if data.item:HasTag("shadow_aligned") and inst.willar_nightmaremode then
		inst.components.combat.damagemultiplier = 1.25
	end
end

local function OnUnequip(inst, data)
	if not data.item then return end
	local inv = inst.components.inventory
	if not (pirate_weapons[data.item.prefab]) then 
		inst.components.combat.externaldamagemultipliers:SetModifier(inst, 1.00, "willarpiratebuff")
	end

	if data.item:HasTag("shadow_aligned") and inst.willar_nightmaremode then
		inst.components.combat.damagemultiplier = 1.00
	end
end

local function customsanityfn(inst)
	return (TheWorld.state.isday and not TheWorld:HasTag("cave")) and TUNING.SANITY_NIGHT_MID or 0
end

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when not a ghost (optional)
	--inst:DoTaskInTime(0, function() inst.components.disasterpredictor:Start() end)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "willar_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
	--inst.components.disasterpredictor:Stop()
	inst:RemoveTag("nightmarewillar")
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "willar_speed_mod")
end


local function onsave(inst, data)
	data.willar_nightmaremode = inst.willar_nightmaremode
	data.willar_nightmaremeter = inst.willar_nightmaremeter
	--data.willar_tapestrybuff = inst.willar_tapestrybuff
end

local function onpreload(inst, data)
	inst.willar_nightmaremode = data and data.willar_nightmaremode
	inst.willar_nightmaremeter = data and data.willar_nightmaremeter
	--inst.tapestrybuff = data and data.willar_tapestrybuff
end

-- When loading or spawning the character
local function onload(inst, data)
    inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

	if inst.willar_nightmaremode then inst.nightmaretask = inst:DoPeriodicTask(0, NightmareTask) end

	inst:DoTaskInTime(0, function()
		for follower, _ in pairs(inst.components.leader.followers) do
			if follower.prefab == "monkey" then
                Gram_UpdateMaxHealth(follower, 75)
            elseif follower.prefab == "powder_monkey" then
                Gram_UpdateMaxHealth(follower, 100)
            elseif inst.prefab == "prime_mate" then
                Gram_UpdateMaxHealth(follower, 50)
            end
		end
	end)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

local function ConfigureRunState_server(inst)
	local mount = inst.components.rider:GetMount()
	if mount then
        inst.sg.statemem.riding = true
		if inst:HasTag("groggy") then
			inst.sg.statemem.groggy = true
		else
			inst.sg.statemem.normalriding = true
		end
        inst.sg:AddStateTag("nodangle")
		inst.sg:AddStateTag("noslip")

		if mount:HasTag("woby") then
			inst.sg.statemem.ridingwoby = true
			--Assumes we can only ride our own woby!
			inst.sg.statemem.canwobysprint =
				inst.woby_commands_classified ~= nil and
				inst.woby_commands_classified:ShouldSprint() and
				inst.components.skilltreeupdater:IsActivated("walter_woby_sprint")
		end
    elseif inst.components.inventory:IsHeavyLifting() then
        inst.sg.statemem.heavy = true
		inst.sg.statemem.heavy_fast = inst.components.mightiness ~= nil and inst.components.mightiness:IsMighty()
		inst.sg:AddStateTag("noslip")
	elseif inst:IsChannelCasting() then
		inst.sg.statemem.channelcast = true
		inst.sg.statemem.channelcastitem = inst:IsChannelCastingItem()
    elseif inst:HasTag("wereplayer") then
        inst.sg.statemem.iswere = true
		inst.sg:AddStateTag("noslip")

        if inst:HasTag("weremoose") then
            if inst:HasTag("groggy") then
                inst.sg.statemem.moosegroggy = true
            else
                inst.sg.statemem.moose = true
            end
        elseif inst:HasTag("weregoose") then
            if inst:HasTag("groggy") then
                inst.sg.statemem.goosegroggy = true
            else
                inst.sg.statemem.goose = true
            end
        elseif inst:HasTag("groggy") then
            inst.sg.statemem.groggy = true
        else
            inst.sg.statemem.normal = true
        end
	elseif inst:IsInAnyStormOrCloud() and not inst.components.playervision:HasGoggleVision() then
        inst.sg.statemem.sandstorm = true
    elseif inst:HasTag("groggy") then
        inst.sg.statemem.groggy = true
    elseif inst:IsCarefulWalking() then
        inst.sg.statemem.careful = true
		inst.sg:AddStateTag("noslip")
    else
        inst.sg.statemem.normal = true
        inst.sg.statemem.normalwonkey = inst:HasTag("willar") or nil
    end
end

local function IsChannelCasting(inst) --clientside
	--essentially prediction, since the actions aren't busy w/ lag states
	local buffaction = inst.sg.mem.preview_channelcast_action
	if buffaction then
		return buffaction.action == ACTIONS.START_CHANNELCAST
		--Don't use "or inst:IsChannelCasting()"
		--We want to be able to return false here when predicting!
	end
	--otherwise return server state
	return inst:IsChannelCasting()
end

local function ConfigureRunState_client(inst)
	local rider = inst.replica.rider
	local mount = rider and rider:GetMount() or nil
	if mount then
        inst.sg.statemem.riding = true
		if inst:HasTag("groggy") then
			inst.sg.statemem.groggy = true
		else
			inst.sg.statemem.normalriding = true
		end
									   
							   

		if mount:HasTag("woby") then
			inst.sg.statemem.ridingwoby = true
			--Assumes we can only ride our own woby!
			inst.sg.statemem.canwobysprint =
				inst.woby_commands_classified ~= nil and
				inst.woby_commands_classified:ShouldSprint() and
				inst.components.skilltreeupdater:IsActivated("walter_woby_sprint")
		end
    elseif inst.replica.inventory:IsHeavyLifting() then
        inst.sg.statemem.heavy = true
		inst.sg.statemem.heavy_fast = inst:HasTag("mightiness_mighty")
							   
	elseif IsChannelCasting(inst) then
		inst.sg.statemem.channelcast = true
		inst.sg.statemem.channelcastitem = IsChannelCastingItem(inst)
    elseif inst:HasTag("wereplayer") then
        inst.sg.statemem.iswere = true
							   

        if inst:HasTag("weremoose") then
            if inst:HasTag("groggy") then
                inst.sg.statemem.moosegroggy = true
            else
                inst.sg.statemem.moose = true
            end
        elseif inst:HasTag("weregoose") then
            if inst:HasTag("groggy") then
                inst.sg.statemem.goosegroggy = true
            else
                inst.sg.statemem.goose = true
            end
        elseif inst:HasTag("groggy") then
            inst.sg.statemem.groggy = true
        else
            inst.sg.statemem.normal = true
        end
	elseif inst:IsInAnyStormOrCloud() and not inst.components.playervision:HasGoggleVision() then
        inst.sg.statemem.sandstorm = true
    elseif inst:HasTag("groggy") then
        inst.sg.statemem.groggy = true
    elseif inst:IsCarefulWalking() then
        inst.sg.statemem.careful = true
							   
    else
        inst.sg.statemem.normal = true
        inst.sg.statemem.normalwonkey = inst:HasTag("willar") or nil
    end
end

local function sgpost(inst, oldfn)
	oldfn(inst)
	if inst:HasTag("willar") then
		inst.sg.statemem.normalwonkey = true
	end
end

local function onmovementpredictionenabled(inst, enable)
	if enable and not (TheWorld.ismastersim or inst.willarsgfix) then
		inst:DoTaskInTime(.5, function() 
			if inst.sg then
				inst.willarsgfix = true
				local oldrunstart = inst.sg.sg.states["run_start"].onenter
				inst.sg.sg.states["run_start"].onenter = function() sgpost(inst, oldrunstart) end

				local oldrun = inst.sg.sg.states["run"].onenter
				inst.sg.sg.states["run"].onenter = function() sgpost(inst, oldrun) end

				inst.sg.sg.states["run_monkey_start"].onenter = function(inst)
					ConfigureRunState_client(inst)
					inst.Transform:SetPredictedSixFaced()
					inst.components.locomotor:RunForward()
					inst.AnimState:PlayAnimation("run_monkey_pre")
				end

				inst.sg.sg.states["run_monkey"].onenter = function(inst)
					ConfigureRunState_client(inst)
					inst.components.locomotor.predictrunspeed = TUNING.WILSON_RUN_SPEED + TUNING.WONKEY_SPEED_BONUS
					inst.Transform:SetPredictedSixFaced()
					inst.components.locomotor:RunForward()

					if not inst.AnimState:IsCurrentAnimation("run_monkey_loop") then
						inst.AnimState:PlayAnimation("run_monkey_loop", true)
					end

					inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
				end
			end
		end)
	end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "willar.tex" )
	--inst:ListenForEvent("playeractivated", onPlayerSpawn)
	inst:AddTag("willar")
	inst:AddTag("monkey")
	--inst:AddTag("wonkey")
	--inst.nightmaremode = net_bool(inst.GUID, "willarnightmaremode", "willarnightmaremodedirty")

	inst:ListenForEvent("enablemovementprediction", onmovementpredictionenabled)

	inst:DoTaskInTime(.5, function() 
		if inst.sg then
			onmovementpredictionenabled(inst, true)
		end
	end)
end



-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- Set starting inventory
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	
	-- choose which sounds this character will play
	inst.soundsname = "wonkey"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
   	inst.talker_path_override = "monkeyisland/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(TUNING.WILLAR_HEALTH)
	inst.components.hunger:SetMax(TUNING.WILLAR_HUNGER)
	inst.components.sanity:SetMax(TUNING.WILLAR_SANITY)

	inst.components.sanity:SetLightDrainImmune(true)
	inst.components.sanity.custom_rate_fn = customsanityfn
	
	--
	inst:WatchWorldState("isnight", OnWorldStateChange)
	inst:WatchWorldState("isday", OnWorldStateChange)
	inst:WatchWorldState("isnewmoon", OnWorldStateChange)
	inst:WatchWorldState("nightmaretime", OnWorldStateChange)
	inst:ListenForEvent("ForceTransformCheck", OnWorldStateChange)
	inst:ListenForEvent("timerdone", OnTimerDone)
	inst:ListenForEvent("equip", OnEquip)
	inst:ListenForEvent("unequip", OnUnequip)

	--inst:AddComponent("disasterpredictor")
	--inst:DoTaskInTime(0, function() inst.components.disasterpredictor:Start() end)
	
	table.insert(inst.components.eater.preferseating, "NIGHTMAREFUEL")
	table.insert(inst.components.eater.caneat, "NIGHTMAREFUEL")
	inst:AddTag("NIGHTMAREFUEL_eater")
	inst.components.eater:SetOnEatFn(OnEat)

	inst.components.foodaffinity:AddPrefabAffinity("cave_banana", TUNING.AFFINITY_15_CALORIES_MED)


	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1.15 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

	inst.nightmaremonkeyloop = nightmaremonkeyloop

	inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("poop")
    inst.components.periodicspawner:SetRandomTimes(2 * 8 * 60, 5 * 8 * 60)
    --inst.components.periodicspawner:SetDensityInRange(5, 5)
    --inst.components.periodicspawner:SetMinimumSpacing(8)
    inst.components.periodicspawner:Start()

	--inst.tapestrybuff = false
	inst:DoTaskInTime(0, function()
		if TheWorld.willartapestrypowered and not inst.tapestrybuff then 
			Gram_UpdateMaxHealth(inst, 50)
			Gram_UpdateMaxSanity(inst, 100)
			--inst.tapestrybuff = true
		end
	end)

	inst:DoTaskInTime(.55, function()

		--CommonStates.AddIpecacPoopState(inst.sg.sg.states)

		local oldrunstart = inst.sg.sg.states["run_start"].onenter
		inst.sg.sg.states["run_start"].onenter = function(inst)
			sgpost(inst, oldrunstart)
		end

		local oldrun = inst.sg.sg.states["run"].onenter
		inst.sg.sg.states["run"].onenter = function(inst) sgpost(inst, oldrun) end

		inst.sg.sg.states["run_monkey_start"].onenter = function(inst)
			ConfigureRunState_server(inst)
			inst.Transform:SetPredictedSixFaced()
			inst.components.locomotor:RunForward()
			inst.AnimState:PlayAnimation("run_monkey_pre")
		end

		inst.sg.sg.states["run_monkey"].onenter = function(inst)
			ConfigureRunState_server(inst)
			inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED + TUNING.WONKEY_SPEED_BONUS
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * TUNING.WONKEY_RUN_HUNGER_RATE_MULT)
			inst.Transform:SetPredictedSixFaced()
			inst.components.locomotor:RunForward()

			if not inst.AnimState:IsCurrentAnimation("run_monkey_loop") then
				inst.AnimState:PlayAnimation("run_monkey_loop", true)
			end

			inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
		end
	end)
end


return MakePlayerCharacter("willar", prefabs, assets, common_postinit, master_postinit, start_inv)