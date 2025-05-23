﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/old_building_buff_text_fr_fr.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"Armure Lourde",
		"Augmente les PV de tous les ennemis de 30%."
	},
	["2"] = {
		2,
		"Adrénaline",
		"Augmente l'Attaque de tous les ennemis de 30%."
	},
	["3"] = {
		3,
		"Barrière",
		"Augmente la Résistance aux Coups Critiques des ennemis de 30% (La Résistance aux Coups Critiques peut diminuer la probabilité de subir un Coup Critique)."
	},
	["4"] = {
		4,
		"Miasme",
		"Réduit les Soins Reçus par les Filles alliées de 60%."
	},
	["5"] = {
		5,
		"Épuisement",
		"Pendant les 3 premiers tours, les Filles alliées ne peuvent pas lancer leur Compétence Active."
	},
	["6"] = {
		6,
		"Formation Serrée",
		"Lorsqu'un des ennemis subit des dégâts, les dégâts seront partagés entre tous les ennemis."
	},
	["7"] = {
		7,
		"Soin",
		"Tous les ennemis récupèrent 15% de leur PV Max à la fin du tour."
	},
	["8"] = {
		8,
		"Bouc Émissaire",
		"Chaque ennemi transfèrent aléatoirement 2 Effets Négatifs à une de vos Filles alliées à la fin de chaque tour (Les Effets de Contrôle seront transférés en priorité; Les Filles avec le moins d'Effet Négatif les transféreront en priorité)."
	},
	["9"] = {
		9,
		"Sceau Ultime",
		"Chaque ennemi obtient 2 boucliers qui peuvent neutraliser 1 attaque mortelle le visant; en neutralisant cette attaque mortelle, une de vos Filles alliées sera aléatoirement scellée (toutes les Compétences Passives qui doivent être déclenchées seront inutilisables) pendant 2 tours."
	},
	["10"] = {
		10,
		"Emprisonnement",
		"Au début de la bataille, 3 de vos Filles alliées seront scellées pendant 2 tours. (cet effet se déclenche 1 fois tous les 2 tours, impossible à enlever. Les Filles alliées scellées ne peuvent pas déclencher leurs Compétences Passives)"
	},
	["11"] = {
		11,
		"Renforcement",
		"Lorsqu'un ennemi subit des dégâts, ces derniers ne pourront pas être supérieurs à 10% de la valeur de leur PV Max."
	},
	["12"] = {
		12,
		"Aveuglement",
		"Au début de la bataille, 2 Filles alliées aléatoires seront aveuglées (leurs Compétences Actives cibleront 1 ennemi aléatoire pendant 1 tour, cet effet se déclenchera 1 fois à chaque tour)."
	},
	["13"] = {
		13,
		"Saignement",
		"À la fin du tour, chaque Fille alliée subit des dégâts (12% de leur PV Max)."
	},
	["14"] = {
		14,
		"Éponge",
		"Au début de la bataille, tous les dégâts subis par les ennemis sont réduits de 90%. À la fin du tour, ce pourcentage diminue de 10% (diminue jusqu'à 50% au maximum)."
	},
	["15"] = {
		15,
		"Revers",
		"Lorsqu'une Fille alliée effectue une Attaque Basique ou lance sa Compétence Active, elle subit 100% des dégâts qu'elle inflige."
	},
	["16"] = {
		16,
		"Raid Ennemi",
		"Au début de la bataille, tous les ennemis ont 200 d'Énergie. Pendant les 2 premiers tours, tous les ennemis récupèrent 100 d'Énergie à la fin de ces 2 tours; au début du 3ème tour, tous les ennemis récupèrent 50 d'Énergie à la fin du tour."
	},
	["17"] = {
		17,
		"Combinaison",
		"Lors du 1er tour, les ennemis sont immunisés contre tous les Effets Négatifs. Pendant les 2 premiers tours, les ennemis ne subiront aucun dégât."
	},
	["18"] = {
		18,
		"Fatigue",
		"Réduit le Blocage des allliées Guerriers de 20%, la Précision des Filles alliées Mages de 20%, la Précision des Filles alliées Éclaireurs de 20%, la Pénétration d'Armure des Filles alliées Assassins de 25% et les Soins des Filles alliées Prêtres de 15%."
	},
	["19"] = {
		19,
		"Neutralisation",
		"À la fin du tour, chaque ennemi enlèvera 3 de ses Effets Négatifs."
	},
	["20"] = {
		20,
		"Ranimation",
		"Les 2 premiers ennemis qui subissent des dégâts mortels récupéreront 100% de leur PV."
	},
	["21"] = {
		21,
		"Potion de Vitalité",
		"À la fin du tour, soigne un ennemi aléatoire de la ligne avant de 8% de ses PV Max, et augmente l'Attaque d'un ennemi aléatoire de la ligne arrière de 20% pendant 2 tours."
	},
	["22"] = {
		22,
		"Étourdir",
		"Étourdit une Fille alliée aléatoire de la ligne avant pendant 1 tour, à chaque tour impair. Étouridt une Fille alliée aléatoire de la ligne arrière pendant 1 tour, à chaque tour pair."
	},
	["23"] = {
		23,
		"Infection Mutuelle",
		"À chaque tour impair, les dégâts infligés par les Filles alliées placées en position impair seront réduits de 15%. À chaque tour pair, les Soins Reçus par les Filles alliées en position pair seront réduits de 30%."
	},
	["24"] = {
		24,
		"Désir de Victoire",
		"Au début de la bataille, augmente de 20% les dégâts infligés par la Fille alliée ayant le moins de PV pendant 3 tours. Lorsque l'ennemi lance une attaque, la Fille alliée ayant le moins de PV sera la première cible."
	},
	["25"] = {
		25,
		"Faiblesse",
		"Réduit l'Attaque des Filles alliées de 10%."
	},
	["26"] = {
		26,
		"Dernier Combat",
		"Lorsque les PV de tous les ennemis sont inférieurs à 50%, réduit leurs dégâts subis de 30%."
	},
	["27"] = {
		27,
		"Paralyser",
		"Lorsque les ennemis subissent des dégâts, réduit leurs dégâts subis de 70%. De plus, à la fin du tour, les ennemis recevront des dégâts supplémentaires équivalent à 25% de la réduction de leurs dégâts subis pendant 4 tours. (cet effet ne peut être ni transféré ni enlevé.)"
	},
	["28"] = {
		28,
		"Fragile",
		"Réduit les PV des Filles alliées de 15%."
	},
	["29"] = {
		29,
		"Démoralisateur",
		"Les dégâts infligés par les Filles alliées ne peuvent pas être Critiques. (Sauf les dégâts à 100% de Crit.)"
	},
	["30"] = {
		30,
		"Revanche",
		"Chaque fois qu'un ennemi est vaincu, tous les ennemis récupéreront 30% de leurs PV Max, leur Attaque sera augmentée de 30%, leur Précision de 30%, leur Blocage de 30% et leur Critique de 30% pendant 3 tours."
	},
	["31"] = {
		31,
		"Invisible",
		"La première fois que les PV des ennemis sont inférieurs à 50%, ils deviendront invisibles aux Filles alliées pendant 4 tours. (esquive l'Attaque Basique et les attaques aléatoires, réduit les dégâts subis de 50%, et augmente les Critiques de 100%)"
	},
	["32"] = {
		32,
		"Expulser",
		"Au début de la bataille, la Fille alliée ayant le plus de PV sera expulsée jusqu'à la fin de la bataille (les PV et l'Énergie de la Fille expulsée resteront tels quels, elle ne pourra effectuer aucune action, ni recevoir de bonus, ou être ciblée par les attaques aléatoires). Si lors d'une bataille toutes les Filles sont expulsées, alors cela sera considéré comme défaite."
	},
	["33"] = {
		33,
		"Bénédiction Maudite",
		"Au début de la bataille, les Filles alliées obtiennent 3 couches de Bénédiction Maudite. Lorsque les Filles alliées enlèvent leurs Bénédictions Maudites, chaque couche de Bénédiction Maudite leur inflige des dégâts équivalent à 10% de leurs PV Max."
	},
	["34"] = {
		34,
		"Épuisement d'Énergie",
		"Réduit le gain d'Énergie des Filles alliées de 50%, les Filles alliées ayant 0 d'Énergie ne peuvent infliger auncun dégât. Réduit l'Attaque des Filles alliées ayant plus de 50 d'Énergie de 20%. À la fin du tour, consomme toutes les Énergies des Filles alliées ayant moins de 50 d'Énergie."
	},
	["35"] = {
		35,
		"Peine de Mort",
		"Au début de la bataille, inflige l'effet de Peine de Mort à 1 Fille alliée aléatoire (Cet effet ne peut pas être enlevé ainsi la Fille alliée avec cet effet sera vaincue dans 4 tours. Après la mort de cette Fille alliée, cet effet sera automatiquement transféré à une autre Fille alliée avec l'Attaque la plus élevée)."
	},
	["36"] = {
		36,
		"Compétence Scellée",
		"Seule une Fille alliée de votre équipe pourra déclencher sa Compétence Active à chaque tour. Une fois que cette Fille alliée aura déclenché sa Compétence Active, son Attaque sera réduite de 100% pendant 6 tours."
	},
	["37"] = {
		37,
		"Hallucination",
		"L'Attaque des Filles alliées changera avec leurs PV. (si une de vos Filles alliées perdra 1% de ses PV, son Attaque sera réduite de 1%)"
	},
	["38"] = {
		38,
		"Vol d'Attaque",
		"Au début des 4 premiers tours, les ennemis voleront 5% de l'Attaque de vos Filles alliées, respectivement en fonction de leurs positions (Cet effet ne peut pas être enlevé. Si aucune Fille alliée n'est placée en position opposée de l'ennemi, aucune Attaque ne peut être volée)"
	},
	["39"] = {
		39,
		"Barrière Flottante",
		"Au début de chaque tour, les ennemis non vaincus partageront une Barrière (1200% de l'Attaque de la Fille alliée ayant l'Attaque la plus élevée, cet effet ne peut être déclenché qu'une seule fois à chaque tour)."
	},
	["40"] = {
		40,
		"Pollution Méconnue",
		"À la fin de chaque tour, toutes les Filles alliées subiront des Dégâts sur la Durée (10% de leur PV Max) pendant 3 tours."
	},
	["41"] = {
		41,
		"Surtension",
		"Augmente de 100% l'Attaque de tous les ennemis et de 100% les dégâts infligés par tous les ennemis. À chaque fois qu'un ennemi lance son Attaque Basique ou sa Compétence Active, il a 100% de lancer une seconde fois son attaque."
	},
	["42"] = {
		42,
		"Repliement Urgent",
		"Réduit de 50% l'Attaque de toutes les Filles alliées, tandis que les ennemis récupèrent des PV (100% des dégâts subis durant ce tour) à la fin de chaque tour."
	}
}

return table
