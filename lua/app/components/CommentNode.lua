-- chunkname: @../../../Product/Bundles/Android/src/app/components/CommentNode.lua

local PlayerIcon = import("app.components.PlayerIcon")
local cjson = require("cjson")
local BASIC_HEIGHT = 135
local MAX_WIDTH = 342
local CommentNode = class("CommentNode")
local ITEM_GAP = 16
local PartnerComment = xyd.models.partnerComment
local ReportBtn = import("app.components.ReportBtn")
local TYPE = {
	HOT = 1,
	COMMON = 2
}
local PartnerStationCommentItem = class("PartnerStationCommentItem", import(".BaseComponent"))

function PartnerStationCommentItem:ctor(parent, scrollParent)
	self.scrollParent_ = scrollParent

	PartnerStationCommentItem.super.ctor(self, parent)

	self.commentModel = PartnerComment
end

function PartnerStationCommentItem:getPrefabPath()
	return "Prefabs/Components/partner_station_comment_item"
end

function PartnerStationCommentItem:initUI()
	local go = self.go

	self.imgTop = go:ComponentByName("imgTop", typeof(UISprite))
	self.gMain_ = go:NodeByName("gMain_").gameObject
	self.touchLayer_ = self.gMain_:NodeByName("touchLayer_").gameObject
	self.avatarImg = self.gMain_:ComponentByName("avatarImg", typeof(UISprite))
	self.likeImg = self.gMain_:ComponentByName("likeImg", typeof(UISprite))
	self.serverId = self.gMain_:ComponentByName("serverId", typeof(UILabel))
	self.nameLabel = self.gMain_:ComponentByName("nameLabel", typeof(UILabel))
	self.timeLabel = self.gMain_:ComponentByName("timeLabel", typeof(UILabel))
	self.likeTouchGroup = self.gMain_:NodeByName("likeTouchGroup").gameObject
	self.likeCountLabel = self.likeTouchGroup:ComponentByName("likeCountLabel", typeof(UILabel))
	self.contentLabel = self.gMain_:ComponentByName("contentLabel", typeof(UILabel))
	self.btnTrans = self.gMain_:NodeByName("groupTrans/btnTrans").gameObject
	self.moreGroup_ = self.gMain_:NodeByName("moreGroup_").gameObject
	self.reportPos = self.gMain_:NodeByName("reportPos").gameObject

	xyd.setDragScrollView(self.touchLayer_, self.scrollParent_:getScrollView())
end

function PartnerStationCommentItem:setInfo(params)
	self.params = params
	self.params.chapter_id = self.params.table_id
	self.comment_id = self.params.comment_id
	self.server_id = self.params.server_id
	self.player_name = self.params.player_name
	self.created_time = self.params.created_time
	self.msg = self.params.msg
	self.like = self.params.like
	self.avatar_id = self.params.avatar_id

	self:updateLayout()
	self:updateMainReport()

	self.gMain_:GetComponent(typeof(UIWidget)).height = self.contentLabel.height + 170
	self.go:GetComponent(typeof(UIWidget)).height = self.gMain_:GetComponent(typeof(UIWidget)).height

	if self.params.type == 2 and self.params.index == 1 then
		self.imgTop:SetActive(true)
		xyd.setUISpriteAsync(self.imgTop, nil, "comic_comment_normal_bg")
	else
		self.imgTop:SetActive(false)
	end

	if self.reportBtn and self.reportBtn.timeData_ ~= self.params.time then
		self.reportBtn:SetActive(false)
	elseif self.reportBtn then
		self.reportBtn:SetActive(true)
	end
end

function PartnerStationCommentItem:getHeight()
	return self.go:GetComponent(typeof(UIWidget)).height
end

function PartnerStationCommentItem:onRegister()
	PartnerStationCommentItem.super.onRegister(self)

	UIEventListener.Get(self.likeTouchGroup).onClick = function()
		local likeType = self.commentModel:isLikeComment(self.params.table_id, self.comment_id)

		if likeType == 0 then
			self.commentModel:reqLikeComment(self.params.table_id, self.comment_id)
		end
	end
	UIEventListener.Get(self.btnTrans).onClick = handler(self, self.onTranslate)
	UIEventListener.Get(self.moreGroup_).onClick = handler(self, self.createReportBtn)
	UIEventListener.Get(self.touchLayer_).onClick = function()
		self:updateMainReport()
	end

	self:registerEvent(xyd.event.LIKE_PARTNER_COMMENT, handler(self, self.onLikeComment))
end

function PartnerStationCommentItem:onLikeComment(event)
	local data = event.data

	if data.table_id ~= self.params.table_id or data.comment_id ~= self.params.comment_id then
		return
	end

	local likeType = self.commentModel:isLikeComment(self.params.table_id, self.comment_id)

	xyd.setUISpriteAsync(self.likeImg, nil, "comic_comment_like" .. likeType)

	self.like = self.like + 1
	self.likeCountLabel.text = tostring(tonumber(self.like))
end

function PartnerStationCommentItem:createReportBtn()
	if self.reportBtn then
		self:updateMainReport()

		return
	end

	self.params.report_type = xyd.Report_Type.SLOT_COMMENT

	local params = {
		open_type = 2,
		data = self.params,
		time = self.params.time
	}

	self.reportBtn = ReportBtn.new(self.moreGroup_.gameObject, params)

	self.reportBtn:SetActive(true)
	self.reportBtn:setPosition(nil, Vector3(-20, 40, 0))
	self:updateMainReport(true)
end

function PartnerStationCommentItem:updateMainReport(update)
	local wnd = xyd.WindowManager:get():getWindow("partner_data_station_window")

	if wnd then
		if update then
			wnd:updateReportItem(self, self.params.time)
		else
			wnd:updateReportItem()
		end
	end
end

function PartnerStationCommentItem:removeReportBtn()
	if self.reportBtn then
		NGUITools.Destroy(self.reportBtn:getGameObject())

		self.reportBtn = nil
	end
end

function PartnerStationCommentItem:updateLayout()
	self.serverId.text = xyd.getServerNumber(self.server_id)
	self.nameLabel.text = xyd.getRoughDisplayName(self.player_name, 17)
	self.contentLabel.text = self.msg
	self.timeLabel.text = self:setTime()

	local likeType = self.commentModel:isLikeComment(self.params.chapter_id, self.comment_id)

	xyd.setUISpriteAsync(self.likeImg, nil, "comic_comment_like" .. likeType)

	self.likeCountLabel.text = self.like

	self:setAvatar()

	if self.params.showTransl and not self.params.inTransl then
		self.contentLabel.text = self.params.translate
	else
		self.contentLabel.text = self.params.msg
	end

	self.go:GetComponent(typeof(UIWidget)).height = self.contentLabel.height + 150
end

function PartnerStationCommentItem:updateContent()
	local tmpParams = table.clone(self.params)

	tmpParams.type = nil
	tmpParams.index = nil

	for k, v in ipairs(xyd.models.partnerComment.commentInfo[self.params.table_id]) do
		if v.comment_id == tmpParams.comment_id then
			xyd.models.partnerComment.commentInfo[self.params.table_id][k] = tmpParams

			break
		end
	end
end

function PartnerStationCommentItem:onTranslate()
	if self.params.inTransl then
		xyd.alert(xyd.AlertType.TIPS, __("CHAT_TRANSLATEING"))

		return
	end

	self.params.showTransl = not self.params.showTransl

	self:updateContent()

	if self.params.showTransl then
		self.params.inTransl = true
		self.params.originalContent = self.params.msg
		self.params.msg = xyd.models.acDFA:preTraslation(self.params.msg)

		self:updateContent()
		xyd.models.partnerComment:translateFrontend(self.params, function(msg, type)
			if type == xyd.TranslateType.DOING then
				xyd.alert(xyd.AlertType.TIPS, __("CHAT_TRANSLATEING"))
			else
				if not self.contentLabel or tolua.isnull(self.contentLabel.gameObject) then
					return
				end

				self.params.inTransl = false
				self.contentLabel.text = msg.translate
				self.params.msg = xyd.checkCondition(self.params.originalContent, self.params.originalContent, self.params.msg)

				self:updateContent()

				self.go:GetComponent(typeof(UIWidget)).height = self.contentLabel.height + 150

				local win = xyd.getWindow("partner_data_station_window")

				if win and win.comp3 then
					win.comp3.commentPage_:refreshAll()
				end
			end
		end)
	else
		self.params.msg = xyd.checkCondition(self.params.originalContent, self.params.originalContent, self.params.msg)
		self.contentLabel.text = self.params.msg

		self:updateContent()

		self.go:GetComponent(typeof(UIWidget)).height = self.contentLabel.height + 150

		local win = xyd.getWindow("partner_data_station_window")

		if win and win.comp3 then
			win.comp3.commentPage_:refreshAll()
		end
	end
end

function PartnerStationCommentItem:setAvatar()
	local avatarID = self.avatar_id

	if avatarID and avatarID > 0 then
		local iconName = ""
		local iconType = xyd.tables.itemTable:getType(avatarID)

		if iconType == xyd.ItemType.HERO_DEBRIS then
			local partnerCost = xyd.tables.itemTable:partnerCost(avatarID)

			iconName = xyd.tables.partnerTable:getAvatar(partnerCost[1])
		elseif iconType == xyd.ItemType.HERO then
			iconName = xyd.tables.partnerTable:getAvatar(avatarID)
		elseif iconType == xyd.ItemType.SKIN then
			iconName = xyd.tables.equipTable:getSkinAvatar(avatarID)
		else
			iconName = xyd.tables.itemTable:getIcon(avatarID)
		end

		xyd.setUISpriteAsync(self.avatarImg, nil, iconName)
		self.avatarImg:SetActive(true)
	else
		self.avatarImg:SetActive(false)
	end
end

function PartnerStationCommentItem:setTime()
	local timestr = xyd.getDisplayDate(self.created_time, false)
	local curtimestr = xyd.getDisplayDate(xyd.getServerTime(), false)
	local time_split = xyd.split(timestr, "  ")
	local cur_split = xyd.split(curtimestr, "  ")

	if cur_split[1] == time_split[1] then
		local split_ = xyd.split(time_split[2], ":")

		return split_[1] .. ":" .. split_[2]
	else
		local split_ = xyd.split(time_split[1], "-")

		return split_[2] .. "-" .. split_[3]
	end
end

function CommentNode:ctor(go, index, parent)
	self.go_ = go
	self.parent_ = parent
	self.realIndex_ = index
	self.needFixPos_ = false
	self.oldRealIndex_ = self.realIndex_
	self.mTransform_ = go.transform
	self.uiWidget_ = go:GetComponent(typeof(UIWidget))
end

function CommentNode:setRealIndex(index)
	self.realIndex_ = index
	self.needFixPos_ = true
end

function CommentNode:getRealIndex()
	return self.realIndex_
end

function CommentNode:getOldRealIndex()
	return self.oldRealIndex_
end

function CommentNode:needFixPos()
	return self.needFixPos_
end

function CommentNode:fixPos(x, y, z)
	self.needFixPos_ = false

	self.mTransform_:SetLocalPosition(x, y, z)

	self.oldRealIndex_ = self.realIndex_
end

function CommentNode:getTopOffset()
	local finalClipRegion = self.parent_:getFinalClipRegion()
	local selfY = self.mTransform_.localPosition.y + self:getHeight()

	return selfY - finalClipRegion.y - finalClipRegion.w / 2
end

function CommentNode:getPos()
	return self.mTransform_.localPosition
end

function CommentNode:getGameObject()
	return self.go_
end

function CommentNode:getHeight()
	return self.uiWidget_.height
end

function CommentNode:getInfo()
	return self.parent_:getCommnetInfoByRealIndex(self.realIndex_)
end

function CommentNode:refresh()
	local info = self:getInfo()

	if not info then
		self.go_:SetActive(false)

		return
	end

	self.go_:SetActive(true)

	local type_ = info.type

	if self.oldType_ == type_ and self.item_ then
		self.item_:setInfo(info)
		self:updateHeight()

		return
	end

	if self.item_ then
		NGUITools.Destroy(self.item_:getGameObject())

		self.item_ = nil
	end

	local item = PartnerStationCommentItem.new(self.go_, self.parent_)

	xyd.setDragScrollView(item.go, self.parent_:getScrollView())

	if self.touchLayer_ then
		xyd.setDragScrollView(self.touchLayer_, self.parent_:getScrollView())
	end

	item:setInfo(info)

	self.oldType_ = type_
	self.item_ = item

	self:updateHeight()
end

function CommentNode:isShowingInPanel()
	local wrapIndex = tonumber(string.sub(self.go_.name, 6))
	local finalClipRegion = self.parent_:getFinalClipRegion()
	local selfY = self.mTransform_.localPosition.y

	return math.abs(selfY - finalClipRegion.y) <= finalClipRegion.w / 2 + 10
end

function CommentNode:onClipMove()
	local info = self:getInfo()

	if info == nil then
		return
	end

	local isShowing = self:isShowingInPanel()

	if isShowing then
		self.parent_:updateUnreadStatus(self.realIndex_)
	end
end

function CommentNode:updateHeight()
	local height = self.item_:getHeight()

	self.uiWidget_.height = height

	local info = self:getInfo()

	self.parent_:updateHeight(info.comment_id, height)
end

return CommentNode
