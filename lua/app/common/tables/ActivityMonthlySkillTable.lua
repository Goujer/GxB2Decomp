-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMonthlySkillTable.lua

local ActivityMonthlySkillTable = class("ActivityMonthlySkillTable", import("app.common.tables.BaseTable"))

function ActivityMonthlySkillTable:ctor()
	ActivityMonthlySkillTable.super.ctor(self, "activity_monthly_stage_skill")

	self.ids_ = {}
	self.areaList = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local area_id = self:getSkillArea(id)

		if not self.areaList[area_id] then
			self.areaList[area_id] = {}
		end

		table.insert(self.areaList[area_id], tonumber(id))
	end

	table.sort(self.ids_)

	for _, list in ipairs(self.areaList) do
		table.sort(list)
	end
end

function ActivityMonthlySkillTable:getIDs()
	return self.ids_
end

function ActivityMonthlySkillTable:getIDsByArea()
	return self.areaList
end

function ActivityMonthlySkillTable:getPos(id)
	return self:split2num(id, "place", "|")
end

function ActivityMonthlySkillTable:getIconImg(id)
	return self:getString(id, "icon_id")
end

function ActivityMonthlySkillTable:getSkillArea(id)
	return self:getNumber(id, "area_id")
end

function ActivityMonthlySkillTable:getDescText(id, lev)
	local skillList = self:split2num(id, "text_id", "|")

	if lev == 0 then
		lev = 1
	end

	if skillList[lev] and skillList[lev] > 0 then
		return xyd.tables.activityMonthlySkillTextTable:getDesc(skillList[lev])
	else
		return ""
	end
end

function ActivityMonthlySkillTable:getSkillName(id)
	local skillList = self:split2num(id, "text_id", "|")

	return xyd.tables.activityMonthlySkillTextTable:getName(skillList[1])
end

function ActivityMonthlySkillTable:getLimit(id)
	return self:split2Cost(id, "limit", "|#")
end

function ActivityMonthlySkillTable:getFollowID(id)
	return self:split2num(id, "follow_id", "|")
end

function ActivityMonthlySkillTable:getCost(id)
	return self:getNumber(id, "skill_cost")
end

function ActivityMonthlySkillTable:getLevMax(id)
	local skillList = self:split2num(id, "skill_id", "|")

	return #skillList
end

function ActivityMonthlySkillTable:getSkillList(id)
	local skillList = self:split2num(id, "skill_id", "|")

	return skillList
end

function ActivityMonthlySkillTable:translate(formatStr, ...)
	local __args = {
		...
	}
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return ActivityMonthlySkillTable
