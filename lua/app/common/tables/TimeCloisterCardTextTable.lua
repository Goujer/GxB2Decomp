-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterCardTextTable.lua

local TimeCloisterCardTextTable = class("TimeCloisterCardTextTable", import("app.common.tables.BaseTable"))

function TimeCloisterCardTextTable:ctor()
	TimeCloisterCardTextTable.super.ctor(self, "time_cloister_card_text_" .. xyd.Global.lang)
end

function TimeCloisterCardTextTable:getName(id)
	return self:getString(id, "name")
end

function TimeCloisterCardTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function TimeCloisterCardTextTable:getUnlockDesc(id)
	return self:getString(id, "unlock_desc")
end

return TimeCloisterCardTextTable
