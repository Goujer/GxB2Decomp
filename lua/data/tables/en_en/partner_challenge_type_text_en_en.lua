﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/en_en/partner_challenge_type_text_en_en.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"Normal",
		"Challenge the stages with the girls provided by the system, you will get new girls and special buff for the following stages in this mode. Your progress can be reset anytime you wish."
	},
	["2"] = {
		2,
		"Puzzle Mode",
		"You can only challenge each stage with default girls, but you don't need to reset your progress."
	},
	["3"] = {
		3,
		"Chess Mode",
		"Consume Chess Tickets to refresh the store and acquire Girls. 3 Identical Girls will fuse into a stronger Girl. You will lose Sanity if you lose a battle. Complete the challenge before your Sanity turns 0!"
	},
	["4"] = {
		4,
		"Speed Challenge",
		"This mode is available in a limited time (It will reopen later). Challenge the stages with your own Girls, you will be ranked and rewarded according to the challenge times you've spent and the total rounds you've spent to pass all the stages."
	}
}

return table
