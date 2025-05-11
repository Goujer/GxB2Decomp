-- chunkname: @../../../Product/Bundles/Android/src/app/common/const/ItemConstants.lua

local ItemConstants = {}

ItemConstants.LIMITED_TIME_OFFSET = 1000
ItemConstants.ROCKET = 999
ItemConstants.NORMAL = 1000
ItemConstants.COLOR_BOMB = 1001
ItemConstants.TORNADO = 1002
ItemConstants.CRAYON = 1003
ItemConstants.WAND = 1004
ItemConstants.HAMMER = 1005
ItemConstants.LINE_SQUARE_BOMB_PACK = 1006
ItemConstants.SWAPPER = 1007
ItemConstants.STICKER = 1008
ItemConstants.ADD_THREE_STEPS = 1016
ItemConstants.LINE_BOMB = 1017
ItemConstants.ADD_FIVE_STEPS = 1010
ItemConstants.COLOR_BOMB_TIME = 2001
ItemConstants.TORNADO_TIME = 2002
ItemConstants.CRAYON_TIME = 2003
ItemConstants.WAND_TIME = 2004
ItemConstants.HAMMER_TIME = 2005
ItemConstants.LINE_SQUARE_BOMB_PACK_TIME = 2006
ItemConstants.SWAPPER_TIME = 2007
ItemConstants.STICKER_TIME = 2008
ItemConstants.LINE_BOMB_TIME = 2017
ItemConstants.ADD_FIVE_STEPS_TIME = 2010
ItemConstants.FIVE_STAMINA = 1011
ItemConstants.HALF_HOUR_STAMINA = 1012
ItemConstants.ONE_STAMINA = 1013
ItemConstants.ONE_HOUR_STAMINA = 1014
ItemConstants.TWO_HOUR_STAMINA = 1015
ItemConstants.GEM = 3002
ItemConstants.HALF_HOUR_STAMINA_TIME = 1800
ItemConstants.ONE_HOUR_STAMINA_TIME = 3600
ItemConstants.TWO_HOUR_STAMINA_TIME = 7200
ItemConstants.MAX_STAMINA_TIME = 7200
ItemConstants.HAMMER_IMG = "icon_chuizi"
ItemConstants.SWAPPER_IMG = "icon_weizhijiaohuan"
ItemConstants.WAND_IMG = "icon_mobang"
ItemConstants.STICKER_IMG = "icon_tiezhi"
ItemConstants.HAMMER_TIP = "HAMMER_TIPS"
ItemConstants.SWAPPER_TIP = "SWAPPER_TIPS"
ItemConstants.WAND_TIP = ""
ItemConstants.STICKER_TIP = "STICKER_TIPS"
ItemConstants.ROCKET_TIP = "ROCKET_TIPS"
ItemConstants.ITEM_IMGS = {
	ItemConstants.HAMMER_IMG,
	ItemConstants.SWAPPER_IMG,
	ItemConstants.WAND_IMG,
	ItemConstants.STICKER_IMG
}
ItemConstants.ITEM_TIPS = {
	ItemConstants.HAMMER_TIP,
	ItemConstants.SWAPPER_TIP,
	ItemConstants.WAND_TIP,
	ItemConstants.STICKER_TIP
}
ItemConstants.CLEAR_STREAK_REWARDS = {
	ItemConstants.COLOR_BOMB,
	ItemConstants.LINE_SQUARE_BOMB_PACK,
	ItemConstants.ADD_THREE_STEPS,
	ItemConstants.LINE_SQUARE_BOMB_PACK,
	ItemConstants.COLOR_BOMB
}
ItemConstants.ITEM_PRICE = {
	[1004] = 100,
	[1008] = 80,
	[1010] = 50,
	[1005] = 40,
	[1006] = 40,
	[1001] = 20,
	[1002] = 40,
	[1003] = 100,
	[1007] = 50,
	[1011] = 100,
	[1017] = 20
}
ItemConstants.INF_STAMINA_IDS = {
	ItemConstants.HALF_HOUR_STAMINA,
	ItemConstants.ONE_HOUR_STAMINA,
	ItemConstants.TWO_HOUR_STAMINA
}
xyd = xyd or {}
xyd.ItemConstants = ItemConstants
