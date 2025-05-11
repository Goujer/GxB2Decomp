-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GirlsModelTextTable.lua

local GirlsModelTextTable = class("GirlsModelTextTable", import("app.common.tables.BaseTable"))

function GirlsModelTextTable:ctor()
	GirlsModelTextTable.super.ctor(self, "girls_model_text_" .. tostring(xyd.Global.lang))
end

function GirlsModelTextTable:getTouchDialog(id, index)
	return self:getString(id, "click_dialog" .. tostring(index))
end

function GirlsModelTextTable:getEnterDialog(id)
	return self:getString(id, "enter_dialog")
end

function GirlsModelTextTable:getChooseDialog(id)
	return self:getString(id, "chosen_dialog1")
end

return GirlsModelTextTable
