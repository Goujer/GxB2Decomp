-- chunkname: @../../../Product/Bundles/Android/src/base/protobuf/text_format.lua

local string = string
local math = math
local print = print
local getmetatable = getmetatable
local table = table
local ipairs = ipairs
local tostring = tostring
local next = next
local pairs = pairs
local type = type
local descriptor = require("protobuf.descriptor")

module("protobuf.text_format")

function format(buffer)
	local len = string.len(buffer)

	for i = 1, len, 16 do
		local text = ""

		for j = i, math.min(i + 16 - 1, len) do
			text = string.format("%s  %02x", text, string.byte(buffer, j))
		end

		print(text)
	end
end

local FieldDescriptor = descriptor.FieldDescriptor

function msg_format_indent(write, msg, indent)
	for field, value in msg:ListFields() do
		local function print_field(field_value)
			local name = field.name

			write(string.rep(" ", indent))

			if field.type == FieldDescriptor.TYPE_MESSAGE then
				local extensions = getmetatable(msg)._extensions_by_name

				if extensions[field.full_name] then
					write("[" .. name .. "] {\n")
				else
					write(name .. " {\n")
				end

				msg_format_indent(write, field_value, indent + 4)
				write(string.rep(" ", indent))
				write("}\n")
			else
				write(string.format("%s: %s\n", name, tostring(field_value)))
			end
		end

		if field.label == FieldDescriptor.LABEL_REPEATED then
			for _, k in ipairs(value) do
				print_field(k)
			end
		else
			print_field(value)
		end
	end
end

function msg_form_indent_json(msg)
	local res = {}

	for field, value in msg:ListFields() do
		if field.label == FieldDescriptor.LABEL_REPEATED then
			local tmpRes = {}

			for _, k in ipairs(value) do
				if field.type == FieldDescriptor.TYPE_MESSAGE then
					local tmpK = k

					k = msg_form_indent_json(k)

					local checkKeyTable = {}

					for key, _ in pairs(k) do
						checkKeyTable[key] = true
					end

					local metaTable = getmetatable(tmpK)

					if metaTable then
						local allname = metaTable._getter

						if allname then
							for name, func in pairs(allname) do
								if not checkKeyTable[name] and type(tmpK[name]) == "table" then
									k[name] = {}
								end
							end
						end
					end
				end

				table.insert(tmpRes, k)
			end

			res[field.name] = tmpRes
		else
			if field.type == FieldDescriptor.TYPE_MESSAGE then
				local tmpValue = value

				value = msg_form_indent_json(value)

				local checkKeyTable = {}

				for key, _ in pairs(value) do
					checkKeyTable[key] = true
				end

				local metaTable = getmetatable(tmpValue)

				if metaTable then
					local allname = metaTable._getter

					if allname then
						for name, func in pairs(allname) do
							if not checkKeyTable[name] and type(tmpValue[name]) == "table" then
								value[name] = {}
							end
						end
					end
				end
			end

			res[field.name] = value
		end
	end

	return res
end

function msg_form_indent_json_by_data_deal(msg, name)
	local isCheckBreak = false

	if name and name ~= nil and name ~= "all_data_and_not_event_data" then
		isCheckBreak = true
	end

	local res = {}

	for field, value in msg:ListFields() do
		if field.label == FieldDescriptor.LABEL_REPEATED and (field.name == name or name == nil or name == "all_data_and_not_event_data") then
			local tmpRes = {}

			for _, k in ipairs(value) do
				if field.type == FieldDescriptor.TYPE_MESSAGE then
					local tmpK = k

					k = msg_form_indent_json(k)

					local checkKeyTable = {}

					for key, _ in pairs(k) do
						checkKeyTable[key] = true
					end

					local metaTable = getmetatable(tmpK)

					if metaTable then
						local allname = metaTable._getter

						if allname then
							for name, func in pairs(allname) do
								if not checkKeyTable[name] and type(tmpK[name]) == "table" then
									k[name] = {}
								end
							end
						end
					end
				end

				table.insert(tmpRes, k)
			end

			res[field.name] = tmpRes

			if isCheckBreak then
				break
			end
		elseif field.name == name or name == nil or name == "all_data_and_not_event_data" then
			if field.type == FieldDescriptor.TYPE_MESSAGE then
				local tmpValue = value

				value = msg_form_indent_json(value)

				local checkKeyTable = {}

				for key, _ in pairs(value) do
					checkKeyTable[key] = true
				end

				local metaTable = getmetatable(tmpValue)

				if metaTable then
					local allname = metaTable._getter

					if allname then
						for name, func in pairs(allname) do
							if not checkKeyTable[name] and type(tmpValue[name]) == "table" then
								value[name] = {}
							end
						end
					end
				end
			end

			res[field.name] = value

			if isCheckBreak then
				break
			end
		end
	end

	return res
end

function msg_form_indent_json_by_data(msg, name)
	if not msg.ListFields then
		msg = msg._listener._parent_message

		return msg_form_indent_json_by_data_deal(msg, name)[name]
	end

	if name ~= nil then
		name = "all_data_and_not_event_data"
	end

	return msg_form_indent_json_by_data_deal(msg, name)
end

function msg_format(msg)
	local out = {}

	local function write(value)
		out[#out + 1] = value
	end

	msg_format_indent(write, msg, 0)

	return table.concat(out)
end

function msg_decode(msg)
	local ans = msg_form_indent_json(msg)

	return ans
end

function msg_decode_data(data, name)
	local ans = msg_form_indent_json_by_data(data, name)

	return ans
end
