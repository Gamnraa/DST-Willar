STRINGS = GLOBAL.STRINGS
AddCharacterRecipe("cutless",
	{Ingredient("boards", 1),
	 Ingredient("rope", 1),
     Ingredient("log", 1)
    },
	 GLOBAL.TECH.SEAFARING_ONE,
	 {
		product = "cutless",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"WEAPONS",
	})
STRINGS.RECIPE_DESC.CUTLESS = "A sword for stealing riches."

AddCharacterRecipe("willarsword",
	{Ingredient("cutless", 1),
	 Ingredient("thulecite", 2),
     Ingredient("goldnugget", 3)
    },
	 GLOBAL.TECH.ANCIENT_TWO,
	 {
		product = "willarsword",
		builder_tag = "willar",
		numtogive = 1,
        description = "Luicas"
	},
	{
		"WEAPONS",
	})
STRINGS.RECIPE_DESC.WILLARSWORD = "A sword made of riches, for taking lives."


AddCharacterRecipe("monkeydisguise",
	{Ingredient("cave_banana", 2),
	 Ingredient("twigs", 2),
     Ingredient("beardhair", 2)
    },
	 GLOBAL.TECH.SCIENCE_TWO,
	 {
		product = "monkeydisguise",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"CLOTHING", "MAGIC"
	})
STRINGS.RECIPE_DESC.MONKEYDISGUISE = "Look like the best."

AddCharacterRecipe("willarcrown",
	{Ingredient("cave_banana", 3),
	 Ingredient("goldnugget", 3),
     Ingredient("nightmarefuel", 2)
    },
	 GLOBAL.TECH.MAGIC_THREE,
	 {
		product = "willarcrown",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"ARMOUR", "MAGIC"
	})
STRINGS.RECIPE_DESC.WILLARCROWN = "Good start, helps kings lead."

AddCharacterRecipe("willarcrown_ruins",
	{Ingredient("willarcrown", 1),
	 Ingredient("thulecite", 3),
     Ingredient("dreadstone", 1)
    },
	 GLOBAL.TECH.ANCIENT_TWO,
	 {
		product = "willarcrown_ruins",
		builder_tag = "willar",
		numtogive = 1,
	},
	{
		"ARMOUR", "MAGIC"
	})
STRINGS.RECIPE_DESC.WILLARCROWN_RUINS = "The real deal, fit for a king."

AddCharacterRecipe("farmermonkeypod",
	{Ingredient("boards", 4),
	 Ingredient("cave_banana", 4),
     Ingredient("strawhat", 1)
    },
	 GLOBAL.TECH.SCIENCE_TWO,
	 {
		placer = "farmermonkeypod_placer",
		builder_tag = "willar",
		numtogive = 1,
        atlas = "images/inventoryimages/farmermonkeypod.xml",
        image = "farmermonkeypod.tex"
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.FARMERMONKEYPOD = "Handles all the busywork."

AddCharacterRecipe("monkeybarrel",
	{Ingredient("boards", 2),
	 Ingredient("poop", 4),
     Ingredient("cave_banana", 4)
    },
	 GLOBAL.TECH.SCIENCE_TWO,
	 {
		placer = "monkeybarrel_placer",
		builder_tag = "willar",
		numtogive = 1,
        atlas = "images/inventoryimages/monkeybarrelrecipe.xml",
        image = "monkeybarrelrecipe.tex"
        
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.MONKEYBARREL = "A barrel of friends."

AddCharacterRecipe("monkeyhut",
	{Ingredient("boards", 2),
	 Ingredient("rocks", 4),
     Ingredient("palmcone_scale", 2)
    },
	 GLOBAL.TECH.SEAFARING_ONE,
	 {
		placer = "monkeyhut_placer",
		builder_tag = "willar",
		numtogive = 1,
        atlas = "images/inventoryimages/monkeyhutrecipe.xml",
        image = "monkeyhutrecipe.tex"
	},
	{
		"STRUCTURES",
	})
STRINGS.RECIPE_DESC.MONKEYHUT = "Subjects from across the big lake."

AddCharacterRecipe("willartapestry",
    {Ingredient("goldnugget", 3),
     Ingredient("beefalowool", 3),
     Ingredient("cave_banana", 2)
    },
    GLOBAL.TECH.SCIENCE_TWO,
    {
        placer = "willartapestry_placer",
        builder_tag = "willar",
        numtogive = 1,
        atlas = "images/inventoryimages/willarblanket.xml",
        image = "willarblanket.tex"
    },
    {
        "STRUCTURES",
    })
STRINGS.RECIPE_DESC.WILLARTAPESTRY = "Looks comfy, and magical."