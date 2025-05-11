-- chunkname: @../../../Product/Bundles/Android/src/app/components/ChatNode.lua

local ChatNormalMsgItem = class("ChatNormalMsgItem", import(".BaseComponent"))
local PlayerIcon = import("app.components.PlayerIcon")
local ReportBtn = import("app.components.ReportBtn")
local EmotionGifTable = xyd.tables.emotionGifTable
local cjson = require("cjson")
local BASIC_HEIGHT = 135
local MAX_WIDTH = 342

ChatNormalMsgItem.clickType = 1

function ChatNormalMsgItem:ctor(parentGo)
	ChatNormalMsgItem.super.ctor(self, parentGo)

	self.chat_ = xyd.models.chat
	self.selfPlayer = xyd.models.selfPlayer
	self.backpack_ = xyd.models.backpack
end

function ChatNormalMsgItem:getPrefabPath()
	return "Prefabs/Components/chat_normal_msg_item"
end

function ChatNormalMsgItem:initUI()
	self.groupLeft = self.go:NodeByName("groupLeft").gameObject
	self.touchLayer_1 = self.groupLeft:NodeByName("touchLayer_1").gameObject
	self.playerIconNode1 = self.groupLeft:NodeByName("playerIcon1").gameObject
	self.groupTop1 = self.groupLeft:NodeByName("groupTop1").gameObject
	self.labelName1 = self.groupTop1:ComponentByName("labelName1", typeof(UILabel))
	self.groupIcons1 = self.groupTop1:NodeByName("groupIcons1").gameObject
	self.labelTime1 = self.groupLeft:ComponentByName("labelTime1", typeof(UILabel))
	self.groupMsg1 = self.groupLeft:NodeByName("groupMsg1").gameObject

	if self.clickType == 1 or self.clickType == 4 then
		self.groupMsg1Bg = self.groupMsg1:NodeByName("e:Image").gameObject
	end

	self.labelMsg1 = self.groupMsg1:ComponentByName("labelMsg1", typeof(UILabel))
	self.btnTranslate1 = self.groupLeft:NodeByName("btnTranslate1").gameObject
	self.img1 = self.groupLeft:NodeByName("img1").gameObject
	self.groupEmotion1 = self.groupLeft:NodeByName("groupEmotion1").gameObject
	self.GMGroup1 = self.groupTop1:NodeByName("GMGroup").gameObject
	self.GMBg1 = self.GMGroup1:ComponentByName("bg", typeof(UISprite))
	self.GMlabel1 = self.GMGroup1:ComponentByName("label", typeof(UILabel))

	self.GMGroup1:SetActive(false)

	self.ServerGroup1 = self.groupTop1:NodeByName("ServerGroup").gameObject
	self.ServerLabel1 = self.ServerGroup1:ComponentByName("label", typeof(UILabel))

	self.ServerGroup1:SetActive(false)

	self.groupRight = self.go:NodeByName("groupRight").gameObject
	self.touchLayer_2 = self.groupRight:NodeByName("touchLayer_2").gameObject
	self.playerIconNode2 = self.groupRight:NodeByName("playerIcon2").gameObject
	self.groupTop2 = self.groupRight:NodeByName("groupTop2").gameObject
	self.labelName2 = self.groupTop2:ComponentByName("labelName2", typeof(UILabel))
	self.groupIcons2 = self.groupTop2:NodeByName("groupIcons2").gameObject
	self.labelTime2 = self.groupRight:ComponentByName("labelTime2", typeof(UILabel))
	self.groupMsg2 = self.groupRight:NodeByName("groupMsg2").gameObject
	self.labelMsg2 = self.groupMsg2:ComponentByName("labelMsg2", typeof(UILabel))
	self.img2 = self.groupRight:NodeByName("img2").gameObject
	self.groupEmotion2 = self.groupRight:NodeByName("groupEmotion2").gameObject
	self.GMGroup2 = self.groupTop2:NodeByName("GMGroup").gameObject
	self.GMBg2 = self.GMGroup2:ComponentByName("bg", typeof(UISprite))
	self.GMlabel2 = self.GMGroup2:ComponentByName("label", typeof(UILabel))

	self.GMGroup2:SetActive(false)

	self.ServerGroup2 = self.groupTop2:NodeByName("ServerGroup").gameObject
	self.ServerLabel2 = self.ServerGroup2:ComponentByName("label", typeof(UILabel))

	self.ServerGroup2:SetActive(false)
	self:initEmotionUI()
	self:initChatImgUI()
end

function ChatNormalMsgItem:initEmotionUI()
	self.groupGif1 = self.groupEmotion1:NodeByName("groupGif1").gameObject
	self.imgGif1 = self.groupEmotion1:ComponentByName("imgGif1", typeof(UISprite))
	self.btnTranslate2 = self.groupEmotion1:NodeByName("btnTranslate2").gameObject
	self.groupTranslate1 = self.groupEmotion1:NodeByName("groupTranslate1").gameObject
	self.labelTranslate1 = self.groupTranslate1:ComponentByName("labelTranslate1", typeof(UILabel))
	self.groupGif2 = self.groupEmotion2:NodeByName("groupGif2").gameObject
	self.imgGif2 = self.groupEmotion2:ComponentByName("imgGif2", typeof(UISprite))
	self.btnTranslate3 = self.groupEmotion2:NodeByName("btnTranslate3").gameObject
	self.groupTranslate2 = self.groupEmotion2:NodeByName("groupTranslate2").gameObject
	self.labelTranslate2 = self.groupTranslate2:ComponentByName("labelTranslate2", typeof(UILabel))
end

function ChatNormalMsgItem:initChatImgUI()
	self.groupImg1 = self.groupLeft:NodeByName("groupImg1").gameObject
	self.groupImg2 = self.groupRight:NodeByName("groupImg2").gameObject
	self.chatImg1 = self.groupImg1:ComponentByName("chatImg1", typeof(UITexture))
	self.chatImg2 = self.groupImg2:ComponentByName("chatImg2", typeof(UITexture))
end

function ChatNormalMsgItem:setInfo(params)
	self.needClock = true
	self.data = params
	self.itemHeight_ = 135

	self:layout()
	self:updateHeight()
end

function ChatNormalMsgItem:getHeight()
	return self.itemHeight_
end

function ChatNormalMsgItem:setScrollView(scrollView, grandfather)
	xyd.setDragScrollView(self.touchLayer_1, scrollView)
	xyd.setDragScrollView(self.touchLayer_2, scrollView)

	if self.groupMsg1Bg then
		xyd.setDragScrollView(self.groupMsg1Bg, scrollView)
	end

	xyd.setDragScrollView(self.labelMsg1, scrollView)
	xyd.setDragScrollView(self.labelName1, scrollView)

	self.scrollView_uipanel = scrollView:GetComponent(typeof(UIPanel))

	if self.chatImg1 then
		xyd.setDragScrollView(self.chatImg1, scrollView)
		xyd.setDragScrollView(self.chatImg2, scrollView)
	end

	UIEventListener.Get(self.touchLayer_1).onClick = function()
		grandfather.stopAutoMove_ = true
	end
	UIEventListener.Get(self.touchLayer_1).onDragStart = function(go)
		grandfather.stopAutoMove_ = true
	end
	UIEventListener.Get(self.touchLayer_1).onDragEnd = function(go)
		grandfather.stopAutoMove_ = false
	end
	UIEventListener.Get(self.touchLayer_2).onClick = function()
		grandfather.stopAutoMove_ = true
	end
	UIEventListener.Get(self.touchLayer_2).onDragStart = function(go)
		grandfather.stopAutoMove_ = true
	end
	UIEventListener.Get(self.touchLayer_2).onDragEnd = function(go)
		grandfather.stopAutoMove_ = false
	end
end

function ChatNormalMsgItem:updateShow(flag)
	if not self.needClock then
		return
	end

	self:SetActive(flag)

	local index = self:getIndex()
	local playIcon = self["playerIcon" .. tostring(index)]

	playIcon:updateEffectClock(flag)

	if self.is_award then
		return
	end

	local group = self["groupEmotion" .. tostring(index)]

	if group["$children"].length > 0 then
		local gif = group:getChildAt(0)

		if gif.name == "gif" then
			if flag then
				gif:addToClock()
			else
				gif:removeClock()
			end
		end
	end
end

function ChatNormalMsgItem:getIndex()
	local index = self.data.sender_id == xyd.Global.playerID and 2 or 1

	return index
end

function ChatNormalMsgItem:layout()
	local index = self:getIndex()

	self.groupLeft:SetActive(false)
	self.groupRight:SetActive(false)

	if index == 1 then
		self.groupLeft:SetActive(true)
	else
		self.groupRight:SetActive(true)
	end

	local labelName = self["labelName" .. tostring(index)]
	local labelTime = self["labelTime" .. tostring(index)]
	local labelMsg = self["labelMsg" .. tostring(index)]
	local groupIcons = self["groupIcons" .. tostring(index)]

	self.labelMsg = labelMsg

	local tLabelStr = self:getLabelName()

	if tLabelStr == "InValid" then
		return
	end

	labelName.text = tLabelStr

	self["groupMsg" .. tostring(index)]:SetActive(true)
	self["img" .. tostring(index)]:SetActive(true)

	local groupEmotion = self["groupEmotion" .. tostring(index)]

	groupEmotion:SetActive(false)

	if self["groupImg" .. tostring(index)] then
		self["groupImg" .. tostring(index)]:SetActive(false)
	end

	self.GMGroup1:SetActive(false)
	self.GMGroup2:SetActive(false)
	self.ServerGroup1:SetActive(false)
	self.ServerGroup2:SetActive(false)
	self:setLabelTime(labelTime)
	self:setLabelMsg()
	self:setPlayIconInfo()
	self:initIcons(groupIcons)
	self:initGM(index)
	self:addPlayIconCopyEvent()

	if index == 1 and self.groupMsg1 and self.clickType == 1 then
		UIEventListener.Get(self.groupMsg1Bg).onClick = function()
			self:creatReportBtn()
		end
	end

	UIEventListener.Get(self["touchLayer_" .. index]).onClick = handler(self, self.updateMainReport)

	self:updateAnchors()
	self:waitForFrame(1, function()
		self.groupTop1:GetComponent(typeof(UILayout)):Reposition()
		self.groupTop2:GetComponent(typeof(UILayout)):Reposition()
	end, nil)

	if self.reportBtn and self.reportBtn.timeData_ ~= self.data.time then
		self.reportBtn:SetActive(false)
	elseif self.reportBtn then
		self.reportBtn:SetActive(true)
	end
end

function ChatNormalMsgItem:addNameCopyEvent()
	local index = self:getIndex()

	if index ~= 1 or self.isInitNameEvent_ then
		return
	end

	self.isInitNameEvent_ = true

	local labelName = self.labelName1

	if not labelName:GetComponent(typeof(UnityEngine.BoxCollider)) then
		labelName:AddComponent(typeof(UnityEngine.BoxCollider))
	end

	labelName.autoResizeBoxCollider = true

	labelName:ResizeCollider()

	UIEventListener.Get(labelName.gameObject).onClick = function()
		xyd.SdkManager.get():copyToClipboard(labelName.text)
		xyd.showToast(__("COPY_SELF_ID_SUCCESSFUL"))
	end
end

function ChatNormalMsgItem:addPlayIconCopyEvent()
	local index = self:getIndex()

	if index ~= 1 or not self.playIcon then
		return
	end

	local labelName = self.labelName1.text

	self.playIcon:setLongPressListener(function()
		xyd.SdkManager.get():copyToClipboard(labelName)
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.COPY_PLAYER_NAME,
			data = {
				text = labelName
			}
		})
	end)
end

function ChatNormalMsgItem:getLabelName()
	return self.data.sender_name or ""
end

function ChatNormalMsgItem:getTimeNum()
	return self.data.time
end

function ChatNormalMsgItem:setLabelTime(labelTime)
	local timeNum = self:getTimeNum()
	local dateInfo = os.date("*t", timeNum)
	local hour = xyd.checkCondition(dateInfo.hour < 10, "0" .. tostring(dateInfo.hour), dateInfo.hour)
	local min = xyd.checkCondition(dateInfo.min < 10, "0" .. tostring(dateInfo.min), dateInfo.min)
	local month = xyd.checkCondition(dateInfo.month < 10, "0" .. tostring(dateInfo.month), dateInfo.month)
	local day = xyd.checkCondition(dateInfo.day < 10, "0" .. tostring(dateInfo.day), dateInfo.day)

	labelTime.text = "[ " .. tostring(hour) .. ":" .. tostring(min) .. " " .. tostring(month) .. "/" .. tostring(day) .. " ]"
end

function ChatNormalMsgItem:updateHeight()
	local tmpHeight = BASIC_HEIGHT
	local h = self.labelMsg.height
	local w = self.labelMsg.width
	local index = self:getIndex()

	if self["groupMsg" .. tostring(index)].activeSelf == true then
		tmpHeight = tmpHeight + h - 24
	end

	if self:isEmoMsg() or self:isGifMsg() then
		tmpHeight = tmpHeight + 50
	elseif self:isChatImg() then
		tmpHeight = tmpHeight + self:getImgDeltaH()
	end

	self.itemHeight_ = tmpHeight
end

function ChatNormalMsgItem:updateAnchors(rect)
	local index = self:getIndex()
	local labelBg = self["groupMsg" .. tostring(index)]:NodeByName("e:Image").gameObject
	local btnTranslate1
	local objs = {
		labelBg,
		self.btnTranslate1
	}

	if self["groupImg" .. tostring(index)] then
		local imgBg = self["groupImg" .. tostring(index)]:NodeByName("e:Image").gameObject

		table.insert(objs, imgBg)
	end

	for i = 1, #objs do
		if objs[i] then
			local rect = objs[i]:GetComponent(typeof(UIRect))

			if rect then
				rect:ResetAnchors()
			end
		end
	end
end

function ChatNormalMsgItem:creatReportBtn()
	local chat_gm_window = xyd.WindowManager.get():getWindow("chat_gm_window")

	if chat_gm_window then
		return
	end

	if self.reportBtn then
		self:updateMainReport()

		return
	end

	local params = {
		open_type = 1,
		data = self.data,
		time = self.data.time
	}

	self.reportBtn = ReportBtn.new(self.labelName1.gameObject, params)

	self.reportBtn:SetActive(true)
	self.reportBtn:setPosition(nil, Vector3(80, 5, 0))
	self:updateMainReport(true)
end

function ChatNormalMsgItem:updateMainReport(update)
	local wnd = xyd.WindowManager:get():getWindow("chat_window")

	if wnd then
		if update then
			wnd:updateReportItem(self, self.data.time)
		else
			wnd:updateReportItem()
		end
	end
end

function ChatNormalMsgItem:removeReportBtn()
	if self.reportBtn then
		NGUITools.Destroy(self.reportBtn:getGameObject())

		self.reportBtn = nil
	end
end

function ChatNormalMsgItem:onRegister()
	if self.btnTranslate1 then
		UIEventListener.Get(self.btnTranslate1).onClick = handler(self, self.onTranslate)
	end
end

function ChatNormalMsgItem:onTranslate()
	if self.data.inTransl then
		xyd.alert(xyd.AlertType.TIPS, __("CHAT_TRANSLATEING"))

		return
	end

	self.data.showTransl = not self.data.showTransl

	if self.data.showTransl then
		self.data.inTransl = true
		self.data.originalContent = self.data.content
		self.data.content = xyd.models.acDFA:preTraslation(self.data.content)

		self.chat_:translateFrontend(self.data, function(msg, type)
			if type == xyd.TranslateType.DOING then
				xyd.alert(xyd.AlertType.TIPS, __("CHAT_TRANSLATEING"))
			else
				self.data.inTransl = false

				if tolua.isnull(self.labelMsg1) then
					return
				end

				local labelMsg = self.labelMsg1

				labelMsg.text = msg.translate
				self.data.content = xyd.checkCondition(self.data.originalContent, self.data.originalContent, self.data.content)

				local win = xyd.WindowManager.get():getWindow("chat_window")

				if win then
					win.chatPage_:refreshAll(true)
				end
			end
		end)
	else
		local labelMsg = self.labelMsg1

		self.data.content = xyd.checkCondition(self.data.originalContent, self.data.originalContent, self.data.content)
		labelMsg.text = self.data.content

		local win = xyd.WindowManager.get():getWindow("chat_window")

		if win then
			win.chatPage_:refreshAll(true)
		end
	end
end

function ChatNormalMsgItem:setPlayIconInfo()
	local index = self:getIndex()
	local playIconNode = self["playerIconNode" .. tostring(index)]
	local playIcon = self.playIcon

	if not playIcon then
		local scrollerPanel
		local chat_window = xyd.WindowManager.get():getWindow("chat_window")

		if chat_window then
			scrollerPanel = chat_window:getScrollerUiPanel()
		end

		playIcon = PlayerIcon.new(playIconNode, scrollerPanel)
		self.playIcon = playIcon
	else
		self.playIcon:changeParent(playIconNode)
	end

	playIcon:setInfo({
		avatarID = self.data.avatar_id,
		lev = self.data.sender_level,
		avatar_frame_id = self.data.avatar_frame_id,
		callback = function()
			if self.data.sender_id ~= xyd.Global.playerID then
				xyd.WindowManager:get():openWindow("arena_formation_window", {
					is_robot = false,
					player_id = self.data.sender_id
				})
			end
		end
	})
end

function ChatNormalMsgItem:isEmoMsg()
	local content = self.data.content
	local isEmo = string.find(content, "#emotion")
	local emoNum = self.chat_:checkEmoLegal(content)

	return isEmo and emoNum ~= -1
end

function ChatNormalMsgItem:isGifMsg()
	local content = self.data.content
	local isGif = string.find(content, "#gif")
	local gifNum = self.chat_:checkGifLegal(content)

	return isGif and gifNum ~= -1
end

function ChatNormalMsgItem:isChatImg()
	local flag = self.data.msg_format and self.data.msg_format == "img"

	return flag
end

function ChatNormalMsgItem:setLabelMsg()
	self.labelMsg.overflowMethod = UILabel.Overflow.ResizeFreely

	self.labelMsg:ProcessText()

	local content = self.data.content

	if self:isEmoMsg() then
		local emoNum = self.chat_:checkEmoLegal(content)

		self:setImg(emoNum)
		self:registerTranslate(0, emoNum)
		self.btnTranslate1:SetActive(false)
	elseif self:isGifMsg() then
		local gifNum = self.chat_:checkGifLegal(content)

		self:setGif(gifNum)
		self:registerTranslate(1, gifNum)
		self.btnTranslate1:SetActive(false)
	elseif self:isChatImg() then
		local data = cjson.decode(content)

		self.labelMsg.text = ""

		self:setChatImg(data)
		self.btnTranslate1:SetActive(false)
	elseif self.data.msg_format and self.data.msg_format == "gm_auto_reply" then
		self.labelMsg.text = "[b]" .. content

		self:registetGMLink()
		self.btnTranslate1:SetActive(false)
	elseif self.data.msg_format and self.data.msg_format == "gm_recall" then
		self.labelMsg.text = "[b]" .. content

		self:registetGMLink2()
		self.btnTranslate1:SetActive(false)
	else
		self.labelMsg.text = "[b]" .. content

		if self.data.showTransl and not self.data.inTransl then
			self.labelMsg.text = "[b]" .. self.data.translate
		end

		self.btnTranslate1:SetActive(true)
	end

	self:updateLabelHeight()
end

function ChatNormalMsgItem:updateLabelHeight()
	if self.labelMsg.width > MAX_WIDTH then
		self.labelMsg.overflowMethod = UILabel.Overflow.ResizeHeight
		self.labelMsg.width = MAX_WIDTH

		self.labelMsg:ProcessText()
	end
end

function ChatNormalMsgItem:registerTranslate(type, index)
	local callback

	if type == 0 then
		function callback()
			if self.data.showTransl then
				return
			end

			if xyd.Global.lang == "zh_tw" then
				xyd.showToast(__("EMOTION_TRANSLATE_NEEDNOT_TEXT"))

				return
			end

			self.data.showTransl = true

			if index ~= nil then
				local lab = self["labelTranslate" .. tostring(self:getIndex())]

				lab.text = "[b]" .. xyd.tables.emotionTextTable:getWords(index)

				self["groupTranslate" .. tostring(self:getIndex())]:SetActive(true)
			end
		end
	elseif type == 1 then
		function callback()
			if self.data.showTransl then
				return
			end

			if xyd.Global.lang == "zh_tw" then
				xyd.showToast(__("EMOTION_TRANSLATE_NEEDNOT_TEXT"))

				return
			end

			self.data.showTransl = true

			if index ~= nil then
				local lab = self["labelTranslate" .. tostring(self:getIndex())]

				lab.text = "[b]" .. xyd.tables.gifTextTable:getWords(index)

				if lab.width > 278 then
					lab.width = 278
				end

				self["groupTranslate" .. tostring(self:getIndex())]:SetActive(true)
			end
		end
	end

	local type_index = self:getIndex()
	local btn

	if type_index == 2 then
		btn = self.btnTranslate3
	else
		btn = self.btnTranslate2
	end

	UIEventListener.Get(btn).onClick = callback
end

function ChatNormalMsgItem:registetGMLink()
	if self.data.msg_format and self.data.msg_format == "gm_auto_reply" then
		xyd.setTouchEnable(self.labelMsg, true)

		UIEventListener.Get(self.labelMsg.gameObject).onClick = function()
			local pos = xyd.getLastWorldPos()
			local url = self.labelMsg:GetUrlAtPosition(pos)

			if url then
				local recallType = string.sub(url, -2, -2)
				local gmMsgType = tonumber(recallType)

				self.chat_:createAutoGMReplyDetail(gmMsgType)
			end
		end
	end
end

function ChatNormalMsgItem:registetGMLink2()
	if self.data.msg_format and self.data.msg_format == "gm_recall" then
		xyd.setTouchEnable(self.labelMsg, true)

		UIEventListener.Get(self.labelMsg.gameObject).onClick = function()
			local pos = xyd.getLastWorldPos()
			local url = self.labelMsg:GetUrlAtPosition(pos)

			if url then
				local winName = string.sub(url, 2, -2)

				if winName and tostring(winName) then
					xyd.WindowManager.get():openWindow(winName, {})
				end
			end
		end
	end
end

function ChatNormalMsgItem:setGif(gifIndex)
	local index = self:getIndex()

	self["groupMsg" .. tostring(index)]:SetActive(false)
	self["img" .. tostring(index)]:SetActive(false)

	local groupEmotion = self["groupEmotion" .. tostring(index)]

	groupEmotion:SetActive(true)

	local can_use = EmotionGifTable:getIsShow(tonumber(gifIndex))

	self.is_award = EmotionGifTable:getIsAward(tonumber(gifIndex))

	local is_award = EmotionGifTable:getIsAward(tonumber(gifIndex))
	local group = self["groupGif" .. tostring(index)]
	local curLang = xyd.Global.lang == "zh_tw" and "zh_tw" or "en_en"
	local name = xyd.tables.emotionGifTable:getGif(gifIndex)
	local imgGif = self["imgGif" .. index]

	if can_use == 1 and name and name ~= "" then
		imgGif:SetActive(false)

		if self.gif then
			self.gif:destroy()

			self.gif = nil
		end

		local gifItem = self.groupLeft.gameObject

		if index == 2 then
			gifItem = self.groupRight.gameObject
		end

		local offest = Vector2(30, 0)
		local offset1 = Vector4(0, 0, 20, 0)
		local height = 285
		local win = xyd.WindowManager.get():getWindow("chat_window")

		if win then
			local curSelect = win:getCurSelect()

			if curSelect == xyd.MsgType.PRIVATE then
				offest = Vector2(40, -10)
				offset1 = Vector4(0, 0, 20, 0)
				height = 260
			end
		end

		if self.gif == nil then
			self.gif = xyd.Spine.new(group)
		end

		self.gif:setInfo(name, function()
			self.gifSender_ = self.data.sender_id

			self.gif:setRenderTarget(group:GetComponent(typeof(UITexture)), 1)
			self.gif:setRenderPanel(self.scrollView_uipanel)
			self.gif:setClipAreaWithScroller(self.scrollView_uipanel.gameObject, gifItem, height, offset1, offest)
			self.gif:play("texiao01_" .. tostring(curLang), 0, 1, nil)

			local scale = EmotionGifTable:getScale(gifIndex)

			self.gif:SetLocalScale(scale, scale, scale)

			local delta = EmotionGifTable:getGifPos(gifIndex)

			if not delta[1] then
				delta[1] = 0
			end

			if not delta[2] then
				delta[2] = 0
			end

			self.gif:SetLocalPosition(0 + delta[2], -40, 0)
			group:SetActive(true)
		end, true)
	else
		local path_ = tostring(EmotionGifTable:getImg(gifIndex)) .. "_" .. tostring(curLang)

		xyd.setUISpriteAsync(self["imgGif" .. index], nil, path_)
		imgGif:SetActive(true)
	end

	if self.btnTranslate1 then
		self.btnTranslate1:SetActive(false)
	end

	if self.data.showTransl then
		self["labelTranslate" .. tostring(index)].text = "[b]" .. xyd.tables.gifTextTable:getWords(gifIndex)

		self["groupTranslate" .. tostring(index)]:SetActive(true)
	else
		self["groupTranslate" .. tostring(index)]:SetActive(false)
	end
end

function ChatNormalMsgItem:setImg(emotionIndex)
	local index = self:getIndex()

	self["groupMsg" .. tostring(index)]:SetActive(false)
	self["img" .. tostring(index)]:SetActive(false)

	local imgGif = self["imgGif" .. index]
	local groupEmotion = self["groupEmotion" .. tostring(index)]

	if self.gif then
		self.gif:destroy()
	end

	self["groupGif" .. tostring(index)]:SetActive(false)
	groupEmotion:SetActive(true)

	local curLang = xyd.Global.lang == "zh_tw" and "zh_tw" or "en_en"
	local path_ = tostring(xyd.tables.emotionTable:getImg(emotionIndex)) .. "_" .. tostring(curLang)

	xyd.setUISpriteAsync(imgGif, nil, path_)
	imgGif:SetActive(true)

	if self.btnTranslate1 then
		self.btnTranslate1:SetActive(false)
	end

	if self.data.showTransl then
		self["labelTranslate" .. tostring(index)].text = "[b]" .. xyd.tables.emotionTextTable:getWords(emotionIndex)

		self["groupTranslate" .. tostring(index)]:SetActive(true)
	else
		self["groupTranslate" .. tostring(index)]:SetActive(false)
	end
end

function ChatNormalMsgItem:setChatImg(data)
	local index = self:getIndex()

	if self.btnTranslate1 then
		self.btnTranslate1:SetActive(false)
	end

	if self.btnTranslate2 then
		self.btnTranslate2:SetActive(false)
	end

	if self.btnTranslate3 then
		self.btnTranslate3:SetActive(false)
	end

	self["groupMsg" .. tostring(index)]:SetActive(false)

	local parentNode = self["groupImg" .. index]

	parentNode:SetActive(true)

	local tex = self["chatImg" .. index]
	local maxHeight = 400
	local maxWidth = 300
	local curWidth = data.width
	local curHeight = data.height

	if maxWidth < curWidth then
		curWidth = maxWidth
		curHeight = math.floor(maxWidth / data.width * curHeight)
	end

	if maxHeight < curHeight then
		curWidth = math.floor(maxHeight / curHeight * curWidth)
		curHeight = maxHeight
	end

	self.curImgHeight = curHeight

	xyd.setTextureByURL(data.img, tex, curWidth, curHeight, function()
		tex.width = curWidth
		tex.height = curHeight

		tex:ResizeCollider()
	end)

	UIEventListener.Get(tex.gameObject).onClick = function()
		xyd.openWindow("show_web_img_window", {
			url = data.img,
			width = data.width,
			height = data.height
		})
	end
end

function ChatNormalMsgItem:getImgDeltaH()
	if self.curImgHeight then
		return self.curImgHeight - 35
	end

	return 365
end

function ChatNormalMsgItem:initIcons(parent)
	NGUITools.DestroyChildren(parent.transform)
	parent:SetActive(false)

	if self.data.show_vip == 1 and self.data.sender_vip > 0 then
		parent:SetActive(true)

		local group = NGUITools.AddChild(parent, "group")
		local wd = group:AddComponent(typeof(UIWidget))
		local img = NGUITools.AddChild(group, "img")
		local sp = img:AddComponent(typeof(UISprite))

		xyd.setUISpriteAsync(sp, nil, "vip_icon", function()
			sp:MakePixelPerfect()
		end)

		wd.height = sp.height
		wd.width = sp.width

		local group2 = NGUITools.AddChild(parent, "group2")
		local wd2 = group2:AddComponent(typeof(UIWidget))

		wd2.height = 20
		wd2.width = 36 + 12 * tostring(math.floor(self.data.sender_vip / 10))

		local ly2 = group2:AddComponent(typeof(UILayout))

		ly2.gap = Vector2(-2, 0)

		ly2:Reposition()

		local img2 = NGUITools.AddChild(group2, "img2")
		local sp2 = img2:AddComponent(typeof(UISprite))

		xyd.setUISpriteAsync(sp2, nil, "vip_text_abbr", function()
			sp2:MakePixelPerfect()
		end)

		if self.data.sender_vip >= 10 then
			local vip1 = NGUITools.AddChild(group2, "vip1"):AddComponent(typeof(UISprite))

			xyd.setUISpriteAsync(vip1, nil, "player_vip_num_" .. tostring(math.floor(self.data.sender_vip / 10)), function()
				vip1:MakePixelPerfect()
			end)

			local vip2 = NGUITools.AddChild(group2, "vip2"):AddComponent(typeof(UISprite))

			xyd.setUISpriteAsync(vip2, nil, "player_vip_num_" .. tostring(self.data.sender_vip % 10), function()
				vip2:MakePixelPerfect()
			end)
		else
			local vip = NGUITools.AddChild(group2, "vip"):AddComponent(typeof(UISprite))

			xyd.setUISpriteAsync(vip, nil, "player_vip_num_" .. tostring(self.data.sender_vip), function()
				vip:MakePixelPerfect()
			end)
		end

		parent:GetComponent(typeof(UIWidget)).width = wd.width + wd2.width
		parent:GetComponent(typeof(UILayout)).gap = Vector2(2, 0)

		parent:GetComponent(typeof(UILayout)):Reposition()
	end
end

function ChatNormalMsgItem:initGM(index)
	local playerType = self.data.player_type
	local chat_gm_window = xyd.WindowManager.get():getWindow("chat_gm_window")

	if chat_gm_window and self.data.talker_id and self.data.player_id and self.data.talker_id ~= self.data.player_id then
		playerType = xyd.ChatPlayerType.GM
	end

	if playerType == xyd.ChatPlayerType.GM then
		self["GMGroup" .. index]:SetActive(true)

		self["GMlabel" .. index].text = __("CHAT_LABEL_1")

		if self.chat_:getGmInfo() then
			local chat_gm_window = xyd.WindowManager.get():getWindow("chat_gm_window")

			if chat_gm_window then
				self["GMlabel" .. index].text = __("GM_NAME_ONLY")
			end
		end

		xyd.setUISpriteAsync(self["GMBg" .. index], nil, "chat_icon_bg_" .. playerType .. "_png", function()
			return
		end)
	elseif playerType == xyd.ChatPlayerType.NOVICE_GUIDE then
		self["GMGroup" .. index]:SetActive(true)

		self["GMlabel" .. index].text = __("CHAT_LABEL_2")

		xyd.setUISpriteAsync(self["GMBg" .. index], nil, "chat_icon_bg_" .. playerType .. "_png", function()
			return
		end)
	end
end

local ChatCrossMsgItem = class("ChatCrossMsgItem", ChatNormalMsgItem)

function ChatCrossMsgItem:initIcons(parent)
	ChatCrossMsgItem.super.initIcons(self, parent)

	local index = self:getIndex()

	self["ServerGroup" .. index]:SetActive(true)

	self["ServerLabel" .. index].text = xyd.getServerNumber(self.data.server_id)
end

function ChatCrossMsgItem:setPlayIconInfo(playIcon)
	local index = self:getIndex()
	local playIconNode = self["playerIconNode" .. tostring(index)]
	local playIcon = self.playIcon

	if not playIcon then
		local scrollerPanel
		local chat_window = xyd.WindowManager.get():getWindow("chat_window")

		if chat_window then
			scrollerPanel = chat_window:getScrollerUiPanel()
		end

		playIcon = PlayerIcon.new(playIconNode, scrollerPanel)
		self.playIcon = playIcon
	else
		self.playIcon:changeParent(playIconNode)
	end

	playIcon:setInfo({
		avatarID = self.data.avatar_id,
		lev = self.data.sender_level,
		avatar_frame_id = self.data.avatar_frame_id,
		callback = function()
			if self.data.sender_id ~= xyd.Global.playerID then
				xyd.WindowManager:get():openWindow("arena_formation_window", {
					not_show_mail = true,
					add_friend = false,
					is_robot = false,
					player_id = self.data.sender_id,
					server_id = self.data.server_id
				})
			end
		end
	})
end

local ChatPrivateMsgItem = class("ChatPrivateMsgItem", ChatNormalMsgItem)

function ChatPrivateMsgItem:setPlayIconInfo(playIcon)
	local index = self:getIndex()
	local playIconNode = self["playerIconNode" .. tostring(index)]
	local playIcon = self.playIcon

	if not playIcon then
		playIcon = PlayerIcon.new(playIconNode, self.scrollView_uipanel)
		self.playIcon = playIcon
	else
		self.playIcon:changeParent(playIconNode)
	end

	playIcon:setInfo({
		avatarID = self.data.avatar_id,
		lev = self.data.sender_level,
		avatar_frame_id = self.data.avatar_frame_id,
		callback = function()
			if self.data.sender_id ~= xyd.Global.playerID then
				xyd.WindowManager:get():openWindow("arena_formation_window", {
					in_private = true,
					is_robot = false,
					player_id = self.data.sender_id
				})
			end
		end
	})
end

function ChatPrivateMsgItem:addPlayIconCopyEvent()
	return
end

local ChatRecuritMsgItem = class("ChatRecuritMsgItem", ChatNormalMsgItem)

ChatRecuritMsgItem.clickType = 2

function ChatRecuritMsgItem:ctor(parentGo)
	ChatRecuritMsgItem.super.ctor(self, parentGo)

	self.guildModel_ = xyd.models.guild
end

function ChatRecuritMsgItem:getPrefabPath()
	return "Prefabs/Components/chat_recurit_msg_item"
end

function ChatRecuritMsgItem:setInfo(info)
	self:parseInfo(info)
	ChatRecuritMsgItem.super.setInfo(self, info)
end

function ChatRecuritMsgItem:parseInfo(info)
	if not string.find(info.content, "guild_id") then
		self.guildID = nil
		self.text = ""

		return
	end

	local data = cjson.decode(info.content)

	self.guildID = tonumber(data.guild_id)
	self.text = data.text or ""
end

function ChatRecuritMsgItem:initUI()
	ChatRecuritMsgItem.super.initUI(self)

	self.btnJoin1 = self.groupMsg1:NodeByName("btnJoin1").gameObject
	self.imgMsgBg1 = self.groupLeft:ComponentByName("imgMsgBg1", typeof(UISprite))
	self.btnJoin2 = self.groupMsg2:NodeByName("btnJoin2").gameObject
	self.imgMsgBg2 = self.groupRight:ComponentByName("imgMsgBg2", typeof(UISprite))
end

function ChatRecuritMsgItem:initEmotionUI()
	return
end

function ChatRecuritMsgItem:initChatImgUI()
	return
end

function ChatRecuritMsgItem:onRegister()
	ChatRecuritMsgItem.super.onRegister(self)

	UIEventListener.Get(self.btnJoin1).onClick = handler(self, self.onClickJoin)
	UIEventListener.Get(self.btnJoin2).onClick = handler(self, self.onClickJoin)
end

function ChatRecuritMsgItem:onClickJoin()
	if not self.guildID then
		xyd.showToast(__("GUILD_TEXT10"))

		return
	end

	if self.guildModel_.guildID == self.guildID then
		xyd.showToast(__("GUILD_TEXT11"))

		return
	elseif self.guildModel_.guildID and self.guildModel_.guildID > 0 then
		xyd.showToast(__("GUILD_TEXT59"))

		return
	end

	if not xyd.checkFunctionOpen(xyd.FunctionID.GUILD) then
		return
	end

	local msg = messages_pb.get_info_by_guild_id_req()

	msg.guild_id = self.guildID

	xyd.Backend.get():request(xyd.mid.GET_INFO_BY_GUILD_ID, msg)
end

function ChatRecuritMsgItem:layout()
	ChatRecuritMsgItem.super.layout(self)

	local index = self:getIndex()

	self.btnJoin = self["btnJoin" .. tostring(index)]
	self.btnJoin:ComponentByName("button_label", typeof(UILabel)).text = __("HERO_CHALLENGE_TEAM_TITLE")
end

function ChatRecuritMsgItem:setLabelMsg()
	self.labelMsg.overflowMethod = UILabel.Overflow.ResizeFreely

	self.labelMsg:ProcessText()

	self.labelMsg.text = self.text

	self:updateLabelHeight()
end

function ChatRecuritMsgItem:updateHeight()
	local tmpHeight = 176
	local h = self.labelMsg.height
	local w = self.labelMsg.width

	tmpHeight = tmpHeight + h - 24
	self.itemHeight_ = tmpHeight
end

function ChatRecuritMsgItem:updateAnchors(rect)
	local index = self:getIndex()
	local labelWidth = self.labelMsg.width
	local labelBg = self["imgMsgBg" .. index]
	local groupMsg = self["groupMsg" .. index]
	local diret = xyd.checkCondition(index == 1, 1, -1)

	if labelWidth >= 186 then
		local delta = labelWidth - 186

		groupMsg:SetLocalPosition((-97 + delta / 2) * diret, -111, 0)

		labelBg.width = 216 + delta
	else
		labelBg.width = 216

		groupMsg:SetLocalPosition(-97 * diret, -111, 0)
	end

	local h = self.labelMsg.height

	labelBg.height = 134 + h - 24

	groupMsg:GetComponent(typeof(UILayout)):Reposition()
end

local ChatGMMsgItem = class("ChatGMMsgItem", ChatNormalMsgItem)

function ChatGMMsgItem:getLabelName()
	local isGm = self.data.talker_id <= xyd.GM_TALK_ID
	local labelName = ""

	if isGm then
		labelName = __("GM_NAME")

		if self.chat_:getGmInfo() then
			local chat_gm_window = xyd.WindowManager.get():getWindow("chat_gm_window")

			if chat_gm_window then
				labelName = self.chat_:getGmInfo().exclusive_name
			end
		end
	else
		labelName = self.data.talker_name or ""
	end

	return labelName
end

function ChatGMMsgItem:getTimeNum()
	return self.data.created_time
end

function ChatGMMsgItem:setPlayIconInfo()
	local index = self:getIndex()
	local playIconNode = self["playerIconNode" .. tostring(index)]
	local playIcon = self.playIcon

	if not playIcon then
		playIcon = PlayerIcon.new(playIconNode)
		self.playIcon = playIcon
	else
		self.playIcon:changeParent(playIconNode)
	end

	local avatarID = 0
	local lev = 0
	local avatarFrameId = 0

	if index == 2 then
		avatarID = self.selfPlayer:getAvatarID()
		lev = self.backpack_:getLev()
		avatarFrameId = self.selfPlayer:getAvatarFrameID()
	else
		avatarID = 51009

		if self.chat_:getGmInfo() then
			avatarID = xyd.tables.gmAvatarTable:getItemId(self.chat_:getGmInfo().avatar_id)
		end
	end

	playIcon:setInfo({
		noClick = true,
		avatarID = avatarID,
		lev = lev,
		avatar_frame_id = avatarFrameId
	})
end

function ChatGMMsgItem:getIndex()
	local index = self.data.talker_id <= xyd.GM_TALK_ID and 1 or 2

	return index
end

local ChatPartnerMsgItem = class("ChatPartnerMsgItem", ChatNormalMsgItem)
local Partner = import("app.models.Partner")

function ChatPartnerMsgItem:setInfo(info)
	local partnerInfo = cjson.decode(self.data.content)

	self.partner_ = Partner.new()

	self.partner_:populate(partnerInfo)
	ChatPartnerMsgItem.super.setInfo(self, info)
end

function ChatPartnerMsgItem:setLabelMsg()
	self.labelMsg.overflowMethod = UILabel.Overflow.ResizeFreely

	self.labelMsg:ProcessText()

	self.labelMsg.text = "[b]" .. "【" .. tostring(self.partner_:getName()) .. "】"

	self:updateLabelHeight()
end

function ChatPartnerMsgItem:onRegister()
	ChatPartnerMsgItem.super.onRegister(self)

	UIEventListener.Get(self.labelMsg).onClick = handler(self, self.onclickLabel)
end

function ChatPartnerMsgItem:onclickLabel()
	xyd.WindowManager:get():openWindow("partner_info", {
		partner = self.partner_
	})
end

local ChatGuildMsgItem = class("ChatGuildMsgItem", ChatNormalMsgItem)
local ChatGuildWarMsgItem = class("ChatGuildWarMsgItem", ChatRecuritMsgItem)

function ChatGuildWarMsgItem:parseInfo(info)
	local data = cjson.decode(info.content)

	self.guildID = tonumber(data.guild_id)
	self.text = __("GUILD_WAR_ENLIST_TEXT")
end

function ChatGuildWarMsgItem:onClickJoin()
	if not self.guildID then
		xyd.showToast(__("GUILD_TEXT10"))

		return
	end

	if not self.guildModel_.guildID then
		xyd.showToast(__("GUILD_TEXT10"))
	end

	if xyd.models.guildWar.info_.is_signed then
		if #xyd.models.guildWar:getDefFormation() > 0 then
			xyd.showToast(__("GUILD_WAR_CANNOT_CHANGE_TEAM"))

			return
		end
	else
		local moment = xyd.models.guildWar:judgeMoment()

		if moment > xyd.models.guildWar.MOMENT.BEFORE_FINAL then
			xyd.showToast(__("GUILD_WAR_RANK_MATCH_END"))

			return
		end
	end

	xyd.WindowManager:get():closeWindow("chat_window")

	local win = xyd.WindowManager:get():openWindow("guild_territory_window")

	if win then
		local win2 = xyd.WindowManager:get():openWindow("guild_war_info_window")

		if win2 then
			xyd.WindowManager:get():openWindow("battle_formation_window", {
				showSkip = false,
				battleType = xyd.BattleType.GUILD_WAR_DEF,
				mapType = xyd.MapType.GUILD_WAR
			})
		end
	end
end

function ChatGuildWarMsgItem:layout()
	ChatGuildWarMsgItem.super.layout(self)

	self.btnJoin:ComponentByName("button_label", typeof(UILabel)).text = __("SET_FORMATION")
end

local ChatFriendTeamBossMsgItem = class("ChatFriendTeamBossMsgItem", ChatNormalMsgItem)

function ChatFriendTeamBossMsgItem:updateMainReport(update)
	local wnd = xyd.WindowManager:get():getWindow("friend_team_boss_msg_window")

	if wnd then
		if update then
			wnd:updateReportItem(self)
		else
			wnd:updateReportItem()
		end
	end
end

local RemindFriendTeamBossMsgItem = class("RemindFriendTeamBossMsgItem", ChatNormalMsgItem)

function RemindFriendTeamBossMsgItem:updateMainReport(update)
	local wnd = xyd.WindowManager:get():getWindow("friend_team_boss_msg_window")

	if wnd then
		if update then
			wnd:updateReportItem(self)
		else
			wnd:updateReportItem()
		end
	end
end

function RemindFriendTeamBossMsgItem:layout()
	self.groupLeft:SetActive(false)
	self.groupRight:SetActive(true)
	self.labelName2:SetActive(false)
	self.groupTop2:SetActive(false)
	self.img2:SetActive(false)
	self.groupMsg2:SetActive(true)
	self.groupMsg2:NodeByName("e:Image"):SetActive(false)

	self.labelMsg = self.labelMsg2
	self.labelMsg.fontSize = 18

	if xyd.Global.lang == "zh_tw" then
		self.labelMsg.spacingY = 10
	else
		self.labelMsg.spacingY = 5
	end

	self.labelMsg.alignment = NGUIText.Alignment.Center
	self.labelMsg.pivot = UIWidget.Pivot.Top
	self.labelMsg.overflowMethod = UILabel.Overflow.ResizeHeight
	self.labelMsg.width = 440

	self.labelMsg:X(-self.groupMsg2.transform.localPosition.x)
	self.labelMsg:Y(40)
	self.GMGroup1:SetActive(false)
	self.GMGroup2:SetActive(false)
	self.ServerGroup1:SetActive(false)
	self.ServerGroup2:SetActive(false)
	self:setLabelTime(self.labelTime2)

	self.labelMsg.text = "[b]" .. self.data.content
end

function RemindFriendTeamBossMsgItem:updateHeight()
	self.itemHeight_ = self.labelMsg.transform.localPosition.y + 45
end

local ChatHouseShareMsgItem = class("ChatHouseShareMsgItem", ChatNormalMsgItem)

ChatHouseShareMsgItem.clickType = 3

function ChatHouseShareMsgItem:getPrefabPath()
	return "Prefabs/Components/chat_house_share_msg_item"
end

function ChatHouseShareMsgItem:reqHouseInfo()
	xyd.WindowManager.get():closeWindow("chat_window")

	if self.data.sender_id == xyd.Global.playerID then
		xyd.WindowManager.get():openWindow("house_window")
	else
		xyd.WindowManager.get():openWindow("house_visit_window", {
			other_player_id = self.data.sender_id
		})
	end
end

function ChatHouseShareMsgItem:onRegister()
	ChatHouseShareMsgItem.super.onRegister(self)

	UIEventListener.Get(self.btnVisit1).onClick = handler(self, self.reqHouseInfo)
	UIEventListener.Get(self.btnVisit2).onClick = handler(self, self.reqHouseInfo)
end

function ChatHouseShareMsgItem:initUI()
	ChatHouseShareMsgItem.super.initUI(self)

	self.btnVisit1 = self.groupMsg1:NodeByName("btnVisit1").gameObject
	self.btnVisit2 = self.groupMsg2:NodeByName("btnVisit2").gameObject
	self.houseImg1 = self.groupLeft:ComponentByName("houseImg1", typeof(UISprite))
	self.houseImg2 = self.groupRight:ComponentByName("houseImg2", typeof(UISprite))
	self.houseImgTex1 = self.groupLeft:ComponentByName("houseImgTex1", typeof(UITexture))
	self.houseImgTex2 = self.groupRight:ComponentByName("houseImgTex2", typeof(UITexture))
end

function ChatHouseShareMsgItem:initEmotionUI()
	return
end

function ChatHouseShareMsgItem:initChatImgUI()
	return
end

function ChatHouseShareMsgItem:updateAnchors()
	return
end

function ChatHouseShareMsgItem:layout()
	ChatHouseShareMsgItem.super.layout(self)

	local index = self:getIndex()

	self.btnVisit = self["btnVisit" .. tostring(index)]
	self.btnVisit:ComponentByName("button_label", typeof(UILabel)).text = __("HERO_CHALLENGE_TEAM_TITLE")
end

function ChatHouseShareMsgItem:setLabelMsg()
	local content = self.data.content
	local flag = string.find(content, "house_share_mark")

	if flag and self.chat_:checkHouseShareLegal(content) ~= -1 then
		local data = cjson.decode(content)

		self:setHouseShareImg(data)
	end

	self.labelMsg.overflowMethod = UILabel.Overflow.ResizeFreely

	self.labelMsg:ProcessText()

	self.labelMsg.text = __("HOUSE_TEXT_47")

	self:updateLabelHeight()
end

function ChatHouseShareMsgItem:setHouseShareImg(data)
	local index = self:getIndex()
	local img = self["houseImg" .. tostring(index)]
	local imgTex = self["houseImgTex" .. tostring(index)]
	local serverTime = xyd.getServerTime()

	if not self.data.time or serverTime - self.data.time > 604800 then
		img:SetActive(true)
		imgTex:SetActive(false)
	else
		img:SetActive(false)
		imgTex:SetActive(true)
		xyd.setTextureByURL(data.img, imgTex, data.width, data.height, nil, nil, xyd.HOUSE_IMG_SAVE_PATH, data.fileName)

		UIEventListener.Get(imgTex.gameObject).onClick = function()
			xyd.openWindow("show_web_img_window", {
				url = data.img,
				width = data.width,
				height = data.height
			})
		end
	end
end

function ChatHouseShareMsgItem:updateHeight()
	self.itemHeight_ = 385
end

local ChatNoticeGoMsgItem = class("ChatNoticeGoMsgItem", ChatGMMsgItem)

function ChatNoticeGoMsgItem:getLabelName()
	if self.data.talker_id then
		local isGm = self.data.talker_id <= xyd.GM_TALK_ID
		local labelName = ""

		if isGm then
			labelName = __("GM_NAME")
		else
			labelName = self.data.talker_name or ""
		end

		return labelName
	else
		return __("GM_NAME")
	end
end

function ChatNoticeGoMsgItem:setPlayIconInfo()
	local index = self:getIndex()
	local playIconNode = self["playerIconNode" .. tostring(index)]
	local playIcon = self.playIcon

	if not playIcon then
		playIcon = PlayerIcon.new(playIconNode)
		self.playIcon = playIcon
	else
		self.playIcon:changeParent(playIconNode)
	end

	local avatarID = 0
	local lev = 0
	local avatarFrameId = 0

	if index == 2 then
		avatarID = self.selfPlayer:getAvatarID()
		lev = self.backpack_:getLev()
		avatarFrameId = self.selfPlayer:getAvatarFrameID()
	else
		avatarID = 51009
	end

	playIcon:setInfo({
		noClick = true,
		avatarID = avatarID,
		lev = lev,
		avatar_frame_id = avatarFrameId
	})
end

function ChatNoticeGoMsgItem:getIndex()
	if self.data.talker_id then
		local index = self.data.talker_id <= xyd.GM_TALK_ID and 1 or 2

		return index
	else
		return 1
	end
end

function ChatNoticeGoMsgItem:getTimeNum()
	return self.data.time
end

function ChatNoticeGoMsgItem:setLabelMsg()
	self.labelMsg.overflowMethod = UILabel.Overflow.ResizeFreely

	self.labelMsg:ProcessText()

	local content = self.data.content

	self.labelMsg.text = "[b]" .. content .. "\n\n" .. __("NOTICE_GO")

	if self.data.showTransl and not self.data.inTransl then
		self.labelMsg.text = "[b]" .. self.data.translate
	end

	xyd.setTouchEnable(self.labelMsg, true)

	UIEventListener.Get(self.labelMsg.gameObject).onClick = function()
		local pos = xyd.getLastWorldPos()
		local url = self.labelMsg:GetUrlAtPosition(pos)

		if url and self.data.goto_type and self.data.goto_val then
			self:onWindowGo()
		end
	end

	self.btnTranslate1:SetActive(true)
	self:updateLabelHeight()
end

function ChatNoticeGoMsgItem:onWindowGo()
	local windowGoId = self:getWindowGoId(self.data.goto_type, self.data.goto_val)

	if not windowGoId or windowGoId < 0 then
		return
	end

	local windowGoTable = xyd.tables.windowGoTable
	local windowName = windowGoTable:getWindowName(windowGoId)
	local params = windowGoTable:getParams(windowGoId)
	local funcId = windowGoTable:getFunctionId(windowGoId)
	local activityId = windowGoTable:getActivityId(windowGoId)

	self:checkAndOpen(windowName, params, funcId, activityId)
end

function ChatNoticeGoMsgItem:getWindowGoId(type, value)
	local windowGoOperationMapTable = xyd.tables.windowGoOperationMapTable
	local ids = windowGoOperationMapTable:getIds()

	for i = 1, #ids do
		local id = ids[i]

		if windowGoOperationMapTable:getType(id) == tonumber(type) and windowGoOperationMapTable:getValue(id) == tonumber(value) then
			return windowGoOperationMapTable:getWindowGoId(id)
		end
	end

	return -1
end

function ChatNoticeGoMsgItem:checkAndOpen(winName, params, funID, activityId)
	if funID and funID > 0 and not xyd.checkFunctionOpen(funID) then
		return
	end

	if activityId and not xyd.models.activity:isOpen(activityId) then
		xyd.showToast(__("ACTIVITY_OPEN_TEXT"))

		return
	end

	if activityId == xyd.ActivityID.KAKAOPAY then
		local msg = messages_pb.log_partner_data_touch_req()

		msg.touch_id = xyd.DaDian.KAKAOPAY_MAIL_JUMP

		xyd.Backend.get():request(xyd.mid.LOG_PARTNER_DATA_TOUCH, msg)
	end

	xyd.WindowManager.get():openWindow(winName, params)
	xyd.closeWindow(self.name_)
	xyd.closeWindow("chat_window")
end

local ChatArcticSysMsgItem = class("ChatArcticSysMsgItem", ChatNormalMsgItem)

ChatArcticSysMsgItem.clickType = 4

function ChatArcticSysMsgItem:checkDataValid()
	if not self.data.e_msg_id then
		return false
	else
		return true
	end
end

function ChatArcticSysMsgItem:getLabelName()
	if not self:checkDataValid() then
		self.go:SetActive(false)

		return "InValid"
	end

	local isSys = self.data.e_msg_id <= 5
	local labelName = ""

	if isSys then
		labelName = xyd.tables.partnerTable:getName(54017)
	else
		labelName = self.data.sender_name or ""
	end

	return labelName
end

function ChatArcticSysMsgItem:checkPlayerIcon()
	local index = self:getIndex()
	local playIconNode = self["playerIconNode" .. tostring(index)]
	local playIcon = self.playIcon

	if not playIcon then
		local scrollerPanel
		local chat_window = xyd.WindowManager.get():getWindow("chat_window")

		if chat_window then
			scrollerPanel = chat_window:getScrollerUiPanel()
		end

		playIcon = PlayerIcon.new(playIconNode, scrollerPanel)
		self.playIcon = playIcon
	else
		self.playIcon:changeParent(playIconNode)
	end
end

function ChatArcticSysMsgItem:setPlayIconInfo()
	local index = self:getIndex()

	self:checkPlayerIcon()

	local playIcon = self.playIcon
	local avatarID = 0
	local lev = 0
	local avatarFrameId = 0

	if index == 2 then
		avatarID = self.selfPlayer:getAvatarID()
		lev = self.backpack_:getLev()
		avatarFrameId = self.selfPlayer:getAvatarFrameID()
	else
		avatarID = 54017
	end

	playIcon:setInfo({
		noClick = true,
		avatarID = avatarID,
		lev = lev,
		avatar_frame_id = avatarFrameId
	})
end

function ChatArcticSysMsgItem:setLabelMsg()
	self.labelMsg.overflowMethod = UILabel.Overflow.ResizeFreely

	self.labelMsg:ProcessText()

	local msgTable = xyd.tables.arcticExpeditionMessageTable
	local eMsgId = self.data.e_msg_id
	local content = self.data.content

	if type(content) == "string" then
		content = cjson.decode(content)
	end

	if not content or not next(content) then
		return
	end

	local contentTypes = msgTable:getConnectType(eMsgId)

	for i = 1, #content do
		if contentTypes[i] and next(contentTypes[i]) then
			local contentType = contentTypes[i]
			local jsonName = contentType[1]
			local keyName = contentType[2]
			local tableName = xyd.tables.arcticExpeditionEraTable:getArcticJson2Table(jsonName)

			if tableName then
				local val

				if jsonName == "translation" then
					if keyName == "arctic_expedition_group" then
						val = __(string.upper(keyName) .. "_" .. content[i] .. "_notNL")
					end
				else
					val = tableName:getString(content[i], keyName)

					if keyName == "cell_xy" then
						local xy = xyd.splitToNumber(val, "|")

						val = "(" .. xy[1] .. "," .. xy[2] .. ")"
					end
				end

				content[i] = val
			end
		end
	end

	local str = msgTable:getText(eMsgId, unpack(content))

	self.labelMsg.text = "[b]" .. str

	if self.data.showTransl and not self.data.inTransl then
		self.labelMsg.text = "[b]" .. self.data.translate
	end

	self.btnTranslate1:SetActive(false)
	self:updateLabelHeight()
end

local ChatArcticAssembleMsgItem = class("ChatArcticAssembleMsgItem", ChatArcticSysMsgItem)

function ChatArcticAssembleMsgItem:getPrefabPath()
	return "Prefabs/Components/chat_arctic_assemble_msg_item"
end

ChatArcticAssembleMsgItem.clickType = 5

function ChatArcticAssembleMsgItem:ctor(parentGo)
	ChatArcticAssembleMsgItem.super.ctor(self, parentGo)

	self.cellId = 0
end

function ChatArcticAssembleMsgItem:initUI()
	ChatArcticAssembleMsgItem.super.initUI(self)

	self.arcticImg1 = self.groupLeft:ComponentByName("arcticImg1", typeof(UISprite))
	self.arcticImg2 = self.groupRight:ComponentByName("arcticImg2", typeof(UISprite))
	self.labelPos1 = self.groupMsg1:ComponentByName("labelPos1", typeof(UILabel))
	self.labelPos2 = self.groupMsg2:ComponentByName("labelPos2", typeof(UILabel))
	self.btnVisit1 = self.groupMsg1:NodeByName("btnVisit1").gameObject
	self.btnVisit2 = self.groupMsg2:NodeByName("btnVisit2").gameObject

	xyd.setBtnLabel(self.btnVisit1, {
		text = __("GO")
	})
	xyd.setBtnLabel(self.btnVisit2, {
		text = __("GO")
	})
end

function ChatArcticAssembleMsgItem:onRegister()
	ChatArcticAssembleMsgItem.super.onRegister(self)

	UIEventListener.Get(self.btnVisit1).onClick = handler(self, self.gotoMap)
	UIEventListener.Get(self.btnVisit2).onClick = handler(self, self.gotoMap)
end

function ChatArcticAssembleMsgItem:gotoMap()
	if self.cellId <= 0 then
		return
	end

	local arcticWindow = xyd.getWindow("arctic_expedition_main_window")

	if arcticWindow then
		arcticWindow:jumpToCellPos(self.cellId, true)
		xyd.closeWindow("arctic_chat_window")
	end
end

function ChatArcticAssembleMsgItem:checkDataValid()
	if not self.data.e_msg_id then
		return false
	else
		return true
	end
end

function ChatArcticAssembleMsgItem:getLabelName()
	if not self:checkDataValid() then
		self.go:SetActive(false)

		return "InValid"
	end

	local labelName = self.data.sender_name or ""

	return labelName
end

function ChatArcticAssembleMsgItem:initEmotionUI()
	return
end

function ChatArcticAssembleMsgItem:initChatImgUI()
	return
end

function ChatArcticAssembleMsgItem:updateAnchors()
	return
end

function ChatArcticAssembleMsgItem:updateHeight()
	self.itemHeight_ = 330
end

function ChatArcticAssembleMsgItem:setPlayIconInfo()
	local index = self:getIndex()

	self:checkPlayerIcon()

	local playIcon = self.playIcon

	playIcon:setInfo({
		avatarID = self.data.avatar_id,
		lev = self.data.sender_level,
		avatar_frame_id = self.data.avatar_frame_id,
		callback = function()
			if self.data.sender_id ~= xyd.Global.playerID then
				xyd.WindowManager:get():openWindow("arena_formation_window", {
					is_robot = false,
					player_id = self.data.sender_id
				})
			end
		end
	})
end

function ChatArcticAssembleMsgItem:setLabelMsg()
	local index = self:getIndex()

	self.arcticImg = self["arcticImg" .. index]
	self.labelPos = self["labelPos" .. index]
	self.labelMsg.overflowMethod = UILabel.Overflow.ResizeFreely

	self.labelMsg:ProcessText()

	local content = self.data.content

	if type(content) == "string" then
		content = cjson.decode(content)
	end

	if not content or not next(content) then
		return
	end

	self.cellId = tonumber(content[1])

	local msgTable = xyd.tables.arcticExpeditionMessageTable
	local eMsgId = self.data.e_msg_id
	local xyVal = xyd.tables.arcticExpeditionCellsTable:getCellPos(self.cellId)
	local xyStr = "(" .. xyVal[1] .. "," .. xyVal[2] .. ")"
	local str = msgTable:getText(eMsgId, xyStr)
	local cellType = xyd.tables.arcticExpeditionCellsTable:getCellType(self.cellId)
	local cellImg = xyd.tables.arcticExpeditionCellsTypeTable:getIconImg(cellType)

	xyd.setUISpriteAsync(self.arcticImg, nil, cellImg)

	self.labelPos.text = "[b]" .. xyStr
	self.labelMsg.text = "[b]" .. str

	if self.data.showTransl and not self.data.inTransl then
		self.labelMsg.text = "[b]" .. self.data.translate
	end

	self.btnTranslate1:SetActive(false)
	self:updateLabelHeight()
end

local ChatNode = class("ChatNode")
local ITEM_GAP = 16

function ChatNode:ctor(go, index, parent)
	self.go_ = go
	self.parent_ = parent
	self.realIndex_ = index
	self.needFixPos_ = false
	self.oldRealIndex_ = self.realIndex_
	self.mTransform_ = go.transform
	self.uiWidget_ = go:GetComponent(typeof(UIWidget))
end

function ChatNode:setRealIndex(index)
	self.realIndex_ = index
	self.needFixPos_ = true
end

function ChatNode:getRealIndex()
	return self.realIndex_
end

function ChatNode:getOldRealIndex()
	return self.oldRealIndex_
end

function ChatNode:needFixPos()
	return self.needFixPos_
end

function ChatNode:fixPos(x, y, z)
	self.needFixPos_ = false

	self.mTransform_:SetLocalPosition(x, y, z)

	self.oldRealIndex_ = self.realIndex_
end

function ChatNode:getTopOffset()
	local finalClipRegion = self.parent_:getFinalClipRegion()
	local selfY = self.mTransform_.localPosition.y + self:getHeight()

	return selfY - finalClipRegion.y - finalClipRegion.w / 2
end

function ChatNode:getPos()
	return self.mTransform_.localPosition
end

function ChatNode:getGameObject()
	return self.go_
end

function ChatNode:getHeight()
	return self.uiWidget_.height
end

function ChatNode:getInfo()
	return self.parent_:getChatInfoByRealIndex(self.realIndex_)
end

function ChatNode:refresh()
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

	if self.realIndex_ == 1 and not self.parent_.firstItem_y then
		self.parent_.firstItem_y = self.uiScroll_.transform:InverseTransformPoint(self.go_.transform.position).y
	end

	local item

	if type_ == xyd.MsgType.NORMAL then
		item = self:initNormalMsg(info)
	elseif type_ == xyd.MsgType.GM then
		item = self:initGmMsg(info)
	elseif type_ == xyd.MsgType.SHARE_PARTNER then
		item = self:initPartnerMsg(info)
	elseif type_ == xyd.MsgType.GUILD then
		item = self:initGuildMsg(info)
	elseif type_ == xyd.MsgType.RECRUIT then
		item = self:initRecuritMsg(info)
	elseif type_ == xyd.MsgType.GUILD_WAR then
		xyd.models.guildWar:reqGuildWarInfo()

		item = self:initGuildWarMsg(info)
	elseif type_ == xyd.MsgType.PRIVATE then
		item = self:initPrivateMsgItem(info)
	elseif type_ == xyd.MsgType.CROSS_CHAT then
		item = self:initCrossMsg(info)
	elseif type_ == xyd.MsgType.FRIEND_TEAM_BOSS_CHAT then
		item = self:initFriendTeamBossMsg(info)
	elseif type_ == xyd.MsgType.FRIEND_TEAM_BOSS_REMIND then
		item = self:initFriendTeamBossRemindMsg(info)
	elseif type_ == xyd.MsgType.LOCAL_CHAT then
		item = self:initCrossMsg(info)
	elseif type_ == xyd.MsgType.NOTICE_WITH_JUMP then
		item = self:initNoticeGoMsg(info)
	elseif type_ == xyd.MsgType.HOUSE_SHARE_NORMAL or type_ == xyd.MsgType.HOUSE_SHARE_GUILD or type_ == xyd.MsgType.HOUSE_SHARE_CROSS_CHAT or type_ == xyd.MsgType.HOUSE_SHARE_LOCAL_CHAT then
		item = self:initHouseShareMsg(info)
	elseif type_ == xyd.MsgType.ARCTIC_EXPEDITION_ASSEMBLE then
		item = self:initArcticAssembleMsg(info)
	elseif type_ == xyd.MsgType.ARCTIC_EXPEDITION_SYS then
		item = self:initArcticSysMsg(info)
	elseif type_ == xyd.MsgType.ARCTIC_EXPEDITION_NORMAL then
		item = self:initNormalMsg(info)
	end

	self.oldType_ = type_
	self.item_ = item

	self:updateHeight()
end

function ChatNode:isShowingInPanel()
	if not self.go_ or tolua.isnull(self.go_) then
		return
	end

	local wrapIndex = tonumber(string.sub(self.go_.name, 6))
	local finalClipRegion = self.parent_:getFinalClipRegion()
	local selfY = self.mTransform_.localPosition.y

	return math.abs(selfY - finalClipRegion.y) <= finalClipRegion.w / 2 + 10
end

function ChatNode:onClipMove()
	local info = self:getInfo()

	if info == nil then
		return
	end

	local isShowing = self:isShowingInPanel()

	if isShowing then
		self.parent_:updateUnreadStatus(self.realIndex_)
	end
end

function ChatNode:updateHeight()
	local height = self.item_:getHeight()

	self.uiWidget_.height = height

	local info = self:getInfo()

	self.parent_:updateHeight(info.type, info.hashCode, height)
end

function ChatNode:initNormalMsg(info)
	local item = ChatNormalMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(info)

	return item
end

function ChatNode:initGmMsg(data)
	if data.talker_name == "GM" then
		data.player_type = xyd.ChatPlayerType.GM
	end

	local item = ChatGMMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initPartnerMsg(data)
	local item = ChatPartnerMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initGuildMsg(data)
	local item = ChatGuildMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initFriendTeamBossMsg(data)
	local item = ChatFriendTeamBossMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initFriendTeamBossRemindMsg(data)
	local item = RemindFriendTeamBossMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initRecuritMsg(data)
	local item = ChatRecuritMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initHouseShareMsg(data)
	local item = ChatHouseShareMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initGuildWarMsg(data)
	local item = ChatGuildWarMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initPrivateMsg(data)
	local item = ChatPrivateItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initCrossMsg(data)
	local item = ChatCrossMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initNoticeGoMsg(data)
	local item = ChatNoticeGoMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initPrivateMsgItem(data)
	local item = ChatPrivateMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initArcticAssembleMsg(data)
	local item = ChatArcticAssembleMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

function ChatNode:initArcticSysMsg(data)
	local item = ChatArcticSysMsgItem.new(self.go_)

	item:setScrollView(self.parent_:getScrollView(), self.parent_)
	item:setInfo(data)

	return item
end

return ChatNode
