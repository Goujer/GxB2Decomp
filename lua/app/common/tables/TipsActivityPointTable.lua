-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TipsActivityPointTable.lua

local TipsActivityPointTable = class("TipsActivityPointTable", import("app.common.tables.BaseTable"))

function TipsActivityPointTable:ctor()
	TipsActivityPointTable.super.ctor(self, "tips_activity_point")

	self.ids_ = {}
	self.activityIds_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TipsActivityPointTable:getIds(id)
	return self.ids_
end

function TipsActivityPointTable:getActivityID(id)
	return self:getNumber(id, "activity_id")
end

function TipsActivityPointTable:getCondition(id)
	return self:split(id, "point", "#", false)
end

function TipsActivityPointTable:getContentType(id)
	return self:split2Cost(id, "connect_type", "|#", false)
end

function TipsActivityPointTable:getTitle(id)
	return xyd.tables.tipsActivityPointTextTable:getTitle(id)
end

function TipsActivityPointTable:getContent(id)
	return xyd.tables.tipsActivityPointTextTable:getContent(id)
end

return TipsActivityPointTable
