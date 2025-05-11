-- chunkname: @../../../Product/Bundles/Android/src/app/components/PrivatePage.lua

local PrivatePage = class("PrivatePage", import("app.components.ChatPage"))

function PrivatePage:ctor(go, parent)
	PrivatePage.super.ctor(self, go, parent)

	self.heightCache_ = {}
	self.totalHeight_ = 0
end

function PrivatePage:setInfo(data)
	self.infoType_ = xyd.MsgType.PRIVATE
	self.infos_ = data
	self.currentMaxID_ = self:getInfoSize()
	self.currentMinID_ = 1
	self.heightCache_ = {}
	self.totalHeight_ = 0
end

function PrivatePage:getInfos()
	return self.infos_
end

function PrivatePage:updateHeight(dataType, hashCode, height)
	local curTotalHeight = self.totalHeight_ or 0
	local oldHeight = self.heightCache_[hashCode]

	if oldHeight == nil then
		self.heightCache_[hashCode] = height
		curTotalHeight = curTotalHeight + height
	elseif oldHeight ~= height then
		self.heightCache_[hashCode] = height
		curTotalHeight = curTotalHeight + height - oldHeight
	end

	self.totalHeight_ = curTotalHeight
end

function PrivatePage:getTotalHeight()
	return self.totalHeight_
end

function PrivatePage:getTopScrollNum()
	return 4
end

function PrivatePage:addNewMsg(data)
	data.hashCode = #self.infos_ + 1

	table.insert(self.infos_, data)

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

		if currentMaxID <= 4 then
			self:insertToTailLess5(oldBotIndex - 1, currentBotIndex)
		else
			self:insertToTail(oldBotIndex - 1, currentBotIndex)
		end
	end
end

function PrivatePage:insertToTail(index1, index2)
	local cnode = {
		index1 = index1,
		index2 = index2
	}

	if self.springQueue_:size() > 0 then
		self.springQueue_:push(cnode)
	else
		local oldBotIndex = self.scp_.minIndex - 1
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

return PrivatePage
