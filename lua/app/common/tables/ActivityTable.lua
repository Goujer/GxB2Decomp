-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTable.lua

local ActivityTable = class("ActivityTable", import("app.common.tables.BaseTable"))
local json = require("cjson")

function ActivityTable:ctor()
	ActivityTable.super.ctor(self, "activity")
end

function ActivityTable:getIcon(id)
	return self:getString(id, "icon")
end

function ActivityTable:getTitle(id)
	return self:getString(id, "title")
end

function ActivityTable:getType(id)
	return self:getNumber(id, "type1")
end

function ActivityTable:getType2(id)
	return self:getNumber(id, "type2")
end

function ActivityTable:getGiftBag(id)
	return self:split2num(id, "gift_id", "|")
end

function ActivityTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityTable:getDays(id)
	return self:getNumber(id, "days")
end

function ActivityTable:getLastTime(id)
	return self:getNumber(id, "last_time")
end

function ActivityTable:getPlotId(id)
	return self:getNumber(id, "plot_id")
end

function ActivityTable:getRound(id)
	return self:split2num(id, "round", "|")
end

function ActivityTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function ActivityTable:getWindowParams(id)
	local paramsSt = self:getString(id, "window_params")

	if paramsSt and string.len(paramsSt) > 0 then
		local str = string.gsub(paramsSt, "'", "\"")
		local params = json.decode(str)

		return params
	else
		return nil
	end
end

function ActivityTable:getLimit(id)
	return self:split2Cost(id, "limit", "|#", false)
end

return ActivityTable
