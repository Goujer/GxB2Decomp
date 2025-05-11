-- chunkname: @../../../Product/Bundles/Android/src/app/components/GuildNewWarMainRankGuildItem.lua

local GuildNewWarMainRankGuildItem = class("GuildNewWarMainRankGuildItem", import("app.components.CopyComponent"))
local BaseComponent = import("app.components.BaseComponent")
local RankItem = class("RankItem", BaseComponent)
local FixedWrapContent = import("app.common.ui.FixedWrapContent")
local PlayerIcon = require("app.components.PlayerIcon")

function GuildNewWarMainRankGuildItem:ctor(goItem, parent, guildInfo)
	self.parent = parent
	self.guildInfo = guildInfo
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR)

	GuildNewWarMainRankGuildItem.super.ctor(self, goItem)
end

function GuildNewWarMainRankGuildItem:initUI()
	self:getUIComponent()
	GuildNewWarMainRankGuildItem.super.initUI(self)
	self:register()
	self:layout()
end

function GuildNewWarMainRankGuildItem:getUIComponent()
	self.guildCon = self.go
	self.upCon = self.guildCon:NodeByName("upCon").gameObject
	self.showGuildCon = self.upCon:NodeByName("showGuildCon").gameObject

	for i = 1, 3 do
		self["guildCon" .. i] = self.showGuildCon:NodeByName("guildCon" .. i).gameObject
		self.guildConBg = self["guildCon" .. i]:ComponentByName("guildConBg", typeof(UIWidget))
		self["guildIcon" .. i] = self["guildCon" .. i]:ComponentByName("guildIcon", typeof(UISprite))
		self["guildName" .. i] = self["guildCon" .. i]:ComponentByName("guildName", typeof(UILabel))
		self.scoreCon = self["guildCon" .. i]:NodeByName("scoreCon").gameObject
		self.scoreConBg = self.scoreCon:ComponentByName("scoreConBg", typeof(UISprite))
		self.scoreConIcon = self.scoreCon:ComponentByName("scoreConIcon", typeof(UISprite))
		self["scoreConLabel" .. i] = self.scoreCon:ComponentByName("scoreConLabel", typeof(UILabel))
		self.presidentCon = self["guildCon" .. i]:NodeByName("presidentCon").gameObject
		self.presidentConIcon = self.presidentCon:ComponentByName("presidentConIcon", typeof(UISprite))
		self["presidentConLabel" .. i] = self.presidentCon:ComponentByName("presidentConLabel", typeof(UILabel))
	end

	self.downCon = self.guildCon:NodeByName("downCon").gameObject
	self.downConBgGroup = self.downCon:NodeByName("downConBgGroup").gameObject
	self.downConBg1 = self.downConBgGroup:ComponentByName("downConBg1", typeof(UISprite))
	self.downConBg2 = self.downConBgGroup:ComponentByName("downConBg2", typeof(UISprite))
	self.downConBg3 = self.downConBgGroup:ComponentByName("downConBg3", typeof(UISprite))
	self.downConBg4 = self.downConBgGroup:ComponentByName("downConBg4", typeof(UISprite))
	self.downConBg5 = self.downConBgGroup:ComponentByName("downConBg5", typeof(UISprite))
	self.downBg2 = self.downCon:ComponentByName("downBg2", typeof(UISprite))
	self.scroller = self.downCon:NodeByName("scroller").gameObject
	self.scrollerUIScrollView = self.downCon:ComponentByName("scroller", typeof(UIScrollView))
	self.scrollerContent = self.scroller:NodeByName("scrollerContent").gameObject
	self.scrollerContentUIWrapContent = self.scroller:ComponentByName("scrollerContent", typeof(UIWrapContent))
	self.drag = self.downCon:NodeByName("drag").gameObject
	self.myConObj = self.downCon:NodeByName("myConObj").gameObject
	self.myCon = self.myConObj:NodeByName("myCon").gameObject
	self.myConGroup = self.myCon:NodeByName("myConGroup").gameObject
	self.myConBg = self.myCon:ComponentByName("myConBg", typeof(UISprite))
	self.guildItem = self.downCon:ComponentByName("guildItem", typeof(UISprite)).gameObject
	self.guildWrapContent = FixedWrapContent.new(self.scrollerUIScrollView, self.scrollerContentUIWrapContent, self.guildItem, RankItem, self)

	self.guildWrapContent:hideItems()

	self.tipsNone = self.downCon:NodeByName("tipsNone").gameObject
	self.labelNoneTips = self.tipsNone:ComponentByName("labelNoneTips", typeof(UILabel))
end

function GuildNewWarMainRankGuildItem:register()
	return
end

function GuildNewWarMainRankGuildItem:layout()
	self.labelNoneTips.text = __("GUILD_NEW_WAR_TEXT79")

	self:initGuildShow()
	self:initMyShow()

	if not self.firstTween then
		self.upCon:X(-1000)

		self.action = DG.Tweening.DOTween.Sequence()

		self.action:Append(self.upCon.transform:DOLocalMoveX(0, 0.5))
		self.action:AppendCallback(function()
			self.action:Kill(true)
		end)

		self.firstTween = true
	end
end

function GuildNewWarMainRankGuildItem:initGuildShow()
	if self.guildInfo and self.guildInfo.list and #self.guildInfo.list > 0 then
		for i, data in pairs(self.guildInfo.list) do
			if i <= 3 then
				xyd.setUISprite(self["guildIcon" .. i], nil, xyd.tables.guildIconTable:getIcon(data.flag))

				self["guildName" .. i].text = data.name
				self["scoreConLabel" .. i].text = tostring(data.score)
				self["presidentConLabel" .. i].text = data.leader
			else
				break
			end
		end

		for i = #self.guildInfo.list + 1, 3 do
			self["guildName" .. i].text = " "
			self["scoreConLabel" .. i].text = " "
			self["presidentConLabel" .. i].text = " "
		end

		if #self.guildInfo.list > 3 then
			local fourAfterArr = {}

			for i = 4, #self.guildInfo.list do
				table.insert(fourAfterArr, {
					guildInfo = self.guildInfo.list[i],
					rank = i
				})
			end

			self.guildWrapContent:setInfos(fourAfterArr, {})
			self.tipsNone:SetActive(false)
		else
			self.tipsNone:SetActive(true)
		end
	else
		for i = 1, 3 do
			self["guildName" .. i].text = " "
			self["scoreConLabel" .. i].text = " "
			self["presidentConLabel" .. i].text = " "
		end

		self.tipsNone:SetActive(true)
	end

	self.scrollerUIScrollView:ResetPosition()
	self:waitForFrame(1, function()
		self.scrollerUIScrollView:ResetPosition()
	end)
end

function GuildNewWarMainRankGuildItem:initMyShow()
	local tmp = NGUITools.AddChild(self.myConGroup.gameObject, self.guildItem.gameObject)

	self.myRankItem = RankItem.new(tmp, self)

	local rankInfo = {
		flag = self.activityData:getBaseInfo().self_guild.base_info.flag,
		leader = self.activityData:getBaseInfo().self_guild.leader,
		name = self.activityData:getBaseInfo().self_guild.base_info.name,
		score = self.guildInfo.score
	}

	dump(rankInfo, "selfInfo")
	self.myRankItem:update(nil, {
		isMySelf = true,
		guildInfo = rankInfo,
		rank = self.guildInfo.rank
	})
end

function RankItem:ctor(go, parent)
	self.go = go
	self.parent = parent

	self:initUI()
end

function RankItem:getUIComponent()
	self.guildItem = self.go
	self.guildItemUISprite = self.go:GetComponent(typeof(UISprite))
	self.rankLabel = self.guildItem:ComponentByName("rankLabel", typeof(UILabel))
	self.guildIcon = self.guildItem:ComponentByName("guildIcon", typeof(UISprite))
	self.guildName = self.guildItem:ComponentByName("guildName", typeof(UILabel))
	self.presidentCon = self.guildItem:NodeByName("presidentCon").gameObject
	self.presidentConIcon = self.presidentCon:ComponentByName("presidentConIcon", typeof(UISprite))
	self.presidentConLabel = self.presidentCon:ComponentByName("presidentConLabel", typeof(UILabel))
	self.scoreCon = self.guildItem:NodeByName("scoreCon").gameObject
	self.scoreConIcon = self.scoreCon:ComponentByName("scoreConIcon", typeof(UISprite))
	self.scoreConLabel = self.scoreCon:ComponentByName("scoreConLabel", typeof(UILabel))
	self.rankIcon = self.guildItem:ComponentByName("rankIcon", typeof(UISprite))
end

function RankItem:initUI()
	self:getUIComponent()
end

function RankItem:update(index, data)
	if not data then
		self.go:SetActive(false)

		return
	end

	self.go:SetActive(true)

	self.info = data

	if self.info.isMySelf then
		self.guildItemUISprite.enabled = false
	else
		self.guildItemUISprite.enabled = true
	end

	self.guildInfo = self.info.guildInfo
	self.rank = self.info.rank

	self.rankIcon.gameObject:SetActive(false)

	if self.rank <= 0 then
		self.rankLabel.text = "--"
	elseif self.rank > 3 then
		self.rankLabel.text = tostring(self.rank)
	else
		self.rankLabel.text = " "

		self.rankIcon.gameObject:SetActive(true)
		xyd.setUISpriteAsync(self.rankIcon, nil, "guild_new_war3_ph_x_" .. self.rank, nil, nil, true)
	end

	self.presidentConLabel.text = self.guildInfo.leader
	self.guildName.text = self.guildInfo.name
	self.scoreConLabel.text = tostring(self.guildInfo.score)

	xyd.setUISprite(self.guildIcon, nil, xyd.tables.guildIconTable:getIcon(self.guildInfo.flag))
end

function RankItem:getGameObject()
	return self.go
end

return GuildNewWarMainRankGuildItem
