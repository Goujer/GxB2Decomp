-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleCellTable.lua

local ActivityFairyTaleCellTable = class("ActivityFairyTaleCellTable", import(".BaseTable"))

function ActivityFairyTaleCellTable:ctor()
	ActivityFairyTaleCellTable.super.ctor(self, "activity_fairytale_cell")

	self.ids_ = {}
	self.idsByMapId_ = {}
	self.mapCellNum_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local mapType = self:getMapId(id)
		local cellType = self:getCellType(id)

		if not self.idsByMapId_[mapType] then
			self.idsByMapId_[mapType] = {}
		end

		if not self.mapCellNum_[mapType] then
			self.mapCellNum_[mapType] = 0
		end

		table.insert(self.idsByMapId_[mapType], tonumber(id))

		if cellType ~= 0 then
			self.mapCellNum_[mapType] = self.mapCellNum_[mapType] + 1
		end
	end

	table.sort(self.ids_)

	for i = 1, 6 do
		table.sort(self.idsByMapId_[i])
	end
end

function ActivityFairyTaleCellTable:getCellType(id)
	return self:getNumber(id, "cell_type")
end

function ActivityFairyTaleCellTable:getCellPos(id)
	return self:split2Cost(id, "cell_xy", "|", true)
end

function ActivityFairyTaleCellTable:getMapCellNum(map_id)
	return self.mapCellNum_[map_id]
end

function ActivityFairyTaleCellTable:getMapId(id)
	return self:getNumber(id, "map_id")
end

function ActivityFairyTaleCellTable:getCellContent(id)
	return self:getNumber(id, "cell_content")
end

function ActivityFairyTaleCellTable:getIsMain(id)
	return self:getNumber(id, "is_main")
end

function ActivityFairyTaleCellTable:getIsPoint(id)
	return self:getNumber(id, "is_point")
end

function ActivityFairyTaleCellTable:getIconName(id)
	return self:getString(id, "cell_img")
end

function ActivityFairyTaleCellTable:getIdsByMap(map)
	return self.idsByMapId_[map]
end

function ActivityFairyTaleCellTable:getName(id)
	return xyd.tables.activityFairyTaleCellTextTable:getName(id)
end

function ActivityFairyTaleCellTable:getDesc(id)
	return xyd.tables.activityFairyTaleCellTextTable:getDesc(id)
end

function ActivityFairyTaleCellTable:getCellNum(id)
	return xyd.tables.activityFairyTaleCellTextTable:getNum(id)
end

return ActivityFairyTaleCellTable
