-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialBuffTextTable.lua

local NewTrialBuffTextTable = class("NewTrialBuffTextTable", import("app.common.tables.BaseTable"))

function NewTrialBuffTextTable:ctor()
	NewTrialBuffTextTable.super.ctor(self, "new_trial_buff_text_" .. tostring(xyd.Global.lang))
end

function NewTrialBuffTextTable:getName(id)
	return self:getString(id, "name")
end

function NewTrialBuffTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return NewTrialBuffTextTable
