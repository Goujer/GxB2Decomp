-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityKeyboardTable.lua

local ActivityKeyboardTable = class("ActivityKeyboardTable", import("app.common.tables.BaseTable"))

function ActivityKeyboardTable:ctor()
	ActivityKeyboardTable.super.ctor(self, "activity_keyboard_award")

	self.ids = {}
	self.type1 = {}
	self.type2 = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))

		if self:getRewardType(id) == 1 then
			table.insert(self.type1, tonumber(id))
		else
			table.insert(self.type2, tonumber(id))
		end
	end

	table.sort(self.ids)
	table.sort(self.type1)
	table.sort(self.type2)
end

function ActivityKeyboardTable:getIds(type)
	if type == 1 then
		return self.type1
	elseif type == 2 then
		return self.type2
	else
		return self.ids
	end
end

function ActivityKeyboardTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityKeyboardTable:getRewardType(id)
	return self:getNumber(id, "type")
end

function ActivityKeyboardTable:isBigAward(id)
	return self:getNumber(id, "is_big_award") == 1
end

function ActivityKeyboardTable:getLayer(id)
	return self:getNumber(id, "level")
end

function ActivityKeyboardTable:getUnlock(id)
	return self:getNumber(id, "unlock")
end

return ActivityKeyboardTable
