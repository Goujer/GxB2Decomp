-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DynamicGiftItemTable.lua

local BaseTable = import(".BaseTable")
local DynamicGiftItemTable = class("DynamicGiftItemTable", BaseTable)

function DynamicGiftItemTable:ctor()
	BaseTable.ctor(self, "dynamic_gift_item")
end

function DynamicGiftItemTable:getName(id)
	return xyd.tables.jobTextTable:getName(id)
end

function DynamicGiftItemTable:getAwardItemId(id)
	return self:getNumber(id, "award_item_id")
end

function DynamicGiftItemTable:getTimes(id)
	return self:getNumber(id, "times")
end

function DynamicGiftItemTable:getType(id)
	return self:getNumber(id, "type")
end

return DynamicGiftItemTable
