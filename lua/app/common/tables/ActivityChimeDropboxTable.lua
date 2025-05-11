-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChimeDropboxTable.lua

local ActivityChimeDropboxTable = class("ActivityChimeDropboxTable", import("app.common.tables.BaseTable"))

function ActivityChimeDropboxTable:ctor()
	ActivityChimeDropboxTable.super.ctor(self, "activity_chime_dropbox")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityChimeDropboxTable:getIDs()
	return self.ids_
end

function ActivityChimeDropboxTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityChimeDropboxTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityChimeDropboxTable:getWeight(id)
	return self:getString(id, "weight")
end

function ActivityChimeDropboxTable:getIsBig(id)
	return self:getNumber(id, "is_big")
end

function ActivityChimeDropboxTable:getIsShow(id)
	return self:getNumber(id, "is_show")
end

function ActivityChimeDropboxTable:getIsShowWithAward(itemId, itemNum)
	for i, id in pairs(self.ids_) do
		local award = self:getAward(id)

		if itemId == award[1] and itemNum == itemNum then
			return self:getIsShow(id)
		end
	end

	return 0
end

function ActivityChimeDropboxTable:getIsBigWithAward(itemId, itemNum)
	for i, id in pairs(self.ids_) do
		local award = self:getAward(id)

		if itemId == award[1] and itemNum == itemNum then
			return self:getIsBig(id)
		end
	end

	return 0
end

return ActivityChimeDropboxTable
