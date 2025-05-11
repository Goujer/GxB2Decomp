-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachIslandTable.lua

local ActivityBeachIslandTable = class("ActivityBeachIslandTable", import("app.common.tables.BaseTable"))

function ActivityBeachIslandTable:ctor()
	ActivityBeachIslandTable.super.ctor(self, "activity_beach_island")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityBeachIslandTable:getIDs()
	return self.ids_
end

function ActivityBeachIslandTable:getBattleID(id)
	return self:getNumber(id, "battle_id")
end

function ActivityBeachIslandTable:getNextID(id)
	return self:getNumber(id, "next_id")
end

function ActivityBeachIslandTable:getOptionalPartners(id)
	return self:split2num(id, "initial_partner", "|")
end

function ActivityBeachIslandTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityBeachIslandTable:getOpenDay(id)
	return self:getNumber(id, "open_day")
end

function ActivityBeachIslandTable:getParams(id)
	return xyd.tables.battleChallengeTable:getParams(id)
end

function ActivityBeachIslandTable:getChallengeText(id, index)
	local challengeNum = self:getNumber(id, "challenge" .. index)
	local descLabel = xyd.tables.battleChallengeTextTable:getDesc(challengeNum)
	local num = self:getParams(challengeNum)
	local __args = {
		num
	}
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(descLabel, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return ActivityBeachIslandTable
