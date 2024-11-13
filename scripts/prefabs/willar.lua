local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}

local prefabs = {
}


-- Custom starting inventory
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.GRAMNINTEN = {
}

local start_item_images = {
}


local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.GRAMNINTEN
end


local function CanTransform(inst, into_nightmare)
	return into_nightmare ~= inst.willar_nightmaremode and 
	(inst.willar_nightmaremode and not inst.components.timer:TimerExists("forcenightmare") and (not TheWorld.state.isnight and not TheWorld:HasTag("cave") or (not TheWorld.state.isnightmarewild and TheWorld:HasTag("cave")))) or 
	(not inst.willar_nightmaremode and inst.components.timer:TimerExists("forcenightmare") or (TheWorld.state.isnight and TheWorld.state.isnewmoon and not TheWorld:HasTag("cave")) or (TheWorld.state.isnightmarewild and TheWorld:HasTag("cave")))
end

local function DoTransform(inst)
	local health = inst.components.health.current
	if inst.willar_nightmaremode then
		inst.components.talker:Say("UNTRANSFORM")
		inst.components.combat.damagemultiplier = 1
		inst.components.health:SetMaxHealth(150) --VARIABLE GOES HERE
		inst.components.health.current = health
		inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "willar_nightmare_speed_mod")
	else
		inst.components.talker:Say("TRANSFORM")
		inst.components.combat.damagemultiplier = 1.25
		inst.components.health:SetMaxHealth(175)
		inst.components.health.current = health
		inst.components.health:DoDelta(25)
		inst.components.locomotor:SetExternalSpeedMultiplier(inst, "willar_nightmare_speed_mod", 1.25)
	end
	inst.willar_nightmaremode = not inst.willar_nightmaremode
end

local function OnWorldStateChange(inst)
	if CanTransform(inst, not inst.willar_nightmaremode) then DoTransform(inst) end
end

local function OnTimerDone(inst, data)
	print("timerdone")
	if data and data.name == "forcenightmare" then
		OnWorldStateChange(inst)
	end
end

local function OnEat(inst, food)
	if food.components.edible.foodtype ~= "NIGHTMAREFUEL" then return end
	local amt = food.prefab == "horrorfuel" and 4 or 1

	inst.willar_nightmaremeter:set(inst.willar_nightmaremeter:value() + amt)

	if inst.willar_nightmaremeter:value() >= 4 then
		local timer = inst.components.timer
		local time = timer:TimerExists("forcenightmare") and timer:GetTimeLeft("forcenightmare") or 0
		timer:StopTimer("forcenightmare")
		timer:StartTimer("forcenightmare", 60 + time)
		OnWorldStateChange(inst)
		inst.willar_nightmaremeter:set(0)
	end
end

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when not a ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "willar_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
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

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "gramninten.tex" )
	--inst:ListenForEvent("playeractivated", onPlayerSpawn)
	inst:AddTag("willar")

	inst.willar_nightmaremeter = net_tinybyte(inst.GUID, "willar.nightmaremeter", "nightmaremeterdirty")
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- Set starting inventory
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
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
	
	table.insert(inst.components.eater.preferseating, "NIGHTMAREFUEL")
	table.insert(inst.components.eater.caneat, "NIGHTMAREFUEL")
	inst:AddTag("NIGHTMAREFUEL_eater")
	inst.components.eater:SetOnEatFn(OnEat)

	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1.15 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload 
end

return MakePlayerCharacter("gramninten", prefabs, assets, common_postinit, master_postinit, start_inv)