-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattlePass2Table.lua

local BattlePass2Table = class("BattlePass2Table", import(".BattlePassTable"))
local BaseTable = import(".BaseTable")

function BattlePass2Table:ctor()
	BaseTable.ctor(self, "battlepass_2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

return BattlePass2Table
