-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewbieCampTextTable.lua

local BaseTable = import(".BaseTable")
local NewbieCampTextTable = class("NewbieCampTextTable", BaseTable)

function NewbieCampTextTable:ctor()
	BaseTable.ctor(self, "beginner_quest_text_" .. tostring(xyd.Global.lang))
end

function NewbieCampTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return NewbieCampTextTable
