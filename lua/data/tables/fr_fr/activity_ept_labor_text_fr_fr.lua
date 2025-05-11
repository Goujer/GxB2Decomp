-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/activity_ept_labor_text_fr_fr.lua

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
		"Énergique",
		"Dégâts Infligés +10%",
		"Augmente les dégâts infligés de 10% au combat lorsque l'Endurance atteint 24."
	},
	["2"] = {
		2,
		"En forme",
		"Aucun Effet",
		"Aucun Effet\nL'Endurance est entre 13 et 23."
	},
	["3"] = {
		3,
		"Faible",
		"Dégâts Infligés -30%\nSoins Reçus -30%",
		"Réduit les Soins Reçus de 30% en combat lorsque l'Endurance est entre 1 et 12."
	},
	["4"] = {
		4,
		"Gelée",
		"Dégâts Infligés -60%\nSoins Reçus -60%",
		"Réduit les dégâts infligés et les Soins Reçus de 60% au combat lorsque l'Endurance atteint 0."
	}
}

return table
