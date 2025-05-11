-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialBuffTable.lua

local NewTrialBuffTable = class("NewTrialBuffTable", import("app.common.tables.BaseTable"))

function NewTrialBuffTable:ctor()
	NewTrialBuffTable.super.ctor(self, "new_trial_buff")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function NewTrialBuffTable:getName(id)
	return xyd.tables.newTrialBuffTextTable:getName(id)
end

function NewTrialBuffTable:getDesc(id)
	return xyd.tables.newTrialBuffTextTable:getDesc(id)
end

function NewTrialBuffTable:getIcon(id)
	return self:getString(id, "icon")
end

return NewTrialBuffTable
