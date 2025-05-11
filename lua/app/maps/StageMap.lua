-- chunkname: @../../../Product/Bundles/Android/src/app/maps/StageMap.lua

local MapWrap = import("app.components.MapWrap")
local LevelTable = xyd.tables.level
local Input = UnityEngine.Input
local StageMap = class("StageMap", import(".SceneMap"))

StageMap.MAX_PAGE_COUNT = 1

function StageMap:ctor(parent, params)
	self.gameObject = ResCache.AddGameObject(parent, "Prefabs/Components/stage_map")

	local transform = self.gameObject.transform

	self.scrollView_ = transform:NodeByName("scrollView_").gameObject
	self.scrollViewDisplay_ = transform:NodeByName("scrollView_/scrollViewDisplay_").gameObject
	self.stageBgHeight_ = {
		1536,
		1066,
		1066,
		1785
	}
	self.HEAD_HEIGHT = self.stageBgHeight_[1]
	self.MIDDLE_HEIGHT = self.stageBgHeight_[2]
	self.TAIL_HEIGHT = self.stageBgHeight_[4]
	self.totalMap_ = 8
	self.wraps_ = {}
	self.minY = 0
	self.maxY = 0
	self.selfMap_ = xyd.SelfInfo.get():getCurrentLevel()
end

function StageMap:init()
	self:initMap()
end

function StageMap:initMap()
	StageMap.MAX_PAGE_COUNT = LevelTable:getMaxWarp()

	local i = self.totalMap_
	local bgHeight = self:getBgHeight(xyd.TileType.TAIL) + 1

	self.wraps_[i] = MapWrap.new(self.scrollViewDisplay_, self, xyd.mapWidth, bgHeight)

	local tail_y = xyd.getFixedHeight() / 2 - self.TAIL_HEIGHT / 2 + (StageMap.MAX_PAGE_COUNT - 2) * self.MIDDLE_HEIGHT + bgHeight

	self.wraps_[i].gameObject.transform.localPosition = Vector3(0, tail_y)

	self.wraps_[i]:update(StageMap.MAX_PAGE_COUNT)

	self.maxY = -tail_y

	local totalY = xyd.getFixedHeight() / 2 - self.MIDDLE_HEIGHT / 2 + self.MIDDLE_HEIGHT * (self.totalMap_ - 2)

	for j = self.totalMap_ - 1, 2, -1 do
		local tileType = self:getTileTypeByIndex(j)

		bgHeight = self:getBgHeight(tileType) + 1
		self.wraps_[j] = MapWrap.new(self.scrollViewDisplay_, self, xyd.mapWidth, bgHeight)
		self.wraps_[j].gameObject.transform.localPosition = Vector3(0, totalY)
		totalY = totalY - bgHeight
	end

	totalY = totalY - (self.HEAD_HEIGHT / 2 - self.MIDDLE_HEIGHT / 2) + 8
	self.minY = -xyd.getFixedHeight() + (self.HEAD_HEIGHT - 4)
	self.wraps_[1] = MapWrap.new(self.scrollViewDisplay_, self, xyd.mapWidth, self.HEAD_HEIGHT)
	self.wraps_[1].gameObject.transform.localPosition = Vector3(0, totalY)

	self.wraps_[1]:update(1)

	local starty

	if starty == nil then
		local levelData = LevelTable:getTableData(self.selfMap_)
		local wrap = levelData.wrap
		local yPos = levelData.y_pos

		starty = -(wrap - 2) * self.MIDDLE_HEIGHT - xyd.getFixedHeight() / 2 - yPos

		if self.selfMap_ < 8 then
			starty = -xyd.getFixedHeight() + (self.HEAD_HEIGHT - 4)
		end

		self.scrollView_.transform.localPosition = Vector3(0, starty)
	else
		self.scrollView_.transform.localPosition = Vector3(0, starty)
	end

	self:UpdatePos()
	UpdateBeat:Add(self.updateTouchHandle, self)
end

function StageMap:UpdatePos()
	local scroll_posY = self.scrollView_.transform.localPosition.y
	local startMap = 1

	if scroll_posY >= 0 then
		startMap = 1
	elseif scroll_posY <= (2 - StageMap.MAX_PAGE_COUNT) * self.MIDDLE_HEIGHT then
		startMap = StageMap.MAX_PAGE_COUNT
	else
		startMap = math.ceil(-scroll_posY / self.MIDDLE_HEIGHT) + 1
	end

	for currMap = startMap - 3, startMap + 1 do
		if currMap > 1 and currMap < StageMap.MAX_PAGE_COUNT then
			local wrap = self:getWrapByTileIdx(currMap)
			local toY = xyd.getFixedHeight() / 2 - self.MIDDLE_HEIGHT / 2 + (currMap - 1) * self.MIDDLE_HEIGHT
			local wrap_trans = wrap.gameObject.transform

			if wrap_trans.localPosition.y ~= toY or wrap.tileIdx ~= currMap then
				wrap_trans.localPosition = Vector3(0, toY)

				wrap:update(currMap)
			end
		end
	end
end

function StageMap:getWrapByTileIdx(tileIdx)
	if tileIdx <= 1 then
		return self.wraps_[1]
	end

	if tileIdx >= StageMap.MAX_PAGE_COUNT then
		return self.wraps_[self.totalMap_]
	end

	local wrapIdx = (tileIdx - 2) % (self.totalMap_ - 2) + 2

	return self.wraps_[wrapIdx]
end

function StageMap:enterStage(level)
	xyd.WindowManager.get():openWindow("pre_game_window", {
		totalLevel = level
	})
	xyd.WindowManager.get():closeWindow("stage_window")
end

function StageMap:dispose()
	UpdateBeat:Remove(self.updateTouchHandle, self)
end

function StageMap:getBgHeight(tileType)
	return self.stageBgHeight_[tileType]
end

function StageMap:getTileTypeByIndex(idx)
	if idx >= StageMap.MAX_PAGE_COUNT then
		return xyd.TileType.TAIL
	end

	if idx <= 1 then
		return xyd.TileType.HEAD
	end

	if idx % 2 == 0 then
		return xyd.TileType.MIDDLE_1
	end

	return xyd.TileType.MIDDLE_2
end

function StageMap:updateTouchHandle()
	if UNITY_EDITOR or UNITY_STANDALONE then
		self:updateDesktop()
	else
		self:updateMobile()
	end
end

local OP_NONE = 0
local OP_DOWN = 1
local OP_MOVE = 2
local OP_UP = 3
local OP_CANCEL = 4

function StageMap:updateDesktop()
	local isOverUI = XYDUtils.IsMouseOverUI()

	if isOverUI then
		return
	end

	local currPos
	local phase = OP_NONE

	if Input.GetMouseButtonDown(0) then
		currPos = Input.mousePosition
		phase = OP_DOWN
	elseif Input.GetMouseButton(0) then
		currPos = Input.mousePosition
		phase = OP_MOVE
	elseif Input.GetMouseButtonUp(0) then
		currPos = Input.mousePosition
		phase = OP_UP
	end

	self:processInput(phase, currPos)
end

function StageMap:updateMobile()
	local isOverUI = XYDUtils.IsFingerOverUI()

	if isOverUI then
		return
	end

	local currPos, currPos2
	local phase = OP_NONE
	local touchCount = Input.touchCount

	if touchCount == 1 then
		local touch = Input.GetTouch(0)

		currPos = touch.position

		if touch.phase == TouchPhase.Began then
			phase = OP_DOWN
		elseif touch.phase == TouchPhase.Moved or touch.phase == TouchPhase.Stationary then
			phase = OP_MOVE
		elseif touch.phase == TouchPhase.Ended or touch.phase == TouchPhase.Canceled then
			phase = OP_UP
		end
	end

	self:processInput(phase, currPos)
end

function StageMap:processInput(phase, position)
	if phase == OP_NONE then
		return
	end

	if phase == OP_DOWN then
		self.lastInputPosY_ = position.y
	elseif phase == OP_MOVE then
		if self.lastInputPosY_ == nil then
			return
		end

		self.nowInputPosY_ = position.y

		local d = self.nowInputPosY_ - self.lastInputPosY_

		self.lastInputPosY_ = position.y

		local scroll_trans = self.scrollView_.transform

		if scroll_trans.localPosition.y + d <= self.maxY then
			scroll_trans.localPosition = Vector3(0, self.maxY)
		elseif scroll_trans.localPosition.y + d >= self.minY then
			scroll_trans.localPosition = Vector3(0, self.minY)
		else
			scroll_trans.localPosition = Vector3(0, scroll_trans.localPosition.y + d)
		end

		self:UpdatePos()
	elseif phase == OP_UP then
		self.lastInputPosY_ = nil
		self.nowInputPosY_ = nil
	end
end

return StageMap
