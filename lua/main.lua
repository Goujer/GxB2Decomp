-- chunkname: @../../../Product/Bundles/Android/src/main.lua

function class(classname, super)
	local superType = type(super)
	local cls

	if superType ~= "table" then
		superType = nil
		super = nil
	end

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
	cls.__index = cls

	function cls.new(...)
		local instance = setmetatable({}, cls)

		instance.class = cls

		instance:ctor(...)

		return instance
	end

	return cls
end

function main()
	if jit then
		print("--------------------------turn off jit---------------------")
		jit.off()
		jit.flush()
	end

	require("tsfunctions")
	require("boot").run()
end
