-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ja_jp/activity_lost_space_skill_text_ja_jp.lua

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
		"掃射ビーム",
		32,
		"activity_lost_space_icon_skill2",
		"ガイドビーム。前回探知したマスの横一列の探索マスをすべて探知する。"
	},
	["2"] = {
		2,
		"クロスビーム",
		42,
		"activity_lost_space_icon_skill1",
		"ガイドビーム。前回探知したマスの上下左右それぞれ2マスずつの探索マスを探知する。"
	},
	["3"] = {
		3,
		"チャージビーム",
		52,
		"activity_lost_space_icon_skill3",
		"ガイドビーム。前回探知したマスの上下それぞれ3マスずつの探索マスを探知する。スキルを使用するたびにビームエネルギーは6pt減少し、最大で3回減少する（{1}回減少済み）。"
	},
	["4"] = {
		4,
		"サークルビーム",
		43,
		"activity_lost_space_icon_skill4",
		"ガイドビーム。前回探知したマスの隣接する探索マスをすべて探知する。"
	},
	["5"] = {
		5,
		"ミステリービーム",
		35,
		"activity_lost_space_icon_skill5",
		"ガイドビーム。ランダムで探索マスを5マス探知する（隠れた探索マスを優先的に探索する）。"
	},
	["6"] = {
		6,
		"チャージビーム",
		34,
		"activity_lost_space_icon_skill6",
		"ガイドビーム。前回探知したマスの上下それぞれ1マスずつの探索マスを探知する。スキルを使用するたびに、探知できるマスが1個増え、最大で4個まで増える（{1}回増加）。"
	}
}

return table
