-- chunkname: @../../../Product/Bundles/Android/src/app/maps/CityMap.lua

local CityMap = class("CityMap", import(".SceneMap"))
local Rect = UnityEngine.Rect
local Screen = UnityEngine.Screen
local AddChild = NGUITools.AddChild
local Destroy = UnityEngine.Object.Destroy
local Material = UnityEngine.Material
local GameObject = UnityEngine.GameObject
local DressTable = xyd.tables.dress
local SpineManager = xyd.SpineManager
local BuildingCellTable = xyd.tables.buildingCell
local QuestTable = xyd.tables.quest
local BuildingTable = xyd.tables.building
local BuildingGroupTable = xyd.tables.buildingGroup
local AreaVerticesTable = xyd.tables.areaVertices
local repeatAnim = xyd.repeatAnim
local RandomActionController = import("app.controllers.RandomActionController")
local RandomCharController = import("app.controllers.RandomCharController")
local RandomAnimalController = import("app.controllers.RandomAnimalController")
local BuildOrRepairTimeRing = import("app.home.building.BuildOrRepairTimeRing")
local HomeQuestBubble = import("app.home.building.HomeQuestBubble")
local CITY_MAX_SPEED = 2500
local CAMERA_MIN_MOVE_GRID = 9000
local CITY_SLIDE_TIME = 1
local DEFAULT_LONG_PRESS_TIME = 0.5
local DEFAULT_LOADING_CIRCLE_SCALE = Vector3(80, 80, 1)
local LOADING_CIRCLE_OFFSETY = 24

function CityMap.get()
	if CityMap.INSTANCE == nil then
		CityMap.INSTANCE = CityMap.new()
	end

	return CityMap.INSTANCE
end

function CityMap:ctor(...)
	CityMap.super.ctor(self, "CityMap", ...)

	self.mapType_ = xyd.MapType.CITY
	self.sceneName_ = xyd.SceneName.CITY
	self.loginEnter_ = true
	self.cityBuildings_ = {}
	self.cityBuildingLoads_ = {}
	self.specialBuildings_ = {}
	self.specialBuildingLoads_ = {}
	self.lockedAreas_ = {}
	self.lockedAreaLoads_ = {}
	self._allBuildings = {}
	self._allBuildingZorders = {}
	self._allChars = {}
	self._fadingOutBuildings = {}
	self.CHAR_DEFAULT_HEIGHT = 102
	self.MY_CHAR_X = 60.51
	self.MY_CHAR_Y = 53.29
	self.MY_CHAR_Z = -890
	self.MY_CHAR_ID = 101
	self.enterCallback_ = nil
	self.exitCallback_ = nil
	self._allBuildingID = {}
	self._buildingGroupModel = xyd.ModelManager.get():loadModel(xyd.ModelType.SELF_BUILDING_GROUP)
	self._questModel = xyd.ModelManager.get():loadModel(xyd.ModelType.QUEST)
	self.Camera = xyd.CameraManager.get()
	self.defaultCameraSize = self.Camera:getOrthographicSize()
	self.homeMapMatList = {}
	self.homebuildingMatList = {}
	self.homeSceneState = xyd.HOME_SCENE_STATE.NORMAL
end

function CityMap:getCharDefaultHeight()
	return self.CHAR_DEFAULT_HEIGHT
end

function CityMap:getMyCharX()
	return self.MY_CHAR_X
end

function CityMap:getMyCharY()
	return self.MY_CHAR_Y
end

function CityMap:getMyCharZ()
	return self.MY_CHAR_Z
end

function CityMap:setMyCharX(val)
	self.MY_CHAR_X = val
end

function CityMap:setMyCharY(val)
	self.MY_CHAR_Y = val
end

function CityMap:setMyCharZ(val)
	self.MY_CHAR_Z = val
end

function CityMap:registerEvents()
	CityMap.super.registerEvents(self)
	self:registerEvent(xyd.event.MAP_UPDATE_POSITION, handler(self, self.updateParallaxPosition))
	self:registerEvent(xyd.event.ON_APP_PAUSE, handler(self, self.onAppPause))
	self:registerEvent(xyd.event.ON_CITY_BUILDING_LOADED, handler(self, self.onCityBuildingLoaded))
	self:registerEvent(xyd.event.ON_SPECIAL_BUILDING_LOADED, handler(self, self.onSpBuildingLoaded))
	self:registerEvent(xyd.event.ON_LOCKED_AREA_LOADED, handler(self, self.onlockedAreaLoaded))
	self:registerEvent(xyd.event.BUILD_INFO_PUSH, handler(self, self.onRefreshBuilding))
	self:registerEvent(xyd.event.HANDLE_LONG_PRESS_BEGIN, handler(self, self._onLongPressBegin))
	self:registerEvent(xyd.event.HANDLE_LONG_PRESS_END, handler(self, self._onLongPressEnd))
	self:registerEvent(xyd.event.BUILDING_CHANGE_DRESS_VIEW, handler(self, self._buildingChangeDress))
	self:registerEvent(xyd.event.QUEST_CHANGE_BUILDING, handler(self, self._questChangeBuilding))
	self:registerEvent(xyd.event.UPDATE_BUILDING_BY_GROUP_ID, handler(self, self._mapUpdateBuildingByGroupID))
	self:registerEvent(xyd.event.NAVIGATE_BY_BUILDING_GROUPID, handler(self, self._onNavigateByBuildingGroupID))
	self:registerEvent(xyd.event.CAMERA_ZOOM_MIN_OR_MAX, handler(self, self._cameraZoomMinOrMax))
	self:registerEvent(xyd.event.QUEST_ACTION_SKIP, handler(self, self._onSkipAction))
	self:registerEvent(xyd.event.QUEST_STORY_SKIP, handler(self, self._onSkipStory))
	self:registerEvent(xyd.event.SET_TIMER_RING, handler(self, self._setTimerOnBuilding))
	self:registerEvent(xyd.event.SET_TIMER_RING_VISIBLE, handler(self, self._setTimerRingVisible))
	self:registerEvent(xyd.event.REMOVE_TIMER_RING, handler(self, self._removeTimerOnBuilding))
	self:registerEvent(xyd.event.REPAIR_CHANGE_TIME, handler(self, self._repairChangeTime))
	self:registerEvent(xyd.event.SET_QUEST_BUBBLE, handler(self, self._setBubbleOnBuilding))
	self:registerEvent(xyd.event.SET_BUBBLE_VISIBLE, handler(self, self._setBubbleVisible))
	self:registerEvent(xyd.event.REMOVE_QUEST_BUBBLE, handler(self, self._removeQuestBubble))
end

function CityMap:enterMap(params, callback)
	xyd.SoundManager.get():playBg("room_web1/bgm_map")

	local result = CityMap.super.enterMap(self, params, callback)

	if result == false then
		return
	end

	if self.loginEnter_ then
		self.loginEnter_ = false

		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.GAME_INITED
		})
	end

	self._state = MAP_STATE.STATE_NORMAL

	RandomActionController.get():doRandomStoryID()

	local initPos = RandomActionController.get():getRandomStoryPos()

	if initPos then
		xyd.InitHomeFocusPos = xyd.CameraManager.get():gridToWorldPoint(initPos)
	else
		xyd.InitHomeFocusPos = xyd.CameraManager.get():gridToWorldPoint(Vector2(self.MY_CHAR_X, self.MY_CHAR_Y))

		if xyd.InitHomeFocusPos.x == 3200 and xyd.InitHomeFocusPos.y == 0 then
			xyd.InitHomeFocusPos = xyd.CameraManager.get():gridToWorldPoint(Vector2(52, 47))
		end
	end
end

function CityMap:initCompelete()
	xyd.SelfInfo.get().mapInitCompleted = true

	local isFirstQuest = false
	local curQuests = self._questModel:getCurQuests()

	for _, quest in pairs(curQuests) do
		if quest.id == xyd.FIRST_QUEST and quest.state == 0 then
			isFirstQuest = true
		end
	end

	xyd.MapController.get():clearOnRoadInfo()

	if not xyd.MapController.get().isInNewUserGuide then
		xyd.QuestController.get().isPlayingClickAction = false

		RandomActionController.get():resetIdleTimer(true)
	end

	if (xyd.MapController.get().isInNewUserGuide or isFirstQuest) and xyd.SelfInfo.get().letterCompleted then
		xyd.QuestController.get():startQuestStory()
	end

	self:_initQuestBubbleAndTimerRing()
end

function CityMap:exitMap(params, callback)
	local result = CityMap.super.exitMap(self, params, callback)

	if result == false then
		return
	end

	self:_clearActionEffect()
	xyd.MapActionHandlerController.get():ClearTimeOut()
	xyd.MapActionHandlerController.get():reset()
	self:clearMoveOldStatus()
	xyd.QuestController.get():onSkipStory(false)
	RandomActionController.get():resetFirstTimer()

	self._moveCharGrid = nil
	xyd.QuestController.get().isPlayingClickAction = false

	xyd.MapController.get():clearOnRoadInfo()
end

function CityMap:initInternal()
	self.skinContainer_ = AddChild(self.node_, "SkinContainer")
	self.objectsContainer_ = AddChild(self.node_, "ObjectsContainer")

	local panel = self.objectsContainer_:AddComponent(typeof(UIPanel))

	panel.useSortingOrder = true
	panel.sortingOrder = xyd.CityMapLayerDepth.NGUI
	self.animationContainer_ = AddChild(self.node_, "AnimationContainer")
	self.citySkinContainer_ = NGUITools.AddChild(self.skinContainer_, "CitySkinContainer")
	self.EffectContainer_ = AddChild(self.node_, "EffectContainer")

	local function createMapSpriteRender(pos)
		local gameObject = NGUITools.AddChild(self.citySkinContainer_, "Map Part")
		local render = gameObject:AddComponent(typeof(UnityEngine.SpriteRenderer))

		gameObject.transform.localPosition = pos

		return render
	end

	local bgTable = xyd.tables.areaBg:getAllAreaBg()

	for i, conf in ipairs(bgTable) do
		local position = Vector3(conf.pos_x + 256, -conf.pos_y - 256)

		self.mapSpriteRenderers_[conf.areabg_id] = createMapSpriteRender(position)
	end

	self:updateParallaxPosition()
	self:loadLoadingCircle()
end

function CityMap:loadLoadingCircle()
	self.loadingCircle = ResCache.AddGameObject(self.EffectContainer_, "Prefabs/ShaderEffect/LoadingCircle")
	self.loadingCircleControl = self.loadingCircle:GetComponent(typeof(LoadingCircleControl))
	self.loadingCircle.transform.localScale = DEFAULT_LOADING_CIRCLE_SCALE
	self.loadingCircleControl.DEFAULT_LONG_PRESS_TIME = DEFAULT_LONG_PRESS_TIME
end

function CityMap:setCharLayer(charID, layer, bForce)
	local char = self._allChars[charID]

	if char ~= nil then
		if self.gridZorderMap == nil then
			return
		end

		if char.charSprite_ == nil or tolua.isnull(char.charSprite_._model3D) then
			return
		end

		local pos = char.charSprite_._model3D.transform.localPosition
		local gridPos = xyd.CameraManager.get():worldToGridPoint(Vector3(pos.x, pos.y + xyd.GRID_HEIGHT_HALF / 4, pos.z))

		if char.gridPos == nil then
			char.gridPos = gridPos
		elseif char.gridPos.x - gridPos.x == 0 and char.gridPos.y - gridPos.y == 0 then
			return
		end

		if self.gridZorderMap[gridPos.x + 1] ~= nil and self.gridZorderMap[gridPos.x + 1][gridPos.y] ~= nil then
			local zOrder = self.gridZorderMap[gridPos.x + 1][gridPos.y]

			if zOrder ~= nil then
				pos.z = -(999 - zOrder + 0.5) - (gridPos.x + gridPos.y) / 1000
				char.charSprite_._model3D.transform.localPosition = Vector3(pos.x, pos.y, pos.z * 100)
			end
		end
	end
end

function CityMap:_createCharacter(charID, posx, posy, callback)
	local char = self._allChars[charID]

	if char == nil then
		char = import("app.maps.HomeChar").new(self.animationContainer_, charID)
		self._allChars[charID] = char

		char:setPos(posx, posy)
		char:addSpriteToDisplayList()
		self:_moveCharacter(charID, 0, posx, posy, posx, posy)
		char:setDir(0, callback)
	else
		if posx ~= 0 and posy ~= 0 then
			self:setMyCharX(posx)
			self:setMyCharY(posy)
			self:_moveCharacter(charID, 0, posx, posy, posx, posy)
		else
			self.MY_CHAR_X = 60.51
			self.MY_CHAR_Y = 53.29

			self:_moveCharacter(charID, 0, self.MY_CHAR_X, self.MY_CHAR_Y, self.MY_CHAR_X, self.MY_CHAR_Y)
		end

		if callback then
			callback()
		end
	end
end

function CityMap:_moveCharacter(charID, time, startGridX, startGridY, endGridX, endGridY, callback)
	local char = self._allChars[charID]

	if char ~= nil then
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.SET_MOVE_ACTION,
			params = {
				moving = true
			}
		})
		char:moveFromTo(time, startGridX, startGridY, endGridX, endGridY, callback)
		XYDCo.WaitForTime(time, function()
			xyd.EventDispatcher.inner():dispatchEvent({
				name = xyd.event.SET_MOVE_ACTION,
				params = {
					moving = false
				}
			})
		end, "")
	end
end

function CityMap:loadChar(charID)
	local charTblData = xyd.tables.charTable:getTableDataByCharID(charID)

	if charTblData.model_type == 3 then
		self.is3dModel = true
	else
		self.is3dModel = false
	end

	local function callback(success, go, loader)
		if success == false or success == nil then
			return
		end

		self.myCharAnim_ = go
		self.myCharAnim_.transform.parent = self.animationContainer_.transform
		self.myCharAnim_.transform.localPosition = Vector3(4040, -1920, -800)
		self.animatorModel_ = self.myCharAnim_:GetComponent(typeof(UnityEngine.Animator))
	end

	ResCache.LoadInstanceGameObject("Fbx/" .. charTblData.eff_name .. "/" .. charTblData.eff_name, callback)
end

function CityMap:updateCharLayer()
	for key, _ in pairs(self._allChars) do
		if self._allChars[key] ~= nil then
			self:setCharLayer(key, 1)
		end
	end
end

function CityMap:loadModels()
	local charID = self.MY_CHAR_ID
	local char = self._allChars[charID]

	if not char then
		local gridPos = xyd.CameraManager.get():worldToGridPointFloat(xyd.InitHomeFocusPos)

		self:_createCharacter(charID, gridPos.x, gridPos.y)
	end

	UpdateBeat:Add(self.updateCharLayer, self)
end

local ShelterDepth = -500

function CityMap:loadMapSprites()
	ResCache.PreloadSpriteAtlas("Atlases_sp2/HomeBuilding/HomeBuilding", function(success, uAtlast)
		return
	end)

	local bgAtlas = "Atlases_sp2/HomeMapBg/HomeMapBg"

	local function callback(isSuccess, uAtlas, loader)
		if not self.isActive_ or isSuccess == false then
			return
		end

		local bgTable = xyd.tables.areaBg:getAllAreaBg()

		for i, conf in ipairs(bgTable) do
			local picPath = xyd.getAtlasSP2MappingPath(conf.pic)

			if picPath and picPath ~= "" then
				ResCache.SetSpriteAsync(self.mapSpriteRenderers_[conf.areabg_id], picPath, conf.pic, function(success, sprite, loader)
					if success then
						self.mapSpriteRenderers_[conf.areabg_id].transform.localScale = Vector3(0.5, 0.5)

						if self.homeSceneState == xyd.HOME_SCENE_STATE.NORMAL then
							self.mapSpriteRenderers_[conf.areabg_id].sharedMaterial:SetInt("_CustomType", xyd.HOME_SCENE_STATE.NORMAL)
						elseif self.homeSceneState == xyd.HOME_SCENE_STATE.DARK then
							self.mapSpriteRenderers_[conf.areabg_id].sharedMaterial:SetInt("_CustomType", xyd.HOME_SCENE_STATE.DARK)
						end

						table.insert(self.homeMapMatList, self.mapSpriteRenderers_[conf.areabg_id].sharedMaterial)
					end
				end)
			end
		end

		self:onLoadMapSprites()
		self:loadModels()
		self:initCompelete()
	end

	ResCache.PreloadSpriteAtlas(bgAtlas, callback)
end

function CityMap:onLoadMapSprites()
	self:registerEvents()
	self:initHomeBuildings()
	self:initViewBuilding()
	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.ON_CITY_MAP_LOADED
	})
	self:callEnterCallback()
end

function CityMap:initViewBuilding()
	for _, homeBuilding in pairs(self._allBuildings) do
		homeBuilding.map = self.objectsContainer_

		homeBuilding:addSpriteToDisplayList()
		homeBuilding:UpdateSpriteDisplay(nil)
	end
end

function CityMap:_buildingChangeDress(event)
	local buildingGroupID = event.params.buildingGroupID
	local dressID = event.params.dressID
	local needChangeMapState = event.params.needChangeMapState
	local animationType = event.params.animationType
	local needPlayAddTw = event.params.needPlayAddTw

	if needChangeMapState then
		self._state = MAP_STATE.STATE_NORMAL
	end

	local buildingGroupTblInfo = BuildingGroupTable:getTableDataByBuildingGroupID(buildingGroupID)
	local buildingIDs = buildingGroupTblInfo.building_id

	if buildingIDs ~= nil then
		for i = 1, __TS__TableLength(buildingIDs) do
			local buildingID = tonumber(buildingIDs[i])

			if self._allBuildings[buildingID] then
				if BuildingGroupTable:getClickActionByGroupID(buildingGroupID) ~= xyd.MapClickAction.BOUNCE then
					animationType = xyd.BUILDING_ANIMATION_TYPE_CHANGE_WITHOUT_TWEEN
				end

				self._allBuildings[buildingID]:replaceSprite(dressID, animationType)
			end
		end
	end
end

function CityMap:_questChangeBuilding(event)
	local oldGroupID = event.params.oldGroupID
	local newGroupID = event.params.newGroupID
	local notSameBuildingGroupID = oldGroupID ~= newGroupID
	local questID = event.params.questID
	local focus = QuestTable:getTableDataByQuestID(questID).focus

	if notSameBuildingGroupID and oldGroupID > 0 then
		self:_updateBuildingsByGroupID(oldGroupID, false)
	end

	self:_updateBuildingsByGroupID(newGroupID, true)

	self._state = MAP_STATE.STATE_CHANGING_BUILDING

	local function cancelCallback()
		if notSameBuildingGroupID and oldGroupID > 0 then
			self:_updateBuildingsByGroupID(oldGroupID, true)
		end

		self:_updateBuildingsByGroupID(newGroupID, false)

		self._state = MAP_STATE.STATE_NORMAL
	end

	local function confirmCallback()
		self._state = MAP_STATE.STATE_NORMAL
	end

	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.POPUP_CHAGNE_BUILDING_COMPONENT,
		params = {
			oldGroupID = oldGroupID,
			newGroupID = newGroupID,
			questID = questID,
			cancelCallback = cancelCallback,
			confirmCallback = confirmCallback,
			animationType = xyd.BUILDING_ANIMATION_TYPE_NORMAL
		}
	})
	self:_navigateByBuildingGroupID(newGroupID, focus)
end

function CityMap:_onNavigateByBuildingGroupID(event)
	if event and event.params and event.params.buildingGroupID then
		self:_navigateByBuildingGroupID(event.params.buildingGroupID, 1)
	end
end

function CityMap:_navigateByBuildingGroupID(buildingGroupID, focus)
	local buildingGroupInfo = self._buildingGroupModel:getBuildingGroupInfoByID(buildingGroupID)
	local buildingIDs = buildingGroupInfo:getBuildingIDs()
	local gridX = 0
	local gridY = 0
	local count = 0

	for k, buildingID in pairs(buildingIDs) do
		local buildingTblData = BuildingTable:getTableDataByBuildingID(tonumber(buildingID))

		gridX = gridX + buildingTblData.grid_x
		gridY = gridY + buildingTblData.grid_y
		count = count + 1
	end

	local tx = gridX / count
	local ty = gridY / count

	print("CityMap:_navigateByBuildingGroupID")

	if count > 0 then
		local scale = xyd.STANDARD_WIDTH / self:getCameraSize()

		if focus == 2 then
			scale = xyd.CAMERA_MAX_NORMAL_SCALE
		elseif focus == 1 then
			scale = xyd.CAMERA_MIN_NORMAL_SCALE
		end

		local cameraScale = xyd.CameraManager.get():getTargetScale()
		local cameraPos = xyd.CameraManager.get():getPosition()

		print(math.abs(cameraPos.x - tx) + math.abs(cameraPos.y - ty))

		if math.abs(cameraPos.x - tx) + math.abs(cameraPos.y - ty) > CAMERA_MIN_MOVE_GRID then
			self:navigateToGrid(Vector2(tx, ty), scale, xyd.MoveType.FOCUS)
		end
	end
end

function CityMap:_cameraZoomMinOrMax(event)
	local focus = event.params.focus
	local pos = Vector2(xyd.getWidth() / 2, xyd.getHeight() / 2)

	pos = xyd.CameraManager:get():screenToGridPoint(pos)

	if focus == 1 then
		self:navigateToGrid(pos, xyd.CAMERA_MIN_NORMAL_SCALE, xyd.MoveType.FOCUS)
	elseif focus == 2 then
		self:navigateToGrid(pos, xyd.CAMERA_MAX_NORMAL_SCALE, xyd.MoveType.FOCUS)
	end
end

function CityMap:_mapUpdateBuildingByGroupID(event)
	local buildingGroupID = event.params.buildingGroupID
	local questID = event.params.questID
	local visible

	if event.params.visible ~= nil then
		visible = event.params.visible
	else
		visible = true
	end

	self:_updateBuildingsByGroupID(buildingGroupID, visible, questID)
end

function CityMap:_setBubbleOnChar(event)
	local questID = event.params.questID
	local state = event.params.questState
	local needShowUp = event.params.needShowUp
	local handler = xyd.QuestBubbleHandler.get()
	local char = self._allChars[self.MY_CHAR_ID]

	if char == nil then
		return
	end

	local worldPos = char:getPos()

	if worldPos == nil then
		return
	end

	if handler:hasBubbleOnChar() then
		return
	end

	local bubble = HomeQuestBubble.new(self.objectsContainer_, questID)

	bubble:setPosition(worldPos.x, worldPos.y + self:getCharDefaultHeight() + 50, -1500)

	handler.bubbleOnChar = bubble

	if not tolua.isnull(bubble.questBubble) then
		bubble.questBubble:SetActive(false)
	end

	local storyID = QuestTable:getStoryByQuestID(questID)[state]

	if not storyID or needShowUp then
		bubble:setVisible(true)
	end

	UpdateBeat:Add(self._bubbleFollowChar, self)
end

function CityMap:_bubbleFollowChar()
	local handler = xyd.QuestBubbleHandler.get()
	local bubble = handler.bubbleOnChar

	if bubble then
		local worldPos = self._allChars[self.MY_CHAR_ID]:getPos()

		bubble:setPosition(worldPos.x, worldPos.y + self:getCharDefaultHeight() + 50, -1500)
	else
		UpdateBeat:Remove(self._bubbleFollowChar, self)
	end
end

function CityMap:_setBubbleOnBuilding(event)
	local questID = event.params.questID
	local gridPos = QuestTable.get():getBubblePosByID(questID)

	if tonumber(gridPos[1]) == -1 and tonumber(gridPos[2]) == -1 then
		self:_setBubbleOnChar(event)

		return
	end

	local state = event.params.questState
	local needShowUp = event.params.needShowUp
	local handler = xyd.QuestBubbleHandler.get()
	local worldPos = xyd.CameraManager.get():gridToWorldPoint(Vector2(gridPos[1], gridPos[2]))
	local bubble = HomeQuestBubble.new(self.objectsContainer_, questID)

	bubble:setPosition(worldPos.x, worldPos.y + 50, -1500)

	if not tolua.isnull(bubble.questBubble) then
		bubble.questBubble:SetActive(false)
	end

	handler:addBubble(bubble)

	local storyID = QuestTable:getStoryByQuestID(questID)[state]

	if not storyID or needShowUp then
		bubble:setVisible(true)
	end
end

function CityMap:_setBubbleVisible(event)
	local visible = event.params.visible
	local isPlayingClickAction = event.params.isPlayingClickAction
	local handler = xyd.QuestBubbleHandler.get()

	if handler:hasBubbleOnChar() then
		handler:setCharBubbleVisible(visible)
	end

	if not isPlayingClickAction and handler:hasNormalBubble() then
		handler:setBubblesVisible(visible)
	end
end

function CityMap:_removeQuestBubble(event)
	local questID = event.params.questID
	local bubbleHandler = xyd.QuestBubbleHandler.get()
	local bubble = bubbleHandler:getBubbleByID(questID)

	if bubble then
		bubbleHandler:removeBubble(questID)
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.SET_BUBBLE_VISIBLE,
			params = {
				isPlayingClickAction = false,
				visible = false
			}
		})
		XYDCo.WaitForTime(10 * xyd.TweenDeltaTime, function()
			bubble:dispose()
		end, "")
	end
end

function CityMap:_setTimerRingOnChar(event)
	local questID = event.params.questID
	local startTime = event.params.startTime
	local endTime = event.params.endTime
	local needShowUp = event.params.needShowUp
	local handler = xyd.TimerRingHandler.get()
	local char = self._allChars[self.MY_CHAR_ID]

	if char == nil then
		return
	end

	local worldPos = char:getPos()

	if not worldPos then
		return
	end

	if handler:hasTimerRingOnChar() then
		return
	end

	local ring = BuildOrRepairTimeRing.new(self.objectsContainer_, questID)

	ring:setPosition(worldPos.x, worldPos.y + self:getCharDefaultHeight() + 50, -1500)
	ring:run(endTime, startTime)

	handler.timerOnChar = ring

	if not tolua.isnull(ring.timerRing) then
		ring.timerRing:SetActive(false)
	end

	local storyID = QuestTable:getStoryByQuestID(questID)[xyd.QuestConstants.STARTED]

	if not storyID or needShowUp then
		ring:setVisible(true)
	end

	UpdateBeat:Add(self._timerRingFollowChar, self)
end

function CityMap:_timerRingFollowChar()
	local handler = xyd.TimerRingHandler.get()
	local timerRing = handler.timerOnChar

	if timerRing then
		local worldPos = self._allChars[self.MY_CHAR_ID]:getPos()

		timerRing:setPosition(worldPos.x, worldPos.y + self:getCharDefaultHeight() + 50, -1500)
	else
		UpdateBeat:Remove(self._timerRingFollowChar, self)
	end
end

function CityMap:_setTimerRingVisible(event)
	local visible = event.params.visible
	local isPlayingClickAction = event.params.isPlayingClickAction
	local TimerRingHandler = xyd.TimerRingHandler.get()
	local timerOnChar = TimerRingHandler.timerOnChar

	if not isPlayingClickAction then
		TimerRingHandler:setTimerRingsVisible(visible)
	end

	if timerOnChar then
		timerOnChar:setVisible(visible)
	end
end

function CityMap:_setTimerOnBuilding(event)
	local questID = event.params.questID
	local startTime = event.params.startTime
	local endTime = event.params.endTime
	local needShowUp = event.params.needShowUp
	local handler = xyd.TimerRingHandler.get()
	local gridPos = QuestTable:getBubblePosByID(questID)

	if tonumber(gridPos[1]) == -1 and tonumber(gridPos[2]) == -1 then
		self:_setTimerRingOnChar(event)

		return
	end

	local worldPos = xyd.CameraManager.get():gridToWorldPoint(Vector2(gridPos[1], gridPos[2]))
	local myTimerRing = BuildOrRepairTimeRing.new(self.objectsContainer_, questID)

	myTimerRing:setPosition(worldPos.x, worldPos.y + 50, -1500)
	myTimerRing:run(endTime, startTime)
	handler:addTimerRing(myTimerRing)
	myTimerRing.timerRing:SetActive(false)

	local storyID = QuestTable:getStoryByQuestID(questID)[xyd.QuestConstants.STARTED]

	if not storyID or needShowUp then
		myTimerRing:setVisible(true)
	end
end

function CityMap:_removeTimerOnBuilding(event)
	local questID = event.params.questID
	local handler = xyd.TimerRingHandler.get()
	local timer = handler:getTimerRingByID(questID)

	if timer then
		handler:removeTimerRing(questID)
		XYDCo.WaitForTime(10 * xyd.TweenDeltaTime, function()
			timer:dispose()
		end, "")
	end
end

function CityMap:_repairChangeTime(event)
	local questID = event.params.questID
	local quest = self._questModel:getQuestByID(questID)
	local endTime = quest.endTime
	local timerRing = xyd.TimerRingHandler.get():getTimerRingByID(questID)

	if timerRing then
		timerRing:update_Time(endTime)
	end
end

function CityMap:_updateBuildingsByGroupID(buildingGroupID, visible, questID, callback)
	local buildingGroupInfo = self._buildingGroupModel:getBuildingGroupInfoByID(buildingGroupID)

	if not buildingGroupInfo then
		return
	end

	local quest

	if questID then
		quest = self._questModel:getQuestByID(questID)
	end

	if buildingGroupInfo.isActive then
		local dressID = buildingGroupInfo:getDressID()
		local buildingIDs = buildingGroupInfo:getBuildingIDs()

		for k, buildingID in pairs(buildingIDs) do
			while true do
				local buildingID = tonumber(buildingID)
				local building = self._allBuildings[buildingID]

				if building == nil then
					local buildingTblData = BuildingTable:getTableDataByBuildingID(tonumber(buildingID))

					if buildingTblData == nil then
						__TRACE("building table data is undefined, building id: ", buildingID)

						break
					end

					building = self:_createSingleBuilding(tonumber(buildingID), dressID, buildingGroupInfo:getID(), buildingGroupInfo.canChangeDress, buildingTblData)
					building.zOrder = self:getZorderByBuildingData(buildingTblData)

					building:addSpriteToDisplayList()

					local canClick = BuildingGroupTable:getClickActionByGroupID(buildingGroupID)

					if canClick then
						-- block empty
					end
				end

				if quest then
					building.state = quest.state
				else
					building.state = xyd.QuestConstants.FINISHED
				end

				if buildingGroupInfo.canChangeDress then
					building.canChangeDress = true
				else
					building.canChangeDress = false
				end

				if building:getGoBuilding().activeSelf ~= visible then
					building:replaceSprite(dressID, xyd.BUILDING_ANIMATION_TYPE_CHANGE_WITHOUT_TWEEN, callback)

					do
						local goBuilding_ = building:getGoBuilding()

						if not tolua.isnull(goBuilding_) then
							goBuilding_:SetActive(visible)
						end
					end

					break
				end

				do
					local buildingGroupConf = BuildingGroupTable

					if questID then
						do
							local oldQuestBuildingID = QuestTable:getOldBuildingIDByQuestID(questID)
							local newQuestBuildingID = QuestTable:getNewBuildingIDByQuestID(questID)
							local animationType = xyd.BUILDING_ANIMATION_TYPE_CHANGE

							if oldQuestBuildingID ~= newQuestBuildingID then
								animationType = xyd.BUILDING_ANIMATION_TYPE_CHANGE_NO_DEL_TWEEN
							end

							building:replaceSprite(dressID, animationType, callback)
						end

						break
					end

					local animationType = xyd.BUILDING_ANIMATION_TYPE_NORMAL

					if buildingGroupConf:getClickActionByGroupID(buildingGroupID) ~= xyd.MapClickAction.BOUNCE then
						animationType = xyd.BUILDING_ANIMATION_TYPE_CHANGE_WITHOUT_TWEEN
					end

					building:replaceSprite(dressID, animationType, callback)
				end

				break
			end
		end
	else
		local buildingIDs = buildingGroupInfo:getBuildingIDs()

		for k, buildingID in pairs(buildingIDs) do
			buildingID = tonumber(buildingID)

			local building = self._allBuildings[buildingID]

			if building then
				building:destroySelf()

				self._allBuildings[buildingID] = nil
			end
		end
	end
end

function CityMap:getZorderByBuildingData(buildData)
	if buildData.type == 0 then
		return self._allBuildingZorders[buildData.building_id]
	elseif buildData.type == 1 then
		return 1
	elseif buildData.type == 2 then
		return 2
	elseif buildData.type == 3 then
		return 2.1
	elseif buildData.type == 4 then
		return 2.2
	elseif buildData.type == 5 then
		local otherBuilding = self._allBuildings[buildData.attach_id]

		if otherBuilding then
			return otherBuilding.zOrder + xyd.ATTACH_ZORDER
		end
	elseif buildData.type == 6 then
		return 1.1
	end
end

function CityMap:_popupChangeDressUI(buildingGroupID)
	self._state = MAP_STATE.STATE_CHANGING_DRESS

	self.loadingCircleControl:HideLoadingCircle()
	UpdateBeat:Remove(self.StartLoadingCircle, self)
	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.UPDATE_CHANGE_DRESS_UI,
		params = {
			needCloseUI = false,
			buildingGroupID = buildingGroupID
		}
	})
end

function CityMap:_onLongPressEnd()
	XYDCo.StopWait("LongPressDelay")
	XYDCo.StopWait("PopupChangeDressUI")
	self.loadingCircleControl:HideLoadingCircle()
	UpdateBeat:Remove(self.StartLoadingCircle, self)
end

function CityMap:_onLongPressBegin(event)
	if self._state ~= MAP_STATE.STATE_NORMAL then
		return
	end

	if tolua.isnull(self.loadingCircle) then
		return
	end

	local params = event.params
	local position = params.position
	local v = self.Camera:screenToWorldPoint(position)
	local collider2Ds = SceneUtils.OverlapCircleAll(Vector2(v.x, v.y), 2)
	local buildings = {}

	for i = 0, collider2Ds.Length - 1 do
		if self.cityBuildings_[collider2Ds[i].gameObject.name] ~= nil then
			table.insert(buildings, self.cityBuildings_[collider2Ds[i].gameObject.name])
		end
	end

	table.sort(buildings, function(a, b)
		return a.zOrder > b.zOrder
	end)

	local foundNoBuilding = true

	for _, building in ipairs(buildings) do
		local buildingGroupID = building.buildingGroupID

		if building and building:hitTest(v) then
			if building and building.canChangeDress and BuildingGroupTable:getDressNumByGroupID(buildingGroupID) > 1 then
				self.loadingCircle.transform.localPosition = Vector3(v.x, v.y + LOADING_CIRCLE_OFFSETY, 0)

				self:CalculateLoadingCircleScale()
				self.loadingCircleControl:ShowLoadingCircle()
				UpdateBeat:Add(self.StartLoadingCircle, self)

				foundNoBuilding = false

				XYDCo.WaitForTime(DEFAULT_LONG_PRESS_TIME, function()
					self:_popupChangeDressUI(buildingGroupID)
				end, "PopupChangeDressUI")
			end

			break
		end
	end

	if foundNoBuilding then
		dump("No Building!")
	end
end

function CityMap:_closeChangeDressUI()
	self._state = MAP_STATE.STATE_NORMAL

	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.UPDATE_CHANGE_DRESS_UI,
		params = {
			needCloseUI = true
		}
	})
end

function CityMap:StartLoadingCircle()
	self:CalculateLoadingCircleScale()
	self.loadingCircleControl:OnPressed()
end

function CityMap:CalculateLoadingCircleScale()
	local size = self.Camera:getOrthographicSize()

	self.loadingCircle.transform.localScale = DEFAULT_LOADING_CIRCLE_SCALE * size / self.defaultCameraSize
end

function CityMap:playHitEffect(worldPos, hit_eff_name, timeOut, scale)
	local posKey = math.floor(1000 * worldPos.y / 100 + worldPos.x / 100)
	local key = hit_eff_name .. posKey

	if not self._canPlayClickEffect then
		self._canPlayClickEffect = {}
	end

	if self._canPlayClickEffect[key] == nil or self._canPlayClickEffect[key] == false then
		self._canPlayClickEffect[key] = true

		XYDCo.WaitForTime(timeOut, function()
			self._canPlayClickEffect[key] = false
		end, "")
		SpineManager.get():newEffect(self.EffectContainer_, hit_eff_name, function(success, eff)
			if success then
				local spriteScale = eff.transform.localScale

				if scale.x == 0 then
					scale.x = 1
				end

				if scale.y == 0 then
					scale.y = 1
				end

				eff.transform.localScale = Vector3(scale.x * 100, scale.y * 100, scale.x * 100)
				eff.transform.localPosition = Vector3(worldPos.x, worldPos.y, xyd.EFF_CAMERA_Z)

				local SpineController = eff:GetComponent(typeof(SpineAnim))

				SpineController:play("texiao01", 1)

				local function onComplete()
					SpineManager.get():pushEffect(eff)
				end

				SpineController:addListener("Complete", onComplete)
			end
		end)
	end
end

function CityMap:mapClick(event)
	if not CityMap.super.mapClick(self, event) then
		return
	end

	RandomActionController.get():resetIdleTimer()

	local params = event.params
	local position = params.position
	local v = self.Camera.get():screenToWorldPoint(position)
	local collider2Ds = SceneUtils.OverlapCircleAll(Vector2(v.x, v.y), 2)
	local buildings = {}

	for i = 0, collider2Ds.Length - 1 do
		if self.cityBuildings_[collider2Ds[i].gameObject.name] ~= nil then
			table.insert(buildings, self.cityBuildings_[collider2Ds[i].gameObject.name])
		end
	end

	table.sort(buildings, function(a, b)
		return a.zOrder > b.zOrder
	end)

	if self._state == MAP_STATE.STATE_NORMAL then
		local ring = xyd.TimerRingHandler.get():hitTimerRing(position)
		local bubble = xyd.QuestBubbleHandler.get():hitQuestBubble(position)

		if ring and not tolua.isnull(ring.timerRing) then
			ring:onTouch()
		elseif bubble and not tolua.isnull(bubble.questBubble) then
			bubble:onTouch()
		else
			for _, building in ipairs(buildings) do
				if building:hitTest(v) then
					if BuildingGroupTable:getClickActionByGroupID(building.buildingGroupID) == xyd.MapClickAction.BOUNCE then
						building:onClick()

						local affinitiedBuildingIDs = BuildingTable:getAffinityByBuildingID(building.buildingID)

						if affinitiedBuildingIDs then
							for _, buildingID in ipairs(affinitiedBuildingIDs) do
								if self._allBuildings[buildingID] then
									self._allBuildings[buildingID]:onClick()
								end
							end
						end

						self:clickAction(building)
					end

					local dressData = DressTable:getTableDataByBuildingAndDressIndex(building.buildingID, building.dressID)

					if dressData and dressData.click_eff ~= "" then
						local pos = building:getPos()

						if dressData.click_eff_x then
							pos.x = pos.x + dressData.click_eff_x
						end

						if dressData.click_eff_y then
							pos.y = pos.y - dressData.click_eff_y
						end

						local worldpos = Vector2(pos.x, pos.y)
						local scale = Vector2(dressData.click_x_scale, dressData.click_y_scale)

						self:playHitEffect(worldpos, dressData.click_eff, dressData.click_time, scale)
					end

					break
				end
			end
		end
	elseif self._state == MAP_STATE.STATE_CHANGING_DRESS then
		local noBuilding = true

		for _, building in ipairs(buildings) do
			local buildingGroupID = building.buildingGroupID

			if building:hitTest(v) then
				if building.canChangeDress and BuildingGroupTable:getDressNumByGroupID(buildingGroupID) > 1 then
					noBuilding = false

					self:_popupChangeDressUI(buildingGroupID)
				end

				break
			end
		end

		if noBuilding then
			self:_closeChangeDressUI()
		end
	elseif self._state == MAP_STATE.STATE_CHANGING_BUILDING then
		-- block empty
	end
end

function CityMap:updateMapStatus()
	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.MAP_UPDATE_POSITION
	})
end

function CityMap:getEnterMapPos()
	return Vector3(3426, -1898, 0)
end

function CityMap:updateParallaxPosition()
	local position = self:getCameraPosition()
	local x, y = (position.x - self:getLeftPosition()) * 0.8, (position.y - self:getTopPosition()) * 0

	if not tolua.isnull(self.parallaxContainer1_) then
		self.parallaxContainer1_.transform.localPosition = Vector3(self.normalRect_.x + x, y, 0)
	end

	local x, y = (position.x - self:getLeftPosition()) * 0.72, (position.y - self:getTopPosition()) * 0

	if not tolua.isnull(self.parallaxContainer2_) then
		self.parallaxContainer2_.transform.localPosition = Vector3(self.normalRect_.x + x, y, 0)
	end

	if not tolua.isnull(self.shelterContainer_) then
		self.shelterContainer_.transform.localPosition = Vector3(self.normalRect_.x + x, -2050, ShelterDepth)
	end
end

function CityMap:mapScroll(event)
	if not CityMap.super.mapScroll(self, event) then
		return false
	end

	return true
end

function CityMap:getLeftPosition()
	local rect = self.normalRect_
	local halfHeight = self:getCameraSize()
	local halfWidth = halfHeight * Screen.width / Screen.height

	return rect.x + halfWidth
end

function CityMap:getTopPosition()
	local rect = self.normalRect_
	local halfHeight = self:getCameraSize()
	local halfWidth = halfHeight * Screen.width / Screen.height
	local topMargine = xyd.WindowManager.get():getTopMargine()

	return -rect.y - halfHeight + self:viewportToPixel(topMargine)
end

function CityMap:clearCityBuildings()
	for _, cityBuilding in pairs(self.cityBuildings_) do
		if cityBuilding ~= nil and cityBuilding.destroySelf ~= nil then
			cityBuilding:destroySelf()
		end
	end

	self.cityBuildings_ = {}
	self._allBuildings = {}
end

function CityMap:clearSpecialBuildings()
	for _, specialBuilding in pairs(self.specialBuildings_) do
		specialBuilding:dispose()
	end

	self.specialBuildings_ = {}
end

function CityMap:clearLockedAreas()
	for _, lockedArea in pairs(self.lockedAreas_) do
		lockedArea:dispose()
	end

	self.lockedAreas_ = {}
end

function CityMap:unloadMapSprites()
	CityMap.super.unloadMapSprites(self)

	for _, renderer in ipairs(self.mapSpriteRenderers_) do
		renderer.sprite = nil
	end

	self.mapSpriteRenderers_ = {}
end

function CityMap:destroyLoadingCircle()
	if not tolua.isnull(self.loadingCircle) then
		Destroy(self.loadingCircle)

		self.loadingCircle = nil
	end
end

function CityMap:cleanUp()
	UpdateBeat:Remove(self.updateCharLayer, self)
	self:unregisterEvents()
	self:cleanAnimations()
	self:unloadMapSprites()
	self:clearCityBuildings()
	self:clearSpecialBuildings()
	self:clearLockedAreas()
	self:destroyLoadingCircle()

	for key in pairs(self._allChars) do
		local char = self._allChars[key]

		char:destroySelf()
	end

	self._allChars = {}
	self.enterCallback_ = nil

	self.node_:SetActive(false)
	Destroy(self.node_)

	self.node_ = nil
	self.parallaxContainer1_ = nil
	self.parallaxContainer2_ = nil

	xyd.TimerRingHandler.get():clearUp()
	xyd.QuestBubbleHandler.get():clearUp()
	self:clearTouchLimitsByType(xyd.TouchLimitType.GUIDE)
	XYDCo.WaitForFrame(1, function()
		self:callExitCallback()
	end, nil)
end

function CityMap:initLockedAreas()
	local buildingModel = xyd.models.building
	local mapIDs = xyd.tables.buildingBattle:getIDs()

	for _, mapID in ipairs(mapIDs) do
		if not buildingModel:isUnlocked(mapID) then
			local area = import("app.maps.LockedArea").new(mapID, self.objectsContainer_)

			self.lockedAreas_[area:getName()] = area
			self.lockedAreaLoads_[mapID] = true
		end
	end
end

function CityMap:checkBuilding(cellID)
	return true
end

function CityMap:getBuildingByID(id)
	if not id then
		return
	end

	local name = "citybuilding_" .. id

	return self.cityBuildings_[name]
end

function CityMap:getBuildingByCategory(category)
	local buildingModel = xyd.models.building
	local buildingInfo = buildingModel:getBuildingInfoByCategory(category)

	if buildingInfo then
		local id = buildingInfo:getID()

		return self:getBuildingByID(id)
	end
end

function CityMap:getBuildingsByCategory(category)
	local buildingModel = xyd.models.building
	local infos = buildingModel:getBuildingInfosByCategory(category)
	local result = {}

	for _, info in pairs(infos) do
		local id = info:getID()
		local item = self:getBuildingByID(id)

		table.insert(result, item)
	end

	return result
end

function CityMap:getSpecialBuildingByType(type)
	local mark = xyd.SPECIAL_BUILDING_PREFIX .. type

	return self.specialBuildings_[mark]
end

function CityMap:getSpecialBuildingByID(buildingID)
	for spType, conf in pairs(SpecialBuildingConf) do
		if buildingID == spType then
			return self:getSpecialBuildingByType(spType)
		end
	end
end

function CityMap:getParallaxContainer1()
	return self.parallaxContainer1_
end

function CityMap:getNode()
	return self.node_
end

function CityMap:showMapStatic(show)
	if not self.isActive_ then
		return
	end

	self.skinContainer_:SetActive(show)
	self.objectsContainer_:SetActive(show)
end

function CityMap:onAppPause(event)
	return
end

function CityMap:getOldCameraSize()
	return self.oldCameraSize_
end

function CityMap:setOldCameraSize(size)
	self.oldCameraSize_ = size
end

function CityMap:getOldCameraPosition()
	return self.oldCameraPosition_
end

function CityMap:setOldCameraPosition(pos)
	self.oldCameraPosition_ = pos
end

function CityMap:getNormalSize()
	return self.normalSize_
end

function CityMap:initAnimations()
	xyd.AnimationManager.get():reset(self.animationContainer_)
	xyd.AnimationManager.get():initAnimations()
end

function CityMap:onCityBuildingLoaded(event)
	local params = event.params
	local cellID = params.cellID

	self.cityBuildingLoads_[cellID] = nil

	if self:checkBuildingsLoaded() then
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.ON_ALL_CITY_BUILDINGS_LOADED
		})
	end
end

function CityMap:checkBuildingsLoaded()
	if next(self.cityBuildingLoads_) then
		return false
	end

	return true
end

function CityMap:checkSpBuildingsLoaded()
	if next(self.specialBuildingLoads_) then
		return false
	end

	return true
end

function CityMap:checklockedAreasLoaded()
	if next(self.lockedAreaLoads_) then
		return false
	end

	return true
end

function CityMap:onSpBuildingLoaded(event)
	local params = event.params
	local category = params.spBuildingCategory

	self.specialBuildingLoads_[category] = nil

	if self:checkSpBuildingsLoaded() then
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.ON_ALL_SPECIAL_BUILDINGS_LOADED
		})
	end
end

function CityMap:onlockedAreaLoaded(event)
	local params = event.params
	local mapID = params.mapID

	self.lockedAreaLoads_[mapID] = nil

	if self:checklockedAreasLoaded() then
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.ON_ALL_LOCKED_AREA_LOADED
		})
	end
end

function CityMap:onCreateBuilding(event)
	local params = event.params
	local buildingInfo = params.building_info

	self:refreshBuildingItem(buildingInfo.building_id, true)
end

function CityMap:onCreateBuildingByCrystal(event)
	local params = event.params

	self:refreshBuildingItem(params.building_id, true)
end

function CityMap:onUpgradeBuildingByCrystal(event)
	local params = event.params

	self:refreshBuildingItem(params.building_id)
end

function CityMap:onRemoveBuilding(event)
	local params = event.params

	self:refreshBuildingItem(params.building_id)
end

function CityMap:onRefreshBuilding(event)
	local params = event.params

	self:refreshBuildingItem(params.building_id)
end

function CityMap:refreshBuildingItem(buildingID, isBuilding)
	local buildingInfo = self:getInfoByID(buildingID)
	local buildingItem = self:getBuildingByID(buildingID)

	if buildingItem then
		if isBuilding then
			buildingItem:setBuilding(true)
		end

		buildingItem:refreshBuilding()
	end
end

function CityMap:getInfoByID(buildingID)
	return xyd.models.building:getInfo(buildingID)
end

function CityMap:onRefreshLockedArea()
	for _, lockedArea in pairs(self.lockedAreas_) do
		lockedArea:refreshArea()
	end
end

function CityMap:getObjectContainer()
	return self.objectsContainer_
end

function CityMap:getCharGridPos(charID)
	local char = self._allChars[charID]

	if char then
		return xyd.CameraManager.get():worldToGridPointFloat(char:getPos())
	end

	return nil
end

function CityMap:_removeCharacter(charID)
	local char = self._allChars[charID]

	if char then
		char:removeSpriteFromDisplayList()

		self._allChars[charID] = nil
	end
end

function CityMap:rotationCharacter(charID, rotation)
	local char = self._allChars[charID]

	if char then
		char:setRotation(rotation - 180 - 45)
	end
end

function CityMap:clickAction(building)
	local buildingTblData = BuildingTable:getTableDataByBuildingID(building:getID())

	if buildingTblData.start_quest and buildingTblData.story_id then
		local minQuest = RandomActionController.get():getMinQuest()

		if minQuest >= buildingTblData.start_quest then
			xyd.QuestController.get():startPlayClickAction()
			xyd.EventDispatcher.inner():dispatchEvent({
				name = xyd.event.QUEST_ACTION_SKIP,
				params = {}
			})
			xyd.QuestController.get():onSkipStory(false)
			RandomActionController.get():onSkipStory()
			self:_onSkipAction(nil)
			XYDCo.WaitForTime(0.05, function()
				xyd.QuestController.get():startStory(buildingTblData.story_id)
			end, nil)
		end
	end
end

function CityMap:_clearActionEffect()
	xyd.BuildingActionHandler.get():ClearEffectOnBuilding()
	xyd.MapEffectActionHandler.get():ClearActionEffectOnMap()
end

function CityMap:_onSkipAction(event)
	xyd.CameraActionHandler.get():RemoveCharFollow()
	xyd.MapActionHandlerController.get():ClearTimeOut()

	local actor = self._allChars[self.MY_CHAR_ID]

	if actor then
		actor:killTw()
		actor:playIdle()

		local pos = xyd.CameraManager.get():worldToGridPointFloat(actor:getPos())

		self:_moveCharacter(actor:getID(), 0, pos.x, pos.y, pos.x, pos.y)
	end
end

function CityMap:_onSkipStory(event)
	self._moveCharID = nil

	self:_clearActionEffect()
	xyd.NightFallActionHandler.get():clearNightFall()

	if self._closeConversationComponentTimer then
		XYDCo.StopWait(self._closeConversationComponentTimer)

		self._closeConversationComponentTimer = nil
	end

	self:closeConversationComponent(false)
	self:_playIdleAnimation(self.MY_CHAR_ID)

	local actor = self._allChars[self.MY_CHAR_ID]

	if actor then
		actor:killTw()
	end
end

function CityMap:_playIdleAnimation(charID)
	local char = self._allChars[charID]

	if char then
		char:playIdle()
	end
end

function CityMap:closeConversationComponent(needPlayNext)
	if self._conversationComponent then
		local callback

		function callback()
			UpdateBeat:Remove(self._followConversationComponent, self)
		end

		self._conversationComponent:UICloseAnimation(callback)
	end
end

return CityMap
