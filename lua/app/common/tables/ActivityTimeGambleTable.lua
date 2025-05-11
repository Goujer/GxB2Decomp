-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTimeGambleTable.lua

local ActivityTimeGambleTable = class("ActivityTimeGambleTable", import(".BaseTable"))

function ActivityTimeGambleTable:ctor()
	ActivityTimeGambleTable.super.ctor(self, "activity_time_gamble")

	self.ids = {}
	self.showGroupList = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))

		local show = self:getShow(id)

		self.showGroupList[show] = self.showGroupList[show] or {}

		table.insert(self.showGroupList[show], tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityTimeGambleTable:getIds()
	return self.ids
end

function ActivityTimeGambleTable:getShowGroup()
	return self.showGroupList
end

function ActivityTimeGambleTable:getDropboxId(id)
	return self:getNumber(id, "dropbox_id")
end

function ActivityTimeGambleTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function ActivityTimeGambleTable:getCool(id)
	return self:getNumber(id, "cool")
end

function ActivityTimeGambleTable:getCool(id)
	return self:getNumber(id, "cool")
end

function ActivityTimeGambleTable:getIsBag(id)
	return self:getNumber(id, "is_big")
end

function ActivityTimeGambleTable:getShow(id)
	return self:getNumber(id, "show")
end

function ActivityTimeGambleTable:getProb(id)
	return self:getNumber(id, "prob")
end

return ActivityTimeGambleTable
