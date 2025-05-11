-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPlotFortTable.lua

local ActivityPlotFortTable = class("ActivityPlotFortTable", import("app.common.tables.BaseTable"))

function ActivityPlotFortTable:ctor()
	ActivityPlotFortTable.super.ctor(self, "activity_plot_fort")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityPlotFortTable:getFortImg(id)
	return self:getString(id, "fort_img_id")
end

function ActivityPlotFortTable:getIds()
	return self.ids_
end

function ActivityPlotFortTable:checkIsShow(id)
	local flag = self:getNumber(id, "is_show") or 0

	if flag == 1 then
		return true
	else
		return false
	end
end

return ActivityPlotFortTable
