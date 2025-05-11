-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity3BirthdayVipAwardTable.lua

local Activity3BirthdayVipAwardTable = class("Activity3BirthdayVipAwardTable", import("app.common.tables.BaseTable"))

function Activity3BirthdayVipAwardTable:ctor()
	Activity3BirthdayVipAwardTable.super.ctor(self, "activity_3birthday_vip_awards")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function Activity3BirthdayVipAwardTable:getIds()
	return self.ids
end

function Activity3BirthdayVipAwardTable:getVipLevel(id)
	return self:getNumber(id, "vip_level")
end

function Activity3BirthdayVipAwardTable:getdailyAwards(id)
	return self:split2Cost(id, "daily_awards", "|#")
end

function Activity3BirthdayVipAwardTable:getOnceAwards(id)
	return self:split2Cost(id, "once_awards", "|#")
end

return Activity3BirthdayVipAwardTable
