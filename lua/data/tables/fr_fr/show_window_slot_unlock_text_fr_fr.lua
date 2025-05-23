﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/show_window_slot_unlock_text_fr_fr.lua

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
		"Débloqué après que votre Audace ait atteint {2} ({1}/{2})",
		"Condition remplie (votre Audace a atteint {1}/{2})"
	},
	["2"] = {
		2,
		2,
		"Débloqué après que votre Charme ait atteint {2} ({1}/{2})",
		"Condition remplie (votre Charme a atteint {1}/{2})"
	},
	["3"] = {
		3,
		3,
		"Débloqué après que votre Génie ait atteint {2} ({1}/{2})",
		"Condition remplie (votre Génie a atteint {1}/{2})"
	},
	["4"] = {
		4,
		4,
		"Débloqué après avoir passé l'Étape {2} dans Test ({1}/{2})",
		"Condition remplie (votre progression actuelle dans Test : {1}/{2})"
	},
	["5"] = {
		5,
		5,
		"Débloqué après avoir passé l'Étage {2} du niveau {1} dans Patrouille",
		"Condition remplie (votre progression actuelle dans Patrouille : Étage {2} du niveau {1})"
	},
	["6"] = {
		6,
		6,
		"Débloqué après avoir passé le niveau {2} dans Équipe de Sécurité ({1}/{2})",
		"Condition remplie (votre progression actuelle dans Équipe de Sécurité : {1}/{2})"
	},
	["7"] = {
		7,
		7,
		"Débloqué après avoir atteint {2} points lors d'une saison d'Examen des Maisons ({1}/{2})",
		"Condition remplie (vos points dans Examen des Maisons : {1}/{2})"
	}
}

return table
