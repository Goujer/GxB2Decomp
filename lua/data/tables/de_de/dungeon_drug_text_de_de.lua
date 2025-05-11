-- chunkname: @../../../Product/Bundles/Android/src/data/tables/de_de/dungeon_drug_text_de_de.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"Reiskloß (einfach)",
		"Heilt 20%% der HP"
	},
	["2"] = {
		2,
		"Jujube Reiskloß",
		"Heilt 50%% der HP & fügt 300 Energie hinzu"
	},
	["3"] = {
		3,
		"Lachs Reiskloß",
		"Heilt 100%% der HP"
	},
	["4"] = {
		4,
		"Stift",
		"Fügt {1}%% Angriff hinzu"
	},
	["5"] = {
		5,
		"Radiergummi",
		"Fügt {1}%% Krit. Schaden hinzu"
	},
	["6"] = {
		6,
		"Geodreieck",
		"Fügt {1}%% Krit. Treffer hinzu"
	}
}

return table
