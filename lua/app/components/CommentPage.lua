-- chunkname: @../../../Product/Bundles/Android/src/app/components/CommentPage.lua

local CommentPage = class("CommentPage")
local CommentNode = import(".CommentNode")
local ITEM_GAP = 16

function CommentPage:ctor(go, parent, tableId)
	self.go_ = go
	self.parent_ = parent
	self.tableId = tableId

	self:getUIComponent()

	self.comment_ = xyd.models.partnerComment
	self.items_ = {}

	self:initSpringTable()
end

function CommentPage:getUIComponent()
	self.tableContainer_ = self.go_:NodeByName("scroller/container").gameObject
	self.uiPanel_ = self.go_:ComponentByName("scroller", typeof(UIPanel))
	self.uiScroll_ = self.go_:ComponentByName("scroller", typeof(UIScrollView))
	self.itemPrefab_ = self.go_:NodeByName("item").gameObject

	self.itemPrefab_:SetActive(false)

	local dragBox = self.go_:NodeByName("drag").gameObject

	self.dragWidget_ = dragBox:GetComponent(typeof(UIWidget))
	UIEventListener.Get(dragBox).onClick = handler(self, self.onDragStart)
	UIEventListener.Get(dragBox).onDragStart = handler(self, self.onDragStart)
	UIEventListener.Get(dragBox).onDrag = handler(self, self.onDrag)
	UIEventListener.Get(dragBox).onDragEnd = handler(self, self.onDragEnd)
end

function CommentPage:onDragStart()
	self:clearSpringQueue()
end

function CommentPage:onDrag()
	return
end

function CommentPage:onDragEnd()
	return
end

function CommentPage:init()
	local itemHeight = self:getItemHeight()
	local panelHeight = self:getOriginPanelHeight()
	local itemNum = math.ceil(panelHeight / itemHeight) + 2

	self.displayNum_ = itemNum
	self.worldCorners_ = self.uiPanel_.worldCorners:Clone()

	NGUITools.DestroyChildren(self.tableContainer_.transform)

	for i = -1, -itemNum, -1 do
		local nextItem = NGUITools.AddChild(self.tableContainer_, self.itemPrefab_)

		nextItem.name = "item_" .. i

		nextItem.transform:SetLocalPosition(0, (i + 1) * itemHeight, 0)
		nextItem:SetActive(true)

		self.items_[i] = self:newMessageNode(nextItem, i)
	end

	local scp = self.tableContainer_:GetComponent(typeof(FlexibleWrapContent))

	scp = scp or self.tableContainer_:AddComponent(typeof(FlexibleWrapContent))
	self.scp_ = scp
	scp.cullContent = false
	scp.minIndex = -math.max(self:getInfoSize(), itemNum)
	scp.maxIndex = math.max(self:getInfoSize(), itemNum) - 1
	scp.onInitializeItem = handler(self, self.onInitializeItem)

	scp:SortBasedOnScrollMovement()
	scp:WrapContent()
	XYDCo.WaitForFrame(1, function()
		if self.isDisposed_ then
			return
		end

		scp.onScroll = handler(self, self.onClipMove)
		self.isInit_ = true
		self.isIniting_ = false
	end, nil)
end

function CommentPage:onClipMove()
	if self.isDisposed_ then
		return
	end

	for i = -1, -self.displayNum_, -1 do
		local item = self.items_[i]

		if item then
			item:onClipMove()
		end
	end
end

function CommentPage:initSpringTable()
	self.springQueue_ = {
		push = function(self, cnode)
			if not self.endIndex or cnode.index2 < self.endIndex then
				self.endIndex = cnode.index2
			end

			if not self.topIndex then
				self.topIndex = cnode.index1
			end
		end,
		front = function(self)
			return self.topIndex, self.endIndex
		end,
		pop = function(self)
			self.topIndex = self.topIndex - 1
		end,
		size = function(self)
			if self.topIndex == nil or self.endIndex == nil then
				return 0
			end

			return self.topIndex - self.endIndex + 1
		end,
		clear = function(self)
			self.topIndex = nil
			self.endIndex = nil
		end
	}
end

function CommentPage:getItemHeight()
	return 86 + ITEM_GAP
end

function CommentPage:getOriginPanelHeight()
	return self:getPanelHeight()
end

function CommentPage:getPanelHeight()
	return self.uiPanel_.height
end

function CommentPage:getFinalClipRegion()
	return self.uiPanel_.finalClipRegion
end

function CommentPage:getInfos()
	local info = {}
	local hotComment = self.comment_:getHotComment(self.tableId)
	local allComment = self.comment_:getComments(self.tableId)

	for k, v in pairs(hotComment) do
		local tmpV = table.clone(v)

		tmpV.type = 1
		tmpV.index = k

		table.insert(info, tmpV)
	end

	for k, v in pairs(allComment) do
		local tmpV = table.clone(v)

		tmpV.type = 2
		tmpV.index = k

		table.insert(info, tmpV)
	end

	return info
end

function CommentPage:getInfoSize()
	return #self:getInfos()
end

function CommentPage:getViewSize()
	if self.panelViewSize_ == nil then
		self.panelViewSize_ = self.uiPanel_:GetViewSize()
	end

	return self.panelViewSize_
end

function CommentPage:newMessageNode(go, index)
	return CommentNode.new(go, index, self)
end

function CommentPage:updateHeight(hashCode, height)
	self.comment_:updateHeight(hashCode, height)
end

function CommentPage:getTotalHeight()
	return self.comment_:getTotalHeight()
end

function CommentPage:getScrollView()
	return self.uiScroll_
end

function CommentPage:clearSpringQueue()
	self.springQueue_:clear()
end

function CommentPage:updateUnreadStatus(realIndex)
	local id = self:realIndex2ID(realIndex)
end

function CommentPage:checkShowDown()
	local item = self:getItemByRealIndex(self.scp_.minIndex)

	if not item then
		return true
	end

	return not item:isShowingInPanel()
end

function CommentPage:setInfo()
	self.currentMaxID_ = self:getInfoSize()
	self.currentMinID_ = 1
end

function CommentPage:onInitializeItem(go, wrapIndex, realIndex)
	wrapIndex = tonumber(string.sub(go.name, 6))

	local item = self.items_[wrapIndex]

	if item == nil then
		return
	end

	item:setRealIndex(realIndex)
	item:refresh()

	if not self.isInit_ then
		if wrapIndex < -1 then
			local nearbyItem = self.items_[wrapIndex + 1]

			self:fixPosOneItem(item, nearbyItem:getPos(), -nearbyItem:getHeight())
		end
	elseif item:needFixPos() then
		local oldIndex = item:getOldRealIndex()
		local curIndex = item:getRealIndex()

		if oldIndex < curIndex then
			local nearbyItem = self:getItemByRealIndex(item:getRealIndex() - 1)

			if nearbyItem ~= nil then
				self:fixPosOneItem(item, nearbyItem:getPos(), item:getHeight())
			end
		else
			local nearbyItem = self:getItemByRealIndex(item:getRealIndex() + 1)
			local newPos

			if nearbyItem ~= nil then
				self:fixPosOneItem(item, nearbyItem:getPos(), -nearbyItem:getHeight())
			end
		end
	end
end

function CommentPage:fixPosOneItem(item, pos, offsetHeight)
	item:fixPos(pos.x, pos.y + offsetHeight, 0)
end

function CommentPage:getItemByRealIndex(realIndex)
	for _, entry in pairs(self.items_) do
		if entry:getRealIndex() == realIndex then
			return entry
		end
	end

	return nil
end

function CommentPage:getCommnetInfoByRealIndex(realIndex)
	local id = self:realIndex2ID(realIndex)
	local infos = self:getInfos()

	return infos[id]
end

function CommentPage:realIndex2ID(realIndex)
	local id = self.currentMaxID_ + self.scp_.minIndex - realIndex

	return id
end

function CommentPage:ID2RealIndex(ID)
	return self.currentMaxID_ + self.scp_.minIndex - ID
end

function CommentPage:refreshAll(ignoreScroll)
	local maxIndex = xyd.MIN_INT32
	local startIndex = -1

	for i = -1, -self.displayNum_, -1 do
		local item = self.items_[i]
		local realIndex = item:getRealIndex()

		if maxIndex < realIndex then
			maxIndex = realIndex
			startIndex = i
		end
	end

	for i = startIndex, -self.displayNum_, -1 do
		local item = self.items_[i]

		self:onInitializeItem(item:getGameObject(), -1 - i, item:getRealIndex())
	end

	for i = -1, startIndex + 1, -1 do
		local item = self.items_[i]

		self:onInitializeItem(item:getGameObject(), -1 - i, item:getRealIndex())
	end
end

return CommentPage
