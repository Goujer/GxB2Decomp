-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GirlsImgTable.lua

local GirlsImgTable = class("GirlsImgTable", import("app.common.tables.BaseTable"))

function GirlsImgTable:ctor()
	GirlsImgTable.super.ctor(self, "girls_img")

	self.ids_ = {}

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function GirlsImgTable:getIDs()
	return self.ids_
end

function GirlsImgTable:getResource(id)
	return self:getString(id, "resource")
end

function GirlsImgTable:getTouchTime(id, index)
	return self:getNumber(id, "click_dialog" .. index .. "_time")
end

function GirlsImgTable:getTouchScale(id, index)
	return self:split2num(id, "click_dialog" .. index .. "_scale", "|")
end

function GirlsImgTable:getEnterTime(id)
	return self:getNumber(id, "enter_dialog_time")
end

function GirlsImgTable:getEnterScale(id)
	return self:split2num(id, "enter_dialog_scale", "|")
end

function GirlsImgTable:getChooseTime(id)
	return self:getNumber(id, "chosen_dialog1_time")
end

function GirlsImgTable:getChooseScale(id)
	return self:split2num(id, "chosen_dialog1_scale", "|")
end

function GirlsImgTable:getTouchDialog(id, index)
	return xyd.tables.girlsImgTextTable:getTouchDialog(id, index)
end

function GirlsImgTable:getEnterDialog(id)
	return xyd.tables.girlsImgTextTable:getEnterDialog(id)
end

function GirlsImgTable:getChooseDialog(id)
	return xyd.tables.girlsImgTextTable:getChooseDialog(id)
end

return GirlsImgTable
