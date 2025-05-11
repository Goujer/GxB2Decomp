-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PlotFinishGiftbagTable.lua

local PlotFinishGiftbagTable = class("PlotFinishGiftbagTable", import("app.common.tables.BaseTable"))

function PlotFinishGiftbagTable:ctor()
	PlotFinishGiftbagTable.super.ctor(self, "activity_plot_finish")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end
end

function PlotFinishGiftbagTable:getIDs()
	return self.ids_
end

function PlotFinishGiftbagTable:getFort(id)
	return self:getNumber(id, "fort")
end

function PlotFinishGiftbagTable:getAwards(id)
	return self:split2num(id, "awards", "#")
end

function PlotFinishGiftbagTable:getMaxPoint()
	local id = self.ids_[#self.ids_]

	return self:getFort(id)
end

return PlotFinishGiftbagTable
