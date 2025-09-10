 local State = GLOBAL.State
 local FRAMES = GLOBAL.FRAMES
 local TimeEvent = GLOBAL.TimeEvent
 local FrameEvent = GLOBAL.FrameEvent
 local EventHandler = GLOBAL.EventHandler
require "stategraphs/commonstates"
local CommonHandlers = GLOBAL.CommonHandlers

local function SetSleeperSleepState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:AddImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:IgnoreAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Disable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(false)
        inst.components.playercontroller:Enable(false)
    end
    inst:OnSleepIn()
    inst.components.inventory:Hide()
    inst:PushEvent("ms_closepopups")
    inst:ShowActions(false)
end

local function SetSleeperAwakeState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:RemoveImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:StopIgnoringAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Enable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(true)
        inst.components.playercontroller:Enable(true)
    end
    inst:OnWakeUp()
    inst.components.inventory:Show()
    inst:ShowActions(true)
end

local function WillarBlanketSleep(sg)
    local oldsleepinhandler = sg.actionhandlers[GLOBAL.ACTIONS.SLEEPIN]
    sg.actionhandlers[GLOBAL.ACTIONS.SLEEPIN] = GLOBAL.ActionHandler(GLOBAL.ACTIONS.SLEEPIN, function(inst, action)
        if action.target.prefab == "willartapestry" then return "willar_blanket" end
        return oldsleepinhandler.destate(inst, action)
    end)
end
AddStategraphPostInit("wilson", WillarBlanketSleep)
AddStategraphPostInit("wilson_client", WillarBlanketSleep)

local willar_sleep = State({
        name = "willar_blanket",
        tags = { "bedroll", "busy", "nomorph" },

        onenter = function(inst)
            inst.components.locomotor:Stop()

            local failreason =
                (GLOBAL.TheWorld.state.isday and
                    (GLOBAL.TheWorld:HasTag("cave") and "ANNOUNCE_NODAYSLEEP_CAVE" or "ANNOUNCE_NODAYSLEEP")
                )
                or (inst.IsNearDanger(inst) and "ANNOUNCE_NODANGERSLEEP")
                -- you can still sleep if your hunger will bottom out, but not absolutely
                or (inst.components.hunger.current < TUNING.CALORIES_MED and "ANNOUNCE_NOHUNGERSLEEP")
                or nil

            if failreason == nil and inst.components.sleepingbaguser ~= nil then
                local _, sleepingbagfailreason = inst.components.sleepingbaguser:ShouldSleep()
                failreason = sleepingbagfailreason
            end

            if failreason ~= nil then
                inst:PushEvent("performaction", { action = inst.bufferedaction })
                inst:ClearBufferedAction()
                inst.sg:GoToState("idle")
                if inst.components.talker ~= nil then
                    inst.components.talker:Say(GLOBAL.GetString(inst, failreason))
                end
                return
            end

            --inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PlayAnimation("dozy")
            inst.AnimState:PushAnimation("sleep_loop", false)
            SetSleeperSleepState(inst)

            --Hack since we've already temp unequipped hand items at this point
            --but we want to show the correct arms for action_uniqueitem_pre
            if inst._sleepinghandsitem ~= nil then
                inst.AnimState:Show("ARM_carry")
                inst.AnimState:Hide("ARM_normal")
            end
        end,

        timeline =
        {
            TimeEvent(20 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_bedroll")
            end),
        },

        events =
        {
            EventHandler("firedamage", function(inst)
                if inst.sg:HasStateTag("sleeping") then
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
                end
            end),
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    if GLOBAL.TheWorld.state.isday or
                        (inst.components.health ~= nil and inst.components.health.takingfiredamage) or
                        (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
                        inst:PushEvent("performaction", { action = inst.bufferedaction })
                        inst:ClearBufferedAction()
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    elseif inst:GetBufferedAction() then
                        inst:PerformBufferedAction()
                        if inst.components.playercontroller ~= nil then
                            inst.components.playercontroller:Enable(true)
                        end
                        inst.sg:AddStateTag("sleeping")
                        inst.sg:AddStateTag("silentmorph")
                        inst.sg:RemoveStateTag("nomorph")
                        inst.sg:RemoveStateTag("busy")
                        inst.AnimState:PlayAnimation("sleep_loop", true)
                    else
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    end
                end
            end),
        },

        onexit = function(inst)
            if not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Hide("ARM_carry")
                inst.AnimState:Show("ARM_normal")
            end
            if inst.sleepingbag ~= nil then
                --Interrupted while we are "sleeping"
                inst.sleepingbag.components.sleepingbag:DoWakeUp(true)
                inst.sleepingbag = nil
                SetSleeperAwakeState(inst)
            elseif not inst.sg.statemem.iswaking then
                --Interrupted before we are "sleeping"
                SetSleeperAwakeState(inst)
            end
        end,
    })

AddStategraphState("wilson", willar_sleep)

local willar_sleep_client = State({
		name = "willar_blanket",
		server_states = { "willar_blanket"},
		forward_server_states = true,
		onenter = function(inst) print(GLOBAL.hash("willar_blanket"), GLOBAL.hash("idle")) inst.sg:GoToState("willar_blanket_action") end,
	})

local willar_sleep_action_client = State({
    name = "willar_blanket_action",
    tags = { "busy" },
    onenter = function(inst)
			inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("dozy")
			inst.AnimState:PushAnimation("sleep_loop", false)
			inst:PerformPreviewBufferedAction()
			inst.sg:SetTimeout(2)
		end,

		onupdate = function(inst)
			if inst.sg:ServerStateMatches() then
				if inst.entity:FlattenMovementPrediction() then
					inst.sg:GoToState("idle", "noanim")
				end
			elseif inst.bufferedaction == nil then
				inst.AnimState:PlayAnimation("flute")
				inst.AnimState:SetFrame(103)
				inst.sg:GoToState("idle", true)
			end
		end,

		ontimeout = function(inst)
			inst:ClearBufferedAction()
			inst.AnimState:PlayAnimation("flute")
			inst.AnimState:SetFrame(103)
			inst.sg:GoToState("idle", true)
		end,
})

AddStategraphState("wilson_client", willar_sleep_client)
AddStategraphState("wilson_client", willar_sleep_action_client)


AddStategraphPostInit("wilson", function(sg) 
    local olddoshortaction = sg.states.doshortaction.onenter
    sg.states.doshortaction.onenter = function(inst, ...)
        if inst:HasTag("willar") then
            local speedmult = (GLOBAL.GramHasSkill(inst, "tail_tricks_3") and 2) or (GLOBAL.GramHasSkill(inst, "tail_tricks_2") and 1.5) or (GLOBAL.GramHasSkill(inst, "tail_tricks_1") and 1.2) or 1
            inst.AnimState:SetDeltaTimeMultiplier(speedmult)
            inst.AnimState:PlayAnimation("pickup")
            inst.AnimState:PushAnimation("pickup_pst", false)
            inst.sg.statemem.action = inst.bufferedaction
            inst.sg.statemem.silent = silent
            inst.sg:SetTimeout(10 * FRAMES / speedmult)
        else
            olddoshortaction(inst, ...)
        end    
    end
    --See willar.lua for timeline impl
    --local oldtimeline = sg.states.doshortaction.timeline

    local oldonexit = sg.states.doshortaction.onexit
    sg.states.doshortaction.onexit = function(inst, ...)
        if inst:HasTag("willar")  then
            inst.AnimState:SetDeltaTimeMultiplier(1)
        end
        oldonexit(inst, ...)
    end
end)

AddStategraphPostInit("wilson_client", function(sg)
    local olddoshortaction = sg.states.doshortaction.onenter
    sg.states.doshortaction.onenter = function(inst, ...)
        olddoshortaction(inst, ...)
        if not inst:HasTag("willar") then return end
        local speedmult = (GLOBAL.GramHasSkill(inst, "tail_tricks_3") and 2) or (GLOBAL.GramHasSkill(inst, "tail_tricks_2") and 1.5) or (GLOBAL.GramHasSkill(inst, "tail_tricks_1") and 1.2) or 1 
        inst.AnimState:SetDeltaTimeMultiplier(speedmult)
    end

    local oldonexit = sg.states.doshortaction.onexit
    sg.states.doshortaction.onexit = function(inst, ...)
        if inst:HasTag("willar")  then
            inst.AnimState:SetDeltaTimeMultiplier(1)
        end
        if oldonexit then
            oldonexit(inst, ...)
        end
    end
end)