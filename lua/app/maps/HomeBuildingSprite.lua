-- chunkname: @../../../Product/Bundles/Android/src/app/maps/HomeBuildingSprite.lua

local BuildingTable = xyd.tables.building
local DressTable = xyd.tables.dress
local BuildingResTable = xyd.tables.buildingRes
local BuildingGroupTable = xyd.tables.buildingGroup
local SpriteRenderer = UnityEngine.SpriteRenderer
local BoxCollider2D = UnityEngine.BoxCollider2D
local QuestConstants = xyd.QuestConstants
local Destroy = UnityEngine.Object.Destroy
local SpineManager = xyd.SpineManager
local HomeBuildingSprite = class("HomeBuildingSprite", import(".BaseHomeSprite"))

function HomeBuildingSprite:ctor(building)
	HomeBuildingSprite.super.ctor(self, building)

	self._inDelTween = false
	self._buildingAnimationType = xyd.MapClickAction.VOID
	self._building = building
	self.sequence = nil

	self:InitSpritePrefab()

	self._buildingResTbl = xyd.tables.buildingRes
	self._cityMap = xyd.CityMap.get()
end

function HomeBuildingSprite:UpdateSpriteDisplay(callback)
	self:updateDisplay(self._building, self._buildingAnimationType, callback)
end

function HomeBuildingSprite:InitSpritePrefab()
	local buildingID = self.building_.tableID
	local name = "home_building_" .. buildingID

	self.zOrder = -self.building_.zOrder * 100

	local buildingTableInfo = BuildingTable:getTableDataByBuildingID(buildingID)
	local targetBuilding = self.pnode_.transform:NodeByName(name)

	if targetBuilding then
		self.goBuilding_ = targetBuilding.gameObject
		self.buildingSprite = self.goBuilding_.transform:NodeByName("building_sprite").gameObject
	else
		self.goBuilding_ = ResCache.AddGameObject(self.pnode_, "Prefabs/Buildings/home_building")
		self.buildingSprite = self.goBuilding_.transform:NodeByName("building_sprite").gameObject

		local pos = Vector2(buildingTableInfo.grid_x, buildingTableInfo.grid_y)

		pos = xyd.CameraManager.get():gridToWorldPoint(pos)
		self.goBuilding_.name = name
		self.goBuilding_.transform.position = Vector3(pos.x, pos.y, self.zOrder)
		self.goLevel_ = self.goBuilding_:NodeByName("level_bg").gameObject
		self.labelLevel_ = self.goLevel_:ComponentByName("label_level", typeof(UILabel))

		local rendererLevel = self.goLevel_:GetComponent(typeof(SpriteRenderer))

		rendererLevel.sortingOrder = xyd.CityMapLayerDepth.BUILDING_UI + self.zOrder
		self.labelLevel_.text = self.zOrder

		self.labelLevel_:SetActive(false)
	end

	self._positionX = self.goBuilding_.transform.position.x
	self._positionY = self.goBuilding_.transform.position.y
end

function HomeBuildingSprite:reset()
	self.name = ""
	self._normalEffName = ""
	self._picName = ""
	self._buildingEffectName = ""
	self._nowNormalEffName = ""
	self._nowBuildingEffName = ""

	if self.sequence then
		self.sequence:Kill(true)
	end

	if not tolua.isnull(self._actionEffect) then
		Destroy(self._actionEffect)

		self._actionEffect = nil
	end

	if not tolua.isnull(self._buildingEffect) then
		Destroy(self._buildingEffect)

		self._buildingEffect = nil
	end

	if not tolua.isnull(self._normalEffect) then
		Destroy(self._normalEffect)

		self._normalEffect = nil
	end

	self._building = nil
end

function HomeBuildingSprite:getMySequence()
	if self.sequence then
		self.sequence:Kill(true)

		self.sequence = DG.Tweening.DOTween.Sequence()
	else
		self.sequence = DG.Tweening.DOTween.Sequence()
	end

	return self.sequence
end

function HomeBuildingSprite:playOnClickAnimation()
	self:playSelectTw()
end

function HomeBuildingSprite:_controlSpriteActive(state)
	if not tolua.isnull(self.buildingSprite) then
		if state == QuestConstants.STARTED then
			self.buildingSprite:SetActive(false)
		else
			self.buildingSprite:SetActive(true)
		end
	end
end

function HomeBuildingSprite:_clearNormalEff()
	self._normalEffName = ""
	self._picName = ""
	self._nowNormalEffName = ""

	if self.sequence then
		self.sequence:Kill(true)
	end

	if not tolua.isnull(self._normalEffect) then
		Destroy(self._normalEffect)

		self._normalEffect = nil
	end
end

function HomeBuildingSprite:_setBuildingEffect(effName, state)
	self:_clearNormalEff()

	self._buildingEffectName = effName

	if self._nowBuildingEffName == effName and not tolua.isnull(self._buildingEffect) then
		self:_playBuildingEff(state)

		return
	end

	SpineManager.get():newEffect(self.goBuilding_, effName, function(success, eff)
		if success then
			if effName ~= self._buildingEffectName then
				Destroy(eff)

				return
			end

			if not tolua.isnull(self._buildingEffect) then
				Destroy(self._buildingEffect)

				self._buildingEffect = nil
			end

			local anchorOffset = self._buildingResTbl:getAnchorOffsetByName(effName)
			local pos = Vector3(anchorOffset[1] * xyd.DEFAULT_CHUNK_SCALE, anchorOffset[2] * xyd.DEFAULT_CHUNK_SCALE, -1)

			eff.transform.localScale = Vector3(50, 50, 50)
			eff.transform.localPosition = pos
			self._buildingEffect = eff
			self._nowBuildingEffName = effName

			self:_playBuildingEff(state)
		end
	end)
end

function HomeBuildingSprite:_playBuildingEff(state)
	local SpineController = self._buildingEffect:GetComponent(typeof(SpineAnim))

	if state == QuestConstants.STARTED or state == QuestConstants.COMPLETE then
		SpineController:play("texiao01", 1)
		self:_controlSpriteActive(state)

		local onComplete

		function onComplete()
			if not tolua.isnull(self._buildingEffect) then
				SpineController:play("texiao02", 0)
			end
		end

		SpineController:addListener("Complete", onComplete)
	else
		SpineController:play("texiao03", 1)

		local onComplete

		function onComplete()
			if not tolua.isnull(self._buildingEffect) then
				Destroy(self._buildingEffect)

				self._buildingEffect = nil
			end

			self:_setDisplay()
			self:_controlSpriteActive(state)
		end

		SpineController:addListener("Complete", onComplete)
	end
end

function HomeBuildingSprite:_setNormalEffect(effName)
	self._normalEffName = effName

	if self._nowNormalEffName == effName and self._normalEffect then
		local SpineController = self._normalEffect:GetComponent(typeof(SpineAnim))

		SpineController:play("texiao01", 0)

		return
	end

	SpineManager.get():newEffect(self.goBuilding_, effName, function(success, eff)
		if success then
			if effName ~= self._normalEffName then
				Destroy(eff)

				return
			end

			if not tolua.isnull(self._normalEffect) then
				Destroy(eff)
			end

			local anchorOffset = self._buildingResTbl:getAnchorOffsetByName(effName)
			local pos = Vector3(anchorOffset[1] * xyd.DEFAULT_CHUNK_SCALE, anchorOffset[2] * xyd.DEFAULT_CHUNK_SCALE, -1)

			eff.transform.localScale = Vector3(50, 50, 50)
			eff.transform.localPosition = pos
			self._normalEffect = eff
			self._nowNormalEffName = effName

			local SpineController = self._normalEffect:GetComponent(typeof(SpineAnim))

			SpineController:play("texiao01", 0)
		end
	end)
end

function HomeBuildingSprite:_playChangeTw(picBeforeChange, picAfterChange, state, beforeSound, afterSound)
	if picBeforeChange == picAfterChange or self._buildingAnimationType ~= xyd.MapClickAction.BOUNCE then
		if state == QuestConstants.STARTED or state == QuestConstants.COMPLETE then
			self:_setSprite(picAfterChange)
		else
			self:_setDisplay()
		end

		return
	end

	if not picBeforeChange then
		if state == QuestConstants.STARTED or state == QuestConstants.COMPLETE then
			self:_setSprite(picAfterChange)
		else
			self:_setDisplay()
		end

		self:playAddTw()

		return
	end

	self:_setSprite(picBeforeChange)

	self._inDelTween = true

	self:playDelTw(function()
		self._inDelTween = false

		if state == QuestConstants.STARTED or state == QuestConstants.COMPLETE then
			self:_setSprite(picAfterChange)
		else
			self:_setDisplay()
		end

		if afterSound then
			SoundManager:getInstance():playEffect(afterSound)
		end

		self:playAddTw()
	end)
end

function HomeBuildingSprite:updateDisplay(building, animtionType, callback)
	local buildingID = self.building_.tableID
	local dressID = self.building_.dressID
	local buildingTableInfo = BuildingTable:getTableDataByBuildingID(buildingID)
	local dressTblInfo = DressTable:getTableDataByBuildingAndDressIndex(buildingID, dressID)
	local pic_name = buildingTableInfo.pic_name

	if dressTblInfo then
		pic_name = dressTblInfo.pic_name
	end

	if not pic_name then
		return
	end

	if not building then
		self:_setDisplay(callback)

		return
	end

	self._buildingAnimationType = building.buildingAnimationType
	animtionType = animtionType or xyd.BUILDING_ANIMATION_TYPE_CHANGE_WITHOUT_TWEEN

	if animtionType == xyd.BUILDING_ANIMATION_TYPE_NORMAL then
		if building.state == QuestConstants.STARTED or building.state == QuestConstants.COMPLETE then
			local eff_build = buildingTableInfo.eff_build

			if eff_build and #eff_build > 0 then
				self:_setBuildingEffect(eff_build, building.state)
			else
				local picBuild = buildingTableInfo.pic_build
				local picBeforeChange = buildingTableInfo.pic_name

				if picBuild == "" then
					picBuild = nil
				end

				if picBeforeChange == "" then
					picBeforeChange = nil
				end

				local picAfterChange

				if dressTblInfo then
					picAfterChange = dressTblInfo.pic_name
				end

				if picBuild then
					picAfterChange = picBuild
				end

				picAfterChange = picAfterChange or picBeforeChange

				self:_setSprite(picAfterChange, callback)
			end
		else
			self:_setDisplay(callback)
		end

		self:playSelectTw()
	elseif animtionType == xyd.BUILDING_ANIMATION_TYPE_CHANGE_WITHOUT_TWEEN then
		if building.state == QuestConstants.STARTED or building.state == QuestConstants.COMPLETE then
			local eff_build = buildingTableInfo.eff_build

			if eff_build and #eff_build > 0 then
				self:_setBuildingEffect(eff_build, building.state)
			else
				local picBuild = buildingTableInfo.pic_build
				local picBeforeChange = buildingTableInfo.pic_name

				if picBuild == "" then
					picBuild = nil
				end

				if picBeforeChange == "" then
					picBeforeChange = nil
				end

				local picAfterChange

				if dressTblInfo then
					picAfterChange = dressTblInfo.pic_name
				end

				if picBuild then
					picAfterChange = picBuild
				end

				picAfterChange = picAfterChange or picBeforeChange

				self:_setSprite(picAfterChange, callback)
			end
		else
			self:_setDisplay(callback)
		end
	elseif building.state == QuestConstants.STARTED or building.state == QuestConstants.COMPLETE then
		local eff_build = buildingTableInfo.eff_build

		if eff_build and #eff_build > 0 then
			self:_setBuildingEffect(eff_build, building.state)
		else
			local picBuild = buildingTableInfo.pic_build
			local picBeforeChange = buildingTableInfo.pic_name

			if picBuild == "" then
				picBuild = nil
			end

			if picBeforeChange == "" then
				picBeforeChange = nil
			end

			if animtionType == xyd.BUILDING_ANIMATION_TYPE_CHANGE_NO_DEL_TWEEN then
				picBeforeChange = nil
			end

			local picAfterChange

			if picBuild then
				picAfterChange = picBuild
			end

			picAfterChange = picAfterChange or picBeforeChange

			self:_playChangeTw(picBeforeChange, picAfterChange, building.state, nil, nil)
		end
	else
		local eff_build = buildingTableInfo.eff_build

		if eff_build and #eff_build > 0 then
			self:_setBuildingEffect(eff_build, building.state)
		else
			local picBuild = buildingTableInfo.pic_build
			local picBeforeChange = buildingTableInfo.pic_name

			if picBuild == "" then
				picBuild = nil
			end

			if picBeforeChange == "" then
				picBeforeChange = nil
			end

			if animtionType == xyd.BUILDING_ANIMATION_TYPE_CHANGE_NO_DEL_TWEEN then
				picBeforeChange = nil
			end

			local picAfterChange

			if dressTblInfo then
				picAfterChange = dressTblInfo.pic_name
			end

			if picBuild then
				picBeforeChange = picBuild
			end

			picAfterChange = picAfterChange or picBeforeChange

			self:_playChangeTw(picBeforeChange, picAfterChange, building.state, nil, nil)
		end
	end
end

function HomeBuildingSprite:_setSprite(pic_name, callback)
	if not pic_name then
		return
	end

	local buildingID = self.building_.tableID
	local anchorOffset = BuildingResTable:getAnchorOffsetByName(pic_name)
	local spriteRenderer = self.buildingSprite:GetComponent(typeof(SpriteRenderer))
	local spriteSize = BuildingResTable:getSizeByName(pic_name)
	local anchorX = -(anchorOffset[1] * xyd.DEFAULT_CHUNK_SCALE - spriteSize[1] / 4)
	local anchorY = anchorOffset[2] * xyd.DEFAULT_CHUNK_SCALE - spriteSize[2] / 4
	local picPath = xyd.getAtlasSP2MappingPath(pic_name)

	if picPath and picPath ~= "" then
		ResCache.SetSpriteAsync(spriteRenderer, picPath, pic_name, function(success, sprite, loader)
			if success then
				self._localScaleX = spriteSize[1] / sprite.rect.width * 0.5
				self._localScaleY = spriteSize[2] / sprite.rect.height * 0.5
				self._localScaleZ = 0.5
				self.buildingSprite.transform.localScale = Vector3(spriteSize[1] / sprite.rect.width * 0.5, spriteSize[2] / sprite.rect.height * 0.5, 0.5)
				self.buildingSprite.transform.localPosition = Vector3(anchorX, anchorY, 0)
				self.anchorX = anchorX
				self.anchorY = anchorY
				self._clicktest = self.buildingSprite:GetComponent(typeof(ClickTest))

				local collider = self.goBuilding_:GetComponent(typeof(BoxCollider2D))

				collider.offset = Vector2(anchorX, anchorY)
				collider.size = Vector2(sprite.rect.width * self._localScaleX, sprite.rect.height * self._localScaleY)

				if callback ~= nil then
					callback(true)
				end

				if xyd.CityMap.get().homeSceneState == xyd.HOME_SCENE_STATE.NORMAL then
					spriteRenderer.sharedMaterial:SetInt("_CustomType", xyd.HOME_SCENE_STATE.NORMAL)
				elseif xyd.CityMap.get().homeSceneState == xyd.HOME_SCENE_STATE.DARK then
					spriteRenderer.sharedMaterial:SetInt("_CustomType", xyd.HOME_SCENE_STATE.DARK)
				end

				self._cityMap.homebuildingMatList[buildingID] = spriteRenderer.sharedMaterial
			elseif callback ~= nil then
				callback(false)
			end
		end)
	end
end

function HomeBuildingSprite:updateBuilding(building, animtionType, callback)
	self._building = building

	self:InitSpritePrefab()
	self:updateDisplay(building, animtionType, callback)
end

function HomeBuildingSprite:_setDisplay(callback)
	local pic_name, eff_name
	local building = self.building_
	local buildingID = building.tableID
	local dressID = self.building_.dressID
	local buildingTblData = BuildingTable:getTableDataByBuildingID(buildingID)
	local canChangeDress = self.building_.canChangeDress
	local dressTblInfo = DressTable:getTableDataByBuildingAndDressIndex(buildingID, dressID)

	if canChangeDress then
		if dressTblInfo ~= nil then
			pic_name = dressTblInfo.pic_name
			eff_name = dressTblInfo.eff_name
		else
			pic_name = buildingTblData.pic_name
		end
	else
		pic_name = buildingTblData.pic_name
	end

	if pic_name then
		self:_setSprite(pic_name, callback)
	end

	if eff_name and #eff_name > 0 then
		self:_setNormalEffect(eff_name)
	end
end

function HomeBuildingSprite:hitTest(worldpos)
	local newpos = Vector2(0, 0)

	newpos.x = self.goBuilding_.transform.localPosition.x + self.anchorX
	newpos.y = self.goBuilding_.transform.localPosition.y + self.anchorY

	return self._clicktest:HitCheck(newpos, worldpos)
end

function HomeBuildingSprite:clearTw()
	if self.tw_ then
		self.tw_:Stop()
		self.tw_:Kill()
	end
end

function HomeBuildingSprite:playSelectTw()
	if self._oldPositionX then
		self._positionX = self._oldPositionX
		self._positionY = self._oldPositionY
	else
		self._oldPositionX = self._positionX
		self._oldPositionY = self._positionY
	end

	local tw = self:getMySequence()

	tw:Insert(0, self.goBuilding_.transform:DOScale(Vector3(1, 1.1, 1), 3 * xyd.TweenDeltaTime))
	tw:Insert(3 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOScale(Vector3(1.05, 1, 1), 6 * xyd.TweenDeltaTime))
	tw:Insert(9 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOScale(Vector3(1, 1, 1), 3 * xyd.TweenDeltaTime))
	tw:Insert(0, self.goBuilding_.transform:DOLocalMove(Vector3(self._positionX, self._positionY + 10, self.zOrder), 3 * xyd.TweenDeltaTime))
	tw:Insert(3 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOLocalMove(Vector3(self._positionX, self._positionY - 12, self.zOrder), 6 * xyd.TweenDeltaTime))
	tw:Insert(9 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOLocalMove(Vector3(self._positionX, self._positionY, self.zOrder), 3 * xyd.TweenDeltaTime))

	self.tw_ = tw
end

function HomeBuildingSprite:playAnimationForAction(actionData)
	local animationName = actionData.animation
	local effName = actionData.building_effect
	local x = actionData.offset_x
	local y = actionData.offset_y

	SpineManager.get():newEffect(self.buildingSprite, effName, function(success, eff)
		if success then
			local spriteScale = self.buildingSprite.transform.localScale

			eff.transform.localScale = Vector3(100 / spriteScale.x / 2, 100 / spriteScale.y / 2, 100 / spriteScale.z / 2)
			eff.transform.localPosition = Vector3(x / 2, -y / 2, -10)

			local SpineController = eff:GetComponent(typeof(SpineAnim))

			self._actionEffect = eff

			SpineController:play(animationName, 1)
		end
	end)
end

function HomeBuildingSprite:removeAnimationForAction()
	if not tolua.isnull(self._actionEffect) then
		Destroy(self._actionEffect)

		self._actionEffect = nil
	end
end

function HomeBuildingSprite:fadeOut(delay)
	local buildingSprite = self.goBuilding_.transform:NodeByName("building_sprite").gameObject
	local spriteRenderer = buildingSprite:GetComponent(typeof(SpriteRenderer))

	local function setter(value)
		spriteRenderer.color = value
	end

	local function getter()
		return spriteRenderer.color
	end

	local sequence = self:getMySequence()

	sequence:Insert(0, DG.Tweening.DOTween.ToAlpha(getter, setter, 0, delay))
end

function HomeBuildingSprite:playAddTw(callBack)
	if callBack == nil then
		callBack = nil
	end

	if self._oldPositionX then
		self._positionX = self._oldPositionX
		self._positionY = self._oldPositionY
	else
		self._oldPositionX = self._positionX
		self._oldPositionY = self._positionY
	end

	local tw = self:getMySequence()

	self.tw_ = tw
	self.goBuilding_.transform.localPosition = Vector3(self._positionX, self._positionY + 40, self.zOrder)

	tw:Insert(0, self.goBuilding_.transform:DOScale(Vector3(1.1, 1, 1), 6 * xyd.TweenDeltaTime))
	tw:Insert(6 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOScale(Vector3(1, 1.05, 1), 5 * xyd.TweenDeltaTime))
	tw:Insert(11 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOScale(Vector3(1, 1, 1), 6 * xyd.TweenDeltaTime))
	tw:Insert(6 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOLocalMove(Vector3(self._positionX, self._positionY - 10, self.zOrder), 5 * xyd.TweenDeltaTime))
	tw:Insert(11 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOLocalMove(Vector3(self._positionX, self._positionY, self.zOrder), 6 * xyd.TweenDeltaTime))
	tw:AppendCallback(function()
		if callBack then
			callBack(nil)
		end
	end)
	tw:AppendCallback(function()
		if callBack then
			callBack(nil)
		end
	end)
end

function HomeBuildingSprite:playDelTw(callBack)
	if callBack == nil then
		callBack = nil
	end

	local tw = self:getMySequence()

	self.tw_ = tw

	tw:Insert(0, self.goBuilding_.transform:DOScale(Vector3(1.05, 1, 1), 3 * xyd.TweenDeltaTime))
	tw:Insert(3 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOScale(Vector3(1, 1.1, 1), 15 * xyd.TweenDeltaTime))
	tw:Insert(15 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOScale(Vector3(1, 1.1, 1), 3 * xyd.TweenDeltaTime))
	tw:Insert(18 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOScale(Vector3(0, 0, 0), 9 * xyd.TweenDeltaTime))
	tw:Insert(0, self.goBuilding_.transform:DOLocalMove(Vector3(self._positionX, self._positionY - 4, self.zOrder), 3 * xyd.TweenDeltaTime))
	tw:Insert(3 * xyd.TweenDeltaTime, self.goBuilding_.transform:DOLocalMove(Vector3(self._positionX, self._positionY + 50, self.zOrder), 15 * xyd.TweenDeltaTime))
	tw:AppendCallback(function()
		if callBack then
			callBack(nil)
		end
	end)
end

function HomeBuildingSprite:dispose()
	if not tolua.isnull(self.goBuilding_) then
		local buildingID = self.building_.tableID

		Destroy(self.goBuilding_)

		self._cityMap.homebuildingMatList[buildingID] = nil
	end
end

return HomeBuildingSprite
