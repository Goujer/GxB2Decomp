-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJigsawPicTable.lua

local ActivityJigsawPicTable = class("ActivityJigsawPicTable", import("app.common.tables.BaseTable"))

function ActivityJigsawPicTable:ctor()
	ActivityJigsawPicTable.super.ctor(self, "activity_jigsaw_pic")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityJigsawPicTable:getIds()
	return self.ids_
end

function ActivityJigsawPicTable:getPicture(id)
	return self:split2Cost(id, "picture", "|")
end

function ActivityJigsawPicTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityJigsawPicTable:getAvatarSrc(id)
	return self:getString(id, "avatar_png")
end

function ActivityJigsawPicTable:getPicSrc(id)
	return self:getString(id, "picture_png")
end

return ActivityJigsawPicTable
