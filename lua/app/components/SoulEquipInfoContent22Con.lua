-- chunkname: @../../../Product/Bundles/Android/src/app/components/SoulEquipInfoContent22Con.lua

local SoulEquipInfoContent22Con = class("SoulEquipInfoContent22Con", import("app.components.CopyComponent"))
local BaseComponent = import("app.components.BaseComponent")
local SoulEquipInfoContent22ConItem = class("SoulEquipInfoContent22ConItem", import("app.common.ui.FixedMultiWrapContentItem"))
local CommonTabBar = import("app.common.ui.CommonTabBar")
local AttrLabel = import("app.components.AttrLabel")

function SoulEquipInfoContent22Con:ctor(goItem, parent)
	self.parent = parent
	self.filterIndex = self.parent.curSelectEquipPos
	self.sortType = 1
	self.filterAttrs = {}
	self.filterSuit = 0
	self.curSelectIcon = {}

	SoulEquipInfoContent22Con.super.ctor(self, goItem)
end

function SoulEquipInfoContent22Con:initUI()
	self:getUIComponent()
	SoulEquipInfoContent22Con.super.initUI(self)
	self:register()
	self:layout()
end

function SoulEquipInfoContent22Con:getUIComponent()
	self.content2_2 = self.go
	self.bg2 = self.content2_2:ComponentByName("bg2", typeof(UISprite))
	self.equip2Item = self.content2_2:NodeByName("equip2Item").gameObject
	self.equip2Scroller = self.content2_2:NodeByName("equip2Scroller").gameObject
	self.equip2ScrollView = self.content2_2:ComponentByName("equip2Scroller", typeof(UIScrollView))
	self.itemGroup = self.equip2Scroller:NodeByName("itemGroup").gameObject
	self.drag = self.content2_2:NodeByName("drag").gameObject
	self.btnSortSuit = self.content2_2:NodeByName("btnSortSuit").gameObject
	self.labelSortSuit = self.btnSortSuit:ComponentByName("label", typeof(UILabel))
	self.btnSortAttr = self.content2_2:NodeByName("btnSortAttr").gameObject
	self.labelSortAttr = self.btnSortAttr:ComponentByName("label", typeof(UILabel))
	self.sortBtn = self.content2_2:NodeByName("sortBtn").gameObject
	self.arrow = self.sortBtn:ComponentByName("arrow", typeof(UISprite))
	self.labelSortBtn = self.sortBtn:ComponentByName("label", typeof(UILabel))
	self.sortPop = self.content2_2:NodeByName("sortPop").gameObject

	for i = 1, 4 do
		self["sortTab" .. i] = self.sortPop:NodeByName("tab_" .. i).gameObject
		self["labelSortTab" .. i] = self["sortTab" .. i]:ComponentByName("label", typeof(UILabel))
		self["sortChosen" .. i] = self["sortTab" .. i]:ComponentByName("chosen", typeof(UISprite))
	end

	self.filters = self.content2_2:NodeByName("filters").gameObject

	for i = 1, 4 do
		self["btnFilterPos" .. i] = self.filters:NodeByName("btnFilterPos" .. i).gameObject
		self["labelFilterPos" .. i] = self["btnFilterPos" .. i]:ComponentByName("label", typeof(UILabel))
	end

	self.noneGroup = self.content2_2:NodeByName("noneGroup").gameObject
	self.labelNone = self.noneGroup:ComponentByName("labelNone", typeof(UILabel))

	local wrapContent = self.equip2Scroller:ComponentByName("itemGroup", typeof(MultiRowWrapContent))

	self.multiWrap_ = require("app.common.ui.FixedMultiWrapContent").new(self.equip2ScrollView, wrapContent, self.equip2Item, SoulEquipInfoContent22ConItem, self)
end

function SoulEquipInfoContent22Con:register()
	UIEventListener.Get(self.btnSortAttr).onClick = function()
		xyd.openWindow("soul_equip_sort_window", {
			filterAttrs = self.filterAttrs
		})
	end
	UIEventListener.Get(self.btnSortSuit).onClick = function()
		xyd.openWindow("soul_equip_choose_suit_window", {
			curSelectSuitID = self.filterSuit
		})
	end

	for i = 1, 4 do
		UIEventListener.Get(self["btnFilterPos" .. i]).onClick = function()
			if self.filterIndex == i + 1 then
				self.filterIndex = 0
			else
				self.filterIndex = i + 1
				self.parent.curSelectEquipPos = self.filterIndex

				self.parent:updateTopGroup()
			end

			self:update()
		end
	end

	UIEventListener.Get(self.sortBtn).onClick = function()
		self:onClickSortBtn()
	end
end

function SoulEquipInfoContent22Con:layout()
	self.labelSortTab1.text = __("SOUL_EQUIP_TEXT12")
	self.labelSortTab2.text = __("SOUL_EQUIP_TEXT13")
	self.labelSortTab3.text = __("SOUL_EQUIP_TEXT14")
	self.labelSortTab4.text = __("SOUL_EQUIP_TEXT15")
	self.labelFilterPos1.text = __("SOUL_EQUIP_TEXT16")
	self.labelFilterPos2.text = __("SOUL_EQUIP_TEXT17")
	self.labelFilterPos3.text = __("SOUL_EQUIP_TEXT18")
	self.labelFilterPos4.text = __("SOUL_EQUIP_TEXT19")
	self.labelSortSuit.text = __("SOUL_EQUIP_TEXT09")
	self.labelSortAttr.text = __("SOUL_EQUIP_TEXT10")
	self.labelNone.text = __("SOUL_EQUIP_TEXT34")
	self.sortTab = CommonTabBar.new(self.sortPop, 4, function(index)
		if self.sortType ~= index then
			self:onClickSortBtn()
		end

		self.sortType = index

		self:update()
	end)

	self:update()
end

function SoulEquipInfoContent22Con:update()
	self:updatePosFilter()

	self.curSelectIcon = {}

	for i = 1, 4 do
		self.sortTab:setTabEnable(i, false)
	end

	local textArr = {
		[0] = __("SOUL_EQUIP_TEXT11"),
		__("SOUL_EQUIP_TEXT12"),
		__("SOUL_EQUIP_TEXT13"),
		__("SOUL_EQUIP_TEXT14"),
		(__("SOUL_EQUIP_TEXT15"))
	}

	self.labelSortBtn.text = textArr[self.sortType]

	for i = 1, 4 do
		self.sortTab:setTabEnable(i, true)
	end

	if #self.filterAttrs > 0 then
		self.labelSortAttr.text = xyd.tables.dBuffTable:getDesc(self.filterAttrs[1])
	else
		self.labelSortAttr.text = __("SOUL_EQUIP_TEXT10")
	end

	local data = {}
	local equips = xyd.models.slot:getSoulEquip2s()

	for id, equip in pairs(equips) do
		local pos = equip:getPos()
		local qlt = equip:getQlt()

		if self.filterIndex == 0 or pos == self.filterIndex then
			local flag = true

			if self.filterSuit > 0 and self.filterSuit ~= xyd.tables.soulEquip2Table:getGroup(equip:getTableID()) then
				flag = false
			end

			if #self.filterAttrs > 0 and not equip:containAttr(self.filterAttrs) then
				flag = false
			end

			if flag then
				table.insert(data, {
					equip = equip
				})
			end
		end
	end

	local sortFunc

	if self.sortType == 1 then
		function sortFunc(a, b)
			local aLevel = a.equip:getLevel()
			local bLevel = b.equip:getLevel()
			local aStar = a.equip:getStar()
			local bStar = b.equip:getStar()
			local aQlt = a.equip:getQlt()
			local bQlt = b.equip:getQlt()

			if aLevel ~= bLevel then
				return bLevel < aLevel
			elseif aStar ~= bStar then
				return bStar < aStar
			elseif aQlt ~= bQlt then
				return bQlt < aQlt
			else
				return a.equip:getSoulEquipID() < b.equip:getSoulEquipID()
			end
		end
	elseif self.sortType == 2 then
		function sortFunc(a, b)
			local aLevel = a.equip:getLevel()
			local bLevel = b.equip:getLevel()
			local aStar = a.equip:getStar()
			local bStar = b.equip:getStar()
			local aQlt = a.equip:getQlt()
			local bQlt = b.equip:getQlt()

			if aStar ~= bStar then
				return bStar < aStar
			elseif aLevel ~= bLevel then
				return bLevel < aLevel
			elseif aQlt ~= bQlt then
				return bQlt < aQlt
			else
				return a.equip:getSoulEquipID() < b.equip:getSoulEquipID()
			end
		end
	elseif self.sortType == 3 then
		function sortFunc(a, b)
			local aLevel = a.equip:getLevel()
			local bLevel = b.equip:getLevel()
			local aStar = a.equip:getStar()
			local bStar = b.equip:getStar()
			local aQlt = a.equip:getQlt()
			local bQlt = b.equip:getQlt()

			if aQlt ~= bQlt then
				return bQlt < aQlt
			elseif aLevel ~= bLevel then
				return bLevel < aLevel
			elseif aStar ~= bStar then
				return bStar < aStar
			else
				return a.equip:getSoulEquipID() < b.equip:getSoulEquipID()
			end
		end
	else
		function sortFunc(a, b)
			local aGetTime = a.equip:getGetTime()
			local bGetTime = b.equip:getGetTime()
			local aLevel = a.equip:getLevel()
			local bLevel = b.equip:getLevel()
			local aStar = a.equip:getStar()
			local bStar = b.equip:getStar()
			local aQlt = a.equip:getQlt()
			local bQlt = b.equip:getQlt()

			if aGetTime ~= bGetTime then
				return bGetTime < aGetTime
			elseif aLevel ~= bLevel then
				return bLevel < aLevel
			elseif aStar ~= bStar then
				return bStar < aStar
			elseif aQlt ~= bQlt then
				return bQlt < aQlt
			else
				return a.equip:getSoulEquipID() < b.equip:getSoulEquipID()
			end
		end
	end

	table.sort(data, sortFunc)
	self.noneGroup:SetActive(#data <= 0)
	self.equip2ScrollView:SetActive(#data > 0)
	self.multiWrap_:setInfos(data, {})
	self.equip2ScrollView:ResetPosition()
end

function SoulEquipInfoContent22Con:updatePosFilter()
	for i = 1, 4 do
		if i == self.filterIndex - 1 then
			xyd.setUISpriteAsync(self["btnFilterPos" .. i]:ComponentByName("", typeof(UISprite)), nil, "emotion_choose_btn")

			self["labelFilterPos" .. i].color = Color.New2(4278124287)
			self["labelFilterPos" .. i].effectColor = Color.New2(960513791)
		else
			xyd.setUISpriteAsync(self["btnFilterPos" .. i]:ComponentByName("", typeof(UISprite)), nil, "emotion_unchoose_btn")

			self["labelFilterPos" .. i].color = Color.New2(960513791)
			self["labelFilterPos" .. i].effectColor = Color.New2(4278124287)
		end
	end
end

function SoulEquipInfoContent22Con:onClickSortBtn()
	local sequence2 = self:getSequence()
	local sortPopTrans = self.sortPop.transform
	local p = self.sortPop:GetComponent(typeof(UIPanel))
	local sortPopY = -388

	local function getter()
		return Color.New(1, 1, 1, p.alpha)
	end

	local function setter(color)
		p.alpha = color.a
	end

	if self.sortPop.activeSelf == true then
		self.arrow.transform:SetLocalScale(1, 1, 1)
		sequence2:Insert(0, sortPopTrans:DOLocalMoveY(sortPopY + 17, 0.067))
		sequence2:Insert(0.067, DG.Tweening.DOTween.ToAlpha(getter, setter, 0.1, 0.1))
		sequence2:Insert(0.067, sortPopTrans:DOLocalMoveY(sortPopY - 58, 0.1))
		sequence2:Insert(0.167, sortPopTrans:DOLocalMoveY(sortPopY, 0))
		sequence2:AppendCallback(function()
			sequence2:Kill(false)

			sequence2 = nil

			self.sortPop:SetActive(false)
		end)
	else
		self.sortPop:SetActive(true)
		self.arrow.transform:SetLocalScale(1, -1, 1)
		sequence2:Insert(0, sortPopTrans:DOLocalMoveY(sortPopY - 58, 0))
		sequence2:Insert(0, DG.Tweening.DOTween.ToAlpha(getter, setter, 0.1, 0))
		sequence2:Insert(0, sortPopTrans:DOLocalMoveY(sortPopY + 17, 0.1))
		sequence2:Insert(0, DG.Tweening.DOTween.ToAlpha(getter, setter, 1, 0.1))
		sequence2:Insert(0.1, sortPopTrans:DOLocalMoveY(sortPopY, 0.2))
		sequence2:AppendCallback(function()
			sequence2:Kill(false)

			sequence2 = nil
		end)
	end
end

function SoulEquipInfoContent22Con:changefilterAttrs(filterAttrs)
	self.filterAttrs = filterAttrs

	self:update()
end

function SoulEquipInfoContent22Con:changeFilterSuit(filterSuit)
	self.filterSuit = filterSuit or 0

	self:update()
end

function SoulEquipInfoContent22Con:changeFilterPos(filterIndex)
	self.filterIndex = filterIndex or 0
end

function SoulEquipInfoContent22ConItem:ctor(go, parent)
	SoulEquipInfoContent22ConItem.super.ctor(self, go, parent)

	self.parent = parent
end

function SoulEquipInfoContent22ConItem:initUI()
	self.iconPos = self.go:NodeByName("iconPos").gameObject
end

function SoulEquipInfoContent22ConItem:update(wrapIndex, index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.go:SetActive(true)

	self.data = info

	self:updateInfo(wrapIndex, index)
end

function SoulEquipInfoContent22ConItem:updateInfo(wrapIndex, index)
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
		dragScrollView = self.parent.equip2ScrollView
	}

	if self.icon then
		self.icon:setInfo(params)
		self.icon:SetActive(true)
	else
		self.icon = xyd.getItemIcon(params, xyd.ItemIconType.ADVANCE_ICON)
	end

	local nowEquip

	if self.parent.parent.combinationEditMode then
		nowEquip = self.parent.parent.curCombinationModeData.equips[self.equip:getPos()]
	else
		nowEquip = self.parent.parent.equips[self.equip:getPos()]
	end

	if nowEquip and self.equip:getSoulEquipID() == nowEquip:getSoulEquipID() then
		if self.parent.curSelectIcon[self.equip:getPos()] then
			self.parent.curSelectIcon[self.equip:getPos()]:setChoose(false)
		end

		if self.equip:getIsLock() then
			self.icon:setChoose(false)
			self.icon:setLock(true)
		else
			self.icon:setLock(false)
			self.icon:setChoose(true)
		end

		self.parent.curSelectIcon[self.equip:getPos()] = self.icon
	elseif self.equip:getIsLock() then
		self.icon:setChoose(false)
		self.icon:setLock(true)
	else
		self.icon:setChoose(false)
		self.icon:setLock(false)
	end
end

function SoulEquipInfoContent22ConItem:onClickIcon()
	local nowEquip

	if self.parent.parent.combinationEditMode then
		self.nowEquip = self.parent.parent.curCombinationModeData.equips[self.equip:getPos()]
	else
		nowEquip = self.parent.parent.equips[self.equip:getPos()]
	end

	local midcallback

	if self.parent.parent.combinationEditMode then
		self.nowEquip = self.parent.parent.curCombinationModeData.equips[self.equip:getPos()]

		function midcallback()
			self.parent.parent.curCombinationModeData.equips[self.equip:getPos()] = self.equip

			self.parent.parent:updateTopGroup()

			if self.parent.curSelectIcon[self.equip:getPos()] then
				self.parent.curSelectIcon[self.equip:getPos()]:setChoose(false)
			end

			self.icon:setChoose(true)

			self.parent.curSelectIcon[self.equip:getPos()] = self.icon

			xyd.WindowManager.get():closeWindow("item_tips_window")
		end
	else
		self.nowEquip = self.parent.parent.equips[self.equip:getPos()]
		self.partner = self.parent.parent.partner

		function midcallback()
			local function sureCallback()
				self.partner:takeOnSoulEquip(self.equip:getSoulEquipID(), function()
					if self.parent.curSelectIcon[self.equip:getPos()] then
						self.parent.curSelectIcon[self.equip:getPos()]:setChoose(false)
					end

					self.icon:setChoose(true)

					self.parent.curSelectIcon[self.equip:getPos()] = self.icon

					local curSkillID = self.partner:getSoulEquipSkill()

					if curSkillID and curSkillID > 0 then
						xyd.alertTips(__("SOUL_EQUIP_TEXT87"))
					end

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

return SoulEquipInfoContent22Con
