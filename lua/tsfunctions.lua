-- chunkname: @../../../Product/Bundles/Android/src/tsfunctions.lua

function __TS__ArraySlice(list, first, last)
	local len = #list
	local k

	if first < 0 then
		k = math.max(len + first, 0)
	else
		k = math.min(first, len)
	end

	local relativeEnd = last

	if last == nil then
		relativeEnd = len
	end

	local final

	if relativeEnd < 0 then
		final = math.max(len + relativeEnd, 0)
	else
		final = math.min(relativeEnd, len)
	end

	local out = {}
	local n = 0

	while k < final do
		out[n + 1] = list[k + 1]
		k = k + 1
		n = n + 1
	end

	return out
end

function __TS__ArrayPush(arr, ...)
	local items = {
		...
	}

	for ____TS_index = 1, #items do
		local item = items[____TS_index]

		arr[#arr + 1] = item
	end

	return #arr
end

function __TS__TableLength(t)
	local res = 0

	for k, v in pairs(t) do
		res = res + 1
	end

	return res
end

function __TS__ArrayConcat(arr1, ...)
	local args = {
		...
	}
	local out = {}

	for ____TS_index = 1, #arr1 do
		local val = arr1[____TS_index]

		out[#out + 1] = val
	end

	for ____TS_index = 1, #args do
		local arg = args[____TS_index]

		if pcall(function()
			return #arg
		end) and type(arg) ~= "string" then
			local argAsArray = arg

			for ____TS_index = 1, #argAsArray do
				local val = argAsArray[____TS_index]

				out[#out + 1] = val
			end
		else
			out[#out + 1] = arg
		end
	end

	return out
end

function __TS__ArraySort(arr, compareFn)
	if compareFn ~= nil then
		table.sort(arr, function(a, b)
			return compareFn(_G, a, b) < 0
		end)
	else
		table.sort(arr)
	end

	return arr
end

function __TS__ArraySplice(list, start, deleteCount, ...)
	local items = {
		...
	}
	local len = #list
	local actualStart

	if start < 0 then
		actualStart = math.max(len + start, 0)
	else
		actualStart = math.min(start, len)
	end

	local itemCount = #items
	local actualDeleteCount

	if not start then
		actualDeleteCount = 0
	elseif not deleteCount then
		actualDeleteCount = len - actualStart
	else
		actualDeleteCount = math.min(math.max(deleteCount, 0), len - actualStart)
	end

	local out = {}

	do
		local k = 0

		while k < actualDeleteCount do
			local from = actualStart + k

			if list[from + 1] then
				out[k + 1] = list[from + 1]
			end

			k = k + 1
		end
	end

	if itemCount < actualDeleteCount then
		do
			local k = actualStart

			while k < len - actualDeleteCount do
				local from = k + actualDeleteCount
				local to = k + itemCount

				if list[from + 1] then
					list[to + 1] = list[from + 1]
				else
					list[to + 1] = nil
				end

				k = k + 1
			end
		end

		local k = len

		while k > len - actualDeleteCount + itemCount do
			list[k - 1 + 1] = nil
			k = k - 1
		end
	elseif actualDeleteCount < itemCount then
		local k = len - actualDeleteCount

		while actualStart < k do
			local from = k + actualDeleteCount - 1
			local to = k + itemCount - 1

			if list[from + 1] then
				list[to + 1] = list[from + 1]
			else
				list[to + 1] = nil
			end

			k = k - 1
		end
	end

	local j = actualStart

	for ____TS_index = 1, #items do
		local e = items[____TS_index]

		list[j + 1] = e
		j = j + 1
	end

	do
		local k = #list - 1

		while k >= len - actualDeleteCount + itemCount do
			list[k + 1] = nil
			k = k - 1
		end
	end

	return out
end

local ____symbolMetatable = {
	__tostring = function(self)
		if self.description == nil then
			return "Symbol()"
		else
			return "Symbol(" .. tostring(self.description) .. ")"
		end
	end
}

function __TS__Symbol(description)
	return setmetatable({
		description = description
	}, ____symbolMetatable)
end

Symbol = {
	iterator = __TS__Symbol("Symbol.iterator"),
	hasInstance = __TS__Symbol("Symbol.hasInstance")
}

function __TS__Iterator(iterable)
	if iterable[Symbol.iterator] then
		local iterator = iterable[Symbol.iterator](iterable)

		return function()
			local result = iterator:next()

			if not result.done then
				return result.value
			else
				return nil
			end
		end
	else
		local i = 0

		return function()
			i = i + 1

			return iterable[i]
		end
	end
end

function __TS__Number(value)
	local valueType = type(value)

	if valueType == "number" then
		return value
	elseif valueType == "string" then
		local numberValue = tonumber(value)

		if numberValue then
			return numberValue
		end

		if value == "Infinity" then
			return math.huge
		end

		if value == "-Infinity" then
			return -math.huge
		end

		local stringWithoutSpaces = string.gsub(value, "%s", "")

		if stringWithoutSpaces == "" then
			return 0
		end

		return 0 / 0
	elseif valueType == "boolean" then
		return value and 1 or 0
	else
		return 0 / 0
	end
end

function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
	local len = #arr

	if len == 0 then
		return -1
	end

	local n = 0

	if fromIndex then
		n = fromIndex
	end

	if len <= n then
		return -1
	end

	local k

	if n >= 0 then
		k = n
	else
		k = len + n

		if k < 0 then
			k = 0
		end
	end

	do
		local i = k

		while i < len do
			if arr[i + 1] == searchElement then
				return i
			end

			i = i + 1
		end
	end

	return -1
end

function __TS__InstanceOf(obj, classTbl)
	if (type(classTbl) == "table" and "object" or type(classTbl)) ~= "object" then
		error("Right-hand side of 'instanceof' is not an object")
	end

	if classTbl[Symbol.hasInstance] ~= nil then
		return not not classTbl[Symbol.hasInstance](classTbl, obj)
	end

	if obj ~= nil then
		local luaClass = obj.constructor

		while luaClass ~= nil do
			if luaClass == classTbl then
				return true
			end

			luaClass = luaClass.____super
		end
	end

	return false
end
