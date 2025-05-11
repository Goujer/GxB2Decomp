-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJigsawPicTextTable.lua

local ActivityJigsawPicTextTable = class("ActivityJigsawPicTextTable", import("app.common.tables.BaseTable"))

function ActivityJigsawPicTextTable:ctor()
	ActivityJigsawPicTextTable.super.ctor(self, "activity_jigsaw_pic_text_" .. string.lower(xyd.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityJigsawPicTextTable:getName(id)
	return self:getString(id, "name")
end

return ActivityJigsawPicTextTable
