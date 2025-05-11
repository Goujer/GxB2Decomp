-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TableParser.lua

local TableParser = {}

function TableParser.parse2(name, callback, ignoreCheck)
	if callback == nil then
		return
	end

	local packageName = "data.tables." .. name
	local data = require(packageName)
	local dataKeys = data.keys
	local key2Index = {}

	for index = 1, #dataKeys do
		key2Index[dataKeys[index]] = index
	end

	local metadata = {
		__index = function(t, k)
			local index = key2Index[k]

			if index then
				return t.__rawTableData[index]
			elseif not ignoreCheck then
				error(string.format("No key:%s when parse table:%s", k, name))
			end
		end
	}
	local kvs = setmetatable({}, metadata)

	function kvs:getOldRow()
		local oldRow = {}

		for index = 1, #dataKeys do
			oldRow[dataKeys[index]] = self.__rawTableData[index]
		end

		return oldRow
	end

	for _, row in ipairs(data.rows) do
		kvs.__rawTableData = row

		callback(kvs)
	end

	package.loaded[packageName] = nil
end

function TableParser.parse(name, callback)
	if callback == nil then
		return
	end

	local packageName = "data.tables." .. name
	local data = require(packageName)

	for _, row in ipairs(data.rows) do
		local kvs = {}

		for index = 1, #data.keys do
			kvs[data.keys[index]] = row[index]
		end

		callback(kvs)
	end

	package.loaded[packageName] = nil
end

return TableParser
