-- chunkname: @../../../Product/Bundles/Android/src/app/components/SoulEquipInfoContent3Con.lua

local SoulEquipInfoContent3Con = class("SoulEquipInfoContent3Con", import("app.components.CopyComponent"))
local BaseComponent = import("app.components.BaseComponent")
local SoulEquipInfoContent3ConItem = class("SoulEquipInfoContent3ConItem", import("app.common.ui.FixedWrapContentItem"))
local FixedWrapContent = import("app.common.ui.FixedWrapContent")

function SoulEquipInfoContent3Con:ctor(goItem, parent)
	self.parent = parent
	self.groupAllAttrLables = {}

	SoulEquipInfoContent3Con.super.ctor(self, goItem)
end

function SoulEquipInfoContent3Con:initUI()
	self:getUIComponent()
	SoulEquipInfoContent3Con.super.initUI(self)
	self:register()
	self:layout()
end

function SoulEquipInfoContent3Con:getUIComponent()
	self.content3 = self.go
	self.bg2 = self.content3:ComponentByName("bg2", typeof(UISprite))
	self.combinationItem = self.content3:NodeByName("combinationItem").gameObject
	self.combinationScroller = self.content3:NodeByName("combinationScroller").gameObject
	self.combinationScrollView = self.content3:ComponentByName("combinationScroller", typeof(UIScrollView))
	self.itemGroup = self.combinationScroller:NodeByName("itemGroup").gameObject
	self.drag = self.content3:NodeByName("drag").gameObject
	self.btnAddCombination = self.content3:NodeByName("btnAddCombination").gameObject
	self.labelAddCombination = self.btnAddCombination:ComponentByName("label", typeof(UILabel))
	self.curCombinationItem = self.content3:NodeByName("curCombinationItem").gameObject
	self.equip1IconPos = self.curCombinationItem:NodeByName("equip1IconPos").gameObject
	self.equip2StateGroup = self.curCombinationItem:ComponentByName("equip2StateGroup", typeof(UISprite))
	self.pos2 = self.equip2StateGroup:ComponentByName("pos1", typeof(UISprite))
	self.pos3 = self.equip2StateGroup:ComponentByName("pos2", typeof(UISprite))
	self.pos4 = self.equip2StateGroup:ComponentByName("pos3", typeof(UISprite))
	self.pos5 = self.equip2StateGroup:ComponentByName("pos4", typeof(UISprite))
	self.iconSuit = self.equip2StateGroup:ComponentByName("iconSuit", typeof(UISprite))
	self.labelName = self.curCombinationItem:ComponentByName("labelName", typeof(UILabel))
	self.img = self.curCombinationItem:ComponentByName("img", typeof(UISprite))
	self.imgSelect = self.curCombinationItem:ComponentByName("imgSelect", typeof(UISprite))

	local wrapContent = self.combinationScroller:ComponentByName("itemGroup", typeof(UIWrapContent))

	self.wrapContent = FixedWrapContent.new(self.combinationScrollView, wrapContent, self.combinationItem.gameObject, SoulEquipInfoContent3ConItem, self)
end

function SoulEquipInfoContent3Con:register()
	UIEventListener.Get(self.btnAddCombination.gameObject).onClick = function()
		if xyd.models.slot:getSoulEquipCombinationNum() >= xyd.models.slot:getSoulEquipCombinationLimitNum() then
			xyd.alertTips(__("SOUL_EQUIP_TEXT91"))
		else
			local list = xyd.models.slot:getAllSoulEquipCombination()

			for i = 1, xyd.models.slot:getSoulEquipCombinationLimitNum() do
				if not list[i] then
					self.parent:enterEditombinationMode({
						isNew = true,
						equips = {},
						name = __("SOUL_EQUIP_TEXT83", i),
						pos = i
					})

					return
				end
			end
		end
	end
	UIEventListener.Get(self.curCombinationItem.gameObject).onClick = function()
		self:chooseCombination()
		self:updateCurItem()

		if self.curSelectItem then
			self.curSelectItem:checkChoose()
		end

		self.curSelectItem = nil

		if self.curSelectCombinationID then
			self.imgSelect:SetActive(false)
		else
			self.imgSelect:SetActive(true)
		end
	end
end

function SoulEquipInfoContent3Con:layout()
	self.labelAddCombination.text = ""

	self:update()
end

function SoulEquipInfoContent3Con:update()
	self:updateCurItem()

	self.curSelectCombinationID = self.parent.curSelectCombinationID
	self.labelAddCombination.text = xyd.models.slot:getSoulEquipCombinationNum() .. "/" .. xyd.models.slot:getSoulEquipCombinationLimitNum()

	if self.curSelectCombinationID then
		self.imgSelect:SetActive(false)
	else
		self.imgSelect:SetActive(true)
	end

	local list = xyd.models.slot:getAllSoulEquipCombination()
	local data = {}

	for id, combination in pairs(list) do
		table.insert(data, {
			combination = combination
		})
	end

	self.wrapContent:setInfos(data, {})
	self.combinationScrollView:ResetPosition()
end

function SoulEquipInfoContent3Con:updateCurItem()
	self.labelName.text = __("SOUL_EQUIP_TEXT24")

	local params = {
		scale = 0.7037037037037037,
		uiRoot = self.equip1IconPos
	}

	if self.parent.partner:getSoulEquips()[1] and self.parent.partner:getSoulEquips()[1] > 0 then
		local equipID = self.parent.partner:getSoulEquips()[1]
		local equip = xyd.models.slot:getSoulEquip(equipID)

		if equip then
			params.itemID = equip:getTableID()
			params.soulEquipInfo = equip:getSoulEquipInfo()
		end

		if self.icon then
			self.icon:setInfo(params)
			self.icon:SetActive(true)
		else
			self.icon = xyd.getItemIcon(params, xyd.ItemIconType.ADVANCE_ICON)
		end
	elseif self.icon then
		self.icon:SetActive(false)
	end

	for i = 2, 5 do
		local equipID = self.parent.partner:getSoulEquips()[i]
		local equip

		if equipID then
			equip = xyd.models.slot:getSoulEquip(equipID)
		end

		if equipID and equip then
			self["pos" .. i]:SetActive(true)
		else
			self["pos" .. i]:SetActive(false)
		end
	end

	local curSkillID
	local equips = self.parent.partner:getSoulEquips()

	for i = 2, 5 do
		if equips[i] then
			local equip = xyd.models.slot:getSoulEquip(equips[i])

			if equip then
				local equipTableID = equip:getTableID()
				local skillID = xyd.tables.soulEquip2Table:getGroup(equipTableID)

				if curSkillID and skillID > 0 and curSkillID ~= skillID then
					curSkillID = nil

					break
				elseif not skillID or skillID <= 0 then
					curSkillID = nil

					break
				else
					curSkillID = skillID
				end
			else
				curSkillID = nil

				break
			end
		else
			curSkillID = nil

			break
		end
	end

	if curSkillID then
		self.iconSuit:SetActive(true)
		xyd.setUISpriteAsync(self.iconSuit, nil, xyd.tables.soulEquip2GroupTable:getIcon(curSkillID))
	else
		self.iconSuit:SetActive(false)
	end
end

function SoulEquipInfoContent3Con:chooseCombination(combinationID)
	self.parent:chooseCombination(combinationID)

	self.curSelectCombinationID = combinationID
end

function SoulEquipInfoContent3ConItem:ctor(go, parent)
	SoulEquipInfoContent3ConItem.super.ctor(self, go, parent)

	self.parent = parent
end

function SoulEquipInfoContent3ConItem:initUI()
	self.combinationItem = self.go
	self.equip1IconPos = self.combinationItem:NodeByName("equip1IconPos").gameObject
	self.equip2StateGroup = self.combinationItem:ComponentByName("equip2StateGroup", typeof(UISprite))
	self.bg = self.equip2StateGroup:ComponentByName("bg", typeof(UISprite))
	self.pos2 = self.equip2StateGroup:ComponentByName("pos1", typeof(UISprite))
	self.pos3 = self.equip2StateGroup:ComponentByName("pos2", typeof(UISprite))
	self.pos4 = self.equip2StateGroup:ComponentByName("pos3", typeof(UISprite))
	self.pos5 = self.equip2StateGroup:ComponentByName("pos4", typeof(UISprite))
	self.iconSuit = self.equip2StateGroup:ComponentByName("iconSuit", typeof(UISprite))
	self.labelName = self.combinationItem:ComponentByName("labelName", typeof(UILabel))
	self.btnExchange = self.combinationItem:NodeByName("btnExchange").gameObject
	self.labelExchange = self.btnExchange:ComponentByName("label", typeof(UILabel))
	self.btnDelete = self.combinationItem:NodeByName("btnDelete").gameObject
	self.imgSelect = self.combinationItem:ComponentByName("imgSelect", typeof(UISprite))
	UIEventListener.Get(self.btnExchange.gameObject).onClick = function()
		local function callback()
			local partner = self.parent.parent.partner

			partner:takeOnSoulEquips(self.data.combination.equipIDs, function()
				self.parent:chooseCombination()

				if self.parent.curSelectItem then
					self.parent.curSelectItem:checkChoose()
				end

				self.parent.curSelectItem = nil

				if self.parent.curSelectCombinationID then
					self.parent.imgSelect:SetActive(false)
				else
					self.parent.imgSelect:SetActive(true)
				end

				local curSkillID = partner:getSoulEquipSkill()

				if curSkillID and curSkillID > 0 then
					xyd.alertTips(__("SOUL_EQUIP_TEXT87"))
				end

				self.parent.parent:initData()
				self.parent.parent:updateTopGroup()
				self.parent:update()
			end)
		end

		local somebodyEquiped = false

		for i = 1, 5 do
			local equipID = self.data.combination.equipIDs[i]

			if equipID then
				local equip = xyd.models.slot:getSoulEquip(equipID)

				if equip and equip:getOwnerPartnerID() and equip:getOwnerPartnerID() > 0 and equip:getOwnerPartnerID() ~= self.parent.parent.partner:getPartnerID() then
					somebodyEquiped = true
				end
			end
		end

		if somebodyEquiped then
			local timeStamp = xyd.db.misc:getValue("soul_equip_exchange_equip_tip")

			if tonumber(timeStamp) and xyd.isSameDay(tonumber(timeStamp), xyd.getServerTime()) then
				callback()
			else
				xyd.openWindow("soul_equip_comfirm_exchange_window", {
					equipIDs = self.data.combination.equipIDs,
					callback = callback
				})
			end
		else
			callback()
		end
	end
	UIEventListener.Get(self.go.gameObject).onClick = function()
		self.parent:chooseCombination(self.data.combination.id)

		if self.parent.curSelectItem then
			self.parent.curSelectItem:checkChoose()
		end

		self:checkChoose()

		self.parent.curSelectItem = self
	end
	UIEventListener.Get(self.btnDelete.gameObject).onClick = function()
		xyd.alertYesNo(__("SOUL_EQUIP_TEXT35", self.data.combination.name), function(yes_no)
			if yes_no then
				xyd.models.slot:setSoulEquipCombination(self.data, 2, function()
					self.parent:chooseCombination()

					if self.parent.curSelectItem then
						self.parent.curSelectItem:checkChoose()
					end

					self.parent.curSelectItem = nil

					self.parent:update()
				end)
			end
		end)
	end
	self.labelExchange.text = __("SOUL_EQUIP_TEXT27")
end

function SoulEquipInfoContent3ConItem:update(index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.data = info

	self.go:SetActive(true)
	self:updateInfo(index)
end

function SoulEquipInfoContent3ConItem:updateInfo(index)
	self.labelName.text = self.data.combination.name

	local params = {
		scale = 0.7037037037037037,
		uiRoot = self.equip1IconPos
	}

	if self.data.combination.equipIDs[1] and self.data.combination.equipIDs[1] > 0 then
		local equipID = self.data.combination.equipIDs[1]
		local equip = xyd.models.slot:getSoulEquip(equipID)

		if equip then
			params.itemID = equip:getTableID()
			params.soulEquipInfo = equip:getSoulEquipInfo()
		end

		if self.icon then
			self.icon:setInfo(params)
			self.icon:SetActive(true)
		else
			self.icon = xyd.getItemIcon(params, xyd.ItemIconType.ADVANCE_ICON)
		end
	elseif self.icon then
		self.icon:SetActive(false)
	end

	for i = 2, 5 do
		local equipID = self.data.combination.equipIDs[i]
		local equip

		if equipID then
			equip = xyd.models.slot:getSoulEquip(equipID)
		end

		if equipID and equip then
			self["pos" .. i]:SetActive(true)
		else
			self["pos" .. i]:SetActive(false)
		end
	end

	local curSkillID
	local equips = self.data.combination.equipIDs

	for i = 2, 5 do
		if equips[i] then
			local equip = xyd.models.slot:getSoulEquip(equips[i])

			if equip then
				local equipTableID = equip:getTableID()
				local skillID = xyd.tables.soulEquip2Table:getGroup(equipTableID)

				if curSkillID and skillID > 0 and curSkillID ~= skillID then
					curSkillID = nil

					break
				elseif not skillID or skillID <= 0 then
					curSkillID = nil

					break
				else
					curSkillID = skillID
				end
			else
				curSkillID = nil

				break
			end
		else
			curSkillID = nil

			break
		end
	end

	if curSkillID then
		self.iconSuit:SetActive(true)
		xyd.setUISpriteAsync(self.iconSuit, nil, xyd.tables.soulEquip2GroupTable:getIcon(curSkillID))
	else
		self.iconSuit:SetActive(false)
	end

	self:checkChoose()
end

function SoulEquipInfoContent3ConItem:checkChoose()
	if self.parent.curSelectCombinationID ~= self.data.combination.id then
		self.imgSelect:SetActive(false)
	else
		self.imgSelect:SetActive(true)
		self.parent.imgSelect:SetActive(false)
	end
end

return SoulEquipInfoContent3Con
