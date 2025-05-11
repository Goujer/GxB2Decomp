-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SettingTextTable.lua

local SettingTextTable = class("SettingTextTable", import("app.common.tables.BaseTable"))

function SettingTextTable:ctor()
	SettingTextTable.super.ctor(self, "setting_text_" .. tostring(xyd.Global.lang))
end

function SettingTextTable:getTitle(id)
	return self:getString(id, "title")
end

function SettingTextTable:getText(id)
	return self:getString(id, "text")
end

return SettingTextTable
