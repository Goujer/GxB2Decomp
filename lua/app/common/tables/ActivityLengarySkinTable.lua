-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLengarySkinTable.lua

local ActivityLengarySkinTable = class("ActivityLengarySkinTable", import("app.common.tables.BaseTable"))

function ActivityLengarySkinTable:ctor()
	ActivityLengarySkinTable.super.ctor(self, "activity_legendary_skin")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLengarySkinTable:getSkinAward(id)
	return self:split2Cost(id, "skin_award", "#")
end

function ActivityLengarySkinTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityLengarySkinTable:getShowSkin(id)
	return self:getNumber(id, "skin")
end

function ActivityLengarySkinTable:getSkinOffest(id)
	return self:split2Cost(id, "skin_xy", "|")
end

function ActivityLengarySkinTable:getSkinOffest2(id)
	return self:split2Cost(id, "skin_xy2", "|")
end

function ActivityLengarySkinTable:getSkinScale(id)
	return self:getNumber(id, "skin_scale")
end

return ActivityLengarySkinTable
