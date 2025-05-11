-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpringGiftbagTable.lua

local ActivitySpringGiftbagTable = class("ActivitySpringGiftbagTable", import("app.common.tables.BaseTable"))

function ActivitySpringGiftbagTable:ctor()
	ActivitySpringGiftbagTable.super.ctor(self, "activity_spring_giftbag")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivitySpringGiftbagTable:getIDs()
	return self.ids
end

function ActivitySpringGiftbagTable:getAwards1(id)
	return self:split2Cost(id, "awards1", "|#")
end

function ActivitySpringGiftbagTable:getAwards2(id)
	return self:split2Cost(id, "awards2", "|#")
end

function ActivitySpringGiftbagTable:getChooseNum(id)
	return self:getNumber(id, "num")
end

return ActivitySpringGiftbagTable
