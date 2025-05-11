-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ko_kr/activity_ept_labor_text_ko_kr.lua

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
		"흥분 상태",
		"모든 대미지+10%",
		"소녀의 활력이 24pt에 도달. 전투 중의 모든 대미지 10% 증가."
	},
	["2"] = {
		2,
		"정상 상태",
		"효과 없음",
		"소녀의 활력이 13~23pt 사이. 전투 중 특수 효과를 촉발하지 않음."
	},
	["3"] = {
		3,
		"피로 상태",
		"대미지-30%, 받은 치료 효과 -30%",
		"소녀의 활력이 1~12pt 사이. 전투 중의 대미지와 받은 치료 효과 각각 30% 감소."
	},
	["4"] = {
		4,
		"동상 상태",
		"대미지-60%, 받은 치료 효과 -60%",
		"소녀의 활력이 0pt 된다. 전투 중의 대미지와 받은 치료 효과 각 60% 감소."
	}
}

return table
