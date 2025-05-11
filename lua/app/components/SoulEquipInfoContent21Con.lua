-- chunkname: @../../../Product/Bundles/Android/src/app/components/SoulEquipInfoContent21Con.lua

local SoulEquipInfoContent21Con = class("SoulEquipInfoContent21Con", import("app.components.CopyComponent"))
local BaseComponent = import("app.components.BaseComponent")
local SoulEquipInfoContent21ConItem = class("SoulEquipInfoContent21ConItem", import("app.common.ui.FixedMultiWrapContentItem"))
local AttrLabel = import("app.components.AttrLabel")

function SoulEquipInfoContent21Con:ctor(goItem, parent)
	self.parent = parent
	self.filterIndex = 0

	SoulEquipInfoContent21Con.super.ctor(self, goItem)
end

function SoulEquipInfoContent21Con:initUI()
	self:getUIComponent()
	SoulEquipInfoContent21Con.super.initUI(self)
	self:register()
	self:layout()
end

function SoulEquipInfoContent21Con:getUIComponent()
	self.content2_1 = self.go
	self.bg2 = self.content2_1:ComponentByName("bg2", typeof(UISprite))
	self.btnCircles = self.content2_1:NodeByName("btnCircles").gameObject
	self.btnQualityChosen = self.btnCircles:NodeByName("btnQualityChosen").gameObject

	for i = 1, 7 do
		self["btnCircle" .. i] = self.btnCircles:NodeByName("btnCircle" .. i).gameObject
	end

	self.equip1Item = self.content2_1:NodeByName("equip1Item").gameObject
	self.equip1Scroller = self.content2_1:NodeByName("equip1Scroller").gameObject
	self.equip1ScrollView = self.content2_1:ComponentByName("equip1Scroller", typeof(UIScrollView))
	self.itemGroup = self.equip1ScrollView:NodeByName("itemGroup").gameObject
	self.drag = self.content2_1:NodeByName("drag").gameObject
	self.noneGroup = self.content2_1:NodeByName("noneGroup").gameObject
	self.labelNone = self.noneGroup:ComponentByName("labelNone", typeof(UILabel))

	local wrapContent = self.equip1ScrollView:ComponentByName("itemGroup", typeof(MultiRowWrapContent))

	self.multiWrap_ = require("app.common.ui.FixedMultiWrapContent").new(self.equip1ScrollView, wrapContent, self.equip1Item, SoulEquipInfoContent21ConItem, self)
end

function SoulEquipInfoContent21Con:register()
	for i = 1, 7 do
		UIEventListener.Get(self["btnCircle" .. i]).onClick = function()
			if self.filterIndex == i then
				self.filterIndex = 0
			else
				self.filterIndex = i
			end

			self:update()
		end
	end
end

function SoulEquipInfoContent21Con:layout()
	self.labelNone.text = __("SOUL_EQUIP_TEXT33")

	self:update()
end

function SoulEquipInfoContent21Con:update()
	self.btnQualityChosen:SetActive(self.filterIndex > 0)

	if self.filterIndex > 0 then
		self.btnQualityChosen.transform.parent = self["btnCircle" .. self.filterIndex].transform
	end

	self.btnQualityChosen:X(0)

	local data = {}
	local equips = xyd.models.slot:getSoulEquip1s()

	for id, equip in pairs(equips) do
		local pos = equip:getPos()
		local qlt = equip:getQlt()

		if pos == self.parent.curSelectEquipPos and (self.filterIndex == 0 or qlt == self.filterIndex) then
			table.insert(data, {
				equip = equip
			})
		end
	end

	local function sortFunc(a, b)
		local aLevel = a.equip:getLevel()
		local bLevel = b.equip:getLevel()
		local aStar = a.equip:getStar()
		local bStar = b.equip:getStar()
		local aQlt = a.equip:getQlt()
		local bQlt = b.equip:getQlt()

		if aQlt ~= bQlt then
			return bQlt < aQlt
		elseif aStar ~= bStar then
			return bStar < aStar
		elseif aLevel ~= bLevel then
			return bLevel < aLevel
		else
			return a.equip:getTableID() < b.equip:getTableID()
		end
	end

	table.sort(data, sortFunc)
	self.noneGroup:SetActive(#data <= 0)
	self.equip1ScrollView:SetActive(#data > 0)
	self.multiWrap_:setInfos(data, {})
	self.equip1ScrollView:ResetPosition()
end

function SoulEquipInfoContent21ConItem:ctor(go, parent)
	SoulEquipInfoContent21ConItem.super.ctor(self, go, parent)

	self.parent = parent
end

function SoulEquipInfoContent21ConItem:initUI()
	self.iconPos = self.go:NodeByName("iconPos").gameObject
end

function SoulEquipInfoContent21ConItem:update(wrapIndex, index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.go:SetActive(true)

	self.data = info

	self:updateInfo(wrapIndex, index)
end

function SoulEquipInfoContent21ConItem:updateInfo(wrapIndex, index)
	self.equip = self.data.equip

	local params = {
		scale = 0.9166666666666666,
		uiRoot = self.iconPos,
		itemID = self.equip:getTableID(),
		soulEquipInfo = self.equip:getSoulEquipInfo(),
		partner_id = self.equip:getOwnerPartnerID(),
		callback = function()
			self:onClickIcon()
		end,
		dragScrollView = self.parent.equip1ScrollView
	}

	if self.icon then
		self.icon:setInfo(params)
		self.icon:SetActive(true)
	else
		self.icon = xyd.getItemIcon(params, xyd.ItemIconType.ADVANCE_ICON)
	end

	local nowEquip

	if self.parent.parent.combinationEditMode then
		nowEquip = self.parent.parent.curCombinationModeData.equips[self.parent.parent.curSelectEquipPos]
	else
		nowEquip = self.parent.parent.equips[self.parent.parent.curSelectEquipPos]
	end

	if nowEquip and self.equip:getSoulEquipID() == nowEquip:getSoulEquipID() then
		if self.parent.curSelectIcon then
			self.parent.curSelectIcon:setChoose(false)
		end

		if self.equip:getIsLock() then
			self.icon:setChoose(false)
			self.icon:setLock(true)
		else
			self.icon:setLock(false)
			self.icon:setChoose(true)
		end

		self.parent.curSelectIcon = self.icon
	elseif self.equip:getIsLock() then
		self.icon:setChoose(false)
		self.icon:setLock(true)
	else
		self.icon:setChoose(false)
		self.icon:setLock(false)
	end
end

function SoulEquipInfoContent21ConItem:onClickIcon()
	local nowEquip

	if self.parent.parent.combinationEditMode then
		nowEquip = self.parent.parent.curCombinationModeData.equips[self.parent.parent.curSelectEquipPos]
	else
		nowEquip = self.parent.parent.equips[self.parent.parent.curSelectEquipPos]
	end

	local midcallback

	if self.parent.parent.combinationEditMode then
		self.nowEquip = self.parent.parent.curCombinationModeData.equips[self.parent.parent.curSelectEquipPos]

		function midcallback()
			self.parent.parent.curCombinationModeData.equips[self.equip:getPos()] = self.equip

			self.parent.parent:updateTopGroup()

			if self.parent.curSelectIcon then
				self.parent.curSelectIcon:setChoose(false)
			end

			self.icon:setChoose(true)

			self.parent.curSelectIcon = self.icon

			xyd.WindowManager.get():closeWindow("item_tips_window")
		end
	else
		self.nowEquip = self.parent.parent.equips[self.parent.parent.curSelectEquipPos]
		self.partner = self.parent.parent.partner

		function midcallback()
			local function sureCallback()
				self.partner:takeOnSoulEquip(self.equip:getSoulEquipID(), function()
					if self.parent.curSelectIcon then
						self.parent.curSelectIcon:setChoose(false)
					end

					self.icon:setChoose(true)

					self.parent.curSelectIcon = self.icon

					self.parent.parent:initData()
					self.parent.parent:updateTopGroup()
					self.parent:update()
				end)
				xyd.WindowManager.get():closeWindow("item_tips_window")
			end

			local somebodyEquiped = false

			if self.equip:getOwnerPartnerID() and self.equip:getOwnerPartnerID() > 0 then
				somebodyEquiped = true
			end

			if somebodyEquiped then
				local timeStamp = xyd.db.misc:getValue("soul_equip_exchange_equip_tip")

				if tonumber(timeStamp) and xyd.isSameDay(tonumber(timeStamp), xyd.getServerTime()) then
					sureCallback()
				else
					xyd.WindowManager.get():closeWindow("item_tips_window")
					xyd.openWindow("soul_equip_comfirm_exchange_window", {
						equipIDs = {
							self.equip:getSoulEquipID()
						},
						callback = sureCallback
					})
				end
			else
				sureCallback()
			end
		end
	end

	if nowEquip and self.equip:getSoulEquipID() == nowEquip:getSoulEquipID() then
		local params = {
			btnLayout = 0,
			choose_equip = true,
			equipedOn = self.partner,
			equipedPartner = self.partner,
			itemID = self.nowEquip:getTableID(),
			upArrowCallback = function()
				local itemType = xyd.tables.itemTable:getType(self.nowEquip:getTableID())

				if itemType == xyd.ItemType.SOUL_EQUIP1 then
					xyd.openWindow("soul_equip1_strengthen_window", {
						equipID = self.nowEquip:getSoulEquipID()
					})
				else
					xyd.openWindow("soul_equip2_strengthen_window", {
						equipID = self.nowEquip:getSoulEquipID()
					})
				end

				xyd.WindowManager:get():closeWindow("item_tips_window")
			end,
			soulEquipInfo = self.nowEquip:getSoulEquipInfo(),
			lockClickCallBack = function()
				local lockFlag = self.nowEquip:getIsLock()
				local lock = 1

				if lockFlag then
					lock = 0
				end

				xyd.models.slot:reqLockSoulEquip(self.nowEquip:getSoulEquipID(), lock, function()
					self.nowEquip:setLock(lock)

					local win = xyd.getWindow("item_tips_window")

					if win and win.itemTips_ then
						win.itemTips_:setBtnLockState(self.nowEquip:getIsLock())
					end

					self:updateInfo()
				end)
			end,
			lockStateCallBack = function()
				return self.nowEquip:getIsLock()
			end
		}

		xyd.WindowManager.get():openWindow("item_tips_window", params)

		return
	end

	if self.nowEquip then
		local params = {
			btnLayout = 0,
			choose_equip = true,
			equipedOn = self.partner,
			equipedPartner = self.partner,
			itemID = self.nowEquip:getTableID(),
			upArrowCallback = function()
				local itemType = xyd.tables.itemTable:getType(self.nowEquip:getTableID())

				if itemType == xyd.ItemType.SOUL_EQUIP1 then
					xyd.openWindow("soul_equip1_strengthen_window", {
						equipID = self.nowEquip:getSoulEquipID()
					})
				else
					xyd.openWindow("soul_equip2_strengthen_window", {
						equipID = self.nowEquip:getSoulEquipID()
					})
				end

				xyd.WindowManager:get():closeWindow("item_tips_window")
			end,
			soulEquipInfo = self.nowEquip:getSoulEquipInfo(),
			lockClickCallBack = function()
				local lockFlag = self.nowEquip:getIsLock()
				local lock = 1

				if lockFlag then
					lock = 0
				end

				xyd.models.slot:reqLockSoulEquip(self.nowEquip:getSoulEquipID(), lock, function()
					self.nowEquip:setLock(lock)

					local win = xyd.getWindow("item_tips_window")

					if win and win.itemTips_ then
						win.itemTips_:setBtnLockState(self.nowEquip:getIsLock())
					end

					self:updateInfo()
				end)
			end,
			lockStateCallBack = function()
				return self.nowEquip:getIsLock()
			end
		}

		xyd.WindowManager.get():openWindow("item_tips_window", params)
	end

	local params = {
		btnLayout = 1,
		choose_equip = true,
		itemID = self.equip:getTableID(),
		midColor = xyd.ButtonBgColorType.blue_btn_65_65,
		midCallback = midcallback,
		midLabel = self.nowEquip and __("REPLACE") or __("EQUIP_ON"),
		upArrowCallback = function()
			local itemType = xyd.tables.itemTable:getType(self.equip:getTableID())

			if itemType == xyd.ItemType.SOUL_EQUIP1 then
				xyd.openWindow("soul_equip1_strengthen_window", {
					equipID = self.equip:getSoulEquipID()
				})
			else
				xyd.openWindow("soul_equip2_strengthen_window", {
					equipID = self.equip:getSoulEquipID()
				})
			end

			xyd.WindowManager:get():closeWindow("item_tips_window")
		end,
		soulEquipInfo = self.equip:getSoulEquipInfo(),
		lockClickCallBack = function()
			local lockFlag = self.equip:getIsLock()
			local lock = 1

			if lockFlag then
				lock = 0
			end

			xyd.models.slot:reqLockSoulEquip(self.equip:getSoulEquipID(), lock, function()
				self.equip:setLock(lock)

				local win = xyd.getWindow("item_tips_window")

				if win and win.diffItemTips then
					win.diffItemTips:setBtnLockState(self.equip:getIsLock())
				elseif win and win.itemTips_ then
					win.itemTips_:setBtnLockState(self.equip:getIsLock())
				end

				self:updateInfo()
			end)
		end,
		lockStateCallBack = function()
			return self.equip:getIsLock()
		end
	}
	local partnerID = self.equip:getOwnerPartnerID()

	if partnerID and partnerID > 0 then
		params.equipedOn = xyd.models.slot:getPartner(partnerID)
	end

	local itemTipsWindow = xyd.WindowManager.get():getWindow("item_tips_window")

	if itemTipsWindow == nil then
		xyd.WindowManager.get():openWindow("item_tips_window", params)
	else
		itemTipsWindow:addTips(params)
	end
end

return SoulEquipInfoContent21Con
