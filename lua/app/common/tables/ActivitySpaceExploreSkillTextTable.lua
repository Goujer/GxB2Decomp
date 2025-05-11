-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExploreSkillTextTable.lua

local ActivitySpaceExploreSkillTextTable = class("ActivitySpaceExploreSkillTextTable", import("app.common.tables.BaseTable"))

function ActivitySpaceExploreSkillTextTable:ctor()
	ActivitySpaceExploreSkillTextTable.super.ctor(self, "activity_space_explore_skill_text_" .. xyd.Global.lang)
end

function ActivitySpaceExploreSkillTextTable:getDesc(id, values)
	local content = self:getString(id, "skill_desc")

	content = content or ""
	content = xyd.stringFormat(content, unpack(values))

	return content
end

return ActivitySpaceExploreSkillTextTable
