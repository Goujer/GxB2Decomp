-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/VipTable.lua

local VipTable = class("VipTable", import("app.common.tables.BaseTable"))

function VipTable:ctor()
	VipTable.super.ctor(self, "vip")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function VipTable:getIDs()
	return self.ids_
end

function VipTable:needExp(id)
	return self:getNumber(id, "need_exp")
end

function VipTable:extraMidas(id)
	return self:getNumber(id, "extra_midas")
end

function VipTable:extraOutput(id)
	return self:getNumber(id, "extra_output")
end

function VipTable:getQuizBuyTimes(id)
	return self:getNumber(id, "quiz_buy_times")
end

function VipTable:getPubMissionNum(id)
	return self:getNumber(id, "pub_mission_num")
end

function VipTable:getSlotBase(id)
	return self:getNumber(id, "partners_limit")
end

function VipTable:getMidasTimes(id)
	return self:getNumber(id, "midas_buy_times")
end

function VipTable:canFiftySummon(id)
	return self:getNumber(id, "gacha_50times") == 1
end

function VipTable:canAutoAltar(id)
	return self:getNumber(id, "auto_transfer") == 1
end

function VipTable:judgeLoginDouble(id)
	return self:getNumber(id, "login_double") == 1
end

return VipTable
