-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySmashEggTable.lua

local ActivitySmashEggTable = class("ActivitySmashEggTable", import("app.common.tables.BaseTable"))

function ActivitySmashEggTable:ctor()
	ActivitySmashEggTable.super.ctor(self, "activity_smash_egg")

	self.itemIDs = {}
	self.dropBoxIDs = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.itemIDs, self:getCost(id)[1])
		table.insert(self.dropBoxIDs, self:getDropBoxID(id))
	end

	table.sort(self.itemIDs)
	table.sort(self.dropBoxIDs)
end

function ActivitySmashEggTable:getItemIDs()
	return self.itemIDs
end

function ActivitySmashEggTable:getDropBoxIDs()
	return self.dropBoxIDs
end

function ActivitySmashEggTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivitySmashEggTable:getDropBoxID(id)
	return self:getNumber(id, "dropbox_id")
end

return ActivitySmashEggTable
