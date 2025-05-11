-- chunkname: @../../../Product/Bundles/Android/src/app/components/ActivityInvitationSeniorNewItem.lua

local ActivityInvitationSeniorNewItem = class("ActivityInvitationSeniorNewItem", import("app.components.CopyComponent"))
local PlayerIcon = require("app.components.PlayerIcon")

function ActivityInvitationSeniorNewItem:ctor(goItem, parent)
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR)

	ActivityInvitationSeniorNewItem.super.ctor(self, goItem)

	self.parent = parent
end

function ActivityInvitationSeniorNewItem:initUI()
	self:getUIComponent()
	ActivityInvitationSeniorNewItem.super.initUI(self)
	self:reSize()
	self:register()
	self:layout()
end

function ActivityInvitationSeniorNewItem:getUIComponent()
	self.newCon = self.go
	self.newUpCon = self.newCon:NodeByName("newUpCon").gameObject
	self.completeCon = self.newUpCon:NodeByName("completeCon").gameObject
	self.completeConBg = self.completeCon:ComponentByName("completeConBg", typeof(UISprite))
	self.completeNameCon = self.completeCon:NodeByName("completeNameCon").gameObject
	self.completeNameIconObj = self.completeNameCon:NodeByName("completeNameIconLayout").gameObject
	self.completeNameIconLayout = self.completeNameCon:ComponentByName("completeNameIconLayout", typeof(UILayout))
	self.completeNameIcon = self.completeNameIconObj:ComponentByName("completeNameIcon", typeof(UISprite))
	self.completeNameLabel = self.completeNameIconObj:ComponentByName("completeNameLabel", typeof(UILabel))
	self.completeInputCon = self.completeNameCon:NodeByName("completeInputCon").gameObject
	self.textInput_ = self.completeInputCon:NodeByName("textInput_").gameObject
	self.textInputLabel_ = self.textInput_:ComponentByName("textInputLabel_", typeof(UILabel))
	self.showLabel = self.completeInputCon:ComponentByName("showLabel", typeof(UILabel))
	self.completeAwardCon = self.completeCon:NodeByName("completeAwardCon").gameObject
	self.completeAwardText = self.completeAwardCon:ComponentByName("completeAwardText", typeof(UILabel))
	self.completeAwardItemsCon = self.completeAwardCon:NodeByName("completeAwardItemsCon").gameObject
	self.completeAwardItemsConUILayout = self.completeAwardCon:ComponentByName("completeAwardItemsCon", typeof(UILayout))
	self.completeInputSureBtn = self.completeNameCon:NodeByName("completeInputSureBtn").gameObject
	self.completeInputSureBtnLabel = self.completeInputSureBtn:ComponentByName("completeInputSureBtnLabel", typeof(UILabel))
	self.teacherCon = self.newUpCon:NodeByName("teacherCon").gameObject
	self.teacherConBg = self.teacherCon:ComponentByName("teacherConBg", typeof(UISprite))
	self.teacherNameCon = self.teacherCon:NodeByName("teacherNameCon").gameObject
	self.teacherNameIcon = self.teacherNameCon:ComponentByName("teacherNameIcon", typeof(UISprite))
	self.teacherNameLabel = self.teacherNameCon:ComponentByName("teacherNameLabel", typeof(UILabel))
	self.teachInfoCon = self.teacherCon:NodeByName("teachInfoCon").gameObject
	self.pIcon = self.teachInfoCon:NodeByName("pIcon").gameObject
	self.lv = self.teachInfoCon:ComponentByName("lv", typeof(UILabel))
	self.labelName = self.teachInfoCon:ComponentByName("labelName", typeof(UILabel))
	self.labelScore = self.teachInfoCon:ComponentByName("labelScore", typeof(UILabel))
	self.chatBtn = self.teacherCon:NodeByName("chatBtn").gameObject
	self.chatBtnIcon = self.chatBtn:NodeByName("chatBtnIcon").gameObject
	self.chatBtnLabel = self.chatBtn:ComponentByName("chatBtnLabel", typeof(UILabel))
	self.newDownCon = self.newCon:NodeByName("newDownCon").gameObject
	self.newTaskCon = self.newDownCon:NodeByName("newTaskCon").gameObject
	self.newTaskListBg = self.newTaskCon:ComponentByName("newTaskListBg", typeof(UISprite))
	self.newTaskName = self.newTaskListBg:ComponentByName("newTaskName", typeof(UILabel))
	self.newTaskPagePanel = self.newTaskCon:NodeByName("newTaskPagePanel").gameObject
	self.newTaskPageItem = self.newTaskPagePanel:NodeByName("newTaskPageItem").gameObject
	self.newTaskPageHighPanel = self.newTaskCon:NodeByName("newTaskPageHighPanel").gameObject
	self.awardTips = self.newTaskPageHighPanel:ComponentByName("awardTips", typeof(UILabel))
	self.awardIcon = self.newTaskPageHighPanel:ComponentByName("awardIcon", typeof(UISprite))
	self.leftArrow = self.newTaskPageHighPanel:ComponentByName("leftArrow", typeof(UISprite))
	self.rightArrow = self.newTaskPageHighPanel:ComponentByName("rightArrow", typeof(UISprite))
end

function ActivityInvitationSeniorNewItem:reSize()
	local stageHeight = xyd.Global.getRealHeight()
	local num = (stageHeight - 1280) / (xyd.Global.getMaxHeight() - 1280)

	if stageHeight > xyd.Global.getMaxHeight() then
		num = 1
	end

	self.scale_num_ = 1 - num
	self.scale_num_contrary = 1 - self.scale_num_

	self:resizePosY(self.newTaskCon.gameObject, 0, -7)

	self.newTaskListBg.height = 397 + 75 * self.scale_num_contrary

	self:resizePosY(self.newTaskPagePanel.gameObject, -197, -224)
	self:resizePosY(self.newTaskPageHighPanel.gameObject, -197, -260)
	self:resizePosY(self.rightArrow.gameObject, 4, 70)
	self:resizePosY(self.leftArrow.gameObject, 4, 70)
end

function ActivityInvitationSeniorNewItem:resizePosY(obj, y_short, y_phoneX)
	obj:Y(y_short + (y_phoneX - y_short) * self.scale_num_contrary)
end

function ActivityInvitationSeniorNewItem:register()
	self:registerEvent(xyd.event.GET_ACTIVITY_AWARD, handler(self, self.onAward))

	UIEventListener.Get(self.leftArrow.gameObject).onClick = handler(self, function()
		self:onTouchArrow(self.curShowTaskId - 1)
	end)
	UIEventListener.Get(self.rightArrow.gameObject).onClick = handler(self, function()
		self:onTouchArrow(self.curShowTaskId + 1)
	end)
	UIEventListener.Get(self.completeInputSureBtn.gameObject).onClick = handler(self, function()
		local str = self.textInputLabel_.text

		if str == "" then
			xyd.alertTips(__("INVITATION_TEXT19"))
		end

		if type(tonumber(str)) == "number" then
			local strNum = tonumber(str)

			if strNum > 999999999 and strNum < 2000000000 then
				if strNum == xyd.models.selfPlayer:getPlayerID() then
					xyd.alertTips(__("INVITATION_TEXT19"))

					return
				end

				if self.isMoving then
					return
				end

				xyd.models.activity:reqAwardWithParams(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR, require("cjson").encode({
					award_type = xyd.ActivityInvitationSeniorSendType.BIND,
					player_id = strNum
				}))
			else
				xyd.alertTips(__("INVITATION_TEXT19"))
			end
		else
			xyd.alertTips(__("INVITATION_TEXT19"))
		end
	end)
end

function ActivityInvitationSeniorNewItem:layout()
	local inviter = self.activityData:getInviter()

	if inviter and inviter ~= 0 then
		self.awardTips.text = __("INVITATION_TEXT16")
	else
		self.awardTips.text = __("INVITATION_TEXT15")
	end

	self.completeAwardText.text = __("INVITATION_TEXT15")
	self.completeNameLabel.text = __("INVITATION_TEXT09")

	if xyd.Global.lang == "fr_fr" then
		self.completeNameLabel.fontSize = 18
	end

	self.teacherNameLabel.text = __("INVITATION_TEXT08")
	self.chatBtnLabel.text = __("CHAT_TAP_8")
	self.completeNameIconObj:GetComponent(typeof(UIWidget)).width = self.completeNameIcon.width + self.completeNameLabel.width

	self.completeNameIconLayout:Reposition()

	self.completeInputSureBtnLabel.text = __("SURE")
	self.textInputLabel_.text = ""
	self.curShowTaskId = 1
	self.allTaskIds = xyd.tables.activityInvitationAllAwardTable:getIDs()

	local curNum = xyd.models.growthDiary:getChapter()

	for i, id in pairs(self.allTaskIds) do
		local parameter = xyd.tables.activityInvitationAllAwardTable:getParameter(id)

		if curNum <= parameter then
			self.curShowTaskId = id

			break
		end
	end

	if not self.anotherShowTaskItem then
		local tmp = NGUITools.AddChild(self.newTaskPagePanel.gameObject, self.newTaskPageItem.gameObject)

		self.anotherShowTaskItem = import("app.components.ActivityInvitationSeniorItemItem").new(tmp, self, true, true)

		self.anotherShowTaskItem:update(1)
		self.anotherShowTaskItem:getGameObject():X(2000)
	end

	if not self.curShowTaskItem then
		self.curShowTaskItem = import("app.components.ActivityInvitationSeniorItemItem").new(self.newTaskPageItem, self, true, true)

		self.curShowTaskItem:update(self.curShowTaskId)
	end

	self:updateArrowShow()
	self:updateNewTaskName()
	self:initTextInput()
	self:updateUpCon()
end

function ActivityInvitationSeniorNewItem:updateNewTaskName()
	self.newTaskName.text = __("INVITATION_TEXT11", self.curShowTaskId)
end

function ActivityInvitationSeniorNewItem:updateArrowShow()
	if self.curShowTaskId <= 1 then
		self.leftArrow:SetActive(false)
		self.rightArrow:SetActive(true)
	elseif self.curShowTaskId >= #self.allTaskIds then
		self.leftArrow:SetActive(true)
		self.rightArrow:SetActive(false)
	else
		self.leftArrow:SetActive(true)
		self.rightArrow:SetActive(true)
	end
end

function ActivityInvitationSeniorNewItem:onTouchArrow(id)
	if self.isMoving then
		return
	end

	if id < 0 or id > #self.allTaskIds or id == self.curShowTaskId then
		self:updateArrowShow()

		return
	end

	self.isMoving = true

	if self.maskPanelTween then
		self.maskPanelTween:Kill(false)

		self.maskPanelTween = nil
	end

	self.anotherShowTaskItem:update(id)

	self.maskPanelTween = self:getSequence()

	local maskNum = 1
	local defaultX = 700

	if id < self.curShowTaskId then
		self.anotherShowTaskItem:getGameObject():X(700)

		defaultX = -700
		maskNum = 1
	elseif id > self.curShowTaskId then
		self.anotherShowTaskItem:getGameObject():X(-700)

		defaultX = 700
		maskNum = -1
	end

	local function setter(value)
		self.anotherShowTaskItem:getGameObject():X(defaultX + 700 * value * maskNum)
		self.curShowTaskItem:getGameObject():X(0 + 700 * value * maskNum)
	end

	self.maskPanelTween:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), 0, 1, 0.3))
	self.maskPanelTween:OnComplete(function()
		self.maskPanelTween:Kill(false)

		self.maskPanelTween = nil

		local temp = self.curShowTaskItem

		self.curShowTaskItem = self.anotherShowTaskItem
		self.anotherShowTaskItem = temp
		self.curShowTaskId = id

		self:updateNewTaskName()
		self:updateArrowShow()

		self.isMoving = false
	end)
end

function ActivityInvitationSeniorNewItem:initTextInput()
	xyd.addTextInput(self.textInputLabel_, {
		check_marks = true,
		type = xyd.TextInputArea.InputSingleLine,
		getText = function()
			if not self.isFirstOpenText then
				self.isFirstOpenText = true

				return ""
			end

			return self.textInputLabel_.text
		end,
		callback = function()
			if self.textInputLabel_.text == "" then
				self.isFirstOpenText = false
				self.textInputLabel_.text = ""
			end
		end
	})

	self.textInput_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = false
end

function ActivityInvitationSeniorNewItem:updateUpCon()
	local inviter = self.activityData:getInviter()

	if inviter and inviter ~= 0 then
		self.completeCon:SetActive(false)
		self.teacherCon:SetActive(true)

		local inviterInfo = self.activityData:getInviterInfo()

		if not self.qianbeiPlayerIcon then
			self.qianbeiPlayerIcon = PlayerIcon.new(self.pIcon)

			self.qianbeiPlayerIcon:setInfo({
				avatarID = inviterInfo.avatar_id,
				avatar_frame_id = inviterInfo.avatar_frame_id,
				callback = function()
					xyd.WindowManager.get():openWindow("arena_formation_window", {
						is_robot = false,
						player_id = inviter
					})
				end
			})
		end

		self.lv.text = tostring(inviterInfo.lev)
		self.labelName.text = tostring(inviterInfo.player_name)

		local isOnline = inviterInfo.is_online and inviterInfo.is_online == 1

		if isOnline then
			self.labelScore.text = __("ONLINE")
		else
			self.labelScore.text = xyd.getReceiveTime(inviterInfo.last_online_time)
		end

		UIEventListener.Get(self.chatBtn.gameObject).onClick = handler(self, function()
			self:onSendPrivateChatTouch(inviterInfo)
		end)
	else
		self.completeCon:SetActive(true)
		self.teacherCon:SetActive(false)

		local awards = xyd.tables.miscTable:split2Cost("invitation_new_awards", "value", "|#", true)

		for i in pairs(awards) do
			local params = {
				notPlaySaoguang = true,
				scale = 0.9074074074074074,
				uiRoot = self.completeAwardItemsCon.gameObject,
				itemID = awards[i][1],
				num = awards[i][2]
			}
			local icon = xyd.getItemIcon(params, xyd.ItemIconType.ADVANCE_ICON)

			if self.activityData:getBindCount() and self.activityData:getBindCount() ~= 0 then
				icon:setChoose(true)
			end
		end

		self.completeAwardItemsConUILayout:Reposition()
	end
end

function ActivityInvitationSeniorNewItem:onSendPrivateChatTouch(info)
	local win = xyd.WindowManager.get():getWindow("chat_window")

	if not win then
		xyd.WindowManager.get():openWindow("chat_window", {
			is_detail = true,
			to_player_id = info.player_id
		})

		win = xyd.WindowManager.get():getWindow("chat_window")
	else
		win.isDetail = true
		win.toPlayerId = info.player_id
	end

	win.privateParams = {
		player_name = info.player_name,
		avatar_id = info.avatar_id,
		lev = info.lev,
		player_id = info.player_id
	}
	win.privateServerID = info.server_id
	win.ifArenaOpen = true

	win:setPlyaerListPos(10000)

	win.notSetPos0 = true

	win:onTopTouch(xyd.MsgType.PRIVATE)
	win:setWarningVisible(info.player_id)
end

function ActivityInvitationSeniorNewItem:onAward(event)
	local data = event.data

	if data.activity_id ~= xyd.ActivityID.ACTIVITY_INVITATION_SENIOR then
		return
	end

	local data = xyd.decodeProtoBuf(data)
	local info = require("cjson").decode(data.detail)
	local award_type = info.award_type

	if award_type == xyd.ActivityInvitationSeniorSendType.BIND then
		xyd.alertTips(__("INVITATION_TEXT23"))
		self:updateUpCon()

		if self.curShowTaskItem and self.curShowTaskId then
			self.curShowTaskItem:update(self.curShowTaskId)
			self:updateNewTaskName()
		end
	end
end

return ActivityInvitationSeniorNewItem
