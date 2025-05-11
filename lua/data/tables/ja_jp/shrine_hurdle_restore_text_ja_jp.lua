-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ja_jp/shrine_hurdle_restore_text_ja_jp.lua

local table = {}

table.keys = {
	id = 1,
	title = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"全体回復",
		"全ての戦姫の最大HP30%分を回復。"
	},
	["2"] = {
		2,
		"強力治療",
		"HPが最も低い3体の戦姫の最大HP80%分を回復。"
	},
	["3"] = {
		3,
		"起死回生",
		"1体の戦姫を選択し、HPを最大まで回復（倒れた戦姫も含む）。"
	}
}

return table
