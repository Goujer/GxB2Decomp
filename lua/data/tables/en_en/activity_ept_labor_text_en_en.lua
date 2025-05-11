-- chunkname: @../../../Product/Bundles/Android/src/data/tables/en_en/activity_ept_labor_text_en_en.lua

local table = {}

table.keys = {
	id = 1,
	detail = 4,
	brief = 3,
	state = 2
}
table.rows = {
	["1"] = {
		1,
		"Concentrated",
		"+10% Damage",
		"Increase Damage in battle by 10% when your Girls' Stamina reaches 24"
	},
	["2"] = {
		2,
		"Normal",
		"No Effect",
		"The Girl's Stamina is between 13-23. There will be no special effect in battle."
	},
	["3"] = {
		3,
		"Exhausted",
		"-30% Damage; -30% Heal Received",
		"Reduce your Girls' Damage and Heal Received by 30% when your Girls' Stamina is between 1-12"
	},
	["4"] = {
		4,
		"Frostbitten",
		"-60% Damage; -60% Heal Received",
		"Reduce your Girls' Damage and Heal Received by 60% when your Girls' Stamina reaches 0"
	}
}

return table
