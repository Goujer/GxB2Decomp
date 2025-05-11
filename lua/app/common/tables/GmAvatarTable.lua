-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GmAvatarTable.lua

local GmAvatarTable = class("GmAvatarTable", import("app.common.tables.BaseTable"))

function GmAvatarTable:ctor()
	GmAvatarTable.super.ctor(self, "gm_avatar")
end

function GmAvatarTable:getName(id)
	return self:getString(id, "name")
end

function GmAvatarTable:getItemId(id)
	return self:getNumber(id, "item_id")
end

return GmAvatarTable
