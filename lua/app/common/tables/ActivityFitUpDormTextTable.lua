-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFitUpDormTextTable.lua

local ActivityFitUpDormTextTable = class("ActivityFitUpDormTextTable", import("app.common.tables.BaseTable"))

function ActivityFitUpDormTextTable:ctor()
	ActivityFitUpDormTextTable.super.ctor(self, "activity_fit_up_dorm_text_" .. string.lower(xyd.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityFitUpDormTextTable:getTitle(id)
	return self:getString(id, "title")
end

function ActivityFitUpDormTextTable:getTitleOver(id)
	return self:getString(id, "title_over")
end

function ActivityFitUpDormTextTable:getSlotName(id, index)
	return self:getString(id, "slot_name_" .. tostring(index))
end

return ActivityFitUpDormTextTable
