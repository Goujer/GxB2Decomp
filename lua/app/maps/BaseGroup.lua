-- chunkname: @../../../Product/Bundles/Android/src/app/maps/BaseGroup.lua

local BaseGroup = class("BaseGroup")

function BaseGroup:ctor()
	self.groupType_ = nil
	self.index_ = nil
	self.side_ = nil
	self.goNode_ = nil
	self.transRoot_ = nil
end

function BaseGroup:getIndex()
	return self.index_
end

function BaseGroup:getSide()
	return self.side_
end

function BaseGroup:getGroupType()
	return self.groupType_
end

function BaseGroup:updateGroup()
	return
end

function BaseGroup:init(params)
	return
end

function BaseGroup:pause(pause, trigger)
	return
end

function BaseGroup:isPaused()
	return false
end

function BaseGroup:getPosition()
	return self.transRoot_.localPosition
end

function BaseGroup:setPosition(pos)
	self.transRoot_.localPosition = pos
end

function BaseGroup:getRotation()
	return self.transRoot_.localRotation
end

function BaseGroup:setRotation(rotation)
	self.transRoot_.localRotation = rotation
end

function BaseGroup:createFlyItem(params)
	return
end

function BaseGroup:getRoot()
	return self.transRoot_
end

function BaseGroup:getNode()
	return self.goNode_
end

function BaseGroup:dispose()
	return
end

function BaseGroup:resetPos()
	return
end

return BaseGroup
