-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineAchievementTextTable.lua

local ShrineAchievementTextTable = class("ShrineAchievementTextTable", import(".BaseTable"))

function ShrineAchievementTextTable:ctor()
	ShrineAchievementTextTable.super.ctor(self, "shrine_achievement_text_" .. tostring(xyd.Global.lang))
end

function ShrineAchievementTextTable:getDesc(id, ...)
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

return ShrineAchievementTextTable
