-- chunkname: @../../../Product/Bundles/Android/src/app/components/SinglePartnerWayItem.lua

local SinglePartnerWayItem = class("SinglePartnerWayItem", import(".SingleWayItem"))

function SinglePartnerWayItem:ctor(parentGo, params)
	self.info = params

	SinglePartnerWayItem.super.ctor(self, parentGo, params)
end

function SinglePartnerWayItem:initUI()
	SinglePartnerWayItem.super.initUI(self)
	self:layout()
end

function SinglePartnerWayItem:layout()
	self.btnSelect_:GetComponent(typeof(UIWidget)).width = 540

	self.btnIcon.transform:SetLocalPosition(250, 0, 0)
end

function SinglePartnerWayItem:onTouch()
	SinglePartnerWayItem.super.onTouch(self)

	if self.maskImg.activeSelf == true then
		return
	end

	local ifClose = xyd.tables.getWayTable:isClose(self.info.id)

	if ifClose == 1 then
		if tonumber(self.info.id) ~= 30 then
			xyd.WindowManager.get():closeWindow("shenxue_window")
		end

		xyd.WindowManager.get():closeWindow("partner_info")
	end

	local win = xyd.WindowManager:get():getWindow("shenxue_select_window")

	if win then
		xyd.WindowManager.get():closeWindow("shenxue_select_window")
	end

	win = xyd.WindowManager:get():getWindow("prophet_window")

	if win and tonumber(self.info.id) ~= 8 then
		xyd.WindowManager.get():closeWindow("prophet_window")
	end
end

return SinglePartnerWayItem
