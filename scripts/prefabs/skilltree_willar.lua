local vspace = 40
local order_hspace = 150

local korx = -214
local porx = -77
local iorx = 70
local aorx = 210

local ORDERS =
{
    {"King",        {korx+18,   176 +30}},
    {"Pirate",      {porx+18,   176 +30}},
    {"Instinct",    {iorx-18,   176 +30}},
    {"Affinity",    {aorx-18,   176 +30}}
}

local function BuildSkillsData(SkillTreeFns)
    local skills =
    {
        regal_work_1 = {
            title = "Regal Work I",
            desc = "Work a little quicker with royal tools, work a little slower with common ones.",
            icon = "wilson_alchemy_1",
            pos = {korx, 176},
            group = "King",
            tags = {"willarking", "regalwork"},
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
            pos = {korx, 176-vspace},
            group = "King",
            tags = {"willarking", "regalwork"},
            onactivate = function(inst, fromload)
               -- inst:RemoveTag("willar_regalwork1")
               -- inst:AddTag("willar_regalwork2")
            end,
            connects = {
                "regal_work_3"
            },
        },

        regal_work_3 = {
            title = "Regal Work III",
            desc = "Better preserve royal tools, care less about common ones.",
            icon = "wilson_alchemy_1",
            pos = {korx, 176-(vspace*2)},
            group = "King",
            tags = {"willarking", "regalwork"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
        },

        subjects_1 = {
            title = "Loyal Subjects I",
            desc = "Increase loyalty time of acquired primate followers.",
            icon = "wilson_alchemy_1",
            pos = {korx + 36, 176},
            group = "King",
            tags = {"willarking"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "subjects_2"
            },
        },

        subjects_2 = {
            title = "Loyal Subjects II",
            desc = "Upgrade powder monkeys to Prime Mates, and increase capabilities of Prime Mate followers.",
            icon = "wilson_alchemy_1",
            pos = {korx + 36, 176 - (vspace)},
            group = "King",
            tags = {"willarking"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            connects = {
                "subjects_3"
            },
        },

        subjects_3 = {
            title = "Loyal Subjects III",
            desc = "Recruit extra primates per banana gift.",
            icon = "wilson_alchemy_1",
            pos = {korx + 36, 176-(vspace*2)},
            group = "King",
            tags = {"willarking"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            connects = {
                "squire"
            },
        },

        squire = {
            title = "Loyal Squire",
            desc = "Convert a splumonkey into a Squire.",
            icon = "wilson_alchemy_1",
            pos = {korx + 36, 176-(vspace*3)},
            group = "King",
            tags = {"willarking"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
        },

        diplo = {
            title = "Loyal Subjects I",
            desc = "Increase loyalty time of acquired primate followers.",
            icon = "wilson_alchemy_1",
            pos = {korx, 176-(vspace*3)},
            group = "King",
            tags = {"willarking"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            lock_open = function(instname, activatedskills, readonly)
                return SkillTreeFns.CountTags(instname, "willarking", activatedskills) > 4
            end,
            root = true,
        },



        sea_skills_1 = {
            title = "Sea Skills I",
            desc = "Boating related tasks are faster.",
            icon = "wilson_alchemy_1",
            pos = {porx, 176},
            group = "Pirate",
            tags = {"willarpirate"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "sea_skills_2"
            },
        },

        sea_skills_2 = {
            title = "Sea Skills II",
            desc = "Boating related tasks are much faster.",
            icon = "wilson_alchemy_1",
            pos = {porx, 176-(vspace)},
            group = "Pirate",
            tags = {"willarpirate"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
        },

        crewmate = {
            title = "Crewmate",
            desc = "Gain sanity from wearing pirate themed hats.",
            icon = "wilson_alchemy_1",
            pos = {porx + 36, 176},
            group = "Pirate",
            tags = {"willarpirate"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
        },

        swashbuck = {
            title = "Swashbuckler",
            desc = "Boating related tasks are 50% faster.",
            icon = "wilson_alchemy_1",
            pos = {porx + 72, 176},
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

        captain_1 = {
            title = "Captain I",
            desc = "Boats take less damage while standing on them.",
            icon = "wilson_alchemy_1",
            pos = {porx, 176-(vspace * 2)},
            group = "Pirate",
            tags = {"willarpirate"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "captain_2"
            },
        },

        captain_2 = {
            title = "Captain II",
            desc = "Primate follows gain increased attack speed when wearing pirate hats.",
            icon = "wilson_alchemy_1",
            pos = {porx, 176-(vspace * 3)},
            group = "Pirate",
            tags = {"willarpirate"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            connects = {
                "captain_3"
            },
        },

        captain_3 = {
            title = "Captain III",
            desc = "Boat crew members receive for being on the same boat as you.",
            icon = "wilson_alchemy_1",
            pos = {porx, 176-(vspace * 4)},
            group = "Pirate",
            tags = {"willarpirate"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
        },

        

        embrace_dark_1 = {
            title = "Embrace the Dark I",
            desc = "Forced Transformations last a bit longer.",
            icon = "wilson_alchemy_1",
            pos = {iorx, 176},
            group = "Instinct",
            tags = {"willarinstinct"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "embrace_dark_2"
            },
        },
        embrace_dark_2 = {
            title = "Embrace the Dark II",
            desc = "Forced Transformations last much longer.",
            icon = "wilson_alchemy_1",
            pos = {iorx, 176-(vspace)},
            group = "Instinct",
            tags = {"willarinstinct"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            connects = {
                "embrace_dark_3"
            },
        },
        embrace_dark_3 = {
            title = "Embrace the Dark III",
            desc = "Forced Transformations last significantly longer.",
            icon = "wilson_alchemy_1",
            pos = {iorx, 176-(vspace*2)},
            group = "Instinct",
            tags = {"willarinstinct"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
        },
        tail_tricks_1 = {
            title = "Trail Tricks I",
            desc = "Picking up items slightly faster.",
            icon = "wilson_alchemy_1",
            pos = {iorx+36, 176},
            group = "Instinct",
            tags = {"willarinstinct"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "tail_tricks_2"
            },
        },
        tail_tricks_2 = {
            title = "Trail Tricks II",
            desc = "Picking up items faster.",
            icon = "wilson_alchemy_1",
            pos = {iorx+36, 176-(vspace)},
            group = "Instinct",
            tags = {"willarinstinct"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            connects = {
                "tail_tricks_3"
            },
        },
        tail_tricks_3 = {
            title = "Trail Tricks III",
            desc = "Picking up items near instantly.",
            icon = "wilson_alchemy_1",
            pos = {iorx+36, 176-(vspace*2)},
            group = "Instinct",
            tags = {"willarinstinct"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
        },
        shadowstep = {
            title = "Shadowstep",
            desc = "Spend 1 nightmare fuel to teleport.",
            icon = "wilson_alchemy_1",
            pos = {iorx, 176-(vspace*3)},
            group = "Instinct",
            tags = {"willarinstinct"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            lock_open = function(instname, activatedskills, readonly)
                return SkillTreeFns.CountTags(instname, "willarinstinct", activatedskills) > 4
            end,
            root = true,
            connects = {
                "shadowstride"
            }
        },
        shadowstride = {
            title = "Allow others to follow your teleport.",
            desc = "Increase loyalty time of acquired primate followers.",
            icon = "wilson_alchemy_1",
            pos = {iorx, 176-(vspace*4)},
            group = "Instinct",
            tags = {"willarinstinct"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
        },



        weapon_horror = {
            title = "Weaponised Horror",
            desc = "Infuse weapons with Pure Horror.",
            icon = "wilson_alchemy_1",
            pos = {aorx, 176},
            group = "Affinity",
            tags = {"willaraffinity"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
            root = true,
            connects = {
                "upsurp_shadow"
            }
        },

         upsurp_shadow = {
            title = "Upsurp the Shadows",
            desc = "Infuse your crown with pure horror",
            icon = "wilson_alchemy_1",
            pos = {aorx, 176-vspace},
            group = "Affinity",
            tags = {"willaraffinity"},
            onactivate = function(inst, fromload)
              --  inst:RemoveTag("willar_regalwork2")
              --  inst:AddTag("willar_regalwork3")
            end,
        },

        
    }
    return {
        SKILLS = skills,
        ORDERS = ORDERS
    }
end

return BuildSkillsData