-- chunkname: @../../../Product/Bundles/Android/src/app/components/ActivityInvitationSeniorItemItem.lua

local ActivityInvitationSeniorItemItem = class("ActivityInvitationSeniorItemItem", import("app.components.BaseComponent"))
local ItemItem = class("ItemItem", import("app.components.BaseComponent"))

function ActivityInvitationSeniorItemItem:ctor(go, parent, isReszie, isMy)
	self.go = go
	self.parent = parent
	self.isReszie = isReszie
	self.isMy = isMy
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR)

	self:initUI()
end

function ActivityInvitationSeniorItemItem:getUIComponent()
	self.targetCon = self.go:NodeByName("targetCon").gameObject
	self.targetConBg = self.targetCon:ComponentByName("targetConBg", typeof(UISprite))
	self.targetConName = self.targetCon:ComponentByName("targetConName", typeof(UILabel))
	self.targetDescIcon = self.targetCon:ComponentByName("targetDescIcon", typeof(UISprite))
	self.targetDesc = self.targetCon:ComponentByName("targetDesc", typeof(UILabel))
	self.awardCon = self.go:NodeByName("awardCon").gameObject
	self.awardConBg = self.awardCon:ComponentByName("awardConBg", typeof(UISprite))
	self.awardConName = self.awardCon:ComponentByName("awardConName", typeof(UILabel))
	self.awardItemsCon = self.awardCon:NodeByName("awardItemsCon").gameObject
	self.awardItemsConUILayout = self.awardCon:ComponentByName("awardItemsCon", typeof(UILayout))
	self.awardItem = self.awardCon:NodeByName("awardItem").gameObject
end

function ActivityInvitationSeniorItemItem:initUI()
	self:getUIComponent()

	if self.isReszie then
		self:reSize()
	end

	self.targetConName.text = __("INVITATION_TEXT12")
	self.awardConName.text = __("INVITATION_TEXT14")
end

function ActivityInvitationSeniorItemItem:reSize()
	local stageHeight = xyd.Global.getRealHeight()
	local num = (stageHeight - 1280) / (xyd.Global.getMaxHeight() - 1280)

	if stageHeight > xyd.Global.getMaxHeight() then
		num = 1
	end

	self.scale_num_ = 1 - num
	self.scale_num_contrary = 1 - self.scale_num_

	self:resizePosY(self.awardCon.gameObject, -25.5, -50)
end

function ActivityInvitationSeniorItemItem:resizePosY(obj, y_short, y_phoneX)
	obj:Y(y_short + (y_phoneX - y_short) * self.scale_num_contrary)
end

function ActivityInvitationSeniorItemItem:update(id)
	local param = xyd.tables.activityInvitationAllAwardTable:getParameter(id)

	self.targetDesc.text = __("INVITATION_TEXT13", param)

	if not self.awardArr then
		self.awardArr = {}
	end

	local invitee_awarded = self.activityData:getInviteeAwarded()
	local awardItems = xyd.tables.activityInvitationAllAwardTable:getAwardsNew(id)

	for i in pairs(awardItems) do
		local param = {
			isSenpai = false,
			award = awardItems[i]
		}

		if not self.awardArr[i] then
			local tmp = NGUITools.AddChild(self.awardItemsCon.gameObject, self.awardItem.gameObject)

			self.awardArr[i] = ItemItem.new(tmp, self)
		end

		self.awardArr[i]:update(param)
		self.awardArr[i]:SetActive(true)
		self.awardArr[i]:setChoose(false)

		if self.isMy and invitee_awarded[id] and invitee_awarded[id] == 1 then
			self.awardArr[i]:setChoose(true)
		end
	end

	local awardItemsSenpai = xyd.tables.activityInvitationAllAwardTable:getAwardsSenpai(id)

	for i in pairs(awardItemsSenpai) do
		local param = {
			isSenpai = true,
			award = awardItemsSenpai[i]
		}

		if not self.awardArr[i + #awardItems] then
			local tmp = NGUITools.AddChild(self.awardItemsCon.gameObject, self.awardItem.gameObject)

			self.awardArr[i + #awardItems] = ItemItem.new(tmp, self)
		end

		self.awardArr[i + #awardItems]:update(param)
		self.awardArr[i + #awardItems]:SetActive(true)
		self.awardArr[i + #awardItems]:setChoose(false)

		if self.isMy and invitee_awarded[id] and invitee_awarded[id] == 1 then
			self.awardArr[i + #awardItems]:setChoose(true)
		end
	end

	for i = #awardItems + #awardItemsSenpai + 1, #self.awardArr do
		self.awardArr[i]:SetActive(false)
	end

	self.awardItemsConUILayout:Reposition()
end

function ActivityInvitationSeniorItemItem:getGameObject()
	return self.go
end

function ItemItem:ctor(go, parent)
	self.go = go
	self.parent = parent

	self:initUI()
end

function ItemItem:getUIComponent()
	self.award = self.go:NodeByName("award").gameObject
	self.icon = self.go:ComponentByName("icon", typeof(UISprite))
end

function ItemItem:initUI()
	self:getUIComponent()
	xyd.setUISpriteAsync(self.icon, nil, "invitation_senior_text_bg_qb_" .. xyd.Global.lang, nil, nil, true)
end

function ItemItem:update(info)
	local award = info.award
	local params = {
		notPlaySaoguang = true,
		scale = 0.9074074074074074,
		uiRoot = self.award.gameObject,
		itemID = award[1],
		num = award[2]
	}

	if not self.item then
		self.item = xyd.getItemIcon(params, xyd.ItemIconType.ADVANCE_ICON)
	else
		self.item:setInfo(params)
	end

	if info.isSenpai then
		self.icon:SetActive(true)
	else
		self.icon:SetActive(false)
	end
end

function ItemItem:getGameObject()
	return self.go
end

function ItemItem:setChoose(state)
	if self.item then
		self.item:setChoose(state)
	end
end

return ActivityInvitationSeniorItemItem
