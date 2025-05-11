-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StageTextTable.lua

local StageTextTable = class("StageTextTable", import("app.common.tables.BaseTable"))

function StageTextTable:ctor()
	StageTextTable.super.ctor(self, "stage_text_" .. tostring(xyd.Global.lang))
end

function StageTextTable:getFortId(id)
	return self:getNumber(id, "fort_id")
end

function StageTextTable:getName(id)
	return self:getString(id, "name")
end

function StageTextTable:getTipsDialog(id)
	local str = self:getString(id, "tips_dialog")

	if not str then
		return {}
	else
		return xyd.split(str, "|")
	end
end

return StageTextTable
