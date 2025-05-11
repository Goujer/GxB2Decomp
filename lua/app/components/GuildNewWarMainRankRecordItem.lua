-- chunkname: @../../../Product/Bundles/Android/src/app/components/GuildNewWarMainRankRecordItem.lua

local GuildNewWarMainRankRecordItem = class("GuildNewWarMainRankRecordItem", import("app.components.CopyComponent"))
local BaseComponent = import("app.components.BaseComponent")
local RecordItem = class("RecordItem", BaseComponent)
local FixedWrapContent = import("app.common.ui.FixedWrapContent")
local PlayerIcon = require("app.components.PlayerIcon")

function GuildNewWarMainRankRecordItem:ctor(goItem, parent, guildLogInfo)
	self.parent = parent
	self.guildLogInfo = guildLogInfo

	GuildNewWarMainRankRecordItem.super.ctor(self, goItem)
end

function GuildNewWarMainRankRecordItem:initUI()
	self:getUIComponent()
	GuildNewWarMainRankRecordItem.super.initUI(self)
	self:register()
	self:layout()
end

function GuildNewWarMainRankRecordItem:getUIComponent()
	self.guildCon = self.go
	self.downCon = self.guildCon:NodeByName("downCon").gameObject
	self.downConBgGroup = self.downCon:NodeByName("downConBgGroup").gameObject
	self.downConBg1 = self.downConBgGroup:ComponentByName("downConBg1", typeof(UISprite))
	self.downConBg2 = self.downConBgGroup:ComponentByName("downConBg2", typeof(UISprite))
	self.downConBg3 = self.downConBgGroup:ComponentByName("downConBg3", typeof(UISprite))
	self.downConBg4 = self.downConBgGroup:ComponentByName("downConBg4", typeof(UISprite))
	self.downConBg5 = self.downConBgGroup:ComponentByName("downConBg5", typeof(UISprite))
	self.downObj = self.downCon:NodeByName("downObj").gameObject
	self.downBg2 = self.downObj:ComponentByName("downBg2", typeof(UISprite))
	self.scroller = self.downObj:NodeByName("scroller").gameObject
	self.scrollerUIScrollView = self.downObj:ComponentByName("scroller", typeof(UIScrollView))
	self.scrollerContent = self.scroller:NodeByName("scrollerContent").gameObject
	self.scrollerContentUIWrapContent = self.scroller:ComponentByName("scrollerContent", typeof(UIWrapContent))
	self.drag = self.downCon:NodeByName("drag").gameObject
	self.recordItem = self.downCon:NodeByName("recordItem").gameObject
	self.recordWrapContent = FixedWrapContent.new(self.scrollerUIScrollView, self.scrollerContentUIWrapContent, self.recordItem, RecordItem, self)

	self.recordWrapContent:hideItems()

	self.tipsNone = self.downCon:NodeByName("tipsNone").gameObject
	self.labelNoneTips = self.tipsNone:ComponentByName("labelNoneTips", typeof(UILabel))
end

function GuildNewWarMainRankRecordItem:register()
	return
end

function GuildNewWarMainRankRecordItem:layout()
	self.labelNoneTips.text = __("GUILD_NEW_WAR_TEXT07")

	self:initPersonShow()
end

function GuildNewWarMainRankRecordItem:initPersonShow()
	if self.guildLogInfo and self.guildLogInfo.list and #self.guildLogInfo.list > 0 then
		local length = #self.guildLogInfo.list
		local infoArr = {}

		for i, info in pairs(self.guildLogInfo.list) do
			table.insert(infoArr, {
				dataInfo = info,
				num = length - (i - 1)
			})
		end

		self.recordWrapContent:setInfos(infoArr, {})
		self.tipsNone:SetActive(false)
	else
		self.tipsNone:SetActive(true)
	end

	self.scrollerUIScrollView:ResetPosition()

	if not self.firstTween then
		if self.guildLogInfo and self.guildLogInfo.list and #self.guildLogInfo.list > 5 then
			self.scrollerUIScrollView:MoveRelative(Vector3(0, -200, 0))
			self.scrollerUIScrollView:Scroll(0.1)
		end

		self.firstTween = true
	end
end

function RecordItem:ctor(go, parent)
	self.go = go
	self.parent = parent

	self:initUI()
end

function RecordItem:getUIComponent()
	self.recordItem = self.go
	self.bg = self.recordItem:ComponentByName("bg", typeof(UISprite))
	self.titleName = self.recordItem:ComponentByName("titleName", typeof(UILabel))
	self.leftObj = {}
	self.leftCon = self.recordItem:NodeByName("leftCon").gameObject
	self.leftObj.guildIcon = self.leftCon:ComponentByName("guildIcon", typeof(UISprite))
	self.leftObj.mvpCon = self.leftCon:NodeByName("mvpCon").gameObject
	self.leftObj.mvpConIcon = self.leftObj.mvpCon:ComponentByName("mvpConIcon", typeof(UISprite))
	self.leftObj.mvpConLabel = self.leftObj.mvpCon:ComponentByName("mvpConLabel", typeof(UILabel))
	self.leftObj.scoreCon = self.leftCon:NodeByName("scoreCon").gameObject
	self.leftObj.scoreConIcon = self.leftObj.scoreCon:ComponentByName("scoreConIcon", typeof(UISprite))
	self.leftObj.scoreConLabel = self.leftObj.scoreCon:ComponentByName("scoreConLabel", typeof(UILabel))
	self.leftObj.guildNameCon = self.leftCon:NodeByName("guildNameCon").gameObject
	self.leftObj.guildNameBg = self.leftObj.guildNameCon:ComponentByName("guildNameBg", typeof(UISprite))
	self.leftObj.guildNameLabel = self.leftObj.guildNameCon:ComponentByName("guildNameLabel", typeof(UILabel))
	self.rightCon = self.recordItem:NodeByName("rightCon").gameObject
	self.rightObj = {}
	self.rightObj.guildIcon = self.rightCon:ComponentByName("guildIcon", typeof(UISprite))
	self.rightObj.mvpCon = self.rightCon:NodeByName("mvpCon").gameObject
	self.rightObj.mvpConIcon = self.rightObj.mvpCon:ComponentByName("mvpConIcon", typeof(UISprite))
	self.rightObj.mvpConLabel = self.rightObj.mvpCon:ComponentByName("mvpConLabel", typeof(UILabel))
	self.rightObj.scoreCon = self.rightCon:NodeByName("scoreCon").gameObject
	self.rightObj.scoreConIcon = self.rightObj.scoreCon:ComponentByName("scoreConIcon", typeof(UISprite))
	self.rightObj.scoreConLabel = self.rightObj.scoreCon:ComponentByName("scoreConLabel", typeof(UILabel))
	self.rightObj.guildNameCon = self.rightCon:NodeByName("guildNameCon").gameObject
	self.rightObj.guildNameBg = self.rightObj.guildNameCon:ComponentByName("guildNameBg", typeof(UISprite))
	self.rightObj.guildNameLabel = self.rightObj.guildNameCon:ComponentByName("guildNameLabel", typeof(UILabel))
	self.stateIcon = self.recordItem:ComponentByName("stateIcon", typeof(UITexture))
end

function RecordItem:initUI()
	self:getUIComponent()
end

function RecordItem:update(index, data)
	if not data then
		self.go:SetActive(false)

		return
	end

	self.go:SetActive(true)

	self.info = data.dataInfo
	self.num = data.num

	self:setOneInfo(self.leftObj, self.info.self_info)
	self:setOneInfo(self.rightObj, self.info.e_info)

	local selfScore = self.info.self_info.score
	local eScore = self.info.e_info.score
	local stateImgStr

	if eScore < selfScore then
		stateImgStr = "arena_3v3_win_" .. xyd.Global.lang
	else
		stateImgStr = "arena_3v3_lost_" .. xyd.Global.lang
	end

	xyd.setUITextureByNameAsync(self.stateIcon, stateImgStr, true)

	self.titleName.text = __("GUILD_NEW_WAR_TEXT06", self.num)
end

function RecordItem:setOneInfo(objInfo, info)
	if info.mvp then
		objInfo.mvpConLabel.text = info.mvp
	else
		objInfo.mvpConLabel.text = "--"
	end

	objInfo.scoreConLabel.text = tostring(info.score)

	local flag = 1

	if info.base_info then
		objInfo.guildNameLabel.text = info.base_info.name
		flag = info.base_info.flag
	else
		objInfo.guildNameLabel.text = __("GUILD_NEW_WAR_TEXT96")
	end

	xyd.setUISprite(objInfo.guildIcon, nil, xyd.tables.guildIconTable:getIcon(flag))
end

function RecordItem:getGameObject()
	return self.go
end

return GuildNewWarMainRankRecordItem
