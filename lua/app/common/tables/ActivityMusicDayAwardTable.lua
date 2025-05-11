-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMusicDayAwardTable.lua

local ActivityMusicDayAwardTable = class("ActivityMusicDayAwardTable", import("app.common.tables.BaseTable"))

function ActivityMusicDayAwardTable:ctor()
	ActivityMusicDayAwardTable.super.ctor(self, "activity_music_day_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityMusicDayAwardTable:getRankInfo(rank, id)
	if not id then
		for i = 1, #self.ids_ do
			local interval = xyd.split(self:getRankText(self.ids_[i]), "-", true)

			if not interval[2] and rank == interval[1] then
				id = self.ids_[i]

				break
			elseif rank >= interval[1] and rank <= interval[2] then
				id = self.ids_[i + 1]

				break
			end
		end
	end

	return {
		rank = self:getRank(id),
		rankText = self:getRankText(id),
		award = self:getAward(id)
	}
end

function ActivityMusicDayAwardTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityMusicDayAwardTable:getRankText(id)
	return self:getString(id, "rank_front")
end

function ActivityMusicDayAwardTable:getAward(id)
	local awards = self:split2Cost(id, "awards", "|#")

	return awards
end

return ActivityMusicDayAwardTable
