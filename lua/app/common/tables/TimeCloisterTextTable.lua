-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterTextTable.lua

local TimeCloisterTextTable = class("TimeCloisterTextTable", import("app.common.tables.BaseTable"))

function TimeCloisterTextTable:ctor()
	TimeCloisterTextTable.super.ctor(self, "time_cloister_text_" .. xyd.Global.lang)
end

function TimeCloisterTextTable:getName(id)
	return self:getString(id, "name")
end

function TimeCloisterTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return TimeCloisterTextTable
