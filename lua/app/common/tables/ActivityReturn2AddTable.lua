-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityReturn2AddTable.lua

local ActivityReturn2AddTable = class("ActivityReturn2AddTable", import("app.common.tables.BaseTable"))

function ActivityReturn2AddTable:ctor()
	ActivityReturn2AddTable.super.ctor(self, "activity_return2_add")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ActivityReturn2AddTable:getIDs()
	return self.ids_
end

function ActivityReturn2AddTable:getMultiple(id)
	return self:getNumber(id, "multiple")
end

function ActivityReturn2AddTable:getGetwayId(id)
	return self:getNumber(id, "getway_id")
end

function ActivityReturn2AddTable:getTranslation(id)
	return self:getString(id, "translation")
end

return ActivityReturn2AddTable
