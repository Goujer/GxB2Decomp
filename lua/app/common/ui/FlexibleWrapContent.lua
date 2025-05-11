-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/FlexibleWrapContent.lua

local LuaFlexibleWrapContent = class("LuaFlexibleWrapContent")

function LuaFlexibleWrapContent:ctor(go, itemClass, cloneItem, tableContainer, scrollView, scrollY, parent)
	self.section_ = go
	self.itemClass_ = itemClass
	self.itemPrefab_ = cloneItem

	self.itemPrefab_:SetActive(false)

	self.tableContainer_ = tableContainer
	self.scrollView_ = scrollView

	self.scrollView_:ResetPosition()

	if scrollY then
		local nowY = self.scrollView_.transform.localPosition.y

		self.scrollView_:MoveRelative(Vector3(0, scrollY - nowY, 0))
	end

	self.items_ = {}
	self.isInit_ = false
	self.itemNum_ = 0
	self.parent = parent

	self:init()
end

function LuaFlexibleWrapContent:init()
	local itemHeight = self.itemPrefab_:GetComponent(typeof(UIWidget)).height + self:getItemGap()
	local panel = self.section_:GetComponent(typeof(UIPanel))

	xyd.updateParentAnchors(panel.transform)

	local panelHeight = panel.height
	local itemNum = math.ceil(panelHeight / itemHeight) + 4

	self.itemNum_ = itemNum

	for i = -1, -itemNum, -1 do
		local nextItem = NGUITools.AddChild(self.tableContainer_, self.itemPrefab_)

		self.items_[i] = self.itemClass_.new(nextItem, self.parent, i)
		nextItem.name = "item_" .. i
		nextItem.transform.localPosition = Vector3(0, (i + 1) * itemHeight, 0)

		nextItem:SetActive(true)
	end

	self.scp_ = self.tableContainer_:AddComponent(typeof(FlexibleWrapContent))
	self.scp_.cullContent = false
	self.scp_.maxIndex = -1
	self.scp_.minIndex = self:calcMinIndex()
	self.scp_.onInitializeItem = handler(self, self.onInitializeItem)
	self.scp_.onScroll = handler(self, self.onScroll)

	self.scp_:SortBasedOnScrollMovement()
	self.scp_:WrapContent()

	self.isInit_ = true
end

function LuaFlexibleWrapContent:update()
	self.isInit_ = false

	for i = -1, -self.itemNum_, -1 do
		local item = self.items_[i]

		if item then
			item:setRealIndex(i)

			local go = item:getGo()

			go.transform.localPosition = Vector3(0, (i + 1) * self.scp_.itemSize, 0)
		end
	end

	self.scp_.minIndex = self:calcMinIndex()

	self.scp_:SortBasedOnScrollMovement()
	self.scrollView_:ResetPosition()

	self.isInit_ = true
end

function LuaFlexibleWrapContent:onScroll()
	if self.scrollView_ then
		self.scrollView_.restrictWithinPanel = true
	end
end

function LuaFlexibleWrapContent:onInitializeItem(go, wrapIndex, realIndex)
	wrapIndex = tonumber(string.sub(go.name, 6))

	local item = self.items_[wrapIndex]
	local oldIndex = item:getRealIndex()

	item:setRealIndex(realIndex)
	item:refresh()

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

function LuaFlexibleWrapContent:calcMinIndex()
	return -self.itemNum_
end

function LuaFlexibleWrapContent:setDataNum(num)
	self.scp_.minIndex = -num
end

function LuaFlexibleWrapContent:getItemByRealIndex(realIndex)
	for _, entry in pairs(self.items_) do
		if entry:getRealIndex() == realIndex then
			return entry
		end
	end

	return nil
end

function LuaFlexibleWrapContent:realIndex2SortedIndex(realIndex)
	return 0 - realIndex
end

function LuaFlexibleWrapContent:sortedIndex2RealIndex(sortedIndex)
	return 0 - sortedIndex
end

function LuaFlexibleWrapContent:getItemGap()
	return 0
end

function LuaFlexibleWrapContent:getItemInfoByRealIndex(realIndex)
	return
end

function LuaFlexibleWrapContent:infoModel()
	return
end

function LuaFlexibleWrapContent:getScrollY()
	return self.scrollView_.transform.localPosition.y
end

function LuaFlexibleWrapContent:getItems()
	return self.items_
end

function LuaFlexibleWrapContent:dispose()
	self.isDisposed_ = true
end

function LuaFlexibleWrapContent:refreshAll()
	local maxIndex = xyd.MIN_INT32
	local startIndex = -1

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

return LuaFlexibleWrapContent
