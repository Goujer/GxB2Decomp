-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ja_jp/partner_challange_target_text_ja_jp.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		24,
		"{1}名の味方戦姫が生存した状態で、ステージクリア。"
	},
	["2"] = {
		2,
		25,
		"戦闘中、敵戦姫にそれぞれ流血、毒、燃焼を1回ずつ付与する。"
	},
	["3"] = {
		3,
		26,
		"味方戦姫1名の総被ダメージが{1}を超える。"
	},
	["4"] = {
		4,
		27,
		"味方戦姫の合計HPが全体の70%以上残っている状態で、ステージクリア。"
	},
	["5"] = {
		5,
		28,
		"味方戦姫の総HP回復量が{1}を超える。"
	},
	["6"] = {
		6,
		29,
		"敵に{1}回の拘束効果を付与する。"
	}
}

return table
