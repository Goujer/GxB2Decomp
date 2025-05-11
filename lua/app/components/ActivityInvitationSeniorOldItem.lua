-- chunkname: @../../../Product/Bundles/Android/src/app/components/ActivityInvitationSeniorOldItem.lua

local ActivityInvitationSeniorOldItem = class("ActivityInvitationSeniorOldItem", import("app.components.CopyComponent"))
local BaseComponent = import("app.components.BaseComponent")
local TaskItem = class("TaskItem", BaseComponent)
local NewItem = class("NewItem", BaseComponent)
local FixedWrapContent = import("app.common.ui.FixedWrapContent")
local PlayerIcon = require("app.components.PlayerIcon")
local OtherShowMaskItem = class("OtherShowMaskItem", BaseComponent)

function ActivityInvitationSeniorOldItem:ctor(goItem, parent)
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR)
	self.parent = parent

	ActivityInvitationSeniorOldItem.super.ctor(self, goItem)
end

function ActivityInvitationSeniorOldItem:initUI()
	self:getUIComponent()
	ActivityInvitationSeniorOldItem.super.initUI(self)
	self:reSize()
	self:register()
	self:layout()
end

function ActivityInvitationSeniorOldItem:getUIComponent()
	self.oldCon = self.go
	self.oldUpCon = self.oldCon:NodeByName("oldUpCon").gameObject
	self.newList = self.oldUpCon:NodeByName("newList").gameObject
	self.newListBg = self.newList:ComponentByName("newListBg", typeof(UISprite))
	self.newListItem = self.newList:NodeByName("newListItem").gameObject
	self.newListScrollViewObj = self.newList:NodeByName("newListScrollView").gameObject
	self.newListScrollView = self.newList:ComponentByName("newListScrollView", typeof(UIScrollView))
	self.newListScrollViewWrapContent = self.newListScrollView:ComponentByName("newListScrollViewWrapContent", typeof(UIWrapContent))
	self.newListWrapContent = FixedWrapContent.new(self.newListScrollView, self.newListScrollViewWrapContent, self.newListItem, NewItem, self)

	self.newListWrapContent:hideItems()

	self.newListNameCon = self.newList:NodeByName("newListNameCon").gameObject
	self.newListNameIcon = self.newListNameCon:ComponentByName("newListNameIcon", typeof(UISprite))
	self.newListNameLabel = self.newListNameCon:ComponentByName("newListNameLabel", typeof(UILabel))
	self.newListAwardBtn = self.newListNameCon:NodeByName("newListAwardBtn").gameObject
	self.newListNoneCon = self.newList:NodeByName("newListNoneCon").gameObject
	self.labelNoneTips = self.newListNoneCon:ComponentByName("labelNoneTips", typeof(UILabel))
	self.awardTips = self.newList:ComponentByName("awardTips", typeof(UISprite))
	self.awardTipsAwardIcon = self.awardTips:ComponentByName("awardTipsAwardIcon", typeof(UISprite))
	self.awardTipsAwardNum = self.awardTipsAwardIcon:ComponentByName("awardTipsAwardNum", typeof(UILabel))
	self.awardTipsText = self.awardTips:ComponentByName("awardTipsText", typeof(UILabel))
	self.oldDownCon = self.oldCon:NodeByName("oldDownCon").gameObject
	self.myTaskList = self.oldDownCon:NodeByName("myTaskList").gameObject
	self.myTaskListBg = self.myTaskList:ComponentByName("myTaskListBg", typeof(UISprite))
	self.myTaskListItem = self.myTaskList:NodeByName("myTaskListItem").gameObject
	self.myTaskListScrollViewObj = self.myTaskList:NodeByName("myTaskListScrollView").gameObject
	self.myTaskListScrollView = self.myTaskList:ComponentByName("myTaskListScrollView", typeof(UIScrollView))
	self.newListScrollViewWrapContentObj = self.myTaskListScrollViewObj:NodeByName("newListScrollViewWrapContent").gameObject
	self.newListScrollViewWrapContent = self.myTaskListScrollViewObj:ComponentByName("newListScrollViewWrapContent", typeof(UIWrapContent))
	self.myTaskWrapContent = FixedWrapContent.new(self.myTaskListScrollView, self.newListScrollViewWrapContent, self.myTaskListItem, TaskItem, self)

	self.myTaskWrapContent:hideItems()

	self.myTaskListNameCon = self.myTaskList:NodeByName("myTaskListNameCon").gameObject
	self.myTaskListNameIcon = self.myTaskListNameCon:ComponentByName("myTaskListNameIcon", typeof(UISprite))
	self.myTaskListNameLabel = self.myTaskListNameCon:ComponentByName("myTaskListNameLabel", typeof(UILabel))
	self.inputCon = self.myTaskListNameCon:NodeByName("inputCon").gameObject
	self.textInputLabel_ = self.inputCon:ComponentByName("textInputLabel_", typeof(UILabel))
	self.showLabel = self.inputCon:ComponentByName("showLabel", typeof(UILabel))
	self.linkBtn = self.myTaskListNameCon:NodeByName("linkBtn").gameObject
	self.linkBtnLabel = self.linkBtn:ComponentByName("linkBtnLabel", typeof(UILabel))
	self.shareBtn = self.myTaskListNameCon:NodeByName("shareBtn").gameObject
	self.shareBtnLabel = self.shareBtn:ComponentByName("shareBtnLabel", typeof(UILabel))
	self.shareBtnRedPoint = self.shareBtn:NodeByName("shareBtnRedPoint").gameObject
	self.weekTipsCon = self.myTaskListNameCon:NodeByName("weekTipsCon").gameObject
	self.weekTipsConUILayout = self.myTaskListNameCon:ComponentByName("weekTipsCon", typeof(UILayout))
	self.weekTipsLabel = self.weekTipsCon:ComponentByName("weekTipsLabel", typeof(UILabel))
	self.weekTipsAward = self.weekTipsCon:NodeByName("weekTipsAward").gameObject
	self.weekTipsAwardUIWidget = self.weekTipsCon:ComponentByName("weekTipsAward", typeof(UIWidget))
	self.weekTipsAwardUILayout = self.weekTipsCon:ComponentByName("weekTipsAward", typeof(UILayout))
	self.weekTipsAwardIcon = self.weekTipsAward:ComponentByName("weekTipsAwardIcon", typeof(UISprite))
	self.weekTipsAwardNum = self.weekTipsAward:ComponentByName("weekTipsAwardNum", typeof(UILabel))
	self.otherPanel = self.oldCon:NodeByName("otherPanel").gameObject
	self.mask = self.otherPanel:ComponentByName("mask", typeof(UISprite))

	local parentObj = self.parent:getGameObject()

	self.newCon = parentObj:NodeByName("groupAction/newCon").gameObject
	self.newDownCon = self.newCon:NodeByName("newDownCon").gameObject
end

function ActivityInvitationSeniorOldItem:reSize()
	local stageHeight = xyd.Global.getRealHeight()
	local num = (stageHeight - 1280) / (xyd.Global.getMaxHeight() - 1280)

	if stageHeight > xyd.Global.getMaxHeight() then
		num = 1
	end

	self.scale_num_ = 1 - num
	self.scale_num_contrary = 1 - self.scale_num_

	self:resizePosY(self.oldUpCon.gameObject, 186, 243)
	self:resizePosY(self.oldDownCon.gameObject, -11, 44)

	self.myTaskListBg.height = 292 + 148 * self.scale_num_contrary
end

function ActivityInvitationSeniorOldItem:resizePosY(obj, y_short, y_phoneX)
	obj:Y(y_short + (y_phoneX - y_short) * self.scale_num_contrary)
end

function ActivityInvitationSeniorOldItem:register()
	self:registerEvent(xyd.event.GET_ACTIVITY_AWARD, handler(self, self.onAward))

	UIEventListener.Get(self.shareBtn.gameObject).onClick = function()
		local type = "Invite_GXB"
		local pkgName = XYDDef.PkgName
		local languages = xyd.package2Language[pkgName]

		if languages[1] == "ja_jp" and UNITY_IOS then
			type = "Invite_GXBja"
		end

		local url = "https://mhome.carolgames.com/home/link/" .. type .. "?deep_link_value=" .. string.urlencode(require("cjson").encode({
			player_id = xyd.Global.playerID,
			lang = xyd.Global.lang
		})) .. "&lang=" .. xyd.Global.lang .. "&game_id=115"

		dump(type, "test1:")
		dump(url, "test2:")

		if self.activityData and self.activityData:getIsShareOpen() then
			xyd.SdkManager.get():shareTextToOtherApp(type, url)

			if not self.activityData:getWeeklyShareIsSameWeek() then
				xyd.models.activity:reqAwardWithParams(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR, require("cjson").encode({
					award_type = xyd.ActivityInvitationSeniorSendType.WEEK_SHARE_AWARD
				}))
			end

			local msg = messages_pb.log_partner_data_touch_req()

			msg.touch_id = xyd.DaDian.ACTIVITY_INVITATION_SENIOR_SHARE

			xyd.Backend.get():request(xyd.mid.LOG_PARTNER_DATA_TOUCH, msg)
		else
			xyd.alertTips(__("GUILD_COMPETITION__NO_H5"))
		end
	end
	UIEventListener.Get(self.linkBtn.gameObject).onClick = function()
		local id = xyd.models.selfPlayer:getPlayerID()

		xyd.SdkManager:get():copyToClipboard(tostring(id))
		xyd.showToast(__("COPY_SELF_ID_SUCCESSFUL"))

		local msg = messages_pb.log_partner_data_touch_req()

		msg.touch_id = xyd.DaDian.ACTIVITY_INVITATION_SENIOR_COPY

		xyd.Backend.get():request(xyd.mid.LOG_PARTNER_DATA_TOUCH, msg)
	end
	UIEventListener.Get(self.mask.gameObject).onClick = function()
		self.otherPanel:SetActive(false)
	end
	UIEventListener.Get(self.newListAwardBtn.gameObject).onClick = function()
		local params = {}

		params.title_text = __("INVITATION_AWARD_TEXT01")
		params.infos = {}

		local ids = xyd.tables.activityInvitationAllAwardTable:getIDs()

		for i = 1, #ids do
			local id = ids[i]
			local awards = xyd.tables.activityInvitationAllAwardTable:getAwardsSenpai(id)
			local time = xyd.tables.activityInvitationAllAwardTable:getParameter(id)
			local descText = __("INVITATION_AWARD_TEXT02", id)

			table.insert(params.infos, {
				descText = descText,
				items = awards
			})
		end

		xyd.WindowManager.get():openWindow("common_wrap_preview_award_window", params)
	end
end

function ActivityInvitationSeniorOldItem:layout()
	self.labelNoneTips.text = __("INVITATION_TEXT20")
	self.awardTipsText.text = __("INVITATION_TEXT17")

	self:updateTaskList(true)
	self:updateNewList(true)

	if not self.activityData:getWeeklyShareIsSameWeek() then
		self.weekTipsCon:SetActive(true)

		local weekShareAward = xyd.tables.miscTable:split2num("invitation_weekly_share_awards", "value", "#")

		xyd.setUISpriteAsync(self.weekTipsAwardIcon, nil, xyd.tables.itemTable:getIcon(weekShareAward[1]))

		self.weekTipsAwardNum.text = "x" .. weekShareAward[2]

		self.weekTipsAwardUILayout:Reposition()

		self.weekTipsLabel.text = __("INVITATION_TEXT07")
		self.weekTipsAwardUIWidget.width = self.weekTipsAwardNum.width + self.weekTipsAwardIcon.width + self.weekTipsAwardUILayout.gap.x

		self:waitForFrame(1, function()
			self.weekTipsConUILayout:Reposition()
		end)
	else
		self.weekTipsCon:SetActive(false)
	end

	self.shareBtnLabel.text = __("INVITATION_TEXT04")
	self.linkBtnLabel.text = __("INVITATION_TEXT03")
	self.myTaskListNameLabel.text = __("INVITATION_TEXT02")
	self.textInputLabel_.text = tostring(xyd.models.selfPlayer:getPlayerID())
end

function ActivityInvitationSeniorOldItem:updateTaskList(isNew)
	local ids = xyd.tables.activityInvitationOldAwardTable:getIDs()
	local canGetArr = {}
	local noCompleteArr = {}
	local getYetArr = {}

	for i, id in pairs(ids) do
		local params = xyd.tables.activityInvitationOldAwardTable:getParameter(id)
		local inviter_completes = self.activityData:getInviterCompletes()
		local inviter_awarded = self.activityData:getInviterAwarded()

		if inviter_completes > params[1] then
			inviter_completes = params[1]
		end

		if inviter_completes >= params[1] then
			if inviter_awarded[id] and inviter_awarded[id] == 1 then
				table.insert(getYetArr, id)
			else
				table.insert(canGetArr, id)
			end
		else
			table.insert(noCompleteArr, id)
		end
	end

	for i in pairs(noCompleteArr) do
		table.insert(canGetArr, noCompleteArr[i])
	end

	for i in pairs(getYetArr) do
		table.insert(canGetArr, getYetArr[i])
	end

	if isNew then
		self.myTaskWrapContent:setInfos(canGetArr, {})
	else
		self.myTaskWrapContent:setInfos(canGetArr, {
			keepPosition = true
		})
	end

	if isNew then
		self:waitForFrame(1, function()
			self.myTaskListScrollView:ResetPosition()
		end)
	end
end

function ActivityInvitationSeniorOldItem:updateNewList(isNew)
	local newPlayerList = self.activityData:getInvitees()
	local newPlayerInfoList = self.activityData:getInviteeInfos()
	local infoArr = {}

	for i in pairs(newPlayerList) do
		infoArr[i] = {
			playerId = newPlayerList[i],
			info = newPlayerInfoList[i]
		}
	end

	if newPlayerList and #newPlayerList > 0 then
		self.newListNoneCon:SetActive(false)

		if isNew then
			self.newListWrapContent:setInfos(infoArr, {})
		else
			self.newListWrapContent:setInfos(infoArr, {
				keepPosition = true
			})
		end

		if isNew then
			self:waitForFrame(1, function()
				self.newListScrollView:ResetPosition()
			end)
		end
	else
		self.newListWrapContent:hideItems()
		self.newListNoneCon:SetActive(true)
	end

	local limitNum = xyd.tables.miscTable:getNumber("invitation_senpai_num", "value")
	local invitees = self.activityData:getInvitees()

	self.newListNameLabel.text = __("INVITATION_TEXT01") .. " " .. "(" .. #invitees .. "/" .. limitNum .. ")"
end

function ActivityInvitationSeniorOldItem:showOtherTask(id)
	self.otherPanel:SetActive(true)

	if not self.showMaskItem then
		local tmp = NGUITools.AddChild(self.otherPanel.gameObject, self.newDownCon.gameObject)
		local panelDepth = self.otherPanel:GetComponent(typeof(UIPanel)).depth

		self.showMaskItem = OtherShowMaskItem.new(tmp, self, panelDepth)
	end

	self.showMaskItem:update(id)
end

function ActivityInvitationSeniorOldItem:onAward(event)
	local data = event.data

	if data.activity_id ~= xyd.ActivityID.ACTIVITY_INVITATION_SENIOR then
		return
	end

	local data = xyd.decodeProtoBuf(data)
	local info = require("cjson").decode(data.detail)
	local award_type = info.award_type

	if award_type == xyd.ActivityInvitationSeniorSendType.SEND_AWARD then
		xyd.alertTips(__("INVITATION_TEXT21"))
		self:updateNewList()
	elseif award_type == xyd.ActivityInvitationSeniorSendType.DEL_INVITEE then
		xyd.alertTips(__("INVITATION_TEXT22"))
		self:updateNewList()
		xyd.WindowManager.get():closeWindow("arena_formation_window")
	elseif award_type == xyd.ActivityInvitationSeniorSendType.WEEK_SHARE_AWARD then
		self.weekTipsCon:SetActive(false)
	elseif award_type == xyd.ActivityInvitationSeniorSendType.INVITEE_COMPLETES then
		local invitee_awarded = info.invitee_awarded
		local ids = xyd.tables.activityInvitationAllAwardTable:getIDs()
		local searchIndex = -1

		for i in pairs(ids) do
			if not invitee_awarded[i] or invitee_awarded[i] == 0 then
				searchIndex = i

				break
			end
		end

		if searchIndex == -1 then
			searchIndex = #ids
		end

		print("test1:", searchIndex)
		self:showOtherTask(searchIndex)
	elseif award_type == xyd.ActivityInvitationSeniorSendType.GET_OLD_TASK_AWARD then
		self:updateTaskList()
	end
end

function TaskItem:ctor(go, parent)
	self.go = go
	self.parent = parent
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR)

	self:initUI()
end

function TaskItem:getUIComponent()
	self.imgBg = self.go:ComponentByName("imgBg", typeof(UISprite))
	self.missionDesc = self.go:ComponentByName("missionDesc", typeof(UILabel))
	self.itemRoot = self.go:NodeByName("itemRoot").gameObject
	self.itemRootUILayout = self.go:ComponentByName("itemRoot", typeof(UILayout))
	self.btnAward = self.go:NodeByName("btnAward").gameObject
	self.btnAwardBoxCollider = self.go:ComponentByName("btnAward", typeof(UnityEngine.BoxCollider))
	self.label = self.btnAward:ComponentByName("label", typeof(UILabel))
	self.imgAward = self.go:ComponentByName("imgAward", typeof(UISprite))
end

function TaskItem:initUI()
	self:getUIComponent()

	self.label.text = __("GET2")

	xyd.setUISpriteAsync(self.imgAward, nil, "mission_awarded_" .. xyd.Global.lang, nil, nil)

	UIEventListener.Get(self.btnAward.gameObject).onClick = handler(self, self.onTouch)
end

function TaskItem:update(index, data)
	if not data then
		self.go:SetActive(false)

		return
	end

	self.go:SetActive(true)

	self.id = data

	local params = xyd.tables.activityInvitationOldAwardTable:getParameter(self.id)
	local inviter_completes = self.activityData:getInviterCompletes()
	local inviter_awarded = self.activityData:getInviterAwarded()

	if inviter_completes > params[1] then
		inviter_completes = params[1]
	end

	self.isGetYet = false

	self.imgAward:SetActive(false)

	self.missionDesc.text = __("INVITATION_TEXT18", params[1]) .. " (" .. inviter_completes .. "/" .. params[1] .. ")"

	if inviter_completes >= params[1] then
		if inviter_awarded[self.id] and inviter_awarded[self.id] == 1 then
			self.isGetYet = true

			self.imgAward:SetActive(true)
			self.btnAward.gameObject:SetActive(false)
		else
			xyd.applyChildrenOrigin(self.btnAward.gameObject)
			self.btnAward.gameObject:SetActive(true)

			self.btnAwardBoxCollider.enabled = true
		end
	else
		xyd.applyChildrenGrey(self.btnAward.gameObject)
		self.btnAward.gameObject:SetActive(true)

		self.btnAwardBoxCollider.enabled = false
	end

	local awards = xyd.tables.activityInvitationOldAwardTable:getAwards(self.id)

	if not self.awardArr then
		self.awardArr = {}
	end

	for i in pairs(awards) do
		if not self.awardArr[i] then
			local params = {
				isAddUIDragScrollView = true,
				notPlaySaoguang = true,
				scale = 0.7037037037037037,
				uiRoot = self.itemRoot.gameObject,
				itemID = awards[i][1],
				num = awards[i][2]
			}

			self.awardArr[i] = xyd.getItemIcon(params, xyd.ItemIconType.ADVANCE_ICON)
		else
			self.awardArr[i]:setInfo(params)
		end

		self.awardArr[i]:setChoose(self.isGetYet)
		self.awardArr[i]:SetActive(true)
	end

	for i = #awards + 1, #self.awardArr do
		self.awardArr[i]:SetActive(false)
	end

	self.itemRootUILayout:Reposition()
end

function TaskItem:getGameObject()
	return self.go
end

function TaskItem:onTouch()
	xyd.models.activity:reqAwardWithParams(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR, require("cjson").encode({
		award_type = xyd.ActivityInvitationSeniorSendType.GET_OLD_TASK_AWARD,
		award_id = self.id
	}))
end

function NewItem:ctor(go, parent)
	self.go = go
	self.parent = parent
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR)

	self:initUI()
end

function NewItem:getUIComponent()
	self.bg = self.go:ComponentByName("bg", typeof(UISprite))
	self.pIcon = self.go:NodeByName("pIcon").gameObject
	self.lv = self.go:ComponentByName("lv", typeof(UILabel))
	self.labelName = self.go:ComponentByName("labelName", typeof(UILabel))
	self.labelScore = self.go:ComponentByName("labelScore", typeof(UILabel))
	self.btnCon = self.go:NodeByName("btnCon").gameObject
	self.chatBtn = self.btnCon:NodeByName("chatBtn").gameObject
	self.taskBtn = self.btnCon:NodeByName("taskBtn").gameObject
	self.giftBtn = self.btnCon:NodeByName("giftBtn").gameObject
	self.giftBtnBoxCollider = self.btnCon:ComponentByName("giftBtn", typeof(UnityEngine.BoxCollider))
	self.giftBtnRedPoint = self.giftBtn:NodeByName("giftBtnRedPoint").gameObject
end

function NewItem:initUI()
	self:getUIComponent()

	UIEventListener.Get(self.chatBtn.gameObject).onClick = handler(self, function()
		self:onSendPrivateChatTouch(self.data.info)
	end)
	UIEventListener.Get(self.taskBtn.gameObject).onClick = handler(self, function()
		xyd.models.activity:reqAwardWithParams(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR, require("cjson").encode({
			award_type = xyd.ActivityInvitationSeniorSendType.INVITEE_COMPLETES,
			player_id = self.data.playerId
		}))
	end)
	UIEventListener.Get(self.giftBtn.gameObject).onClick = handler(self, function()
		xyd.models.activity:reqAwardWithParams(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR, require("cjson").encode({
			award_type = xyd.ActivityInvitationSeniorSendType.SEND_AWARD,
			player_ids = {
				self.data.playerId
			}
		}))
	end)
end

function NewItem:update(index, data)
	if not data then
		self.go:SetActive(false)

		return
	end

	self.go:SetActive(true)

	self.data = data

	local playerId = data.playerId
	local info = data.info
	local last_online_time = info.last_online_time
	local params = {
		scale = 0.6759259259259259,
		avatarID = info.avatar_id,
		avatar_frame_id = info.avatar_frame_id,
		callback = function()
			xyd.WindowManager.get():openWindow("arena_formation_window", {
				is_robot = false,
				player_id = playerId,
				isNewDeleteBtnCalback = function()
					local function deleteFun()
						xyd.models.activity:reqAwardWithParams(xyd.ActivityID.ACTIVITY_INVITATION_SENIOR, require("cjson").encode({
							award_type = xyd.ActivityInvitationSeniorSendType.DEL_INVITEE,
							player_id = playerId
						}))
					end

					local deleteDay = xyd.tables.miscTable:getNumber("invitation_delete_day", "value")

					if xyd.getServerTime() - last_online_time > 86400 * deleteDay then
						xyd.alert(xyd.AlertType.YES_NO, __("INVITATION_TEXT06"), function(yes_no)
							if yes_no then
								deleteFun()
							end
						end)
					else
						xyd.alertTips(__("INVITATION_TEXT05"))
					end
				end
			})
		end
	}

	if not self.pIconItem then
		self.pIconItem = PlayerIcon.new(self.pIcon)
	end

	self.pIconItem:setInfo(params)
	self.pIconItem:AddUIDragScrollView()

	self.lv.text = tostring(info.lev)
	self.labelName.text = tostring(info.player_name)

	local isOnline = info.is_online and info.is_online == 1

	if isOnline then
		self.labelScore.text = __("ONLINE")
	else
		self.labelScore.text = xyd.getReceiveTime2(info.last_online_time)
	end

	local dailySend = self.activityData:getDailySend()

	if dailySend and xyd.arrayIndexOf(dailySend, playerId) > 0 then
		xyd.applyChildrenGrey(self.giftBtn.gameObject)
		self.giftBtnRedPoint:SetActive(false)

		self.giftBtnBoxCollider.enabled = false
	else
		self.giftBtnRedPoint:SetActive(true)
		xyd.applyChildrenOrigin(self.giftBtn.gameObject)

		self.giftBtnBoxCollider.enabled = true
	end
end

function NewItem:getGameObject()
	return self.go
end

function NewItem:onSendPrivateChatTouch(info)
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

function OtherShowMaskItem:ctor(go, parent, panelDepth)
	self.go = go
	self.parent = parent
	self.parentPanelDepth = panelDepth

	self:initUI()
end

function OtherShowMaskItem:getUIComponent()
	self.newTaskCon = self.go:NodeByName("newTaskCon").gameObject
	self.newTaskListBg = self.newTaskCon:ComponentByName("newTaskListBg", typeof(UISprite))
	self.newTaskName = self.newTaskListBg:ComponentByName("newTaskName", typeof(UILabel))
	self.newTaskPagePanel = self.newTaskCon:NodeByName("newTaskPagePanel").gameObject
	self.newTaskPageItem = self.newTaskPagePanel:NodeByName("newTaskPageItem").gameObject
	self.newTaskPageHighPanel = self.newTaskCon:NodeByName("newTaskPageHighPanel").gameObject
	self.awardTips = self.newTaskPageHighPanel:ComponentByName("awardTips", typeof(UILabel))
	self.awardIcon = self.newTaskPageHighPanel:ComponentByName("awardIcon", typeof(UISprite))
	self.leftArrow = self.newTaskPageHighPanel:ComponentByName("leftArrow", typeof(UISprite))
	self.rightArrow = self.newTaskPageHighPanel:ComponentByName("rightArrow", typeof(UISprite))
	self.newTaskPagePanel:GetComponent(typeof(UIPanel)).depth = self.parentPanelDepth + 1
	self.newTaskPageHighPanel:GetComponent(typeof(UIPanel)).depth = self.parentPanelDepth + 2
end

function OtherShowMaskItem:initUI()
	self:getUIComponent()
	self.leftArrow:SetActive(false)
	self.rightArrow:SetActive(false)
	self.go:SetActive(true)
	self.go:Y(326)

	self.awardTips.text = __("INVITATION_TEXT16")
end

function OtherShowMaskItem:update(data)
	if not data then
		self.go:SetActive(false)

		return
	end

	self.go:SetActive(true)

	self.data = data

	local id = self.data

	if not self.anotherShowTaskItem then
		self.anotherShowTaskItem = import("app.components.ActivityInvitationSeniorItemItem").new(self.newTaskPageItem.gameObject, self)
	end

	self.anotherShowTaskItem:update(id)

	self.newTaskName.text = __("INVITATION_TEXT11", id)
end

function OtherShowMaskItem:getGameObject()
	return self.go
end

return ActivityInvitationSeniorOldItem
