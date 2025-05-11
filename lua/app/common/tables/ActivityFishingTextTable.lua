-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFishingTextTable.lua

local ActivityFishingTextTable = class("ActivityFishingTextTable", import("app.common.tables.BaseTable"))

function ActivityFishingTextTable:ctor()
	ActivityFishingTextTable.super.ctor(self, "activity_fish_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFishingTextTable:getIDs()
	return self.ids_
end

function ActivityFishingTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityFishingTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityFishingTextTable
