local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("willar_none", {
	assets = {
		Asset("ANIM", "anim/willar.zip"),
		Asset("ANIM", "anim/ghost_willar_build.zip"),
	},
	
	skins = {
		normal_skin = "willar",
		ghost_skin = "ghost_willar_build",
	},
	
	base_prefab = "willar",
	build_name_override = "willar",
	type = "base",
	rarity = "Character",
	skin_tags = {"BASE", "WILLAR"},
}))

table.insert(prefabs, CreatePrefabSkin("willar_pirate", {
	assets = {
		Asset("ANIM", "anim/willar_pirate.zip"),
		Asset("ANIM", "anim/ghost_willar_pirate.zip"),
	},
	
	skins = {
		normal_skin = "willar_pirate",
		ghost_skin = "ghost_willar_pirate",
	},
	
	base_prefab = "willar",
	build_name_override = "willar_pirate",
	type = "base",
	rarity = "ModMade",
	skin_tags = {"BASE", "WILLAR", "SWASHBUCKLER"},
}))

return unpack(prefabs)
		