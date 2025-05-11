-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StarryAltarTable.lua

local StarryAltarTable = class("StarryAltarTable", import("app.common.tables.BaseTable"))

function StarryAltarTable:ctor()
	StarryAltarTable.super.ctor(self, "starry_altar")
end

function StarryAltarTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function StarryAltarTable:getOptionalAwards(id)
	return self:split2num(id, "optional_award", "|")
end

function StarryAltarTable:getType2Award(id)
	return self:split2Cost(id, "type2_award", "|#", true)
end

function StarryAltarTable:getExtraAward(id)
	return self:split2num(id, "extra_award", "#")
end

function StarryAltarTable:getBasicAward(id)
	local boxId = self:getDropBoxId(id)
	local dropboxShowTable = xyd.tables.dropboxShowTable
	local boxData = dropboxShowTable:getIdsByBoxId(boxId)
	local list = boxData.list

	table.sort(list)

	local allWeight = boxData.all_weight
	local awardList = {}

	for _, showId in ipairs(list) do
		local weight = dropboxShowTable:getWeight(showId)
		local prob = math.floor(10000 * weight / allWeight) / 100 .. "%"
		local data = {
			itemData = dropboxShowTable:getItem(showId),
			prob = prob
		}

		table.insert(awardList, data)
	end

	return awardList
end

function StarryAltarTable:getDropBoxId(id)
	return self:getNumber(id, "dropbox_id")
end

function StarryAltarTable:getWeight(id)
	return self:split2num(id, "wight", "|")
end

function StarryAltarTable:getActivity(id)
	return self:getNumber(id, "activity") or 0
end

return StarryAltarTable
