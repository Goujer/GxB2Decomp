﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ja_jp/activity_lost_space_event_text_ja_jp.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	picture = 3,
	desc = 4
}
table.rows = {
	["1"] = {
		1,
		"ジャンプポイント",
		"activity_lost_space_icon_xyg_90",
		"新しいエリアにジャンプして、新たな探索を開始することができます。 タップすると現在のエリアから離れ、この層でのスペースボーナスを獲得できます。"
	},
	["2"] = {
		2,
		"補給マス",
		"activity_lost_space_icon_bjd_90",
		"スペース内にある隠し補給エリアで、豊富なボーナスを獲得できます。 開くには特殊な座標情報が必要なようです。"
	},
	["3"] = {
		3,
		"補給座標",
		"activity_lost_space_icon_bjz_1_90",
		"謎の補給マスの座標情報が記録されています。3つ集めると、補給マスが開きます。"
	},
	["4"] = {
		4,
		"残像",
		"activity_lost_space_icon_xj",
		"過去に誰かが残した映像データ。 入手すると、高価値なボーナスがある位置が表示されます。ただし次の層には持ち越せません。"
	},
	["5"] = {
		5,
		"コピー装置",
		"activity_lost_space_icon_double_90",
		"アイテムを1つコピーできる不思議な科学装置。 入手すると、次の探索のボーナスが2倍になり（特殊イベントは除く）、次の層まで保持することができます。"
	},
	["6"] = {
		6,
		"ビームエネルギー",
		"activity_lost_space_icon_nl",
		"ビーム装置を起動するために必要なエネルギー。 一定量を集めるとスキルが使えるようになります。"
	}
}

return table
