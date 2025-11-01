
local TUNING = GLOBAL.TUNING
local TWOPI = GLOBAL.TWOPI
local DEGREES = GLOBAL.DEGREES
local PI = GLOBAL.PI
local STRINGS = GLOBAL.STRINGS
local Vector3 = GLOBAL.Vector3

local function ShouldAcceptTest(inst, item, giver)
    return (giver:HasTag("upsurperstart") and item.prefab == "nightmarefuel") or (giver:HasTag("upsurperend") and item.prefab == "shadowheart")
end

local function OnAccept(inst, giver, item)
    if giver:HasTag("upsurperstart" ) and item.prefab == "nightmarefuel" then
        inst.components.talker:Say("QUEST MIDPOINT")
        giver:RemoveTag("upsurperstart")
        giver:AddTag("upsurperend")
    elseif giver:HasTag("upsurperend") and item.prefab == "shadowheart" then
        inst.components.talker:Say("QUEST END")
        giver:AddTag("shadowmagic")
        giver:RemoveTag("upsurperend")
        inst.components.trader:Disable()
        --inst:AddTag("waitupsurper")
    end
end

local function OnStartQuest(inst, initiate)
    initiate:AddTag("upsurperstart")
    inst.components.talker:Say("QUEST START")
    --inst.components.trader:Enable()
    --inst:RemoveTag("waitupsurper")
end

local function MakeQuestGiver(inst)
    local talker = inst:AddComponent("talker")
    talker.fontsize = 35
    talker.font = GLOBAL.TALKINGFONT
    talker.colour = GLOBAL.Vector3(238/255, 69/255, 105/255)
    talker.offset = GLOBAL.Vector3(0, -400, 0)
    inst:AddTag("waitupsurper")
    --talker:MakeChatter()

    if not GLOBAL.TheWorld.ismastersim then return end

    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldAcceptTest)
    inst.components.trader.onaccept = OnAccept
    --inst.components.trader:Disable()
end

local function SpellCost(pct)
	return pct * TUNING.LARGE_FUEL * -4
end

local function NotBlocked(pt)
	return not GLOBAL.TheWorld.Map:IsGroundTargetBlocked(pt)
end

local function FindSpawnPoints(doer, pos, num, radius)
	local ret = {}
	local theta, delta, attempts
	if num > 1 then
		delta = TWOPI / num
		attempts = 3
		theta = doer:GetAngleToPoint(pos) * DEGREES
		if num == 2 then
			theta = theta + PI * (math.random() < .5 and .5 or -.5)
		else
			theta = theta + PI
			if math.random() < .5 then
				delta = -delta
			end
		end
	else
		theta = 0
		delta = 0
		attempts = 1
		radius = 0
	end
	for i = 1, num do
		local offset = GLOBAL.FindWalkableOffset(pos, theta, radius, attempts, false, false, NotBlocked, true, true)
		if offset ~= nil then
			table.insert(ret, Vector3(pos.x + offset.x, 0, pos.z + offset.z))
		end
		theta = theta + delta
	end
	return ret
end

local NUM_MINIONS_PER_SPAWN = 1
local function TrySpawnMinions(prefab, doer, pos)
	if doer.components.petleash ~= nil then
		local spawnpts = FindSpawnPoints(doer, pos, NUM_MINIONS_PER_SPAWN, 1)
		if #spawnpts > 0 then
			for i, v in ipairs(spawnpts) do
				local pet = doer.components.petleash:SpawnPetAt(v.x, 0, v.z, prefab)
				if pet ~= nil then
					if pet.SaveSpawnPoint ~= nil then
						pet:SaveSpawnPoint()
					end
					if #spawnpts > 1 and i <= 3 then
						--restart "spawn" state with specified time multiplier
						pet.sg.statemem.spawn = true
						pet.sg:GoToState("spawn",
							(i == 1 and 1) or
							(i == 2 and .8) or
							.87 + math.random() * .06
						)
					end
				end
			end
			return true
		end
	end
	return false
end

local function _CheckMaxSanity(sanity, minionprefab)
	return sanity ~= nil and sanity:GetPenaltyPercent() + (TUNING.SHADOWWAXWELL_SANITY_PENALTY[string.upper(minionprefab)] or 0) * NUM_MINIONS_PER_SPAWN <= TUNING.MAXIMUM_SANITY_PENALTY
end

local function CheckMaxSanity(doer, minionprefab)
	return _CheckMaxSanity(doer.components.sanity, minionprefab)
end

local function ShouldRepeatCastWorker(inst, doer)
	return _CheckMaxSanity(doer.replica.sanity, "shadowworker")
end

local function ShouldRepeatCastProtector(inst, doer)
	return _CheckMaxSanity(doer.replica.sanity, "shadowprotector")
end

local function WorkerSpellFn(inst, doer, pos)
	if inst.components.fueled:IsEmpty() then
		return false, "NO_FUEL"
	elseif not CheckMaxSanity(doer, "shadowworker") then
		return false, "NO_MAX_SANITY"
	elseif TrySpawnMinions("umbramonkeyservant", doer, pos) then
		inst.components.fueled:DoDelta(SpellCost(TUNING.WAXWELLJOURNAL_SPELL_COST.SHADOW_WORKER), doer)
		return true
	end
	return false
end

local function ProtectorSpellFn(inst, doer, pos)
	if inst.components.fueled:IsEmpty() then
		return false, "NO_FUEL"
	elseif not CheckMaxSanity(doer, "shadowprotector") then
		return false, "NO_MAX_SANITY"
	elseif TrySpawnMinions("umbramonkeywarrior", doer, pos) then
		inst.components.fueled:DoDelta(SpellCost(TUNING.WAXWELLJOURNAL_SPELL_COST.SHADOW_PROTECTOR), doer)
		return true
	end
	return false
end

local function ReticuleTargetAllowWaterFn()
	local player = GLOBAL.ThePlayer
	local ground = GLOBAL.TheWorld.Map
	local pos = Vector3()
	--Cast range is 8, leave room for error
	--4 is the aoe range
	for r = 7, 0, -.25 do
		pos.x, pos.y, pos.z = player.entity:LocalToWorldSpace(r, 0, 0)
		if ground:IsPassableAtPoint(pos.x, 0, pos.z, true) and not ground:IsGroundTargetBlocked(pos) then
			return pos
		end
	end
	return pos
end

local function StartAOETargeting(inst)
	local playercontroller = ThePlayer.components.playercontroller
	if playercontroller ~= nil then
		playercontroller:StartAOETargetingUsing(inst)
	end
end

local ICON_SCALE = .6
local ICON_RADIUS = 50
local SPELLBOOK_RADIUS = 100
local SPELLBOOK_FOCUS_RADIUS = SPELLBOOK_RADIUS + 2

local SPELLS =
{
	{
		label = STRINGS.SPELLS.SHADOW_WORKER,
		onselect = function(inst)
			inst.components.spellbook:SetSpellName(STRINGS.SPELLS.SHADOW_WORKER)
			inst.components.spellbook:SetSpellAction(nil)
			inst.components.aoetargeting:SetDeployRadius(0)
			inst.components.aoetargeting:SetShouldRepeatCastFn(ShouldRepeatCastWorker)
			inst.components.aoetargeting.reticule.reticuleprefab = "reticuleaoe_1d2_12"
			inst.components.aoetargeting.reticule.pingprefab = "reticuleaoeping_1d2_12"
			if GLOBAL.TheWorld.ismastersim then
				inst.components.aoetargeting:SetTargetFX("reticuleaoesummontarget_1d2")
				inst.components.aoespell:SetSpellFn(WorkerSpellFn)
				inst.components.spellbook:SetSpellFn(nil)
			end
		end,
		execute = StartAOETargeting,
		atlas = "images/spell_icons.xml",
		normal = "shadow_worker.tex",
		widget_scale = ICON_SCALE,
		hit_radius = ICON_RADIUS,
	},
	{
		label = STRINGS.SPELLS.SHADOW_PROTECTOR,
		onselect = function(inst)
			inst.components.spellbook:SetSpellName(STRINGS.SPELLS.SHADOW_PROTECTOR)
			inst.components.spellbook:SetSpellAction(nil)
			inst.components.aoetargeting:SetDeployRadius(0)
			inst.components.aoetargeting:SetShouldRepeatCastFn(ShouldRepeatCastProtector)
			inst.components.aoetargeting.reticule.reticuleprefab = "reticuleaoe_1d2_12"
			inst.components.aoetargeting.reticule.pingprefab = "reticuleaoeping_1d2_12"
			if GLOBAL.TheWorld.ismastersim then
				inst.components.aoetargeting:SetTargetFX("reticuleaoesummontarget_1d2")
				inst.components.aoespell:SetSpellFn(ProtectorSpellFn)
				inst.components.spellbook:SetSpellFn(nil)
			end
		end,
		execute = StartAOETargeting,
		atlas = "images/spell_icons.xml",
		normal = "shadow_protector.tex",
		widget_scale = ICON_SCALE,
		hit_radius = ICON_RADIUS,
	},
	--[[{
		label = STRINGS.SPELLS.SHADOW_TOPHAT,
		onselect = function(inst)
			inst.components.spellbook:SetSpellName(STRINGS.SPELLS.SHADOW_TOPHAT)
			inst.components.spellbook:SetSpellAction(nil)
			if TheWorld.ismastersim then
				inst.components.aoespell:SetSpellFn(nil)
				inst.components.spellbook:SetSpellFn(TopHatSpellFn)
			end
		end,
		execute = function(inst)
			local inventory = ThePlayer.replica.inventory
			if inventory ~= nil then
				inventory:CastSpellBookFromInv(inst)
			end
		end,
		atlas = "images/spell_icons.xml",
		normal = "shadow_tophat.tex",
		widget_scale = ICON_SCALE,
		hit_radius = ICON_RADIUS,
	},]]
}

local function OverrideUmbra(inst)
        inst:ListenForEvent("onputininventory", function(inst, owner)
            if owner:HasTag("willar") then
                GLOBAL.SendModRPCToClient(GLOBAL.GetClientModRPC("willarumbra", "onpickupumbra"), nil, inst, false)
                inst.components.spellbook:SetItems(SPELLS)
            end
        end)

        inst:ListenForEvent("ondropped", function(inst)
            local temp = GLOBAL.SpawnPrefab("waxwelljournal")
            GLOBAL.SendModRPCToClient(GLOBAL.GetClientModRPC("willarumbra", "onpickupumbra"), nil, inst, true)
            inst.components.spellbook:SetItems(temp.components.spellbook.items)
            temp:Remove()
        end)
end

AddClientModRPCHandler("willarumbra", "onpickupumbra", function(inst, remove)
    local temp = GLOBAL.SpawnPrefab("waxwelljournal")
    inst.components.spellbook:SetItems(remove and temp.components.spellbook.items or SPELLS)
    temp:Remove()
end)

AddComponentPostInit("inspectable", function(self)
    local _getdescription = self.GetDescription
    self.GetDescription = function(self, viewer, ...)
        local desc, filter_context, author = _getdescription(self, viewer, ...)
        if GLOBAL.GramHasSkill(viewer, "upsurp_shadow") and desc and self.inst:HasTag("waitupsurper") and not (viewer:HasTag("shadowmagic") or viewer:HasTag("upsurperstart") or viewer:HasTag("upsurperend")) then
            OnStartQuest(self.inst, viewer)
        end
        return desc, filter_context, author
    end
end)

AddPrefabPostInit("statuemaxwell", MakeQuestGiver)
AddPrefabPostInit("chesspiece_formal_marble", MakeQuestGiver)
AddPrefabPostInit("chesspiece_formal_stone", MakeQuestGiver)
AddPrefabPostInit("chesspiece_formal_moonglass", MakeQuestGiver)
AddPrefabPostInit("waxwelljournal", OverrideUmbra)
