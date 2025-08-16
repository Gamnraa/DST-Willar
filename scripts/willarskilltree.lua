local SkillTreeDefs = require("prefabs/skilltree_defs")

local CreateSkillTree = function()
	local BuildSkillsData = require("prefabs/skilltree_willar")

    if BuildSkillsData then
        local data = BuildSkillsData(SkillTreeDefs.FN)

        if data then
            SkillTreeDefs.CreateSkillTreeFor("willar", data.SKILLS)
            SkillTreeDefs.SKILLTREE_ORDERS["willar"] = data.ORDERS
        end
    end
end
CreateSkillTree()


local OldGetSkilltreeBG = GLOBAL.GetSkilltreeBG
function GLOBAL.GetSkilltreeBG(imagename, ...)
    if imagename == "willar_background.tex" then
        return "images/willar_skilltree.xml"
    else
        return OldGetSkilltreeBG(imagename, ...)
    end
end