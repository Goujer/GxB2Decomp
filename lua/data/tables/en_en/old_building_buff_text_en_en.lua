﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/en_en/old_building_buff_text_en_en.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"Heavy Armor",
		"Increase your enemies' HP by 30%."
	},
	["2"] = {
		2,
		"Adrenaline",
		"Increase your enemies' Attack by 30%."
	},
	["3"] = {
		3,
		"Barrier",
		"Increase your enemies' Crit Resist by 30%. (Crit Resist can lower the rate to take a Crit hit)"
	},
	["4"] = {
		4,
		"Poisonous Gas",
		"Reduce the Heal effect your Girls receive by 60%."
	},
	["5"] = {
		5,
		"Energy Drain",
		"Your Girls won't be able to trigger their Active skills in the first 3 rounds of the Battle."
	},
	["6"] = {
		6,
		"Close Formation",
		"The damage you deal will distribute evenly among all enemies."
	},
	["7"] = {
		7,
		"Medical Supply",
		"Your enemies will regenerate 15% of their Maximum HP at the end of each round."
	},
	["8"] = {
		8,
		"Scapegoat",
		"Each enemy will transfer 2 random debuffs they have to a random Girl in your team at the end of each round. (Control effect will be transferred first, the Girls who with fewer debuffs will be transferred first)"
	},
	["9"] = {
		9,
		"Ultimate Seal",
		"Each enemy will gain 2 shields that can neutralize 1 damage the first time she takes a lethal damage, and randomly Seal an ally Girl (All their passive skills that can be triggered will not be available) for 2 rounds."
	},
	["10"] = {
		10,
		"Void Seal",
		"At the start of the battle, disables 3 random Girls in your team from triggering their Passive skills for 2 rounds. This effect will be triggered once every 2 rounds."
	},
	["11"] = {
		11,
		"Armor Plate",
		"The enemy will only take 10% of their Maximum HP damage at most from each hit."
	},
	["12"] = {
		12,
		"Blind",
		"At the beginning of each round, 2 random ally Girls will be Blinded. (Blinded Girls' Active skill will target 1 random enemy only, the effect lasts for 1 round)"
	},
	["13"] = {
		13,
		"Bleed out",
		"All your Girls take a (12% of their Maximum HP) damage at the end of each round."
	},
	["14"] = {
		14,
		"Buffer",
		"Your enemies will take 90% less damage at the beginning of the battle. This effect will be reduced by 10% at the end of each round for 4 rounds."
	},
	["15"] = {
		15,
		"Thorns",
		"The enemies reflect 100% of Basic Attack and Active skill damage they take to the attackers."
	},
	["16"] = {
		16,
		"Full Attack",
		"At the beginning of battle, all enemies have 200 Energy. During the first 2 rounds of battle, all enemies recover 100 Energy at the end of each round. Starting from the 3rd round, all enemies recover 50 Energy at the end of each round."
	},
	["17"] = {
		17,
		"Well Protected",
		"You enemies will be immune to all debuffs at the 1st round, they will also be immune to damage in the first 2 rounds."
	},
	["18"] = {
		18,
		"Tiredness",
		"Reduces your Warriors' Block rate by 20%, your Mages' and Rangers' Precision by 20%, your Assassins' Armor Break by 25%, your Priests' Heal amount by 15%."
	},
	["19"] = {
		19,
		"Disinfectant Spray",
		"All your enemies will randomly remove 3 debuffs from themselves at the end of each round."
	},
	["20"] = {
		20,
		"Regroup",
		"The first 2 enemies who takes lethal damage will heal themselves by 100% of their Maximum HP."
	},
	["21"] = {
		21,
		"Energy Potion",
		"Heal 1 random enemy in front-line for 8% of Maximum HP and increase Attack of 1 random enemy in back-line by 20% for 2 rounds at the end of each round."
	},
	["22"] = {
		22,
		"Stun",
		"In the odd rounds, Stuns 1 random Girl in the front-line of your team for 1 round, in the even rounds, Stuns 1 random ally in the backline of your team for 1 round.  "
	},
	["23"] = {
		23,
		"Infestation Pandemic",
		"In odd the rounds, the damage dealt by your Girls in odd positions is reduced by 15%, in the even rounds, the healing effect received by your Girls in even positions is reduced by 30%."
	},
	["24"] = {
		24,
		"Victor Rush",
		"At the start of battle, the damage the girl with the lowest HP in your team received increases by 20% for 3 rounds. Your enemies will target this girl when picking their target."
	},
	["25"] = {
		25,
		"Faint",
		"Lower the Attack of the Girls in your team by 10%."
	},
	["26"] = {
		26,
		"Back Waters",
		"Enemies take 30% less damage when HP is lower than 50%."
	},
	["27"] = {
		27,
		"Painless",
		"Reduces damage taken by enemies by 70%, at the end of each turn they will receive additional damage equal to 25% of previous damage reduced for 4 turns. (This effect cannot be removed or transferred)"
	},
	["28"] = {
		28,
		"Poor Health",
		"Lower the HP of the Girls in your team by 15%."
	},
	["29"] = {
		29,
		"Low Morale",
		"Your Girl's Crit Attributes will be lowered to 0."
	},
	["30"] = {
		30,
		"Revenge",
		"When an enemy is defeated, all enemies remaining will heal themselves for (30% of self maximum HP), and increase their Attack, Precision, Block Rate and Crit by 30% for 3 rounds."
	},
	["31"] = {
		31,
		"Invisibility",
		"Each enemy will gain Invisibility (they will be able to dodge attacks that target 1 enemy or target random enemy, lower the damage taken by 50% and gain 100% extra Crit) for 4 rounds when their HP is lower than 50%. (can trigger only once)"
	},
	["32"] = {
		32,
		"Exile",
		"Banish the Girl with the highest HP in your team from battle. (The Girl banished won't be able to move, targeted or receive buffs and debuffs, if she's the only Girl left in your team, you will lose the battle.)"
	},
	["33"] = {
		33,
		"Healing Curse",
		"All your Girls gain 3 stacks of Healing Curse at the beginning of battle. Each Stack of Healing Curse removed without being triggered will deal 10% of maximum HP to the target."
	},
	["34"] = {
		34,
		"Insufficient Energy",
		"Reduce the energy your Girls get by 50%. If your Girls have no Energy, they won't be able to deal damage. If your Girls have Energy more than 50, they will only deal 80% of damage. If your Girls have Energy lower than 50, their Energy will be removed at the end of each round."
	},
	["35"] = {
		35,
		"Reaper's Curse",
		"At the start of the battle, afflict \"Reaper's Curse\" to the Girl with the highest Attack attribute in your team. Girls afflicted by \"Reaper's Curse\" will be defeated in 4 rounds after Reaper's Curse is afflicted on her, this effect cannot be removed. When the owner of Reaper's Curse is defeated, Reaper's Curse will be afflicted to the Girl with the highest Attack attribute in your team."
	},
	["36"] = {
		36,
		"Bad Call",
		"Only 1 Girl in your team is able to trigger her Active skill each round. After a Girl in your team triggers an Active skill, reduce her Attack by 100% for 6 rounds."
	},
	["37"] = {
		37,
		"Phantom Pain",
		"Your Girls' Attack attributes will change according to their HP. (For example: when a Girl has 100% HP, her Attack will be at 100%, but if a Girl has 0% HP, her Attack will thus be reduced by 100%)"
	},
	["38"] = {
		38,
		"Attack Steal",
		"In the first 4 rounds of the battle, the enemies will steal 5% Attack from your Girls at the beginning of each round, this effect cannot be removed. (Each enemy will steal the Attack of the Girl in the same position as itself, if there is no Girl in the position, no Attack can be stolen.)"
	},
	["39"] = {
		39,
		"Floating Shield",
		"Provides Magick Barriers with a total of 1200% of Attack (of the Girl with the highest Attack on YOUR team) BP for the enemy team at the start of each round. The BP Attack percentage will be divided evenly amongst the remaining enemies on the battlefield. This effect will trigger once in each round."
	},
	["40"] = {
		40,
		"Unknown Pollution",
		"Deals (10% of the target's maximum HP) random DoT damage (Bleed, Burn, or Poison) to all your Girls at the end of each round for 3 rounds."
	},
	["41"] = {
		41,
		"Power Surge",
		"Increases the Attack and Damage dealt by all enemies by 100%. The enemies have a 100% chance to repeat their Active Skills and Basic Attacks once when triggering them."
	},
	["42"] = {
		42,
		"Fail to Penetrate",
		"Lowers the Attack of your Girls by 50%. Heals the enemies by 100% of the damage received in the round at the end of each round."
	}
}

return table
