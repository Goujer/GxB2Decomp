-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityVampireTaskTextTable.lua

local ActivityVampireTaskTextTable = class("ActivityVampireTaskTextTable", import("app.common.tables.BaseTable"))

function ActivityVampireTaskTextTable:ctor()
	ActivityVampireTaskTextTable.super.ctor(self, "activity_vampire_task_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityVampireTaskTextTable:getIDs()
	return self.ids_
end

function ActivityVampireTaskTextTable:getBrief(id, ...)
	local formatStr = self:getString(id, "brief")
	local __args = {
		...
	}
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	return result
end

function ActivityVampireTaskTextTable:getText(id, ...)
	return self:getString(id, "text")
end

return ActivityVampireTaskTextTable
