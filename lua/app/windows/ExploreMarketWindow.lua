﻿-- chunkname: @../../../Product/Bundles/Android/src/app/windows/ExploreMarketWindow.lua

local ExploreMarketWindow = class("ExploreMarketWindow", import(".ExploreBaseBuildingWindow"))
local HeroIcon = import("app.components.HeroIcon")
local exploreModel = xyd.models.exploreModel
local buildingMaxLevel = 50
local exploreTable = xyd.tables.exploreMarketTable

function ExploreMarketWindow:ctor(name, params)
	params.buildingType = xyd.exploreBuildings.MARKET

	ExploreMarketWindow.super.ctor(self, name, params)

	self.exploreTable = exploreTable
end

function ExploreMarketWindow:initWindow()
	ExploreMarketWindow.super.initWindow(self)
end

function ExploreMarketWindow:getUIComponent()
	ExploreMarketWindow.super.getUIComponent(self)
end

function ExploreMarketWindow:layout()
	ExploreMarketWindow.super.layout(self)

	for i = 1, 2 do
		xyd.setUITextureByNameAsync(self["imgBuilding" .. i], "explore_market")
	end

	self.groupLabelMiddle[1][2].text = __("TRAVEL_MAIN_TEXT15")
	self.groupLabelMiddle[1][4].text = __("TRAVEL_MAIN_TEXT17")

	if self.data.level < buildingMaxLevel then
		self.groupLabelMiddle[2][2].text = __("TRAVEL_MAIN_TEXT15")
		self.groupLabelMiddle[2][4].text = __("TRAVEL_MAIN_TEXT17")
	else
		self.groupLabelMiddle[2][2].text = "-- --"
		self.groupLabelMiddle[2][4].text = "-- --"
		self.groupLabelMiddle[2][2].color = Color.New2(2795939583)
		self.groupLabelMiddle[2][4].color = Color.New2(2795939583)
	end

	self.labelTitle.text = __("TRAVEL_BUILDING_NAME1")
end

function ExploreMarketWindow:updateOutAndStay()
	if self.data.level < buildingMaxLevel then
		for i = 1, 2 do
			local lev = self.data.level + i - 1

			self.groupLabelMiddle[i][1].text = __("TRAVEL_MAIN_TEXT13", lev)
			self.groupLabelMiddle[i][3].text = xyd.getRoughDisplayNumber(math.floor(exploreTable:getOutput(lev)[2] * (1 + self.outFactor / 100 + xyd.models.dress:getBuffTypeAttr(xyd.DressBuffAttrType.TRIAL_COIN_DAY))))
			self.groupLabelMiddle[i][5].text = xyd.getRoughDisplayNumber(math.floor(exploreTable:getStayMax(lev) * (1 + self.stayFactor / 100)))
		end
	else
		local lev = self.data.level

		self.groupLabelMiddle[1][1].text = __("TRAVEL_MAIN_TEXT13", lev)
		self.groupLabelMiddle[1][3].text = xyd.getRoughDisplayNumber(math.floor(exploreTable:getOutput(lev)[2] * (1 + self.outFactor / 100 + xyd.models.dress:getBuffTypeAttr(xyd.DressBuffAttrType.TRIAL_COIN_DAY))))
		self.groupLabelMiddle[1][5].text = xyd.getRoughDisplayNumber(math.floor(exploreTable:getStayMax(lev) * (1 + self.stayFactor / 100)))
		self.groupLabelMiddle[2][1].text = __("TRAVEL_MAIN_TEXT44")
		self.groupLabelMiddle[2][3].text = "--"
		self.groupLabelMiddle[2][5].text = "--"
		self.groupLabelMiddle[2][1].color = Color.New2(2795939583)
		self.groupLabelMiddle[2][3].color = Color.New2(2795939583)
		self.groupLabelMiddle[2][5].color = Color.New2(2795939583)
	end
end

function ExploreMarketWindow:registerEvent()
	ExploreMarketWindow.super.registerEvent(self)

	local slotLimit = exploreModel:getBuildingSlotLimit()

	for i = 1, 4 do
		local limLev = slotLimit[i][1]
		local item = self.groupHero[i]

		UIEventListener.Get(item.lockImg).onClick = function()
			xyd.SoundManager.get():playSound(xyd.SoundID.BUTTON)

			if self.chooseGroup.activeSelf then
				self.chooseGroup:SetActive(false)
				self:setBuildingPartner()

				self.slotIndex = nil
			end

			xyd.showToast(__("TRAVEL_MAIN_TEXT41", limLev))
		end
	end
end

return ExploreMarketWindow
