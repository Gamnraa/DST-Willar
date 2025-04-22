local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("willar_none", {
	assets = {
		Asset("ANIM", "anim/willar.zip"),
		Asset("ANIM", "anim/ghost_willar_build.zip"),
	},
	
	skins = {
		normal_skin = "willar",
		ghost_skin = "ghost_willar",
	},
	
	base_prefab = "willar",
	build_name_override = "willar",
	type = "base",
	rarity = "Character",
	skin_tags = {"BASE", "WILLAR"},
}))

return unpack(prefabs)
		