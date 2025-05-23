﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/de_de/activity_lost_space_skill_text_de_de.lua

local table = {}

table.keys = {
	desc = 5,
	name = 2,
	id = 1,
	icon = 4,
	energy = 3
}
table.rows = {
	["1"] = {
		1,
		"Reihenlaser",
		32,
		"activity_lost_space_icon_skill2",
		"Erkundet alle Gebiete in der Reihe, in der sich das letzte erkundete Gebiet befindet."
	},
	["2"] = {
		2,
		"Kreuzlaser",
		42,
		"activity_lost_space_icon_skill1",
		"Erkundet (maximal) 8 Gebiete um dem letzten erkundeten Gebiet (oben, unten, links und rechts jeweils 2)."
	},
	["3"] = {
		3,
		"Aufladungslaser",
		52,
		"activity_lost_space_icon_skill3",
		"Erkundet (maximal) 6 Gebiete neben dem letzten erkundeten Gebiet (oben und unten jeweils 3). Wird die Fertigkeit einmal durchgeführt, wird die Menge an dafür benötigten Laserenergien um 6 reduziert (maximal um 18). (Bereits {1} Mal reduziert)"
	},
	["4"] = {
		4,
		"Rundenlaser",
		43,
		"activity_lost_space_icon_skill4",
		"Erkundet (maximal) 4 Gebiete um dem letzten erkundeten Gebiet (oben, unten, links und rechts jeweils 1)."
	},
	["5"] = {
		5,
		"Zufallslaser",
		35,
		"activity_lost_space_icon_skill5",
		"Erkundet 5 zufällige Gebiete (Die versteckten Gebiete werden bevorzugt erkundet.)"
	},
	["6"] = {
		6,
		"Blitzlaser",
		34,
		"activity_lost_space_icon_skill6",
		"Erkundet 2 Gebiete neben dem letzten erkundeten Gebiet (oben und unten jeweils 1). Immer wenn diese Fertigkeit einmal durchgeführt wird, wird von oben und unten abwechselnd ein verstecktes Gebiet auf erkundbar umgestellt, was maximal 4 Mal abgeschlossen werden kann. ({1} Gebiet(e) umgestellt)"
	}
}

return table
