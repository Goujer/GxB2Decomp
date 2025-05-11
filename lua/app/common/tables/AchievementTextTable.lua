-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AchievementTextTable.lua

local AchievementTextTable = class("AchievementTextTable", import(".BaseTable"))

function AchievementTextTable:ctor()
	AchievementTextTable.super.ctor(self, "achievement_text_" .. tostring(xyd.Global.lang))
end

function AchievementTextTable:getDesc(id, ...)
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

return AchievementTextTable
