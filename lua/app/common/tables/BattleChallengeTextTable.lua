-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattleChallengeTextTable.lua

local BattleChallengeTextTable = class("BattleChallengeTextTable", import("app.common.tables.BaseTable"))

function BattleChallengeTextTable:ctor()
	BattleChallengeTextTable.super.ctor(self, "battle_challenge_text_" .. xyd.Global.lang)
end

function BattleChallengeTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function BattleChallengeTextTable:getDescWithParams(id, ...)
	local __args = {
		...
	}
	local formatStr = self:getString(id, "desc")
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return BattleChallengeTextTable
