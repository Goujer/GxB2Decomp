-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OnlineTable.lua

local OnlineTable = class("OnlineTable", import("app.common.tables.BaseTable"))

function OnlineTable:ctor()
	OnlineTable.super.ctor(self, "online")
end

function OnlineTable:getReward(id)
	return self:split2num(id, "award", "#")
end

function OnlineTable:getCD(id)
	return self:getNumber(id, "cd")
end

function OnlineTable:getLength()
	local len = 0

	for id, _ in pairs(self.TableLua.rows) do
		len = len + 1
	end

	return len
end

return OnlineTable
