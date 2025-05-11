-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGiftBoxTextTable.lua

local ActivityGiftBoxTextTable = class("ActivityGiftBoxTextTable", import("app.common.tables.BaseTable"))

function ActivityGiftBoxTextTable:ctor()
	ActivityGiftBoxTextTable.super.ctor(self, "activity_giftbox_text_" .. string.lower(xyd.lang))
end

function ActivityGiftBoxTextTable:getName(id)
	return self:getString(id, "name")
end

return ActivityGiftBoxTextTable
