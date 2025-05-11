-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEntranceTestGuessBattle.lua

local ActivityEntranceTestGuessBattle = class("ActivityEntranceTestGuessBattle", import(".BaseTable"))

function ActivityEntranceTestGuessBattle:ctor()
	ActivityEntranceTestGuessBattle.super.ctor(self, "activity_warmup_guess_battle")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEntranceTestGuessBattle:getMonster2(id)
	return self:split2num(id, "monster2", "|")
end

function ActivityEntranceTestGuessBattle:getMonster1(id)
	return self:split2num(id, "monster1", "|")
end

function ActivityEntranceTestGuessBattle:getIds()
	return self.ids_
end

return ActivityEntranceTestGuessBattle
