-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPetTaskTable.lua

local ActivityPetTaskTable = class("ActivityPetTaskTable", import("app.common.tables.BaseTable"))

function ActivityPetTaskTable:ctor()
	ActivityPetTaskTable.super.ctor(self, "activity_pet_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityPetTaskTable:getIDs()
	return self.ids_
end

function ActivityPetTaskTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityPetTaskTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityPetTaskTable
