-- chunkname: @../../../Product/Bundles/Android/src/app/components/StoryCG.lua

local StoryCG = class("StoryCG")
local ParnterImg = import("app.components.PartnerImg")
local ActivityEffectPlayer = import("app.common.ActivityEffectPlayer")

function StoryCG:ctor(parentGo)
	self.go_ = parentGo
	self.curStoryID_ = -1
	self.timesLines_ = {}
	self.isPlayCgEnter = false
	self.isPlayCgExit = false
	self.curActionNum = 0
	self.doneActionNum = 0
	self.index_ = 0
	self.imgs_ = {}
	self.effectPlayer = ActivityEffectPlayer.new()

	self:getUIComponent()
end

function StoryCG:getUIComponent()
	return
end

function StoryCG:getGameObject()
	return self.go_
end

function StoryCG:update(params)
	local storyType = params.storyType

	self.index_ = params.index

	local storyTable

	if storyType == xyd.StoryType.PARTNER then
		storyTable = xyd.tables.partnerPlotTable
	elseif storyType == xyd.StoryType.MAIN then
		storyTable = xyd.tables.mainPlotTable
	elseif storyType == xyd.StoryType.ACTIVITY then
		storyTable = xyd.tables.storyTable
	elseif storyType == xyd.StoryType.LD_PLAYER_BACK then
		storyTable = xyd.tables.playerReturnStoryTable
	elseif storyType == xyd.StoryType.OTHER then
		storyTable = xyd.tables.partnerWarmUpPlotTable
	end

	self.storyTable_ = storyTable
end

function StoryCG:getImage(type_)
	local image

	if type_ == xyd.StoryImageType.PARTNER_IMG then
		image = ParnterImg.new(self.go_)
	else
		image = NGUITools.AddChild(self.go_, "image")

		if type_ == xyd.StoryImageType.SPRITE then
			local sp = image:AddComponent(typeof(UISprite))

			sp.depth = self.go_:GetComponent(typeof(UIWidget)).depth + 1
			sp.width = 1000
			sp.height = 1457
		else
			local sp = image:AddComponent(typeof(UITexture))

			sp.depth = self.go_:GetComponent(typeof(UIWidget)).depth + 1
			sp.width = 1000
			sp.height = 1457
		end
	end

	return image
end

function StoryCG:playCgAction(storyID)
	if not self.storyTable_:isCgShow(storyID) then
		return
	end

	local path_ = self.storyTable_:getCgPath(storyID)
	local showType = self.storyTable_:getCgShowType(storyID)
	local startPos = self.storyTable_:getCgStartXY(storyID)
	local showPos = self.storyTable_:getCgShowXY(storyID)
	local showTime = self.storyTable_:getCgShowTime(storyID)
	local cgLayer = self.storyTable_:getCGLayer(storyID)
	local scale = self.storyTable_:getCGScale(storyID)

	for i = 1, #path_ do
		local layer = cgLayer[i] or 0

		if layer == self.index_ then
			local image = self.imgs_[i] or self:getImage(xyd.StoryImageType.NORMAL)

			image.name = "cg_card" .. tostring(storyID) .. tostring(i)

			self:setBigPicSource(image, path_[i])

			local pos = startPos[i]

			image:SetLocalPosition(pos[1], pos[2], 0)
			image:SetLocalScale(scale[i] or 1, scale[i] or 1, 0)

			local pos2 = showPos[i]
			local type_ = showType[i]

			if type_ > 0 and type_ ~= 11 then
				image:GetComponent(typeof(UIWidget)).alpha = 0.01

				local action = self:getTimeLineLite()

				self.effectPlayer:play(type_, image, action, {
					x = pos2[1],
					y = pos2[2],
					callback = function()
						self:onActionCallback()
					end
				}, showTime[i])

				self.curActionNum = self.curActionNum + 1
			elseif type_ == 11 then
				image:SetLocalPosition(pos2[1], pos2[2], 0)
			end

			self.imgs_[i] = image
		end
	end

	self.isPlayCgEnter = true

	if self.curActionNum == 0 then
		self:resetAction()
	end
end

function StoryCG:onActionCallback()
	self.doneActionNum = self.doneActionNum + 1

	if self.doneActionNum == self.curActionNum then
		self:resetAction()
	end
end

function StoryCG:resetAction()
	self.curActionNum = 0
	self.doneActionNum = 0
	self.isPlayCgEnter = false
	self.isPlayCgExit = false

	local wnd = xyd.WindowManager.get():getWindow("story_window")

	if wnd then
		wnd:setCgActionFlag(false)
	end
end

function StoryCG:playCgExitAction(storyID)
	local path_ = self.storyTable_:getCgPath(storyID)
	local disappearType = self.storyTable_:getCgDisappearType(storyID)
	local disappearPos = self.storyTable_:getCgDisappearXY(storyID)
	local disappearTime = self.storyTable_:getCgDisappearTime(storyID)

	if self:checkNextIsSameCgPath(storyID) then
		self:resetAction()

		return
	end

	self.imgs_ = {}

	for i = 1, #path_ do
		local image = self.go_:NodeByName("cg_card" .. tostring(storyID) .. tostring(i))

		if image then
			local pos = disappearPos[i]
			local type_ = disappearType[i]

			if type_ > 0 and type_ ~= 12 then
				local action = self:getTimeLineLite()

				self.effectPlayer:play(disappearType[i], image, action, {
					x = pos[1],
					y = pos[2],
					callback = function()
						NGUITools.Destroy(image.gameObject)
						self:onActionCallback()
					end
				}, disappearTime[i])

				self.curActionNum = self.curActionNum + 1
			elseif type_ == 12 then
				NGUITools.Destroy(image.gameObject)
			end
		end
	end

	self.isPlayCgExit = true

	if self.curActionNum == 0 then
		self:resetAction()
	end
end

function StoryCG:checkNextIsSameCgPath(storyID)
	local nextID = self.storyTable_:getNext(storyID)

	if nextID and nextID > 0 then
		local path_ = self.storyTable_:getCgPath(storyID)
		local nextPath = self.storyTable_:getCgPath(nextID)

		if xyd.check2TableSame(nextPath, path_) then
			return true
		end
	end

	return false
end

function StoryCG:playCgActionEnd(storyID)
	if not self.storyTable_:isCgShow(storyID) then
		return
	end

	if self:checkNextIsSameCgPath(storyID) then
		self.isPlayCgEnter = false
		self.curActionNum = 0
		self.doneActionNum = 0

		return
	end

	local path_ = self.storyTable_:getCgPath(storyID)
	local showPos = self.storyTable_:getCgShowXY(storyID)

	for i = 1, #path_ do
		local image = self.go_:NodeByName("cg_card" .. tostring(storyID) .. tostring(i)).gameObject

		if image then
			image.alpha = 1

			local pos2 = showPos[i]

			image.x = pos2[1]
			image.y = pos2[2]
		end
	end

	self.isPlayCgEnter = false
	self.curActionNum = 0
	self.doneActionNum = 0
end

function StoryCG:playCgExitEnd(storyID)
	if not self.storyTable_:isCgShow(storyID) then
		return
	end

	local path_ = self.storyTable_:getCgPath(storyID)
	local showPos = self.storyTable_:getCgShowXY(storyID)

	self.imgs_ = {}

	for i = 1, #path_ do
		local image = self.go_:NodeByName("cg_card" .. tostring(storyID) .. tostring(i)).gameObject

		if image then
			NGUITools.Destroy(image)
		end
	end

	self.isPlayCgExit = false
	self.curActionNum = 0
	self.doneActionNum = 0
end

function StoryCG:setBigPicSource(img, pic)
	if pic then
		local pngIndex = string.find(pic, "_png")

		if pngIndex then
			pic = string.sub(pic, 1, pngIndex - 1)
		end

		xyd.setUITextureAsync(img:GetComponent(typeof(UITexture)), xyd.SCENE_PATH .. pic)
		img:SetActive(true)
	else
		img:SetActive(false)
	end
end

function StoryCG:getTimeLineLite()
	local action

	local function completeCallback()
		for i = 1, #self.timesLines_ do
			if self.timesLines_[i] == action then
				table.remove(self.timesLines_, i)

				break
			end
		end
	end

	action = DG.Tweening.DOTween.Sequence():OnComplete(completeCallback)

	action:SetAutoKill(true)
	table.insert(self.timesLines_, action)

	return action
end

function StoryCG:clean()
	for i = 1, #self.timesLines_ do
		local action = self.timesLines_[i]

		action:Pause()
		action:Kill()
	end

	self.timesLines_ = {}
end

return StoryCG
