-- chunkname: @../../../Product/Bundles/Android/src/app/components/EntranceTestPartnerWindowUpCon.lua

local EntranceTestPartnerWindowUpCon = class("EntranceTestPartnerWindowUpCon", import(".BaseComponent"))
local HeroIcon = import("app.components.HeroIcon")

function EntranceTestPartnerWindowUpCon:ctor(parentGo)
	EntranceTestPartnerWindowUpCon.super.ctor(self, parentGo)
end

function EntranceTestPartnerWindowUpCon:getPrefabPath()
	return "Prefabs/Components/entrance_test_partner_window_up_con"
end

function EntranceTestPartnerWindowUpCon:initUI()
	self:getUIComponent()
	EntranceTestPartnerWindowUpCon.super.initUI(self)
end

function EntranceTestPartnerWindowUpCon:getGo()
	return self.go.gameObject
end

function EntranceTestPartnerWindowUpCon:getUIComponent()
	self.groupAction = self.go:NodeByName("groupAction").gameObject
	self.heroCon = self.groupAction:NodeByName("heroCon").gameObject
	self.partnerNameNew = self.groupAction:ComponentByName("partnerNameNew", typeof(UILabel))
	self.powerCon = self.groupAction:NodeByName("powerCon").gameObject
	self.powerIcon = self.powerCon:ComponentByName("powerIcon", typeof(UISprite))
	self.powerLabel = self.powerCon:ComponentByName("powerLabel", typeof(UILabel))
	self.effectCon = self.groupAction:ComponentByName("effectCon", typeof(UITexture))
	self.effectCon_UIWidget = self.groupAction:ComponentByName("effectCon", typeof(UIWidget))
end

function EntranceTestPartnerWindowUpCon:setInfo(params)
	self.tableID = params.tableID
	self.info = params.info

	self:setModel()
	self:setAvatar()
end

function EntranceTestPartnerWindowUpCon:setPowerLabel(text)
	self.powerLabel.text = text
end

function EntranceTestPartnerWindowUpCon:setPowerName(text)
	self.partnerNameNew.text = text
end

function EntranceTestPartnerWindowUpCon:setAvatar()
	local info = self.info

	info.noClick = true

	if not self.icon then
		local icon = HeroIcon.new(self.heroCon)

		self.icon = icon

		self.icon:SetLocalScale(1.1388888888888888, 1.1388888888888888, 0)
	end

	self.icon:setInfo(info)
end

function EntranceTestPartnerWindowUpCon:setModel()
	local modelID = xyd.tables.partnerTable:getModelID(self.tableID)
	local skinId = self.info.equipments[7]

	if skinId and skinId > 0 then
		local skinModelId = xyd.tables.equipTable:getSkinModel(skinId)

		if skinModelId and skinModelId > 0 then
			modelID = skinModelId
		end
	end

	local name = xyd.tables.modelTable:getModelName(modelID)
	local scale = xyd.tables.modelTable:getScale(modelID)

	if self.model then
		self.model:destroy()
	end

	local model = xyd.Spine.new(self.effectCon.gameObject)

	self.model = model

	self.model:setInfo(name, function()
		if self.effectCon then
			self.model:SetLocalPosition(0, 0, 0)
			self.model:SetLocalScale(scale, scale, 1)
			self.model:play("idle", 0)
		end
	end)
end

function EntranceTestPartnerWindowUpCon:setEffectConDepth(depth)
	self.effectCon_UIWidget.depth = depth
end

return EntranceTestPartnerWindowUpCon
