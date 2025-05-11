-- chunkname: @../../../Product/Bundles/Android/src/app/components/HouseFriendListItem.lua

local HouseFriendListItem = class("HouseFriendListItem", import(".BaseComponent"))
local PlayerIcon = import("app.components.PlayerIcon")

function HouseFriendListItem:ctor(parentGo)
	HouseFriendListItem.super.ctor(self, parentGo)
end

function HouseFriendListItem:getPrefabPath()
	return "Prefabs/Components/house_friend_list_item"
end

function HouseFriendListItem:initUI()
	HouseFriendListItem.super.initUI(self)
	self:getUIComponent()
	self:layout()
end

function HouseFriendListItem:getUIComponent()
	self.btnVisit_ = self.go:NodeByName("btnVisit_").gameObject
	self.avatarGroup = self.go:NodeByName("avatarGroup").gameObject
	self.labelLevel = self.go:ComponentByName("e:Group/labelLevel", typeof(UILabel))
	self.labelPlayerName = self.go:ComponentByName("labelPlayerName", typeof(UILabel))
	self.labelPraiseNum = self.go:ComponentByName("labelPraiseNum", typeof(UILabel))
	self.imgPraise = self.go:ComponentByName("imgPraise", typeof(UISprite))

	xyd.setUISpriteAsync(self.imgPraise, nil, "house_praise1")
end

function HouseFriendListItem:layout()
	self.btnVisit_:ComponentByName("button_label", typeof(UILabel)).text = __("HOUSE_FRIEND_LIST_WINDOW")

	if xyd.Global.lang == "de_de" then
		self.btnVisit_:ComponentByName("button_label", typeof(UILabel)).fontSize = 23
	end

	UIEventListener.Get(self.btnVisit_).onClick = handler(self, self.onClick)
	self.playerIcon = PlayerIcon.new(self.avatarGroup)

	self.playerIcon:setScale(0.64)
end

function HouseFriendListItem:onClick()
	xyd.WindowManager.get():closeWindow("house_friend_list_window")
	xyd.WindowManager.get():closeWindow("house_window")

	local wnd = xyd.WindowManager.get():getWindow("house_visit_window")

	if wnd then
		xyd.WindowManager.get():closeWindow("house_visit_window", nil, nil, true)
	end

	xyd.WindowManager.get():openWindow("house_visit_window", {
		close_back_house = true,
		other_player_id = self.data.player_id
	})
end

function HouseFriendListItem:update(info)
	self.data = info
	self.labelPlayerName.text = self.data.player_name

	self.playerIcon:setInfo({
		avatarID = self.data.avatar_id,
		lev = self.data.lev,
		avatar_frame_id = self.data.avatar_frame_id,
		callback = function()
			if self.data.player_id ~= xyd.Global.playerID then
				xyd.WindowManager:get():openWindow("arena_formation_window", {
					add_friend = false,
					is_robot = false,
					player_id = self.data.player_id,
					server_id = self.data.server_id
				})
			end
		end
	})

	self.labelLevel.text = self.data.lev
	self.labelPraiseNum.text = self.data.like_num or 0
end

return HouseFriendListItem
