-- chunkname: @../../../Product/Bundles/Android/src/app/models/datas/ActivityClockData.lua

local json = require("cjson")
local ActivityData = import("app.models.ActivityData")
local ActivityClockData = class("ActivityClockData", ActivityData, true)

function ActivityClockData:getUpdateTime()
	return self:getEndTime()
end

function ActivityClockData:register()
	self:registerEvent(xyd.event.GET_CLOCK_AWARD, function(event)
		self:onGetTaskAward(event)
	end)
	self:registerEvent(xyd.event.GET_ACTIVITY_AWARD, function(event)
		local data = event.data

		if data.activity_id == xyd.ActivityID.ACTIVITY_CLOCK then
			self:onGetGambleMsg(event)
		end
	end)

	self.specialAward = {}

	local timeStamp = xyd.db.misc:getValue("activity_clock_choose_time_stamp")
	local v1 = xyd.db.misc:getValue("activity_clock_choose_Index_1")
	local v2 = xyd.db.misc:getValue("activity_clock_choose_Index_2")
	local v3 = xyd.db.misc:getValue("activity_clock_choose_Index_3")

	if timeStamp and tonumber(timeStamp) > self:startTime() then
		if v1 then
			self.specialAward[1] = tonumber(v1)
		end

		if v2 then
			self.specialAward[2] = tonumber(v2)
		end

		if v3 then
			self.specialAward[3] = tonumber(v3)
		end
	end
end

function ActivityClockData:getRedMarkState()
	local red = false

	if not self:isFunctionOnOpen() then
		xyd.models.redMark:setMark(xyd.RedMarkType.ACTIVITY_CLOCK, false)

		return false
	end

	if self:isFirstRedMark() then
		xyd.models.redMark:setMark(xyd.RedMarkType.ACTIVITY_CLOCK, true)

		return true
	end

	if self:checkRedMarkOfGamble() then
		red = true
	end

	if self:checkRedMarkOfProgressAward() then
		red = true
	end

	if self:checkRedMarkOfAwardPreview() then
		red = true
	end

	xyd.models.redMark:setMark(xyd.RedMarkType.ACTIVITY_CLOCK, red)

	return red
end

function ActivityClockData:onGetTaskAward(event)
	self.detail.times_awarded = event.data.times_awarded
end

function ActivityClockData:onGetGambleMsg(event)
	local details = require("cjson").decode(event.data.detail)
	local nextFlag = details.next_flag
	local award_ids = details.award_ids

	self.gambleAward = {}
	self.roundAward = {}

	for i = 1, #award_ids do
		local awards = xyd.tables.activityClockGambleTable:getAwards(award_ids[i])

		if #awards == 1 then
			local isSp = true

			for j = 1, 6 do
				if self.detail.ids[j] == award_ids[i] then
					self.detail.lefts[j] = self.detail.lefts[j] - 1
					isSp = false
				end
			end

			local item = {
				item_id = awards[1][1],
				item_num = awards[1][2]
			}

			if isSp then
				item.cool = 1
			end

			table.insert(self.gambleAward, item)
		else
			local chooseIndex = 0
			local awards = xyd.tables.activityClockGambleTable:getAwards(award_ids[i])

			for j = 7, 9 do
				if self.detail.ids[j] == award_ids[i] then
					chooseIndex = self:getChooseIndex(j - 6)
				end
			end

			local item = {
				cool = 1,
				item_id = awards[chooseIndex][1],
				item_num = awards[chooseIndex][2]
			}

			table.insert(self.gambleAward, item)
		end
	end

	if nextFlag then
		for i = 1, 6 do
			if self.detail.lefts[i] > 0 then
				local awards = xyd.tables.activityClockGambleTable:getAwards(self.detail.ids[i])
				local item = {
					item_id = awards[1][1],
					item_num = awards[1][2] * self.detail.lefts[i]
				}

				table.insert(self.roundAward, item)
			end
		end
	end

	self.oldDetail = details.info
	self.nextFlag = nextFlag
end

function ActivityClockData:updateGambleData()
	if self.oldDetail then
		self.detail.ids = self.oldDetail.ids
		self.detail.lefts = self.oldDetail.lefts
		self.detail.times = self.oldDetail.times
		self.detail.times_awarded = self.oldDetail.times_awarded
		self.detail.round = self.oldDetail.round

		if self.nextFlag then
			self.specialAward = {}

			for i = 1, 3 do
				xyd.db.misc:setValue({
					value = 0,
					key = "activity_clock_choose_Index_" .. i
				})
			end
		end

		self.oldDetail = nil
	end
end

function ActivityClockData:getRoundAward()
	return self.roundAward
end

function ActivityClockData:getGambleAward()
	return self.gambleAward
end

function ActivityClockData:getResource1()
	if not self.resCost1 then
		self.resCost1 = xyd.tables.miscTable:split2Cost("activity_clock_cost", "value", "#")
	end

	return self.resCost1
end

function ActivityClockData:getCompleteTime()
	return self.detail.times
end

function ActivityClockData:getAwardRecord(index)
	return self.detail.times_awarded[index]
end

function ActivityClockData:getRadio(index)
	local totalWeight = 0

	for i = 1, 6 do
		local id = self.detail.ids[i]
		local weight = xyd.tables.activityClockGambleTable:getWeight(id) * self.detail.lefts[i]

		totalWeight = totalWeight + weight
	end

	local realIndex = index
	local curWeight = 0
	local help = {}
	local help2 = {}

	if index % 3 == 1 then
		realIndex = math.ceil(index / 3) + 6

		if self.detail.lefts[realIndex] == 0 then
			return 0
		else
			for i = 7, 9 do
				if i ~= realIndex and self.detail.lefts[i] <= 0 then
					table.insert(help, i)
				elseif i ~= realIndex and self.detail.lefts[i] > 0 then
					table.insert(help2, i)
				end
			end

			if #help == 0 then
				curWeight = xyd.tables.activityClockGambleTable:getWeight(realIndex) * self.detail.lefts[realIndex]
			elseif #help == 1 then
				curWeight = xyd.tables.activityClockGambleTable:getWeight(realIndex) * self.detail.lefts[realIndex]
				curWeight = curWeight + xyd.tables.activityClockGambleTable:getWeight(help[1]) * xyd.tables.activityClockGambleTable:getWeight(realIndex) / (xyd.tables.activityClockGambleTable:getWeight(realIndex) + xyd.tables.activityClockGambleTable:getWeight(help2[1]))
			elseif #help == 2 then
				curWeight = xyd.tables.activityClockGambleTable:getWeight(realIndex) * self.detail.lefts[realIndex]
				curWeight = curWeight + xyd.tables.activityClockGambleTable:getWeight(help[1]) + xyd.tables.activityClockGambleTable:getWeight(help[2])
			end

			totalWeight = totalWeight + xyd.tables.activityClockGambleTable:getWeight(7) * 1
			totalWeight = totalWeight + xyd.tables.activityClockGambleTable:getWeight(8) * 1
			totalWeight = totalWeight + xyd.tables.activityClockGambleTable:getWeight(9) * 1
		end
	else
		realIndex = index - math.ceil(index / 3)
		curWeight = xyd.tables.activityClockGambleTable:getWeight(realIndex) * self.detail.lefts[realIndex]

		for i = 7, 9 do
			local id = self.detail.ids[i]
			local weight = xyd.tables.activityClockGambleTable:getWeight(id) * 1

			totalWeight = totalWeight + weight
		end
	end

	local radio = curWeight / totalWeight

	return radio
end

function ActivityClockData:getRound()
	return self.detail.round
end

function ActivityClockData:getChooseIndex(IconIndex)
	if not self.specialAward then
		self.specialAward = {}
	end

	return self.specialAward[IconIndex] or 0
end

function ActivityClockData:getLeftTime(index)
	return self.detail.lefts[index]
end

function ActivityClockData:reqGamble(num)
	local data = require("cjson").encode({
		indexes = {
			{
				7,
				self.specialAward[1] or 1
			},
			{
				8,
				self.specialAward[2] or 1
			},
			{
				9,
				self.specialAward[3] or 1
			}
		},
		num = num
	})
	local msg = messages_pb.get_activity_award_req()

	msg.activity_id = xyd.ActivityID.ACTIVITY_CLOCK
	msg.params = data

	xyd.Backend.get():request(xyd.mid.GET_ACTIVITY_AWARD, msg)
end

function ActivityClockData:selectSpecialAward(IconIndex, ChooseIndex)
	if ChooseIndex and ChooseIndex > 0 then
		self.specialAward[IconIndex] = ChooseIndex
	else
		self.specialAward[IconIndex] = 0
	end

	xyd.db.misc:setValue({
		key = "activity_clock_choose_Index_" .. IconIndex,
		value = self.specialAward[IconIndex]
	})
	xyd.db.misc:setValue({
		key = "activity_clock_choose_time_stamp",
		value = xyd.getServerTime()
	})
end

function ActivityClockData:checkRedMarkOfProgressAward()
	local ids = xyd.tables.activityClockAwardsTable:getIDs()

	for j in pairs(ids) do
		local data = {}

		data.id = tonumber(j)
		data.max_value = xyd.tables.activityClockAwardsTable:getComplete(j)
		data.cur_value = tonumber(self:getCompleteTime())

		if data.cur_value > data.max_value then
			data.cur_value = data.max_value
		end

		if self:getAwardRecord(j) == 0 then
			if data.cur_value == data.max_value then
				return true
			end
		else
			data.state = 3
		end
	end

	return false
end

function ActivityClockData:checkRedMarkOfAwardPreview()
	local timeStamp = xyd.db.misc:getValue("activity_clock_preview_time_stamp")

	if timeStamp and xyd.isSameDay(tonumber(timeStamp), xyd.getServerTime()) then
		return false
	end

	return true
end

function ActivityClockData:checkRedMarkOfGamble()
	return xyd.models.backpack:getItemNumByID(self:getResource1()[1]) >= self:getResource1()[2]
end

return ActivityClockData
