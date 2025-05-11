-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/EquipTextTable.lua

local EquipTextTable = class("EquipTextTable", import("app.common.tables.BaseTable"))

function EquipTextTable:ctor()
	EquipTextTable.super.ctor(self, "equip_text_" .. tostring(xyd.Global.lang))
end

function EquipTextTable:getName(id)
	return self:getString(id, "name")
end

function EquipTextTable:getSuitName(id)
	return self:getString(id, "suit_name")
end

function EquipTextTable:getSkinDesc(id)
	return self:getString(id, "skin_text")
end

return EquipTextTable
