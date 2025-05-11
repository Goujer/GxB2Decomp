-- chunkname: @../../../Product/Bundles/Android/src/data/tables/de_de/shrine_hurdle_restore_text_de_de.lua

local table = {}

table.keys = {
	id = 1,
	title = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"Gruppenheilung",
		"Alle deine Mädchen werden ihre HP um 30% ihrer max. HP wiederherstellen."
	},
	["2"] = {
		2,
		"Genesung",
		"Die 3 Mädchen mit den niedrigsten HP werden ihre HP um 80% ihrer max. HP wiederherstellen."
	},
	["3"] = {
		3,
		"Wiedererwachen",
		"Stelle die HP von einem deiner Mädchen (auch bereits verstorbene) wieder vollständig her."
	}
}

return table
