-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GetWayTable.lua

local GetWayTable = class("GetWayTable", import("app.common.tables.BaseTable"))

function GetWayTable:ctor()
	GetWayTable.super.ctor(self, "getway")

	self.ids_ = {}
end

function GetWayTable:getName(id)
	return xyd.tables.getWayTextTable:getName(id)
end

function GetWayTable:getLvLimit(id)
	return self:getNumber(id, "lv_limit")
end

function GetWayTable:getStage(id)
	return self:getNumber(id, "stage")
end

function GetWayTable:isClose(id)
	return self:getNumber(id, "is_close")
end

function GetWayTable:getGoWindow(id)
	if tonumber(id) == 25 then
		if xyd.models.dailyQuiz:isAllMaxLev() then
			return {
				"daily_quiz2_window"
			}
		else
			return {
				"daily_quiz_window"
			}
		end
	else
		return self:split(id, "go_window", "|")
	end
end

function GetWayTable:getHideLv(id)
	return self:getNumber(id, "lv_hide")
end

function GetWayTable:getFunctionId(id)
	return self:getNumber(id, "function_id")
end

function GetWayTable:getGoParam(id)
	local params = {}
	local arr = xyd.split(self:getString(id, "go_params"), "|")

	do
		local i = 1

		while i <= #arr do
			local arr2 = xyd.split(arr[i], ",")
			local tmpParams = {}

			for idx in pairs(arr2) do
				local param = xyd.split(arr2[idx], ":")

				if self:Number(param[2]) then
					param[2] = self:Number(param[2])
				end

				tmpParams[param[1]] = param[2]
			end

			table.insert(params, tmpParams)

			i = i + 1
		end
	end

	return params
end

function GetWayTable:getCloseWindow(id)
	return self:split(id, "close_win_name", "|")
end

return GetWayTable
