-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEnconterBattleTable.lua

local ActivityEnconterBattleTable = class("ActivityEnconterBattleTable", import("app.common.tables.BaseTable"))

function ActivityEnconterBattleTable:ctor()
	ActivityEnconterBattleTable.super.ctor(self, "activity_encounter_battle")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEnconterBattleTable:getIDs()
	return self.ids_
end

function ActivityEnconterBattleTable:getBattleID(id)
	return self:getNumber(id, "battle_id")
end

function ActivityEnconterBattleTable:getNextID(id)
	return self:getNumber(id, "next_id")
end

function ActivityEnconterBattleTable:getOptionalPartners(id)
	return self:split2num(id, "initial_partner", "|")
end

function ActivityEnconterBattleTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityEnconterBattleTable:getOpenDay(id)
	return self:getNumber(id, "time")
end

function ActivityEnconterBattleTable:getParams(id)
	return xyd.tables.battleChallengeTable:getParams(id)
end

function ActivityEnconterBattleTable:getChallengeText(id, index)
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

return ActivityEnconterBattleTable
