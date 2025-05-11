-- chunkname: @../../../Product/Bundles/Android/src/app/maps/BaseHomeObject.lua

local BaseHomeObject = class("BaseHomeObject")

function BaseHomeObject:ctor(buildingID, dressID, buildingGroupID)
	self._dressID = 0
	self.buildingGroupID = 0
	self.tableID = 0
	self.state = 0
	self.leftTime = 0
	self._worldX = 0
	self._worldY = 0
	self.gridX = 0
	self.gridY = 0
	self.type = 0
	self.zOrder = 0
	self.layerIndex = 0
	self.isEmpty_ = false
	self.startX = 0
	self.startY = 0
	self.endX = 0
	self.endY = 0
	self._class = nil
	self.id_ = buildingID
	self.dressID = dressID
	self.buildingGroupID = buildingGroupID
	self.goBuilding_ = nil
end

function BaseHomeObject:class(val)
	self._class = val
end

function BaseHomeObject:getID()
	return self.id_
end

function BaseHomeObject:getPos()
	return nil
end

function BaseHomeObject:addSpriteToDisplayList()
	return
end

function BaseHomeObject:removeSpriteFromDisplayList()
	return
end

return BaseHomeObject
