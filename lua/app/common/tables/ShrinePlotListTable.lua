-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrinePlotListTable.lua

local ShrinePlotListTable = class("ShrinePlotListTable", import("app.common.tables.BaseTable"))

function ShrinePlotListTable:ctor()
	ShrinePlotListTable.super.ctor(self, "shrine_plot_list")

	self.ids_ = {}
	self.chapterTap1List = {}
	self.chapterTap2List = {}
	self.chapterPlotList = {}
	self.tab2List = {}

	local tab1ColIndex = self.TableLua.keys.tab1
	local tab2ColIndex = self.TableLua.keys.tab2

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		local tab1 = row[tab1ColIndex]
		local tab2 = row[tab2ColIndex]

		if not self.chapterTap2List[tab1] then
			self.chapterTap2List[tab1] = {}

			table.insert(self.chapterTap1List, tab1)
		end

		if not self.chapterPlotList[tab2] then
			self.chapterPlotList[tab2] = {}

			table.insert(self.chapterTap2List[tab1], tab2)
		end

		table.insert(self.chapterPlotList[tab2], id)
	end
end

function ShrinePlotListTable:getListByType(type)
	local list = {}

	for _, id in ipairs(self.ids_) do
		local trigger = self:getTrigger(id)

		if trigger == type then
			table.insert(list, id)
		end
	end

	table.sort(list, function(a, b)
		return self:getOrder(a) < self:getOrder(b)
	end)

	return list
end

function ShrinePlotListTable:getTab1(id)
	return self:getNumber(id, "tab1")
end

function ShrinePlotListTable:getTab2(id)
	return self:getNumber(id, "tab2")
end

function ShrinePlotListTable:getType(id)
	return self:getNumber(id, "type")
end

function ShrinePlotListTable:getTrigger(id)
	return self:getNumber(id, "trigger")
end

function ShrinePlotListTable:getOrder(id)
	return self:getNumber(id, "order")
end

function ShrinePlotListTable:getChapterTap1List()
	return self.chapterTap1List
end

function ShrinePlotListTable:getChapterTap2List(tab1)
	if tab1 then
		return self.chapterTap2List[tab1]
	else
		return self.chapterTap2List
	end
end

function ShrinePlotListTable:getChapterPlotList(tab2)
	if tab2 then
		return self.chapterPlotList[tab2]
	else
		return self.chapterPlotList
	end
end

function ShrinePlotListTable:getPlotId(id)
	return self:getNumber(id, "text_id")
end

function ShrinePlotListTable:getPlotTitle(id)
	return xyd.tables.shrinePlotListTextTable:getTitle(id)
end

function ShrinePlotListTable:getChapterTitle(chapterId)
	return xyd.tables.shrinePlotTabTextTable:getTitle(chapterId)
end

return ShrinePlotListTable
