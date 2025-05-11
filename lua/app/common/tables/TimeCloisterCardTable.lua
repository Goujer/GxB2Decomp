-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterCardTable.lua

local TimeCloisterCardTable = class("TimeCloisterCardTable", import("app.common.tables.BaseTable"))

function TimeCloisterCardTable:ctor()
	TimeCloisterCardTable.super.ctor(self, "time_cloister_card")

	self.ids_ = {}
	self.cloisterCards = {}
	self.idByType = {}

	for id in pairs(self.TableLua.rows) do
		local level = self:getLevel(id)

		if level == 1 then
			table.insert(self.ids_, tonumber(id))
		end
	end

	table.sort(self.ids_)
end

function TimeCloisterCardTable:getIDs()
	return self.ids_
end

function TimeCloisterCardTable:getType(id)
	return self:getNumber(id, "type")
end

function TimeCloisterCardTable:getLevel(id)
	return self:getNumber(id, "level")
end

function TimeCloisterCardTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function TimeCloisterCardTable:getFirstId(id)
	return self:getNumber(id, "first_id")
end

function TimeCloisterCardTable:getSubCard(id)
	return self:split2Cost(id, "sub_card", "|")
end

function TimeCloisterCardTable:getParentCard(id)
	return self:getNumber(id, "parent_card")
end

function TimeCloisterCardTable:getAwardType(id)
	return self:getNumber(id, "award_type")
end

function TimeCloisterCardTable:getAwards(id)
	if self:getAwardType(id) == 1 then
		return self:getNumber(id, "awards")
	elseif self:getAwardType(id) == 2 then
		return self:split2Cost(id, "awards", "|#")
	elseif self:getAwardType(id) == 3 then
		return self:split2Cost(id, "awards", "@#")
	end

	return {}
end

function TimeCloisterCardTable:getBase(id)
	return self:split2Cost(id, "base", "|")
end

function TimeCloisterCardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function TimeCloisterCardTable:getLock(id)
	return self:getNumber(id, "lock")
end

function TimeCloisterCardTable:getTechId(id)
	return self:getNumber(id, "tec_id")
end

function TimeCloisterCardTable:getImg(id)
	return self:getString(id, "img")
end

function TimeCloisterCardTable:getName(id)
	return xyd.tables.timeCloisterCardTextTable:getName(id)
end

function TimeCloisterCardTable:getDesc(id)
	return xyd.tables.timeCloisterCardTextTable:getDesc(id)
end

function TimeCloisterCardTable:getTec(id)
	return self:getNumber(id, "tec")
end

function TimeCloisterCardTable:getParams(id)
	return self:split2Cost(id, "params", "|", true)
end

function TimeCloisterCardTable:checkCardBlone(cloisterId)
	if not self.cloisterCards[cloisterId] then
		-- block empty
	end
end

return TimeCloisterCardTable
