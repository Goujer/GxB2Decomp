-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GirlsImgTextTable.lua

local GirlsImgTextTable = class("GirlsImgTextTable", import("app.common.tables.BaseTable"))

function GirlsImgTextTable:ctor()
	GirlsImgTextTable.super.ctor(self, "girls_img_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function GirlsImgTextTable:getIDs()
	return self.ids_
end

function GirlsImgTextTable:getTouchDialog(id, index)
	return self:getString(id, "click_dialog" .. index)
end

function GirlsImgTextTable:getEnterDialog(id)
	return self:getString(id, "enter_dialog")
end

function GirlsImgTextTable:getChooseDialog(id)
	return self:getString(id, "chosen_dialog1")
end

function GirlsImgTextTable:getTouchScale(id, index)
	return self:split2num(id, "click_dialog" .. index .. "_scale", "|")
end

function GirlsImgTextTable:getEnterScale(id)
	return self:split2num(id, "enter_dialog_scale", "|")
end

function GirlsImgTextTable:getChooseScale(id)
	return self:split2num(id, "chosen_dialog1_scale", "|")
end

return GirlsImgTextTable
