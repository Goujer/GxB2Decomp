-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GetWayItemTable.lua

local GetWayItemTable = class("GetWayItemTable", import("app.common.tables.BaseTable"))

function GetWayItemTable:ctor()
	GetWayItemTable.super.ctor(self, "getway_item")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function GetWayItemTable:getName(id)
	return xyd.tables.getWayTextTable:getName(id)
end

function GetWayItemTable:getIDs()
	return self.ids_
end

function GetWayItemTable:getLvLimit(id)
	return self:getNumber(id, "lv_limit")
end

function GetWayItemTable:getFunctionId(id)
	return self:getNumber(id, "function_id")
end

function GetWayItemTable:getLimit(id)
	return self:getNumber(id, "get_limit")
end

function GetWayItemTable:getShowActivityID(id)
	return self:getNumber(id, "show_activity")
end

function GetWayItemTable:getGoWindow(id)
	return self:split(id, "go_window", "|")
end

function GetWayItemTable:getGoParam(id)
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

return GetWayItemTable
