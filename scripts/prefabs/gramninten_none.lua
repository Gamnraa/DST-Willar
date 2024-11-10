local prefabs = {}

table.insert(prefabs, CreatePrefabSkin("gramninten_none", {
	assets = {
		Asset("ANIM", "anim/gramninten.zip"),
		Asset("ANIM", "anim/ghost_gramninten.zip"),
	},
	
	skins = {
		normal_skin = "gramninten",
		ghost_skin = "ghost_gramninten",
	},
	
	base_prefab = "gramninten",
	build_name_override = "gramninten",
	type = "base",
	rarity = "Character",
	skin_tags = {"BASE", "GRAMNINTEN"},
}))

return unpack(prefabs)
		