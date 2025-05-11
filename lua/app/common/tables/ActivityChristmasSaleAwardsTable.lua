-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChristmasSaleAwardsTable.lua

local ActivityChristmasSaleAwardsTable = class("ActivityChristmasSaleAwardsTable", import("app.common.tables.BaseTable"))

function ActivityChristmasSaleAwardsTable:ctor()
	ActivityChristmasSaleAwardsTable.super.ctor(self, "activity_christmas_sale_awards")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityChristmasSaleAwardsTable:getIds()
	return self.ids
end

function ActivityChristmasSaleAwardsTable:getAwards(id, index)
	if tonumber(index) == 0 then
		return self:split2Cost(id, "award" .. index, "|#")
	else
		local colIndex = self.TableLua.keys["award" .. index]

		return xyd.split2(self.TableLua.rows[tostring(id)][colIndex], {
			"@",
			"|",
			"#"
		}, false)
	end
end

function ActivityChristmasSaleAwardsTable:getCost(id)
	return self:split(id, "cost", "#")
end

function ActivityChristmasSaleAwardsTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityChristmasSaleAwardsTable:getRequirement(id)
	return self:getNumber(id, "requirement")
end

function ActivityChristmasSaleAwardsTable:getOpAwardsNum(id)
	return self:getNumber(id, "num")
end

return ActivityChristmasSaleAwardsTable
