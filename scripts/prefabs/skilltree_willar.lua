local ORDERS =
{
    {"King",        {-214+18,   176 +30}},
    {"Pirate",      {-62,       176 +30}},
    {"Instinct",    {-152,      176 +30}},
    {"Affinity",    {-214+18,   276    }}
}

local function BuildSkillsData(SkillTreeFns)
    local skills =
    {
        regal_work_1 = {
            title = "Regal Work I",
            desc = "Work a little quicker with royal tools, work a little slower with common ones.",
            icon = "wilson_alchemy_1",
            pos = {-62, 176},
            group = "King",
            tags = {"willarking"},
            onactivate = function(inst, fromload)
              --  inst:AddTag("willar_regalwork1")
            end,
            root = true,
            connects = {
                "regal_work_2"
            },
        },

        regal_work_2 = {
            title = "Regal Work II",
            desc = "Work quicker with royal tools, work slower with common ones.",
            icon = "wilson_alchemy_1",
            pos = {-62, 176-52},
            group = "King",
            tags = {"willarking"},
            onactivate = function(inst, fromload)
               -- inst:RemoveTag("willar_regalwork1")
               -- inst:AddTag("willar_regalwork2")
            end,
            root = true,
            connects = {
                "regal_work_2"
            },
        },

        regal_work_3 = {
            title = "Regal Work III",
            desc = "Better preserve royal tools, care less about common ones.",
            icon = "wilson_alchemy_1",
            pos = {-62, 176-52-52},
            group = "King",
            tags = {"willarking"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "regal_work_2"
            },
        },



        sea_skills_1 = {
            title = "Sea Skills I",
            desc = "Boating related tasks are 50% faster.",
            icon = "wilson_alchemy_1",
            pos = {-214, 176},
            group = "Pirate",
            tags = {"willarpirate"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "regal_work_2"
            },
        },

        

        embrace_dark_1 = {
            title = "Embrace the Dark I",
            desc = "Forced Transformations last a bit longer.",
            icon = "wilson_alchemy_1",
            pos = {-270, 176},
            group = "Pirate",
            tags = {"willarpirate"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "regal_work_2"
            },
        },
    }
end

return BuildSkillsData