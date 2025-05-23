﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/de_de/activity_ept_message_text_de_de.lua

local table = {}

table.keys = {
	string = 2,
	explanation = 3,
	id = 1
}
table.rows = {
	["1"] = {
		1,
		"Die Verteidigung auf dem Feld [c][376CE3]{1} (unter {2})[-][/c] wurde besiegt und wir haben [c][c09C13]{3}[-][/c] Expeditionspunkte erhalten!\nMVP: [c][376CE3]{4}[-][/c] (aus Lager [c][376CE3]\"{5}\"[-][/c]).",
		"任意地块（包括中央冰川）的守军被首次清空时，并且自身阵营有参与挑战时推送。{3}中显示玩家所属阵营因此分到的积分。地块坐标需要显示为（x,y)的形式"
	},
	["2"] = {
		2,
		"Wir haben das Feld [c][376CE3]{1} (unter {2})[-][/c] erobert!\nNeuer Besetzer: [c][376CE3]{3}[-][/c]",
		"原本属于其他玩家阵营的非普通格地块，被我方阵营占领时推送"
	},
	["3"] = {
		3,
		"Alle Ziele der Phase [c][376CE3]{1}[-][/c] wurden erreicht! Wir haben [c][c09C13]{2}[-][/c] Expeditionspunkte erhalten!",
		"某时代的远征任务全部完成后推送。{2}中显示玩家所属阵营通过该时代的远征任务所获得的积分总和"
	},
	["4"] = {
		4,
		"Eine neue Phase hat begonnen: [c][376CE3]{1}[-][/c]\n{2}",
		"新时代开启时推送"
	},
	["5"] = {
		5,
		"{1}, deine Versammlung auf dem Feld [c][376CE3]{2} (unter {3})[-][/c] wurde beendet. Insgesamt sind dir [c][376CE3]{4}[-][/c] Truppe(n) gefolgt.",
		"集结指令结束之后推送。*需要替換為學長名"
	},
	["6"] = {
		6,
		"Versammeln wir uns auf diesem Feld, um die Gegner herauszufordern!",
		"在非己方阵营的地块上集结时推送"
	},
	["7"] = {
		7,
		"Lasst uns auf diesem Feld versammeln, um unser Gebiet zu beschützen!",
		"在己方阵营的地块上集结时推送"
	}
}

return table
