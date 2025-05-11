-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulLandAwardTable.lua

local SoulLandAwardTable = class("SoulLandAwardTable", import("app.common.tables.BaseTable"))

function SoulLandAwardTable:ctor()
	SoulLandAwardTable.super.ctor(self, "soul_land_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulLandAwardTable:getIDs()
	return self.ids_
end

function SoulLandAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function SoulLandAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function SoulLandAwardTable:getAwardsByPoint(checkPoint)
	local checkId = 1

	for i, id in pairs(self.ids_) do
		local point = self:getPoint(id)

		if point <= checkPoint then
			checkId = id
		else
			break
		end
	end

	return self:getAwards(checkId)
end

return SoulLandAwardTable
