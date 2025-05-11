-- chunkname: @../../../Product/Bundles/Android/src/app/xinyoudi.lua

xyd = xyd or {}
print_r = require("base.sproto.print_r")

require("data.protos.messages_pb")
require("app.common.enums")
require("app.common.const")
require("app.common.Battle")
require("app.common.network.mid")
require("app.common.event")
require("app.common.save")
require("app.common.utils")
require("app.common.ChatUtils")
require("app.common.storage.db")
require("app.common.storage.Global")
require("app.common.network.errorCode")
require("app.common.const.ItemConstants")
require("app.common.const.EffectConstants")

xyd.MappingData = {}

require("app.common.const.StorageConst")

xyd.Backend = import("app.common.network.Backend")
xyd.SdkManager = import("app.sdk.SdkManager")
xyd.NotifyManager = import("app.sdk.NotifyManager")
xyd.EventProxy = require("app.common.EventProxy")
xyd.EventDispatcher = require("app.common.EventDispatcher")
xyd.WebPictureManager = import("app.common.network.WebPictureManager")
xyd.ModelManager = require("app.models.ModelManager")

xyd.ModelManager.get()

xyd.TableManager = require("app.common.tables.TableManager")

xyd.TableManager.get()

xyd.TranslationManager = require("app.common.network.TranslationManager")

xyd.TranslationManager.get()

xyd.Spine = require("app.common.Spine")
xyd.BattleEffectFactory = require("lib.battle.BattleEffectFactory")
xyd.MainMap = import("app.maps.MainMap")
xyd.LoadingController = require("app.controllers.LoadingController")
xyd.MainController = require("app.controllers.MainController")
xyd.DownloadController = require("app.controllers.DownloadController")
xyd.TimeCheckController = require("app.controllers.TimeCheckController")
xyd.BattleController = require("app.controllers.BattleController")
xyd.GuideController = require("app.controllers.GuideController")
xyd.GiftbagPushController = require("app.controllers.GiftbagPushController")
xyd.GiftbagPushController2 = require("app.controllers.GiftbagPushController2")
xyd.PartnerSoundController = require("app.controllers.PartnerSoundController")
xyd.WindowManager = require("app.windows.WindowManager")
xyd.PopupManager = require("app.common.PopupManager")
xyd.CameraManager = require("app.maps.CameraManager")
xyd.ErrorLogPoster = import("app.common.network.ErrorLogPoster")
xyd.LogPoster = import("app.common.network.LogPoster")
xyd.BackUpdateController = require("app.controllers.BackUpdateController")
xyd.SensitiveFilter = import("app.common.SensitiveFilter")
xyd.HotFixManager = import("app.modules.HotFixManager")
xyd.DataPlatform = require("app.common.network.DataPlatform")
xyd.ABTest = require("app.common.ABTest")
xyd.Sprites2Atlas = require("data.Sprites2Atlas")
xyd.Textures2Config = require("data.Textures2Config")

require("app.windows.AlertWindow")
require("app.windows.AlertTipsWindow")
require("app.windows.SystemAlertWindow")
xyd.init_database()
xyd.Global.init()

xyd.HouseMap = require("app.windows.HouseMap")
xyd.HouseGrid = require("app.windows.HouseGrid")
xyd.HouseDialog = require("app.windows.HouseDialog")

DG.Tweening.DOTween.Init(false, false, DG.Tweening.LogBehaviour.Verbose)

function __(key, ...)
	return xyd.tables.translationTable:translate(key, ...)
end

function __G__TRACKBACK_ERROR__(prefix, message, stackTrace)
	print("----------------------------------------")

	local log = prefix .. tostring(message) .. "\n" .. tostring(stackTrace)

	print(log .. "\n")
	xyd.db.errorLog:add(log)
end

function __G__TRACKBACK_CRASH__(path, stackTrace)
	print("----------------------------------------")

	local log = "CRASH: " .. tostring(path) .. "\n" .. tostring(stackTrace)

	print(log .. "\n")

	if xyd.coroutine_resume_trace and xyd.coroutine_resume_trace ~= "" then
		print("coroutine_resume_trace: " .. xyd.coroutine_resume_trace .. "\n")

		log = log .. "coroutine_resume_trace: " .. xyd.coroutine_resume_trace
	end

	xyd.db.errorLog:add(log, true, path)
end

function OnApplicationPause(paused)
	if xyd.Global.isLoginInfoReceived and not paused then
		xyd.MainController.get():clearLoadingMid()
		xyd.MainController.get():checkDay()
	end
end

function OnApplicationQuit()
	return
end
