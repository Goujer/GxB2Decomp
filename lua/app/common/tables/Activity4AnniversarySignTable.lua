-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4AnniversarySignTable.lua

local Activity4AnniversarySignTable = class("Activity4AnniversarySignTable", import("app.common.tables.BaseTable"))

function Activity4AnniversarySignTable:ctor()
	Activity4AnniversarySignTable.super.ctor(self, "activity_4anniversary_sign")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function Activity4AnniversarySignTable:getIDs()
	return self.ids
end

function Activity4AnniversarySignTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function Activity4AnniversarySignTable:getIsShow(id)
	return self:getNumber(id, "is_show")
end

return Activity4AnniversarySignTable
