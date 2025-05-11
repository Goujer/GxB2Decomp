-- chunkname: @../../../Product/Bundles/Android/src/data/tables/ko_kr/buff_text_ko_kr.lua

local table = {}

table.keys = {
	desc1 = 3,
	name = 1,
	desc = 2
}
table.rows = {
	atk = {
		"atk",
		"공격",
		"공격"
	},
	hp = {
		"hp",
		"HP",
		"生命上限百分比燃烧伤害"
	},
	arm = {
		"arm",
		"방어력",
		"방어력"
	},
	spd = {
		"spd",
		"속도",
		"속도"
	},
	sklP = {
		"sklP",
		"스킬 대미지",
		"스킬 대미지"
	},
	hit = {
		"hit",
		"정밀",
		"정밀"
	},
	miss = {
		"miss",
		"가드",
		"가드"
	},
	crit = {
		"crit",
		"치명타",
		"치명타"
	},
	critTime = {
		"critTime",
		"치명타 대미지",
		"暴击伤害值"
	},
	brk = {
		"brk",
		"돌파력",
		"돌파력"
	},
	free = {
		"free",
		"면역력",
		"면역력"
	},
	trueAtk = {
		"trueAtk",
		"신성 대미지",
		"신성 대미지"
	},
	energy = {
		"energy",
		"에너지",
		"에너지"
	},
	decDmg = {
		"decDmg",
		"대미지 감소",
		"대미지 감소"
	},
	stun = {
		"stun",
		"기절",
		"기절 (공격 스킵)"
	},
	ice = {
		"ice",
		"동결",
		"동결 (공격 스킵)"
	},
	stone = {
		"stone",
		"석화",
		"석화 (공격 스킵)"
	},
	forbid = {
		"forbid",
		"침묵",
		"침묵 (스킬 사용 불가)"
	},
	hurt = {
		"hurt",
		"다이렉트 대미지",
		"다이렉트 대미지"
	},
	dot = {
		"dot",
		"지속 대미지",
		"지속 대미지 (매 라운드 HP 감소)"
	},
	heal = {
		"heal",
		"바로 회복",
		"바로 회복"
	},
	hot = {
		"hot",
		"지속 회복",
		"지속 회복 (매 라운드 HP 회복)"
	},
	healP = {
		"healP",
		"恢復%生命",
		"恢复%生命"
	},
	trueHurt = {
		"trueHurt",
		"신성 대미지",
		"신성 대미지"
	},
	dotPoison = {
		"dotPoison",
		"독",
		"독"
	},
	dotBlood = {
		"dotBlood",
		"출혈",
		"출혈"
	},
	dotFire = {
		"dotFire",
		"연소",
		"연소"
	},
	atkP = {
		"atkP",
		"공격",
		"공격 (비율에 따라 증가)"
	},
	hpP = {
		"hpP",
		"HP",
		"生命（按%加生命）"
	},
	armP = {
		"armP",
		"방어력",
		"돌파력 (비율에 따라 증가)"
	},
	addhurt = {
		"addhurt",
		"추가 공격",
		"추가 공격"
	},
	revive = {
		"revive",
		"부활",
		"부활"
	},
	siphonAtk = {
		"siphonAtk",
		"공격 흡수 퍼센테이지",
		"공격 흡수 퍼센테이지"
	},
	siphonHp = {
		"siphonHp",
		"HP 흡수 퍼센테이지",
		"HP 흡수 퍼센테이지"
	},
	siphonArm = {
		"siphonArm",
		"돌파력 흡수 퍼센테이지",
		"돌파력 흡수 퍼센테이지"
	},
	shield = {
		"shield",
		"대미지 x% 소멸",
		"대미지 x% 소멸"
	},
	brier = {
		"brier",
		"대미지 x% 반사",
		"대미지 x% 반사"
	},
	rImpress = {
		"rImpress",
		"라운드 표시",
		"라운드 표시"
	},
	cImpress = {
		"cImpress",
		"치명타 표시",
		"치명타 표시"
	},
	rImpressB = {
		"rImpressB",
		"라운드 표시 폭발",
		"라운드 표시 폭발"
	},
	cImpressB = {
		"cImpressB",
		"치명타 표시 폭발",
		"치명타 표시 폭발"
	},
	fImpress = {
		"fImpress",
		"번개 표시",
		"번개 표시"
	},
	oImpress = {
		"oImpress",
		"관찰자 표시",
		"관찰자 표시"
	},
	weak = {
		"weak",
		"쇠약",
		"쇠약"
	},
	atkPos = {
		"atkPos",
		"위치에 따른 공격력 증가",
		"위치에 따른 공격력 증가"
	},
	hpPos = {
		"hpPos",
		"位置增加生命率",
		"位置增加生命率"
	},
	armPos = {
		"armPos",
		"위치에 따른 방어력 증가",
		"위치에 따른 방어력 증가"
	},
	spdPos = {
		"spdPos",
		"위치에 따른 속도 증가",
		"위치에 따른 속도 증가"
	},
	hitPos = {
		"hitPos",
		"위치에 따른 정밀 추가",
		"위치에 따른 정밀 추가"
	},
	missPos = {
		"missPos",
		"위치에 따른 회피 증가",
		"위치에 따른 회피 증가"
	},
	critPos = {
		"critPos",
		"위치에 따른 치명타 증가",
		"위치에 따른 치명타 증가"
	},
	critTimePos = {
		"critTimePos",
		"위치에 따른 치명타 대미지 배수 증가",
		"위치에 따른 치명타 대미지 배수 증가"
	},
	stunB = {
		"stunB",
		"기절 대미지 증가",
		"기절 대미지 증가"
	},
	iceB = {
		"iceB",
		"동결 대미지 증가",
		"동결 대미지 증가"
	},
	stoneB = {
		"stoneB",
		"석화 대미지 증가",
		"석화 대미지 증가"
	},
	dotFireB = {
		"dotFireB",
		"연소 대미지 증가",
		"연소 대미지 증가"
	},
	dotPoisonB = {
		"dotPoisonB",
		"독 대미지 증가",
		"독 대미지 증가"
	},
	dotBloodB = {
		"dotBloodB",
		"출혈 대미지 증가",
		"출혈 대미지 증가"
	},
	zs = {
		"zs",
		"전사에게 대미지 증가",
		"전사에게 대미지 증가"
	},
	fs = {
		"fs",
		"법사에게 대미지 증가",
		"법사에게 대미지 증가"
	},
	ms = {
		"ms",
		"목사에게 대미지 증가",
		"목사에게 대미지 증가"
	},
	ck = {
		"ck",
		"어쌔신에게 대미지 증가",
		"어쌔신에게 대미지 증가"
	},
	yx = {
		"yx",
		"레인저에게 대미지 증가",
		"레인저에게 대미지 증가"
	},
	changeCombat = {
		"changeCombat",
		"일반 공격으로 변경",
		"일반 공격으로 변경"
	},
	fsStun = {
		"fsStun",
		"법사 기절",
		"법사 기절"
	},
	fsDotBlood = {
		"fsDotBlood",
		"법사 출혈 대미지",
		"법사 출혈 대미지"
	},
	zsIce = {
		"zsIce",
		"전사 동결",
		"전사 동결"
	},
	zsStun = {
		"zsStun",
		"전사 기절",
		"전사 기절"
	},
	zsForbid = {
		"zsForbid",
		"전사 침묵",
		"전사 침묵"
	},
	zsHurt = {
		"zsHurt",
		"전사 공격 시 추가 대미지",
		"전사 공격 시 추가 대미지"
	},
	zsArmP = {
		"zsArmP",
		"전사에 대한 방어력 감소",
		"전사에 대한 방어력 감소"
	},
	ckStone = {
		"ckStone",
		"어쌔신 석화",
		"어쌔신 석화"
	},
	ckForbid = {
		"ckForbid",
		"어쌔신 침묵",
		"어쌔신 침묵"
	},
	ckHurt = {
		"ckHurt",
		"어쌔신 공격 시 추가 대미지",
		"어쌔신 공격 시 추가 대미지"
	},
	msForbid = {
		"msForbid",
		"목사 침묵",
		"목사 침묵"
	},
	yxHurt = {
		"yxHurt",
		"레인저 공격 시 추가 대미지",
		"레인저 공격 시 추가 대미지"
	},
	yxAtkP = {
		"yxAtkP",
		"레인저에 대한 공격력 감소",
		"레인저에 대한 공격력 감소"
	},
	zsHpPO = {
		"zsHpPO",
		"전사 체력 증가",
		"전사 체력 증가"
	},
	zsAtkPO = {
		"zsAtkPO",
		"전사 공격력 증가",
		"전사 공격력 증가"
	},
	zsCritO = {
		"zsCritO",
		"전사 치명타 증가",
		"전사 치명타 증가"
	},
	zsMissO = {
		"zsMissO",
		"전사 가드 증가",
		"전사 회피율 증가"
	},
	zsSklPO = {
		"zsSklPO",
		"전사 스킬 대미지 증가",
		"전사 스킬 대미지 증가"
	},
	fsHpPO = {
		"fsHpPO",
		"법사 체력 증가",
		"법사 체력 증가"
	},
	fsAtkPO = {
		"fsAtkPO",
		"법사 공격력 증가",
		"법사 공격력 증가"
	},
	fsCritO = {
		"fsCritO",
		"법사 치명타 증가",
		"법사 치명타 증가"
	},
	fsHitO = {
		"fsHitO",
		"법사 정밀 증가",
		"법사 정밀 증가"
	},
	fsSklPO = {
		"fsSklPO",
		"법사 스킬 대미지 증가",
		"법사 스킬 대미지 증가"
	},
	ckHpPO = {
		"ckHpPO",
		"어쌔신 체력 증가",
		"어쌔신 체력 증가"
	},
	ckCritTimeO = {
		"ckCritTimeO",
		"어쌔신 치명타 대미지 증가",
		"어쌔신 치명타 대미지 증가"
	},
	ckCritO = {
		"ckCritO",
		"어쌔신 치명타 증가",
		"어쌔신 치명타 증가"
	},
	ckBrkO = {
		"ckBrkO",
		"어쌔신 돌파력 증가",
		"어쌔신 돌파력 증가"
	},
	ckSklPO = {
		"ckSklPO",
		"어쌔신 스킬 대미지 증가",
		"어쌔신 스킬 대미지 증가"
	},
	yxHpPO = {
		"yxHpPO",
		"레인저 체력 증가",
		"레인저 체력 증가"
	},
	yxAtkPO = {
		"yxAtkPO",
		"레인저 공격력 증가",
		"레인저 공격력 증가"
	},
	yxMissO = {
		"yxMissO",
		"레인저 가드 증가",
		"레인저 회피율 증가"
	},
	yxHitO = {
		"yxHitO",
		"레인저 정밀 증가",
		"레인저 정밀 증가"
	},
	yxSklPO = {
		"yxSklPO",
		"레인저 스킬 대미지 증가",
		"레인저 스킬 대미지 증가"
	},
	msHpPO = {
		"msHpPO",
		"목사 체력 증가",
		"목사 체력 증가"
	},
	msMissO = {
		"msMissO",
		"목사 가드 증가",
		"목사 회피 증가"
	},
	msCritO = {
		"msCritO",
		"목사 치명타 증가",
		"목사 치명타 증가"
	},
	msSpdO = {
		"msSpdO",
		"목사 속도 증가",
		"목사 속도 증가"
	},
	msSklPO = {
		"msSklPO",
		"목사 스킬 대미지 증가",
		"목사 스킬 대미지 증가"
	},
	ckStun = {
		"ckStun",
		"어쌔신 기절",
		"어쌔신 기절"
	},
	mhurt = {
		"mhurt",
		"다이랙트 대미지, 마수 액티브 스킬 설정",
		"다이랙트 대미지, 마수 액티브 스킬 설정"
	},
	mdotFire = {
		"mdotFire",
		"지속 대미지(연소), 마수 액티브 스킬 설정",
		"지속 대미지(연소), 마수 액티브 스킬 설정"
	},
	mdotPoison = {
		"mdotPoison",
		"지속 대미지(독), 마수 액티브 스킬 설정",
		"지속 대미지(독), 마수 액티브 스킬 설정"
	},
	mdotBlood = {
		"mdotBlood",
		"지속 대미지(출혈), 마수 액티브 스킬 설정",
		"지속 대미지(출혈), 마수 액티브 스킬 설정"
	},
	yxDotBlood = {
		"yxDotBlood",
		"레인저 출혈 대미지",
		"레인저 출혈 대미지"
	},
	phurt = {
		"phurt",
		"자신의 HP 보다 낮은 적에게 체력 비율(%)의 대미지를 주는 액티브 스킬 설정.",
		"자신의 HP 보다 낮은 적에게 체력 비율(%)의 대미지를 주는 액티브 스킬 설정."
	},
	addHurtd = {
		"addHurtd",
		"자신보다 방어력이 낮은 적에게 추가 공격",
		"자신보다 방어력이 낮은 적에게 추가 공격"
	},
	zsDotFire = {
		"zsDotFire",
		"전사 상대 시 연소 대미지",
		"전사 상대 시 연소 대미지"
	},
	yxStun = {
		"yxStun",
		"레인저 기절",
		"레인저 기절"
	},
	fsForbid = {
		"fsForbid",
		"법사 침묵",
		"법사 침묵"
	},
	ckDotPoison = {
		"ckDotPoison",
		"어쌔신 독 대미지",
		"어쌔신 독 대미지"
	},
	msStun = {
		"msStun",
		"목사 기절",
		"목사 기절"
	},
	msDotFire = {
		"msDotFire",
		"목사 상대 시 버닝 대미지",
		"목사 상대 시 버닝 대미지"
	},
	zsSpdO = {
		"zsSpdO",
		"전사 속도 증가",
		"전사 속도 증가"
	},
	fsSpdO = {
		"fsSpdO",
		"법사 속도 증가",
		"법사 속도 증가"
	},
	ckSpdO = {
		"ckSpdO",
		"어쌔신 속도 증가",
		"어쌔신 속도 증가"
	},
	ckAtkPO = {
		"ckAtkPO",
		"어쌔신 공격력 증가",
		"어쌔신 공격력 증가"
	},
	yxSpdO = {
		"yxSpdO",
		"레인저 속도 증가",
		"레인저 속도 증가"
	},
	msAtkPO = {
		"msAtkPO",
		"목사 공격력 증가",
		"목사 공격력 증가"
	},
	iceless = {
		"iceless",
		"동결 무효",
		"동결 무효"
	},
	stoneless = {
		"stoneless",
		"석화 무효",
		"석화 무효"
	},
	stunless = {
		"stunless",
		"기절 무효",
		"기절 무효"
	},
	forbidless = {
		"forbidless",
		"침묵 무효",
		"침묵 무효"
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
		"목사 엑스트라 대미지",
		"목사 엑스트라 대미지"
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
		"랜덤 지속 대미지(독, 연소, 출혈)",
		"랜덤 지속 대미지(독, 연소, 출혈)"
	},
	rdcontrol = {
		"rdcontrol",
		"랜덤 구속 효과(기절, 동결, 석화)",
		"랜덤 구속 효과(기절, 동결, 석화)"
	},
	hurtmaxM = {
		"hurtmaxM",
		"목표물에 대해 아군 최대 체력 한도x%의 대미지",
		"목표물에 대해 아군 최대 체력 한도x%의 대미지"
	},
	hurtmaxH = {
		"hurtmaxH",
		"목표물에 대해 최대 체력 x%의 대미지",
		"목표물에 대해 최대 체력 x%의 대미지"
	},
	healB = {
		"healB",
		"받는 치료 효과",
		"회복 효과 증가x%"
	},
	hurtshare = {
		"hurtshare",
		"모든 아군 대미지 분담",
		"모든 아군 대미지 분담"
	},
	exhurt = {
		"exhurt",
		"일반 공격 1회 추가",
		"일반 공격 1회 추가"
	},
	hurtB = {
		"hurtB",
		"일반 공격 대미지 증가x%",
		"일반 공격 대미지 증가x%"
	},
	newRound = {
		"newRound",
		"소녀 처치 시 새 라운드 획득",
		"소녀 처치 시 새 라운드 획득"
	},
	overflow = {
		"overflow",
		"대미지 분담",
		"대미지 분담"
	},
	shield = {
		"shield",
		"보호막",
		"보호막"
	},
	buffExloded = {
		"buffExloded",
		"폭발 buff",
		"폭발 buff"
	},
	mindControl = {
		"mindControl",
		"마인드 컨트롤",
		"마인드 컨트롤"
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
		"신위 학부 대미지 증가",
		"신위 학부 대미지 증가"
	},
	yz = {
		"yz",
		"은신 학부 대미지 증가",
		"은신 학부 대미지 증가"
	},
	th = {
		"th",
		"담화 학부 대미지 증가",
		"담화 학부 대미지 증가"
	},
	fj = {
		"fj",
		"풍견 학부 대미지 증가",
		"풍견 학부 대미지 증가"
	},
	cx = {
		"cx",
		"진성 학부 대미지 증가",
		"진성 학부 대미지 증가"
	},
	xl = {
		"xl",
		"수라 학원 대미지 증가",
		"수라 학원 대미지 증가"
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
		"치료 효과",
		"造成治疗效果增强x%"
	},
	healPlose = {
		"healPlose",
		"恢复已损失生命%生命",
		"恢复已损失生命%生命"
	},
	rowFArmP = {
		"rowFArmP",
		"앞줄 방어",
		"앞줄 방어"
	},
	rowFStone = {
		"rowFStone",
		"앞줄 석화",
		"앞줄 석화"
	},
	rowBAtkP = {
		"rowBAtkP",
		"对后排攻",
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
		"구속 강화율",
		"구속 강화율"
	},
	incDmg = {
		"incDmg",
		"增伤率",
		"增伤率"
	},
	incDmgGroupCom = {
		"incDmgGroupCom",
		"은신/신위/풍견/담화 학부 소녀에게 주는 대미지 증가",
		"增伤率-四系"
	},
	incDmgGroupSpe = {
		"incDmgGroupSpe",
		"수라/진성 학부 소녀에게 주는 대미지 증가",
		"增伤率-光暗"
	},
	incDmgGroupChaos = {
		"incDmgGroupChaos",
		"카오스에게 주는 대미지 증가",
		"增伤率-混沌"
	},
	decDmgGroupCom = {
		"decDmgGroupCom",
		"은신/신위/풍견/진성 학부 소녀에게 받는 대미지 감소",
		"减伤率-四系"
	},
	decDmgGroupSpe = {
		"decDmgGroupSpe",
		"수라/진성 학부 소녀에게 받는 대미지 감소",
		"减伤率-光暗"
	},
	decDmgGroupChaos = {
		"decDmgGroupChaos",
		"카오스로부터 받는 대미지 감소",
		"减伤率-混沌"
	},
	incDmgSkl = {
		"incDmgSkl",
		"소녀 스킬 대미지 증가",
		"增伤率-技能"
	},
	decDmgSkl = {
		"decDmgSkl",
		"소녀가 받는 스킬 대미지 감소",
		"减伤率-技能"
	},
	incDmgNorAtk = {
		"incDmgNorAtk",
		"일반 공격 대미지 증가",
		"增伤率-普攻"
	},
	decDmgNorAtk = {
		"decDmgNorAtk",
		"일반 공격으로 받는 대미지 감소",
		"减伤率-普攻"
	},
	allHarmDec = {
		"allHarmDec",
		"받은 모든 대미지 감소",
		"받은 모든 대미지 감소(퍼센티지 대미지 포함)"
	},
	unCrit = {
		"unCrit",
		"치명타 저항",
		"치명타 저항"
	},
	resist_zs = {
		"resist_zs",
		"받은 전사 대미지 감소",
		"받은 전사 대미지 감소"
	},
	resist_fs = {
		"resist_fs",
		"받은 법사 대미지 감소",
		"받은 법사 대미지 감소"
	},
	resist_yx = {
		"resist_yx",
		"받은 레인저 대미지 감소",
		"받은 레인저 대미지 감소"
	},
	resist_ck = {
		"resist_ck",
		"받은 어쌔신 대미지 감소",
		"받은 어쌔신 대미지 감소"
	},
	resist_ms = {
		"resist_ms",
		"받은 목사 대미지 감소",
		"받은 목사 대미지 감소"
	},
	allDmgC = {
		"allDmgC",
		"모든 대미지 증가",
		"모든 대미지 증가"
	},
	allDmgRate = {
		"allDmgRate",
		"모든 대미지 증가",
		"모든 대미지 증가"
	}
}

return table
