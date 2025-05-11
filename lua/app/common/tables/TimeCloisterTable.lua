-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterTable.lua

local TimeCloisterTable = class("TimeCloisterTable", import("app.common.tables.BaseTable"))

function TimeCloisterTable:ctor()
	TimeCloisterTable.super.ctor(self, "time_cloister")

	self.ids_ = {}
	self.cloisterCards = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		id = tonumber(id)

		if not self.cloisterCards[id] then
			self.cloisterCards[id] = {}
		end

		local boxIds = self:getCardBox(id)

		for i in pairs(boxIds) do
			local cards = xyd.tables.timeCloisterCardBoxTable:getBoxCards(boxIds[i])

			for j in pairs(cards) do
				table.insert(self.cloisterCards[id], cards[j])
			end
		end
	end

	table.sort(self.ids_)
end

function TimeCloisterTable:getIDs()
	return self.ids_
end

function TimeCloisterTable:getName(id)
	return self:getString(id, "name")
end

function TimeCloisterTable:getLockType(id)
	return self:getNumber(id, "lock_type")
end

function TimeCloisterTable:getEnergy(id)
	return self:getNumber(id, "energy")
end

function TimeCloisterTable:getCardBox(id)
	return self:split2num(id, "card_box", "|")
end

function TimeCloisterTable:getName(id)
	return xyd.tables.timeCloisterTextTable:getName(id)
end

function TimeCloisterTable:getDesc(id)
	return xyd.tables.timeCloisterTextTable:getDesc(id)
end

function TimeCloisterTable:getCloisterCards(id)
	if not self.cloisterCards[id] then
		return {}
	end

	return self.cloisterCards[id]
end

function TimeCloisterTable:getTecIcon(id)
	return self:getNumber(id, "tec_icon")
end

function TimeCloisterTable:getBg(id)
	return self:getString(id, "bg")
end

function TimeCloisterTable:getCardBg(id)
	return self:getString(id, "card_bg")
end

function TimeCloisterTable:getCardNameBg(id)
	return self:getString(id, "card_name_bg")
end

function TimeCloisterTable:getCardNameColor(id)
	return self:getString(id, "card_name_color")
end

function TimeCloisterTable:getCardTextColor(id)
	return self:getString(id, "card_text_color")
end

function TimeCloisterTable:getMainWindowCardColor1(id)
	return self:split2Cost(id, "main_window_card_color1", "|", false)
end

function TimeCloisterTable:getMainWindowCardColor2(id)
	return self:split2Cost(id, "main_window_card_color2", "|", false)
end

return TimeCloisterTable
