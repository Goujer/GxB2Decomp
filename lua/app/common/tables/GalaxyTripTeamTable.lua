-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripTeamTable.lua

local GalaxyTripTeamTable = class("GalaxyTripTeamTable", import("app.common.tables.BaseTable"))

function GalaxyTripTeamTable:ctor()
	GalaxyTripTeamTable.super.ctor(self, "galaxy_trip_team")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripTeamTable:getIDs()
	return self.ids_
end

function GalaxyTripTeamTable:getDesc(star, type)
	local ids = self:getIDs()
	local baseTextID
	local maxTableID = 0

	for i = 1, #ids do
		local type1 = self:getType(i)

		if type1 == type then
			local limit = self:getStarLimit(i)

			if limit <= star and (maxTableID == 0 or maxTableID > 0 and limit > self:getStarLimit(maxTableID)) then
				maxTableID = i
				baseTextID = self:getText(i)
			end

			baseTextID = baseTextID or self:getText(i)
		end
	end

	local text = xyd.tables.galaxyTripTeamTextTable:getDesc(baseTextID)
	local params1 = 0
	local params2 = 0
	local id = maxTableID

	if maxTableID > 0 then
		if type == 1 then
			params1 = self:getAtkP(id)
			params2 = self:getHpP(id)
		elseif type == 2 then
			params1 = self:getExploreTimeCut(id)
			params2 = self:getExplorePlaceAdd(id)
		elseif type == 3 then
			params1 = self:getAward1Add(id)
			params2 = self:getAward2Add(id)
		end
	end

	local add1 = params1
	local add2 = params2

	params1 = params1 * 100 .. "%"

	if type ~= 2 then
		params2 = params2 * 100 .. "%"
	end

	local desc = xyd.stringFormat(text, params1, params2)

	return desc, add1, add2
end

function GalaxyTripTeamTable:getType(id)
	return self:getNumber(id, "type")
end

function GalaxyTripTeamTable:getStarLimit(id)
	return self:getNumber(id, "star_limit")
end

function GalaxyTripTeamTable:getAtkP(id)
	return self:getNumber(id, "atkP")
end

function GalaxyTripTeamTable:getHpP(id)
	return self:getNumber(id, "hpP")
end

function GalaxyTripTeamTable:getExploreTimeCut(id)
	return self:getNumber(id, "explore_time_cut")
end

function GalaxyTripTeamTable:getExplorePlaceAdd(id)
	return self:getNumber(id, "explore_place_add")
end

function GalaxyTripTeamTable:getAward1Add(id)
	return self:getNumber(id, "award1_add")
end

function GalaxyTripTeamTable:getAward2Add(id)
	return self:getNumber(id, "award2_add")
end

function GalaxyTripTeamTable:getText(id)
	return self:getNumber(id, "text")
end

return GalaxyTripTeamTable
