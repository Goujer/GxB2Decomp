-- chunkname: @../../../Product/Bundles/Android/src/app/components/AllServerPlayerIcon.lua

local AllServerPlayerIcon = class("AllServerPlayerIcon", import(".BaseComponent"))
local PlayerIcon = import("app.components.PlayerIcon")

function AllServerPlayerIcon:ctor(parentGo)
	AllServerPlayerIcon.super.ctor(self, parentGo)

	self.reportIDs_ = {}
	self.playerID_ = 0
	self.canTouchQuiz_ = false
end

function AllServerPlayerIcon:getPrefabPath()
	return "Prefabs/Components/all_server_player_icon"
end

function AllServerPlayerIcon:initUI()
	AllServerPlayerIcon.super.initUI(self)

	self.groupAvatar = self.go:NodeByName("groupAvatar").gameObject
	self.labelName = self.go:ComponentByName("labelName", typeof(UILabel))
	self.labelGuildName = self.go:ComponentByName("labelGuildName", typeof(UILabel))
	self.btnVideo = self.go:NodeByName("btnVideo").gameObject
	self.imgQuiz_ = self.go:NodeByName("imgQuiz_").gameObject

	self:registerEvent()
end

function AllServerPlayerIcon:registerEvent()
	UIEventListener.Get(self.btnVideo).onClick = handler(self, self.onVideoTouch)
	UIEventListener.Get(self.groupAvatar).onClick = handler(self, self.onClick)
	UIEventListener.Get(self.imgQuiz_).onClick = handler(self, self.onQuizTouch)
end

function AllServerPlayerIcon:onVideoTouch()
	if not self.reportIDs_ or not self.reportIDs_[1] then
		return
	end

	xyd.WindowManager:get():openWindow("arena_3v3_record_detail_window", {
		isAsAfter = true,
		report_ids = self.reportIDs_,
		model = xyd.models.arenaAllServerNew
	})
end

function AllServerPlayerIcon:onQuizTouch()
	if not self.canTouchQuiz_ then
		return
	end

	xyd.WindowManager.get():openWindow("arena_all_server_quiz_window")
end

function AllServerPlayerIcon:setInfo(playerInfo, params)
	self.playerID_ = playerInfo.player_id

	NGUITools.DestroyChildren(self.groupAvatar.transform)

	local playerIcon = PlayerIcon.new(self.groupAvatar)

	playerIcon:setInfo({
		noClick = true,
		lev = playerInfo.lev,
		avatarID = playerInfo.avatar_id,
		avatar_frame_id = playerInfo.avatar_frame_id
	})

	self.playerIcon = playerIcon
	self.labelName.text = playerInfo.player_name

	if playerInfo.guild_name and playerInfo.guild_name ~= "" then
		self.labelGuildName.text = "[" .. tostring(playerInfo.guild_name) .. "]"
	else
		self.labelGuildName.text = __("ARENA_ALL_SERVER_TEXT_14")
		self.labelGuildName.color = Color.New2(2290583551)
	end

	if params and params.show_video then
		self.btnVideo:SetActive(true)
	end

	if params and params.report_ids then
		self.reportIDs_ = params.report_ids
	end

	if params and params.is_quiz then
		self.isQuiz_ = true
	end

	if params and params.show_quiz then
		self.imgQuiz_:SetActive(true)

		if params.show_effect then
			-- block empty
		end
	end

	if params then
		self.canTouchQuiz_ = params.canTouchQuiz
	end

	if params and params.type then
		self:setType(params.type)
	end

	if params and params.noClick then
		xyd.setTouchEnable(self.groupAvatar, false)
	end

	if params and params.zone then
		self.zone = params.zone
	end
end

function AllServerPlayerIcon:setNoClick(flag)
	xyd.setTouchEnable(self.groupAvatar, not flag)
end

function AllServerPlayerIcon:setType(type)
	if type == "s_106_2" then
		self.groupAvatar:SetLocalScale(0.93, 0.93, 1)
		self.labelName:Y(-134.2)
		self.labelGuildName:Y(-162.5)
	elseif type == "arena_all_server_final_small" then
		self.groupAvatar:SetLocalScale(0.8613, 0.8613, 1)

		self.labelName.fontSize = 22
		self.labelGuildName.fontSize = 20

		self.labelName:Y(-115)
		self.labelGuildName:Y(-140)
	end
end

function AllServerPlayerIcon:applyGrey()
	if self.playerIcon then
		self.playerIcon:setGrey(true)

		self.playerIcon.needFrameGrey = true
	end
end

function AllServerPlayerIcon:onClick()
	if self.playerID_ > 0 then
		xyd.WindowManager.get():openWindow("arena_all_server_formation_window", {
			add_friend = false,
			player_id = self.playerID_,
			battle_type = xyd.BattleType.ARENA_ALL_SERVER_DEF,
			model = xyd.models.arenaAllServerNew,
			zone_id = self.zone,
			is_quiz = self.isQuiz_
		})
	end
end

return AllServerPlayerIcon
