-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterCardBoxTable.lua

local TimeCloisterCardBoxTable = class("TimeCloisterCardBoxTable", import("app.common.tables.BaseTable"))

function TimeCloisterCardBoxTable:ctor()
	TimeCloisterCardBoxTable.super.ctor(self, "time_cloister_card_box")

	self.ids_ = {}
	self.boxCards = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		local boxId = self:getBoxId(id)

		if not self.boxCards[boxId] then
			self.boxCards[boxId] = {}
		end

		table.insert(self.boxCards[boxId], self:getCards(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterCardBoxTable:getIDs()
	return self.ids_
end

function TimeCloisterCardBoxTable:getCards(id)
	return self:getNumber(id, "cards")
end

function TimeCloisterCardBoxTable:getBoxId(id)
	return self:getNumber(id, "box_id")
end

function TimeCloisterCardBoxTable:getBoxCards(boxId)
	if not self.boxCards[boxId] then
		return {}
	end

	return self.boxCards[boxId]
end

return TimeCloisterCardBoxTable
