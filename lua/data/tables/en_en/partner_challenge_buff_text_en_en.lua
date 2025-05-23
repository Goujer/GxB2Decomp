﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/en_en/partner_challenge_buff_text_en_en.lua

local table = {}

table.keys = {
	id = 1,
	name = 2,
	desc = 3
}
table.rows = {
	["1"] = {
		1,
		"Potency Evocation",
		"Increases Crit by 25%, Crit Damage by 25% to all your girls."
	},
	["2"] = {
		2,
		"Evil Ritual",
		"When battle starts, your girls have 90% HP and 200 Energy."
	},
	["3"] = {
		3,
		"Heart Drilling",
		"When battle starts, all enemies take random DoT lasting for 3 rounds. DoT (Bleeding & Poisoning & Burning) taken by the enemies increases by 25%."
	},
	["4"] = {
		4,
		"Energy Fluctuation",
		"When battle starts, all enemies become affected by a random Control effect lasting for 2 rounds. Allies deal 50% more damage when targeting controlled (frozen, petrified, stunned) enemies."
	},
	["5"] = {
		5,
		"Dazzling Light",
		"Whenever an ally casts a skill, stun a random enemy for 2 rounds。"
	},
	["6"] = {
		6,
		"Spreading Fear",
		"After every enemy's move, she takes damage (10% of the Max HP of the girl with the highest Max HP in your lineup), must hit, and 50% chance to be silenced for 2 rounds."
	},
	["7"] = {
		7,
		"Cloudy Storm",
		"Allies' HP healing amount will  be increased by 25%. All enemies' HP healing amount will be decreased by 75%. Whenever a girl is healed, the enemy with the highest HP will take damage(5% of the Max HP of the girl who was healed), must hit."
	},
	["8"] = {
		8,
		"Way of Shura",
		"When a girl takes damage, she has 75% chance to counterattack, dealing (100% of Attack) Damage, must hit."
	},
	["9"] = {
		9,
		"Unified Body",
		"Your girls gain 25% Damage Reduce Rate. Whenever a girl takes damage, it will have 50% chance to distribute evenly among all allies."
	},
	["10"] = {
		10,
		"Dual Blade",
		"Allies' Basic Attack damage increases by 100%. Whenever an ally performs a Basic Attack, there is 50% chance to perform an additional Basic Attack."
	}
}

return table
