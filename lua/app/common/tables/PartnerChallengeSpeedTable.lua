-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallengeSpeedTable.lua

local partnerChallengeSpeedTable = class("partnerChallengeSpeedTable", import("app.common.tables.BaseTable"))

function partnerChallengeSpeedTable:ctor()
	partnerChallengeSpeedTable.super.ctor(self, "partner_challenge_speed")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, self:Number(id))
	end

	table.sort(self.ids)
end

function partnerChallengeSpeedTable:getIDs()
	return self.ids
end

function partnerChallengeSpeedTable:getIdsByFort(fortID)
	return self.fortIds[fortID] or {}
end

function partnerChallengeSpeedTable:getIndex(fortID, id)
	local ids = self:getIdsByFort(fortID)
	local index = -1

	for i = 1, #ids do
		if ids[i] == id then
			index = i

			break
		end
	end

	return index
end

function partnerChallengeSpeedTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function partnerChallengeSpeedTable:isPuzzle(id)
	return self:getNumber(id, "is_puzzle") == 1
end

function partnerChallengeSpeedTable:getType(id)
	local fortID = self.getFortID(id)
	local ids = self.getIdsByFort(fortID)

	return self.getNumber(ids[0], "type")
end

function partnerChallengeSpeedTable:getReward1(id)
	return self:split2Cost(id, "reward1", "|#")
end

function partnerChallengeSpeedTable:getType(id)
	return 4
end

function partnerChallengeSpeedTable:plotId(id)
	return self:split2num(id, "plot_id", "#")
end

function partnerChallengeSpeedTable:chapterIcon(id)
	return self:getString(id, "chapter_icon")
end

function partnerChallengeSpeedTable:fortName(id)
	return xyd.tables.partnerChallengeTextTable:fortName(id)
end

function partnerChallengeSpeedTable:fortName2(id)
	return xyd.tables.partnerChallengeTextTable:fortName2(id)
end

function partnerChallengeSpeedTable:name(id)
	return xyd.tables.partnerChallengeTextTable:name(id)
end

function partnerChallengeSpeedTable:description(id)
	return xyd.tables.partnerChallengeTextTable:description(id)
end

function partnerChallengeSpeedTable:getFortID(id)
	return self:getNumber(id, "fort_id")
end

function partnerChallengeSpeedTable:getFortImg(id)
	return self:getString(self.fortIds[id][1], "fort_img")
end

function partnerChallengeSpeedTable:getIsActivity(id)
	return self:getNumber(id, "is_activity")
end

function partnerChallengeSpeedTable:getIsFirst(id)
	return self:getNumber(id, "fort_first")
end

function partnerChallengeSpeedTable:getPageNum()
	local num = 0

	for _, id in ipairs(self.ids) do
		if self:getIsFirst(id) == 0 then
			num = num + 1
		end
	end

	return num
end

return partnerChallengeSpeedTable
