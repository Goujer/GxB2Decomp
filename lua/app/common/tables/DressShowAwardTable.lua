-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowAwardTable.lua

local DressShowAwardTable = class("DressShowAwardTable", import(".BaseTable"))

function DressShowAwardTable:ctor()
	DressShowAwardTable.super.ctor(self, "show_window_award")

	self.ids_ = {}
	self.idsByGroup_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local group = self:getGroup(id)

		if not self.idsByGroup_[group] then
			self.idsByGroup_[group] = {}
		end

		table.insert(self.idsByGroup_[group], tonumber(id))
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DressShowAwardTable:getIDs()
	return self.ids_
end

function DressShowAwardTable:getGroup(id)
	return self:getNumber(id, "group")
end

function DressShowAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function DressShowAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function DressShowAwardTable:getGroupIds(group_id)
	local ids = self.idsByGroup_[group_id]

	table.sort(ids)

	return ids
end

function DressShowAwardTable:getAwardsByGroupAndScore(group_id, score)
	local ids = self:getGroupIds(group_id)

	for i = #ids, 1, -1 do
		local id = ids[i]
		local point = self:getPoint(id)

		if point <= score then
			return self:getAwards(id)
		end
	end

	return {
		{
			314,
			0
		},
		{
			315,
			0
		}
	}
end

return DressShowAwardTable
