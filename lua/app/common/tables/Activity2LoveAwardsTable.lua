-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity2LoveAwardsTable.lua

local Activity2LoveAwardsTable = class("Activity2LoveAwardsTable", import("app.common.tables.BaseTable"))

function Activity2LoveAwardsTable:ctor()
	Activity2LoveAwardsTable.super.ctor(self, "activity_2love_awards")

	self.ids_ = {}
	self.groupList_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local group = self:getGroup(id)

		if not self.groupList_[group] then
			self.groupList_[group] = {}
		end

		table.insert(self.groupList_[group], tonumber(id))
	end

	table.sort(self.ids_)
end

function Activity2LoveAwardsTable:getImgName(id)
	return self:getString(id, "image")
end

function Activity2LoveAwardsTable:getFlip(id)
	return self:getNumber(id, "is_flip")
end

function Activity2LoveAwardsTable:getGroup(id)
	return self:getNumber(id, "group")
end

function Activity2LoveAwardsTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function Activity2LoveAwardsTable:getAward(id)
	return self:split2num(id, "awards", "#")
end

function Activity2LoveAwardsTable:getAnimationName(id)
	return self:getString(id, "animation")
end

function Activity2LoveAwardsTable:getIDs()
	return self.ids_
end

function Activity2LoveAwardsTable:getGroupList()
	return self.groupList_
end

return Activity2LoveAwardsTable
