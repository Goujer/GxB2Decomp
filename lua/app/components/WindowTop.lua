-- chunkname: @../../../Product/Bundles/Android/src/app/components/WindowTop.lua

local WindowTop = class("WindowTop", import(".BaseComponent"))
local ResItem = import("app.components.ResItem")

function WindowTop:ctor(go, name, offsetDepth, isActive, callback)
	self.winName = name
	self.isActive = isActive

	if self.isActive == nil then
		self.isActive = true
	end

	self.callback_ = callback
	self.offsetDepth = offsetDepth or 1

	WindowTop.super.ctor(self, go)

	self.resItemList = {}
	self.isCanRefresh_ = true
end

function WindowTop:getPrefabPath()
	return "Prefabs/Components/window_top"
end

function WindowTop:initUI()
	WindowTop.super.initUI(self)

	local goTrans = self.go.transform
	local topWidgt = self.go:GetComponent(typeof(UIWidget))
	local window = xyd.WindowManager.get():getWindow(self.winName)

	self.go:SetActive(false)

	if window then
		topWidgt:SetAnchor(window.window_, 0, 0, 1, -68, 1, 0, 1, 0)

		topWidgt.updateAnchors = UIRect.AnchorUpdate.OnEnable
	end

	self.go:SetActive(true)

	self.closeBtn = goTrans:Find("close_btn")
	self.quickFormationBtn = goTrans:NodeByName("quick_formation_btn").gameObject
	self.quickRed = goTrans:NodeByName("quick_formation_btn/redPoint").gameObject
	self.quickLabel = goTrans:ComponentByName("quick_formation_btn/label", typeof(UILabel))

	if self.isActive then
		self.closeBtn:SetActive(true)
	else
		self.closeBtn:SetActive(false)
	end

	self.resItemGroup = goTrans:ComponentByName("res_item_group", typeof(UIGrid))
	self.bgImg = goTrans:ComponentByName("bg_img", typeof(UISprite))
	self.quickLabel.text = __("QUICK_FORMATION_TEXT24")
end

function WindowTop:getResItemList()
	return self.resItemList
end

function WindowTop:showQuickFormationBtn()
	self.quickFormationBtn:SetActive(true)
	self:registerEvent(xyd.event.SET_QUICK_TEAM, handler(self, self.updateQuickRed))
	self:updateQuickRed()
end

function WindowTop:updateQuickRed()
	local teamNum = xyd.models.quickFormation:getTeamNum()

	self.redStatus_ = xyd.models.quickFormation:getRedStatus()

	local hasRed = false

	for i = 1, teamNum do
		if self.redStatus_[i] == 1 then
			hasRed = true
		end
	end

	self.quickRed:SetActive(hasRed)
end

function WindowTop:onRegister()
	WindowTop.super.onRegister(self)
	self:registerEvent(xyd.event.ITEM_CHANGE, handler(self, self.refresResItems))

	UIEventListener.Get(self.closeBtn.gameObject).onClick = function()
		if xyd.arrayIndexOf(xyd.MainWinDialogCheckWindow, self.winName) > 0 then
			self:checkMainWinDialog()
		end

		xyd.setTouchEnable(self.closeBtn.gameObject, false)

		if self.callback_ then
			self.callback_()
		else
			xyd.WindowManager:get():closeWindow(self.winName)
		end
	end
	UIEventListener.Get(self.quickFormationBtn).onClick = function()
		if not xyd.checkFunctionOpen(xyd.FunctionID.QUICK_FORMATION) then
			return
		end

		xyd.WindowManager.get():openWindow("quick_formation_window", {})
	end
end

function WindowTop:setCloseBtnState(flag)
	xyd.setTouchEnable(self.closeBtn.gameObject, flag)
end

function WindowTop:setItem(list, isNotCommonSort)
	local copyList = {}

	if not isNotCommonSort then
		local isHasCrystal = -1
		local isHasMana = -1

		for i = 1, #list do
			if list[i].id == xyd.ItemID.CRYSTAL then
				isHasCrystal = i
			end

			if list[i].id == xyd.ItemID.MANA then
				isHasMana = i
			end

			if list[i].id ~= xyd.ItemID.CRYSTAL and list[i].id ~= xyd.ItemID.MANA then
				table.insert(copyList, list[i])
			end
		end

		if isHasMana ~= -1 then
			table.insert(copyList, 1, list[isHasMana])
		end

		if isHasCrystal ~= -1 then
			table.insert(copyList, list[isHasCrystal])
		end

		list = copyList
	end

	for i = 1, #list do
		local data = list[i]
		local params = {
			hideBg = true,
			tableId = data.id
		}

		if not self.resItemList[i] then
			local item = ResItem.new(self.resItemGroup.gameObject)

			item:setInfo(params)

			if data.hidePlus or data.hide_plus then
				item:hidePlus()
			end

			if data.callback then
				item:setBtnCallback(data.callback)
			end

			if data.show_tips then
				item:showTips()
			end

			item:showBothLine(true)

			self.resItemList[i] = item
		else
			self.resItemList[i]:canShow(true)
			self.resItemList[i]:setInfo(params)

			if data.callback then
				self.resItemList[i]:setBtnCallback(data.callback)
			end

			if data.hidePlus or data.hide_plus then
				self.resItemList[i]:hidePlus()
			else
				self.resItemList[i]:showPlus()
			end
		end
	end

	for idx, item in ipairs(self.resItemList) do
		if not list[idx] then
			item:canShow(false)
		end
	end

	local showItemNum = 0
	local showItemArr = {}

	for i in pairs(self.resItemList) do
		if self.resItemList[i].go.activeSelf then
			showItemNum = showItemNum + 1

			table.insert(showItemArr, self.resItemList[i])
		end
	end

	for i = #showItemArr, 1, -1 do
		if showItemNum == 1 and #showItemArr == 1 then
			showItemArr[1]:showBothLine(true)
			showItemArr[1]:setPos(2, 200)

			self.resItemGroup.cellWidth = 222
		elseif showItemNum == 2 and #showItemArr == 2 then
			showItemArr[#showItemArr]:setPos(2, 200)

			self.resItemGroup.cellWidth = 222
		elseif showItemNum == 3 and #showItemArr == 3 then
			showItemArr[i]:setPos(3, 175)

			self.resItemGroup.cellWidth = 175
		end
	end

	self.resItemGroup:Reposition()
	table.sort(showItemArr, function(a, b)
		if a.go.transform.localPosition.x < b.go.transform.localPosition.x then
			return true
		else
			return false
		end
	end)

	for i in pairs(showItemArr) do
		if i == 1 then
			showItemArr[i]:showBothLine(true)
		else
			showItemArr[i]:showBothLine(false, "left")
			showItemArr[i]:showBothLine(true, "right")
		end
	end
end

function WindowTop:addItemInResList(itemRoot)
	ResCache.AddChild(self.resItemGroup.gameObject, itemRoot)
	self.resItemGroup:Reposition()
end

function WindowTop:refresResItems()
	if not self.isCanRefresh_ then
		return
	end

	for i = 1, #self.resItemList do
		self.resItemList[i]:refresh()
	end
end

function WindowTop:setTitle(text)
	return
end

function WindowTop:getResItems()
	return self.resItemList
end

function WindowTop:setCanRefresh(flag)
	self.isCanRefresh_ = flag
end

function WindowTop:checkMainWinDialog()
	local win = xyd.WindowManager.get():getWindow("main_window")

	if win then
		win:judgePlayStoryDialog()
	end
end

function WindowTop:iosTestChangeUI()
	xyd.setUISprite(self.bgImg, nil, "top_bg_r_v3_ios_test")
	xyd.setUISprite(self.closeBtn:GetComponent(typeof(UISprite)), nil, "win_back_btn_ios_test")
end

function WindowTop:addLeftTop(name, imgName, scale, clickFun)
	if not self.leftTopCon then
		self.leftTopCon = NGUITools.AddChild(self.go, self.bgImg.gameObject)
		self.leftTopCon.name = "leftTopCon"

		local sprite = self.leftTopCon:GetComponent(typeof(UISprite))

		UnityEngine.Object.Destroy(sprite)

		self.leftTopCon_UIWidget = self.leftTopCon:AddComponent(typeof(UIWidget))
		self.leftTopCon_UIWidget.pivot = UIWidget.Pivot.Center
		self.leftTopCon_depth = self.bgImg:GetComponent(typeof(UIWidget)).depth + 2
		self.leftTopCon_UIWidget.depth = self.leftTopCon_depth
		self.leftTopCon_UIWidget.width = 2
		self.leftTopCon_UIWidget.height = 2
		self.leftTopCon_UILayout = self.leftTopCon:AddComponent(typeof(UILayout))

		self.leftTopCon:SetLocalPosition(-284, -7, 0)

		self.leftTopCon_UIWidget.updateAnchors = UIRect.AnchorUpdate.OnUpdate

		self.leftTopCon_UIWidget:SetAnchor(self.go, 0, 75, 0, 26, 0, 77, 0, 28)
	end

	if not self[name] then
		self[name] = NGUITools.AddChild(self.leftTopCon, self.bgImg.gameObject)
		self[name].name = name
		self[name .. "UISprite"] = self[name]:GetComponent(typeof(UISprite))

		xyd.setUISpriteAsync(self[name .. "UISprite"], nil, imgName, function()
			self[name].gameObject:SetLocalScale(scale, scale, scale)

			self[name .. "BoxCollider"] = self[name]:AddComponent(typeof(UnityEngine.BoxCollider))
			self[name .. "BoxCollider"].size = Vector3(self[name .. "UISprite"].width, self[name .. "UISprite"].height, 0)

			self.leftTopCon_UILayout:Reposition()
		end, nil, true)

		self[name .. "UIWidget"] = self[name]:GetComponent(typeof(UIWidget))
		self[name .. "UIWidget"].depth = self.leftTopCon_depth + 2
		self[name .. "UIWidget"].pivot = UIWidget.Pivot.Center
		UIEventListener.Get(self[name].gameObject).onClick = clickFun
	end
end

function WindowTop:hideBg()
	self.bgImg.gameObject:SetActive(false)
end

function WindowTop:addTopBox()
	self.go.gameObject:AddComponent(typeof(UnityEngine.BoxCollider))

	local go_UIWidget = self.go.gameObject:GetComponent(typeof(UIWidget))

	go_UIWidget.autoResizeBoxCollider = true

	go_UIWidget:ResizeCollider()
end

return WindowTop
