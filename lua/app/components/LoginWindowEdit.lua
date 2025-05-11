-- chunkname: @../../../Product/Bundles/Android/src/app/components/LoginWindowEdit.lua

local LoginWindowEdit = class("LoginWindowEdit", import("app.components.CopyComponent"))
local EditorChoiceItem = class("EditorChoiceItem", import("app.components.BaseComponent"))
local json = require("cjson")

function LoginWindowEdit:ctor(goItem, data)
	LoginWindowEdit.super.ctor(self, goItem)

	self.data = data
	self.userInput = data.userInput
end

function LoginWindowEdit:initUI()
	self:getUIComponent()
	LoginWindowEdit.super.initUI(self)
	self:registerEvent()
	self:layout()
end

function LoginWindowEdit:getUIComponent()
	return
end

function LoginWindowEdit:registerEvent()
	return
end

function LoginWindowEdit:layout()
	local y = -380

	self.accountBtn = EditorChoiceItem.new(self.go.gameObject, self)

	self.accountBtn:initData(0)
	self.accountBtn:SetLocalPosition(-240, y, 0)

	y = y - 56
	self.serverBtn = EditorChoiceItem.new(self.go.gameObject, self)

	self.serverBtn:initData(1)
	self.serverBtn:SetLocalPosition(-240, y, 0)

	y = y - 56
	self.guideBtn = EditorChoiceItem.new(self.go.gameObject, self)

	self.guideBtn:initData(2)
	self.guideBtn:SetLocalPosition(-240, y, 0)

	y = y - 56
	self.h5Btn = EditorChoiceItem.new(self.go.gameObject, self)

	self.h5Btn:initData(3)
	self.h5Btn:SetLocalPosition(-240, y, 0)

	y = y - 56
	self.h5Btn = EditorChoiceItem.new(self.go.gameObject, self)

	self.h5Btn:initData(4)
	self.h5Btn:SetLocalPosition(-240, y, 0)
end

function LoginWindowEdit:setSaveAcount(str)
	if self.localAccounts then
		local search = false

		for i, value in pairs(self.localAccounts) do
			if str == value then
				table.remove(self.localAccounts, i)
				table.insert(self.localAccounts, 1, str)

				search = true

				break
			end
		end

		if not search then
			if #self.localAccounts > 20 then
				table.remove(self.localAccounts, 20)
				table.insert(self.localAccounts, 1, str)
			else
				table.insert(self.localAccounts, 1, str)
			end
		end

		local saveAccounts = json.encode(self.localAccounts)

		xyd.db.misc:setValue({
			key = "login_accounts_message",
			value = saveAccounts
		})
	end
end

if UNITY_EDITOR then
	function EditorChoiceItem:ctor(go, parent)
		EditorChoiceItem.super.ctor(self, go)

		self.parent = parent
	end

	function EditorChoiceItem:getPrefabPath()
		return "Prefabs/Components/res_item"
	end

	function EditorChoiceItem:initUI()
		EditorChoiceItem.super.initUI(self)

		local goTrans = self.go.transform

		self.goWidget = self.go:GetComponent(typeof(UIWidget))
		self.cdBgImg = goTrans:Find("cd_bg_img")
		self.plusBtn = goTrans:Find("plus_btn")
		self.redImg = goTrans:Find("red_img")
		self.timeLabelTrans = goTrans:Find("time_label")
		self.resIconTrans = goTrans:Find("res_icon")
		self.resNumTrans = goTrans:Find("res_num_label")
		self.line_left = goTrans:Find("line_left")
		self.line_right = goTrans:Find("line_right")

		local timeLabelNode = goTrans:ComponentByName("time_label", typeof(UILabel))

		self.resIconImg = goTrans:ComponentByName("res_icon", typeof(UISprite))
		self.resNumLabel = goTrans:ComponentByName("res_num_label", typeof(UILabel))
		self.bgImg = goTrans:ComponentByName("bg_img", typeof(UISprite))

		self.cdBgImg.gameObject:SetActive(false)
		self.redImg.gameObject:SetActive(false)
		self.timeLabelTrans.gameObject:SetActive(false)
		self.cdBgImg:SetActive(false)
		self.plusBtn:SetActive(false)
		self.go:AddComponent(typeof(UIButtonScale))
	end

	function EditorChoiceItem:initData(index)
		if index == 0 then
			local localAccounts = xyd.db.misc:getValue("login_accounts_message")

			if not localAccounts then
				localAccounts = {}
				self.parent.localAccounts = localAccounts
			else
				localAccounts = json.decode(localAccounts)
				self.parent.localAccounts = localAccounts
			end

			local allGroupParent = NGUITools.AddChild(self.parentGo, "allGroup").gameObject

			allGroupParent.gameObject:X(-238)
			allGroupParent.gameObject:Y(-328)

			local accountItem1 = NGUITools.AddChild(allGroupParent, "accountItem").gameObject
			local accountBg1 = NGUITools.AddChild(accountItem1.gameObject, self.bgImg.gameObject)

			accountBg1:GetComponent(typeof(UISprite)).color = Color.New2(218893567)
			accountBg1:GetComponent(typeof(UIWidget)).pivot = UIWidget.Pivot.Left
			accountBg1:GetComponent(typeof(UIWidget)).depth = 100

			accountBg1:AddComponent(typeof(UnityEngine.BoxCollider))

			self.accountBg1 = accountBg1.gameObject

			local accountLabel1 = NGUITools.AddChild(accountItem1.gameObject, self.resNumLabel.gameObject)

			self.accountLabel1 = accountLabel1:GetComponent(typeof(UILabel))
			self.accountLabel1.color = Color.New2(3269392127)
			self.accountLabel1.effectStyle = UILabel.Effect.None
			self.accountLabel1.alignment = NGUIText.Alignment.Left
			self.accountLabel1.overflowMethod = UILabel.Overflow.ResizeFreely
			accountLabel1:GetComponent(typeof(UIWidget)).pivot = UIWidget.Pivot.Left
			accountLabel1:GetComponent(typeof(UIWidget)).depth = 105

			allGroupParent:SetActive(false)

			UIEventListener.Get(self.go.gameObject).onClick = function()
				if #localAccounts == 0 then
					xyd.showToast("no record")

					return
				end

				if not self.isInitAccount then
					self.accountLabel1.text = localAccounts[1]

					self.accountLabel1.gameObject:X(-88)

					self.accountBg1:GetComponent(typeof(UIWidget)).width = self.accountLabel1.width + 20

					self.accountBg1:GetComponent(typeof(UIWidget)):ResizeCollider()

					UIEventListener.Get(self.accountBg1.gameObject).onClick = function()
						self.parent.userInput.value = localAccounts[1]
					end

					for i = 2, #localAccounts do
						local tmp = NGUITools.AddChild(allGroupParent.gameObject, accountItem1.gameObject)

						tmp.gameObject:Y(39 * (i - 1))

						self["accountLabel" .. i] = tmp.gameObject:ComponentByName("res_num_label", typeof(UILabel))

						self["accountLabel" .. i].gameObject:X(-88)

						self["accountBg" .. i] = tmp.gameObject:ComponentByName("bg_img", typeof(UISprite))
						self["accountLabel" .. i].text = localAccounts[i]
						self["accountBg" .. i]:GetComponent(typeof(UIWidget)).width = self["accountLabel" .. i].width + 20

						self["accountBg" .. i]:GetComponent(typeof(UIWidget)):ResizeCollider()

						UIEventListener.Get(self["accountBg" .. i].gameObject).onClick = function()
							self.parent.userInput.value = localAccounts[i]
						end
					end
				end

				self.isInitAccount = true

				allGroupParent:SetActive(not allGroupParent.gameObject.activeSelf)
			end
			self.bgImg.gameObject:GetComponent(typeof(UIWidget)).width = 250
			self.resNumLabel:GetComponent(typeof(UIWidget)).pivot = UIWidget.Pivot.Center
			self.resNumLabel.width = 250

			self.resNumLabel.gameObject:X(0)

			self.resNumLabel.text = "account(time sort)"
		elseif index == 1 then
			local localChoiceServerData = xyd.db.misc:getValue("local_choice_server_data")

			if not localChoiceServerData then
				self:choiceServer("-1")
			elseif localChoiceServerData == "enzuosi" then
				self:choiceServer("enzuosi")
			elseif localChoiceServerData == "heishen" then
				self:choiceServer("heishen")
			elseif localChoiceServerData == "cbt" then
				self:choiceServer("cbt")
			else
				self:choiceServer("-1")
			end

			UIEventListener.Get(self.go.gameObject).onClick = handler(self, function()
				if self.resNumLabel.text == "默认" then
					self:choiceServer("enzuosi")

					return
				end

				if self.resNumLabel.text == "enzuosi" then
					self:choiceServer("heishen")

					return
				end

				if self.resNumLabel.text == "heishen" then
					self:choiceServer("cbt")

					return
				end

				if self.resNumLabel.text == "cbt" then
					self:choiceServer("enzuosi")

					return
				end
			end)
		elseif index == 2 then
			local localChoiceServerData = xyd.db.misc:getValue("local_choice_guide_data")

			if not localChoiceServerData then
				xyd.NOT_SHOW_GUIDE = false
				self.resNumLabel.text = "has Guide"
			elseif localChoiceServerData == "1" then
				xyd.NOT_SHOW_GUIDE = true
				self.resNumLabel.text = "no Guide"
			elseif localChoiceServerData == "-1" then
				xyd.NOT_SHOW_GUIDE = false
				self.resNumLabel.text = "has Guide"
			end

			UIEventListener.Get(self.go.gameObject).onClick = handler(self, function()
				if self.resNumLabel.text == "has Guide" then
					xyd.NOT_SHOW_GUIDE = true

					xyd.db.misc:setValue({
						value = "1",
						key = "local_choice_guide_data"
					})

					self.resNumLabel.text = "no Guide"

					return
				end

				if self.resNumLabel.text == "no Guide" then
					xyd.NOT_SHOW_GUIDE = false

					xyd.db.misc:setValue({
						value = "-1",
						key = "local_choice_guide_data"
					})

					self.resNumLabel.text = "has Guide"

					return
				end
			end)
		elseif index == 3 then
			local localChoiceIsH5Data = xyd.db.misc:getValue("local_choice_is_h5_main")

			if not localChoiceIsH5Data then
				xyd.Global.mainStyleType = xyd.MainStyle.UNITY
				self.resNumLabel.text = "unity"
			elseif localChoiceIsH5Data == "unity" then
				xyd.Global.mainStyleType = xyd.MainStyle.UNITY
				self.resNumLabel.text = "unity"
			elseif localChoiceIsH5Data == "h5" then
				xyd.Global.mainStyleType = xyd.MainStyle.H5
				self.resNumLabel.text = "h5"
			end

			UIEventListener.Get(self.go.gameObject).onClick = handler(self, function()
				if self.resNumLabel.text == "unity" then
					xyd.db.misc:setValue({
						value = "h5",
						key = "local_choice_is_h5_main"
					})

					xyd.Global.mainStyleType = xyd.MainStyle.H5
					self.resNumLabel.text = "h5"

					return
				end

				if self.resNumLabel.text == "h5" then
					xyd.db.misc:setValue({
						value = "unity",
						key = "local_choice_is_h5_main"
					})

					xyd.Global.mainStyleType = xyd.MainStyle.UNITY
					self.resNumLabel.text = "unity"

					return
				end
			end)
		elseif index == 4 then
			self.bgImg.gameObject:GetComponent(typeof(UIWidget)).width = 250
			self.resNumLabel:GetComponent(typeof(UIWidget)).pivot = UIWidget.Pivot.Center
			self.resNumLabel.width = 250

			self.resNumLabel.gameObject:X(0)

			local is_wait_message_test = xyd.db.misc:getValue("is_wait_message_test")

			is_wait_message_test = is_wait_message_test or "not_wait"

			if is_wait_message_test == "not_wait" then
				self.resNumLabel.text = "not message delay"
				xyd.IS_TEST_WAIT_SERVER = false
			elseif is_wait_message_test == "wait" then
				self.resNumLabel.text = "message delay 1.0s"
				xyd.IS_TEST_WAIT_SERVER = true
			end

			UIEventListener.Get(self.go.gameObject).onClick = handler(self, function()
				local str = "not_wait"

				if self.resNumLabel.text == "message delay 1.0s" then
					str = "not_wait"
					self.resNumLabel.text = "not message delay"
					xyd.IS_TEST_WAIT_SERVER = false
				elseif self.resNumLabel.text == "not message delay" then
					str = "wait"
					self.resNumLabel.text = "message delay 1.0s"
					xyd.IS_TEST_WAIT_SERVER = true
				end

				xyd.db.misc:setValue({
					key = "is_wait_message_test",
					value = str
				})
			end)

			xyd.db.misc:setValue({
				key = "is_wait_message_test",
				value = is_wait_message_test
			})
		end
	end

	function EditorChoiceItem:choiceServer(state)
		if state == "-1" then
			xyd.LoadingController.get().isChoiceServer = "-1"
			self.resNumLabel.text = "默认"
		elseif state == "enzuosi" then
			xyd.LoadingController.get().isChoiceServer = "enzuosi"
			self.resNumLabel.text = "enzuosi"
		elseif state == "heishen" then
			xyd.LoadingController.get().isChoiceServer = "heishen"
			self.resNumLabel.text = "heishen"
		elseif state == "cbt" then
			xyd.LoadingController.get().isChoiceServer = "cbt"
			self.resNumLabel.text = "cbt"
		end

		xyd.db.misc:setValue({
			key = "local_choice_server_data",
			value = state
		})
	end
end

return LoginWindowEdit
