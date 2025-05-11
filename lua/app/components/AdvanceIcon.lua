-- chunkname: @../../../Product/Bundles/Android/src/app/components/AdvanceIcon.lua

local ItemIcon = import("app.components.ItemIcon")
local HeroIcon = import("app.components.HeroIcon")
local PlayerIcon = import("app.components.PlayerIcon")
local AdvanceIcon = class("AdvanceIcon", import(".BaseComponent"))

function AdvanceIcon:ctor(params)
	local uiRoot = params.uiRoot

	if not uiRoot then
		error("no uiRoot")
	end

	AdvanceIcon.super.ctor(self, uiRoot)

	self.params = params

	local itemID = params.itemID or params.item_id or params.table_id or params.tableID
	local avatarID = params.avatar_id or params.avatarID
	local avatarFrameID = params.avatar_frame_id or params.avatarFrameID

	if not itemID and not avatarID and not avatarFrameID then
		return
	end

	if itemID then
		local type = xyd.tables.itemTable:getType(itemID)

		if type == xyd.ItemType.HERO_DEBRIS or type == xyd.ItemType.HERO or type == xyd.ItemType.HERO_RANDOM_DEBRIS or type == xyd.ItemType.SKIN then
			self.curIcon = self:generateHeroIcon(params)
		else
			self.curIcon = self:generateItemIcon(params)
		end
	elseif avatarID or avatarFrameID then
		self.curIcon = self:generatePlayerIcon(params)
	end

	self:autoAdjustWidget()
end

function AdvanceIcon:getPrefabPath(params)
	return "Prefabs/Components/advance_icon"
end

function AdvanceIcon:generateItemIcon(params)
	if not self.itemIcon then
		local itemID = params.itemID or params.item_id or params.table_id or params.tableID

		if not params.itemID and params.item_id then
			params.itemID = params.item_id
		end

		local num = params.num or params.item_num

		if not params.num and params.item_num then
			params.num = params.item_num
		end

		self.itemIcon = ItemIcon.new(self.go, params.offsetDepth)

		self.itemIcon:setInfo(params)
	end

	return self.itemIcon
end

function AdvanceIcon:generateHeroIcon(params)
	if not self.heroIcon then
		local itemID = params.itemID or params.item_id or params.table_id or params.tableID

		if not params.itemID and params.item_id then
			params.itemID = params.item_id
		end

		local num = params.num or params.item_num

		if not params.num and params.item_num then
			params.num = params.item_num
		end

		self.heroIcon = HeroIcon.new(self.go, params.offsetDepth)

		self.heroIcon:setInfo(params)
	end

	return self.heroIcon
end

function AdvanceIcon:generatePlayerIcon(params)
	if not self.playerIcon then
		local renderPanel = params.renderPanel
		local PlayerIcon = import("app.components.PlayerIcon")

		if not params.noClick then
			params.noClick = false
		end

		params.avatar_id = params.avatar_id or params.avatarID
		params.avatar_frame_id = params.avatar_frame_id or params.avatarFrameID or params.itemID
		self.playerIcon = PlayerIcon.new(self.go, renderPanel)

		self.playerIcon:setInfo(params)
	end

	return self.playerIcon
end

function AdvanceIcon:setInfo(params)
	local itemID = params.itemID or params.item_id or params.table_id or params.tableID
	local avatarID = params.avatar_id or params.avatarID
	local avatarFrameID = params.avatar_frame_id or params.avatarFrameID

	if not itemID and not avatarID and not avatarFrameID then
		return
	end

	if itemID then
		local type = xyd.tables.itemTable:getType(itemID)

		if type == xyd.ItemType.HERO_DEBRIS or type == xyd.ItemType.HERO or type == xyd.ItemType.HERO_RANDOM_DEBRIS or type == xyd.ItemType.SKIN then
			if not self.heroIcon then
				self.curIcon = self:generateHeroIcon(params)
			else
				self.curIcon = self.heroIcon

				self.curIcon:setInfo(params)
			end

			if self.itemIcon then
				self.itemIcon:SetActive(false)
			end

			if self.playerIcon then
				self.playerIcon:SetActive(false)
			end

			self.heroIcon:SetActive(true)
		else
			if not self.itemIcon then
				self.curIcon = self:generateItemIcon(params)
			else
				self.curIcon = self.itemIcon

				self.curIcon:setInfo(params)
			end

			if self.heroIcon then
				self.heroIcon:SetActive(false)
			end

			if self.playerIcon then
				self.playerIcon:SetActive(false)
			end

			self.itemIcon:SetActive(true)
		end
	elseif avatarID or avatarFrameID then
		params.avatar_id = avatarID
		params.avatar_frame_id = avatarFrameID

		if not self.playerIcon then
			self.curIcon = self:generatePlayerIcon(params)
		else
			self.curIcon = self.playerIcon

			self.curIcon:setInfo(params)
		end

		if self.heroIcon then
			self.heroIcon:SetActive(false)
		end

		if self.itemIcon then
			self.itemIcon:SetActive(false)
		end

		self.playerIcon:SetActive(true)
	end

	self:autoAdjustWidget()
end

function AdvanceIcon:getCurIcon()
	return self.curIcon
end

function AdvanceIcon:setLock(flag, w, h)
	if self.curIcon == self.playerIcon then
		self.curIcon:setLocked(flag, w, h)
	else
		self.curIcon:setLock(flag, w, h)
	end
end

function AdvanceIcon:getChoose(flag)
	self.curIcon:getChoose(flag)
end

function AdvanceIcon:setChoose(flag)
	self.curIcon:setChoose(flag)
end

function AdvanceIcon:setBackground(flag)
	self.curIcon:setBackground(flag)
end

function AdvanceIcon:setLabelNumColor(flag)
	self.curIcon:setLabelNumColor(flag)
end

function AdvanceIcon:setMask(flag)
	if self.curIcon == self.playerIcon then
		return
	end

	self.curIcon:setMask(flag)
end

function AdvanceIcon:setEffectState(flag)
	if self.curIcon == self.playerIcon then
		return
	end

	self.curIcon:setEffectState(flag)
end

function AdvanceIcon:setEffect(flag, effectName, params)
	if self.curIcon == self.playerIcon then
		return
	end

	self.curIcon:setEffect(flag, effectName, params)
end

function AdvanceIcon:setCallBack(fun)
	if self.curIcon == self.playerIcon then
		return
	end

	self.curIcon:setCallBack(fun)
end

function AdvanceIcon:setBackEffect(flag, effectName, playName, params)
	if self.curIcon == self.playerIcon then
		return
	end

	self.curIcon:setBackEffect(flag, effectName, playName, params)
end

function AdvanceIcon:setNoClick(flag)
	if self.curIcon == self.playerIcon then
		return
	end

	self.curIcon:setNoClick(flag)
end

function AdvanceIcon:showBorderBg(flag)
	if self.curIcon == self.playerIcon then
		return
	end

	self.curIcon:showBorderBg(flag)
end

function AdvanceIcon:getIconRoot()
	return self.curIcon:getIconRoot()
end

function AdvanceIcon:getRoot()
	return self.go
end

function AdvanceIcon:setQuality(qlt)
	if self.curIcon.setQuality then
		self.curIcon:setQuality(qlt)
	end
end

function AdvanceIcon:setScale(scale)
	self.curIcon:setScale(scale)
	self:autoAdjustWidget()
end

function AdvanceIcon:autoAdjustWidget()
	local curIconWidget = self.curIcon:getIconRoot():GetComponent(typeof(UIWidget))
	local selfWidget = self.go:GetComponent(typeof(UIWidget))
	local scale = self.curIcon:getIconRoot().transform.localScale

	selfWidget.height = curIconWidget.height * scale.y
	selfWidget.width = curIconWidget.width * scale.x
end

function AdvanceIcon:setItemIconDepth(depth)
	self.curIcon:setItemIconDepth(depth)
end

function AdvanceIcon:setLockSource(source, source2)
	if self.curIcon.setLockSource then
		self.curIcon:setLockSource(source, source2)
	end
end

function AdvanceIcon:setMaskSource(source)
	if self.curIcon.setMaskSource then
		self.curIcon:setMaskSource(source)
	end
end

function AdvanceIcon:setSelected(flag)
	if self.curIcon.setSelected then
		self.curIcon:setSelected(flag)
	end
end

function AdvanceIcon:showQualityBg(flag)
	if self.curIcon.showQualityBg then
		self.curIcon:showQualityBg(flag)
	end
end

return AdvanceIcon
