-- chunkname: @../../../Product/Bundles/Android/src/data/tables/fr_fr/buff_text_fr_fr.lua

local table = {}

table.keys = {
	desc1 = 3,
	name = 1,
	desc = 2
}
table.rows = {
	atk = {
		"atk",
		"Attaque",
		"Attaque"
	},
	hp = {
		"hp",
		"PV",
		"生命上限百分比燃烧伤害"
	},
	arm = {
		"arm",
		"Armure",
		"Armure"
	},
	spd = {
		"spd",
		"Vitesse",
		"Vitesse"
	},
	sklP = {
		"sklP",
		"Dég. Comp.",
		"Dég. Comp."
	},
	hit = {
		"hit",
		"Précision",
		"Précision"
	},
	miss = {
		"miss",
		"Blocage",
		"Esquive"
	},
	crit = {
		"crit",
		"Critique",
		"Critique"
	},
	critTime = {
		"critTime",
		"Dég. Crit.",
		"Dég. Crit."
	},
	brk = {
		"brk",
		"Péné. d'Armure",
		"Péné. d'Armure"
	},
	free = {
		"free",
		"Immunité",
		"Immunité"
	},
	trueAtk = {
		"trueAtk",
		"Dégâts Divins",
		"Dégâts Divins"
	},
	energy = {
		"energy",
		"Énergie",
		"Énergie"
	},
	decDmg = {
		"decDmg",
		"Résis. aux Dég.",
		"Résis. aux Dég."
	},
	stun = {
		"stun",
		"Étourdir",
		"Étourdir (Passe son tour)"
	},
	ice = {
		"ice",
		"Geler",
		"Geler (Passe son tour)"
	},
	stone = {
		"stone",
		"Pétrifier",
		"Pétrifier"
	},
	forbid = {
		"forbid",
		"Rendre au Silence",
		"Rendre au Silence (Ne peut pas utiliser de capacité)"
	},
	hurt = {
		"hurt",
		"Dégâts Directs",
		"Dégâts Directs"
	},
	dot = {
		"dot",
		"Dégâts sur la durée",
		"Dégâts sur la durée (perd des PV tous les tours)"
	},
	heal = {
		"heal",
		"Soin Direct",
		"Soin Direct"
	},
	hot = {
		"hot",
		"Soin sur la durée",
		"Soin sur la durée (soigne chaque tour)"
	},
	healP = {
		"healP",
		"恢復%生命",
		"恢复%生命"
	},
	trueHurt = {
		"trueHurt",
		"Dégâts Divins",
		"Dégâts Divins"
	},
	dotPoison = {
		"dotPoison",
		"Empoisonné",
		"Empoisonné"
	},
	dotBlood = {
		"dotBlood",
		"Saignement",
		"Saignement"
	},
	dotFire = {
		"dotFire",
		"Brûlé",
		"Brûlé"
	},
	atkP = {
		"atkP",
		"Attaque",
		"Attaque (En % de dégâts)"
	},
	hpP = {
		"hpP",
		"PV",
		"PV(En % de dégâts)"
	},
	armP = {
		"armP",
		"Armure",
		"Armure"
	},
	addhurt = {
		"addhurt",
		"Ajoute une attaque",
		"Ajoute une attaque"
	},
	revive = {
		"revive",
		"Ressuscite",
		"Ressuscite"
	},
	siphonAtk = {
		"siphonAtk",
		"Pourcentage de vol d'attaque ",
		"Pourcentage de vol d'attaque "
	},
	siphonHp = {
		"siphonHp",
		"Pourcentage de vol de vie",
		"Pourcentage de vol de vie"
	},
	siphonArm = {
		"siphonArm",
		"Pourcentage de vol d'armure",
		"Pourcentage de vol d'armure"
	},
	shield = {
		"shield",
		"Réduit les dégâts de x%",
		"Réduit les dégâts de x%"
	},
	brier = {
		"brier",
		"Renvoie x% de dégâts",
		"Renvoie x% de dégâts"
	},
	rImpress = {
		"rImpress",
		"Marque Retardement",
		"Marque Retardement"
	},
	cImpress = {
		"cImpress",
		"Marque Coup Critique",
		"Marque Coup Critique"
	},
	rImpressB = {
		"rImpressB",
		"Explosion de la Marque Retardement",
		"Explosion de la Marque Retardement"
	},
	cImpressB = {
		"cImpressB",
		"Explosion de la Marque Coup Critique",
		"Explosion de la Marque Coup Critique"
	},
	fImpress = {
		"fImpress",
		"Marque Éclair",
		"Marque Éclair"
	},
	oImpress = {
		"oImpress",
		"Marque de l'Observateur",
		"Marque de l'Observateur"
	},
	weak = {
		"weak",
		"Affaibli",
		"Affaibli"
	},
	atkPos = {
		"atkPos",
		"La position augmente l'attaque",
		"La position augmente l'attaque"
	},
	hpPos = {
		"hpPos",
		"La position augmente les PV",
		"La position augmente les PV"
	},
	armPos = {
		"armPos",
		"la position augmente l'armure",
		"La position augmente l'Armure"
	},
	spdPos = {
		"spdPos",
		"la position augmente la vitesse",
		"La position augmente la Vitesse"
	},
	hitPos = {
		"hitPos",
		"位置增加精準",
		"位置增加精準"
	},
	missPos = {
		"missPos",
		"la position augmente l'esquive",
		"la position augmente l'esquive"
	},
	critPos = {
		"critPos",
		"la position augmente les critiques",
		"la position augmente les critiques"
	},
	critTimePos = {
		"critTimePos",
		"La position augmente les dégâts critiques",
		"La position augmente les dégâts critiques"
	},
	stunB = {
		"stunB",
		"Augmente les dégâts quand étourdi",
		"Augmente les dégâts quand étourdi"
	},
	iceB = {
		"iceB",
		"Augmente les dégâts quand gelé",
		"Augmente les dégâts quand gelé"
	},
	stoneB = {
		"stoneB",
		"Augmente les dégâts quand pétrifié",
		"Augmente les dégâts quand pétrifié"
	},
	dotFireB = {
		"dotFireB",
		"Augmente les dégâts quand brûlé",
		"Augmente les dégâts quand brûlé"
	},
	dotPoisonB = {
		"dotPoisonB",
		"Augmente les dégâts quand empoisonné",
		"Augmente les dégâts quand empoisonné"
	},
	dotBloodB = {
		"dotBloodB",
		"Augmente les dégâts quand saigne",
		"Augmente les dégâts quand saigne"
	},
	zs = {
		"zs",
		"Dégats Supp. contre Guerrier",
		"Dégâts supplémentaires contre Guerrier"
	},
	fs = {
		"fs",
		"Dégats Supp. contre Mage",
		"Dégâts supplémentaires contre Mage"
	},
	ms = {
		"ms",
		"Dégats Supp. contre Prêtre",
		"Dégâts supplémentaires contre Prêtre"
	},
	ck = {
		"ck",
		"Dégats Supp. contre Assassin",
		"Dégâts supplémentaires contre Assassin"
	},
	yx = {
		"yx",
		"Dégats Supp. contre Éclaireur",
		"Dégâts supplémentaires contre Éclaireur"
	},
	changeCombat = {
		"changeCombat",
		"Change pour Attaque normal",
		"Change pour Attaque normal"
	},
	fsStun = {
		"fsStun",
		"Étourdit les Mages",
		"Étourdit les Mages"
	},
	fsDotBlood = {
		"fsDotBlood",
		"Fait saigner les Mages",
		"Fait saigner les Mages"
	},
	zsIce = {
		"zsIce",
		"Gèle les Guerriers",
		"Gèle les Guerriers"
	},
	zsStun = {
		"zsStun",
		"Étourdit les Guerriers",
		"Étourdit les Guerriers"
	},
	zsForbid = {
		"zsForbid",
		"Rend les Guerriers au silence",
		"Rend les Guerriers au silence"
	},
	zsHurt = {
		"zsHurt",
		"Dégâts supplémentaires aux Guerriers",
		"Dégâts supplémentaires aux Guerriers"
	},
	zsArmP = {
		"zsArmP",
		"Réduit l'armure des Guerriers",
		"Réduit l'armure des Guerriers"
	},
	ckStone = {
		"ckStone",
		"Pétrifie les Assassins",
		"Pétrifie les Assassins"
	},
	ckForbid = {
		"ckForbid",
		"Rend les Assassins au silence",
		"Rend les Assassins au silence"
	},
	ckHurt = {
		"ckHurt",
		"Dégâts supplémentaires contre les Assassins",
		"Dégâts supplémentaires contre les Assassins"
	},
	msForbid = {
		"msForbid",
		"Rend les Prêtres au silence",
		"Rend les Prêtres au silence"
	},
	yxHurt = {
		"yxHurt",
		"Dégâts supplémentaires contre les Éclaireurs",
		"Dégâts supplémentaires contre les Éclaireurs"
	},
	yxAtkP = {
		"yxAtkP",
		"Réduit l'attaque des Éclaireurs",
		"Réduit l'attaque des Éclaireurs"
	},
	zsHpPO = {
		"zsHpPO",
		"PV",
		"Augmente les PV des Guerriers"
	},
	zsAtkPO = {
		"zsAtkPO",
		"Attaque",
		"Augmente l'attaque des Guerriers"
	},
	zsCritO = {
		"zsCritO",
		"Critique",
		"Augmente les critiques des Guerriers"
	},
	zsMissO = {
		"zsMissO",
		"Blocage",
		"Augmente l'esquive des Guerriers"
	},
	zsSklPO = {
		"zsSklPO",
		"Dég. Comp.",
		"Dég. Comp."
	},
	fsHpPO = {
		"fsHpPO",
		"PV",
		"Augmente les PV des Mages"
	},
	fsAtkPO = {
		"fsAtkPO",
		"Attaque",
		"Augmente l'attaque des Mages"
	},
	fsCritO = {
		"fsCritO",
		"Critique",
		"Augmente les critiques des Mages"
	},
	fsHitO = {
		"fsHitO",
		"Précision",
		"Précision"
	},
	fsSklPO = {
		"fsSklPO",
		"Dég. Comp.",
		"Dég. Comp."
	},
	ckHpPO = {
		"ckHpPO",
		"PV",
		"Augmente les PV des Assassins"
	},
	ckCritTimeO = {
		"ckCritTimeO",
		"Dégâts Critiques",
		"Dégâts Crit"
	},
	ckCritO = {
		"ckCritO",
		"Critique",
		"Augmente les critiques des Assassins"
	},
	ckBrkO = {
		"ckBrkO",
		"Péné. d'Armure",
		"Péné. d'Armure"
	},
	ckSklPO = {
		"ckSklPO",
		"Dég. Comp.",
		"Dég. Comp."
	},
	yxHpPO = {
		"yxHpPO",
		"PV",
		"Augmente les PV des Éclaireurs"
	},
	yxAtkPO = {
		"yxAtkPO",
		"Attaque",
		"Augmente l'attaque des Éclaireurs"
	},
	yxMissO = {
		"yxMissO",
		"Blocage",
		"Augmente l'esquive des Éclaireurs"
	},
	yxHitO = {
		"yxHitO",
		"Précision",
		"Précision"
	},
	yxSklPO = {
		"yxSklPO",
		"Dég. Comp.",
		"Dég. Comp."
	},
	msHpPO = {
		"msHpPO",
		"PV",
		"Augmente les PV des Prêtres"
	},
	msMissO = {
		"msMissO",
		"Blocage",
		"Augmente l'esquive des Prêtres"
	},
	msCritO = {
		"msCritO",
		"Critique",
		"Augmente les critiques des Prêtres"
	},
	msSpdO = {
		"msSpdO",
		"Vitesse",
		"Vitesse"
	},
	msSklPO = {
		"msSklPO",
		"Dég. Comp.",
		"Dég. Comp."
	},
	ckStun = {
		"ckStun",
		"Étourdit les Assassins",
		"Étourdit les Assassins"
	},
	mhurt = {
		"mhurt",
		"Inflige des dégâts directs",
		"Inflige des dégâts directs"
	},
	mdotFire = {
		"mdotFire",
		"Inflige des dégâts sur la durée (Brûle)",
		"Inflige des dégâts sur la durée (Brûle)"
	},
	mdotPoison = {
		"mdotPoison",
		"Inflige des dégâts sur la durée (Empoisonne)",
		"Inflige des dégâts sur la durée (Empoisonne)"
	},
	mdotBlood = {
		"mdotBlood",
		"Inflige des dégâts sur la durée (Saignement)",
		"Inflige des dégâts sur la durée (Saignement)"
	},
	yxDotBlood = {
		"yxDotBlood",
		"Fait saigner les Éclaireurs",
		"Fait saigner les Éclaireurs"
	},
	phurt = {
		"phurt",
		"Si les PV de la cible sont inférieurs, inflige % de dégâts directs",
		"Si les PV de la cible sont inférieurs, inflige % de dégâts directs"
	},
	addHurtd = {
		"addHurtd",
		"Inflige une attaque supplémentaire aux cibles ayant moins de défense que soi",
		"Inflige une attaque supplémentaire aux cibles ayant moins de défense que soi"
	},
	zsDotFire = {
		"zsDotFire",
		"Brûle les Guerriers",
		"Brûle les Guerriers"
	},
	yxStun = {
		"yxStun",
		"Étourdit les Éclaireurs",
		"Étourdit les Éclaireurs"
	},
	fsForbid = {
		"fsForbid",
		"Rend les Mages au silence",
		"Rend les Mages au silence"
	},
	ckDotPoison = {
		"ckDotPoison",
		"Empoisonne les Assassins",
		"Empoisonne les Assassins"
	},
	msStun = {
		"msStun",
		"Étourdit les Prêtres",
		"Étourdit les Prêtres"
	},
	msDotFire = {
		"msDotFire",
		"Brûle les Prêtres",
		"Brûle les Prêtres"
	},
	zsSpdO = {
		"zsSpdO",
		"Vitesse",
		"Vitesse"
	},
	fsSpdO = {
		"fsSpdO",
		"Vitesse",
		"Vitesse"
	},
	ckSpdO = {
		"ckSpdO",
		"Vitesse",
		"Vitesse"
	},
	ckAtkPO = {
		"ckAtkPO",
		"Attaque",
		"Augmente l'attaque des Assassins"
	},
	yxSpdO = {
		"yxSpdO",
		"Vitesse",
		"Vitesse"
	},
	msAtkPO = {
		"msAtkPO",
		"Attaque",
		"Augmente l'attaque des Prêtres"
	},
	iceless = {
		"iceless",
		"Immuniser contre Geler",
		"Immuniser contre Geler"
	},
	stoneless = {
		"stoneless",
		"Immuniser contre Pétrifier",
		"Immuniser contre Pétrifier"
	},
	stunless = {
		"stunless",
		"Immuniser contre Étourdir",
		"Immuniser contre Étourdir"
	},
	forbidless = {
		"forbidless",
		"Immuniser contre Rendre au Silence",
		"Immuniser contre Rendre au Silence"
	},
	stunH = {
		"stunH",
		"生命不低于自己的目标眩晕",
		"生命不低于自己的目标眩晕"
	},
	hurtH = {
		"hurtH",
		"Inflige des dégâts supplémentaires à la cible dont ses PV sont inférieurs à soi",
		"Inflige des dégâts supplémentaires à la cible dont ses PV sont inférieurs à soi"
	},
	msHurt = {
		"msHurt",
		"Dégâts supplémentaires aux Prêtres",
		"Dégâts supplémentaires aux Prêtres"
	},
	forbidH = {
		"forbidH",
		"生命不高于自己的目标禁魔",
		"生命不高于自己的目标禁魔"
	},
	phurtH = {
		"phurtH",
		"Inflige des dégâts supplémentaires équivalent à x% des PV Max de la cible dont ses PV sont supérieurs à soi",
		"Inflige des dégâts supplémentaires équivalent à x% des PV Max de la cible dont ses PV sont supérieurs à soi"
	},
	rddot = {
		"rddot",
		"Dégât aléatoire sur la durée (Saignement, Brûlure, Empoisionnement)",
		"Dégât aléatoire sur la durée (Saignement, Brûlure, Empoisionnement)"
	},
	rdcontrol = {
		"rdcontrol",
		"Effet aléatoire de contrôle (Étourdir, Gêler, Pétrifier)",
		"Effet aléatoire de contrôle (Étourdir, Gêler, Pétrifier)"
	},
	hurtmaxM = {
		"hurtmaxM",
		"Inflige dégâts supplémentaires équivalent à x% des PV max d'allié",
		"Inflige dégâts supplémentaires équivalent à x% des PV max d'allié"
	},
	hurtmaxH = {
		"hurtmaxH",
		"Inflige dégâts supplémentaires équivalent à x% de son PV max",
		"Inflige dégâts supplémentaires équivalent à x% de son PV max"
	},
	healB = {
		"healB",
		"Soin Reçu",
		"被治疗效果增强x%"
	},
	hurtshare = {
		"hurtshare",
		"Toute l'allié subit les dégâts",
		"Toute l'allié subit les dégâts"
	},
	exhurt = {
		"exhurt",
		"Attaque Basique supplémentaire",
		"Attaque Basique supplémentaire"
	},
	hurtB = {
		"hurtB",
		"Augmente l'Attaque Basique de x%",
		"Augmente l'attaque basique de x%"
	},
	newRound = {
		"newRound",
		"击杀角色获得新回合",
		"击杀角色获得新回合"
	},
	overflow = {
		"overflow",
		"Partage des dégâts",
		"Partage des dégâts"
	},
	shield = {
		"shield",
		"Bouclier de Résister",
		"Bouclier de Résister"
	},
	buffExloded = {
		"buffExloded",
		"buff d'explosion",
		"buff d'explosion"
	},
	mindControl = {
		"mindControl",
		"Contrôle mental",
		"Contrôle mental"
	},
	transformBK = {
		"transformBK",
		"祭献转化成分身",
		"祭献转化成分身"
	},
	atkPBK = {
		"atkPBK",
		"黑骑士攻击buff",
		"黑骑士攻击buff"
	},
	brkBK = {
		"brkBK",
		"黑骑士破甲buff",
		"黑骑士破甲buff"
	},
	sw = {
		"sw",
		"神威學院傷害提升",
		"神威學院傷害提升"
	},
	yz = {
		"yz",
		"隱蹤學院傷害提升",
		"隱蹤學院傷害提升"
	},
	th = {
		"th",
		"曇華學院傷害提升",
		"曇華學院傷害提升"
	},
	fj = {
		"fj",
		"風見學院傷害提升",
		"風見學院傷害提升"
	},
	cx = {
		"cx",
		"辰星學院傷害提升",
		"辰星學院傷害提升"
	},
	xl = {
		"xl",
		"修羅學院傷害提升",
		"修羅學院傷害提升"
	},
	critDef = {
		"critDef",
		"受到暴击伤害",
		"受到暴击伤害"
	},
	debuffClean = {
		"debuffClean",
		"清除减益效果",
		"清除减益效果"
	},
	surAtkP = {
		"surAtkP",
		"存活战姬数*1.2%攻击力",
		"存活战姬数*1.2%攻击力"
	},
	hurtLhurtP = {
		"hurtLhurtP",
		"生命高于自己，额外伤害量x%的伤害",
		"生命高于自己，额外伤害量x%的伤害"
	},
	healI = {
		"healI",
		"Soin",
		"造成治疗效果增强x%"
	},
	healPlose = {
		"healPlose",
		"恢复已损失生命%生命",
		"恢复已损失生命%生命"
	},
	rowFArmP = {
		"rowFArmP",
		"Armure pour l'avant",
		"Armure pour l'avant"
	},
	rowFStone = {
		"rowFStone",
		"Pétrifie les ennemis en avant",
		"Pétrifie les ennemis en avant"
	},
	rowBAtkP = {
		"rowBAtkP",
		"对后排攻击",
		"对后排攻击"
	},
	rowBSpd = {
		"rowBSpd",
		"对后排速度",
		"对后排速度"
	},
	dotTwins = {
		"dotTwins",
		"双子持续伤害",
		"双子持续伤害"
	},
	rowFHpP = {
		"rowFHpP",
		"hpPos-前排",
		"hpPos-前排"
	},
	rowBHpP = {
		"rowBHpP",
		"hpPos-后排",
		"hpPos-后排"
	},
	rowBArmP = {
		"rowBArmP",
		"armPos-后排",
		"armPos-后排"
	},
	rowFHit = {
		"rowFHit",
		"hitPos-前排",
		"hitPos-前排"
	},
	rowBMiss = {
		"rowBMiss",
		"missPos-后排",
		"missPos-后排"
	},
	rowBCrit = {
		"rowBCrit",
		"critPos-后排",
		"critPos-后排"
	},
	hotHuatuo = {
		"hotHuatuo",
		"持续回血（每回合回血）",
		"持续回血（每回合回血"
	},
	reviveINF = {
		"reviveINF",
		"无限复活（立刻复活）",
		"无限复活（立刻复活）"
	},
	reviveINFbuff = {
		"reviveINFbuff",
		"无限复活累加buff",
		"无限复活累加buff"
	},
	dotFireMaxHp = {
		"dotFireMaxHp",
		"生命上限百分比燃烧伤害",
		"生命上限百分比燃烧伤害"
	},
	atkUnable = {
		"atkUnable",
		"无法攻击",
		"无法攻击"
	},
	free_harm = {
		"free_harm",
		"免死护盾",
		"免死护盾"
	},
	aggression = {
		"aggression",
		"杀意buff",
		"杀意buff"
	},
	aggressionHarm = {
		"aggressionHarm",
		"杀意伤害",
		"杀意伤害"
	},
	stunSober = {
		"stunSober",
		"对未眩晕敌人眩晕",
		"对未眩晕敌人眩晕"
	},
	critStun = {
		"critStun",
		"对已眩晕敌人暴击伤害（配置攻击百分比、此伤害必定暴击）",
		"对已眩晕敌人暴击伤害（配置攻击百分比、此伤害必定暴击）"
	},
	hurtmaxHLimit15 = {
		"hurtmaxHLimit15",
		"对目标造成其生命上限x%的伤害（不超過15倍攻擊）",
		"对目标造成其生命上限x%的伤害（不超過15倍攻擊）"
	},
	unfree = {
		"unfree",
		"Chance de Contrôle",
		"Chance de Contrôle"
	},
	incDmg = {
		"incDmg",
		"增伤率",
		"增伤率"
	},
	incDmgGroupCom = {
		"incDmgGroupCom",
		"Augmenter les dégâts reçus par les Filles de la Maison Fantôme/Humain/Monstre/Fée",
		"增伤率-四系"
	},
	incDmgGroupSpe = {
		"incDmgGroupSpe",
		"Augmenter les dégâts reçus par les Filles de Maison Ange/Démon",
		"增伤率-光暗"
	},
	incDmgGroupChaos = {
		"incDmgGroupChaos",
		"Augmenter les dégâts reçus par les Chaos",
		"增伤率-混沌"
	},
	decDmgGroupCom = {
		"decDmgGroupCom",
		"Réduire les dégâts causés par les Filles de la Maison Fantôme/Humain/Monstre/Fée",
		"减伤率-四系"
	},
	decDmgGroupSpe = {
		"decDmgGroupSpe",
		"Réduire les dégâts causés par les Filles de Maison Ange/Démon",
		"减伤率-光暗"
	},
	decDmgGroupChaos = {
		"decDmgGroupChaos",
		"Réduire les dégâts causés par les Chaos",
		"减伤率-光暗"
	},
	incDmgSkl = {
		"incDmgSkl",
		"Augmenter les Dégâts des Compétences des Filles",
		"增伤率-技能"
	},
	decDmgSkl = {
		"decDmgSkl",
		"Réduire les dégâts reçus par les Filles",
		"减伤率-技能"
	},
	incDmgNorAtk = {
		"incDmgNorAtk",
		"Augmenter l'attaque basique des Filles",
		"增伤率-普攻"
	},
	decDmgNorAtk = {
		"decDmgNorAtk",
		"Réduire les dégâts de l'attaque basique reçus par les Filles",
		"减伤率-普攻"
	},
	allHarmDec = {
		"allHarmDec",
		"Résistance Totale",
		"Résistance Totale（inclut les dégâts en %）"
	},
	unCrit = {
		"unCrit",
		"Résistance aux Critiques",
		"Résistance aux Critiques"
	},
	resist_zs = {
		"resist_zs",
		"Réduc. Dég. des Guerriers",
		"Réduc. Dég. des Guerriers"
	},
	resist_fs = {
		"resist_fs",
		"Réduc. Dég. des Mages",
		"Réduc. Dég. des Mages"
	},
	resist_yx = {
		"resist_yx",
		"Réduc. Dég. des Éclaireurs",
		"Réduc. Dég. des Éclaireurs"
	},
	resist_ck = {
		"resist_ck",
		"Réduc. Dég. des Assassins",
		"Réduc. Dég. des Assassins"
	},
	resist_ms = {
		"resist_ms",
		"Réduc. Dég. des Prêtres",
		"Réduc. Dég. des Prêtres"
	},
	allDmgC = {
		"allDmgC",
		"Tous les Dégâts",
		"Tous les Dégâts"
	},
	allDmgRate = {
		"allDmgRate",
		"Tous les Dég.",
		"Tous les Dégâts"
	}
}

return table
