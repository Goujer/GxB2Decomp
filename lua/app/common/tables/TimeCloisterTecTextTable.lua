-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterTecTextTable.lua

local TimeCloisterTecTextTable = class("TimeCloisterTecTextTable", import("app.common.tables.BaseTable"))

function TimeCloisterTecTextTable:ctor()
	TimeCloisterTecTextTable.super.ctor(self, "time_cloister_tec_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterTecTextTable:getIDs()
	return self.ids_
end

function TimeCloisterTecTextTable:getName(id)
	return self:getString(id, "name")
end

function TimeCloisterTecTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function TimeCloisterTecTextTable:getUnlockDesc(id)
	return self:getString(id, "unlock")
end

return TimeCloisterTecTextTable
