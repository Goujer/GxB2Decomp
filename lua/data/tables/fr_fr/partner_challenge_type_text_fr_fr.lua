﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/partner_challenge_type_text_fr_fr.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"Normal",
		"Vous ne pouvez qu’utiliser les Filles obtenues dans le Défi actuel. Après avoir réussi le défi, vous obtiendrez des Filles et des bénédictions pour vous aider dans la bataille et débloquer l’étape suivante. Les progrès peuvent être réinitialisés n'importe quand."
	},
	["2"] = {
		2,
		"Casse-tête",
		"Dans le casse-tête, vous ne pourrez que choisir la formation avec les Filles proposées afin de vous battre. Il n'y a pas besoin de réinitialisation."
	},
	["3"] = {
		3,
		"Auto Chess",
		"Consommez des Tickets d'Échecs pour choisir les Filles. Obtenez une Fille 3 fois pour améliorer la Fille au niveau suivant. Votre Énergie sera déduite lorsque vous perdez la bataille. Terminez les niveaux avant de ne plus avoir d'Énergie !"
	},
	["4"] = {
		4,
		"Vitesse",
		"Ce Mode s'ouvre pour une durée limitée. Utilisez vos propres Filles afin de vous battre. Après avoir terminé le défi, votre classement sera déterminé en fonction du nombre total de tours que vous avez passés et du nombre de tentatives."
	}
}

return table
