-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/UnequalWrapContent.lua

local UnequalWrapContent = class("UnequalWrapContent")

function UnequalWrapContent:ctor(scrollView, wrapContent, cloneItem, itemClass, parent)
	self.parent_ = parent
	self.items_ = {}
	self.infos_ = {}
	self.isInit_ = false
	self.itemNum_ = 0
	self.itemClass_ = itemClass
	self.cloneItem_ = cloneItem
	self.wrapContent_ = wrapContent
	self.scrollView_ = scrollView
	self.wrapContent_.cullContent = false
	self.wrapContent_.onInitializeItem = handler(self, self.onInitializeItem)
	self.wrapContent_.onScroll = handler(self, self.onScroll)

	self.cloneItem_:SetActive(false)
	self.scrollView_:ResetPosition()
	self:resetContentSize(true)
end

function UnequalWrapContent:onScroll()
	if self.scrollView_ then
		self.scrollView_.restrictWithinPanel = true
	end
end

function UnequalWrapContent:onInitializeItem(go, wrapIndex, realIndex)
	wrapIndex = tonumber(string.sub(go.name, 6))

	local item = self.items_[wrapIndex]
	local oldIndex = item:getRealIndex()
	local info = self.infos_[-realIndex]

	item:update(-realIndex, info)

	if not self.isInit_ then
		if wrapIndex < -1 then
			local nearbyItem = self.items_[wrapIndex + 1]

			item:fixPos(nearbyItem:getPos() - Vector3(0, nearbyItem:getHeight() + self:getItemGap(), 0))
		end
	elseif oldIndex < realIndex then
		local nearbyItem = self:getItemByRealIndex(item:getRealIndex() - 1)

		if not nearbyItem then
			return
		end

		item:fixPos(nearbyItem:getPos() + Vector3(0, item:getHeight() + self:getItemGap(), 0))
	elseif realIndex < oldIndex then
		local nearbyItem = self:getItemByRealIndex(item:getRealIndex() + 1)

		if not nearbyItem then
			return
		end

		item:fixPos(nearbyItem:getPos() - Vector3(0, nearbyItem:getHeight() + self:getItemGap(), 0))
	else
		item:fixPos(item:getPos())
	end
end

function UnequalWrapContent:setDataNum(num)
	self.wrapContent_.minIndex = -num
end

function UnequalWrapContent:resetContentSize(init)
	local panel = self.scrollView_:GetComponent(typeof(UIPanel))

	if init then
		xyd.updateParentAnchors(panel.transform)
	end

	panel:ResetAndUpdateAnchors()

	local itemHeight = self.cloneItem_:GetComponent(typeof(UIWidget)).height + self:getItemGap()

	self.itemMinHeight = itemHeight

	local panelHeight = panel.height
	local displayNum = math.ceil(panelHeight / itemHeight) + 4

	if displayNum > self.itemNum_ then
		for i = -self.itemNum_ - 1, -displayNum, -1 do
			local nextItem = NGUITools.AddChild(self.wrapContent_.gameObject, self.cloneItem_)

			self.items_[i] = self.itemClass_.new(nextItem, self.parent_, i)
			nextItem.name = "item_" .. i
			nextItem.transform.localPosition = Vector3(0, (i + 1) * itemHeight, 0)

			nextItem:SetActive(true)
		end

		self.itemNum_ = displayNum
	end

	self.wrapContent_.maxIndex = -1
	self.wrapContent_.minIndex = -self.itemNum_

	self.wrapContent_:SortBasedOnScrollMovement()
end

function UnequalWrapContent:setInfos(infos, params)
	self.isInit_ = false

	local lastNum = #self.infos_

	self.infos_ = infos

	local currNum = #self.infos_
	local minIndex = -currNum

	self.wrapContent_.maxIndex = -1
	self.wrapContent_.minIndex = math.min(-1, minIndex + 1)
	params = params or {}

	if params.scrollPos then
		for _, item in pairs(self.items_) do
			item:getGameObject():SetActive(true)
		end

		self:refreshAll()
		self.wrapContent_:SortBasedOnScrollMovement(true)

		local currPos = self.scrollView_.transform.localPosition

		self.scrollView_:MoveRelative(params.scrollPos - currPos)
		self.scrollView_:InvalidateBounds()
	elseif params.keepPosition and currNum > 0 then
		self:refreshAll()
		self.scrollView_:InvalidateBounds()
		self.scrollView_:RestrictWithinBounds(false)
	else
		self:resetPosition()
	end

	self.isInit_ = true
end

function UnequalWrapContent:getItemByRealIndex(realIndex)
	for _, entry in pairs(self.items_) do
		if entry:getRealIndex() == realIndex then
			return entry
		end
	end

	return nil
end

function UnequalWrapContent:getItemGap()
	return 0
end

function UnequalWrapContent:getItems()
	return self.items_
end

function UnequalWrapContent:resetPosition()
	for _, item in pairs(self.items_) do
		item:getGameObject():SetActive(true)
	end

	self.wrapContent_:SortBasedOnScrollMovement()
	self:refreshAll()
	self.scrollView_:ResetPosition()
end

function UnequalWrapContent:refreshAll()
	local maxIndex = xyd.MIN_INT32
	local startIndex = -1

	for i = -1, -self.itemNum_, -1 do
		local item = self.items_[i]

		if item then
			item:setRealIndex(i)

			local go = item:getGo()

			go.transform.localPosition = Vector3(0, (i + 1) * self.itemMinHeight, 0)
		end
	end

	for i = -1, -self.itemNum_, -1 do
		local item = self.items_[i]
		local realIndex = item:getRealIndex()

		if maxIndex < realIndex then
			maxIndex = realIndex
			startIndex = i
		end
	end

	for i = startIndex, -self.itemNum_, -1 do
		local item = self.items_[i]

		self:onInitializeItem(item:getGameObject(), -1 - i, item:getRealIndex())
	end

	for i = -1, startIndex + 1, -1 do
		local item = self.items_[i]

		self:onInitializeItem(item:getGameObject(), -1 - i, item:getRealIndex())
	end
end

function UnequalWrapContent:jumpToInfo(info, getHeightFun)
	if not getHeightFun then
		return
	end

	local currIndex

	for index, info2 in ipairs(self.infos_) do
		if info2 == info then
			currIndex = index

			break
		end
	end

	if not currIndex then
		return
	end

	local panel = self.scrollView_:GetComponent(typeof(UIPanel))
	local height = panel.baseClipRegion.w
	local width = panel.baseClipRegion.z
	local itemSize = self.itemMinHeight
	local lastIndex = #self.infos_
	local maxDeltaY = 0
	local allHeight = 0
	local deltaY = 0

	for i = 1, currIndex - 1 do
		deltaY = deltaY + getHeightFun(i)
	end

	for i = 1, lastIndex do
		allHeight = allHeight + getHeightFun(i)
	end

	maxDeltaY = allHeight - height

	if deltaY <= height then
		deltaY = 0
	end

	deltaY = math.min(deltaY, maxDeltaY)

	self.scrollView_:MoveRelative(Vector3(0, deltaY, 0))
end

return UnequalWrapContent
