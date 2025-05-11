-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DatesTextTable.lua

local DatesTextTable = class("DatesTextTable", import("app.common.tables.BaseTable"))

function DatesTextTable:ctor()
	DatesTextTable.super.ctor(self, "appointment_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function DatesTextTable:getText(lovePoint)
	local id = math.floor(lovePoint / 1000)

	return self:getString(id, "love_level_desc")
end

return DatesTextTable
