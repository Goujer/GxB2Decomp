-- chunkname: @../../../Product/Bundles/Android/src/app/components/ChatEmotionItem.lua

local EmotionItemRenderer = class("EmotionItemRenderer")

function EmotionItemRenderer:ctor(go, parent)
	self.go = go
	self.parent = parent

	self:initUI()
	self:registerEvent()
end

function EmotionItemRenderer:getGameObject()
	return self.go
end

function EmotionItemRenderer:initUI()
	for i = 1, 8 do
		self["item" .. i] = self.go:ComponentByName("item" .. i, typeof(UISprite))
	end
end

function EmotionItemRenderer:registerEvent()
	for i = 1, 8 do
		local img = self["item" .. i]

		UIEventListener.Get(img.gameObject).onClick = function()
			self:onclickImg(i)
		end

		xyd.setDragScrollView(img.gameObject, self.parent.scrollView)
	end
end

function EmotionItemRenderer:update(index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.data = info

	self.go:SetActive(true)
	self:updateInfo()
end

function EmotionItemRenderer:updateInfo()
	for i = 1, 8 do
		local itemInfo = self.data.group[i]
		local img = self["item" .. i]

		if itemInfo then
			xyd.setUISpriteAsync(img, nil, itemInfo.img)

			if itemInfo.isGrey then
				xyd.applyGrey(img)
			else
				xyd.applyOrigin(img)
			end

			img:SetActive(true)
		else
			img:SetActive(false)
		end
	end
end

function EmotionItemRenderer:onclickImg(index)
	self.data.parent:onclickImg(self.data.group[index])
end

local ChatEmotionItem = class("ChatEmotionItem")
local EmotionTable = xyd.tables.emotionTable
local EmotionGifTable = xyd.tables.emotionGifTable
local FixedWrapContent = import("app.common.ui.FixedWrapContent")
local MiscTable = xyd.tables.miscTable

function ChatEmotionItem:ctor(go)
	self.go = go
	self.picNum = EmotionTable:getLength()
	self.gifNum = EmotionGifTable:getLength()
	self.awardNum = #EmotionGifTable:getAwardIds()
	self.itemType = xyd.EmotionType.NORMAL
	self.backpack_ = xyd.models.backpack
	self.chat_ = xyd.models.chat
	self.action = nil
	self.btnNum = 3
	self.Btns = {}
	self.pics = {}
	self.touch_cnt = 0
	self.guildModel_ = xyd.models.guild

	self:initUI()
end

function ChatEmotionItem:initUI()
	self.chooseBtn0 = self.go:NodeByName("chooseBtn0").gameObject
	self.chooseBtn1 = self.go:NodeByName("chooseBtn1").gameObject
	self.chooseBtn2 = self.go:NodeByName("chooseBtn2").gameObject
	self.groupPoint0 = self.go:NodeByName("groupPoint0").gameObject
	self.groupPoint1 = self.go:NodeByName("groupPoint1").gameObject
	self.emoScrollerObj_ = self.go:NodeByName("emoScroller").gameObject

	local scrollView = self.go:ComponentByName("emoScroller", typeof(UIScrollView))
	local wrapContent = scrollView:ComponentByName("groupEmotions", typeof(UIWrapContent))
	local item = scrollView:NodeByName("item").gameObject

	self.wrapContent_ = FixedWrapContent.new(scrollView, wrapContent, item, EmotionItemRenderer, self)
	self.scrollView = scrollView

	self:setText()
	self:register()
	self:setBtn()
end

function ChatEmotionItem:setInfo(params)
	if params and params.type then
		self.itemType = params.type
	end

	self:layout()
end

function ChatEmotionItem:setBtn()
	if self.gifNum == 0 then
		self.chooseBtn0:SetActive(false)
		self.chooseBtn1:GetComponent(typeof(UIButton)):SetEnabled(false)
	end
end

function ChatEmotionItem:setText()
	self.chooseBtn0:ComponentByName("button_label", typeof(UILabel)).text = __("EMOTION_DEFAULT_TEXT")
	self.chooseBtn1:ComponentByName("button_label", typeof(UILabel)).text = __("EMOTION_DYNAMIC_TEXT")
	self.chooseBtn2:ComponentByName("button_label", typeof(UILabel)).text = __("PERSON_SPECIAL")
end

function ChatEmotionItem:updateBtns(chooseNum)
	for i = 0, self.btnNum - 1 do
		local uiBtn = self["chooseBtn" .. tostring(i)]:GetComponent(typeof(UIButton))
		local flag = true

		if i == chooseNum then
			flag = false
		end

		uiBtn:SetEnabled(flag)
	end
end

function ChatEmotionItem:layout(type)
	if type and type == self.itemType then
		return
	end

	if self.gifNum ~= 0 then
		self:updateBtns(self.itemType)
	end

	local num

	if self.itemType == xyd.EmotionType.NORMAL then
		num = self.picNum
	elseif self.itemType == xyd.EmotionType.GIF then
		num = self.gifNum
	elseif self.itemType == xyd.EmotionType.AWARD then
		num = self.awardNum
	end

	self.pages = math.ceil(num / 8)
	self.pics = {}

	NGUITools.DestroyChildren(self.groupPoint0.transform)
	NGUITools.DestroyChildren(self.groupPoint1.transform)

	for i = 1, self.pages do
		local img1 = NGUITools.AddChild(self.groupPoint0, "page" .. i)
		local sp = img1:AddComponent(typeof(UISprite))

		xyd.setUISprite(sp, nil, "emotbtn1")

		sp:GetComponent(typeof(UIWidget)).width = 16
		sp:GetComponent(typeof(UIWidget)).height = 16
		sp.depth = 2

		local img2 = NGUITools.AddChild(self.groupPoint1, "page_v" .. i)
		local sp2 = img2:AddComponent(typeof(UISprite))

		xyd.setUISprite(sp2, nil, "emotbtn2")

		sp2:GetComponent(typeof(UIWidget)).width = 16
		sp2:GetComponent(typeof(UIWidget)).height = 16
		sp2.depth = 3

		img2:SetActive(false)
		table.insert(self.pics, img2)
	end

	self.groupPoint0:GetComponent(typeof(UILayout)):Reposition()
	self.groupPoint1:GetComponent(typeof(UILayout)):Reposition()
	self.pics[1]:SetActive(true)

	self.posX = 0

	local tmp = 1
	local tmpGroup = {}
	local sourceArr = {}

	self.Btns = {}

	local curLang = xyd.Global.lang == "zh_tw" and "zh_tw" or "en_en"
	local oneGroupNum = 8

	if self.itemType == xyd.EmotionType.GIF then
		local ids = EmotionGifTable:getCanUseIds()

		for i = 1, self.gifNum do
			local id = ids[i]
			local gif = tostring(EmotionGifTable:getImg(id)) .. "_" .. tostring(curLang)

			table.insert(tmpGroup, {
				img = gif,
				id = id
			})

			if i % oneGroupNum == 0 then
				table.insert(sourceArr, {
					group = tmpGroup,
					parent = self
				})

				tmpGroup = {}
			end
		end
	elseif self.itemType == xyd.EmotionType.AWARD then
		local ids = EmotionGifTable:getAwardIds()

		for i = #ids, 1, -1 do
			local id = ids[i]
			local img = tostring(EmotionGifTable:getImg(id)) .. "_" .. tostring(curLang)
			local num = self.backpack_:getItemNumByID(EmotionGifTable:getItemId(id))

			table.insert(tmpGroup, {
				img = img,
				isGrey = num <= 0,
				id = id
			})

			if (self.awardNum - i + 1) % oneGroupNum == 0 then
				table.insert(sourceArr, {
					group = tmpGroup,
					parent = self
				})

				tmpGroup = {}
			end
		end
	else
		for i = 1, self.picNum do
			local img = tostring(EmotionTable:getImg(i)) .. "_" .. tostring(curLang)

			table.insert(tmpGroup, {
				img = img,
				id = i
			})

			if i % oneGroupNum == 0 then
				table.insert(sourceArr, {
					group = tmpGroup,
					parent = self
				})

				tmpGroup = {}
			end
		end
	end

	if #tmpGroup > 0 then
		table.insert(sourceArr, {
			group = tmpGroup,
			parent = self
		})
	end

	self.wrapContent_:setInfos(sourceArr, {})

	self.curPage_ = 1
end

function ChatEmotionItem:onclickImg(data)
	if not xyd.checkFunctionOpen(xyd.FunctionID.CHAT, true) then
		xyd.showToast(__("CHAT_LIMIT_TEXT01"))

		return
	end

	local id = data.id

	if self.itemType == xyd.EmotionType.NORMAL then
		self:sendEmo(id)
	elseif self.itemType == xyd.EmotionType.AWARD then
		local itemId = EmotionGifTable:getItemId(id)
		local num = self.backpack_:getItemNumByID(itemId)

		if num > 0 then
			self:sendEmo(id, true)
		else
			xyd.alert(xyd.AlertType.TIPS, __("EMOTICON_AWARD_TIPS", xyd.tables.gifTextTable:getAccess(id)))
		end
	else
		self:sendEmo(id, true)
	end
end

function ChatEmotionItem:register()
	self.scrollView.onDragStarted = handler(self, self.onDragStarted)
	self.scrollView.onDragFinished = handler(self, self.onDragFinished)

	for i = 0, self.btnNum - 1 do
		local btn = self["chooseBtn" .. tostring(i)]

		UIEventListener.Get(btn).onClick = function()
			self.itemType = i

			self:layout()
		end
	end
end

function ChatEmotionItem:onDragStarted()
	self.oldPos = self.wrapContent_:getScrollViewPos()
end

function ChatEmotionItem:onDragFinished()
	local newPos = self.wrapContent_:getScrollViewPos()
	local offX = newPos.x - self.oldPos.x

	if offX < -65 then
		if self.curPage_ < self.pages then
			self.pics[self.curPage_]:SetActive(false)

			self.curPage_ = self.curPage_ + 1
		end

		self.pics[self.curPage_]:SetActive(true)
	elseif offX > 65 then
		if self.curPage_ > 1 then
			self.pics[self.curPage_]:SetActive(false)

			self.curPage_ = self.curPage_ - 1
		end

		self.pics[self.curPage_]:SetActive(true)
	end

	local pos = Vector3(-300 - (self.curPage_ - 1) * 609, -23, 0)

	SpringPanel.Begin(self.emoScrollerObj_, pos, 8)
end

function ChatEmotionItem:sendEmo(i, dynamic)
	if dynamic == nil then
		dynamic = false
	end

	local win = xyd.WindowManager:get():getWindow("chat_window") or xyd.WindowManager:get():getWindow("chat_gm_window") or xyd.WindowManager:get():getWindow("friend_team_boss_msg_window") or xyd.WindowManager:get():getWindow("arctic_chat_window")

	if not win then
		return
	end

	local curSelect = win:getCurSelect()

	if self.chat_:getConfigByIndex(xyd.ChatConfig.SHOW_WORLD) == 0 and curSelect == xyd.MsgType.NORMAL then
		xyd.alert(xyd.AlertType.TIPS, __("CHAT_HIDE_WORLD"))

		return
	elseif self.chat_:getConfigByIndex(xyd.ChatConfig.SHOW_GUILD) == 0 and curSelect == xyd.MsgType.RECRUIT and self.guildModel_.guildID then
		xyd.alert(xyd.AlertType.TIPS, __("GUILD_TEXT09"))

		return
	elseif self.chat_:getConfigByIndex(xyd.ChatConfig.SHOW_CROSS) == 0 and curSelect == xyd.MsgType.CROSS_CHAT then
		xyd.alert(xyd.AlertType.TIPS, __("CHAT_HIDE_WORLD"))
	elseif self.chat_:getConfigByIndex(xyd.ChatConfig.SHOW_LOCAL) == 0 and curSelect == xyd.MsgType.LOCAL_CHAT then
		xyd.alert(xyd.AlertType.TIPS, __("CHAT_HIDE_LOCAL"))
	end

	local lev = MiscTable:getVal("talk_level")
	local cd = MiscTable:getVal("talk_cd")
	local guildCD = MiscTable:getVal("talk_guild_cd")
	local curCd

	if curSelect == xyd.MsgType.CROSS_CHAT then
		curCd = xyd.getServerTime() - self.chat_:getLastTalk(xyd.MsgType.CROSS_CHAT_EMOTION)
	elseif curSelect == xyd.MsgType.LOCAL_CHAT then
		curCd = xyd.getServerTime() - self.chat_:getLastTalk(xyd.MsgType.LOCAL_CHAT_EMOTION)
	else
		curCd = xyd.getServerTime() - self.chat_:getLastTalk(xyd.MsgType.EMOTION)
	end

	local tips
	local send_succeed = false

	if cd - curCd > 0 and (curSelect == xyd.MsgType.NORMAL or curSelect == xyd.MsgType.FRIEND_TEAM_BOSS_CHAT) then
		tips = __("EMOTION_LIMIT_TIME", cd - curCd)

		xyd.alert(xyd.AlertType.TIPS, tips)
	elseif cd - curCd > 0 and curSelect == xyd.MsgType.CROSS_CHAT then
		tips = __("EMOTION_LIMIT_TIME", cd - curCd)

		xyd.alert(xyd.AlertType.TIPS, tips)
	elseif cd - curCd > 0 and curSelect == xyd.MsgType.LOCAL_CHAT then
		tips = __("EMOTION_LIMIT_TIME", cd - curCd)

		xyd.alert(xyd.AlertType.TIPS, tips)
	elseif guildCD - curCd > 0 and curSelect == xyd.MsgType.RECRUIT and self.guildModel_.guildID then
		tips = __("EMOTION_LIMIT_TIME", guildCD - curCd)

		xyd.alert(xyd.AlertType.TIPS, tips)
	elseif self.backpack_:getLev() < __TS__Number(lev) then
		tips = __("CHAT_LIMIT_LEV", lev)

		xyd.alert(xyd.AlertType.TIPS, tips)
	elseif curSelect == xyd.MsgType.PRIVATE and self.chat_:isInBlackList(win.toPlayerId) then
		tips = __("CHAT_HAS_SHIELD")

		xyd.alert(xyd.AlertType.TIPS, tips)
	else
		win:onHideEmotion()

		local str = "#emotion" .. i

		if dynamic then
			str = "#gif" .. i
		end

		if curSelect == xyd.MsgType.GM then
			self.chat_:talkWithGM(str, xyd.MsgType.EMOTION)
		elseif curSelect == xyd.MsgType.RECRUIT and self.guildModel_.guildID then
			self.chat_:sendGuildMsg(str, xyd.MsgType.GUILD, xyd.MsgType.EMOTION)
		elseif curSelect == xyd.MsgType.PRIVATE then
			self.chat_:sendPrivateMsg(str, win.toPlayerId)
		elseif curSelect == xyd.MsgType.CROSS_CHAT then
			self.chat_:sendCrossMsg(str, curSelect, xyd.MsgType.CROSS_CHAT_EMOTION)
		elseif curSelect == xyd.MsgType.LOCAL_CHAT then
			self.chat_:sendLocalMsg(str, curSelect, xyd.MsgType.LOCAL_CHAT_EMOTION)
		elseif curSelect == xyd.MsgType.FRIEND_TEAM_BOSS_CHAT then
			self.chat_:sendFriendTeamBossMsg(str, curSelect, xyd.MsgType.EMOTION)
		elseif curSelect == xyd.MsgType.ARCTIC_EXPEDITION_ASSEMBLE then
			self.chat_:sendArcticMsg(str, curSelect, xyd.MsgType.EMOTION)
		elseif curSelect == xyd.MsgType.ARCTIC_EXPEDITION_SYS then
			return
		else
			self.chat_:sendServerMsg(str, curSelect, xyd.MsgType.EMOTION)
		end

		send_succeed = true
	end
end

return ChatEmotionItem
