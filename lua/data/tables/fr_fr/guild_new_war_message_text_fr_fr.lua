﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/guild_new_war_message_text_fr_fr.lua

local table = {}

table.keys = {
	string = 2,
	explanation = 3,
	id = 1
}
table.rows = {
	["1"] = {
		1,
		"[c][74c5ff]{1}[-][/c] a lancé une attaque sur le {3}e Drapeau placé dans la base {2} ennemie et a réduit de [c][cc0011]{4}[-][/c] l'Endurance de l'ennemi !",
		"{玩家光头}進攻了敵方{左前垒}的{9}號旗幟，消耗了敵人{X}點精力"
	},
	["2"] = {
		2,
		"[c][74c5ff]{1}[-][/c] a lancé une attaque sur le {3}e Drapeau placé dans la base {2} ennemie et a réduit de [c][cc0011]{4}[-][/c] la Durabilité de ce Drapeau !",
		"{玩家光头}進攻了敵方{左中垒}的{8}號旗幟，消耗了旗幟{X}點耐久"
	},
	["3"] = {
		3,
		"[c][74c5ff]{1}[-][/c] a détruit la base {2} ennemie !",
		"{玩家光头}摧毀了敵方{右中垒}"
	},
	["4"] = {
		4,
		"[c][74c5ff]{1}[-][/c] a fait tombé le {3}e Drapeau placé dans la base {2} ennemie !",
		"{玩家光头}摧毀了敵方{主垒}的{7}號旗幟"
	}
}

return table
