
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
        inst:AddTag("waitupsurper")
        --umbrarecipe
    end
end

local function OnStartQuest(inst, initiate)
    initiate:AddTag("upsurperstart")
    inst.components.talker:Say("QUEST START")
    inst.components.trader:Enable()
    inst:RemoveTag("waitupsurper")
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
    inst.components.trader:Disable()
    
end


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
