-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/PartnerSoundController.lua

local BaseController = import(".BaseController")
local PartnerSoundController = class("PartnerSoundController", BaseController)

function PartnerSoundController:ctor()
	BaseController.ctor(self)

	self.win_list_ = {}
	self.timer = nil
	self.timeInMainwindow = 0
	self.tavernTimes = 0
	self.stageTimes = 0
	self.missionTimes = 0
	self.alertTimes = 0

	self:initTimer()
	self:onRegister()
end

function PartnerSoundController.get()
	if PartnerSoundController.INSTANCE == nil then
		PartnerSoundController.INSTANCE = PartnerSoundController.new()
	end

	return PartnerSoundController.INSTANCE
end

function PartnerSoundController:initTimer()
	self.timer = Timer.New(function()
		self.timeInMainwindow = self.timeInMainwindow + 1

		if self.timeInMainwindow >= 120 and self:canPlay() and self:checkOnlyMainwindowLast() then
			xyd.MainMap.get():playDialog(false, true)

			self.timer.time = 1
			self.timeInMainwindow = 0
		end
	end, 1, -1)
end

function PartnerSoundController:onRegister()
	self:registerEvent(xyd.event.WINDOW_WILL_OPEN, handler(self, self.onWindowOpen))
	self:registerEvent(xyd.event.WINDOW_WILL_CLOSE, handler(self, self.onWindowClose))
end

function PartnerSoundController:insertWindow(winName)
	table.insert(self.win_list_, winName)
end

function PartnerSoundController:onWindowOpen(event)
	local windowName = event.params.windowName

	table.insert(self.win_list_, windowName)
	XYDCo.StopWait("partner_sound_key")
	XYDCo.StopWait("enter_map_play_dialog")
end

function PartnerSoundController:onWindowClose(event)
	local win_name = event.params.windowName
	local index = xyd.arrayIndexOf(self.win_list_, win_name)

	if index <= 0 then
		return
	end

	table.remove(self.win_list_, index)

	local loading_index = xyd.arrayIndexOf(self.win_list_, "loading_window")

	if loading_index >= 0 then
		table.remove(self.win_list_, loading_index)
	end

	if not self.win_list_ or #self.win_list_ == 0 then
		return
	end

	if win_name == "month_card_push_window" then
		return
	end

	if self.win_list_[1] == "main_window" and #self.win_list_ == 1 and win_name ~= "func_open_window" and win_name ~= "guide_window" then
		self:checkPlay()
	end
end

function PartnerSoundController:checkOnlyMainwindowLast()
	if self.win_list_[1] == "main_window" and #self.win_list_ == 1 then
		return true
	end

	return false
end

function PartnerSoundController:canPlay()
	if not xyd.GuideController.get():isGuideComplete() or xyd.GuideController.get():isPlayGuide() or not self:checkFuncsComplete() then
		return false
	end

	if not xyd.Global.isMainMapLoaded then
		return false
	end

	if DEBUG then
		return true
	end

	return true
end

function PartnerSoundController:checkFuncsComplete()
	local ids = xyd.GuideController.get():getFuncIDs()
	local funcID = -1
	local curGuideRank = -1

	if not ids or #ids == 0 then
		return true
	end

	for i = #ids, 1 do
		local id = ids[i]

		if xyd.Global.isReview ~= 1 or xyd.tables.functionTable:openInReview(id) then
			local guideRank = xyd.tables.functionTable:guideRank(id)

			if guideRank and xyd.arrayIndexOf(xyd.GuideController.get():funcIDs(), id) <= 0 and curGuideRank <= guideRank then
				curGuideRank = guideRank
				funcID = id
			end
		end
	end

	return xyd.checkCondition(funcID > 0, false, true)
end

function PartnerSoundController:checkPlay()
	if not self:canPlay() then
		return
	end

	self.timer:Start()

	local info = xyd.models.map:getMapInfo(xyd.MapType.CAMPAIGN)
	local tavernRedState = xyd.models.redMark:getRedState(xyd.RedMarkType.TAVERN)
	local missionRedState = xyd.models.redMark:getRedState(xyd.RedMarkType.MISSION)

	if not info or not next(info) then
		return
	end

	local ifHasNewStage = info.current_stage > info.max_stage

	if ifHasNewStage and self.stageTimes < 3 then
		XYDCo.WaitForTime(2, function()
			if self:checkOnlyMainwindowLast() and self.stageTimes < 3 then
				self:checkAlertDialog(3)
			end
		end, "partner_sound_key")
	elseif tavernRedState and self.tavernTimes < 3 then
		XYDCo.WaitForTime(2, function()
			if self:checkOnlyMainwindowLast() and self.tavernTimes < 3 then
				self:checkAlertDialog(1)
			end
		end, "partner_sound_key")
	elseif missionRedState and self.missionTimes < 3 then
		XYDCo.WaitForTime(2, function()
			if self:checkOnlyMainwindowLast() and self.missionTimes < 3 then
				self:checkAlertDialog(2)
			end
		end, "partner_sound_key")
	else
		XYDCo.WaitForTime(2, function()
			if self:checkOnlyMainwindowLast() and self.alertTimes < 3 then
				self:checkAlertDialog(0)
			end
		end, "partner_sound_key")
	end
end

function PartnerSoundController:checkAlertDialog(index)
	local pictureID = xyd.MainMap.get():getPictureID()
	local partnerID = pictureID
	local skinID
	local type_ = xyd.tables.itemTable:getType(pictureID)

	if type_ == xyd.ItemType.SKIN then
		skinID = pictureID
		partnerID = xyd.tables.partnerPictureTable:getSkinPartner(pictureID)[1]
	elseif type_ == xyd.ItemType.KANBAN then
		partnerID = xyd.tables.partnerPictureTable:getSkinPartner(pictureID)[1]
	elseif type_ == xyd.ItemType.FAKE_PARTNER_SKIN then
		partnerID = xyd.tables.partnerPictureTable:getSkinPartner(pictureID)[1]
	end

	local alertInfo = xyd.tables.partnerTable:getAlertDialog(partnerID, skinID)
	local limitActRed = xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_EVENT)
	local isTryAlert = false

	if alertInfo.sound ~= 0 and (limitActRed or not xyd.models.mission:getDailyMissionFinished()) then
		isTryAlert = math.random() < 0.5
	end

	if isTryAlert and self.alertTimes < 3 then
		self.alertTimes = self.alertTimes + 1

		xyd.MainMap.get():playDialog(false, false, 4)
	elseif index == 1 then
		self.tavernTimes = self.tavernTimes + 1

		xyd.MainMap.get():playDialog(false, false, 1)
	elseif index == 2 then
		self.missionTimes = self.missionTimes + 1

		xyd.MainMap.get():playDialog(false, false, 2)
	elseif index == 3 then
		self.stageTimes = self.stageTimes + 1

		xyd.MainMap.get():playDialog(false, false, 3)
	end
end

function PartnerSoundController:setTypeTimes(stageTime, tavernTime, missionTime)
	self.stageTimes = self.stageTimes - stageTime
	self.tavernTimes = self.tavernTimes - tavernTime
	self.missionTimes = self.missionTimes - missionTime
	self.alertTimes = 0
end

function PartnerSoundController:clearTimeCount()
	if self.timer and self.timer.running then
		self.timer.time = 1
		self.timeInMainwindow = 0
	end
end

function PartnerSoundController:reset()
	BaseController.reset(self)

	if self.timer then
		self.timer:Stop()

		self.timer = nil
	end
end

return PartnerSoundController
