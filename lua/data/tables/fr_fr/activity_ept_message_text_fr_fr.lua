﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/activity_ept_message_text_fr_fr.lua

local table = {}

table.keys = {
	string = 2,
	explanation = 3,
	id = 1
}
table.rows = {
	["1"] = {
		1,
		"Toutes les Armées Défensives de [c][376CE3]{1}{2}[-][/c] ont été vaincues ! Nous avons obtenus [c][c09C13]{3}[-][/c] points d'Expédition !\nMeilleure contribution：[c][376CE3]{4}[-][/c](Faction：[c][376CE3]{5}[-][/c])",
		"任意地块（包括中央冰川）的守军被首次清空时，并且自身阵营有参与挑战时推送。{3}中显示玩家所属阵营因此分到的积分。地块坐标需要显示为（x,y)的形式"
	},
	["2"] = {
		2,
		"La case de territoire [c][376CE3]{1}{2}[-][/c] est désormais occupée !\nOccupant：[c][376CE3]{3}[-][/c]",
		"原本属于其他玩家阵营的非普通格地块，被我方阵营占领时推送"
	},
	["3"] = {
		3,
		"Toutes les quêtes de l'ère - [c][376CE3]{1}[-][/c] ont été complétées ! Nous avons obtenu [c][c09C13]{2}[-][/c] points d'Expédition dans cette ère !",
		"某时代的远征任务全部完成后推送。{2}中显示玩家所属阵营通过该时代的远征任务所获得的积分总和"
	},
	["4"] = {
		4,
		"Nouvelle Ère：[c][376CE3]{1}[-][/c] a commencé !\n{2}",
		"新时代开启时推送"
	},
	["5"] = {
		5,
		"Cher {1}, votre rassemblement de Raid sur [c][376CE3]{2}{3}[-][/c] a pris fin. [c][376CE3]{4}[-][/c] joueur(s) a/ont rejoint votre Raid.",
		"集结指令结束之后推送。*需要替換為學長名"
	},
	["6"] = {
		6,
		"J'ai lancé un Raid sur l'ennemi, rejoignez-moi !",
		"在非己方阵营的地块上集结时推送"
	},
	["7"] = {
		7,
		"Rejoignez-moi et défendons notre territoire !",
		"在己方阵营的地块上集结时推送"
	}
}

return table
