-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattlePassAward2Table.lua

local BattlePassAward2Table = class("BattlePass2Table", import(".BattlePassAwardTable"))
local BaseTable = import(".BaseTable")

function BattlePassAward2Table:ctor()
	BaseTable.ctor(self, "battlepass_award_2")

	self.ids_ = {}
	self.maxId_ = 0

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		if not self.maxId_ or self.maxId_ < tonumber(id) then
			self.maxId_ = tonumber(id)
		end
	end

	table.sort(self.ids_)
end

return BattlePassAward2Table
