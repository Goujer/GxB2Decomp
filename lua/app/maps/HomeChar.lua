-- chunkname: @../../../Product/Bundles/Android/src/app/maps/HomeChar.lua

local HomeChar = class("HomeChar", import(".BaseHomeObject"))

function HomeChar:ctor(map, charID)
	HomeChar.super.ctor(self)

	self._map = map
	self._charID = charID
end

function HomeChar:setPos(x, y)
	self._gridX = x
	self._gridY = y
end

function HomeChar:initData(charID, dressID, buildingGroupID)
	self.id_ = charID
	self._dressID = 1
	self._buildingGroupID = charID
end

function HomeChar:updateSpriteBoundCache(buildingID, dressID, bound)
	return
end

function HomeChar:hitTest(position)
	return false
end

function HomeChar:getGridPos()
	return Vector2(self._gridX, self._gridY)
end

function HomeChar:getPos()
	if self.charSprite_ and not tolua.isnull(self.charSprite_._model3D) then
		return Vector2(self.charSprite_._model3D.transform.localPosition.x, self.charSprite_._model3D.transform.localPosition.y)
	end

	return nil
end

function HomeChar:getPos3D()
	if self.charSprite_ and not tolua.isnull(self.charSprite_._model3D) then
		return Vector3(self.charSprite_._model3D.transform.localPosition.x, self.charSprite_._model3D.transform.localPosition.y, self.charSprite_._model3D.transform.localPosition.z)
	end

	return nil
end

function HomeChar:setRotation(angle)
	self.charSprite_:setRotation(angle)
end

function HomeChar:setDir(dir, callBack)
	if callBack == nil then
		callBack = nil
	end

	if self.charSprite_ then
		self.charSprite_:setDir(dir, callBack)
	end
end

function HomeChar:addSpriteToDisplayList()
	if self.charSprite_ == nil then
		self.charSprite_ = import("app.maps.HomeCharSprite").new(self)
	end

	self.charSprite_:updateDisplay(self, self._map)
end

function HomeChar:removeSpriteFromDisplayList()
	if self.charSprite_ ~= nil then
		self.charSprite_:dispose()

		self.charSprite_ = nil
	end

	self._visible = false
end

function HomeChar:moveFromTo(time, startGridX, startGridY, endGridX, endGridY, callback)
	if self.charSprite_ ~= nil then
		local startGridPosition = Vector3(startGridX, startGridY, self.charSprite_._model3D.transform.localPosition.x)
		local startWorldPos = xyd.CameraManager:get():gridToWorldPoint(startGridPosition)
		local endWorldPos = xyd.CameraManager:get():gridToWorldPoint(Vector3(endGridX, endGridY, self.charSprite_._model3D.transform.localPosition.x))

		self:setPos(endGridX, endGridY)

		local oldPos = self.charSprite_._model3D.transform.localPosition

		oldPos.x = startWorldPos.x
		oldPos.y = startWorldPos.y

		if not tolua.isnull(self.sequence_) then
			self.sequence_:Kill(false)
		end

		self.charSprite_._model3D.transform.localPosition = oldPos

		if time > 0.0001 then
			self:newSequence()

			local transf = self.charSprite_._model3D.transform

			self.sequence_:Append(transf:DOLocalMoveX(endWorldPos.x, time):SetEase(DG.Tweening.Ease.Linear))
			self.sequence_:Insert(0, transf:DOLocalMoveY(endWorldPos.y, time):SetEase(DG.Tweening.Ease.Linear))

			if callback ~= nil then
				self.sequence_:AppendCallback(callback)
			end
		end
	end
end

function HomeChar:destroySelf()
	self:killTw()

	if self.charSprite_ then
		self.charSprite_:dispose()
	end

	self:removeSpriteFromDisplayList()
end

function HomeChar:playAnimation(anim, dir, call, timeScale)
	if self.charSprite_ then
		self.charSprite_:playAnimation(anim, dir, call, timeScale)
	end
end

function HomeChar:resetAnimation()
	self.charSprite_:resetAnimation()
end

function HomeChar:playIdle()
	self.charSprite_:playIdel()
end

function HomeChar:getLastLayer()
	return self._lastLayer
end

function HomeChar:setDisplayLayer(layer)
	return
end

function HomeChar:killTw()
	if self.sequence_ then
		self.sequence_:Kill(false)
	end

	self.sequence_ = nil
end

function HomeChar:getSprite()
	return self.charSprite_
end

function HomeChar:updateAnimation(renderer, movedTicks)
	self.charSprite_:updateAnimation(renderer, movedTicks)
end

function HomeChar:newSequence()
	if not tolua.isnull(self.sequence_) then
		self.sequence_:Kill(false)
	end

	self.sequence_ = DG.Tweening.DOTween.Sequence()
end

return HomeChar
