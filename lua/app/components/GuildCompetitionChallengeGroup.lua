-- chunkname: @../../../Product/Bundles/Android/src/app/components/GuildCompetitionChallengeGroup.lua

local GuildCompetitionChallengeGroup = class("GuildCompetitionChallengeGroup", import(".BaseComponent"))

function GuildCompetitionChallengeGroup:ctor(parentGo, params)
	self.isHasStar = params.isHasStar
	self.targetArr = params.targetArr
	self.completeArr = params.completeArr

	GuildCompetitionChallengeGroup.super.ctor(self, parentGo)
end

function GuildCompetitionChallengeGroup:getPrefabPath()
	return "Prefabs/Components/guild_competition_challenge_group"
end

function GuildCompetitionChallengeGroup:initUI()
	self:getUIComponent()
	GuildCompetitionChallengeGroup.super.initUI(self)
	self:layout()
end

function GuildCompetitionChallengeGroup:getGo()
	return self.go.gameObject
end

function GuildCompetitionChallengeGroup:getUIComponent()
	self.targetText = self.go:ComponentByName("targetText", typeof(UILabel))
	self.centerCon = self.go:NodeByName("centerCon").gameObject
	self.starCon = self.go:NodeByName("starCon").gameObject

	local groupObj

	if self.isHasStar then
		groupObj = self.starCon
	else
		groupObj = self.centerCon
	end

	for i = 1, 3 do
		self["group" .. i] = groupObj:NodeByName("group" .. i).gameObject
		self["targetBg" .. i] = self["group" .. i]:ComponentByName("targetBg", typeof(UISprite))
		self["groupLabel" .. i] = self["group" .. i]:ComponentByName("groupLabel", typeof(UILabel))

		if self.isHasStar then
			self["starIcon" .. i] = self["group" .. i]:ComponentByName("starIcon", typeof(UISprite))
		end
	end

	self.descText = groupObj:ComponentByName("descCon/descText", typeof(UILabel))
	self.bgUIWidget = groupObj:ComponentByName("bg", typeof(UIWidget))
	self.allBg = self.go:NodeByName("allBg").gameObject
end

function GuildCompetitionChallengeGroup:onRegister()
	GuildCompetitionChallengeGroup.super.onRegister(self)
end

function GuildCompetitionChallengeGroup:setBgClickHide()
	self.allBg.gameObject:SetActive(true)

	UIEventListener.Get(self.allBg.gameObject).onClick = handler(self, function()
		self:SetActive(false)
	end)
end

function GuildCompetitionChallengeGroup:layout()
	self.targetText.text = __("GUILD_COMPETITION_CHALLENGE_TEXT01")
	self.descText.text = __("GUILD_COMPETITION_CHALLENGE_TEXT02")

	if self.isHasStar then
		self.centerCon.gameObject:SetActive(false)
		self.starCon.gameObject:SetActive(true)

		self.descText.color = Color.New2(4185921023)
	else
		self.centerCon.gameObject:SetActive(true)
		self.starCon.gameObject:SetActive(false)

		self.descText.color = Color.New2(1432789759)
	end

	for i = 1, 3 do
		local value = xyd.tables.battleChallengeTable:getParams(self.targetArr[i])

		self["groupLabel" .. i].text = xyd.tables.battleChallengeTextTable:getDescWithParams(self.targetArr[i], value)

		if self.isHasStar and self.completeArr then
			if self.completeArr[i] == 1 then
				xyd.applyChildrenOrigin(self["starIcon" .. i].gameObject)
			else
				xyd.applyChildrenGrey(self["starIcon" .. i].gameObject)
			end
		end
	end
end

function GuildCompetitionChallengeGroup:getHeight()
	return self.bgUIWidget.height
end

return GuildCompetitionChallengeGroup
