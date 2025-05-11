-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/framework/cocos.lua

local _t = {}

function _t.class(classname, super)
	local superType = type(super)
	local cls

	if superType ~= "function" and superType ~= "table" then
		superType = nil
		super = nil
	end

	if superType == "function" or super and super.__ctype == 1 then
		cls = {}

		if superType == "table" then
			for k, v in pairs(super) do
				cls[k] = v
			end

			cls.__create = super.__create
			cls.super = super
		else
			cls.__create = super

			function cls.ctor()
				return
			end
		end

		cls.__cname = classname
		cls.__ctype = 1

		function cls.new(...)
			local instance = cls.__create(...)

			for k, v in pairs(cls) do
				instance[k] = v
			end

			instance.class = cls

			instance:ctor(...)

			return instance
		end
	else
		if super then
			cls = {}

			setmetatable(cls, {
				__index = super
			})

			cls.super = super
		else
			cls = {
				ctor = function()
					return
				end
			}
		end

		cls.__cname = classname
		cls.__ctype = 2
		cls.__index = cls

		function cls.new(...)
			local instance = setmetatable({}, cls)

			instance.class = cls

			instance:ctor(...)

			return instance
		end
	end

	return cls
end

function _t.import(moduleName, currentModuleName)
	local currentModuleNameParts
	local moduleFullName = moduleName
	local offset = 1

	while true do
		if string.byte(moduleName, offset) ~= 46 then
			moduleFullName = string.sub(moduleName, offset)

			if currentModuleNameParts and #currentModuleNameParts > 0 then
				moduleFullName = table.concat(currentModuleNameParts, ".") .. "." .. moduleFullName
			end

			break
		end

		offset = offset + 1

		if not currentModuleNameParts then
			if not currentModuleName then
				local n, v = debug.getlocal(3, 1)

				currentModuleName = v
			end

			currentModuleNameParts = _t.string.split(currentModuleName, ".")
		end

		table.remove(currentModuleNameParts, #currentModuleNameParts)
	end

	return require(moduleFullName)
end

function _t.handler(obj, method)
	return function(...)
		return method(obj, ...)
	end
end

function _t.clone(object)
	local lookup_table = {}

	local function _copy(object)
		if type(object) ~= "table" then
			return object
		elseif lookup_table[object] then
			return lookup_table[object]
		end

		local new_table = {}

		lookup_table[object] = new_table

		for key, value in pairs(object) do
			new_table[_copy(key)] = _copy(value)
		end

		return setmetatable(new_table, getmetatable(object))
	end

	return _copy(object)
end

_t.string = {}

function _t.string.split(input, delimiter)
	input = tostring(input)
	delimiter = tostring(delimiter)

	if delimiter == "" then
		return false
	end

	local pos, arr = 0, {}

	for st, sp in function()
		return string.find(input, delimiter, pos, true)
	end do
		table.insert(arr, string.sub(input, pos, st - 1))

		pos = sp + 1
	end

	table.insert(arr, string.sub(input, pos))

	return arr
end

_t.Vector3 = Vector3
_t.Quaternion = Quaternion

function _t.getXinyoudi(ngx)
	return xyd
end

return _t
