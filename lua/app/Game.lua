-- chunkname: @../../../Product/Bundles/Android/src/app/Game.lua

require("config")
require("base.functions")

local Application = UnityEngine.Application
local Game = class("Game")

function Game:ctor()
	return
end

function Game:run(reloadLang)
	if package.loaded["app.xinyoudi"] == nil then
		print("-----app.xinyoudi---------")
		require("app.xinyoudi")
		print("-----app.xinyoudi---------")
	elseif reloadLang then
		xyd.tables.translationTable = import("app.common.tables.TranslationTable").new()
	end

	math.newrandomseed()
	xyd.Backend.get()
	xyd.CameraManager.get()

	xyd.SoundManager = import("app.common.SoundManager")

	xyd.SoundManager.get():reset()
	xyd.MainController.get()
	xyd.BattleController.get()
	xyd.DataPlatform.get()
	xyd.LogPoster.get():run()
	xyd.ErrorLogPoster.get():run()

	local defaultFrame = 30

	if UnityEngine.PlayerPrefs.GetInt("__GAME_FRAME_RATE__", -1) == -1 then
		defaultFrame = self:checkModelTypeFrame()

		UnityEngine.PlayerPrefs.SetInt("__GAME_FRAME_RATE__", defaultFrame)
	else
		defaultFrame = UnityEngine.PlayerPrefs.GetInt("__GAME_FRAME_RATE__", 30)
	end

	xyd.updateFrameRate(defaultFrame)
	self:setupModels()

	xyd.Global.isReview = xyd.isReview or 0

	xyd.LoadingController.get():onEnter()
end

function Game:updateFrameRate(frameRate)
	XYDCore.FrameRate = frameRate
	xyd.frameRate = frameRate
	xyd.frameScale = frameRate / 30
	xyd.DeltaTime = 1 / frameRate
	xyd.G = xyd.G / xyd.frameScale
	xyd.MAX_YA = xyd.MAX_YA / xyd.frameScale
end

function Game:setupModels()
	return
end

function Game:checkModelTypeFrame()
	local defaultFrame = 30

	if (UNITY_ANDROID or UNITY_EDITOR) and xyd.Global.systemMemorySize / 1024 >= 4 and xyd.Global.processorFrequency / 1024 >= 2.45 then
		defaultFrame = 60
	end

	if UNITY_IOS then
		local modelsStr = xyd.Global.deviceModel
		local index_iPad = string.find(modelsStr, "iPad")

		if index_iPad then
			local modelsStrArr = xyd.split(modelsStr, ",")
			local compareNum = xyd.split(modelsStrArr[1], "iPad")[2]

			compareNum = tonumber(compareNum)

			if compareNum > 5 or compareNum == 5 and tonumber(modelsStrArr[2]) >= 2 then
				defaultFrame = 60
			end
		end

		local index_iPhone = string.find(modelsStr, "iPhone")

		if index_iPhone then
			local modelsStrArr = xyd.split(modelsStr, ",")
			local compareNum = xyd.split(modelsStrArr[1], "iPhone")[2]

			compareNum = tonumber(compareNum)

			if compareNum >= 9 then
				defaultFrame = 60
			end
		end
	end

	return defaultFrame
end

return Game
