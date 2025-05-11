-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GambleUpTable.lua

local GambleUpTable = class("GambleUpTable", import("app.common.tables.BaseTable"))

function GambleUpTable:ctor()
	GambleUpTable.super.ctor(self, "gamble_up")
end

function GambleUpTable:getDropBoxId(id)
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

function GambleUpTable:getLv(id, index)
	return self:split2num(id, "lv" .. index, "|")
end

return GambleUpTable
