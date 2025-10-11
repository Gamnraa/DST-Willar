--Pig King
local function mastersim() return GLOBAL.TheWorld.ismastersim end

AddPrefabPostInit("pigking", function(inst)
    if not mastersim() then return end
    inst:AddComponent("lootdropper")
    inst:ListenForEvent("trade", function(inst, data)
        print("trade", inst, data.giver, data.item.components.tradable.goldvalue)
        if data.giver and GLOBAL.GramHasSkill(data.giver, "diplo") and data.item and data.item.components.tradable.goldvalue > 0 then
            data.giver.components.sanity:DoDelta(5)
            inst:DoTaskInTime(2/3, function(inst)
                for i = 1, data.item.components.tradable.goldvalue / 2, 1 do
                    local loot = GLOBAL.SpawnPrefab("goldnugget") 
                    inst.components.lootdropper:FlingItem(loot)
                end
            end)
        end
    end)
end)

--Monkey Queen

--Appears once = 5%
--Appears twice = 10%
--Appears thrice = 15%
--etc.
local queenloottable = {
    "dug_bananabush",
    "dug_bananabush",
    "dug_bananabush",
    "bananajuice",
    "bananajuice",
    "oar_monkey",
    "blackflag",
    "blackflag",
    "monkey_mediumhat",
    "dug_monkeytail",
    "dug_monkeytail",
    "dug_monkeytail",
    "palmcone_seed",
    "palmcone_seed",
    "palmcone_seed",
    "palmcone_seed",
    "monkey_smallhat",
    "monkey_smallhat",
    "monkey_smallhat",
}

AddPrefabPostInit("monkeyqueen", function(inst)
    if not mastersim() then return end
    inst:ListenForEvent("trade", function(inst, data)
        if data.giver and GLOBAL.GramHasSkill(data.giver, "diplo") and math.random(100) < 50 then
            inst:DoTaskInTime(2/3, function(inst)
                local loot = GLOBAL.SpawnPrefab(queenloottable[math.random(#queenloottable)])
                inst.components.lootdropper:FlingItem(loot)
                loot:AddTag("nosteal")
            end)
        end
    end)
end)

AddPrefabPostInit("mermking", function(inst)
    if not mastersim() then return end

    local oldtrade = inst.components.trader.abletoaccepttest
    inst.components.trader.abletoaccepttest = function(inst, item, giver)
        if GLOBAL.GramHasSkill(giver, "diplo") then
            local can_eat = (item.components.edible and inst.components.eater:CanEat(item))
                and (inst.components.hunger and inst.components.hunger:GetPercent() < 1)
            if can_eat or item:HasTag("fish") then
                return true
            end
        end
        return oldtrade(inst, item, giver)
    end
end)

AddComponentPostInit("rabbitkingmanager", function(self)
    local oldaddcarrot = self.AddCarrotFromPlayer
    self.AddCarrotFromPlayer = function(self, player, receiver)
        if GLOBAL.GramHasSkill(player, "diplo") then oldaddcarrot(self, player, receiver) end
        oldaddcarrot(self, player, receiver)
    end
end)