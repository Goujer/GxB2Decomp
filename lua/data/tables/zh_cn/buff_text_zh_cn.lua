-- chunkname: @../../../Product/Bundles/Android/src/data/tables/zh_cn/buff_text_zh_cn.lua

local table = {}

table.keys = {
	desc1 = 3,
	name = 1,
	desc = 2
}
table.rows = {
	atk = {
		"atk",
		"攻击",
		"攻击"
	},
	hp = {
		"hp",
		"血量",
		"血量"
	},
	arm = {
		"arm",
		"护甲",
		"护甲"
	},
	spd = {
		"spd",
		"速度",
		"速度"
	},
	sklP = {
		"sklP",
		"增加技能伤害率",
		"增加技能伤害率"
	},
	hit = {
		"hit",
		"命中",
		"命中"
	},
	miss = {
		"miss",
		"闪避",
		"闪避"
	},
	crit = {
		"crit",
		"暴击",
		"暴击"
	},
	critTime = {
		"critTime",
		"暴击伤害值",
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
		"神圣伤害",
		"神圣伤害"
	},
	energy = {
		"energy",
		"能量",
		"能量"
	},
	decDmg = {
		"decDmg",
		"减伤率",
		"减伤率"
	},
	stun = {
		"stun",
		"眩晕",
		"眩晕（跳过出手）"
	},
	ice = {
		"ice",
		"冰冻",
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
		"禁魔（不能技能）"
	},
	hurt = {
		"hurt",
		"直接伤害",
		"直接伤害"
	},
	dot = {
		"dot",
		"持续伤害",
		"持续伤害（每回合掉血）"
	},
	heal = {
		"heal",
		"直接回血",
		"直接回血"
	},
	hot = {
		"hot",
		"持续回血",
		"持续回血（每回合回血）"
	},
	healP = {
		"healP",
		"恢复%血量",
		"恢复%血量"
	},
	trueHurt = {
		"trueHurt",
		"神圣伤害",
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
		"燃烧",
		"燃烧"
	},
	atkP = {
		"atkP",
		"攻击",
		"攻击（按%加攻击）"
	},
	hpP = {
		"hpP",
		"血量",
		"血量（按%加血量）"
	},
	armP = {
		"armP",
		"护甲",
		"护甲（按%加护甲）"
	},
	addhurt = {
		"addhurt",
		"追加一击",
		"追加一击"
	},
	revive = {
		"revive",
		"",
		"复活"
	},
	siphonAtk = {
		"siphonAtk",
		"",
		"百分比吸攻 "
	},
	siphonHp = {
		"siphonHp",
		"",
		"百分比吸血"
	},
	siphonArm = {
		"siphonArm",
		"",
		"百分比吸甲"
	},
	shield = {
		"shield",
		"",
		"抵消x%伤害"
	},
	brier = {
		"brier",
		"",
		"反伤x%伤害"
	},
	rImpress = {
		"rImpress",
		"",
		"回合印记"
	},
	cImpress = {
		"cImpress",
		"",
		"暴击印记"
	},
	rImpressB = {
		"rImpressB",
		"",
		"回合印记爆炸"
	},
	cImpressB = {
		"cImpressB",
		"",
		"暴击印记爆炸"
	},
	fImpress = {
		"fImpress",
		"",
		"闪电印记"
	},
	oImpress = {
		"oImpress",
		"",
		"观心者印记"
	},
	weak = {
		"weak",
		"",
		"虚弱"
	},
	atkPos = {
		"atkPos",
		"",
		"位置增加攻击率"
	},
	hpPos = {
		"hpPos",
		"",
		"位置增加血量率"
	},
	armPos = {
		"armPos",
		"",
		"位置增加护甲率"
	},
	spdPos = {
		"spdPos",
		"",
		"位置增加速度"
	},
	hitPos = {
		"hitPos",
		"",
		"位置增加命中"
	},
	missPos = {
		"missPos",
		"",
		"位置增加闪避"
	},
	critPos = {
		"critPos",
		"",
		"位置增加暴击"
	},
	critTimePos = {
		"critTimePos",
		"",
		"位置增加暴击伤害倍数"
	},
	stunB = {
		"stunB",
		"",
		"眩晕伤害加成"
	},
	iceB = {
		"iceB",
		"",
		"冰冻伤害加成"
	},
	stoneB = {
		"stoneB",
		"",
		"石化伤害加成"
	},
	dotFireB = {
		"dotFireB",
		"",
		"燃烧伤害加成"
	},
	dotPoisonB = {
		"dotPoisonB",
		"",
		"中毒伤害加成"
	},
	dotBloodB = {
		"dotBloodB",
		"",
		"流血伤害加成"
	},
	zs = {
		"zs",
		"对战士伤害加成",
		"对战士伤害加成"
	},
	fs = {
		"fs",
		"对法师伤害加成",
		"对法师伤害加成"
	},
	ms = {
		"ms",
		"对牧师伤害加成",
		"对牧师伤害加成"
	},
	ck = {
		"ck",
		"对刺客伤害加成",
		"对刺客伤害加成"
	},
	yx = {
		"yx",
		"对游侠伤害加成",
		"对游侠伤害加成"
	},
	changeCombat = {
		"changeCombat",
		"",
		"改变普通攻击"
	},
	fsStun = {
		"fsStun",
		"",
		"对法师眩晕"
	},
	fsDotBlood = {
		"fsDotBlood",
		"",
		"对法师流血伤害"
	},
	zsIce = {
		"zsIce",
		"",
		"对战士冰冻"
	},
	zsStun = {
		"zsStun",
		"",
		"对战士眩晕"
	},
	zsForbid = {
		"zsForbid",
		"",
		"对战士禁魔"
	},
	zsHurt = {
		"zsHurt",
		"",
		"对战士额外伤害"
	},
	zsArmP = {
		"zsArmP",
		"",
		"对战士护甲率降低"
	},
	ckStone = {
		"ckStone",
		"",
		"对刺客石化"
	},
	ckForbid = {
		"ckForbid",
		"",
		"对刺客禁魔"
	},
	ckHurt = {
		"ckHurt",
		"",
		"对刺客额外伤害"
	},
	msForbid = {
		"msForbid",
		"",
		"对牧师禁魔"
	},
	yxHurt = {
		"yxHurt",
		"",
		"对游侠额外伤害"
	},
	yxAtkP = {
		"yxAtkP",
		"",
		"对游侠攻击率降低"
	},
	zsHpPO = {
		"zsHpPO",
		"",
		"战士生命增加"
	},
	zsAtkPO = {
		"zsAtkPO",
		"",
		"战士攻击增加"
	},
	zsCritO = {
		"zsCritO",
		"",
		"战士暴击增加"
	},
	zsMissO = {
		"zsMissO",
		"",
		"战士闪避增加"
	},
	zsSklPO = {
		"zsSklPO",
		"",
		"战士技能伤害增加"
	},
	fsHpPO = {
		"fsHpPO",
		"",
		"法师生命增加"
	},
	fsAtkPO = {
		"fsAtkPO",
		"",
		"法师攻击增加"
	},
	fsCritO = {
		"fsCritO",
		"",
		"法师暴击增加"
	},
	fsHitO = {
		"fsHitO",
		"",
		"法师命中增加"
	},
	fsSklPO = {
		"fsSklPO",
		"",
		"法师技能伤害增加"
	},
	ckHpPO = {
		"ckHpPO",
		"",
		"刺客生命增加"
	},
	ckCritTimeO = {
		"ckCritTimeO",
		"",
		"刺客暴击伤害增加"
	},
	ckCritO = {
		"ckCritO",
		"",
		"刺客暴击增加"
	},
	ckBrkO = {
		"ckBrkO",
		"",
		"刺客破甲增加"
	},
	ckSklPO = {
		"ckSklPO",
		"",
		"刺客技能伤害增加"
	},
	yxHpPO = {
		"yxHpPO",
		"",
		"游侠生命增加"
	},
	yxAtkPO = {
		"yxAtkPO",
		"",
		"游侠攻击增加"
	},
	yxMissO = {
		"yxMissO",
		"",
		"游侠闪避增加"
	},
	yxHitO = {
		"yxHitO",
		"",
		"游侠命中增加"
	},
	yxSklPO = {
		"yxSklPO",
		"",
		"游侠技能伤害增加"
	},
	msHpPO = {
		"msHpPO",
		"",
		"牧师生命增加"
	},
	msMissO = {
		"msMissO",
		"",
		"牧师闪避增加"
	},
	msCritO = {
		"msCritO",
		"",
		"牧师暴击增加"
	},
	msSpdO = {
		"msSpdO",
		"",
		"牧师速度增加"
	},
	msSklPO = {
		"msSklPO",
		"",
		"牧师技能伤害增加"
	},
	ckStun = {
		"ckStun",
		"",
		"对刺客眩晕"
	},
	mhurt = {
		"mhurt",
		"",
		"直接造成伤害（具体值） 魔兽主动技能配置"
	},
	mdotFire = {
		"mdotFire",
		"",
		"持续造成伤害（火具体值） 魔兽主动技能配置"
	},
	mdotPoison = {
		"mdotPoison",
		"",
		"持续造成伤害（毒具体值） 魔兽主动技能配置"
	},
	mdotBlood = {
		"mdotBlood",
		"",
		"持续造成伤害（流血具体值） 魔兽主动技能配置"
	},
	yxDotBlood = {
		"yxDotBlood",
		"",
		"对游侠流血伤害"
	},
	phurt = {
		"phurt",
		"",
		"小于自身生命直接造成生命%的伤害（百分比） 主动技能配置"
	},
	addHurtd = {
		"addHurtd",
		"",
		"对小于自己防御的英雄追加一击"
	},
	zsDotFire = {
		"zsDotFire",
		"",
		"对战士燃烧伤害"
	},
	yxStun = {
		"yxStun",
		"",
		"对游侠眩晕"
	},
	fsForbid = {
		"fsForbid",
		"",
		"对法师禁魔"
	},
	ckDotPoison = {
		"ckDotPoison",
		"",
		"对刺客中毒伤害"
	},
	msStun = {
		"msStun",
		"",
		"对牧师眩晕"
	},
	msDotFire = {
		"msDotFire",
		"",
		"对牧师燃烧伤害"
	},
	zsSpdO = {
		"zsSpdO",
		"",
		"战士速度增加"
	},
	fsSpdO = {
		"fsSpdO",
		"",
		"法师速度增加"
	},
	ckSpdO = {
		"ckSpdO",
		"",
		"刺客速度增加"
	},
	ckAtkPO = {
		"ckAtkPO",
		"",
		"刺客攻击增加"
	},
	yxSpdO = {
		"yxSpdO",
		"",
		"游侠速度增加"
	},
	msAtkPO = {
		"msAtkPO",
		"",
		"牧师攻击增加"
	},
	iceless = {
		"iceless",
		"",
		"免疫冰冻"
	},
	stoneless = {
		"stoneless",
		"",
		"免疫石化"
	},
	stunless = {
		"stunless",
		"",
		"免疫眩晕"
	},
	forbidless = {
		"forbidless",
		"",
		"免疫禁魔"
	},
	stunH = {
		"stunH",
		"",
		"血量不低于自己的目标眩晕"
	},
	hurtH = {
		"hurtH",
		"",
		"血量低于自己的目标额外伤害"
	},
	msHurt = {
		"msHurt",
		"",
		"对牧师额外伤害"
	},
	forbidH = {
		"forbidH",
		"",
		"血量不高于自己的目标禁魔"
	},
	phurtH = {
		"phurtH",
		"",
		"血量高于自己的目标额外造成该目标生命上限x%的伤害"
	}
}

return table
