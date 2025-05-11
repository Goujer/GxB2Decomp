-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/FixedWrapContent.lua

local FixedWrapContent = class("FixedWrapContent")
local AddChild = NGUITools.AddChild

function FixedWrapContent:ctor(scrollView, wrapContent, cloneItem, itemClass, parent)
	self.parent_ = parent
	self.items_ = {}
	self.infos_ = {}
	self.scrollView_ = scrollView
	self.wrapContent_ = wrapContent
	self.cloneItem_ = cloneItem
	self.itemClass_ = itemClass
	self.wrapContent_.cullContent = false
	self.wrapContent_.onInitializeItem = handler(self, self.updateItem)

	self.cloneItem_:SetActive(false)

	self.movement_ = scrollView:GetComponent(typeof(UIScrollView)).movement

	self:resetContentSize(true)
end

function FixedWrapContent:getParent()
	return self.parent_
end

function FixedWrapContent:isHorizontal()
	return tostring(self.movement_) == "Horizontal"
end

function FixedWrapContent:setInfos(infos, params)
	local lastNum = #self.infos_

	self.infos_ = infos

	local currNum = #self.infos_

	if self:isHorizontal() then
		local minIndex = currNum

		self.wrapContent_.minIndex = 0
		self.wrapContent_.maxIndex = math.max(1, minIndex - 1)
	else
		local minIndex = -currNum

		self.wrapContent_.minIndex = math.min(-1, minIndex + 1)
		self.wrapContent_.maxIndex = 0
	end

	params = params or {}

	if params.scrollPos then
		for _, item in pairs(self.items_) do
			item:getGameObject():SetActive(true)
		end

		self.wrapContent_:SortBasedOnScrollMovement()

		local currPos = self.scrollView_.transform.localPosition

		self.scrollView_:MoveRelative(params.scrollPos - currPos)
		self.scrollView_:InvalidateBounds()
	elseif params.keepPosition and currNum > 0 then
		self.wrapContent_:UpdateCurrentItems()
		self.scrollView_:InvalidateBounds()
		self.scrollView_:RestrictWithinBounds(false)
	else
		self:resetPosition()
	end
end

function FixedWrapContent:resetPosition()
	for _, item in pairs(self.items_) do
		item:getGameObject():SetActive(true)
	end

	self.wrapContent_:SortBasedOnScrollMovement()
	self.scrollView_:ResetPosition()
end

function FixedWrapContent:hideItems()
	for _, item in pairs(self.items_) do
		item:getGameObject():SetActive(false)
	end
end

function FixedWrapContent:updateItem(go, wrapIndex, realIndex)
	local index = -(realIndex - 1)

	if self:isHorizontal() then
		index = realIndex + 1
	end

	local item = self.items_[go.name]
	local info = self.infos_[index]

	item:update(index, info)
end

function FixedWrapContent:refresh()
	local items = self:getItems()

	for _, item in pairs(items) do
		item:refresh()
	end
end

function FixedWrapContent:setItemSize(itemSize)
	self.wrapContent_.itemSize = itemSize

	self:resetContentSize()
end

function FixedWrapContent:resetContentSize(init)
	local panel = self.scrollView_:GetComponent(typeof(UIPanel))

	if init then
		xyd.updateParentAnchors(panel.transform)
	end

	panel:ResetAndUpdateAnchors()

	local sizeLen = panel.baseClipRegion.w

	if self:isHorizontal() then
		sizeLen = panel.baseClipRegion.z
	end

	local itemSize = self.wrapContent_.itemSize
	local displayNum = math.ceil(sizeLen / itemSize) + 2
	local childCount = self.wrapContent_.transform.childCount

	if childCount < displayNum then
		for i = childCount + 1, displayNum do
			local go = AddChild(self.wrapContent_.gameObject, self.cloneItem_)
			local realIndex = -i

			if self:isHorizontal() then
				realIndex = i

				go:SetLocalPosition((i - 1) * itemSize, 0, 0)
			else
				go:SetLocalPosition(0, (-i + 1) * itemSize, 0)
			end

			local key = tostring(realIndex)

			go.name = key
			self.items_[key] = self.itemClass_.new(go, self.parent_)
		end
	end
end

function FixedWrapContent:getItems()
	return self.items_
end

function FixedWrapContent:getInfos()
	return self.infos_
end

function FixedWrapContent:getScrollView()
	return self.scrollView_
end

function FixedWrapContent:getWrapContent()
	return self.wrapContent_
end

function FixedWrapContent:getScrollViewPos()
	return self.scrollView_.transform.localPosition
end

function FixedWrapContent:jumpToInfo(info)
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

return FixedWrapContent
