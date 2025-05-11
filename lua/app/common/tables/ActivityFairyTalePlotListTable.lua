-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTalePlotListTable.lua

local ActivityFairyTalePlotListTable = class("ActivityFairyTalePlotList", import("app.common.tables.BaseTable"))

function ActivityFairyTalePlotListTable:ctor()
	ActivityFairyTalePlotListTable.super.ctor(self, "activity_fairytale_plot_list")

	self.ids_ = {}
	self.idsByType_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local mapType = self:getMapType(id)

		if not self.idsByType_[mapType] then
			self.idsByType_[mapType] = {}
		end

		table.insert(self.idsByType_[mapType], tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairyTalePlotListTable:getMapType(id)
	return self:getNumber(id, "map_id")
end

function ActivityFairyTalePlotListTable:getIdsByMapId(mapType)
	return self.idsByType_[mapType]
end

function ActivityFairyTalePlotListTable:getUnlockById(id)
	return self:getNumber(id, "unlock")
end

function ActivityFairyTalePlotListTable:getPlotIdById(id)
	return self:getNumber(id, "plot_id")
end

function ActivityFairyTalePlotListTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityFairyTalePlotListTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function ActivityFairyTalePlotListTable:getChapterIcon(id)
	return self:getString(id, "chapter_icon")
end

return ActivityFairyTalePlotListTable
