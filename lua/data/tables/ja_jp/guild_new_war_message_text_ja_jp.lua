﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ja_jp/guild_new_war_message_text_ja_jp.lua

local table = {}

table.keys = {
	string = 2,
	explanation = 3,
	id = 1
}
table.rows = {
	["1"] = {
		1,
		"[c][74c5ff]{1}[-][/c]は敵の{2}{3}番旗を攻め、敵のエネルギーが[c][cc0011]{4}[-][/c]pt減少しました。",
		"{玩家光头}進攻了敵方{左前垒}的{9}號旗幟，消耗了敵人{X}點精力"
	},
	["2"] = {
		2,
		"[c][74c5ff]{1}[-][/c]は敵の{2}{3}番旗を攻め、旗の耐久値を[c][cc0011]{4}[-][/c]pt削りました。",
		"{玩家光头}進攻了敵方{左中垒}的{8}號旗幟，消耗了旗幟{X}點耐久"
	},
	["3"] = {
		3,
		"[c][74c5ff]{1}[-][/c]は敵の{2}を破壊しました。",
		"{玩家光头}摧毀了敵方{右中垒}"
	},
	["4"] = {
		4,
		"[c][74c5ff]{1}[-][/c]は敵の{2}{3}番旗を破壊しました。",
		"{玩家光头}摧毀了敵方{主垒}的{7}號旗幟"
	}
}

return table
