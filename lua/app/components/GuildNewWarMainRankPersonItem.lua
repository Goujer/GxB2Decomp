-- chunkname: @../../../Product/Bundles/Android/src/app/components/GuildNewWarMainRankPersonItem.lua

local GuildNewWarMainRankPersonItem = class("GuildNewWarMainRankPersonItem", import("app.components.CopyComponent"))
local BaseComponent = import("app.components.BaseComponent")
local RankItem = class("RankItem", BaseComponent)
local FixedWrapContent = import("app.common.ui.FixedWrapContent")
local PlayerIcon = require("app.components.PlayerIcon")

function GuildNewWarMainRankPersonItem:ctor(goItem, parent, personListInfo)
	self.parent = parent
	self.personListInfo = personListInfo
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR)

	GuildNewWarMainRankPersonItem.super.ctor(self, goItem)
end

function GuildNewWarMainRankPersonItem:initUI()
	self:getUIComponent()
	GuildNewWarMainRankPersonItem.super.initUI(self)
	self:register()
	self:layout()

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

function GuildNewWarMainRankPersonItem:getUIComponent()
	self.personCon = self.go
	self.upCon = self.personCon:NodeByName("upCon").gameObject
	self.showPersonCon = self.upCon:NodeByName("showPersonCon").gameObject

	for i = 1, 3 do
		self["personCon" .. i] = self.showPersonCon:NodeByName("personCon" .. i).gameObject
		self.guildConBg = self["personCon" .. i]:NodeByName("guildConBg").gameObject
		self.guildConBg3 = self.guildConBg:ComponentByName("guildConBg3", typeof(UISprite))
		self.guildConBg1 = self.guildConBg:ComponentByName("guildConBg1", typeof(UISprite))
		self.guildConBg2 = self.guildConBg:ComponentByName("guildConBg2", typeof(UISprite))
		self.guildConBg4 = self.guildConBg:ComponentByName("guildConBg4", typeof(UISprite))
		self["personEffectCon" .. i] = self["personCon" .. i]:NodeByName("personEffectCon").gameObject
		self.scoreCon = self["personCon" .. i]:NodeByName("scoreCon").gameObject
		self.scoreConBg = self.scoreCon:ComponentByName("scoreConBg", typeof(UISprite))
		self.scoreConIcon = self.scoreCon:ComponentByName("scoreConIcon", typeof(UISprite))
		self["scoreConLabel" .. i] = self.scoreCon:ComponentByName("scoreConLabel", typeof(UILabel))
		self.presidentCon = self["personCon" .. i]:NodeByName("presidentCon").gameObject
		self["presidentConIcon" .. i] = self.presidentCon:ComponentByName("presidentConIcon", typeof(UISprite))
		self["presidentConLabel" .. i] = self.presidentCon:ComponentByName("presidentConLabel", typeof(UILabel))
	end

	self.downCon = self.personCon:NodeByName("downCon").gameObject
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
	self.personItem = self.downCon:ComponentByName("personItem", typeof(UISprite)).gameObject
	self.personWrapContent = FixedWrapContent.new(self.scrollerUIScrollView, self.scrollerContentUIWrapContent, self.personItem, RankItem, self)

	self.personWrapContent:hideItems()

	self.tipsNone = self.downCon:NodeByName("tipsNone").gameObject
	self.labelNoneTips = self.tipsNone:ComponentByName("labelNoneTips", typeof(UILabel))
end

function GuildNewWarMainRankPersonItem:register()
	return
end

function GuildNewWarMainRankPersonItem:layout()
	self.labelNoneTips.text = __("GUILD_NEW_WAR_TEXT79")

	self:initPersonShow()
	self:initMyShow()
end

function GuildNewWarMainRankPersonItem:initPersonShow()
	if self.personListInfo and self.personListInfo.list and #self.personListInfo.list > 0 then
		for i, data in pairs(self.personListInfo.list) do
			if i <= 3 then
				self["presidentConIcon" .. i]:SetActive(false)

				self["scoreConLabel" .. i].text = tostring(data.score)
				self["presidentConLabel" .. i].text = data.player_name

				self["personEffectCon" .. i].gameObject:SetActive(true)

				if not self["normalModel" .. i] then
					self["normalModel" .. i] = import("app.components.SenpaiModel").new(self["personEffectCon" .. i])

					self["normalModel" .. i]:setModelInfo({
						isNewClipShader = true,
						ids = data.dress_style
					})
				end

				local members = xyd.models.guild.members

				for j = 1, #members do
					local playerID = members[j].player_id

					if playerID == data.player_id then
						local job = members[j].job

						if job == xyd.GUILD_JOB.LEADER then
							self["presidentConIcon" .. i]:SetActive(true)
						end
					end
				end
			else
				break
			end
		end

		for i = #self.personListInfo.list + 1, 3 do
			self["scoreConLabel" .. i].text = " "
			self["presidentConLabel" .. i].text = " "

			self["personEffectCon" .. i].gameObject:SetActive(false)
			self["presidentConIcon" .. i]:SetActive(false)
		end

		if #self.personListInfo.list > 3 then
			local fourAfterArr = {}

			for i = 4, #self.personListInfo.list do
				table.insert(fourAfterArr, {
					personInfo = self.personListInfo.list[i],
					rank = i
				})
			end

			self.personWrapContent:setInfos(fourAfterArr, {})
			self.tipsNone:SetActive(false)
		else
			self.tipsNone:SetActive(true)
		end
	else
		for i = 1, 3 do
			self["scoreConLabel" .. i].text = " "
			self["presidentConLabel" .. i].text = " "

			self["personEffectCon" .. i].gameObject:SetActive(false)
			self["presidentConIcon" .. i]:SetActive(false)
		end

		self.tipsNone:SetActive(true)
	end

	self.scrollerUIScrollView:ResetPosition()
	self:waitForFrame(1, function()
		self.scrollerUIScrollView:ResetPosition()
	end)
end

function GuildNewWarMainRankPersonItem:initMyShow()
	local tmp = NGUITools.AddChild(self.myConGroup.gameObject, self.personItem.gameObject)

	self.myRankItem = RankItem.new(tmp, self)

	local rank = -1
	local rankInfo

	if self.personListInfo and self.personListInfo.list and #self.personListInfo.list > 0 then
		for i, data in pairs(self.personListInfo.list) do
			if data.player_id == xyd.models.selfPlayer:getPlayerID() then
				rankInfo = data
				rank = i

				break
			end
		end
	end

	rankInfo = rankInfo or {
		score = 0,
		rank = -1,
		player_name = xyd.models.selfPlayer:getPlayerName(),
		player_id = xyd.models.selfPlayer:getPlayerID(),
		avatar_id = xyd.models.selfPlayer:getAvatarID(),
		avatar_frame_id = xyd.models.selfPlayer:getAvatarFrameID(),
		power = self.activityData:getDefFormation().power or 0,
		lev = xyd.models.backpack:getLev()
	}

	self.myRankItem:update(nil, {
		isMySelf = true,
		personInfo = rankInfo,
		rank = rank
	})
end

function RankItem:ctor(go, parent)
	self.go = go
	self.parent = parent

	self:initUI()
end

function RankItem:getUIComponent()
	self.personItem = self.go
	self.personItemUISprite = self.personItem:GetComponent(typeof(UISprite))
	self.rankLabel = self.personItem:ComponentByName("rankLabel", typeof(UILabel))
	self.icon = self.personItem:NodeByName("icon").gameObject
	self.nameCon = self.personItem:NodeByName("nameCon").gameObject
	self.nameConIcon = self.nameCon:ComponentByName("nameConIcon", typeof(UISprite))
	self.nameConLabel = self.nameCon:ComponentByName("nameConLabel", typeof(UILabel))
	self.scoreCon = self.personItem:NodeByName("scoreCon").gameObject
	self.scoreConIcon = self.scoreCon:ComponentByName("scoreConIcon", typeof(UISprite))
	self.scoreConLabel = self.scoreCon:ComponentByName("scoreConLabel", typeof(UILabel))
	self.powerCon = self.personItem:NodeByName("powerCon").gameObject
	self.powerConIcon = self.powerCon:ComponentByName("powerConIcon", typeof(UISprite))
	self.powerConLabel = self.powerCon:ComponentByName("powerConLabel", typeof(UILabel))
	self.rankIcon = self.personItem:ComponentByName("rankIcon", typeof(UISprite))
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
		self.personItemUISprite.enabled = false
	else
		self.personItemUISprite.enabled = true
	end

	self.personInfo = self.info.personInfo
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

	self.nameConLabel.text = self.personInfo.player_name
	self.powerConLabel.text = tostring(self.personInfo.power)
	self.scoreConLabel.text = tostring(self.personInfo.score)

	local params = {
		scale = 0.7777777777777778,
		avatarID = self.personInfo.avatar_id,
		avatar_frame_id = self.personInfo.avatar_frame_id
	}

	if not self.pIcon then
		self.pIcon = PlayerIcon.new(self.icon)
	end

	self.pIcon:setInfo(params)
	self.pIcon:AddUIDragScrollView()
	self.nameConIcon:SetActive(false)

	local members = xyd.models.guild.members

	for i = 1, #members do
		local playerID = members[i].player_id

		if playerID == self.personInfo.player_id then
			local job = members[i].job

			if job == xyd.GUILD_JOB.LEADER then
				self.nameConIcon:SetActive(true)
			end
		end
	end
end

function RankItem:getGameObject()
	return self.go
end

return GuildNewWarMainRankPersonItem
