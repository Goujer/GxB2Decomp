-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/activity_treasure_event_text_fr_fr.lua

local table = {}

table.keys = {
	id = 1,
	name = 3,
	des = 4,
	sort = 2
}
table.rows = {
	["1"] = {
		1,
		2,
		"Récompenses doublées",
		"Votre Récompense Ordinaire du tour actuel est doublée."
	},
	["2"] = {
		2,
		3,
		"Taux doublés",
		"Lorsque déclenché, le taux d'obtention d'un Trésor sera doublé au tour actuel."
	},
	["3"] = {
		3,
		1,
		"Trésor trouvé",
		"Lorsque déclenché, obtenez un Trésor et passez au tour suivant (votre taux d'obtention d'un Trésor sera alors réinitialisé à 0)."
	},
	["4"] = {
		4,
		6,
		"Pierre-Papier-Ciseaux",
		"Choisissez de jouer ou non à Pierre-Papier-Ciseaux. Si vous choisissez d'abandonner et de ne pas y jouer, obtenez alors directement une Récompense Ordinaire.\nSi vous choisissez d'y jouer :\nVous avez 1 chance sur 3 de gagner, et ainsi d'obtenir une Boîte de Ressources (Boîte à choix), en plus d'une Récompense Ordinaire.\nVous avez 1 chance sur 3 de faire match nul et ainsi d'obtenir une Récompense Ordinaire uniquement.\nVous avez 1 chance sur 3 de perdre et de n'obtenir aucune récompense."
	},
	["5"] = {
		5,
		4,
		"Récompenses Surprises",
		"Lorsque déclenché, améliore votre récompense obtenue à une Récompense Surprise à partir du tour actuel et pour les tours suivants (limité). Touchez le (?) pour en savoir plus."
	},
	["6"] = {
		6,
		5,
		"Pas de surprise",
		"Obtenez simplement une Récompense Ordinaire."
	}
}

return table
