-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ja_jp/buff_text_ja_jp.lua

local table = {}

table.keys = {
	desc1 = 3,
	name = 1,
	desc = 2
}
table.rows = {
	atk = {
		"atk",
		"攻撃",
		"攻撃"
	},
	hp = {
		"hp",
		"HP",
		"生命上限百分比燃烧伤害"
	},
	arm = {
		"arm",
		"防御力",
		"防御力"
	},
	spd = {
		"spd",
		"速度",
		"速度"
	},
	sklP = {
		"sklP",
		"スキダメ",
		"スキダメ"
	},
	hit = {
		"hit",
		"ブレイク",
		"ブレイク"
	},
	miss = {
		"miss",
		"ブロック",
		"回避"
	},
	crit = {
		"crit",
		"会心率",
		"会心率"
	},
	critTime = {
		"critTime",
		"会心ダメージ",
		"暴击伤害值"
	},
	brk = {
		"brk",
		"突破力",
		"突破力"
	},
	free = {
		"free",
		"拘束耐性",
		"拘束耐性"
	},
	trueAtk = {
		"trueAtk",
		"防御貫通",
		"防御貫通"
	},
	energy = {
		"energy",
		"エネルギー",
		"エネルギー"
	},
	decDmg = {
		"decDmg",
		"ダメージ軽減",
		"ダメージ軽減"
	},
	stun = {
		"stun",
		"気絶",
		"気絶（攻撃スキップ）"
	},
	ice = {
		"ice",
		"凍結",
		"凍結（攻撃スキップ）"
	},
	stone = {
		"stone",
		"石化",
		"石化（攻撃スキップ）"
	},
	forbid = {
		"forbid",
		"沈黙",
		"沈黙（スキル使用不能）"
	},
	hurt = {
		"hurt",
		"直接ダメージ",
		"直接ダメージ"
	},
	dot = {
		"dot",
		"継続ダメージ",
		"持続ダメージ（ターンごとにHP減少）"
	},
	heal = {
		"heal",
		"直接回復",
		"直接回復"
	},
	hot = {
		"hot",
		"持続回復",
		"持続回復（ターンごとにHP回復）"
	},
	healP = {
		"healP",
		"恢復%生命",
		"恢复%生命"
	},
	trueHurt = {
		"trueHurt",
		"防御貫通",
		"防御貫通"
	},
	dotPoison = {
		"dotPoison",
		"毒",
		"毒"
	},
	dotBlood = {
		"dotBlood",
		"流血",
		"流血"
	},
	dotFire = {
		"dotFire",
		"燃焼",
		"燃焼"
	},
	atkP = {
		"atkP",
		"攻撃",
		"攻撃（割合に応じて攻撃アップ）"
	},
	hpP = {
		"hpP",
		"HP",
		"生命（按%加生命）"
	},
	armP = {
		"armP",
		"防御力",
		"防御力（割合に応じて防御アップ）"
	},
	addhurt = {
		"addhurt",
		"追撃",
		"追撃"
	},
	revive = {
		"revive",
		"復活",
		"復活"
	},
	siphonAtk = {
		"siphonAtk",
		"割合で攻撃吸収 ",
		"割合で攻撃吸収 "
	},
	siphonHp = {
		"siphonHp",
		"割合でHP吸収",
		"割合でHP吸収"
	},
	siphonArm = {
		"siphonArm",
		"割合で防御力吸収",
		"割合で防御力吸収"
	},
	shield = {
		"shield",
		"x%ダメージ軽減",
		"x%ダメージ軽減"
	},
	brier = {
		"brier",
		"x%カウンターダメージ",
		"x%カウンターダメージ"
	},
	rImpress = {
		"rImpress",
		"ターンの印",
		"ターンの印"
	},
	cImpress = {
		"cImpress",
		"会心の印",
		"会心の印"
	},
	rImpressB = {
		"rImpressB",
		"ターンの印爆発",
		"ターンの印爆発"
	},
	cImpressB = {
		"cImpressB",
		"会心の印爆発",
		"会心の印爆発"
	},
	fImpress = {
		"fImpress",
		"サンダーの印",
		"サンダーの印"
	},
	oImpress = {
		"oImpress",
		"観心者の印",
		"観心者の印"
	},
	weak = {
		"weak",
		"衰弱",
		"衰弱"
	},
	atkPos = {
		"atkPos",
		"位置による攻撃UP",
		"位置による攻撃UP"
	},
	hpPos = {
		"hpPos",
		"位置增加生命率",
		"位置增加生命率"
	},
	armPos = {
		"armPos",
		"位置による防御力UP",
		"位置による防御力UP"
	},
	spdPos = {
		"spdPos",
		"位置による速度UP",
		"位置による速度UP"
	},
	hitPos = {
		"hitPos",
		"位置增加精準",
		"位置增加精準"
	},
	missPos = {
		"missPos",
		"位置による回避UP",
		"位置による回避UP"
	},
	critPos = {
		"critPos",
		"位置による会心率UP",
		"位置による会心率UP"
	},
	critTimePos = {
		"critTimePos",
		"位置による会心ダメージの倍率UP",
		"位置による会心ダメージの倍率UP"
	},
	stunB = {
		"stunB",
		"気絶ダメージUP",
		"気絶ダメージUP"
	},
	iceB = {
		"iceB",
		"凍結ダメージUP",
		"凍結ダメージUP"
	},
	stoneB = {
		"stoneB",
		"石化ダメージUP",
		"石化ダメージUP"
	},
	dotFireB = {
		"dotFireB",
		"燃焼ダメージUP",
		"燃焼ダメージUP"
	},
	dotPoisonB = {
		"dotPoisonB",
		"毒ダメージUP",
		"毒ダメージUP"
	},
	dotBloodB = {
		"dotBloodB",
		"流血ダメージUP",
		"流血ダメージUP"
	},
	zs = {
		"zs",
		"対ウォーリアダメージUP",
		"対ウォーリアダメージUP"
	},
	fs = {
		"fs",
		"対ソーサラーダメージUP",
		"対ソーサラーダメージUP"
	},
	ms = {
		"ms",
		"対プリーストダメージUP",
		"対プリーストダメージUP"
	},
	ck = {
		"ck",
		"対アサシンダメージUP",
		"対アサシンダメージUP"
	},
	yx = {
		"yx",
		"対レンジャーダメージUP",
		"対レンジャーダメージUP"
	},
	changeCombat = {
		"changeCombat",
		"通常攻撃変更",
		"通常攻撃変更"
	},
	fsStun = {
		"fsStun",
		"対ソーサラー気絶",
		"対ソーサラー気絶"
	},
	fsDotBlood = {
		"fsDotBlood",
		"対ソーサラー流血ダメージ",
		"対ソーサラー流血ダメージ"
	},
	zsIce = {
		"zsIce",
		"対ウォーリア凍結",
		"対ウォーリア凍結"
	},
	zsStun = {
		"zsStun",
		"対ウォーリア気絶",
		"対ウォーリア気絶"
	},
	zsForbid = {
		"zsForbid",
		"対ウォーリア沈黙",
		"対ウォーリア沈黙"
	},
	zsHurt = {
		"zsHurt",
		"対ウォーリア追撃",
		"対ウォーリア追撃"
	},
	zsArmP = {
		"zsArmP",
		"対ウォーリア防御力減少",
		"対ウォーリア防御力減少"
	},
	ckStone = {
		"ckStone",
		"対アサシン石化",
		"対アサシン石化"
	},
	ckForbid = {
		"ckForbid",
		"対アサシン沈黙",
		"対アサシン沈黙"
	},
	ckHurt = {
		"ckHurt",
		"対アサシン追撃",
		"対アサシン追撃"
	},
	msForbid = {
		"msForbid",
		"対プリースト沈黙",
		"対プリースト沈黙"
	},
	yxHurt = {
		"yxHurt",
		"対レンジャー追撃",
		"対レンジャー追撃"
	},
	yxAtkP = {
		"yxAtkP",
		"対レンジャー攻撃減少",
		"対レンジャー攻撃減少"
	},
	zsHpPO = {
		"zsHpPO",
		"HPUP",
		"HPUP"
	},
	zsAtkPO = {
		"zsAtkPO",
		"攻撃UP",
		"攻撃UP"
	},
	zsCritO = {
		"zsCritO",
		"会心率UP",
		"会心率UP"
	},
	zsMissO = {
		"zsMissO",
		"ブロックUP",
		"回避UP"
	},
	zsSklPO = {
		"zsSklPO",
		"スキルダメージUP",
		"スキルダメージUP"
	},
	fsHpPO = {
		"fsHpPO",
		"HPUP",
		"HPUP"
	},
	fsAtkPO = {
		"fsAtkPO",
		"攻撃UP",
		"攻撃UP"
	},
	fsCritO = {
		"fsCritO",
		"会心率UP",
		"会心率UP"
	},
	fsHitO = {
		"fsHitO",
		"ブレイク強化",
		"ブレイク強化"
	},
	fsSklPO = {
		"fsSklPO",
		"スキルダメージUP",
		"スキルダメージUP"
	},
	ckHpPO = {
		"ckHpPO",
		"HPUP",
		"HPUP"
	},
	ckCritTimeO = {
		"ckCritTimeO",
		"会心ダメージUP",
		"会心ダメージUP"
	},
	ckCritO = {
		"ckCritO",
		"会心率UP",
		"会心率UP"
	},
	ckBrkO = {
		"ckBrkO",
		"突破力UP",
		"突破力UP"
	},
	ckSklPO = {
		"ckSklPO",
		"スキルダメージUP",
		"スキルダメージUP"
	},
	yxHpPO = {
		"yxHpPO",
		"HPUP",
		"HPUP"
	},
	yxAtkPO = {
		"yxAtkPO",
		"攻撃UP",
		"攻撃UP"
	},
	yxMissO = {
		"yxMissO",
		"ブロックUP",
		"回避UP"
	},
	yxHitO = {
		"yxHitO",
		"ブレイク強化",
		"ブレイク強化"
	},
	yxSklPO = {
		"yxSklPO",
		"スキルダメージUP",
		"スキルダメージUP"
	},
	msHpPO = {
		"msHpPO",
		"HPUP",
		"HPUP"
	},
	msMissO = {
		"msMissO",
		"ブロックUP",
		"回避UP"
	},
	msCritO = {
		"msCritO",
		"会心率UP",
		"会心率UP"
	},
	msSpdO = {
		"msSpdO",
		"速度UP",
		"速度UP"
	},
	msSklPO = {
		"msSklPO",
		"スキルダメージUP",
		"スキルダメージUP"
	},
	ckStun = {
		"ckStun",
		"対アサシン気絶",
		"対アサシン気絶"
	},
	mhurt = {
		"mhurt",
		"直接与えるダメージ（具体値）　ビーストのアクティブスキル設定",
		"直接与えるダメージ（具体値）　ビーストのアクティブスキル設定"
	},
	mdotFire = {
		"mdotFire",
		"持続的に与えるダメージ（火具体値）　ビーストのアクティブスキル設定",
		"持続的に与えるダメージ（火具体値）　ビーストのアクティブスキル設定"
	},
	mdotPoison = {
		"mdotPoison",
		"持続的に与えるダメージ（毒具体値）　ビーストのアクティブスキル設定",
		"持続的に与えるダメージ（毒具体値）　ビーストのアクティブスキル設定"
	},
	mdotBlood = {
		"mdotBlood",
		"持続的に与えるダメージ（流血具体値）　ビーストのアクティブスキル設定",
		"持続的に与えるダメージ（流血具体値）　ビーストのアクティブスキル設定"
	},
	yxDotBlood = {
		"yxDotBlood",
		"対レンジャー流血ダメージ",
		"対レンジャー流血ダメージ"
	},
	phurt = {
		"phurt",
		"自分のHPを超えない範囲で、直接HPの一定割合（%）のダメージを与える　アクティブスキル設定",
		"自分のHPを超えない範囲で、直接HPの一定割合（%）のダメージを与える　アクティブスキル設定"
	},
	addHurtd = {
		"addHurtd",
		"自分より防御力が低い敵に追加攻撃",
		"自分より防御力が低い敵に追加攻撃"
	},
	zsDotFire = {
		"zsDotFire",
		"対ウォーリア燃焼ダメージ",
		"対ウォーリア燃焼ダメージ"
	},
	yxStun = {
		"yxStun",
		"対レンジャー気絶",
		"対レンジャー気絶"
	},
	fsForbid = {
		"fsForbid",
		"対ソーサラー沈黙",
		"対ソーサラー沈黙"
	},
	ckDotPoison = {
		"ckDotPoison",
		"対アサシン毒ダメージ",
		"対アサシン毒ダメージ"
	},
	msStun = {
		"msStun",
		"対プリースト気絶",
		"対プリースト気絶"
	},
	msDotFire = {
		"msDotFire",
		"対プリースト燃焼ダメージ",
		"対プリースト燃焼ダメージ"
	},
	zsSpdO = {
		"zsSpdO",
		"速度UP",
		"速度UP"
	},
	fsSpdO = {
		"fsSpdO",
		"速度UP",
		"速度UP"
	},
	ckSpdO = {
		"ckSpdO",
		"速度UP",
		"速度UP"
	},
	ckAtkPO = {
		"ckAtkPO",
		"攻撃UP",
		"攻撃UP"
	},
	yxSpdO = {
		"yxSpdO",
		"速度UP",
		"速度UP"
	},
	msAtkPO = {
		"msAtkPO",
		"攻撃UP",
		"攻撃UP"
	},
	iceless = {
		"iceless",
		"凍結無効",
		"凍結無効"
	},
	stoneless = {
		"stoneless",
		"石化無効",
		"石化無効"
	},
	stunless = {
		"stunless",
		"気絶無効",
		"気絶無効"
	},
	forbidless = {
		"forbidless",
		"沈黙無効",
		"沈黙無効"
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
		"対プリースト追加攻撃",
		"対プリースト追加攻撃"
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
		"ランダムの継続ダメージ（毒、燃焼、流血）",
		"ランダムの継続ダメージ（毒、燃焼、流血）"
	},
	rdcontrol = {
		"rdcontrol",
		"ランダムの拘束効果（気絶、凍結、石化）",
		"ランダムの拘束効果（気絶、凍結、石化）"
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
		"受けた治療量",
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
		"拘束強化率",
		"拘束強化率"
	},
	incDmg = {
		"incDmg",
		"增伤率",
		"增伤率"
	},
	incDmgGroupCom = {
		"incDmgGroupCom",
		"隠匿/神威/風見/雲華学部の戦姫に与えるダメージが増加",
		"增伤率-四系"
	},
	incDmgGroupSpe = {
		"incDmgGroupSpe",
		"修羅/辰星学部の戦姫に与えるダメージが増加",
		"增伤率-光暗"
	},
	incDmgGroupChaos = {
		"incDmgGroupChaos",
		"カオスに与えるダメージが増加",
		"增伤率-混沌"
	},
	decDmgGroupCom = {
		"decDmgGroupCom",
		"隠匿/神威/風見/雲華学部の戦姫から受けるダメージが減少",
		"减伤率-四系"
	},
	decDmgGroupSpe = {
		"decDmgGroupSpe",
		"修羅/辰星学部の戦姫から受けるダメージが減少",
		"减伤率-光暗"
	},
	decDmgGroupChaos = {
		"decDmgGroupChaos",
		"カオスから受けるダメージが減少",
		"减伤率-混沌"
	},
	incDmgSkl = {
		"incDmgSkl",
		"戦姫スキルダメージUP",
		"增伤率-技能"
	},
	decDmgSkl = {
		"decDmgSkl",
		"スキルの被ダメージが減少",
		"减伤率-技能"
	},
	incDmgNorAtk = {
		"incDmgNorAtk",
		"通常攻撃のダメージが増加",
		"增伤率-普攻"
	},
	decDmgNorAtk = {
		"decDmgNorAtk",
		"通常攻撃の被ダメージが減少",
		"减伤率-普攻"
	},
	allHarmDec = {
		"allHarmDec",
		"ダメージカット",
		"ダメージカット（割合ダメージ含む）"
	},
	unCrit = {
		"unCrit",
		"会心耐性",
		"会心耐性"
	},
	resist_zs = {
		"resist_zs",
		"ウォーリアから受けるダメージ軽減",
		"ウォーリアから受けるダメージ軽減"
	},
	resist_fs = {
		"resist_fs",
		"ソーサラーから受けるダメージ軽減",
		"ソーサラーから受けるダメージ軽減"
	},
	resist_yx = {
		"resist_yx",
		"レンジャーから受けるダメージ軽減",
		"レンジャーから受けるダメージ軽減"
	},
	resist_ck = {
		"resist_ck",
		"アサシンから受けるダメージ軽減",
		"アサシンから受けるダメージ軽減"
	},
	resist_ms = {
		"resist_ms",
		"プリーストから受けるダメージ軽減",
		"プリーストから受けるダメージ軽減"
	},
	allDmgC = {
		"allDmgC",
		"全ダメージUP",
		"全ダメージUP"
	},
	allDmgRate = {
		"allDmgRate",
		"全ダメージUP",
		"全ダメージUP"
	}
}

return table
