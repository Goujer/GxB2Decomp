-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AchivementTextTable.lua

local AchievementTextTable = class("AchievementTextTable", import("app.common.tables.BaseTable"))

function AchievementTextTable:ctor()
	AchievementTextTable.super.ctor(self, "achievement_text_" .. string.lower(xyd.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function AchievementTextTable:getDesc(id, ...)
	local inargs = {
		...
	}
	local args = {}
	local formatStr = self:getString(id, "desc")

	if not formatStr then
		return id
	end

	local ordinals = {}

	for num in formatStr:gmatch("{(%d+)}") do
		table.insert(ordinals, self:Number(num))
	end

	for _, index in ipairs(ordinals) do
		if inargs[index] == nil then
			__TRACE(id, "nil arg with index =", index)
		end

		table.insert(args, inargs[index] or "")
	end

	local res = string.format(formatStr, unpack(args))

	return res
end

return AchievementTextTable
