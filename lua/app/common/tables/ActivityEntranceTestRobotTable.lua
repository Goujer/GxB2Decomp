-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEntranceTestRobotTable.lua

local ActivityEntranceTestRobotTable = class("ActivityEntranceTestRobotTable", import("app.common.tables.BaseTable"))

function ActivityEntranceTestRobotTable:ctor()
	ActivityEntranceTestRobotTable.super.ctor(self, "activity_warmup_robot")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEntranceTestRobotTable:getIDs()
	return self.ids_
end

function ActivityEntranceTestRobotTable:getName(id)
	return self:getString(id, "name")
end

function ActivityEntranceTestRobotTable:getLv(id)
	return self:getNumber(id, "lv")
end

function ActivityEntranceTestRobotTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityEntranceTestRobotTable:getServer(id)
	return self:getNumber(id, "server")
end

function ActivityEntranceTestRobotTable:getShowID(id)
	return self:getNumber(id, "show_id")
end

function ActivityEntranceTestRobotTable:getAvatar(id)
	return self:getNumber(id, "avatar_id")
end

function ActivityEntranceTestRobotTable:getAllInfo(id)
	return {
		name = self:getName(id),
		lv = self:getLv(id),
		server = self:getServer(id),
		showID = self:getShowID(id),
		avatar = self:getAvatar(id),
		rank = self:getRank(id)
	}
end

return ActivityEntranceTestRobotTable
