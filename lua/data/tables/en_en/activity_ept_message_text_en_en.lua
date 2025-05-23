﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/en_en/activity_ept_message_text_en_en.lua

local table = {}

table.keys = {
	string = 2,
	explanation = 3,
	id = 1
}
table.rows = {
	["1"] = {
		1,
		"The defenders in [c][376CE3]{1}{2}[-][/c] are all defeated! We've won [c][c09C13]{3}[-][/c] Expedition Points!\nBiggest contributor: [c][376CE3]{4}[-][/c] (faction: [c][376CE3]{5}[-][/c])",
		"任意地块（包括中央冰川）的守军被首次清空时，并且自身阵营有参与挑战时推送。{3}中显示玩家所属阵营因此分到的积分。地块坐标需要显示为（x,y)的形式"
	},
	["2"] = {
		2,
		"We've taken [c][376CE3]{1}{2}[-][/c]!\nOccupier: [c][376CE3]{3}[-][/c]",
		"原本属于其他玩家阵营的非普通格地块，被我方阵营占领时推送"
	},
	["3"] = {
		3,
		"All goals in Era [c][376CE3]{1}[-][/c] are completed! We've obtained [c][c09C13]{2}[-][/c] Expedition Points during this Era!",
		"某时代的远征任务全部完成后推送。{2}中显示玩家所属阵营通过该时代的远征任务所获得的积分总和"
	},
	["4"] = {
		4,
		"New Era: [c][376CE3]{1}[-][/c] has begun!\n{2}",
		"新时代开启时推送"
	},
	["5"] = {
		5,
		"Dear {1}, your Assemble order in [c][376CE3]{2}{3}[-][/c] is over. [c][376CE3]{4}[-][/c] player(s) answered your call during its active.",
		"集结指令结束之后推送。*需要替換為學長名"
	},
	["6"] = {
		6,
		"Let's assemble here and challenge the enemies together!",
		"在非己方阵营的地块上集结时推送"
	},
	["7"] = {
		7,
		"Let's assemble here and defend our territory together!",
		"在己方阵营的地块上集结时推送"
	}
}

return table
