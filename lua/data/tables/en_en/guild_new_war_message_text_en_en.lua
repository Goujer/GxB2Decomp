﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/en_en/guild_new_war_message_text_en_en.lua

local table = {}

table.keys = {
	string = 2,
	explanation = 3,
	id = 1
}
table.rows = {
	["1"] = {
		1,
		"[c][74c5ff]{1}[-][/c] attacked Flag {3} in enemy {2} and reduced the Moral of its defender by [c][cc0011]{4}[-][/c]",
		"{玩家光头} attacked Flag {9} in enemy {左前垒} and reduced enemy's Moral by {X}"
	},
	["2"] = {
		2,
		"[c][74c5ff]{1}[-][/c] attacked Flag {3} in enemy {2} and reduced the its durability by [c][cc0011]{4}[-][/c]",
		"{玩家光头} attacked Flag {8} in enemy {左中垒} and reduced the Flag's Durability by {X}"
	},
	["3"] = {
		3,
		"[c][74c5ff]{1}[-][/c] has destoryed enemy {2}",
		"{玩家光头} has destoryed enemy {右中垒}"
	},
	["4"] = {
		4,
		"[c][74c5ff]{1}[-][/c] has removed Flag {3} in enemy {2}",
		"{玩家光头} has destroyed Flag {7} in enemy {主垒}"
	}
}

return table
