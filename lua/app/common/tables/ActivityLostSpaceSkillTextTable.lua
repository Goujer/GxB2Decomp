-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLostSpaceSkillTextTable.lua

local ActivityLostSpaceSkillTextTable = class("ActivityLostSpaceSkillTextTable", import("app.common.tables.BaseTable"))

function ActivityLostSpaceSkillTextTable:ctor()
	ActivityLostSpaceSkillTextTable.super.ctor(self, "activity_lost_space_skill_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLostSpaceSkillTextTable:getIDs()
	return self.ids_
end

function ActivityLostSpaceSkillTextTable:getDesc(id, ...)
	local __args = {
		...
	}
	local formatStr = self:getString(id, "desc")

	if not formatStr then
		return id
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

function ActivityLostSpaceSkillTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityLostSpaceSkillTextTable:getIcon(id)
	return self:getString(id, "icon")
end

return ActivityLostSpaceSkillTextTable
