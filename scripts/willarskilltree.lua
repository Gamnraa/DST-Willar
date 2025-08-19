
local SkillTreeDefs = require("prefabs/skilltree_defs")
local CreateSkillTree = function()
	local BuildSkillsData = require("prefabs/skilltree_willar")

    if BuildSkillsData then
        local data = BuildSkillsData(SkillTreeDefs.FN)

        if data then
            SkillTreeDefs.CreateSkillTreeFor("willar", data.SKILLS)
            SkillTreeDefs.SKILLTREE_ORDERS["willar"] = data.ORDERS
        end

        RegisterSkilltreeBGForCharacter(GLOBAL.resolvefilepath("images/willar_skilltree.xml"), "willar") -- add bg
        for k, v in pairs(data.SKILLS) do
            --if v.icon then
            --    RegisterSkilltreeIconsAtlas("images/willar_skilltree.xml", v.icon .. ".tex")
            --end
        end
    end
end
CreateSkillTree()

print("NESSNESS")
local OldGetSkilltreeBG = GLOBAL.GetSkilltreeBG
function GLOBAL.GetSkilltreeBG(imagename, ...)
    print("NESS",imagename)
    if imagename == "willar_background.tex" then
        return "images/willar_skilltree.xml"
    else
        return OldGetSkilltreeBG(imagename, ...)
    end
end