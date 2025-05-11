-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/FixedMultiWrapContent.lua

local FixedMultiWrapContent = class("FixedMultiWrapContent")
local AddChild = NGUITools.AddChild

function FixedMultiWrapContent:ctor(scrollView, wrapContent, cloneItem, itemClass, parent)
	self.parent_ = parent
	self.items_ = {}
	self.infos_ = {}
	self.scrollView_ = scrollView
	self.scrollViewPanel_ = scrollView:GetComponent(typeof(UIPanel))
	self.wrapContent_ = wrapContent
	self.cloneItem_ = cloneItem
	self.itemClass_ = itemClass
	self.rowWidth_ = wrapContent.rowWidth
	self.rowNum_ = wrapContent.rowNum
	self.itemSize_ = wrapContent.itemSize
	self.wrapContent_.cullContent = false
	self.wrapContent_.onInitializeItem = handler(self, self.updateItem)

	if self.cloneItem_.activeSelf then
		self.cloneItem_:SetActive(false)
	end

	self.movement_ = scrollView:GetComponent(typeof(UIScrollView)).movement

	xyd.updateParentAnchors(scrollView.transform)

	if self.isExtraNum == nil then
		self:resetContentSize()
	end
end

function FixedMultiWrapContent:getParent()
	return self.parent_
end

function FixedMultiWrapContent:setInfos(infos, params)
	self.infos_ = infos

	local currNum

	if params.currNum then
		currNum = params.currNum
	else
		currNum = #self.infos_
	end

	self.wrapContent_.minIndex = math.min(-1, -(currNum - 1))
	self.wrapContent_.maxIndex = 0
	params = params or {}

	if params.scrollPos then
		for _, item in pairs(self.items_) do
			item:getGameObject():SetActive(true)
		end

		self.wrapContent_:SortBasedOnScrollMovement()

		local currPos = self.scrollView_.transform.localPosition

		self.scrollView_:MoveRelative(params.scrollPos - currPos)
		self.scrollView_:InvalidateBounds()
		self.wrapContent_:WrapContent()
	elseif params.keepPosition and currNum > 0 then
		self.wrapContent_:UpdateCurrentItems()
		self:invalidateBounds()
	else
		self:resetPosition()
	end
end

function FixedMultiWrapContent:invalidateBounds()
	self.scrollView_:InvalidateBounds()
	self.scrollView_:RestrictWithinBounds(false, self.scrollView_.canMoveHorizontally, self.scrollView_.canMoveVertically)
end

function FixedMultiWrapContent:resetPosition()
	if not tolua.isnull(self.scrollView_) then
		for _, item in pairs(self.items_) do
			item:getGameObject():SetActive(true)
		end

		self.wrapContent_:SortBasedOnScrollMovement()
		self.scrollView_:ResetPosition()
	end
end

function FixedMultiWrapContent:resetScrollView()
	self.wrapContent_:SortBasedOnScrollMovement()
	self.scrollView_:ResetPosition()
end

function FixedMultiWrapContent:updateItem(go, wrapIndex, realIndex)
	local index = self:fixRealIndex(go, wrapIndex, realIndex)
	local item = self.items_[wrapIndex + 1]
	local info = self.infos_[index]

	item:update(wrapIndex, index, info)
	self:update()
end

function FixedMultiWrapContent:update()
	return
end

function FixedMultiWrapContent:fixRealIndex(go, wrapIndex, realIndex)
	local yIndex = Mathf.Abs(Mathf.Floor(go.transform.localPosition.y / self.itemSize_))
	local xIndex = Mathf.Abs(Mathf.Floor(go.transform.localPosition.x / self.rowWidth_))
	local realIndex = self.rowNum_ * yIndex + xIndex + 1

	return realIndex
end

function FixedMultiWrapContent:setItemSize(itemSize)
	if itemSize == self.itemSize_ then
		return
	end

	self.wrapContent_.itemSize = itemSize
	self.itemSize_ = itemSize

	self:resetContentSizeByChange()
end

function FixedMultiWrapContent:reResetContentSize()
	NGUITools.DestroyChildren(self.wrapContent_.transform)
	self:resetContentSize()
end

function FixedMultiWrapContent:resetContentSize()
	local displayNum = (math.ceil(self.scrollViewPanel_.baseClipRegion.w / self.itemSize_) + 1) * self.rowNum_
	local childCount = self.wrapContent_.transform.childCount

	self.items_ = {}

	for i = 1, displayNum do
		local go

		if i <= childCount then
			go = self.wrapContent_.transform:GetChild(i - 1).gameObject
		else
			go = AddChild(self.wrapContent_.gameObject, self.cloneItem_)
		end

		local key = tostring(i)

		go.name = key
		self.items_[i] = self.itemClass_.new(go, self.parent_)
	end

	for j = displayNum + 1, childCount do
		local go = self.wrapContent_.transform:GetChild(j - 1).gameObject
		local key = tostring(j)

		go.name = key
		self.items_[j] = self.itemClass_.new(go, self.parent_)
	end

	self.wrapContent_:SortBasedOnScrollMovement()
end

function FixedMultiWrapContent:resetContentSizeByChange()
	local displayNum = (math.ceil(self.scrollViewPanel_.baseClipRegion.w / self.itemSize_) + 1) * self.rowNum_
	local childCount = self.wrapContent_.transform.childCount

	if childCount < displayNum then
		for i = childCount + 1, displayNum do
			local go = AddChild(self.wrapContent_.gameObject, self.cloneItem_)
			local key = tostring(i)

			go.name = key
			self.items_[i] = self.itemClass_.new(go, self.parent_)
		end
	end

	self.wrapContent_:SortBasedOnScrollMovement()
end

function FixedMultiWrapContent:getItems()
	return self.items_
end

function FixedMultiWrapContent:getInfos()
	return self.infos_
end

function FixedMultiWrapContent:updateInfo(index, info)
	self.infos_[index] = info
end

function FixedMultiWrapContent:getScrollView()
	return self.scrollView_
end

function FixedMultiWrapContent:getWrapContent()
	return self.wrapContent_
end

function FixedMultiWrapContent:getScrollViewPos()
	return self.scrollView_.transform.localPosition
end

function FixedMultiWrapContent:jumpToIndex(currIndex, offset, ifNotReturn)
	local currLine = math.ceil(currIndex / self.rowNum_)
	local height = self.scrollViewPanel_.baseClipRegion.w
	local itemSize = self.itemSize_
	local currHeight = (currLine - 0.5) * itemSize
	local currHeight2 = currHeight + itemSize / 2

	if currHeight2 <= height and ifNotReturn == false then
		return
	end

	local maxIndex = #self.infos_
	local maxHeight = math.ceil(maxIndex / self.rowNum_) * itemSize
	local centerHeight = height / 2
	local deltaY = currHeight - centerHeight
	local deltaY2 = maxHeight - height
	local delta = math.min(deltaY, deltaY2) + (offset or 0)

	self.scrollView_:MoveRelative(Vector3(0, delta, 0))
	self.wrapContent_:WrapContent()
end

function FixedMultiWrapContent:jumpToInfo2(info)
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
	local itemSize = self.wrapContent_.itemSize
	local lastIndex = #self.infos_

	if self:isHorizontal() then
		local width2 = lastIndex * itemSize

		if width2 <= width then
			return
		end

		local displayNum = math.ceil(width / itemSize)
		local half = math.floor(displayNum / 2)

		if currIndex <= half then
			return
		end

		local maxDeltaX = width2 - width
		local deltaX = currIndex * itemSize - width / 2 - itemSize / 2
		local oldPos = self.scrollView_.transform.localPosition.x

		deltaX = math.min(deltaX, maxDeltaX)
		deltaX = math.max(-oldPos, deltaX)

		self.scrollView_:MoveRelative(Vector3(-deltaX, 0, 0))
		self.wrapContent_:WrapContent()
	else
		local height2 = lastIndex * itemSize

		if height2 <= height then
			return
		end

		local displayNum = math.ceil(height / itemSize)
		local half = math.floor(displayNum / 2)

		if currIndex <= half then
			return
		end

		local maxDeltaY = height2 - height
		local deltaY = currIndex * itemSize - height / 2 - itemSize / 2

		deltaY = math.min(deltaY, maxDeltaY)

		self.scrollView_:MoveRelative(Vector3(0, deltaY, 0))
		self.wrapContent_:WrapContent()
	end
end

function FixedMultiWrapContent:isHorizontal()
	return tostring(self.movement_) == "Horizontal"
end

function FixedMultiWrapContent:jumpToInfo(info)
	for index, info2 in ipairs(self.infos_) do
		if info2 == info then
			self:jumpToIndex(index)

			return
		end
	end
end

function FixedMultiWrapContent:isShowing(item, detalY)
	detalY = detalY or 10

	local finalClipRegion = self.scrollView_:GetComponent(typeof(UIPanel)).finalClipRegion
	local itemY = item:getGameObject().transform.localPosition.y

	if item:activeSelf() and math.abs(itemY - finalClipRegion.y) <= finalClipRegion.w / 2 + detalY then
		return true
	end

	return false
end

return FixedMultiWrapContent
