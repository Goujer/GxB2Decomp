-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleBuffTextTable.lua

local ShrineHurdleBuffTextTable = class("ShrineHurdleBuffTextTable", import("app.common.tables.BaseTable"))

function ShrineHurdleBuffTextTable:ctor()
	ShrineHurdleBuffTextTable.super.ctor(self, "shrine_hurdle_buff_text_" .. tostring(xyd.Global.lang))
end

function ShrineHurdleBuffTextTable:getTitle(id)
	return self:getString(id, "title")
end

function ShrineHurdleBuffTextTable:getDesc(id, ...)
	local __args = {
		...
	}
	local formatStr = self:getString(id, "desc")
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return ShrineHurdleBuffTextTable
