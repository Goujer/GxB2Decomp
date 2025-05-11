-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterBattleTextTable.lua

local TimeCloisterBattleTextTable = class("TimeCloisterBattleTextTable", import("app.common.tables.BaseTable"))

function TimeCloisterBattleTextTable:ctor()
	TimeCloisterBattleTextTable.super.ctor(self, "time_cloister_battle_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterBattleTextTable:getIDs()
	return self.ids_
end

function TimeCloisterBattleTextTable:getName(id)
	return self:getString(id, "name")
end

function TimeCloisterBattleTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return TimeCloisterBattleTextTable
