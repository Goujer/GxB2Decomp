-- chunkname: @../../../Product/Bundles/Android/src/app/maps/BaseHomeSprite.lua

local BaseHomeSprite = class("BaseHomeSprite")

function BaseHomeSprite:ctor(building)
	self.id_ = 0
	self.pnode_ = nil
	self.goBuilding_ = nil
	self.name_ = nil
	self.isLoaded_ = false
	self._dressIndex = 0
	self.zOrder = 0
	self.layerIndex = 0
	self.building_ = building
	self.goBuilding_ = nil
	self.pnode_ = building.map
end

function BaseHomeSprite:onClick()
	return
end

function BaseHomeSprite:getID()
	return self.id_
end

function BaseHomeSprite:getPosition()
	return self.position_
end

function BaseHomeSprite:getName()
	return self.name_
end

function BaseHomeSprite:dispose()
	self.disposed_ = true
end

function BaseHomeSprite:isLoaded()
	return self.isLoaded_
end

function BaseHomeSprite:updateAnchorOffset()
	return
end

function BaseHomeSprite:playOnClickAnimation()
	return
end

function BaseHomeSprite:hitTest(position)
	return false
end

function BaseHomeSprite:reset()
	return
end

return BaseHomeSprite
