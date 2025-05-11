-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityValentineAwardTable.lua

local ActivityValentineAwardTable = class("ActivityValentineAwardTable", import("app.common.tables.BaseTable"))

function ActivityValentineAwardTable:ctor()
	ActivityValentineAwardTable.super.ctor(self, "activity_valentine_awards")
end

function ActivityValentineAwardTable:getAward(id)
	return self:split2num(id, "item", "#")
end

return ActivityValentineAwardTable
