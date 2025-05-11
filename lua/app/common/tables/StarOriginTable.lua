-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StarOriginTable.lua

local StarOriginTable = class("StarOriginTable", import("app.common.tables.BaseTable"))

function StarOriginTable:ctor()
	StarOriginTable.super.ctor(self, "star_origin")

	self.ids_ = {}
	self.idByBeginIDAndLev = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	self.beginIDs = {}

	for i = 1, #self.ids_ do
		local id = self.ids_[i]
		local lev = self:getLv(id)

		if lev == 0 and not self.idByBeginIDAndLev[id] then
			table.insert(self.beginIDs, id)

			self.idByBeginIDAndLev[id] = {}
		end

		self.idByBeginIDAndLev[self.beginIDs[#self.beginIDs]][lev] = id
	end
end

function StarOriginTable:getIDs()
	return self.ids_
end

function StarOriginTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function StarOriginTable:getLv(id)
	return self:getNumber(id, "lv")
end

function StarOriginTable:getGroup(id)
	return self:getNumber(id, "group")
end

function StarOriginTable:getDesc(id)
	return self:getString(id, "desc")
end

function StarOriginTable:getCost(id)
	return self:split2Cost(id, "cost", "|#", true)
end

function StarOriginTable:getCostTotal(id)
	return self:split2Cost(id, "cost_total", "|#", true)
end

function StarOriginTable:getEffect(id)
	return self:split2Cost(id, "effect", "|#", false)
end

function StarOriginTable:getIdByBeginIDAndLev(beginID, lev)
	return self.idByBeginIDAndLev[beginID][lev]
end

function StarOriginTable:getMaxLevByBeginID(beginID)
	return #self.idByBeginIDAndLev[beginID]
end

return StarOriginTable
