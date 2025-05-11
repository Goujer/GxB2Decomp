-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingBAward2Table.lua

local OldBuildingBAward2Table = class("OldBuildingBAward2Table", import("app.common.tables.BaseTable"))

function OldBuildingBAward2Table:ctor()
	OldBuildingBAward2Table.super.ctor(self, "old_building_b_award2")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function OldBuildingBAward2Table:getIds()
	return self.ids_
end

function OldBuildingBAward2Table:getRankFront(id)
	return self:getString(id, "rank_front")
end

function OldBuildingBAward2Table:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function OldBuildingBAward2Table:getFrameAwards(id)
	return self:split2Cost(id, "frame_awards", "#", true)
end

function OldBuildingBAward2Table:getRank(id)
	return self:getNumber(id, "rank")
end

function OldBuildingBAward2Table:getRankIdByRank(rank)
	for _, id in ipairs(self.ids_) do
		local rank_ = self:getRank(id)

		if rank <= rank_ and rank > 0 then
			return id
		end
	end

	return #self.ids_
end

return OldBuildingBAward2Table
