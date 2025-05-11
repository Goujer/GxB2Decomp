-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SkinTextTable.lua

local SkinTextTable = class("SkinTextTable", import("app.common.tables.BaseTable"))

function SkinTextTable:ctor()
	SkinTextTable.super.ctor(self, "skin_text_" .. tostring(xyd.Global.lang))
end

function SkinTextTable:getUnlockDesc(id)
	return self:getString(id, "unlock_desc")
end

return SkinTextTable
