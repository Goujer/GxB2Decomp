﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/activity_lost_space_event_text_fr_fr.lua

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
		"Site de Téléportation",
		"activity_lost_space_icon_xyg_90",
		"En passant par le Site de Téléportation, vous obtiendrez une Boîte d'approvisionnement de l'étape actuelle et accèderez à l'étape suivante."
	},
	["2"] = {
		2,
		"Site de Ravitaillement",
		"activity_lost_space_icon_bjd_90",
		"Site caché à l'intérieur de la station spatiale stockant de riches récompenses. Nécessite d'avoir collecté 3 Coordonnées de Ravitaillement pour y accéder."
	},
	["3"] = {
		3,
		"Coordonnées de Ravitaillement",
		"activity_lost_space_icon_bjz_1_90",
		"Cet objet enregistre les informations collectées d'un Site de Ravitaillement. Après avoir obtenu 3 Coordonnées de Ravitaillement, vous pourrez accéder au Site de Ravitaillement."
	},
	["4"] = {
		4,
		"Hologramme",
		"activity_lost_space_icon_xj",
		"Images en relief laissées par les anciens chercheurs habitant la station spatiale. Cet objet vous indiquera l'emplacement d'une récompense d'une grande valeur (ne peut être conservé jusqu'à l'étape suivante)."
	},
	["5"] = {
		5,
		"Dispositif de Doublage",
		"activity_lost_space_icon_double_90",
		"Dispositif mystérieux permettant de doubler une récompense. Après avoir obtenu cet objet, les récompenses obtenues par votre prochaine détection seront doublées (n'inclut pas les objets spatiaux, peut être conservé jusqu'à l'étape suivante)."
	},
	["6"] = {
		6,
		"Énergie Laser",
		"activity_lost_space_icon_nl",
		"Énergie nécessaire pour activer un dispositif laser qui vous permettra de déclencher une Compétence Spatiale (peut être utilisée après avoir collecté un certain nombre d'énergie)."
	}
}

return table
