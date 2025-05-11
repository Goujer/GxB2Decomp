-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityIceSecretAwardsTable.lua

local ActivityIceSecretAwardsTable = class("ActivityIceSecretAwardsTable", import(".BaseTable"))

function ActivityIceSecretAwardsTable:ctor()
	ActivityIceSecretAwardsTable.super.ctor(self, "activity_ice_secret_awards")

	self.ids_ = {}
	self.bigAwardsList_ = {}
	self.normalAwardsList_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	for _, id in ipairs(self.ids_) do
		local type = self:getType(id)

		if type and type == 1 then
			table.insert(self.bigAwardsList_, id)
		else
			table.insert(self.normalAwardsList_, id)
		end
	end

	table.insert(self.normalAwardsList_, 13, -1)
end

function ActivityIceSecretAwardsTable:getIDs()
	return self.ids_
end

function ActivityIceSecretAwardsTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityIceSecretAwardsTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityIceSecretAwardsTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ActivityIceSecretAwardsTable:getAwards(id)
	return self:split2num(id, "award", "#")
end

function ActivityIceSecretAwardsTable:getNormalList()
	return self.normalAwardsList_
end

function ActivityIceSecretAwardsTable:getBigList()
	return self.bigAwardsList_
end

return ActivityIceSecretAwardsTable
