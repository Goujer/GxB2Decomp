﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/arena_rank_award_team.lua

local table = {}

table.keys = {
	id = 1,
	season_awards = 3,
	rank = 2,
	rank_front = 4
}
table.rows = {
	["1"] = {
		1,
		1,
		"1#5000000|20#5|2#500|1002#1",
		1
	},
	["2"] = {
		2,
		2,
		"1#4500000|20#4|2#450|1003#1",
		2
	},
	["3"] = {
		3,
		3,
		"1#4000000|20#4|2#400|1004#1",
		3
	},
	["4"] = {
		4,
		10,
		"1#3000000|20#3|2#300|1005#1",
		"4-10"
	},
	["5"] = {
		5,
		20,
		"1#2600000|20#2|2#260|1006#1",
		"11-20"
	},
	["6"] = {
		6,
		50,
		"1#2200000|36#4|2#220",
		"21-50"
	},
	["7"] = {
		7,
		100,
		"1#1700000|36#3|2#170",
		"51-100"
	},
	["8"] = {
		8,
		200,
		"1#1000000|36#2|2#100",
		"101-200"
	},
	["9"] = {
		9,
		500,
		"1#800000|36#1|2#80",
		"201-500"
	},
	["10"] = {
		10,
		1000,
		"1#600000|2#60",
		"501-1000"
	},
	["11"] = {
		11,
		3000,
		"1#500000|2#50",
		"1001-3000"
	},
	["12"] = {
		12,
		999999,
		"1#400000|2#40",
		"3001-999999"
	}
}

return table
