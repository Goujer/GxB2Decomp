-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowWindowShop1Table.lua

local DressShowWindowShop1Table = class("DressShowWindowShop1Table", import(".BaseTable"))

function DressShowWindowShop1Table:ctor()
	DressShowWindowShop1Table.super.ctor(self, "show_window_shop1")

	self.ids_ = {}
	self.functionToID_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local function_ids = self:getFunctionID(id)

		for i = 1, #function_ids do
			local function_id = function_ids[i]

			if not self.functionToID_[function_id] then
				self.functionToID_[function_id] = {}
			end

			table.insert(self.functionToID_[function_id], id)
		end

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DressShowWindowShop1Table:getIDs()
	return self.ids_
end

function DressShowWindowShop1Table:getSkill(id)
	return self:split2num(id, "skill", "|")
end

function DressShowWindowShop1Table:getNum(id)
	return self:getNumber(id, "num")
end

function DressShowWindowShop1Table:getMaxTime(id)
	return self:getNumber(id, "max_time")
end

function DressShowWindowShop1Table:getFunctionID(id)
	return self:split2Cost(id, "func_id", "|")
end

function DressShowWindowShop1Table:getBuyTime(id)
	return self:getNumber(id, "buy_time")
end

function DressShowWindowShop1Table:getItemIcon(id)
	return self:getNumber(id, "item_icon")
end

function DressShowWindowShop1Table:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function DressShowWindowShop1Table:getIDsByFunction(function_id)
	return self.functionToID_[function_id]
end

return DressShowWindowShop1Table
