-- chunkname: @../../../Product/Bundles/Android/src/data/tables/zh_tw/buff_text_zh_tw.lua

local table = {}

table.keys = {
	desc1 = 3,
	name = 1,
	desc = 2
}
table.rows = {
	atk = {
		"atk",
		"攻擊",
		"攻击"
	},
	hp = {
		"hp",
		"生命",
		"生命上限百分比燃烧伤害"
	},
	arm = {
		"arm",
		"護甲",
		"护甲"
	},
	spd = {
		"spd",
		"速度",
		"速度"
	},
	sklP = {
		"sklP",
		"技能傷害率",
		"技能伤害率"
	},
	hit = {
		"hit",
		"精準",
		"精準"
	},
	miss = {
		"miss",
		"格擋",
		"闪避"
	},
	crit = {
		"crit",
		"暴擊",
		"暴击"
	},
	critTime = {
		"critTime",
		"暴擊傷害",
		"暴击伤害值"
	},
	brk = {
		"brk",
		"破甲",
		"破甲"
	},
	free = {
		"free",
		"免控率",
		"免控率"
	},
	trueAtk = {
		"trueAtk",
		"神聖傷害",
		"神圣伤害"
	},
	energy = {
		"energy",
		"能量",
		"能量"
	},
	decDmg = {
		"decDmg",
		"減傷率",
		"减伤率"
	},
	stun = {
		"stun",
		"眩暈",
		"眩晕（跳过出手）"
	},
	ice = {
		"ice",
		"冰凍",
		"冰冻（跳过出手）"
	},
	stone = {
		"stone",
		"石化",
		"石化（跳过出手）"
	},
	forbid = {
		"forbid",
		"禁魔",
		"禁魔（無法使用技能）"
	},
	hurt = {
		"hurt",
		"直接傷害",
		"直接伤害"
	},
	dot = {
		"dot",
		"持續傷害",
		"持续伤害（每回合掉血）"
	},
	heal = {
		"heal",
		"直接回血",
		"直接回血"
	},
	hot = {
		"hot",
		"持續回血",
		"持续回血（每回合回血）"
	},
	healP = {
		"healP",
		"恢復%生命",
		"恢复%生命"
	},
	trueHurt = {
		"trueHurt",
		"神聖傷害",
		"神圣伤害"
	},
	dotPoison = {
		"dotPoison",
		"中毒",
		"中毒"
	},
	dotBlood = {
		"dotBlood",
		"流血",
		"流血"
	},
	dotFire = {
		"dotFire",
		"燃燒",
		"燃烧"
	},
	atkP = {
		"atkP",
		"攻擊",
		"攻击（按%加攻击）"
	},
	hpP = {
		"hpP",
		"生命",
		"生命（按%加生命）"
	},
	armP = {
		"armP",
		"護甲",
		"护甲（按%加护甲）"
	},
	addhurt = {
		"addhurt",
		"追加一擊",
		"追加一击"
	},
	revive = {
		"revive",
		"复活",
		"复活"
	},
	siphonAtk = {
		"siphonAtk",
		"百分比吸攻 ",
		"百分比吸攻 "
	},
	siphonHp = {
		"siphonHp",
		"百分比吸血",
		"百分比吸血"
	},
	siphonArm = {
		"siphonArm",
		"百分比吸甲",
		"百分比吸甲"
	},
	shield = {
		"shield",
		"抵消x%伤害",
		"抵消x%伤害"
	},
	brier = {
		"brier",
		"反伤x%伤害",
		"反伤x%伤害"
	},
	rImpress = {
		"rImpress",
		"回合印记",
		"回合印记"
	},
	cImpress = {
		"cImpress",
		"暴击印记",
		"暴击印记"
	},
	rImpressB = {
		"rImpressB",
		"回合印记爆炸",
		"回合印记爆炸"
	},
	cImpressB = {
		"cImpressB",
		"暴击印记爆炸",
		"暴击印记爆炸"
	},
	fImpress = {
		"fImpress",
		"闪电印记",
		"闪电印记"
	},
	oImpress = {
		"oImpress",
		"观心者印记",
		"观心者印记"
	},
	weak = {
		"weak",
		"虚弱",
		"虚弱"
	},
	atkPos = {
		"atkPos",
		"位置增加攻击率",
		"位置增加攻击率"
	},
	hpPos = {
		"hpPos",
		"位置增加生命率",
		"位置增加生命率"
	},
	armPos = {
		"armPos",
		"位置增加护甲率",
		"位置增加护甲率"
	},
	spdPos = {
		"spdPos",
		"位置增加速度",
		"位置增加速度"
	},
	hitPos = {
		"hitPos",
		"位置增加精準",
		"位置增加精準"
	},
	missPos = {
		"missPos",
		"位置增加闪避",
		"位置增加闪避"
	},
	critPos = {
		"critPos",
		"位置增加暴击",
		"位置增加暴击"
	},
	critTimePos = {
		"critTimePos",
		"位置增加暴击伤害倍数",
		"位置增加暴击伤害倍数"
	},
	stunB = {
		"stunB",
		"眩晕伤害加成",
		"眩晕伤害加成"
	},
	iceB = {
		"iceB",
		"冰冻伤害加成",
		"冰冻伤害加成"
	},
	stoneB = {
		"stoneB",
		"石化伤害加成",
		"石化伤害加成"
	},
	dotFireB = {
		"dotFireB",
		"燃烧伤害加成",
		"燃烧伤害加成"
	},
	dotPoisonB = {
		"dotPoisonB",
		"中毒伤害加成",
		"中毒伤害加成"
	},
	dotBloodB = {
		"dotBloodB",
		"流血伤害加成",
		"流血伤害加成"
	},
	zs = {
		"zs",
		"對戰士傷害加成",
		"对战士伤害加成"
	},
	fs = {
		"fs",
		"對法師傷害加成",
		"对法师伤害加成"
	},
	ms = {
		"ms",
		"對牧師傷害加成",
		"对牧师伤害加成"
	},
	ck = {
		"ck",
		"對刺客傷害加成",
		"对刺客伤害加成"
	},
	yx = {
		"yx",
		"對遊俠傷害加成",
		"对游侠伤害加成"
	},
	changeCombat = {
		"changeCombat",
		"改变普通攻击",
		"改变普通攻击"
	},
	fsStun = {
		"fsStun",
		"对法师眩晕",
		"对法师眩晕"
	},
	fsDotBlood = {
		"fsDotBlood",
		"对法师流血伤害",
		"对法师流血伤害"
	},
	zsIce = {
		"zsIce",
		"对战士冰冻",
		"对战士冰冻"
	},
	zsStun = {
		"zsStun",
		"对战士眩晕",
		"对战士眩晕"
	},
	zsForbid = {
		"zsForbid",
		"对战士禁魔",
		"对战士禁魔"
	},
	zsHurt = {
		"zsHurt",
		"对战士额外伤害",
		"对战士额外伤害"
	},
	zsArmP = {
		"zsArmP",
		"对战士护甲率降低",
		"对战士护甲率降低"
	},
	ckStone = {
		"ckStone",
		"对刺客石化",
		"对刺客石化"
	},
	ckForbid = {
		"ckForbid",
		"对刺客禁魔",
		"对刺客禁魔"
	},
	ckHurt = {
		"ckHurt",
		"对刺客额外伤害",
		"对刺客额外伤害"
	},
	msForbid = {
		"msForbid",
		"对牧师禁魔",
		"对牧师禁魔"
	},
	yxHurt = {
		"yxHurt",
		"对游侠额外伤害",
		"对游侠额外伤害"
	},
	yxAtkP = {
		"yxAtkP",
		"对游侠攻击率降低",
		"对游侠攻击率降低"
	},
	zsHpPO = {
		"zsHpPO",
		"戰士生命增加",
		"战士生命增加"
	},
	zsAtkPO = {
		"zsAtkPO",
		"戰士攻擊增加",
		"战士攻击增加"
	},
	zsCritO = {
		"zsCritO",
		"戰士暴擊增加",
		"战士暴击增加"
	},
	zsMissO = {
		"zsMissO",
		"戰士格擋增加",
		"战士闪避增加"
	},
	zsSklPO = {
		"zsSklPO",
		"戰士技能傷害增加",
		"战士技能伤害增加"
	},
	fsHpPO = {
		"fsHpPO",
		"法師生命增加",
		"法师生命增加"
	},
	fsAtkPO = {
		"fsAtkPO",
		"法師攻擊增加",
		"法师攻击增加"
	},
	fsCritO = {
		"fsCritO",
		"法師暴擊增加",
		"法师暴击增加"
	},
	fsHitO = {
		"fsHitO",
		"法師精準增加",
		"法师精準增加"
	},
	fsSklPO = {
		"fsSklPO",
		"法師技能傷害增加",
		"法师技能伤害增加"
	},
	ckHpPO = {
		"ckHpPO",
		"刺客生命增加",
		"刺客生命增加"
	},
	ckCritTimeO = {
		"ckCritTimeO",
		"刺客暴擊傷害增加",
		"刺客暴击伤害增加"
	},
	ckCritO = {
		"ckCritO",
		"刺客暴擊增加",
		"刺客暴击增加"
	},
	ckBrkO = {
		"ckBrkO",
		"刺客破甲增加",
		"刺客破甲增加"
	},
	ckSklPO = {
		"ckSklPO",
		"刺客技能傷害增加",
		"刺客技能伤害增加"
	},
	yxHpPO = {
		"yxHpPO",
		"遊俠生命增加",
		"游侠生命增加"
	},
	yxAtkPO = {
		"yxAtkPO",
		"遊俠攻擊增加",
		"游侠攻击增加"
	},
	yxMissO = {
		"yxMissO",
		"遊俠格擋增加",
		"游侠闪避增加"
	},
	yxHitO = {
		"yxHitO",
		"遊俠精準增加",
		"游侠精準增加"
	},
	yxSklPO = {
		"yxSklPO",
		"遊俠技能傷害增加",
		"游侠技能伤害增加"
	},
	msHpPO = {
		"msHpPO",
		"牧師生命增加",
		"牧师生命增加"
	},
	msMissO = {
		"msMissO",
		"牧師格擋增加",
		"牧师闪避增加"
	},
	msCritO = {
		"msCritO",
		"牧師暴擊增加",
		"牧师暴击增加"
	},
	msSpdO = {
		"msSpdO",
		"牧師速度增加",
		"牧师速度增加"
	},
	msSklPO = {
		"msSklPO",
		"牧師技能傷害增加",
		"牧师技能伤害增加"
	},
	ckStun = {
		"ckStun",
		"對刺客眩暈",
		"对刺客眩晕"
	},
	mhurt = {
		"mhurt",
		"直接造成伤害（具体值） 魔兽主动技能配置",
		"直接造成伤害（具体值） 魔兽主动技能配置"
	},
	mdotFire = {
		"mdotFire",
		"持续造成伤害（火具体值） 魔兽主动技能配置",
		"持续造成伤害（火具体值） 魔兽主动技能配置"
	},
	mdotPoison = {
		"mdotPoison",
		"持续造成伤害（毒具体值） 魔兽主动技能配置",
		"持续造成伤害（毒具体值） 魔兽主动技能配置"
	},
	mdotBlood = {
		"mdotBlood",
		"持续造成伤害（流血具体值） 魔兽主动技能配置",
		"持续造成伤害（流血具体值） 魔兽主动技能配置"
	},
	yxDotBlood = {
		"yxDotBlood",
		"对游侠流血伤害",
		"对游侠流血伤害"
	},
	phurt = {
		"phurt",
		"小于自身生命直接造成生命%的伤害（百分比） 主动技能配置",
		"小于自身生命直接造成生命%的伤害（百分比） 主动技能配置"
	},
	addHurtd = {
		"addHurtd",
		"对小于自己防御的英雄追加一击",
		"对小于自己防御的英雄追加一击"
	},
	zsDotFire = {
		"zsDotFire",
		"对战士燃烧伤害",
		"对战士燃烧伤害"
	},
	yxStun = {
		"yxStun",
		"对游侠眩晕",
		"对游侠眩晕"
	},
	fsForbid = {
		"fsForbid",
		"对法师禁魔",
		"对法师禁魔"
	},
	ckDotPoison = {
		"ckDotPoison",
		"对刺客中毒伤害",
		"对刺客中毒伤害"
	},
	msStun = {
		"msStun",
		"对牧师眩晕",
		"对牧师眩晕"
	},
	msDotFire = {
		"msDotFire",
		"对牧师燃烧伤害",
		"对牧师燃烧伤害"
	},
	zsSpdO = {
		"zsSpdO",
		"戰士速度增加",
		"战士速度增加"
	},
	fsSpdO = {
		"fsSpdO",
		"法師速度增加",
		"法师速度增加"
	},
	ckSpdO = {
		"ckSpdO",
		"刺客速度增加",
		"刺客速度增加"
	},
	ckAtkPO = {
		"ckAtkPO",
		"刺客攻擊增加",
		"刺客攻击增加"
	},
	yxSpdO = {
		"yxSpdO",
		"遊俠速度增加",
		"游侠速度增加"
	},
	msAtkPO = {
		"msAtkPO",
		"牧師攻擊增加",
		"牧师攻击增加"
	},
	iceless = {
		"iceless",
		"免疫冰冻",
		"免疫冰冻"
	},
	stoneless = {
		"stoneless",
		"免疫石化",
		"免疫石化"
	},
	stunless = {
		"stunless",
		"免疫眩晕",
		"免疫眩晕"
	},
	forbidless = {
		"forbidless",
		"免疫禁魔",
		"免疫禁魔"
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
		"对牧师额外伤害",
		"对牧师额外伤害"
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
		"随机一种持续伤害（中毒、燃烧、流血）",
		"随机一种持续伤害（中毒、燃烧、流血）"
	},
	rdcontrol = {
		"rdcontrol",
		"随机一种控制效果（眩晕、冰冻、石化）",
		"随机一种控制效果（眩晕、冰冻、石化）"
	},
	hurtmaxM = {
		"hurtmaxM",
		"对目标造成己方最高生命上限x%的伤害",
		"对目标造成己方最高生命上限x%的伤害"
	},
	hurtmaxH = {
		"hurtmaxH",
		"对目标造成其生命上限x%的伤害",
		"对目标造成其生命上限x%的伤害"
	},
	healB = {
		"healB",
		"被治療量",
		"被治疗效果增强x%"
	},
	hurtshare = {
		"hurtshare",
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
		"心灵控制",
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
		"治療量",
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
		"增控率",
		"增控率"
	},
	incDmg = {
		"incDmg",
		"增伤率",
		"增伤率"
	},
	incDmgGroupCom = {
		"incDmgGroupCom",
		"對隱蹤/神威/風間/曇華陣營戰姬傷害增加",
		"增伤率-四系"
	},
	incDmgGroupSpe = {
		"incDmgGroupSpe",
		"對修羅/星辰陣營戰姬傷害增加",
		"增伤率-光暗"
	},
	incDmgGroupChaos = {
		"incDmgGroupChaos",
		"對混沌系魔物傷害增加",
		"增伤率-混沌"
	},
	decDmgGroupCom = {
		"decDmgGroupCom",
		"受到隱蹤/神威/風間/曇華陣營戰姬傷害減少",
		"减伤率-四系"
	},
	decDmgGroupSpe = {
		"decDmgGroupSpe",
		"受到修羅/星辰陣營戰姬傷害減少",
		"减伤率-光暗"
	},
	decDmgGroupChaos = {
		"decDmgGroupChaos",
		"受到混沌系魔物傷害減少",
		"减伤率-混沌"
	},
	incDmgSkl = {
		"incDmgSkl",
		"戰姬技能傷害增加",
		"增伤率-技能"
	},
	decDmgSkl = {
		"decDmgSkl",
		"戰姬受到技能傷害減少",
		"减伤率-技能"
	},
	incDmgNorAtk = {
		"incDmgNorAtk",
		"戰姬普攻傷害增加",
		"增伤率-普攻"
	},
	decDmgNorAtk = {
		"decDmgNorAtk",
		"戰姬受到普攻傷害減少",
		"减伤率-普攻"
	},
	allHarmDec = {
		"allHarmDec",
		"全傷害減免",
		"全傷害減免（包括百分比伤害）"
	},
	unCrit = {
		"unCrit",
		"暴擊抵抗",
		"暴擊抵抗"
	},
	resist_zs = {
		"resist_zs",
		"受到戰士傷害減少",
		"受到戰士傷害減少"
	},
	resist_fs = {
		"resist_fs",
		"受到法師傷害減少",
		"受到法師傷害減少"
	},
	resist_yx = {
		"resist_yx",
		"受到游俠傷害減少",
		"受到游俠傷害減少"
	},
	resist_ck = {
		"resist_ck",
		"受到刺客傷害減少",
		"受到刺客傷害減少"
	},
	resist_ms = {
		"resist_ms",
		"受到牧師傷害減少",
		"受到牧師傷害減少"
	},
	allDmgC = {
		"allDmgC",
		"全傷害增加",
		"全傷害增加"
	},
	allDmgRate = {
		"allDmgRate",
		"全傷害增加",
		"全傷害增加"
	}
}

return table
