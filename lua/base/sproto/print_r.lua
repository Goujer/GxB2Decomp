-- chunkname: @../../../Product/Bundles/Android/src/base/sproto/print_r.lua

local print = print
local tconcat = table.concat
local tinsert = table.insert
local srep = string.rep
local type = type
local pairs = pairs
local tostring = tostring
local next = next

local function print_r(root)
	if not root then
		return
	end

	if type(root) ~= "table" then
		print(root)

		return
	end

	local cache = {
		[root] = "."
	}

	local function _dump(t, space, name)
		local temp = {}

		for k, v in pairs(t) do
			local key = tostring(k)

			if cache[v] then
				tinsert(temp, "+" .. key .. " {" .. cache[v] .. "}")
			elseif type(v) == "table" then
				local new_key = name .. "." .. key

				cache[v] = new_key

				tinsert(temp, "+" .. key .. _dump(v, space .. (next(t, k) and "|" or " ") .. srep(" ", #key), new_key))
			else
				tinsert(temp, "+" .. key .. " [" .. tostring(v) .. "]")
			end
		end

		return tconcat(temp, "\n" .. space)
	end

	print("\n" .. _dump(root, "", ""))
end

function dump(value, desciption, nesting, deep)
	if type(nesting) ~= "number" then
		nesting = 3
	end

	local lookupTable = {}
	local result = {}

	local function _v(v)
		if type(v) == "string" then
			v = "\"" .. v .. "\""
		end

		return tostring(v)
	end

	local startTrace = 2
	local dumpType = 1

	if desciption and string.len(desciption) >= 3 and string.sub(desciption, 1, 3) == "-_-" then
		dumpType = 2

		if string.sub(desciption, 1, 4) == "-_-!" then
			dumpType = 3
		elseif string.sub(desciption, 1, 4) == "-_-?" then
			dumpType = 0
		end

		if deep ~= nil then
			startTrace = deep
		end

		desciption = string.sub(desciption, 4, string.len(desciption))

		if desciption == "" then
			desciption = nil
		end
	end

	local traceback = string.split(debug.traceback("", startTrace), "\n")

	table.insert(result, string.format("%s%s", "dump from: ", string.trim(traceback[startTrace + 1])))

	local function _dump(value, desciption, indent, nest, keylen)
		local desciption = desciption or "<var>"
		local spc = ""

		if type(keylen) == "number" then
			spc = string.rep(" ", keylen - string.len(_v(desciption)))
		end

		if type(value) ~= "table" then
			result[#result + 1] = string.format("%s%s%s = %s", indent, _v(desciption), spc, _v(value))
		elseif lookupTable[value] then
			result[#result + 1] = string.format("%s%s%s = *REF*", indent, desciption, spc)
		else
			lookupTable[value] = true

			if nest > nesting then
				result[#result + 1] = string.format("%s%s = *MAX NESTING*", indent, desciption)
			else
				result[#result + 1] = string.format("%s%s = {", indent, _v(desciption))

				local indent2 = indent .. "    "
				local keys = {}
				local keylen = 0
				local values = {}

				for k, v in pairs(value) do
					keys[#keys + 1] = k

					local vk = _v(k)
					local vkl = string.len(vk)

					if keylen < vkl then
						keylen = vkl
					end

					values[k] = v
				end

				table.sort(keys, function(a, b)
					if type(a) == "number" and type(b) == "number" then
						return a < b
					else
						return tostring(a) < tostring(b)
					end
				end)

				for i, k in ipairs(keys) do
					_dump(values[k], k, indent2, nest + 1, keylen)
				end

				result[#result + 1] = string.format("%s}", indent)
			end
		end
	end

	_dump(value, desciption, "- ", 1)

	local resultStr = table.concat(result, "\n")

	if UNITY_EDITOR or UNITY_STANDALONE then
		if LuaManager.Instance:isShowLessLog() == 1 or dumpType == LuaManager.Instance:isShowLessLog() or dumpType == 0 then
			Debugger.Log(resultStr)
		end
	else
		Debugger.Log(resultStr)
	end

	return resultStr
end

function dump3(value, nesting, desciption)
	if nesting == nil then
		nesting = 3
	end

	if desciption ~= nil then
		desciption = "-_-!" .. desciption
	else
		desciption = "-_-!"
	end

	return dump(value, desciption, nesting)
end

function dump2(value, deep, nesting, desciption)
	if nesting == nil then
		nesting = 3
	end

	if desciption ~= nil then
		desciption = "-_-" .. desciption
	else
		desciption = "-_-"
	end

	return dump(value, desciption, nesting, deep)
end

function reportLog2(value, deep, nesting, desciption)
	if UNITY_EDITOR or UNITY_STANDALONE then
		return dump2(value, deep, nesting, desciption)
	end
end

function reportLog(value, deep, nesting, desciption)
	if nesting == nil then
		nesting = 3
	end

	if desciption ~= nil then
		desciption = "-_-?" .. desciption
	else
		desciption = "-_-?"
	end

	return dump(value, desciption, nesting)
end

return print_r
