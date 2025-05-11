-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PubMissionTable.lua

local PubMissionTable = class("PubMissionTable", import("app.common.tables.BaseTable"))

function PubMissionTable:ctor()
	PubMissionTable.super.ctor(self, "pub_mission")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function PubMissionTable:getStar(id)
	return self:getNumber(id, "star")
end

function PubMissionTable:getMissionTime(id)
	return self:getNumber(id, "mission_time")
end

function PubMissionTable:getNeedPower(id)
	return self:getNumber(id, "need_power")
end

function PubMissionTable:getPartnerNum(id)
	return self:getNumber(id, "partner_num")
end

function PubMissionTable:getPartnerStar(id)
	return self:getNumber(id, "partner_star")
end

function PubMissionTable:getSpeedupCost(id)
	return xyd.split(self:getString(id, "speedup_cost"), "#")
end

function PubMissionTable:getMaxStar()
	return #self.ids_
end

return PubMissionTable
