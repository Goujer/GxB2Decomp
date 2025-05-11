-- chunkname: @../../../Product/Bundles/Android/src/app/components/ResItem.lua

local ResItem = class("ResItem", import(".BaseComponent"))
local CountDown = import("app.components.CountDown")

function ResItem:ctor(go)
	ResItem.super.ctor(self, go)

	self.params = {}
	self.curNum = 0
	self.tableId = 0
	self.callback = nil
end

function ResItem:getPrefabPath()
	return "Prefabs/Components/res_item"
end

function ResItem:initUI()
	ResItem.super.initUI(self)

	local goTrans = self.go.transform

	self.goWidget = self.go:GetComponent(typeof(UIWidget))
	self.cdBgImg = goTrans:Find("cd_bg_img")
	self.plusBtn = goTrans:Find("plus_btn")
	self.redImg = goTrans:Find("red_img")
	self.bonusImg = goTrans:Find("bonus_img")
	self.timeLabelTrans = goTrans:Find("time_label")
	self.resIconTrans = goTrans:Find("res_icon")
	self.resNumTrans = goTrans:Find("res_num_label")
	self.line_left = goTrans:Find("line_left")
	self.line_right = goTrans:Find("line_right")

	local timeLabelNode = goTrans:ComponentByName("time_label", typeof(UILabel))

	self.timeLabel = CountDown.new(timeLabelNode)
	self.resIconImg = goTrans:ComponentByName("res_icon", typeof(UISprite))
	self.resNumLabel = goTrans:ComponentByName("res_num_label", typeof(UILabel))
	self.bgImg = goTrans:ComponentByName("bg_img", typeof(UISprite))

	self.cdBgImg.gameObject:SetActive(false)
	self.redImg.gameObject:SetActive(false)
	self.timeLabelTrans.gameObject:SetActive(false)

	local plusBtnImgName = "icon_plus_v3"

	if xyd.isH5() then
		plusBtnImgName = plusBtnImgName .. "_h5"
	end

	xyd.setUISprite(self.plusBtn:GetComponent(typeof(UISprite)), nil, plusBtnImgName)
end

function ResItem:setLeftLinePos(x, y, z)
	self.line_left.transform:SetLocalPosition(x, y, z)
end

function ResItem:setRightLinePos(x, y, z)
	self.line_right.transform:SetLocalPosition(x, y, z)
end

function ResItem:setInfo(params)
	self.params = params
	self.tableId = params.tableId
	self.notSmall = params.notSmall
	self.bgSize = params.bgSize
	self.curNum = params.num or xyd.models.backpack:getItemNumByID(self.tableId)
	self.callback = params.callback
	self.showBonus = params.showBonus or false
	self.isRefreshWithItemChange = params.isRefreshWithItemChange

	self:initItem()
	self:onRegisterEvent()
end

function ResItem:onRegisterEvent()
	if self.callback and not self.params.hide_plus then
		UIEventListener.Get(self.go).onClick = function()
			if self.callback then
				self.callback()
			end
		end
	end

	self:addTips()
end

function ResItem:addTips()
	if self.params.show_tips and not self.hasAddTipsEvent_ then
		self.hasAddTipsEvent_ = true
		UIEventListener.Get(self.go).onClick = function()
			local params = {
				notShowNotSell = true,
				show_has_num = true,
				itemID = self.tableId,
				wndType = xyd.ItemTipsWndType.BACKPACK,
				clickCloseWnd = self.params.clickCloseWnd,
				showGetWays = self.params.showGetWays
			}

			xyd.WindowManager.get():openWindow("item_tips_window", params)
		end
	end
end

function ResItem:getItemNum()
	if self.resNumLabel then
		return tonumber(self.resNumLabel.text)
	end

	return 0
end

function ResItem:getItemID()
	return self.tableId or 0
end

function ResItem:refreshRedMark()
	if xyd.models.midas.is_free_award == 0 then
		self.redImg.gameObject:SetActive(true)
	else
		self.redImg.gameObject:SetActive(false)
	end
end

function ResItem:updateNum()
	if self.tableId == xyd.ItemID.ASSESSMENT_TICKET or self.tableId == xyd.ItemID.ACCOMPLISH_TICKET then
		return
	end

	if self.tableId == xyd.ItemID.CRYSTAL or self.tableId == xyd.ItemID.MAGIC_DUST then
		self.resNumLabel.text = self.params.num or tostring(xyd.models.backpack:getItemNumByID(self.tableId))
	else
		self.resNumLabel.text = self.params.num or tostring(xyd.getRoughDisplayNumber(xyd.models.backpack:getItemNumByID(self.tableId)))
	end
end

function ResItem:initItem()
	self:updateNum()

	local path = tostring(xyd.tables.itemTable:getIcon(self.tableId)) .. "_small"

	if self.tableId and not self.notSmall then
		local index = xyd.Sprites2Atlas.table_map[path]

		if not index then
			self.notSmall = true
		end
	end

	if self.tableId and not self.notSmall then
		xyd.setUISpriteAsync(self.resIconImg, nil, path)
	elseif self.tableId and self.notSmall then
		local path = tostring(xyd.tables.itemTable:getIcon(self.tableId))

		xyd.setUISpriteAsync(self.resIconImg, nil, path)
	end

	if self.bgSize then
		self.bgImg.width = self.bgSize.w
		self.bgImg.height = self.bgSize.h
	end

	if self.params.hideBg then
		self.bgImg:SetActive(false)
	end

	if xyd.isH5() then
		self.bgImg:SetActive(true)
	end

	if self.params.hidePlus == true then
		self:hidePlus()
	elseif not self.callback then
		if self.tableId == xyd.ItemID.MANA then
			function self.callback()
				xyd.WindowManager.get():openWindow("midas_window")
			end

			if not self.params.no_red then
				self:refreshRedMark()
				self:registerEvent(xyd.event.MIDAS_BUY_2, handler(self, self.refreshRedMark))
				self:registerEvent(xyd.event.GET_MIDAS_INFO_2, handler(self, self.refreshRedMark))
			end
		elseif self.tableId == xyd.ItemID.CRYSTAL then
			function self.callback()
				local actData = xyd.models.activity:getActivity(xyd.ActivityID.TRIPLE_FIRST_CHARGE)

				if actData then
					local startTime = actData.start_time

					xyd.db.misc:setValue({
						key = "triple_first_charge_tips",
						value = tostring(startTime)
					})
					self.bonusImg:SetActive(false)
				end

				xyd.WindowManager.get():openWindow("vip_window")
			end

			if self.showBonus and xyd.models.activity:isOpen(xyd.ActivityID.TRIPLE_FIRST_CHARGE) then
				local actData = xyd.models.activity:getActivity(xyd.ActivityID.TRIPLE_FIRST_CHARGE)
				local startTime = actData.start_time
				local recordTime = tonumber(xyd.db.misc:getValue("triple_first_charge_tips")) or 0

				if recordTime ~= startTime then
					self.bonusImg:SetActive(true)
				else
					self.bonusImg:SetActive(false)
				end
			end
		elseif self.tableId == xyd.ItemID.SHRINE_TICKET then
			function self.callback()
				if not xyd.models.shrineHurdleModel:checkInBattleTime() then
					xyd.alertTips(__("SHRINE_HURDLE_TEXT40"))

					return
				end

				local cost = xyd.split(xyd.tables.miscTable:getVal("shrine_hurdle_ticket_buy_cost"), "#")

				xyd.WindowManager.get():openWindow("item_buy_window", {
					hide_min_max = false,
					item_no_click = false,
					cost = cost,
					max_num = xyd.models.shrineHurdleModel:getCanBuyTimes(),
					itemParams = {
						num = 1,
						itemID = xyd.ItemID.SHRINE_TICKET
					},
					buyCallback = function(num)
						if xyd.models.shrineHurdleModel:getCanBuyTimes() <= 0 then
							xyd.showToast(__("FULL_BUY_SLOT_TIME"))

							xyd.WindowManager.get():getWindow("item_buy_window").skipClose = true

							return
						end

						local msg = messages_pb:exchange_shrine_card_req()

						msg.num = num

						xyd.Backend.get():request(xyd.mid.EXCHANGE_SHRINE_CARD, msg)
					end,
					limitText = __("BUY_GIFTBAG_LIMIT", tostring(xyd.models.shrineHurdleModel:getBuyTimes()) .. "/" .. tostring(xyd.tables.miscTable:getVal("shrine_hurdle_ticket_buy_limit")))
				})
			end
		else
			function self.callback()
				local exchange_id = xyd.ExchangeItem["_" .. tostring(xyd.ItemID.CRYSTAL) .. "TO" .. tostring(self.tableId)]

				if exchange_id then
					xyd.WindowManager:get():openWindow("item_purchase_window", {
						exchange_id = exchange_id
					})
				else
					local params = {
						itemID = self.tableId,
						wndType = xyd.ItemTipsWndType.BACKPACK
					}

					xyd.WindowManager.get():openWindow("item_tips_window", params)
				end
			end
		end
	end

	self:setPos(self.setPosIndex, self.setPosW)
	self:addTips()
end

function ResItem:setTableId(tableId)
	self.tableId = tableId
	self.callback = nil

	self:initItem()
end

function ResItem:refresh()
	if self.isRefreshWithItemChange == false then
		return
	end

	self:initItem()
end

function ResItem:getPlusBtn()
	return self.plusBtn
end

function ResItem:getResIcon()
	return self.resIconTrans
end

function ResItem:getRedMarkGo()
	return self.redImg
end

function ResItem:hidePlus()
	self.params.hidePlus = true

	self.plusBtn:SetActive(false)
	self.redImg:SetActive(false)

	self.resNumTrans.localPosition.x = 12
end

function ResItem:showPlus()
	self.params.hidePlus = false

	self.plusBtn:SetActive(true)
end

function ResItem:showTips()
	self.params.show_tips = true
end

function ResItem:setTimeLabel(visible)
	self.cdBgImg:SetActive(visible)
	self.timeLabelTrans:SetActive(visible)
end

function ResItem:getTimeLabel()
	return self.timeLabel
end

function ResItem:setItemNum(num, limit)
	if self.tableId == xyd.ItemID.CRYSTAL or self.tableId == xyd.ItemID.ACCOMPLISH_TICKET or self.tableId == xyd.ItemID.ASSESSMENT_TICKET or self.tableId == xyd.ItemID.MAGIC_DUST then
		self.resNumLabel.text = tostring(num)
	else
		self.resNumLabel.text = tostring(xyd.getRoughDisplayNumber(num))
	end

	if limit then
		self.resNumLabel.text = tostring(xyd.getRoughDisplayNumber(num)) .. "/" .. limit
	end

	self.curNum = tonumber(num)
end

function ResItem:getTrueNum()
	return self.curNum
end

function ResItem:canShow(canShow)
	self.go:SetActive(canShow)
end

function ResItem:setBtnCallback(callback)
	self.callback = callback
end

function ResItem:registerItemChange()
	self:registerEvent(xyd.event.ITEM_CHANGE, handler(self, self.refresh))
end

function ResItem:showBothLine(visible, showType)
	if xyd.isH5() then
		showType = ""
		visible = false
	end

	if showType == nil or showType == "" then
		self.line_left:SetActive(visible)
		self.line_right:SetActive(visible)
	end

	if showType == "left" then
		self.line_left:SetActive(visible)
	end

	if showType == "right" then
		self.line_right:SetActive(visible)
	end
end

function ResItem:iosTestChangeUI()
	xyd.setUISprite(self.plusBtn:GetComponent(typeof(UISprite)), nil, "icon_plus_v3_ios_test")
	xyd.setUISprite(self.line_left:GetComponent(typeof(UISprite)), nil, "top_item_r_v3_ios_test")
	xyd.setUISprite(self.line_right:GetComponent(typeof(UISprite)), nil, "top_item_r_v3_ios_test")
end

function ResItem:setPos(index, w)
	self.setPosIndex = index
	self.setPosW = w

	if index == nil or w == nil then
		return
	end

	if index == 1 or index == 2 then
		self.bgImg.width = w

		self.line_right:X(116.4)
		self.resIconImg:SetLeftAnchor(self.bgImg.gameObject, 0, 10)
		self.resIconImg:SetRightAnchor(self.bgImg.gameObject, 0, 46)
	end

	if index == 3 then
		self.bgImg.width = w

		self.line_right:X(70)

		if xyd.isH5() then
			self.resIconImg:SetLeftAnchor(self.bgImg.gameObject, 0, 10)
			self.resIconImg:SetRightAnchor(self.bgImg.gameObject, 0, 46)
			self.plusBtn:X(60)
		else
			self.resIconImg:SetLeftAnchor(self.bgImg.gameObject, 0, -9)
			self.resIconImg:SetRightAnchor(self.bgImg.gameObject, 0, 27)
			self.plusBtn:X(50)
			self.resNumLabel:X(50)
		end
	end
end

function ResItem:setResNumLabelPosx(posx)
	self.resNumLabel.transform:X(posx)
end

function ResItem:setRedIconScale(scale)
	self.redImg:SetLocalScale(scale, scale, 1)
end

function ResItem:setRedIconScale(scale)
	self.redImg:SetLocalScale(scale, scale, 1)
end

function ResItem:setIsRefreshWithItemChange(state)
	self.isRefreshWithItemChange = state
end

return ResItem
