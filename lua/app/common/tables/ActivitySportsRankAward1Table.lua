-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsRankAward1Table.lua

local BaseTable = import(".BaseTable")
local ActivitySportsRankAward1Table = class("ActivitySportsRankAward1Table", BaseTable)

function ActivitySportsRankAward1Table:ctor()
	ActivitySportsRankAward1Table.super.ctor(self, "activity_sports_rank_award1")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySportsRankAward1Table:getIds()
	return self.ids_
end

function ActivitySportsRankAward1Table:getRankInfo(rank, totalNum, id)
	rank = tonumber(rank)

	if not id and rank then
		for i in pairs(self.ids_) do
			if self:getIsPercentage(self.ids_[i]) == "1" and rank / totalNum <= tonumber(self:getRank(self.ids_[i])) then
				id = self.ids_[i]

				break
			end

			local interval = xyd.split(self:getRankText(self.ids_[i]), "-", true)

			if not interval[2] and rank == interval[1] then
				id = self.ids_[i]

				break
			elseif interval[2] and rank >= interval[1] and rank <= interval[2] then
				id = self.ids_[i]

				break
			end
		end
	end

	local rankText = self:getRankText(id)

	if totalNum == 0 or rank == 0 then
		rankText = ""
	end

	return {
		rank = self:getRank(id),
		rankText = rankText,
		award = self:getAwards(id),
		seasonAward = self:getSeasonAward(id)
	}
end

function ActivitySportsRankAward1Table:getIsPercentage(id)
	return self:getString(id, "is_percentage")
end

function ActivitySportsRankAward1Table:getRank(id)
	return self:getNumber(id, "rank") or "0"
end

function ActivitySportsRankAward1Table:getRankText(id)
	local str = self:getString(id, "rank_front") or "0"

	if #xyd.split(str, "0%.", false, true) == 2 then
		local num = tonumber(str)

		str = tostring(num * 100) .. "%"
	end

	return str
end

function ActivitySportsRankAward1Table:getSeasonAward(id)
	local awards = xyd.split(self:getString(id, "season_awards"), "|")
	local result = {}

	for i in pairs(awards) do
		local award = xyd.split(awards[i], "#", true)

		table.insert(result, {
			item_id = award[1],
			item_num = award[2]
		})
	end

	return result
end

function ActivitySportsRankAward1Table:getAwards(id)
	local awards = xyd.split(self:getString(id, "awards"), "|")
	local result = {}

	for i in pairs(awards) do
		local award = xyd.split(awards[i], "#", true)

		if award[1] then
			table.insert(result, {
				item_id = award[1],
				item_num = award[2]
			})
		end
	end

	return result
end

return ActivitySportsRankAward1Table
