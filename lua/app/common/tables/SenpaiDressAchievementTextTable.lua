-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressAchievementTextTable.lua

local SenpaiDressAchievementTextTable = class("SenpaiDressAchievementTextTable", import("app.common.tables.BaseTable"))

function SenpaiDressAchievementTextTable:ctor()
	SenpaiDressAchievementTextTable.super.ctor(self, "senpai_dress_achievement_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressAchievementTextTable:getIDs()
	return self.ids_
end

function SenpaiDressAchievementTextTable:getDesc(id, ...)
	local __args = {
		...
	}
	local formatStr = self:getString(id, "desc")

	if not formatStr then
		return id
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return SenpaiDressAchievementTextTable
