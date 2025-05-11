-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExpPlayerTable.lua

local ExpPlayerTable = class("ExpPlayerTable", import("app.common.tables.BaseTable"))

function ExpPlayerTable:ctor()
	ExpPlayerTable.super.ctor(self, "exp_player")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ExpPlayerTable:getIDs()
	return self.ids_
end

function ExpPlayerTable:needExp(id)
	return self:getNumber(id, "need_exp")
end

function ExpPlayerTable:allExp(id)
	return self:getNumber(id, "all_exp")
end

function ExpPlayerTable:levelReward(id)
	return self:split2num(id, "level_reward", "#")
end

return ExpPlayerTable
