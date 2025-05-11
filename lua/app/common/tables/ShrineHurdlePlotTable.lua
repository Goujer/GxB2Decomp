-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdlePlotTable.lua

local ShrineHurdlePlotTable = class("ShrineHurdlePlotTable", import("app.common.tables.BaseTable"))

function ShrineHurdlePlotTable:ctor()
	ShrineHurdlePlotTable.super.ctor(self, "shrine_plot_list")

	self.ids_ = {}
	self.returnListTab1 = {}
	self.returnListTab2 = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local tab1 = self:getTab1(id)
		local tab2 = self:getTab2(id)

		if not self.returnListTab1[tab1] then
			self.returnListTab1[tab1] = {}
		end

		if not self.returnListTab2[tab2] then
			self.returnListTab2[tab2] = {}
		end

		table.insert(self.returnListTab1[tab1], tab2)
		table.insert(self.returnListTab2[tab2], id)
	end

	table.sort(self.ids_)
end

function ShrineHurdlePlotTable:getIDs()
	return self.ids_
end

function ShrineHurdlePlotTable:getListByType(type)
	local list = {}

	for _, id in ipairs(self.ids_) do
		local trigger = self:getTrigger(id)

		if trigger == type then
			table.insert(list, id)
		end
	end

	table.sort(list, function(a, b)
		return self:getOrder(a) > self:getOrder(b)
	end)
end

function ShrineHurdlePlotTable:getTab1(id)
	return self:getNumber(id, "tab1")
end

function ShrineHurdlePlotTable:getTab2(id)
	return self:getNumber(id, "tab2")
end

function ShrineHurdlePlotTable:getTrigger(id)
	return self:getNumber(id, "trigger")
end

function ShrineHurdlePlotTable:getOrder(id)
	return self:getNumber(id, "order")
end

function ShrineHurdlePlotTable:getNextID(id)
	return self:getNumber(id, "text_id")
end

function ShrineHurdlePlotTable:getShowList1()
	return self.returnListTab1
end

function ShrineHurdlePlotTable:getShowList2()
	return self.returnListTab2
end

return ShrineHurdlePlotTable
