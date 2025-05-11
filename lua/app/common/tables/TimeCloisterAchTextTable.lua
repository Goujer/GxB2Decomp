-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterAchTextTable.lua

local TimeCloisterAchTextTable = class("TimeCloisterAchTextTable", import("app.common.tables.BaseTable"))

function TimeCloisterAchTextTable:ctor()
	TimeCloisterAchTextTable.super.ctor(self, "time_cloister_ach_text_" .. xyd.Global.lang)
end

function TimeCloisterAchTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return TimeCloisterAchTextTable
