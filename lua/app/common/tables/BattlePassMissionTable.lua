-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattlePassMissionTable.lua

local BattlePassMissionTable = class("BattlePassMissionTable", import("app.common.tables.BaseTable"))

function BattlePassMissionTable:ctor()
	BattlePassMissionTable.super.ctor(self, "battlepass_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function BattlePassMissionTable:getIds()
	return self.ids_
end

function BattlePassMissionTable:getAward(id, activity_id)
	local list = xyd.split(self:getString(id, "award_new"), "#", true)
	local list2 = xyd.split(self:getString(id, "award2_new"), "#", true)

	if list2 and #list2 > 0 and list2[1] then
		xyd.tableConcat(list, list2)
	end

	return list
end

function BattlePassMissionTable:getRank(id)
	return self:getNumber(id, "rank")
end

function BattlePassMissionTable:getLevLimit(id)
	return self:getNumber(id, "lv_limit")
end

function BattlePassMissionTable:getFunctionId(id)
	return self:getNumber(id, "function_id")
end

function BattlePassMissionTable:getCompleteValue(id, activity_id)
	return self:getNumber(id, "complete_value_new")
end

function BattlePassMissionTable:getDesc(id)
	return xyd.tables.battlePassMissionTextTable:getDesc(id)
end

function BattlePassMissionTable:getGoWindow(id)
	if tonumber(id) == 9 then
		if xyd.models.dailyQuiz:isAllMaxLev() then
			return "daily_quiz2_window"
		else
			return "daily_quiz_window"
		end
	else
		return self:getString(id, "go_window")
	end
end

function BattlePassMissionTable:getGoParams(id)
	local params = {}
	local arr = xyd.split(self:getString(id, "go_params"), "|")

	for idx in pairs(arr) do
		local param = xyd.split(arr[idx], ":")

		if self:Number(param[2]) then
			param[2] = self:Number(param[2])
		end

		params[param[1]] = param[2]
	end

	return params
end

function BattlePassMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function BattlePassMissionTable:getBpLimit(id)
	return self:getNumber(id, "bp_limit") or 0
end

function BattlePassMissionTable:getFuncId(id)
	return self:getNumber(id, "function_id") or 0
end

return BattlePassMissionTable
