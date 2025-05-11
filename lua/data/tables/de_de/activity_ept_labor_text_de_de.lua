-- chunkname: @../../../Product/Bundles/Android/src/data/tables/de_de/activity_ept_labor_text_de_de.lua

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
		"Kämpferisch",
		"Alle Schäden +10%",
		"Die Energie des Mädchens hat 24 erreicht. Alle von ihr zugefügten Schäden werden um 10% erhöht."
	},
	["2"] = {
		2,
		"Normal",
		"Kein Effekt",
		"Die Energie des Mädchens liegt zwischen 13 und 23. Kein zusätzlicher Effekt wird ausgelöst."
	},
	["3"] = {
		3,
		"Erschöpft",
		"Schaden -30%, erhaltene Heilung -30%",
		"Die Energie des Mädchens liegt zwischen 1 und 12. Der von ihr zugefügte Schaden und die erhaltene Heilung werden jeweils um 30% verringert."
	},
	["4"] = {
		4,
		"Unterkühlt",
		"Schaden -60%, erhaltene Heilung -60%.",
		"Die Energie des Mädchens ist auf 0 gefallen. Der von ihr zugefügte Schaden und die erhaltene Heilung werden jeweils um 60% verringert."
	}
}

return table
