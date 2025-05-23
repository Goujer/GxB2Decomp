﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/de_de/partner_challange_newbuff_text_de_de.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"Schwere Rüstung",
		"Erhöht die HP aller Gegner um 30%."
	},
	["2"] = {
		2,
		"Adrenalin",
		"Erhöht den Angriff aller Gegner um 30%."
	},
	["3"] = {
		3,
		"Wiederaufstieg",
		"Die HP der 2 Gegner, die als erstes einen tödlichen Schaden erleiden, werden sofort auf 100% ihrer max. HP erhöht."
	},
	["4"] = {
		4,
		"Panzerplatte",
		"Wenn ein Gegner Schaden erleidet, wird dieser Einzelschaden nicht mehr als 10% seiner Max. HP sein."
	},
	["5"] = {
		5,
		"Rache",
		"Jedes Mal wenn ein Gegner stirbt, werden die HP aller Gegner um 30% ihrer max. HP erhöht. Ihr Angriff, Präzision, Blockade und Krit. Rate werden 3 Runden lang jeweils um 30% erhöht."
	},
	["6"] = {
		6,
		"Unsichtbarkeit",
		"Wenn die HP von einem Gegner im Kampf zum ersten Mal niedriger als 50% sind, wird er 4 Runden lang unsichtbar sein. (weicht Angriffen gegen ein einzelnes Ziel oder Angriffen gegen ein zufälliges Ziel aus. Alle erlittenen Schäden werden um 50% verringert und die Krit. Rate um 100% erhöht.)"
	}
}

return table
