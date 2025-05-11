-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/GuideController.lua

local GuideController = class("GuideController", import(".BaseController"))
local json = require("cjson")

function GuideController:ctor()
	GuideController.super.ctor(self)

	self.guideID_ = -1
	self.marks_ = {}
	self.funcIDs_ = {}
	self.guideWindowList = {}
	self.recordWindowList = {}
	self.stepFlags_ = {}
	self.curIDs_ = {}
	self.curIndex_ = -1
	self.isInFuncGuide_ = false
	self.highPraiseType_ = 0
	self.lastPraiseShowTime = 0
	self.isForceGuideComplete = false
	self.needSaveData_ = false
	self.isLevChange_ = true
	self.curFuncLevFlag_ = false
	self.offset_ = 0
	self.GuideVersion = 0
	self.GuideTypeNum = 1
	self.GuideWindowName = {
		MAIN_WINDOW = "main_window"
	}

	self:onRegister()
end

function GuideController:get()
	if not GuideController.INSTANCE then
		GuideController.INSTANCE = GuideController.new()
	end

	return GuideController.INSTANCE
end

function GuideController:onRegister()
	self:registerEvent(xyd.event.WINDOW_WILL_OPEN, handler(self, self.onWindowOpen))
	self:registerEvent(xyd.event.WINDOW_WILL_CLOSE, handler(self, self.onWindowClose))
	self:registerEvent(xyd.event.HIGH_PRAISE, handler(self, self.highPraise))
end

function GuideController:initGuideData(event)
	self.marks_ = xyd.split(event.data.marks, "|", true)
	self.funcIDs_ = xyd.split(event.data.func_ids, "|", true)
	self.loginMarks_ = xyd.cloneTable(self.marks_)

	dump(self.marks_, "test_marks=====================================:")
	dump(self.funcIDs_, "test_funcIDs========================================:")

	xyd.Global.guideType = event.data.guide_type
	xyd.Global.guideType = 1

	self:updateData()

	if self.needSaveData_ then
		self.needSaveData_ = false

		self:saveData()
	end

	self:initGuideTableData()
	self:initPraiseData()
	self:initGuideMask()
end

function GuideController:initGuideMask()
	if not self.isInitGuideMask_ and self:isPlayGuide() then
		self.isInitGuideMask_ = true

		xyd.Global.initGuideMask()
	end
end

function GuideController:saveMarkPoint()
	local msg = messages_pb.mark_point_req()

	msg.point_id = self.guideID_
	msg.is_unity = 1

	xyd.Backend.get():request(xyd.mid.MARK_POINT, msg)
end

function GuideController:updateData()
	if xyd.Global.guideType == 1 or xyd.Global.guideType == 3 then
		self:updateFirstGuide()
	elseif xyd.Global.guideType == 2 then
		self:updatSecondGuide()
	end
end

function GuideController:updateFirstGuide()
	self:updateSummonGuide()
	self:updateHangFormation(4)
	self:updateBattle1Guide(5, 5)
	self:updateMapHandGuide(15, 15, 2)
	self:updateMapHandGuide(19, 19, 3)
	self:updateBattle2Guide(17, 17)
	self:updateBattle2Guide(18, 18)
	self:updateForceEnd(22)
end

function GuideController:updatSecondGuide()
	self:updateSummonGuide()
	self:updateHangFormation(4)
	self:updateBattle1Guide(5, 5)
	self:updateMapHandGuide(15, 15, 2)
	self:updateMapHandGuide(19, 19, 3)
	self:updateBattle2Guide(17, 17)
	self:updateBattle2Guide(18, 18)
	self:updateForceEnd(22)
end

function GuideController:updateSummonGuide()
	local num = xyd.models.slot:getPartnerNum()
	local lev = xyd.models.backpack:getLev()

	if xyd.arrayIndexOf(self.marks_, 2) > -1 and num <= 0 and lev < 3 then
		for i = #self.marks_, 1, -1 do
			if self.marks_[i] >= 2 and self.marks_[i] <= 3 then
				table.remove(self.marks_, i)
			end
		end

		self.needSaveData_ = true
	elseif xyd.arrayIndexOf(self.marks_, 3) > -1 and num <= 1 and lev < 3 then
		local index = xyd.arrayIndexOf(self.marks_, 3)

		table.remove(self.marks_, index)

		self.needSaveData_ = true
	elseif num >= 2 then
		for i = 2, 3 do
			if xyd.arrayIndexOf(self.marks_, i) < 0 then
				self.needSaveData_ = true

				table.insert(self.marks_, i)
			end
		end
	end
end

function GuideController:updateHangFormation(mark)
	if xyd.models.backpack:getLev() > 2 then
		return
	end

	local mapInfo = xyd.models.map:getMapInfo(xyd.MapType.CAMPAIGN)
	local hangTeam = mapInfo.hang_team or {}
	local index = xyd.arrayIndexOf(self.marks_, mark)

	if index < 0 and #hangTeam > 0 then
		table.insert(self.marks_, mark)

		self.needSaveData_ = true
	elseif index > 0 and #hangTeam == 0 then
		table.remove(self.marks_, index)

		self.needSaveData_ = true
	end
end

function GuideController:updateMapHandGuide(start, end__, stageID)
	local mapInfo = xyd.models.map:getMapInfo(xyd.MapType.CAMPAIGN)
	local currentStage = mapInfo.current_stage
	local maxStage = mapInfo.max_stage
	local index = xyd.arrayIndexOf(self.marks_, start)

	if index <= -1 and maxStage <= stageID and currentStage == stageID then
		for i = start, end__ do
			table.insert(self.marks_, i)
		end

		self.needSaveData_ = true
	elseif index > -1 and currentStage < stageID and maxStage < stageID and stageID <= 2 then
		for i = start, end__ do
			local index = xyd.arrayIndexOf(self.marks_, i)

			if index > 0 then
				table.remove(self.marks_, index)
			end
		end

		self.needSaveData_ = true
	end
end

function GuideController:updateBattle1Guide(start, end__)
	local mapInfo = xyd.models.map:getMapInfo(xyd.MapType.CAMPAIGN)
	local currentStage = mapInfo.current_stage
	local maxStage = mapInfo.max_stage
	local index = xyd.arrayIndexOf(self.marks_, start)

	if index > -1 and maxStage < 1 then
		for i = #self.marks_, 1, -1 do
			if start <= self.marks_[i] and end__ >= self.marks_[i] then
				table.remove(self.marks_)
			end
		end

		self.needSaveData_ = true
	elseif index <= -1 and maxStage >= 1 then
		for i = start, end__ do
			table.insert(self.marks_, i)
		end

		self.needSaveData_ = true
	end
end

function GuideController:updateBattle2Guide(start, end__)
	local mapInfo = xyd.models.map:getMapInfo(xyd.MapType.CAMPAIGN)
	local currentStage = mapInfo.current_stage
	local maxStage = mapInfo.max_stage
	local index = xyd.arrayIndexOf(self.marks_, start)

	if index > -1 and maxStage < 2 then
		for i = #self.marks_, 1, -1 do
			if start <= self.marks_[i] and end__ >= self.marks_[i] then
				table.remove(self.marks_, i)
			end
		end

		self.needSaveData_ = true
	elseif index <= -1 and maxStage == 2 then
		for i = start, end__ do
			table.insert(self.marks_, i)
		end

		self.needSaveData_ = true
	end
end

function GuideController:updateForceEnd(id)
	local mapInfo = xyd.models.map:getMapInfo(xyd.MapType.CAMPAIGN)
	local currentStage = mapInfo.current_stage
	local maxStage = mapInfo.max_stage
	local index = xyd.arrayIndexOf(self.marks_, id)

	if index < 0 and (maxStage >= 3 or xyd.arrayIndexOf(self.marks_, 19) > -1 and currentStage ~= 3) then
		table.insert(self.marks_, id)

		self.needSaveData_ = true
	end
end

function GuideController:getFuncIDs()
	local ids = xyd.tables.functionTable:getGuideFuncIDs(xyd.models.backpack:getLev())

	return ids
end

function GuideController:checkFuncsComplete()
	if not self:isGuideComplete() or self.isInFuncGuide_ or not self:checkCanOpenFuncGuide() or xyd.NOT_SHOW_GUIDE or self.isPlaying_ or not xyd.HAS_ENTER_MAIN_SCENE or not xyd.models.selfPlayer:isKaimenPlayed() or xyd.models.selfPlayer:ifCallback() and not xyd.models.selfPlayer:ifCallbackAwarded() then
		return
	end

	local ids = self:getFuncIDs()
	local flag = self:checkGuildLuckFunc(ids)

	if not flag then
		self:playFuncsGuide(ids)
	end
end

function GuideController:checkGuildLuckFunc(ids)
	local guildIndex = xyd.arrayIndexOf(ids, xyd.FunctionID.GUILD)

	if guildIndex < 0 then
		return false
	end

	local guildModel = xyd.models.guild
	local luck_status = guildModel:getLuckStatus()

	if luck_status > 0 then
		if luck_status == 1 or luck_status == 2 then
			ids[guildIndex] = xyd.FunctionID.LUCK_GUILD
		end

		return false
	else
		return false
	end
end

function GuideController:playFuncsGuide(ids)
	local saveGuide

	function saveGuide(funcID)
		local guideID = xyd.tables.guideTable:getGuideByFuncID(funcID)

		if guideID and guideID > 0 then
			local markID = xyd.tables.guideTable:getMark(guideID)

			if xyd.arrayIndexOf(self.marks_, markID) < 0 then
				local name_ = xyd.tables.guideTable:getName(guideID)
				local step_ = xyd.tables.guideTable:getStep(guideID)

				table.insert(self.marks_, markID)

				self.stepFlags_[name_] = step_
			end
		end
	end

	local funcID = -1
	local curGuideRank = -1

	if xyd.arrayIndexOf(ids, xyd.FunctionID.OLD_SCHOOL) > 0 and xyd.models.oldSchool:isCanOpen() == false then
		table.removebyvalue(ids, xyd.FunctionID.OLD_SCHOOL)
	end

	if xyd.arrayIndexOf(ids, xyd.FunctionID.SHRINE_HURDLE) > 0 and xyd.models.shrineHurdleModel:checkFuctionOpen() == false then
		table.removebyvalue(ids, xyd.FunctionID.SHRINE_HURDLE)
	end

	if xyd.arrayIndexOf(ids, xyd.FunctionID.GALAXY_TRIP) > 0 and xyd.checkFunctionOpen(xyd.FunctionID.STARRY_ALTAR, true) == false then
		table.removebyvalue(ids, xyd.FunctionID.STARRY_ALTAR)
	end

	if xyd.arrayIndexOf(ids, xyd.FunctionID.GROWTH_DIARY) > 0 and (xyd.checkFunctionOpen(xyd.FunctionID.GROWTH_DIARY, true) == false or xyd.models.growthDiary:checkFinish()) then
		table.removebyvalue(ids, xyd.FunctionID.GROWTH_DIARY)
	end

	if xyd.arrayIndexOf(ids, xyd.FunctionID.SOUL_LAND) > 0 and (xyd.checkFunctionOpen(xyd.FunctionID.SOUL_LAND, true) == false or xyd.models.soulLand:isBeforStartTime() == true) then
		table.removebyvalue(ids, xyd.FunctionID.SOUL_LAND)
	end

	if self.gmMaskFunID then
		local ids_temp = ids

		ids = {}

		for i = 1, #ids_temp do
			if ids_temp[i] > tonumber(self.gmMaskFunID) then
				table.insert(ids, ids_temp[i])
			end
		end
	end

	for i = #ids, 1, -1 do
		local id = ids[i]

		if xyd.Global.isReview == 1 and xyd.tables.functionTable:openInReview(id) ~= 1 then
			saveGuide(id)

			if xyd.arrayIndexOf(self.funcIDs_, id) == -1 then
				table.insert(self.funcIDs_, id)
			end
		else
			local guideRank = xyd.tables.functionTable:guideRank(id)
			local is_guide = xyd.tables.functionTable:isGuide(id)

			if xyd.arrayIndexOf(self.funcIDs_, id) == -1 and curGuideRank <= guideRank and is_guide then
				curGuideRank = guideRank

				if funcID > 0 then
					if funcID == xyd.FunctionID.GUILD or funcID == xyd.FunctionID.LUCK_GUILD then
						saveGuide(xyd.FunctionID.GUILD)
						saveGuide(xyd.FunctionID.LUCK_GUILD)
					else
						saveGuide(funcID)
					end

					table.insert(self.funcIDs_, funcID)
				end

				funcID = id
			else
				if funcID == xyd.FunctionID.GUILD or funcID == xyd.FunctionID.LUCK_GUILD then
					saveGuide(xyd.FunctionID.GUILD)
					saveGuide(xyd.FunctionID.LUCK_GUILD)
				else
					saveGuide(id)
				end

				if xyd.arrayIndexOf(self.funcIDs_, id) == -1 then
					table.insert(self.funcIDs_, id)
				end
			end
		end

		if funcID > 0 then
			break
		end
	end

	if funcID > 0 and not xyd.isIosTest() then
		self.guideID_ = funcID

		self:saveData()

		self.isInFuncGuide_ = true

		self:initGuideMask()

		local win = xyd.WindowManager.get():getWindow("main_window")

		if win then
			win:showProperTopBtn()
		end

		local params = {
			name = xyd.event.FUNCTION_OPEN_MODEL,
			data = {
				functionID = funcID
			}
		}

		xyd.EventDispatcher.outer():dispatchEvent(params)
		xyd.WindowManager.get():openWindow("func_open_window", {
			funcID = funcID
		})
	end
end

function GuideController:checkFiveStarPartnerCompose()
	if #self.marks_ == 0 then
		return false
	end

	for i = 1, #self.marks_ do
		local markId = self.marks_[i]

		if markId == 37 then
			return false
		end
	end

	local composePos = xyd.models.backpack:checkfiveStarCompose()

	self.fiveComposePos = composePos

	if composePos >= 0 then
		return true
	end
end

function GuideController:checkFourorFiveStar()
	if #self.marks_ == 0 then
		return false
	end

	for i = 1, #self.marks_ do
		local markId = self.marks_[i]

		if markId == 38 then
			return false
		end
	end

	local pos = xyd.models.slot:checkFiveStarPos()

	if pos >= 0 then
		self.fiveShenxuePos = pos

		return true
	end

	return false
end

function GuideController:funcIDs()
	return self.funcIDs_
end

function GuideController:checkCanOpenFuncGuide()
	local wnds = {
		"battle_window",
		"battle_loading_window",
		"person_lev_up_window",
		"gamble_window",
		"gamble_door_window",
		"arena_window",
		"arena_tips_window",
		"battle_formation_window",
		"activity_window"
	}
	local flag = true

	for i = 1, #wnds do
		local wndName = wnds[i]

		if xyd.WindowManager.get():isOpen(wndName) then
			flag = false

			break
		end
	end

	return flag
end

function GuideController:checkSoftGuide(id)
	local result = id

	if xyd.tables.guideTable:getMark(id) == 37 and not self:checkFiveStarPartnerCompose() then
		result = nil
	end

	if xyd.tables.guideTable:getMark(id) == 38 and not self:checkFourorFiveStar() then
		result = nil
	end

	return result
end

function GuideController:getNextID(windowName)
	if self.curIDs_ == nil or #self.curIDs_ == 0 then
		local names = xyd.tables.guideTable:getNames()
		local stepNums = xyd.tables.guideTable:getStepNums()
		local idMaps_ = xyd.tables.guideTable:getIdMaps()
		local curId = self.guideID_

		for i = 1, #names do
			local name = names[i]

			if not self:checkFinish(name, stepNums[name]) and self:checkFuncOpen(name) and (windowName ~= "func_open_window" or name == xyd.tables.functionTable:getGuideName(curId)) then
				local ids = {}

				for step = 1, stepNums[name] do
					for j = 1, #idMaps_[name][step] do
						local id = idMaps_[name][step][j]
						local condition = xyd.tables.guideTable:getCondition(id)

						if condition == 1 or not self:checkFinish(name, step) then
							table.insert(ids, id)
						end
					end
				end

				local offset = -1

				if #ids > 0 and xyd.tables.guideTable:getWindowName(ids[1]) == windowName then
					offset = 1
				else
					for j = 1, #ids do
						local id = ids[j]
						local condition = xyd.tables.guideTable:getCondition(id)

						if condition == 1 and xyd.tables.guideTable:getWindowName(id) == windowName then
							offset = j

							break
						end
					end
				end

				if offset > -1 and self:checkSoftGuide(ids[offset]) then
					self.curIDs_ = ids
					self.curIndex_ = offset
					self.offset_ = offset

					return self.curIDs_[self.curIndex_]
				end
			end
		end
	end

	if self.curIDs_ ~= nil and xyd.tables.guideTable:getWindowName(self.curIDs_[self.curIndex_]) == windowName and self:checkSoftGuide(self.curIDs_[self.curIndex_]) then
		return self.curIDs_[self.curIndex_]
	end

	return nil
end

function GuideController:checkFinish(name, step)
	step = step or 1

	return step <= self.stepFlags_[name]
end

function GuideController:checkFuncOpen(name)
	local funcID = xyd.tables.functionTable:getFuncIdByName(name)

	if funcID == xyd.FunctionID.LUCK_GUILD and xyd.models.guild:getLuckStatus() == 1 then
		return true
	end

	if funcID == xyd.FunctionID.GUILD and xyd.models.guild:getLuckStatus() == 1 then
		return false
	end

	if funcID == xyd.FunctionID.TRIAL and xyd.models.trial:checkClose() then
		return false
	end

	if not funcID or funcID <= 0 or xyd.checkFunctionOpen(funcID, true) then
		return true
	end

	return false
end

function GuideController:initGuideTableData()
	xyd.tables.guideTable:resetInfo()

	local guideTable = xyd.tables.guideTable

	guideTable:init()

	self.stepFlags_ = guideTable:getStepFlags(self.marks_)
	self.isForceGuideComplete = false
end

function GuideController:saveData()
	local msg = messages_pb.save_guide_info_req()
	local tempMarks = xyd.cloneTable(self.marks_)

	for i, id in pairs(self.loginMarks_) do
		if xyd.arrayIndexOf(tempMarks, id) < 0 then
			table.insert(tempMarks, id)
		end
	end

	msg.marks = table.concat(tempMarks, "|")
	msg.func_ids = table.concat(self.funcIDs_, "|")
	msg.guide_type = xyd.Global.guideType
	msg.version = self.GuideVersion

	xyd.Backend.get():request(xyd.mid.SAVE_GUIDE_INFO, msg)
end

function GuideController:checkIsError(nextID)
	return
end

function GuideController:saveError(nextID)
	return
end

function GuideController:getData()
	return
end

function GuideController:isGuideComplete()
	if xyd.NOT_SHOW_GUIDE or self.isForceGuideComplete then
		return true
	end

	local forced = xyd.tables.guideTable:getForced()
	local stepNums = xyd.tables.guideTable:getStepNums()
	local flag = true

	for name in pairs(forced) do
		if not self:checkFinish(name, stepNums[name]) then
			flag = false

			break
		end
	end

	local isUpdateMain = false

	if self.isForceGuideComplete == false and flag == true then
		isUpdateMain = true
	end

	self.isForceGuideComplete = flag
	xyd.Global.isInGuide = not flag

	if isUpdateMain then
		local mainWd = xyd.WindowManager.get():getWindow("main_window")

		if mainWd then
			mainWd:CheckExtraActBtn()
		end
	end

	return flag
end

function GuideController:isPlayGuide()
	return not self:isGuideComplete() or self.isInFuncGuide_ or self.isPlaying_
end

function GuideController:isCurLevNoFuncGuide()
	if self.isInFuncGuide_ then
		return false
	end

	if not self.isLevChange_ then
		return self.curFuncLevFlag_
	end

	local ids = xyd.tables.functionTable:getGuideFuncIDs(xyd.models.backpack:getLev())
	local flag = true

	for i = #ids, 1, -1 do
		local id = ids[i]

		if xyd.arrayIndexOf(self.funcIDs_, id) == -1 then
			flag = false

			break
		end
	end

	self.isLevChange_ = false
	self.curFuncLevFlag_ = flag

	return flag
end

function GuideController:recordWnd(name, isOpen)
	local filterWnds = {
		float_message_window2 = 2,
		loading_window = 1
	}

	if filterWnds[name] then
		return
	end

	if isOpen then
		table.insert(self.recordWindowList, name)
	else
		local index = xyd.arrayIndexOf(self.recordWindowList, name)

		if index > -1 then
			table.remove(self.recordWindowList, index)
		end
	end
end

function GuideController:onWindowOpen(event)
	if xyd.MainController.get().openPopWindowNum > 0 then
		return
	end

	local name = event.params.windowName

	table.insert(self.guideWindowList, name)
	self:recordWnd(name, true)

	if self:isGuideComplete() and self:isCurLevNoFuncGuide() and not self:checkFiveStarPartnerCompose() and not self:checkFourorFiveStar() then
		return
	end

	if name == "guide_window" then
		local wnd = xyd.WindowManager.get():getWindow("main_window")

		if wnd then
			wnd:showGuideMask(false)
		end
	end

	if name == "guide_window" or name == "login_window" or name == "loading_window" or name == "notice_window" or name == "res_loading_window" or name == xyd.getInputWindowName() then
		return
	end

	self:goNextGuide(name)
end

function GuideController:onWindowClose(event)
	if xyd.MainController.get().openPopWindowNum > 0 then
		return
	end

	local name = event.params.windowName

	self:recordWnd(name, false)

	if self:isGuideComplete() and self:isCurLevNoFuncGuide() and not self:checkFiveStarPartnerCompose() then
		return
	end

	if name == "guide_window" and not self:isGuideComplete() then
		local wnd = xyd.WindowManager.get():getWindow("main_window")

		if wnd then
			wnd:showGuideMask(true)
		end
	end

	local index = xyd.arrayIndexOf(self.guideWindowList, name)

	if index > -1 then
		table.remove(self.guideWindowList, index)
	end

	if name == "guide_window" or name == "login_window" or name == "notice_window" or name == "person_lev_up" or name == "loading_window" or name == "res_loading_window" or name == xyd.getInputWindowName() then
		return
	end

	if not xyd.WindowManager.get():isOpen("guide_window") then
		local count = #self.guideWindowList
		local flag = false

		while count > 0 do
			flag = self:goNextGuide(self.guideWindowList[count])

			if flag then
				break
			end

			count = count - 1
		end

		if not flag and #self.recordWindowList == 1 then
			self:checkFuncsComplete()
		end
	end
end

function GuideController:showGuide(id, name)
	self.guideID_ = id

	if xyd.NOT_SHOW_GUIDE then
		return true
	end

	local wnd = xyd.WindowManager.get():getWindow(name)

	if wnd then
		local callback

		function callback()
			local params = {
				wnd = wnd,
				guideID = id
			}

			xyd.WindowManager.get():openWindow("guide_window", params)
		end

		self.isPlaying_ = true

		self:initGuideMask()
		callback()
	end
end

function GuideController:saveSoftByClose(id)
	local mark = xyd.tables.guideTable:getMark(id)

	if xyd.arrayIndexOf(self.marks_, mark) == -1 then
		table.insert(self.marks_, mark)
		self:saveData()

		self.curIDs_ = nil
	end

	self.isPlaying_ = false
end

function GuideController:completeOneGuide(id)
	self.isPlaying_ = false

	if id == nil then
		id = -1
	end

	if id == -1 then
		id = self.guideID_
	end

	self:saveMarkPoint()

	if xyd.arrayIndexOf(self.curIDs_, id) > -1 then
		local name = xyd.tables.guideTable:getName(id)
		local step = xyd.tables.guideTable:getStep(id)
		local ids_ = xyd.tables.guideTable:getIdMaps()[name][step]

		if ids_[#ids_] == id then
			self:finishGuide(id, name, step)
		end

		if self.curIndex_ == #self.curIDs_ then
			self.curIndex_ = -1
			self.curIDs_ = nil
		else
			self.curIndex_ = self.curIndex_ + 1
		end
	end

	local isRecord = xyd.tables.guideTable:isRecord(id)
	local mark = xyd.tables.guideTable:getMark(id)

	if isRecord and xyd.arrayIndexOf(self.marks_, mark) == -1 then
		table.insert(self.marks_, mark)

		local funcID = xyd.tables.guideTable:getFuncID(id)

		if funcID > 0 and xyd.arrayIndexOf(self.funcIDs_, funcID) == -1 then
			table.insert(self.funcIDs_, funcID)

			self.isInFuncGuide_ = false
			self.isLevChange_ = true
		end

		self:saveData()
	end

	local wndName = xyd.tables.guideTable:getWindowName(id)
	local flag = self:goNextGuide(wndName)

	if not flag then
		local count = #self.guideWindowList

		while count > 0 do
			local flag1 = self:goNextGuide(self.guideWindowList[count])

			if flag1 then
				break
			end

			count = count - 1
		end

		if count == 0 then
			xyd.WindowManager.get():closeWindow("guide_window")
			xyd.MainController.get():onGuideComplete()
		end
	end

	if mark == 22 and isRecord then
		xyd.delayRegisterNotification(2)
	end

	if mark == 22 then
		xyd.models.activity:onGuideComplete()
	end
end

function GuideController:goNextGuide(wndName)
	local nextID = self:getNextID(wndName)

	if nextID ~= nil then
		self:checkIsError(nextID)
		self:showGuide(nextID, wndName)

		return true
	end

	return false
end

function GuideController:finishGuide(id, name, step)
	step = step or 1

	if xyd.arrayIndexOf(self.curIDs_, id) > -1 and not self:checkFinish(name, step) then
		self.stepFlags_[name] = step
	end
end

function GuideController:onMainWindowGuide()
	return
end

function GuideController:highPraise(event)
	if xyd.Global.isReview ~= 1 then
		-- block empty
	end

	do return end

	if not self:isGuideComplete() or xyd.models.backpack:getLev() < 10 then
		return
	end

	if self.highPraiseType_ == xyd.HighPraiseType.DO or self.highPraiseType_ == xyd.HighPraiseType.REFUSE then
		return
	elseif self.highPraiseType_ == xyd.HighPraiseType.WAIT then
		local curTime = xyd.getServerTime()

		if curTime - self.lastPraiseShowTime < 259200 then
			return
		end
	end
end

function GuideController:initPraiseData()
	self.highPraiseType_ = tonumber(xyd.db.misc:getValue("praise_type") or 0)
	self.lastPraiseShowTime = tonumber(xyd.db.misc:getValue("last_show_time") or 0)
end

function GuideController:savePraiseData(type, time)
	self.highPraiseType_ = type
	self.lastPraiseShowTime = time or 0

	xyd.db.Guide:setValue({
		key = "praise_type",
		value = self.highPraiseType_
	})
	xyd.db.Guide:setValue({
		key = "last_show_time",
		value = self.lastPraiseShowTime
	})
end

function GuideController:getGuideID()
	return self.guideID_
end

function GuideController:getMaskLen()
	return #self.marks_
end

function GuideController:isInAltarGuide()
	return self.guideID_ == 40
end

function GuideController:checkLuckDeviceType()
	local device_types = xyd.tables.miscTable:split("lucky_player_phone_models", "value", "|")
	local cur_device_type = xyd.Global.deviceType_
	local flag = false

	for i = 1, #device_types do
		if cur_device_type == device_types[i] then
			return true
		end
	end

	xyd.models.guild:setLuckStatus(-1)

	return false
end

return GuideController
