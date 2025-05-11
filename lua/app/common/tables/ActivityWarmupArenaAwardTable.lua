-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWarmupArenaAwardTable.lua

local BaseTable = import(".BaseTable")
local ActivityWarmupArenaAwardTable = class("ActivityWarmupArenaAwardTable", BaseTable)

function ActivityWarmupArenaAwardTable:ctor()
	BaseTable.ctor(self, "activity_warmup_arena_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityWarmupArenaAwardTable:getRankInfo(rank, totalNum, id)
	if not id then
		for i in pairs(self.ids_) do
			if self:getIsPercentage(self.ids_[i]) then
				if rank ~= nil and rank / totalNum <= tonumber(self:getRank(self.ids_[i])) / 100 then
					id = self.ids_[i]

					break
				end
			else
				local interval = xyd.split(self:getRankText(self.ids_[i]), "-", true)

				if interval[2] == nil and rank ~= nil and rank == interval[1] then
					id = self.ids_[i]

					break
				elseif #interval == 2 and rank ~= nil and rank >= interval[1] and rank <= interval[2] then
					id = self.ids_[i]

					break
				end
			end
		end
	end

	return {
		rank = self:getRank(id),
		rankText = self:getRankText(id),
		award = self:getAwards(id)
	}
end

function ActivityWarmupArenaAwardTable:getIds()
	return self.ids_
end

function ActivityWarmupArenaAwardTable:getRank(id)
	return self:getNumber(id, "rank") or "0"
end

function ActivityWarmupArenaAwardTable:getIsPercentage(id)
	return self:getString(id, "is_percentage") == "1"
end

function ActivityWarmupArenaAwardTable:getAwards(id)
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

function ActivityWarmupArenaAwardTable:getRankText(id)
	if id == 0 then
		return "100%"
	end

	local str = self:getString(id, "rank_front") or "100%"
	local lengthCheck = xyd.split(str, "0%.", false, true)

	if #lengthCheck == 2 then
		local num = tonumber(str)

		str = tostring(num * 100) .. "%"
	end

	return str
end

return ActivityWarmupArenaAwardTable
