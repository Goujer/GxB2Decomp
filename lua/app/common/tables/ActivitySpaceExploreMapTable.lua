-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExploreMapTable.lua

local ActivitySpaceExploreMapTable = class("ActivitySpaceExploreMapTable", import("app.common.tables.BaseTable"))

function ActivitySpaceExploreMapTable:ctor()
	ActivitySpaceExploreMapTable.super.ctor(self, "activity_space_explore_map")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySpaceExploreMapTable:getIds()
	return self.ids_
end

function ActivitySpaceExploreMapTable:getMonsterId(id)
	return self:split2Cost(id, "monster_id", "|", true)
end

function ActivitySpaceExploreMapTable:getBossId(id)
	return self:getNumber(id, "boss_id")
end

function ActivitySpaceExploreMapTable:getMapAwards(id)
	return self:split2Cost(id, "map_awards", "|#", true)
end

function ActivitySpaceExploreMapTable:getPlaceId(id)
	return self:split2Cost(id, "place_id", "|", true)
end

return ActivitySpaceExploreMapTable
