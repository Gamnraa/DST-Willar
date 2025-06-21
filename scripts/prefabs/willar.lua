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
	if inst.willar_nightmaremode then
		inst.AnimState:SetBuild("willar")
		inst:RemoveTag("nightmarewillar")

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
		inst.AnimState:SetBuild("shadow_willar")
		inst:AddTag("nightmarewillar")

		inst.components.combat.damagemultiplier = 1.25
		inst.components.health:SetMaxHealth(175)
		inst.components.health.current = health
		inst.components.health:DoDelta(25)
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
end

local function OnTimerDone(inst, data)
	if data and data.name == "forcenightmare" then
		OnWorldStateChange(inst)
	end
end


local banana_food = {
	["cave_banana"] = true,
	["cave_banana_cooked"] = true,
	["bananapop"] = true,
	["forzenbananadaiquiri"] = true,
	["bananajuice"] = true
}

local function OnEat(inst, food)
	if food.components.edible.foodtype == "NIGHTMAREFUEL" then
		local amt = food.prefab == "horrorfuel" and 4 or 1
		
		inst.willar_nightmaremeter = inst.willar_nightmaremeter or 0

		inst.willar_nightmaremeter = inst.willar_nightmaremeter + amt

		if inst.willar_nightmaremeter >= 4 then
			local timer = inst.components.timer
			local time = timer:TimerExists("forcenightmare") and timer:GetTimeLeft("forcenightmare") or 0
			timer:StopTimer("forcenightmare")
			timer:StartTimer("forcenightmare", 60 + time)
			OnWorldStateChange(inst)
			inst.willar_nightmaremeter = 0
		end
	elseif banana_food[food.prefab] then 
		inst.components.sanity:DoDelta(10)
	end
end

local pirate_weapons = {
	["cutless"] = true,
	["oar_monkey"] = true,
	["willarsword"] = true,
}

local function OnEquip(inst, data)
	if pirate_weapons[data.item.prefab] then
		inst.components.combat.externaldamagemultipliers:SetModifier(inst, 1.25, "willarpiratebuff")
	end
end

local function OnUnequip(inst, data)
	local inv = inst.components.inventory
	if not (pirate_weapons[(EQUIPSLOTS.HANDS)]) then 
		inst.components.combat.externaldamagemultipliers:SetModifier(inst, 1.00, "willarpiratebuff")
	end
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
end

local function onpreload(inst, data)
	inst.willar_nightmaremode = data and data.willar_nightmaremode
	inst.willar_nightmaremeter = data and data.willar_nightmaremeter
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


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "willar.tex" )
	--inst:ListenForEvent("playeractivated", onPlayerSpawn)
	inst:AddTag("willar")
	inst:AddTag("monkey")
	inst:AddTag("wonkey")

	--inst.willar_nightmaremeter = net_tinybyte(inst.GUID, "willar.willar_nightmaremeter", "nightmaremeterdirty")
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
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	--inst.components.sanity.custom_rate_fn = UpdateClothingSanity
	
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
	if TheWorld.willartapestrypowered then 
		inst:DoTaskInTime(0, function()
			Gram_UpdateMaxHealth(inst, 10)
			Gram_UpdateMaxSanity(inst, 10)
			Gram_UpdateMaxSanity(inst, 10)
		end)
	end
end


return MakePlayerCharacter("willar", prefabs, assets, common_postinit, master_postinit, start_inv)