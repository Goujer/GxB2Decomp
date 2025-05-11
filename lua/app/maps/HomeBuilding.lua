-- chunkname: @../../../Product/Bundles/Android/src/app/maps/HomeBuilding.lua

local HomeBuilding = class("HomeBuilding", import(".BaseHomeObject"))
local HomeBuildingTable = xyd.tables.building
local BuildingGroupTable = xyd.tables.buildingGroup
local HomeBuildingSprite = import("app.maps.HomeBuildingSprite")

function HomeBuilding:ctor(map, buildingID, dressID, buildingGroupID)
	HomeBuilding.super.ctor(self, buildingID, dressID, buildingGroupID)

	self.buildingID = -1
	self.isBuilding_ = false
	self._dressChanged = true
	self.canChangeDress = false
	self._inDelTween = false
	self.spriteBound = {
		0,
		0,
		0,
		0
	}

	self:initData(buildingID, dressID, buildingGroupID)

	self.map = map

	self:refreshBuilding()
end

function HomeBuilding:getGoBuilding()
	return self.buildingSprite_.goBuilding_
end

function HomeBuilding:getZorder()
	if self._conf then
		local type = self._conf.type

		if type == 0 then
			return 2
		end

		if type == 1 then
			return 1
		end

		if type == 2 then
			return 2
		end

		if type == 3 then
			return 2.1
		end

		if type == 4 then
			return 2.2
		end

		if type == 5 then
			return 2
		end

		if type == 6 then
			return 1.1
		end
	end

	return 0
end

function HomeBuilding:initData(buildingID, dressID, buildingGroupID)
	self.buildingID = buildingID
	self.tableID = buildingID
	self.dressID = dressID
	self.buildingGroupID = buildingGroupID
	self._conf = HomeBuildingTable:getTableDataByBuildingID(buildingID)
	self.gridX = self._conf.grid_x
	self.gridY = self._conf.grid_y
	self.type = self._conf.type
	self.attachID = self._conf.attach_id
	self.touch_x = self._conf.touch_x
	self.touch_y = self._conf.touch_y
	self.zOrder = self:getZorder()
	self.layerIndex = self._conf.layer
	self.buildingAnimationType = BuildingGroupTable:getClickActionByGroupID(buildingGroupID)
end

function HomeBuilding:updateSpriteBoundCache(buildingID, dressID, bound)
	if dressID ~= self.dressID then
		return
	end

	if not self._dressChanged then
		return
	end

	self._dressChanged = false

	self.map:clearBuildingCoverageCache(buildingID, self.spriteBound)

	self.spriteBound = bound

	self.map:addBuildingCoverageCache(buildingID, self.spriteBound)
end

function HomeBuilding:playBuildingAnimation(callback)
	return
end

function HomeBuilding:refreshBuilding(isBuilding)
	if isBuilding == nil then
		isBuilding = false
	end

	self:setBuilding(isBuilding)
end

function HomeBuilding:afterBuildingAnimation()
	self:handleBuildingStatus()
end

function HomeBuilding:adjustSortOrder()
	return
end

function HomeBuilding:showUpdateEffect(event)
	return
end

function HomeBuilding:isUpdatingEffect()
	return
end

function HomeBuilding:playAnimationForAction(actionData)
	if self.buildingSprite_ then
		self.buildingSprite_:playAnimationForAction(actionData)
	end
end

function HomeBuilding:handleBuildingStatus()
	return
end

function HomeBuilding:addUIPanel(panelType)
	return
end

function HomeBuilding:closeUIPanel(panelType)
	return
end

function HomeBuilding:onClick(once)
	if once == nil then
		once = false
	end

	if self.buildingSprite_ then
		self.buildingSprite_:playOnClickAnimation()
	end
end

function HomeBuilding:onClickShowMenu()
	return
end

function HomeBuilding:isShowingBtn()
	return
end

function HomeBuilding:refreshBuildingByCategory()
	return
end

function HomeBuilding:setAnimationActive(active)
	self:toggleAnimations(active)
end

function HomeBuilding:checkChangeSelected(buildingID)
	return
end

function HomeBuilding:cancelChangeSelected()
	return
end

function HomeBuilding:isEmpty()
	return self.isEmpty_
end

function HomeBuilding:createShadows()
	return
end

function HomeBuilding:prepareAnimations()
	return
end

function HomeBuilding:toggleAnimations(visible)
	return
end

function HomeBuilding:getPos()
	return self.buildingSprite_.goBuilding_.transform.position
end

function HomeBuilding:getObject()
	return self.buildingSprite_
end

function HomeBuilding:setBuilding(value)
	self.isBuilding_ = value
end

function HomeBuilding:onMouseOver()
	return
end

function HomeBuilding:onMouseOut()
	return
end

function HomeBuilding:destroySelf()
	self:removeSpriteFromDisplayList()
end

function HomeBuilding:removeSpriteFromDisplayList()
	if self.buildingSprite_ ~= nil then
		self.buildingSprite_:dispose()

		self.buildingSprite_ = nil
	end

	self._visible = false
end

function HomeBuilding:addSpriteToDisplayList()
	self.buildingSprite_ = HomeBuildingSprite.new(self)
end

function HomeBuilding:UpdateSpriteDisplay(callback)
	self.buildingSprite_:UpdateSpriteDisplay(callback)
end

function HomeBuilding:getDressUID(dressID)
	return self.buildingGroupID * 100 + dressID
end

function HomeBuilding:removeAnimationForAction()
	if self.buildingSprite_ then
		self.buildingSprite_:removeAnimationForAction()
	end
end

function HomeBuilding:fadeOut(delay)
	if self.buildingSprite_ then
		self.buildingSprite_:fadeOut(delay)
	end
end

function HomeBuilding:replaceSprite(dressID, animtionType, callback)
	if animtionType == nil then
		animtionType = 0
	end

	local dressUID = self:getDressUID(self.dressID)

	self.dressID = dressID
	self._dressChanged = true

	if self.buildingSprite_ then
		self.buildingSprite_:updateBuilding(self, animtionType, callback)
	end
end

function HomeBuilding:playAddTw()
	if self.buildingSprite_ then
		self.buildingSprite_:playAddTw()
	end
end

function HomeBuilding:hitTest(position)
	if self.buildingSprite_ ~= nil then
		return self.buildingSprite_:hitTest(position)
	end

	return false
end

function HomeBuilding:_moveTo(x, y)
	local endWorldPos = xyd.CameraManager:get():gridToWorldPoint(Vector2.new(x, y))
	local tw = TimelineLite.new()

	tw:add(TweenLite:to(self.buildingSprite_, 0, {
		x = endWorldPos.x,
		y = endWorldPos.y,
		ease = Linear.easeNone
	}), 0)
	tw:call(function()
		return
	end)
end

function HomeBuilding:clickTest(worldpos)
	return HomeBuilding.buildingSprite_:clickTest(worldpos)
end

return HomeBuilding
