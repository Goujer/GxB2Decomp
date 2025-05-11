-- chunkname: @../../../Product/Bundles/Android/src/app/components/ChatPage.lua

local ChatPage = class("ChatPage")
local ChatNode = import(".ChatNode")
local ITEM_GAP = 16

function ChatPage:ctor(go, parent)
	self.go_ = go
	self.parent_ = parent
	self.isIniting_ = true

	self:getUIComponent()

	self.chat_ = xyd.models.chat
	self.infoType_ = xyd.MsgType.NORMAL
	self.items_ = {}

	self:initSpringTable()
end

function ChatPage:getUIComponent()
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

function ChatPage:getUIpanel()
	return self.uiPanel_
end

function ChatPage:onDragStart()
	self.stopAutoMove_ = true

	self:clearSpringQueue()
end

function ChatPage:onDrag(...)
	self.stopAutoMove_ = true
end

function ChatPage:onDragEnd()
	self.stopAutoMove_ = false
end

function ChatPage:init()
	local itemHeight = self:getItemHeight()
	local panelHeight = self:getOriginPanelHeight()
	local itemNum = math.ceil(panelHeight / itemHeight) + 2

	self.displayNum_ = itemNum
	self.worldCorners_ = self.uiPanel_.worldCorners:Clone()

	for i = -1, -itemNum, -1 do
		local nextItem = NGUITools.AddChild(self.tableContainer_, self.itemPrefab_)

		nextItem.name = "item_" .. i

		nextItem:SetLocalPosition(0, (i + 1) * itemHeight, 0)

		nextItem:GetComponent(typeof(UIWidget)).height = itemHeight

		nextItem:SetActive(true)

		self.items_[i] = self:newMessageNode(nextItem, i)
	end

	local scp = self.tableContainer_:AddComponent(typeof(FlexibleWrapContent))

	self.scp_ = scp
	scp.cullContent = false
	scp.minIndex = -itemNum
	scp.maxIndex = scp.minIndex + math.max(self:getInfoSize(), itemNum) - 1
	scp.onInitializeItem = handler(self, self.onInitializeItem)

	scp:SortBasedOnScrollMovement()
	scp:WrapContent()
	XYDCo.WaitForFrame(1, function()
		if self.isDisposed_ then
			return
		end

		scp.onScroll = handler(self, self.onClipMove)
		self.isInit_ = true

		self:initScroll()

		self.isIniting_ = false
	end, nil)
end

function ChatPage:updateMaxNum()
	if not self.isIniting_ and self.displayNum_ then
		self.scp_.minIndex = -self.displayNum_
		self.scp_.maxIndex = self.scp_.minIndex + math.max(self:getInfoSize(), self.displayNum_) - 1
	end
end

function ChatPage:onClipMove()
	if self.isDisposed_ then
		return
	end

	for i = -1, -self.displayNum_, -1 do
		local item = self.items_[i]

		if item then
			item:onClipMove()
		end
	end

	self.parent_:onScrollChange()
end

function ChatPage:initSpringTable()
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

function ChatPage:getItemHeight()
	return 86 + ITEM_GAP
end

function ChatPage:getOriginPanelHeight()
	return self:getPanelHeight()
end

function ChatPage:getPanelHeight()
	return self.uiPanel_.height
end

function ChatPage:getFinalClipRegion()
	return self.uiPanel_.finalClipRegion
end

function ChatPage:setInfoType(selectType)
	self.infoType_ = selectType
	self.currentMaxID_ = self:getInfoSize()
	self.currentMinID_ = 1

	self:updateMaxNum()
end

function ChatPage:getInfos()
	local infos = self.chat_:getMsgsByTypeWithFilter(self.infoType_)

	return infos
end

function ChatPage:getInfoSize()
	return #self:getInfos()
end

function ChatPage:getViewSize()
	if self.panelViewSize_ == nil then
		self.panelViewSize_ = self.uiPanel_:GetViewSize()
	end

	return self.panelViewSize_
end

function ChatPage:newMessageNode(go, index)
	return ChatNode.new(go, index, self)
end

function ChatPage:updateHeight(dataType, hashCode, height)
	self.chat_:updateHeight(dataType, hashCode, height)
end

function ChatPage:getTotalHeight()
	return self.chat_:getTotalHeight(self.infoType_)
end

function ChatPage:getScrollView()
	return self.uiScroll_
end

function ChatPage:clearSpringQueue()
	self.springQueue_:clear()
end

function ChatPage:updateUnreadStatus(realIndex)
	local id = self:realIndex2ID(realIndex)

	self.parent_:updateUnreadStatus(id)
end

function ChatPage:checkShowDown()
	local item = self:getItemByRealIndex(self.scp_.minIndex)

	if not item then
		return true
	end

	return not item:isShowingInPanel()
end

function ChatPage:onInitializeItem(go, wrapIndex, realIndex)
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

function ChatPage:fixPosOneItem(item, pos, offsetHeight)
	item:fixPos(pos.x, pos.y + offsetHeight, 0)
end

function ChatPage:getItemByRealIndex(realIndex)
	for _, entry in pairs(self.items_) do
		if entry:getRealIndex() == realIndex then
			return entry
		end
	end

	return nil
end

function ChatPage:getChatInfoByRealIndex(realIndex)
	local id = self:realIndex2ID(realIndex)
	local infos = self:getInfos()

	return infos[id]
end

function ChatPage:realIndex2ID(realIndex)
	local id = self.currentMaxID_ + self.scp_.minIndex - realIndex

	return id
end

function ChatPage:ID2RealIndex(ID)
	return self.currentMaxID_ + self.scp_.minIndex - ID
end

function ChatPage:initScroll()
	if not self.isInit_ then
		return
	end

	self:clearSpringQueue()

	local botItem = self:getItemByRealIndex(self:ID2RealIndex(self.currentMaxID_))
	local topItem = self:getItemByRealIndex(self:ID2RealIndex(self.currentMinID_))

	if botItem ~= nil and topItem ~= nil then
		local panelHeight = self:getPanelHeight()
		local totalHeight = self:getTotalHeight()

		if totalHeight < panelHeight then
			self:scrollToItem(topItem, false, true)
		else
			self:scrollToItem(botItem, false, false, true)
		end
	else
		if botItem == nil then
			local minIndex

			for _, item in pairs(self.items_) do
				if minIndex == nil or minIndex > item:getRealIndex() then
					minIndex = item:getRealIndex()
					botItem = item
				end
			end
		end

		self:scrollToItem(botItem, false, false, true)
	end
end

function ChatPage:scrollToItem(item, momentumAndSpring, stopInTop, stopInBot, onFinished)
	if self.currentMaxID_ == -1 then
		return false
	end

	if item == nil then
		return false
	end

	local bounds = NGUITools.CalculateRelativeWidgetBounds(self.uiPanel_.transform, item:getGameObject().transform)

	if stopInTop then
		bounds:Encapsulate(bounds.max - Vector3(bounds.max.x, self.uiPanel_.height, bounds.max.z))
	elseif stopInBot then
		bounds:Encapsulate(bounds.min + Vector3(bounds.min.x, self.uiPanel_.height, bounds.min.z))
	end

	local constraint = self.uiPanel_:CalculateConstrainOffset(bounds.min, bounds.max)

	if momentumAndSpring == true then
		local pos = self.uiPanel_.transform.localPosition + constraint

		pos.x = Mathf.Round(pos.x)
		pos.y = Mathf.Round(pos.y)

		local sp = SpringPanel.Begin(self.uiPanel_.gameObject, pos, 8)

		function sp.onFinished()
			if onFinished ~= nil then
				onFinished()
			end
		end
	else
		local sp = self.go_:ComponentByName("scroller", typeof(SpringPanel))

		if not tolua.isnull(sp) then
			sp.enabled = false
		end

		self.uiScroll_:MoveRelative(constraint)
	end

	return true
end

function ChatPage:addNewMsg(data)
	local currentMaxID = self:getInfoSize()
	local currentMinID = 1
	local oldBotIndex = self.scp_.minIndex
	local oldTopIndex = self:ID2RealIndex(self.currentMinID_)
	local currentBotIndex = self:ID2RealIndex(currentMaxID)
	local currentTopIndex = self:ID2RealIndex(currentMinID)
	local hasChanged = false

	if currentMaxID > self.currentMaxID_ then
		self.scp_.minIndex = currentBotIndex
		self.currentMaxID_ = currentMaxID

		if currentMaxID <= 5 then
			self:insertToTailLess5(oldBotIndex - 1, currentBotIndex)
		else
			self:insertToTail(oldBotIndex - 1, currentBotIndex)
		end

		hasChanged = true
	end
end

function ChatPage:getTopScrollNum()
	return 2
end

function ChatPage:insertToTail(index1, index2)
	local cnode = {
		index1 = index1,
		index2 = index2
	}

	if self.springQueue_:size() > 0 then
		self.springQueue_:push(cnode)
	else
		local oldBotIndex = self.scp_.minIndex
		local num = self:getTopScrollNum()
		local item = self:getItemByRealIndex(oldBotIndex + num)

		if item and item:isShowingInPanel() then
			local panelHeight = self:getPanelHeight()
			local totalHeight = self:getTotalHeight()

			if totalHeight <= panelHeight then
				self.springQueue_:push({
					index1 = index1,
					index2 = index2
				})
				self:scrollSpringQueue()
			else
				for i = oldBotIndex + 4, oldBotIndex, -1 do
					local item = self:getItemByRealIndex(i)

					if not item then
						cnode.index1 = i + 1

						break
					end
				end

				self.springQueue_:push(cnode)
				self:scrollSpringQueue()
			end
		end
	end
end

function ChatPage:scrollSpringQueue()
	if self.springQueue_:size() == 0 then
		return
	end

	local firstIndex, _ = self.springQueue_:front()
	local item = self:getItemByRealIndex(firstIndex)
	local flag = false

	if not item then
		self.uiScroll_:MoveRelative(Vector3(0, 10, 0))

		item = self:getItemByRealIndex(firstIndex)
		flag = true
	end

	if item then
		local function callback()
			self.springQueue_:pop()
			self:scrollSpringQueue()
		end

		self:scrollToItem(item, true, nil, nil, callback)
	end
end

function ChatPage:insertToTailLess5(firstIndex)
	local item = self:getItemByRealIndex(firstIndex)

	if not item then
		self.uiScroll_:MoveRelative(Vector3(0, 10, 0))

		item = self:getItemByRealIndex(firstIndex)
	end

	if item then
		self:scrollToItem(item, false, nil, nil, nil)
		self.uiScroll_:ResetPosition()
	end
end

function ChatPage:refreshAll(ignoreScroll)
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

	if not ignoreScroll then
		self:initScroll()
	end
end

function ChatPage:scrollToBottom()
	self.nextScrollToID_ = self.currentMaxID_
	self.stopAutoMove_ = false

	self:scrollToItemByID(true)
end

function ChatPage:scrollToItemByInfoID(id)
	self.nextScrollToID_ = id
	self.stopAutoMove_ = false

	self:scrollToItemByID()
end

function ChatPage:scrollToItemByID(forceDown)
	if self.nextScrollToID_ == nil then
		return
	end

	if self.stopAutoMove_ then
		self.stopAutoMove_ = false

		XYDCo.StopWait("autoMove_chat_window")

		return
	end

	local realIndex = self:ID2RealIndex(self.nextScrollToID_)
	local item
	local isMoveUp = true
	local effectNum = 0
	local lessNum = 0

	if realIndex == nil then
		self.nextScrollToID_ = nil
		self.isDoScrollToItem_ = false

		return
	end

	local maxIndex = 0

	for _, entry in pairs(self.items_) do
		local index = entry:getRealIndex()

		if index ~= nil then
			effectNum = effectNum + 1

			if index < realIndex then
				lessNum = lessNum + 1
			elseif index == realIndex then
				item = entry
			end

			if maxIndex < index then
				maxIndex = index
			end
		end
	end

	if item ~= nil then
		local delta = item:getTopOffset()

		isMoveUp = delta > self:getViewSize().y / -2

		if forceDown then
			isMoveUp = false
		end

		self:scrollToItem(item, true, isMoveUp, not isMoveUp)

		self.nextScrollToID_ = nil
		self.isDoScrollToItem_ = false

		return
	else
		isMoveUp = lessNum == effectNum
	end

	local moveY = isMoveUp and 1 or -1

	self.uiScroll_:Scroll(moveY)
	XYDCo.WaitForFrame(1, function()
		if self.isDisposed_ then
			return
		end

		self:scrollToItemByID(forceDown)
	end, "autoMove_chat_window")
end

function ChatPage:resetScroll()
	self.uiScroll_:Scroll(0.1)
end

return ChatPage
