-- chunkname: @../../../Product/Bundles/Android/src/app/maps/BaseAnimation2D.lua

local BaseAnimation2D = class("BaseAnimation2D")
local SpriteRenderer = UnityEngine.SpriteRenderer

function BaseAnimation2D:ctor(go)
	self.go_ = go
	self.trans_ = go.transform
	self.offset_ = go:NodeByName("offset")
	self.renderer_ = self.offset_:ComponentByName("sprite", typeof(SpriteRenderer))
end

function BaseAnimation2D:getGameObject()
	return self.go_
end

function BaseAnimation2D:getOffset()
	return self.offset_
end

function BaseAnimation2D:getSpriteRenderer()
	return self.renderer_
end

function BaseAnimation2D:setActive(active)
	self.go_:SetActive(active)
end

function BaseAnimation2D:setSortingOrder(order)
	self.renderer_.sortingOrder = order
end

function BaseAnimation2D:getPosition()
	return self.trans_.localPosition
end

function BaseAnimation2D:dispose()
	self:setActive(false)
	UnityEngine.Object.Destroy(self.go_)

	self.go_ = nil
	self.trans_ = nil
	self.offset_ = nil
	self.renderer_ = nil
end

function BaseAnimation2D:setName(name)
	self.go_.name = name
end

return BaseAnimation2D
