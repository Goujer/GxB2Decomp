-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGuardTable.lua

local ActivityGuardTable = class("ActivityGuardTable", import("app.common.tables.BaseTable"))

function ActivityGuardTable:ctor()
	ActivityGuardTable.super.ctor(self, "activity_guard")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityGuardTable:getResPath(id)
	return self:getString(id, "res_path")
end

function ActivityGuardTable:getScale(id)
	return self:getNumber(id, "scale")
end

function ActivityGuardTable:getPartnerPicXYDelta(id)
	return self:split2Cost(id, "partner_picture_xy", "|")
end

function ActivityGuardTable:getImagePath(id)
	return self:getString(id, "image_path")
end

function ActivityGuardTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityGuardTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function ActivityGuardTable:getSwitchType(id)
	return self:getNumber(id, "switch_type")
end

return ActivityGuardTable
