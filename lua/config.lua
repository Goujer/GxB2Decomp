-- chunkname: @../../../Product/Bundles/Android/src/config.lua

function __TRACE(...)
	if UNITY_EDITOR or UNITY_STANDALONE then
		local str = ""

		for i = 1, select("#", ...) do
			str = str .. tostring(select(i, ...))
			str = str .. "    "
		end

		print(str, "\n" .. debug.traceback("", 1))
	end
end

function __TRACE_F(...)
	if UNITY_EDITOR or UNITY_STANDALONE then
		printf(...)
	end
end

if UNITY_EDITOR or UNITY_STANDALONE then
	require("base.misc.strict")
end
