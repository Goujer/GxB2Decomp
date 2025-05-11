-- chunkname: @../../../Product/Bundles/Android/src/app/maps/BaseBuilding.lua

local BaseBuilding = class("BaseBuilding")

function BaseBuilding:ctor(id, pnode)
	self.id_ = id
	self.pnode_ = pnode
	self.goBuilding_ = nil
	self.name_ = nil
	self.isLoaded_ = false
end

function BaseBuilding:onClick()
	return
end

function BaseBuilding:getID()
	return self.id_
end

function BaseBuilding:getPosition()
	return self.position_
end

function BaseBuilding:getName()
	return self.name_
end

function BaseBuilding:dispose()
	self.disposed_ = true
end

function BaseBuilding:isLoaded()
	return self.isLoaded_
end

return BaseBuilding
