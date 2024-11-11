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
	(inst.willar_nightmaremode and not inst.components.timer:TimerExists("forcenightmare") and (TheWorld.state.isday and not TheWorld:HasTag("cave") or (not TheWorld.state.isnightmarewild and TheTheWorld:HasTag("cave")))) or 
	(not inst.willar_nightmaremode and (TheWorld.state.isnight and TheWorld.state.isnewmoon and not TheWorld:HasTag("cave")) or (TheWorld.state.isnightmarewild and TheWorld:HasTag("cave")))
end

local function DoTransform(inst)
	local health = inst.components.health.current
	if inst.willar_nightmaremode then
		inst.components.talker:Say("UNTRANSFORM")
		inst.components.combat.damagemultiplier = 1
		inst.components.health:SetMaxHealth(150) --VARIABLE GOES HERE
		inst.components.health.current = health
		inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "willarspeed")
	else
		inst.components.talker:Say("TRANSFORM")
		inst.components.combat.damagemultiplier = 1.25
		inst.components.health:SetMaxHealth(175)
		inst.components.health.current = health
		inst.components.health:DoDelta(25)
		inst.components.locomotor:SetExternalSpeedMultiplier(inst, "willarspeed", 1.25)
	end
	inst.willar_nightmaremode = not inst.willar_nightmaremode
end

local function OnWorldStateChange(inst)
	print(inst.willar_nightmaremode, TheWorld.state.isnight, TheWorld.state.isnewmoon, TheWorld:HasTag("cave"), not inst.willar_nightmaremode and (TheWorld.state.isnight and TheWorld.state.isnewmoon and not TheWorld:HasTag("cave")))
	if CanTransform(inst, not inst.willar_nightmaremode) then DoTransform(inst) end
end

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when not a ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "gramninten_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "gramninten_speed_mod")
end


local function onsave(inst, data)
	data.willar_nightmaremode = inst.willar_nightmaremode
end

local function onpreload(inst, data)
	inst.willar_nightmaremode = data and data.willar_nightmaremode
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
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- Set starting inventory
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	
	-- choose which sounds this character will play
	inst.soundsname = "gramninten"
	
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
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1.15 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload 
end

return MakePlayerCharacter("gramninten", prefabs, assets, common_postinit, master_postinit, start_inv)