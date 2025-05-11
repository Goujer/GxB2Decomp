-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmPolicyTextTable.lua

local ActivitySpfarmPolicyTextTable = class("ActivitySpfarmPolicyTextTable", import("app.common.tables.BaseTable"))

function ActivitySpfarmPolicyTextTable:ctor()
	ActivitySpfarmPolicyTextTable.super.ctor(self, "activity_spfarm_policy_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySpfarmPolicyTextTable:getDesc(id, ...)
	local __args = {
		...
	}
	local formatStr = self:getString(id, "content")
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

function ActivitySpfarmPolicyTextTable:getTitle(id)
	return self:getString(id, "title")
end

return ActivitySpfarmPolicyTextTable
