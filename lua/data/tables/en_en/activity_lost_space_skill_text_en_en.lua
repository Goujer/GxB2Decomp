-- chunkname: @../../../Product/Bundles/Android/src/data/tables/en_en/activity_lost_space_skill_text_en_en.lua

local table = {}

table.keys = {
	desc = 5,
	name = 2,
	id = 1,
	icon = 4,
	energy = 3
}
table.rows = {
	["1"] = {
		1,
		"Sweep Laser",
		32,
		"activity_lost_space_icon_skill2",
		"Guide the Laser to explore the blocks of area in the same row as the last block explored."
	},
	["2"] = {
		2,
		"Cross Laser",
		42,
		"activity_lost_space_icon_skill1",
		"Guide the Laser to explore (maximum) 8 blocks next to the last explored block (top, bottom, left, and right 2 each)."
	},
	["3"] = {
		3,
		"Charged Laser",
		52,
		"activity_lost_space_icon_skill3",
		"Guide the Laser to explore (maximum) 6 blocks next to the last explored block (top and bottom 3 each). The amount of laser energies required to trigger this skill will be reduced by 6 each time the skill is triggered (maximum by 18). ({1} reduction(s) made)"
	},
	["4"] = {
		4,
		"Circle Laser",
		43,
		"activity_lost_space_icon_skill4",
		"Guide the Laser to explore the blocks of area neighboring the last block explored."
	},
	["5"] = {
		5,
		"Unstable Laser",
		35,
		"activity_lost_space_icon_skill5",
		"Guide the Laser to explore 5 random blocks of area. (Unexplored area will be explored first)"
	},
	["6"] = {
		6,
		"Adaptive Laser",
		34,
		"activity_lost_space_icon_skill6",
		"Guide the Laser to explore 2 blocks next to the last explored block (top and bottom). The exploration range will be increased by 1 block of area (1 more block for top or bottom by turns, the exploration range on top will be increased first) each time the skill is triggered. (maximum by 4 blocks of area) ({1} block(s) increased)"
	}
}

return table
