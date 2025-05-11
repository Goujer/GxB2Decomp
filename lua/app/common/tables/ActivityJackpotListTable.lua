-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJackpotListTable.lua

local ActivityJackpotListTable = class("ActivityJackpotListTable", import("app.common.tables.BaseTable"))

function ActivityJackpotListTable:ctor()
	ActivityJackpotListTable.super.ctor(self, "activity_jackpot_list")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityJackpotListTable:getIDs()
	return self.ids_
end

function ActivityJackpotListTable:getUsePic(id)
	return self:getString(id, "use_pic")
end

function ActivityJackpotListTable:getUsePicVague(id)
	return self:getString(id, "use_pic_vague")
end

function ActivityJackpotListTable:getUpdatedUsePic(id)
	return self:getString(id, "updated_use_pic")
end

function ActivityJackpotListTable:getUpdatedUsePicVague(id)
	return self:getString(id, "updated_use_pic_vague")
end

return ActivityJackpotListTable
