-- chunkname: @../../../Product/Bundles/Android/src/app/components/ChatPrivateItem.lua

local ChatPrivateItem = class("ChatPrivateItem")
local PlayerIcon = import("app.components.PlayerIcon")

function ChatPrivateItem:ctor(go, parent)
	self.go = go
	self.parent = parent

	xyd.setDragScrollView(go, parent.scrollView)
	self:initUI()
	self:registerEvent()

	self.chat_ = xyd.models.chat
end

function ChatPrivateItem:getGameObject()
	return self.go
end

function ChatPrivateItem:initUI()
	local playIconNode = self.go:NodeByName("playerIcon").gameObject

	self.labelTime = self.go:ComponentByName("labelTime", typeof(UILabel))
	self.labelMsg = self.go:ComponentByName("labelMsg", typeof(UILabel))
	self.labelName = self.go:ComponentByName("group/labelName", typeof(UILabel))
	self.serverGroup = self.go:NodeByName("group/serverGroup").gameObject
	self.labelServer = self.serverGroup:ComponentByName("labelServer", typeof(UILabel))
	self.redIcon_ = self.go:NodeByName("redIcon_").gameObject
	self.playerIcon = PlayerIcon.new(playIconNode)
end

function ChatPrivateItem:update(index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.data = info

	self.go:SetActive(true)
	self:updateInfo()
end

function ChatPrivateItem:updateInfo()
	self:setIcon()
	self:setLabelName()
	self:setLabelTime()
	self:setLabelMsg()
	self:setRedIcon()
	self:setServerID()
end

function ChatPrivateItem:updateShow(flag)
	self.visible = flag

	local index = self:getIndex()
	local playIcon = self.playerIcon

	playIcon:updateEffectClock(flag)
end

function ChatPrivateItem:getIndex()
	local index = self.data.sender_id == xyd.models.selfPlayer:getPlayerID() and 2 or 1

	return index
end

function ChatPrivateItem:setRedIcon()
	local tmpTime = tonumber(xyd.db.chat:getValue("private" .. tostring(self.data.player_id)))

	if tmpTime == nil then
		tmpTime = 0
	end

	if tmpTime < self.data.chat_msg.time and self.data.chat_msg.sender_id ~= xyd.Global.playerID then
		self.redIcon_:SetActive(true)

		self.chat_.redNum = self.chat_.redNum + 1

		self.chat_:setRedMark(xyd.MsgType.PRIVATE, true)
	else
		self.redIcon_:SetActive(false)
	end
end

function ChatPrivateItem:setIcon()
	self.playerIcon:setInfo({
		avatarID = self.data.avatar_id,
		lev = self.data.sender_level,
		avatar_frame_id = self.data.avatar_frame_id
	})
end

function ChatPrivateItem:setLabelName()
	self.labelName.text = self.data.player_name
end

function ChatPrivateItem:setLabelTime()
	local dateInfo = os.date("*t", self.data.chat_msg.time)
	local hour = xyd.checkCondition(dateInfo.hour < 10, "0" .. tostring(dateInfo.hour), dateInfo.hour)
	local min = xyd.checkCondition(dateInfo.min < 10, "0" .. tostring(dateInfo.min), dateInfo.min)
	local month = xyd.checkCondition(dateInfo.month < 10, "0" .. tostring(dateInfo.month), dateInfo.month)
	local day = xyd.checkCondition(dateInfo.day < 10, "0" .. tostring(dateInfo.day), dateInfo.day)

	self.labelTime.text = "[ " .. tostring(hour) .. ":" .. tostring(min) .. " " .. tostring(month) .. "/" .. tostring(day) .. " ]"
end

function ChatPrivateItem:setLabelMsg()
	local maxLen = 15

	if maxLen <= #self.data.chat_msg.content then
		self.labelMsg.text = string.sub(self.data.chat_msg.content, 1, maxLen) .. "..."
	else
		self.labelMsg.text = self.data.chat_msg.content
	end

	if self.chat_:checkIfGifOrEmo(self.data.chat_msg.content) then
		self.labelMsg.text = __("PRIVATE_EMOTION_MESSAGE")
	end
end

function ChatPrivateItem:setServerID()
	if self.data.server_id ~= xyd.models.selfPlayer:getServerID() then
		self.serverGroup:SetActive(true)

		self.labelServer.text = xyd.getServerNumber(self.data.server_id)
	else
		self.serverGroup:SetActive(false)
	end
end

function ChatPrivateItem:registerEvent()
	UIEventListener.Get(self.go).onClick = handler(self, self.onTouch)
end

function ChatPrivateItem:onTouch()
	xyd.models.arena:reqEnemyInfo(self.data.player_id)
	self.chat_:getPlayerMessages(self.data.player_id)

	if self.redIcon_.activeSelf == true then
		self.redIcon_:SetActive(false)

		self.chat_.redNum = self.chat_.redNum - 1
	end

	local win = xyd.WindowManager:get():getWindow("chat_window")

	if win then
		win.toPlayerId = self.data.player_id
		win.privateServerID = self.data.server_id

		win:setWarningVisible(self.data.player_id)

		win.reqIngEnemyInfo = true
	end

	if self.chat_.redNum == 0 then
		self.chat_:setRedMark(xyd.MsgType.PRIVATE, false)
	end
end

return ChatPrivateItem
