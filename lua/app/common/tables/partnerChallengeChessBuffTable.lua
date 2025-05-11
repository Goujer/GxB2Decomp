-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/partnerChallengeChessBuffTable.lua

local partnerChallengeChessBuffTable = class("partnerChallengeChessBuffTable", import("app.common.tables.BaseTable"))

function partnerChallengeChessBuffTable:ctor()
	partnerChallengeChessBuffTable.super.ctor(self, "partner_challenge_chess_buff")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function partnerChallengeChessBuffTable:getType(id)
	return self:getNumber(id, "type")
end

function partnerChallengeChessBuffTable:getSkill(id)
	return self:split2Cost(id, "skill", "|")
end

function partnerChallengeChessBuffTable:getIconName(id)
	return self:getString(id, "icon")
end

function partnerChallengeChessBuffTable:getPoint(id)
	return self:getNumber(id, "point")
end

return partnerChallengeChessBuffTable
