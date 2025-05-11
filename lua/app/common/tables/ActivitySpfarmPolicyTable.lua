-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmPolicyTable.lua

local ActivitySpfarmPolicyTable = class("ActivitySpfarmPolicyTable", import("app.common.tables.BaseTable"))

function ActivitySpfarmPolicyTable:ctor()
	ActivitySpfarmPolicyTable.super.ctor(self, "activity_spfarm_policy")

	self.ids_ = {}
	self.famousWithIds = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	for i, id in pairs(self.ids_) do
		local lev = self:getLevel(id)

		if not self.famousWithIds[lev] then
			self.famousWithIds[lev] = {}
		end

		table.insert(self.famousWithIds[lev], id)
	end
end

function ActivitySpfarmPolicyTable:getIDs()
	return self.ids_
end

function ActivitySpfarmPolicyTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ActivitySpfarmPolicyTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivitySpfarmPolicyTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivitySpfarmPolicyTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function ActivitySpfarmPolicyTable:getParams(id)
	return self:getNumber(id, "params")
end

function ActivitySpfarmPolicyTable:getImage(id)
	return self:getString(id, "image")
end

function ActivitySpfarmPolicyTable:getFamousWithIds()
	return self.famousWithIds
end

return ActivitySpfarmPolicyTable
