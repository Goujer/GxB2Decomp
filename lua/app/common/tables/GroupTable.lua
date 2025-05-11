-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GroupTable.lua

local GroupTable = class("GroupTable", import("app.common.tables.BaseTable"))

function GroupTable:ctor()
	GroupTable.super.ctor(self, "group")
end

function GroupTable:getRestraintGroup(id)
	id = tostring(id)

	return self:getNumber(id, "restraint_group")
end

function GroupTable:getGroupIds()
	local res = {}

	for key, _ in pairs(self.TableLua.rows) do
		table.insert(res, self:getNumber(key, "id"))
	end

	return res
end

function GroupTable:getName(id)
	return xyd.tables.groupTextTable:getName(id)
end

function GroupTable:isRestraint(actor, actee)
	if actor:isPet() or actor:isGod() then
		return false
	end

	local actorGroupID = actor:getGroup()
	local acteeGroupID = actee:getGroup()
	local actorRestraintID = self:getRestraintGroup(actorGroupID)

	if actorRestraintID == 0 or acteeGroupID == 0 then
		return false
	end

	if actorRestraintID == acteeGroupID then
		return true
	end

	return false
end

function GroupTable:getStarOriginImg1(id)
	return self:getString(id, "star_origin_img1")
end

function GroupTable:getStarOriginImg2(id)
	return self:getString(id, "star_origin_img2")
end

return GroupTable
