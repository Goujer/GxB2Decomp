-- chunkname: @../../../Product/Bundles/Android/src/data/tables/de_de/buff_text_de_de.lua

local table = {}

table.keys = {
	desc1 = 3,
	name = 1,
	desc = 2
}
table.rows = {
	atk = {
		"atk",
		"Angriff",
		"Angriff"
	},
	hp = {
		"hp",
		"HP",
		"生命上限百分比燃烧伤害"
	},
	arm = {
		"arm",
		"Rüstung",
		"Rüstung"
	},
	spd = {
		"spd",
		"Speed",
		"Speed"
	},
	sklP = {
		"sklP",
		"Skill-Schad.",
		"Skill-Schad."
	},
	hit = {
		"hit",
		"Präzision",
		"Präzision"
	},
	miss = {
		"miss",
		"Blockade",
		"Ausweichen"
	},
	crit = {
		"crit",
		"Krit.",
		"Krit."
	},
	critTime = {
		"critTime",
		"Krit. Schaden",
		"暴击伤害值"
	},
	brk = {
		"brk",
		"Rüstungsbruch",
		"Rüstungsbruch"
	},
	free = {
		"free",
		"Immunität (Ktr.)",
		"Immunität (Ktr.)"
	},
	trueAtk = {
		"trueAtk",
		"Heiliger Schaden",
		"Heiliger Schaden"
	},
	energy = {
		"energy",
		"Energie",
		"Energie"
	},
	decDmg = {
		"decDmg",
		"Schadensred.",
		"Schadensred."
	},
	stun = {
		"stun",
		"Betäuben",
		"Betäuben"
	},
	ice = {
		"ice",
		"Einfrieren",
		"Einfrieren"
	},
	stone = {
		"stone",
		"Versteinern",
		"Versteinern"
	},
	forbid = {
		"forbid",
		"Stilllegen",
		"Stille"
	},
	hurt = {
		"hurt",
		"Direkter Schaden",
		"Direkter Schaden"
	},
	dot = {
		"dot",
		"Kontinuierlicher Schaden",
		"Schäden im Laufe der Zeit (Markieren und Bluten)"
	},
	heal = {
		"heal",
		"Direkte Heilung",
		"Direkte Heilung"
	},
	hot = {
		"hot",
		"Kontinuierliche Heilung",
		"Anhaltende Heilung"
	},
	healP = {
		"healP",
		"HP-Erholung",
		"恢复%生命"
	},
	trueHurt = {
		"trueHurt",
		"Heiliger Schaden",
		"Heiliger Schaden"
	},
	dotPoison = {
		"dotPoison",
		"Gift",
		"Gift"
	},
	dotBlood = {
		"dotBlood",
		"Bluten",
		"Bluten"
	},
	dotFire = {
		"dotFire",
		"Brennen",
		"Brennen"
	},
	atkP = {
		"atkP",
		"Angriff",
		"Angriff"
	},
	hpP = {
		"hpP",
		"HP",
		"生命（按%加生命）"
	},
	armP = {
		"armP",
		"Rüstung",
		"Rüstung"
	},
	addhurt = {
		"addhurt",
		"Attacke hinzufügen",
		"Attacke hinzufügen"
	},
	revive = {
		"revive",
		"Wiederbeleben",
		"wiederbeleben"
	},
	siphonAtk = {
		"siphonAtk",
		"Prozentualen Angriff gestohlen ",
		"Prozentualer Angriff gestohlen "
	},
	siphonHp = {
		"siphonHp",
		"Prozentuale HP gestohlen",
		"Prozent HP gestohlen"
	},
	siphonArm = {
		"siphonArm",
		"Prozentuale Rüstung gestohlen",
		"Prozent Rüstung gestohlen"
	},
	shield = {
		"shield",
		"x%igen Schaden neutralisiert",
		"Reduziert den Schaden um x%"
	},
	brier = {
		"brier",
		"Schaden um x% reduziert",
		"Reduziert den Schaden um x%"
	},
	rImpress = {
		"rImpress",
		"Rundes Zeichen",
		"Markenverzögerung"
	},
	cImpress = {
		"cImpress",
		"Krit. Zeichen",
		"Krit. Markierung"
	},
	rImpressB = {
		"rImpressB",
		"Explosion Rundes Zeichens",
		"Markierungs Explosion"
	},
	cImpressB = {
		"cImpressB",
		"Explosion Krit. Zeichens",
		"Krit. Markierungs Explosion"
	},
	fImpress = {
		"fImpress",
		"Blitzzeichen",
		"Blitzschlag"
	},
	oImpress = {
		"oImpress",
		"Zeichen des Beobachters",
		"Zeichen des Beobachters"
	},
	weak = {
		"weak",
		"Schwächen",
		"Schwächen"
	},
	atkPos = {
		"atkPos",
		"Angriff erhöht",
		"Position erhöht die Trefferquote"
	},
	hpPos = {
		"hpPos",
		"位置增加生命率",
		"位置增加生命率"
	},
	armPos = {
		"armPos",
		"Rüstung erhöht",
		"Die Position erhöht die Rüstung"
	},
	spdPos = {
		"spdPos",
		"Geschwindigkeit erhöht",
		"Position erhöht die Geschwindigkeit"
	},
	hitPos = {
		"hitPos",
		"Präzision erhöht",
		"Erhöht die Präzision der Position"
	},
	missPos = {
		"missPos",
		"Dodge erhöht",
		"Ausweichen erhöht"
	},
	critPos = {
		"critPos",
		"Krit. erhöht",
		"Krit. erhöht"
	},
	critTimePos = {
		"critTimePos",
		"Kritischen Multiplikator erhöht",
		"erhöht den kritischen Multiplikator"
	},
	stunB = {
		"stunB",
		"Betäubungsschaden erhöht",
		"Erhöht den Betäubungs-Schaden"
	},
	iceB = {
		"iceB",
		"Einfrierungsschaden erhöht",
		"Erhöht den Einfrierungs-Schaden"
	},
	stoneB = {
		"stoneB",
		"Versteinerungsschaden erhöht",
		"Erhöht den Versteinerungs-Schaden"
	},
	dotFireB = {
		"dotFireB",
		"Brennschaden erhöht",
		"Erhöht den Brenn-Schaden"
	},
	dotPoisonB = {
		"dotPoisonB",
		"Giftschaden erhöht",
		"Erhöht den Schaden bei Vergiftung"
	},
	dotBloodB = {
		"dotBloodB",
		"Blutschaden erhöht",
		"Blutung erhöhen"
	},
	zs = {
		"zs",
		"Schad. an Kriegern",
		"Schad. an Kriegern"
	},
	fs = {
		"fs",
		"Schad. an Magiern",
		"Schad. an Magiern"
	},
	ms = {
		"ms",
		"Schad. an Priestern",
		"Schad. an Priestern"
	},
	ck = {
		"ck",
		"Schad. an Mördern",
		"Schad. an Mördern"
	},
	yx = {
		"yx",
		"Schad. an Rangern",
		"Schad. an Rangern"
	},
	changeCombat = {
		"changeCombat",
		"Standard Angriff ändern",
		"Normalen Angriff ändern"
	},
	fsStun = {
		"fsStun",
		"Betäubt Magier",
		"Betäubt Magier"
	},
	fsDotBlood = {
		"fsDotBlood",
		"Lässt Magier bluten",
		"Lässt Magier bluten"
	},
	zsIce = {
		"zsIce",
		"Friert Krieger ein",
		"Friert Krieger ein"
	},
	zsStun = {
		"zsStun",
		"Betäubt Krieger",
		"Betäubt Krieger"
	},
	zsForbid = {
		"zsForbid",
		"Bringt Krieger zu schweigen",
		"Bringt Krieger zu schweigen"
	},
	zsHurt = {
		"zsHurt",
		"Zusätzlicher Schaden an Kriegern",
		"Zusätzlicher Schaden an Kriegern"
	},
	zsArmP = {
		"zsArmP",
		"Reduziert die Rüstung der Krieger",
		"Reduziert die Rüstung der Krieger"
	},
	ckStone = {
		"ckStone",
		"Versteinert Mörder",
		"Versteinert Attentäter"
	},
	ckForbid = {
		"ckForbid",
		"Bringt die Mörder zum Schweigen",
		"Bringt die Attentäter zum Schweigen"
	},
	ckHurt = {
		"ckHurt",
		"Zusätzlicher Schaden an Mörder",
		"Zusätzlicher Schaden an Attentäter"
	},
	msForbid = {
		"msForbid",
		"Bringt die Priester zum Schweigen",
		"Bringt die Priester zum Schweigen"
	},
	yxHurt = {
		"yxHurt",
		"Extra Schaden an Ranger",
		"Extra Schaden an Ranger"
	},
	yxAtkP = {
		"yxAtkP",
		"Reduziert Rangers Angriff",
		"Reduziert den Angriff eines Rangers"
	},
	zsHpPO = {
		"zsHpPO",
		"HP erhöht",
		"HP erhöht"
	},
	zsAtkPO = {
		"zsAtkPO",
		"Angriff erhöht",
		"Krieger Angriff erhöhen"
	},
	zsCritO = {
		"zsCritO",
		"Krit. erhöht",
		"Erhöht den Krit. des Kriegers"
	},
	zsMissO = {
		"zsMissO",
		"Blockade erhöht",
		"Erhöht das Ausweichen des Kriegers"
	},
	zsSklPO = {
		"zsSklPO",
		"Skill-Schaden up",
		"Erhöht den Schaden der Kriegerfähigkeiten"
	},
	fsHpPO = {
		"fsHpPO",
		"HP erhöht",
		"Magier HP erhöhen"
	},
	fsAtkPO = {
		"fsAtkPO",
		"Angriff erhöht",
		"Magier Angriff erhöhen"
	},
	fsCritO = {
		"fsCritO",
		"Krit. erhöht",
		"Erhöht den Krit. der Magier"
	},
	fsHitO = {
		"fsHitO",
		"Präzision erhöht",
		"Erhöht Magier-Präzision"
	},
	fsSklPO = {
		"fsSklPO",
		"Skill-Schaden up",
		"Magier Fertigkeitsschaden erhöht"
	},
	ckHpPO = {
		"ckHpPO",
		"HP erhöht",
		"Mörder HP erhöht"
	},
	ckCritTimeO = {
		"ckCritTimeO",
		"Krit. Schaden erhöht",
		"Mörder Krit. erhöht"
	},
	ckCritO = {
		"ckCritO",
		"Krit. erhöht",
		"Mörder Krit. Schaden erhöht"
	},
	ckBrkO = {
		"ckBrkO",
		"Rüstungsbruch erhöht",
		"Mörder Rüstungsbruch erhöht"
	},
	ckSklPO = {
		"ckSklPO",
		"Skill-Schaden up",
		"Mörder Fertigkeitsschaden erhöht"
	},
	yxHpPO = {
		"yxHpPO",
		"HP erhöht",
		"Ranger HP erhöht"
	},
	yxAtkPO = {
		"yxAtkPO",
		"Angriff erhöht",
		"Ranger Angriff erhöht"
	},
	yxMissO = {
		"yxMissO",
		"Blockade erhöht",
		"Ranger Ausweichen erhöht"
	},
	yxHitO = {
		"yxHitO",
		"Präzision erhöht",
		"Erhöht Ranger-Präzision"
	},
	yxSklPO = {
		"yxSklPO",
		"Skill-Schaden up",
		"Ranger Fertigkeitsschaden erhöht"
	},
	msHpPO = {
		"msHpPO",
		"HP erhöht",
		"Priester HP erhöht"
	},
	msMissO = {
		"msMissO",
		"Blockade erhöht",
		"Priester Ausweichen erhöht"
	},
	msCritO = {
		"msCritO",
		"Krit. erhöht",
		"Priester Krit. erhöht"
	},
	msSpdO = {
		"msSpdO",
		"Speed erhöht",
		"Priester Geschwindigkeit erhöht"
	},
	msSklPO = {
		"msSklPO",
		"Skill-Schaden up",
		"Erhöht den Fähigkeitsschaden des Priesters"
	},
	ckStun = {
		"ckStun",
		"Betäubt Mörder",
		"Betäubt Mörder"
	},
	mhurt = {
		"mhurt",
		"Verursacht direkten Schaden",
		"Verursacht direkten Schaden"
	},
	mdotFire = {
		"mdotFire",
		"Fügt im Laufe der Zeit Schaden zu (Verbrennungen)",
		"Fügt im Laufe der Zeit Schaden zu (Verbrennungen)"
	},
	mdotPoison = {
		"mdotPoison",
		"Fügt im Laufe der Zeit Schaden zu (Vergiftung)",
		"Fügt im Laufe der Zeit Schaden zu (Vergiftung)"
	},
	mdotBlood = {
		"mdotBlood",
		"Fügt im Laufe der Zeit Schaden zu (Blutung)",
		"Fügt im Laufe der Zeit Schaden zu (Blutung)"
	},
	yxDotBlood = {
		"yxDotBlood",
		"Lässt Ranger bluten",
		"Ranger erleiden Blutschaden"
	},
	phurt = {
		"phurt",
		"Wenn der HP des Ziels niedriger ist, wird % direkter Schaden verursacht",
		"Wenn der HP des Ziels niedriger ist, wird % direkter Schaden verursacht"
	},
	addHurtd = {
		"addHurtd",
		"Fügt Zielen mit geringerer Selbstverteidigung einen zusätzlichen Angriff zu",
		"Fügt Zielen mit geringerer Selbstverteidigung einen zusätzlichen Angriff zu"
	},
	zsDotFire = {
		"zsDotFire",
		"Verbrennt Krieger",
		"Verbrennt Krieger"
	},
	yxStun = {
		"yxStun",
		"Betäubt Ranger",
		"Betäubt Ranger"
	},
	fsForbid = {
		"fsForbid",
		"Bringt Magier zum Schweigen",
		"Betäubt Magier"
	},
	ckDotPoison = {
		"ckDotPoison",
		"Vergiftet Mörder",
		"Vergiftet Mörder"
	},
	msStun = {
		"msStun",
		"Betäubt Priester",
		"Betäubt Priester"
	},
	msDotFire = {
		"msDotFire",
		"Verbrennt Priester",
		"Verbrennt Priester"
	},
	zsSpdO = {
		"zsSpdO",
		"Speed erhöht",
		"Erhöht die Geschwindigkeit der Krieger"
	},
	fsSpdO = {
		"fsSpdO",
		"Speed erhöht",
		"Geschwindigkeit der Magier erhöht"
	},
	ckSpdO = {
		"ckSpdO",
		"Speed erhöht",
		"Geschwindigkeit der Magier erhöht"
	},
	ckAtkPO = {
		"ckAtkPO",
		"Angriff erhöht",
		"Angriff der Mörder erhöht"
	},
	yxSpdO = {
		"yxSpdO",
		"Speed erhöht",
		"Geschwindigkeit der Ranger erhöht"
	},
	msAtkPO = {
		"msAtkPO",
		"Angriff erhöht",
		"Angriff der Priester erhöht"
	},
	iceless = {
		"iceless",
		"Immun gegen Einfrierung",
		"Immun gegen Einfrierung"
	},
	stoneless = {
		"stoneless",
		"Immun gegen Versteinerungen",
		"Immun gegen Versteinerungen"
	},
	stunless = {
		"stunless",
		"Immun gegen Betäubung",
		"Immun gegen Betäubung"
	},
	forbidless = {
		"forbidless",
		"Immun gegen Stilllegen",
		"Immun gegen Betäubung"
	},
	stunH = {
		"stunH",
		"生命不低于自己的目标眩晕",
		"生命不低于自己的目标眩晕"
	},
	hurtH = {
		"hurtH",
		"生命低于自己的目标额外伤害",
		"生命低于自己的目标额外伤害"
	},
	msHurt = {
		"msHurt",
		"Zusätzlicher Schaden gegen Priester",
		"Zusätzlicher Schaden gegen Priester"
	},
	forbidH = {
		"forbidH",
		"生命不高于自己的目标禁魔",
		"生命不高于自己的目标禁魔"
	},
	phurtH = {
		"phurtH",
		"生命高于自己的目标额外造成该目标生命上限x%的伤害",
		"生命高于自己的目标额外造成该目标生命上限x%的伤害"
	},
	rddot = {
		"rddot",
		"Zufälliger Schaden im laufe der Zeit (Vergiften, Verbrennen, Bluten)",
		"Zufälliger Schaden im laufe der Zeit (Vergiften, Verbrennen, Bluten)"
	},
	rdcontrol = {
		"rdcontrol",
		"Zufälliger Kontrolleffekt (Betäuben, Einfrieren, Versteinern)",
		"Zufälliger Kontrolleffekt (Betäuben, Einfrieren, Versteinern)"
	},
	hurtmaxM = {
		"hurtmaxM",
		"Fügt Ziel einen Schaden in Höhe der HPx% des Verbündeten mit der höchsten HP zu",
		"Fügt Ziel einen Schaden in Höhe der HPx% des Verbündeten mit der höchsten HP zu"
	},
	hurtmaxH = {
		"hurtmaxH",
		"Fügt Ziel einen Schaden dessen maximaler HPx% zu",
		"Fügt Ziel einen Schaden dessen maximaler HPx% zu"
	},
	healB = {
		"healB",
		"Erhaltene Heilung",
		"被治疗效果增强x%"
	},
	["被治疗效果增强x%"] = {
		"被治疗效果增强x%",
		"所有友军分担伤害",
		"所有友军分担伤害"
	},
	exhurt = {
		"exhurt",
		"额外进行一次普攻",
		"额外进行一次普攻"
	},
	hurtB = {
		"hurtB",
		"普攻伤害增加x%",
		"普攻伤害增加x%"
	},
	newRound = {
		"newRound",
		"击杀角色获得新回合",
		"击杀角色获得新回合"
	},
	overflow = {
		"overflow",
		"伤害平摊",
		"伤害平摊"
	},
	shield = {
		"shield",
		"抵挡护盾",
		"抵挡护盾"
	},
	buffExloded = {
		"buffExloded",
		"引爆buff",
		"引爆buff"
	},
	mindControl = {
		"mindControl",
		"Mind Control",
		"心灵控制"
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
		"Heilung",
		"造成治疗效果增强x%"
	},
	healPlose = {
		"healPlose",
		"恢复已损失生命%生命",
		"恢复已损失生命%生命"
	},
	rowFArmP = {
		"rowFArmP",
		"对前排护甲",
		"对前排护甲"
	},
	rowFStone = {
		"rowFStone",
		"对前排石化",
		"对前排石化"
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
		"hpPos-前排"
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
		"持续回血（每回合回血）"
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
		"Extra Kontrollrate",
		"Extra Kontrollrate"
	},
	incDmg = {
		"incDmg",
		"增伤率",
		"增伤率"
	},
	incDmgGroupCom = {
		"incDmgGroupCom",
		"Mehr Schaden gegen Geister/Menschen/Monster/Feen",
		"增伤率-四系"
	},
	incDmgGroupSpe = {
		"incDmgGroupSpe",
		"Mehr Schaden gegen Dämonen/Engel",
		"增伤率-光暗"
	},
	incDmgGroupChaos = {
		"incDmgGroupChaos",
		"Mehr Schaden gegen Chaos",
		"增伤率-混沌"
	},
	decDmgGroupCom = {
		"decDmgGroupCom",
		"Weniger Schaden aus Geister/Menschen/Monster/Feen",
		"减伤率-四系"
	},
	decDmgGroupSpe = {
		"decDmgGroupSpe",
		"Weniger Schaden aus Dämonen/Engel",
		"减伤率-光暗"
	},
	decDmgGroupChaos = {
		"decDmgGroupChaos",
		"Weniger Schaden aus Chaos",
		"减伤率-混沌"
	},
	incDmgSkl = {
		"incDmgSkl",
		"Mehr Skill-Schaden",
		"增伤率-技能"
	},
	decDmgSkl = {
		"decDmgSkl",
		"Weniger erlittener Schaden",
		"减伤率-技能"
	},
	incDmgNorAtk = {
		"incDmgNorAtk",
		"Mehr Standarfangriff-Schaden",
		"增伤率-普攻"
	},
	decDmgNorAtk = {
		"decDmgNorAtk",
		"Weniger erlittener Standardangriff-Schaden",
		"减伤率-普攻"
	},
	allHarmDec = {
		"allHarmDec",
		"Red. aller Schäden",
		"Schadensreduzierung aller Schäden (inkl. prozentualem Schaden)"
	},
	unCrit = {
		"unCrit",
		"Krit. Widerstand",
		"Krit. Widerstand"
	},
	resist_zs = {
		"resist_zs",
		"Red. Kriegerschad.",
		"Red. Kriegerschad."
	},
	resist_fs = {
		"resist_fs",
		"Red. Magierschad.",
		"Red. Magierschad."
	},
	resist_yx = {
		"resist_yx",
		"Red. Rangerschad",
		"Red. Rangerschad"
	},
	resist_ck = {
		"resist_ck",
		"Red. Mörderschad.",
		"Red. Mörderschad."
	},
	resist_ms = {
		"resist_ms",
		"Red. Priesterschad.",
		"Red. Priesterschad."
	},
	allDmgC = {
		"allDmgC",
		"Alle Schäden UP",
		"Alle Schäden UP"
	},
	allDmgRate = {
		"allDmgRate",
		"Alle Schäden UP",
		"Alle Schäden UP"
	}
}

return table
