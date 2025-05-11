-- chunkname: @../../../Product/Bundles/Android/src/data/tables/en_en/activity_treasure_event_text_en_en.lua

local table = {}

table.keys = {
	id = 1,
	name = 3,
	des = 4,
	sort = 2
}
table.rows = {
	["1"] = {
		1,
		2,
		"Double Reward",
		"Double the Regular Chest Reward in the current round."
	},
	["2"] = {
		2,
		3,
		"Double Rate",
		"Double the increase of \"Odds for Treasure\" in the current round."
	},
	["3"] = {
		3,
		1,
		"Treasure Found",
		"Get the Round Treasure and enter the next round. (Your chance to find Treasure will thus be reset to 0)"
	},
	["4"] = {
		4,
		6,
		"Rock-Paper-Scissors",
		"You can decide whether to play Rock-Paper-Scissors or not. If you choose not to play the game, you will directly get a Regular Chest Reward. If you choose to play the game, you will get a Regular Chest reward plus an additional reward upon a victory, a Regular Chest Reward upon a tie, and no reward upon a defeat."
	},
	["5"] = {
		5,
		4,
		"Special Encounter",
		"Increase the Regular Chest Reward you will get upon triggering and in several moves afterward. This will be triggered after a certain number of Compass is consumed"
	},
	["6"] = {
		6,
		5,
		"Nothing Special",
		"You find a Regular Chest Reward"
	}
}

return table
