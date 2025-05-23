﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/zh_tw/partner_challenge_type_text_zh_tw.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"普通模式",
		"只能使用當次挑戰中獲得的戰姬進行關卡挑戰，挑戰勝利後會獲得新的戰姬和特殊祝福用於後續戰鬥。可隨時重置進度。"
	},
	["2"] = {
		2,
		"謎題模式",
		"每一關都只能使用預設的戰姬進行挑戰，無需重置。"
	},
	["3"] = {
		3,
		"戰棋模式",
		"消耗戰棋券進行戰姬的獲取和刷新，獲取到三個相同戰姬時可合成為更強大的戰姬參與戰鬥。戰鬥失敗時扣除理智值，請在理智值歸零前通關吧！"
	},
	["4"] = {
		4,
		"競速模式",
		"限時開啟。使用自己的戰姬進行挑戰，通關挑戰後會根據花費的總回合數和挑戰次數進行排名，贏得豐厚獎勵。"
	}
}

return table
