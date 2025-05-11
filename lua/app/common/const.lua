-- chunkname: @../../../Product/Bundles/Android/src/app/common/const.lua

xyd = xyd or {}
DEBUG = false
xyd.frameScale = 1
xyd.MAX_ITEM_USED_COUNT = 4
xyd.elementWidth = 118
xyd.elementHeight = 124
xyd.MAX_YA = 0.6
xyd.G = 0.067
xyd.TweenDeltaTime = 0.033
xyd.BOARD_MAX_WIDTH = 1062
xyd.BOARD_MAX_HEIGHT = 1116
xyd.mapWidth = 1080
xyd.DEFAULT_ITEM_SIZE = 108
xyd.MAX_PET_PAS_SKILL_LEV = 50
xyd.BASE_PET_PAS_SKILL_LEV = 30
xyd.TP_PAYMENT_LEVEL = 15
xyd.GM_IMG_SAVE_PATH = "Download/GM_img/"
xyd.HOUSE_IMG_SAVE_PATH = "Download/House_img/"
xyd.PARTNER_PICTURE_PATH = "Textures/partner_picture_web/"
xyd.SCENE_PATH = "Textures/scenes_web/"
xyd.ACTIVITY_PATH = "Prefabs/Windows/activity/"
xyd.Atlas = {
	COMMON_Bg = "CommonBg",
	COMMON = "Common",
	CAMPAIGIN_01 = "campaign_01_web",
	CAMPAIGIN = "campaign",
	CAMPAIGIN_02 = "campaign_02_web",
	ICON = "icon_image_web",
	COMMON_UI = "CommonUI",
	MAIN_WINDOW = "main_window",
	HOUSE = "house_web",
	COMMON_UI2 = "CommonUI2",
	HOUSE_FURNITURE = "house_furniture_web",
	COMMON_Btn = "CommonBtn",
	COMMON_WEB = "Common_web",
	BATTLE = "battle"
}
xyd.SceneName = {
	MAIN = "MainUIScene",
	GUI = "GuiScene",
	APP = "AppScene"
}
xyd.mapType2SceneName = {
	[xyd.GameMapType.MAIN] = xyd.SceneName.MAIN
}
xyd.LOCK_TYPE = {
	GIFT_WRAPPER = 3,
	SHACKLE = 1,
	ICE = 2
}

function xyd.getHeight()
	return UnityEngine.Screen.height
end

function xyd.getWidth()
	return UnityEngine.Screen.width
end

function xyd.getFixedHeight()
	return xyd.WindowManager.get():getActiveHeight()
end

function xyd.getFixedWidth()
	return xyd.STANDARD_WIDTH
end

xyd.directions = {
	{
		0,
		1
	},
	{
		0,
		-1
	},
	{
		1,
		0
	},
	{
		-1,
		0
	}
}
xyd.DIRECTION = {
	RIGHT = 2,
	UP = 1,
	LEFT = 3,
	DOWN = 0
}
xyd.FILTER = {
	useItemFilter = Color.New(0.5431372549019607, 0.5431372549019607, 0.5431372549019607, 1),
	lightFilter = Color.New(1.196078431372549, 1.196078431372549, 1.196078431372549, 1),
	darkFilter = Color.New(0.8823529411764706, 0.8823529411764706, 0.8823529411764706, 1),
	frameLightFilter = {
		Color.New(1, 1, 1, 1),
		Color.New(1.0392156862745099, 1.0392156862745099, 1.0392156862745099, 1),
		Color.New(1.1176470588235294, 1.1176470588235294, 1.1176470588235294, 1),
		Color.New(1.156862745098039, 1.156862745098039, 1.156862745098039, 1),
		Color.New(1.196078431372549, 1.196078431372549, 1.196078431372549, 1),
		Color.New(1.156862745098039, 1.156862745098039, 1.156862745098039, 1),
		Color.New(1.1176470588235294, 1.1176470588235294, 1.1176470588235294, 1),
		Color.New(1.0784313725490196, 1.0784313725490196, 1.0784313725490196, 1),
		Color.New(1.0392156862745099, 1.0392156862745099, 1.0392156862745099, 1),
		Color.New(1, 1, 1, 1),
		Color.New(1, 1, 1, 1)
	}
}
xyd.TileType = {
	HEAD = 1,
	MIDDLE_1 = 2,
	TAIL = 4,
	MIDDLE_2 = 3
}
xyd.DEFAULT_PARTNER_PICTURE_ID = 11001
xyd.FIRST_QUEST = 101010
xyd.TEST_QUEST = 101010
xyd.FINAL_QUEST = 308220
xyd.TEST_LEVEL = 1
xyd.TEST_SAVED_GAME_OPEN = false
xyd.MAX_STAGE = 365
xyd.BUBBLE_CONVERSATION_SCALE = 1
xyd.useSpine = true
xyd.TURNTABLE_VERSION = 1
xyd.GUIDE_VOICE_ON = true
xyd.TURNTABLE_ON = true
xyd.SHOP_ON = false
xyd.NETWORK_STAT = 1
xyd.SECOND = 1
xyd.MINUTE = 60 * xyd.SECOND
xyd.HOUR = 60 * xyd.MINUTE
xyd.DAY = 24 * xyd.HOUR
xyd.SCALE_OF_1920_1080 = 0.001040582726326743
xyd.STANDARD_WIDTH = 1080
xyd.STANDARD_HEIGHT = 1920
xyd.STANDARD_RATE = xyd.STANDARD_HEIGHT / xyd.STANDARD_WIDTH
xyd.MS2FRAME = 0.03
xyd.MIN_INT32 = -2147483648
xyd.MAX_INT32 = 2147483647
xyd.TweenDeltaTime = 0.033
xyd.TILE_WIDTH = 118
xyd.TILE_HEIGHT = 124
xyd.TILE_WIDTH_HALF = 59
xyd.TILE_HEIGHT_HALF = 62
xyd.BOARD_MAX_WIDTH = 1062
xyd.BOARD_MAX_HEIGHT = 1116
xyd.MAP_WIDTH = 6400
xyd.MAP_HEIGHT = 3200
xyd.MAP_COVERAGE_GRID_SIZE = 80
xyd.MAP_SRCOLLER_DISTANCE = 200
xyd.GRID_WIDTH = 80
xyd.GRID_WIDTH_HALF = 40
xyd.GRID_HEIGHT = 40
xyd.GRID_HEIGHT_HALF = 20
xyd.ATTACH_ZORDER = 0.1
xyd.DEFAULT_CHUNK_SCALE = 0.5
xyd.EFF_CAMERA_Z = -95000
xyd.ProjectorSpriteType = {
	SECTOR = 3,
	LINE = 6,
	RECTANGLE = 4,
	POINT = 5,
	CIRCLE = 2,
	DISTANCE = 1
}
xyd.BattleCameraSide = {
	WE = 1,
	ENEMY = 2
}
xyd.WindowAnimationOpenType = {
	POPUP2 = 2,
	POPUP = 1,
	OVERRIDE = -1,
	NONE = 0
}
xyd.WindowAnimationCloseType = {
	UP_TO_DOWN_OUT = 2,
	POPDOWN = 1,
	OVERRIDE = -1,
	NONE = 0
}
xyd.WindowBgType = {
	BLACK_60_CLOSE = 2,
	BLACK_60 = 1,
	TILE = 8,
	TRANSPARENT_CLOSE = 4,
	GAUSS_BLUR = 9,
	BLACK_CLOSE_BTN = 5,
	BLACK_SOLID_CLOSE = 6,
	BLACK_60_NOT_CLOSE = 3,
	BLACK_XXX = 7,
	NONE = 0
}
xyd.WindowDefaultBgName = "sprite_default_bg"
xyd.MapTouchType = {
	CLICK = 1,
	ZOOM = 3,
	SCROLL = 2,
	AUTO_SCROLL = 5,
	AUTO_ZOOM = 4
}
xyd.TouchLimitType = {
	GUIDE = 2,
	TASK = 3,
	SELF = 1
}
xyd.MapClickAction = {
	VIOD = 0,
	BOUNCE = 1
}
xyd.Layers = {
	WATER = "Water",
	PLAYER = "Player",
	HIDE = "Hide",
	SCENE = "Scene",
	GROUND = "Ground",
	SCENE_UI = "SceneUI",
	TWOD_UI = "2DUI",
	MARCH = "March"
}
xyd.AudioType = {
	BGS = 3,
	EFFECT = 1,
	MUSIC = 2
}
xyd.AttrSuffix = {
	"atk",
	"hp",
	"arm",
	"spd",
	"hit",
	"miss",
	"crit",
	"unCrit",
	"critTime",
	"brk",
	"sklP",
	"trueAtk",
	"unfree",
	"free",
	"decDmg",
	"allHarmDec"
}
xyd.SoulEquipShowAttr = {
	"atk",
	"hp",
	"hit",
	"miss",
	"crit",
	"unCrit",
	"sklP",
	"trueAtk",
	"unfree",
	"free",
	"healB",
	"healI"
}
xyd.HANG_AWARD_TIME = 5
xyd.FRAME_RATE_30 = 30
xyd.FRAME_RATE_60 = 60
xyd.MAX_CHAT_MSG_NUM = 50
xyd.TOP_ARENA_NUM = 50
xyd.HOUSE_SHARE_MAKR = "7284e903d7f0085faa6b9a0759b0f830"
xyd.GM_TALK_ID = 1000000000
xyd.STORY_CHANGE_NAME_ID = 1000001
xyd.TP_PAYMENT_LEVEL = 15
xyd.AF_TRACKING_MAP3 = 35
xyd.AF_TRACKING_MAP4 = 5
xyd.ROMAN_NUM = {
	"Ⅰ",
	"Ⅱ",
	"Ⅲ",
	"Ⅳ",
	"Ⅴ",
	"Ⅵ",
	"Ⅶ",
	"Ⅷ",
	"Ⅸ",
	"Ⅹ"
}
xyd.DAY_TIME = 86400
xyd.NOT_SHOW_GUIDE = false
xyd.ANDROID_1_1_64 = "1.1.64"
xyd.ANDROID_1_1_86 = "1.1.86"
xyd.ANDROID_1_1_91 = "1.1.91"
xyd.ANDROID_1_3_67 = "1.3.67"
xyd.ANDROID_1_4_88 = "1.4.88"
xyd.ANDROID_1_5_49 = "1.5.49"
xyd.ANDROID_1_5_138 = "1.5.138"
xyd.ANDROID_INVITE_SHARE_VERSION = "1.5.493"
xyd.ANDROID_DOG_MINI_GAME = "1.5.546"
xyd.IOS_1_1_21 = "1.1.21"
xyd.IOS_1_1_32 = "1.1.32"
xyd.IOS_1_2_49 = "1.2.49"
xyd.IOS_71_3_51 = "71.3.51"
xyd.IOS_71_3_110 = "71.3.110"
xyd.IOS_71_3_113 = "71.3.113"
xyd.IOS_71_3_204 = "71.3.204"
xyd.SHOW_CHRISTMAS = false
xyd.DELETE_WAY = 1
xyd.IOS_INVITE_SHARE_VERSION = "71.3.563"
xyd.IOS_INVITE_SHARE_VERSION_JP = "71.3.570"
xyd.IOS_DOG_MINI_GAME_JP = "99.99.99"
xyd.IOS_DOG_MINI_GAME = "71.3.628"
