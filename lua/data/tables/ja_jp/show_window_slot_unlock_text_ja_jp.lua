﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ja_jp/show_window_slot_unlock_text_ja_jp.lua

local table = {}

table.keys = {
	id = 1,
	desc2 = 4,
	desc1 = 3,
	unlock_type = 2
}
table.rows = {
	["1"] = {
		1,
		1,
		"勇気が{2}pt到達でアンロックされます。\n（{1}/{2}）",
		"このスロットのアンロック条件を\n満たしています。\n（勇気が{1}/{2}ptに到達）"
	},
	["2"] = {
		2,
		2,
		"魅力が{2}pt到達でアンロックされます。\n（{1}/{2}）",
		"このスロットのアンロック条件を\n満たしています。\n（魅力が{1}/{2}ptに到達）"
	},
	["3"] = {
		3,
		3,
		"知識が{2}pt到達でアンロックされます。\n（{1}/{2}）",
		"このスロットのアンロック条件を\n満たしています。\n（知識が{1}/{2}ptに到達）"
	},
	["4"] = {
		4,
		4,
		"最上階{2}階クリア後に、\nアンロックされます。（{1}/{2}）",
		"このスロットのアンロック条件を\n満たしています。\n（最上階{1}/{2}クリア）"
	},
	["5"] = {
		5,
		5,
		"風紀検査難易度{1}のステージ{2}\nクリア後に、アンロックされます。",
		"このスロットのアンロック条件を\n満たしています。\n（風紀検査難易度{1}のステージ{2}をクリア）"
	},
	["6"] = {
		6,
		6,
		"退治小隊のレベルがLv.{2}に達すると、\nアンロックされます。（{1}/{2}）",
		"このスロットのアンロック条件を\n満たしています。\n（退治小隊のレベルが{1}/{2}に到達）"
	},
	["7"] = {
		7,
		7,
		"学部試験シーズン合計ptが{2}pt到達で、\nアンロックされます。（{1}/{2}）",
		"このスロットのアンロック条件を\n満たしています。\n（学部試験の合計ptが{1}/{2}ptに到達）"
	}
}

return table
