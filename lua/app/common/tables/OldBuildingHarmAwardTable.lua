-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingHarmAwardTable.lua

local OldBuildingHarmAwardTable = class("OldBuildingHarmAwardTable", import("app.common.tables.BaseTable"))

function OldBuildingHarmAwardTable:ctor()
	OldBuildingHarmAwardTable.super.ctor(self, "old_building_award3")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function OldBuildingHarmAwardTable:getIds()
	return self.ids_
end

function OldBuildingHarmAwardTable:getRankFront(id)
	return self:getString(id, "rank_front")
end

function OldBuildingHarmAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function OldBuildingHarmAwardTable:getFrameAwards(id)
	return self:split2Cost(id, "frame_awards", "#", true)
end

function OldBuildingHarmAwardTable:getRank(id)
	return self:getNumber(id, "rank")
end

function OldBuildingHarmAwardTable:getRankIdByRank(rank)
	for _, id in ipairs(self.ids_) do
		local rank_ = self:getRank(id)

		if rank <= rank_ and rank > 0 then
			return id
		end
	end

	return #self.ids_
end

return OldBuildingHarmAwardTable
