﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/activity_lost_space_skill_text_fr_fr.lua

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
		"Rayon de Laser",
		32,
		"activity_lost_space_icon_skill2",
		"Explorer toutes les cases de la même ligne que la dernière case détectée."
	},
	["2"] = {
		2,
		"Laser en Croix",
		42,
		"activity_lost_space_icon_skill1",
		"Explorer 8 cases avoisinant la dernière case détectée (2 cases en haut, en bas, à gauche et à droite)."
	},
	["3"] = {
		3,
		"Laser Chargé",
		52,
		"activity_lost_space_icon_skill3",
		"Explorer 6 cases perpendiculaires à la dernière case détectée (3 en haut et 3 en bas). Chaque fois que vous déclenchez cette Compétence Spatiale, les Énergies Laser nécessaires pour déclencher cette Compétence Spatiale seront réduites de 6 (ne peut être réduit 3 fois au maximum, déjà réduit : {1} fois)."
	},
	["4"] = {
		4,
		"Laser Circulaire",
		43,
		"activity_lost_space_icon_skill4",
		"Explorer les cases avoisinant la dernière case détectée."
	},
	["5"] = {
		5,
		"Laser Instable",
		35,
		"activity_lost_space_icon_skill5",
		"Explorer 5 cases aléatoires (priorité aux cases non explorées)."
	},
	["6"] = {
		6,
		"Laser Extensif",
		34,
		"activity_lost_space_icon_skill6",
		"Explorer les 2 cases à la verticale de la dernière case détectée (1 en haut, puis 1 en bas). Chaque fois que vous déclenchez cette Compétence Spatiale, la portée d'exploration sera augmentée de 1 case, commençant à partir de celle d’en haut, 4 cases au maximum. ({1} case(s) augmentée(s))"
	}
}

return table
