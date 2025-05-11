-- chunkname: @../../../Product/Bundles/Android/src/app/maps/CityBuilding.lua

local CityBuilding = class("CityBuilding", import(".BaseBuilding"))
local BuildingCellTable = xyd.tables.buildingCell
local BuildingTable = xyd.tables.building
local BuildingCategoryTable = xyd.tables.buildingCategory
local SpriteRenderer = UnityEngine.SpriteRenderer
local BoxCollider2D = UnityEngine.BoxCollider2D
local CityBuildingName = "citybuilding_"
local Destroy = UnityEngine.Object.Destroy

function CityBuilding:ctor(id, node)
	CityBuilding.super.ctor(self, id, node)

	self.cellID_ = id
	self.name_ = CityBuildingName .. id

	self:refreshBuilding()
end

function CityBuilding:playBuidAnimation()
	return
end

function CityBuilding:refreshBuilding()
	local info = self:getBuildingInfo()

	if not info then
		if self.tableID_ then
			self:destroyBuilding()
			self:setTableID(nil)
		end

		if not self.goBuilding_ then
			self:createBuilding(true)
		end
	else
		local tableID = info:getTableID()

		if not self.tableID_ then
			self.tableID_ = tableID

			self:destroyBuilding()
			self:setTableID(tableID)
			self:createBuilding(false)
		else
			local graphic1 = BuildingTable:getPicture(self.tableID_)
			local graphic2 = BuildingTable:getPicture(tableID)

			if graphic1 ~= graphic2 then
				self:updateSurface(graphic2)
			end
		end
	end

	if self.tableID_ then
		local realLevel = info:getRealLevel()

		if realLevel <= 0 then
			self.goLevel_:SetActive(false)
		else
			self.goLevel_:SetActive(true)

			self.labelLevel_.text = realLevel
		end

		self.goUpgrade_:SetActive(false)
		self:refreshByKind()
	end
end

function CityBuilding:refreshByKind()
	return
end

function CityBuilding:getBuildingInfo()
	local buildingModel = xyd.models.building
	local info = buildingModel:getInfo(self.cellID_)

	return info
end

function CityBuilding:createBuilding(isPlot)
	local prefab, spriteName

	if isPlot then
		spriteName = "citybuilding_empty"
		prefab = xyd.AssetsLoader.get():loadPrefab("Prefabs/Buildings/plot")
		self.goBuilding_ = NGUITools.AddChild(self.pnode_, prefab)

		if UNITY_EDITOR then
			local labelID = self.goBuilding_:ComponentByName("label_id", typeof(UILabel))

			labelID.text = self.id_
		end

		self.labelLevel_ = nil
		self.goUpgrade_ = nil

		local size = BuildingCellTable:getSize(self.id_)

		self.goBuilding_.transform.localScale = Vector3.one * size
	else
		local buildingInfo = self:getBuildingInfo()

		spriteName = BuildingTable:getPicture(buildingInfo:getTableID())
		prefab = xyd.AssetsLoader.get():loadPrefab("Prefabs/Buildings/city_building")
		self.goBuilding_ = NGUITools.AddChild(self.pnode_, prefab)
		self.goLevel_ = self.goBuilding_:NodeByName("level_bg").gameObject
		self.labelLevel_ = self.goLevel_:ComponentByName("label_level", typeof(UILabel))
		self.goUpgrade_ = self.goBuilding_:NodeByName("upgrade").gameObject

		local rendererLevel = self.goLevel_:GetComponent(typeof(SpriteRenderer))
		local rendererUpgrade = self.goUpgrade_:GetComponent(typeof(SpriteRenderer))

		rendererLevel.sortingOrder = xyd.CityMapLayerDepth.BUILDING_UI
		rendererUpgrade.sortingOrder = xyd.CityMapLayerDepth.BUILDING_UI
		self.goBuilding_.transform.localScale = Vector3.one * 0.8
	end

	self.goBuilding_.name = self.name_
	self.goBuilding_.transform.position = BuildingCellTable:getBPosition(self.cellID_)
	self.tweenColorClick_ = self.goBuilding_:GetComponent(typeof(TweenColor))

	XYDUtils.AddEventDelegate(self.tweenColorClick_.onFinished, handler(self, self.onBuildingTwinkle))
	self.goBuilding_:SetActive(false)

	local spriteRenderer = self.goBuilding_:GetComponent(typeof(SpriteRenderer))

	spriteRenderer.sortingOrder = xyd.CityMapLayerDepth.BUILDING + BuildingCellTable:getOrder(self.cellID_)

	local uAtlasPath = "Atlases_sp2/CityBuildings"

	xyd.AssetsLoader.get():loadUAtlasAsync(uAtlasPath, false, function(uAtlas)
		if self.disposed_ then
			return
		end

		self.goBuilding_:SetActive(true)
		xyd.CityMap.get():loadUAtlas(uAtlas, uAtlasPath)

		local spriteRGB, spriteAlpha = xyd.CityMap.get():getMapSprite(spriteName)

		if not spriteRGB then
			spriteRGB, spriteAlpha = xyd.CityMap.get():getMapSprite("build_1_1")
		end

		if spriteRGB and spriteAlpha then
			spriteRenderer.sprite = spriteRGB
			spriteRenderer.sharedMaterial = xyd.AssetsLoader.get():getInstanceMaterial(spriteAlpha)

			local collider = self.goBuilding_:AddComponent(typeof(BoxCollider2D))

			collider.size = Vector2(spriteRGB.rect.width, spriteRGB.rect.height)
		end

		self.isLoaded_ = true

		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.ON_CITY_BUILDING_LOADED,
			params = {
				cellID = self.cellID_
			}
		})

		if self.isBuilding_ then
			self:setBuilding(false)
			self:playBuidAnimation()
		else
			self:refreshUpgradable()
		end
	end)
end

function CityBuilding:refreshUpgradable()
	return
end

function CityBuilding:setBuilding(building)
	self.isBuilding_ = building
end

function CityBuilding:updateSurface(graphicID)
	local spriteName = graphicID
end

function CityBuilding:onClick()
	if self.tweenColorPlaying_ then
		return
	end

	self.tweenColorClick_:ResetToBeginning()
	self.tweenColorClick_:PlayForward()

	self.tweenColorPlaying_ = true
	self.maskID_ = xyd.MaskWindow.get():addMask()
end

function CityBuilding:onBuildingTwinkle()
	if self.disposed_ then
		return
	end

	self.tweenColorPlaying_ = false

	xyd.MaskWindow.get():removeMask(self.maskID_)

	self.maskID_ = nil

	local buildingModel = xyd.models.building
	local mapID = BuildingCellTable:getMapID(self.cellID_)

	if not buildingModel:isUnlocked(mapID) then
		__TRACE("this cell is locked")

		return
	end

	if not self.tableID_ then
		xyd.WindowManager.get():openWindow("building_select_window", {
			cellID = self.cellID_
		})
	else
		local buildingInfo = self:getBuildingInfo()
		local tableID = buildingInfo:getTableID()
		local category = BuildingTable:getCategory(tableID)
		local windowName = xyd.BuildingCategory2WindowName[category]

		if windowName then
			xyd.WindowManager.get():openWindow(windowName, {
				cellID = self.cellID_
			})
		end
	end
end

function CityBuilding:setTableID(tableID)
	self.tableID_ = tableID
end

function CityBuilding:dispose()
	CityBuilding.super.dispose(self)

	self.tableID_ = nil

	self:destroyBuilding()
end

function CityBuilding:destroyBuilding()
	if self.goBuilding_ then
		Destroy(self.goBuilding_)

		self.goBuilding_ = nil
	end
end

function CityBuilding:refreshUpgradable()
	return
end

function CityBuilding:getCellID()
	return self.cellID_
end

return CityBuilding
