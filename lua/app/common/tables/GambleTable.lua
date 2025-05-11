-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GambleTable.lua

local GambleTable = class("GambleTable", import("app.common.tables.BaseTable"))

function GambleTable:ctor()
	GambleTable.super.ctor(self, "gamble")
end

function GambleTable:getDropBoxId(id)
	local selfLv = xyd.models.backpack:getLev()
	local index = 1
	local lv = self:getLv(id, index)

	while lv do
		if selfLv >= lv[1] and selfLv <= lv[2] then
			break
		end

		index = index + 1
		lv = self:getLv(id, index)
	end

	return self:getNumber(id, "dropbox_id" .. index)
end

function GambleTable:getLv(id, index)
	return self:split2num(id, "lv" .. index, "|")
end

return GambleTable
