-- chunkname: @../../../Product/Bundles/Android/src/app/components/DressMainBackpackContent.lua

local DressMainBackpackContent = class("DressMainBackpackContent", import("app.components.CopyComponent"))
local FixedMultiWrapContent = import("app.common.ui.FixedMultiWrapContent")
local DressItem = class("DressItem", import("app.components.CopyComponent"))

function DressMainBackpackContent:ctor(goItem, data)
	DressMainBackpackContent.super.ctor(self, goItem)

	self.data = data
end

function DressMainBackpackContent:initUI()
	self:getUIComponent()
	DressMainBackpackContent.super.initUI(self)
	self:registerEvent()
	self:initPageTwo()
end

function DressMainBackpackContent:getUIComponent()
	self.page2 = self.go.gameObject
	self.btnCircles = self.page2:NodeByName("btnCircles").gameObject
	self.btnQualityChosen = self.btnCircles:NodeByName("btnQualityChosen").gameObject

	for i = 0, 5 do
		self["btnCircle" .. i] = self.btnCircles:NodeByName("btnCircle" .. i).gameObject
	end

	self.equipBtn = self.btnCircles:NodeByName("equipBtn").gameObject
	self.equipBtnLabel = self.equipBtn:ComponentByName("equipBtnLabel", typeof(UILabel))
	self.scroll_drag = self.page2:NodeByName("scroll_drag").gameObject
	self.scroll_view = self.page2:NodeByName("scroll_view").gameObject
	self.scroll_view_UIScrollView = self.page2:ComponentByName("scroll_view", typeof(UIScrollView))
	self.wrap_content = self.scroll_view:NodeByName("wrap_content").gameObject
	self.wrap_content_UIWrapContent = self.scroll_view:ComponentByName("wrap_content", typeof(UIWrapContent))
	self.groupNone = self.page2:NodeByName("groupNone").gameObject
	self.imgNoneShow = self.groupNone:ComponentByName("imgNoneShow", typeof(UISprite))
	self.labelNoneTips = self.groupNone:ComponentByName("labelNoneTips", typeof(UILabel))
	self.dressItemEg = self.page2:NodeByName("dressItemEg").gameObject
	self.wrapContent_ = FixedMultiWrapContent.new(self.scroll_view_UIScrollView, self.wrap_content_UIWrapContent, self.dressItemEg, DressItem, self)
end

function DressMainBackpackContent:registerEvent()
	for k = 0, 5 do
		UIEventListener.Get(self["btnCircle" .. k]).onClick = function()
			self:onQualityBtn(k)
		end
	end

	UIEventListener.Get(self.equipBtn.gameObject).onClick = handler(self, function()
		if xyd.models.dress:isfunctionOpen() then
			xyd.WindowManager.get():openWindow("dress_collection_window", {})

			return
		else
			xyd.alertTips(__("NEW_FUNCTION_TIP"))
		end
	end)
end

function DressMainBackpackContent:initPageTwo()
	self.showQuality = 0
	self.equipBtnLabel.text = __("PERSON_DRESS_MAIN_15")
	self.items_arr = xyd.models.dress:getDressItems()

	self:onQualityBtn(-1)
end

function DressMainBackpackContent:onQualityBtn(index)
	local isPlaySoundId = true

	if self.showQuality ~= index or index == -1 then
		if index == -1 then
			index = 0
		end

		isPlaySoundId = false

		local pos = self["btnCircle" .. index].transform.localPosition

		self.btnQualityChosen:SetLocalPosition(pos.x, pos.y, pos.z)

		self.showQuality = index
	elseif self.showQuality == index then
		if self.showQuality == 0 then
			return
		else
			self:onQualityBtn(0)

			return
		end
	end

	if isPlaySoundId then
		xyd.SoundManager.get():playSound(xyd.SoundID.BUTTON)
	end

	if #self.items_arr[index] == 0 then
		self.labelNoneTips.text = __("PERSON_DRESS_MAIN_" .. index + 16)

		self.groupNone:SetActive(true)
		self.wrapContent_:setInfos({}, {})

		return
	else
		self.groupNone:SetActive(false)
	end

	local infos = self:getInfos(index)

	self:waitForFrame(1, function()
		self.wrapContent_:setInfos(infos, {})
		self.scroll_view_UIScrollView:ResetPosition()
	end)
end

function DressMainBackpackContent:getInfos(index)
	return self.items_arr[index]
end

function DressMainBackpackContent:updateBackItems()
	local infos = self:getInfos(self.showQuality)

	self:waitForFrame(1, function()
		self.wrapContent_:setInfos(infos, {
			keepPosition = true
		})
	end)
end

function DressItem:ctor(go, parent)
	self.go = go
	self.parent = parent
	self.itemCon = self.go:NodeByName("itemCon").gameObject
end

function DressItem:update(index, realIndex, info)
	if not info then
		self.go:SetActive(false)

		return
	else
		self.go:SetActive(true)
	end

	local dress_id = xyd.tables.senpaiDressItemTable:getDressId(info.itemID)
	local local_choice = xyd.models.dress:getLocalChoice(dress_id)
	local image = ""

	if self.itemIcon and self.itemIcon:getImgIconSrouce() then
		image = self.itemIcon:getImgIconSrouce()
	end

	if local_choice then
		local all_styles = xyd.tables.senpaiDressTable:getStyles(dress_id)

		for i in pairs(all_styles) do
			if all_styles[i] == local_choice then
				image = xyd.tables.senpaiDressItemTable:getIcon(info.itemID)[i]

				break
			end
		end
	end

	if self.itemIcon then
		self.itemIcon:showRedMark(xyd.models.dress:checkItemCanUp(info.itemID))
	end

	local flag = true

	if self.itemIcon and self.itemIcon:getImgIconSrouce() and self.itemIcon:getImgIconSrouce() ~= image then
		flag = false
	end

	if self.curID == info.itemID and flag then
		return
	end

	self.curID = info.itemID

	local upArrowCallback
	local next_id = xyd.tables.senpaiDressItemTable:getNextId(info.itemID)

	if next_id and next_id ~= 0 then
		function upArrowCallback()
			if xyd.models.dress:isfunctionOpen() then
				xyd.WindowManager.get():openWindow("dress_item_up_window", {
					item_id = info.itemID
				})

				local item_tips_wd = xyd.WindowManager.get():getWindow("item_tips_window")

				if item_tips_wd then
					item_tips_wd:close()
				end

				return
			else
				xyd.alertTips(__("NEW_FUNCTION_TIP"))
			end
		end
	end

	if not self.itemIcon then
		local params = {
			isAddUIDragScrollView = true,
			show_has_num = true,
			itemID = info.itemID,
			uiRoot = self.itemCon.gameObject,
			upArrowCallback = upArrowCallback,
			wndType = xyd.ItemTipsWndType.DRESS_BACKPACK
		}

		self.itemIcon = xyd.getItemIcon(params)

		self.itemIcon:showRedMark(xyd.models.dress:checkItemCanUp(info.itemID))
	else
		self.itemIcon:setInfo({
			show_has_num = true,
			itemID = info.itemID,
			upArrowCallback = upArrowCallback,
			wndType = xyd.ItemTipsWndType.DRESS_BACKPACK
		})
	end
end

return DressMainBackpackContent
