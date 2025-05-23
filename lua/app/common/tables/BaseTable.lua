﻿-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BaseTable.lua

local BaseTable = class("BaseTable")

function BaseTable:ctor(tableName)
	self.TableLua = self:getTableLua(tableName)
	self.tableName = tableName
	self[tostring(self.tableName) .. "SplitArr"] = {}
	self.ids_ = {}
	self.is_sync_back = 0
end

function BaseTable:checkSyncBackend()
	if self.is_sync_back == 1 then
		return
	end

	if not xyd.Global.isLoginInfoReceived then
		return
	end

	local selfPlayer = xyd.models.selfPlayer
	local actTables = selfPlayer:getActTables()

	if actTables[self.tableName] then
		self:updateTable(actTables[self.tableName])

		self.is_sync_back = 1
	end
end

function BaseTable:getSplitArr()
	return self[tostring(self.tableName) .. "SplitArr"]
end

function BaseTable:getAny(rowKey, colKey)
	self:checkSyncBackend()

	local colIndex = self.TableLua.keys[colKey]

	if self.TableLua.rows[rowKey] == nil then
		return nil
	end

	return self.TableLua.rows[rowKey][colIndex]
end

function BaseTable:isHasKey(key)
	local rows = self.TableLua.rows

	if rows[tostring(key)] then
		return true
	end

	return false
end

function BaseTable:indexOf(arr, val, fromIndex)
	local len = #arr
	local n = 0

	if fromIndex then
		n = fromIndex
	end

	if n < 0 then
		n = n + len

		if n < 0 then
			n = 0
		end
	end

	do
		local i = n

		while i < len do
			if arr[i + 1] == val then
				return i
			end

			i = i + 1
		end
	end

	return -1
end

function BaseTable:sort(arr, func)
	if func ~= nil then
		table.sort(arr, function(a, b)
			return func(a, b) < 0
		end)
	else
		table.sort(arr)
	end

	return arr
end

function BaseTable:slice(list, first, last)
	local len = #list

	if first < 0 then
		first = math.max(len + first, 0)
	else
		first = math.min(first, len)
	end

	if last == nil then
		last = len
	end

	if last < 0 then
		last = math.max(len + last, 0)
	else
		last = math.min(last, len)
	end

	local result = {}
	local i = 0
	local j = first

	while j < last do
		result[i + 1] = list[j + 1]
		i = i + 1
		j = j + 1
	end

	return result
end

function BaseTable:reverse(arr)
	local i = #arr

	while i > 0 do
		table.insert(arr, arr[i])
		table.remove(arr, i)

		i = i - 1
	end
end

function BaseTable:Number(value)
	local type = type(value)

	if type == "number" then
		return value
	elseif type == "string" then
		local val = tonumber(value)

		if val then
			return val
		end

		local strVal = string.gsub(value, "%s", "")

		if strVal == "" then
			return 0
		end

		return 0
	elseif type == "boolean" then
		return value and 1 or 0
	else
		return 0
	end
end

function BaseTable:getString(rowKey, colKey)
	self:checkSyncBackend()

	rowKey = tostring(rowKey)

	local colIndex = self.TableLua.keys[colKey]

	if self.TableLua.rows[rowKey] == nil then
		return nil
	end

	if self.TableLua.rows[rowKey][colIndex] == nil then
		return nil
	end

	return tostring(self.TableLua.rows[rowKey][colIndex])
end

function BaseTable:getNumber(rowKey, colKey)
	self:checkSyncBackend()

	rowKey = tostring(rowKey)

	local colIndex = self.TableLua.keys[colKey]

	if self.TableLua.rows[rowKey] == nil then
		return nil
	elseif self.TableLua.rows[rowKey][colIndex] == nil then
		return nil
	end

	return self:Number(self.TableLua.rows[rowKey][colIndex])
end

function BaseTable:split(rowKey, colKey, delimiter)
	self:checkSyncBackend()

	rowKey = tostring(rowKey)

	local colIndex = self.TableLua.keys[colKey]

	if self.TableLua.rows[rowKey] == nil then
		return nil
	end

	local key = tostring(rowKey) .. "_" .. tostring(colKey) .. "_" .. tostring(delimiter) .. "_" .. "false"

	if not self:getSplitArr()[key] then
		self:getSplitArr()[key] = xyd.split(self.TableLua.rows[rowKey][colIndex], delimiter, false)
	end

	return xyd.cloneTable(self:getSplitArr()[key])
end

function BaseTable:split2num(rowKey, colKey, delimiter)
	self:checkSyncBackend()

	rowKey = tostring(rowKey)

	local colIndex = self.TableLua.keys[colKey]

	if self.TableLua.rows[rowKey] == nil then
		return nil
	end

	local key = tostring(rowKey) .. "_" .. tostring(colKey) .. "_" .. tostring(delimiter) .. "_" .. "true"

	if not self:getSplitArr()[key] then
		self:getSplitArr()[key] = xyd.split(self.TableLua.rows[rowKey][colIndex], delimiter, true)
	end

	return xyd.cloneTable(self:getSplitArr()[key])
end

function BaseTable:split2Cost(rowKey, colKey, delimiter, toNumber)
	self:checkSyncBackend()

	rowKey = tostring(rowKey)

	if toNumber == nil then
		toNumber = true
	end

	local colIndex = self.TableLua.keys[colKey]

	if self.TableLua.rows[rowKey] == nil then
		return nil
	end

	local key = tostring(rowKey) .. "_" .. tostring(colKey) .. "_" .. tostring(delimiter) .. "_" .. tostring(toNumber)

	if delimiter == "#" or delimiter == "|" then
		if not self:getSplitArr()[key] then
			self:getSplitArr()[key] = xyd.split(self.TableLua.rows[rowKey][colIndex], delimiter, toNumber)
		end

		return xyd.cloneTable(self:getSplitArr()[key])
	end

	if delimiter == "|#" then
		if self:getSplitArr()[key] then
			return xyd.cloneTable(self:getSplitArr()[key])
		end

		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "|")
		local cost = {}

		for i = 1, #sp do
			cost[i] = xyd.split(sp[i], "#", toNumber)
		end

		self:getSplitArr()[key] = cost

		return xyd.cloneTable(cost)
	end

	if delimiter == "@#" then
		if self:getSplitArr()[key] then
			return xyd.cloneTable(self:getSplitArr()[key])
		end

		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "@")
		local cost = {}

		for i = 1, #sp do
			cost[i] = xyd.split(sp[i], "#", toNumber)
		end

		self:getSplitArr()[key] = cost

		return xyd.cloneTable(cost)
	end

	if delimiter == "@|#" then
		if self:getSplitArr()[key] then
			return xyd.cloneTable(self:getSplitArr()[key])
		end

		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "@")
		local tmp = {}
		local cost = {}

		for i = 1, #sp do
			cost[i] = {}
			tmp = xyd.split(sp[i], "|")

			for j = 1, #tmp do
				cost[i][j] = xyd.split(tmp[j], "#", toNumber)
			end
		end

		self:getSplitArr()[key] = cost

		return xyd.cloneTable(cost)
	end

	if delimiter == "|@#" then
		if self:getSplitArr()[key] then
			return xyd.cloneTable(self:getSplitArr()[key])
		end

		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "|")
		local tmp = {}
		local cost = {}

		for i = 1, #sp do
			cost[i] = {}
			tmp = xyd.split(sp[i], "@")

			for j = 1, #tmp do
				cost[i][j] = xyd.split(tmp[j], "#", toNumber)
			end
		end

		self:getSplitArr()[key] = cost

		return xyd.cloneTable(cost)
	end
end

function BaseTable:getTableLua(tableName)
	local lang = xyd.checkTableIsLang(tableName)

	if lang then
		return require("data.tables." .. lang .. "." .. tableName)
	end

	return require("data.tables." .. tableName)
end

function BaseTable:parseTable(callback, isSort)
	local metaTable = getmetatable(self.TableLua.rows)

	if metaTable then
		while metaTable do
			local rows = metaTable.__index

			for id, row in pairs(rows) do
				local id_ = self:Number(id)

				table.insert(self.ids_, id_)

				if callback then
					callback(id_, row)
				end
			end

			metaTable = getmetatable(rows)
		end
	else
		for id, row in pairs(self.TableLua.rows) do
			local id_ = self:Number(id)

			table.insert(self.ids_, id_)

			if callback then
				callback(id_, row)
			end
		end
	end

	if isSort then
		table.sort(self.ids_, function(a, b)
			return a < b and true or false
		end)
	end
end

function BaseTable:getSpecialParamsDesc(id, strName, ...)
	local __args = {
		...
	}
	local formatStr = self:getString(id, strName)

	if not formatStr then
		return id
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

function BaseTable:updateTable(arr)
	for k, v in pairs(arr) do
		if self.TableLua.rows[k] then
			for key, val in pairs(v) do
				for key_, val_ in pairs(self.TableLua.keys) do
					if key == key_ then
						self.TableLua.rows[k][val_] = val
					end
				end
			end
		end
	end
end

return BaseTable
