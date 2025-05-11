-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmMissionTextTable.lua

local BaseTable = import(".BaseTable")
local ActivitySpfarmMissionTextTable = class("ActivitySpfarmMissionTextTable", BaseTable)

function ActivitySpfarmMissionTextTable:ctor()
	BaseTable.ctor(self, "activity_spfarm_task_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySpfarmMissionTextTable:getIds()
	return self.ids_
end

function ActivitySpfarmMissionTextTable:getDescription(id, ...)
	local content = self:getString(id, "content")
	local __args = {
		...
	}

	if not content or content == "" then
		content = self:getString(content, "translation")
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(content, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return ActivitySpfarmMissionTextTable
