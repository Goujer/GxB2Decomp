-- chunkname: @../../../Product/Bundles/Android/src/data/tables/zh_tw/activity_ept_labor_text_zh_tw.lua

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
		"興奮狀態",
		"全傷害+10%",
		"戰姬的精力達到24點。戰鬥中造成的全部傷害增加10%。"
	},
	["2"] = {
		2,
		"正常狀態",
		"無效果",
		"戰姬的精力處於13~23點之間。戰鬥中不觸發特殊效果。"
	},
	["3"] = {
		3,
		"疲勞狀態",
		"傷害量-30%；受治療量-30%",
		"戰姬的精力處於1~12點之間。戰鬥中的傷害量與受治療量減少30%。"
	},
	["4"] = {
		4,
		"凍傷狀態",
		"傷害量-60%；受治療量-60%",
		"戰姬的精力降至0。戰鬥中的傷害量與受治療量減少60%。"
	}
}

return table
