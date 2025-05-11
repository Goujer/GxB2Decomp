-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewbieCampBoardTable.lua

local NewbieCampBoardTable = class("NewbieCampBoardTable", import("app.common.tables.BaseTable"))

function NewbieCampBoardTable:ctor()
	NewbieCampBoardTable.super.ctor(self, "beginner_quest_board")
end

function NewbieCampBoardTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function NewbieCampBoardTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function NewbieCampBoardTable:getUnlockLev(id)
	return self:getNumber(id, "unlock_lev")
end

return NewbieCampBoardTable
