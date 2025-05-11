-- chunkname: @../../../Product/Bundles/Android/src/app/components/EntranceTestPartnerWindowChooseGroup.lua

local FormationItem = class("FormationItem")

function FormationItem:ctor(go, parent)
	self.parent_ = parent
	self.uiRoot_ = go
	self.heroIcon_ = nil

	if not self.parent_ then
		self.win_ = xyd.getWindow("battle_formation_window")
	else
		self.win_ = self.parent_
	end

	self.isFriend = false
end

function FormationItem:setIsFriend(isFriend)
	self.isFriend = isFriend
end

function FormationItem:update(index, realIndex, info)
	if not info then
		self.uiRoot_:SetActive(false)

		return
	end

	self.uiRoot_:SetActive(true)

	if not self.heroIcon_ then
		self.heroIcon_ = import("app.components.HeroIcon").new(self.uiRoot_, self.parent_.partnerRenderPanel)
	end

	self.partner_ = info.partnerInfo
	self.callbackFunc = info.callbackFunc
	self.partnerId_ = self.partner_.partnerID
	self.partner_.noClickSelected = false
	self.partner_.callback = handler(self, self.onClick)
	self.partner_.dragScrollView = self.parent_.partnerScrollView
	self.partner_.is_vowed = self.partner_.is_vowed
	self.partner_.noClick = false

	if self.win_ and self.win_.isDeath and self.win_.checkNeedGrey and self.win_:checkNeedGrey() then
		local flag = self.win_:isDeath(self.partnerId_)

		if flag then
			self.heroIcon_:setGrey()
		else
			self.heroIcon_:setOrigin()
		end

		self.isDeath_ = flag
	end

	if self.choosePart then
		self.choosePart:SetActive(false)

		for key, partner in pairs(self.parent_.partnerParams) do
			if partner.partner_id and partner.partner_id == self.partner_.partnerID then
				self.choosePart:SetActive(true)
			end
		end
	end

	if not self.choosePart and self.parent_ and self.parent_.partnerParams and #self.parent_.partnerParams > 0 then
		for key, partner in pairs(self.parent_.partnerParams) do
			if not self.choosePart and partner.partner_id and partner.partner_id == self.partner_.partnerID then
				self.choosePart = NGUITools.AddChild(self.uiRoot_.gameObject, self.parent_.choosePart)

				self.choosePart:X(0)
				self.choosePart:Y(-34)
			end
		end
	end

	self.heroIcon_:setInfo(self.partner_)
	self.heroIcon_:setEntranceTestFinish()

	if self.partner_.tableID == self.parent_.tableID then
		self:setIsChoose(true)

		self.parent_.lastItem = self
	end

	self.heroIcon_:setLock(false)

	local period = xyd.tables.activityWarmupArenaPartnerTable:getPeriod(self.partnerId_)

	if period and period > 0 then
		local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ENTRANCE_TEST)

		if activityData:getPvePartnerIsLock(period) then
			self.heroIcon_:setLock(true)
		else
			self.heroIcon_:setLock(false)
		end
	end
end

function FormationItem:onClick()
	if self.partner_.tableID == self.parent_.tableID then
		return
	end

	self.callbackFunc(self.partner_, self)
	self:setIsChoose(true)
end

function FormationItem:setIsChoose(status)
	if self.heroIcon_ then
		self.heroIcon_:setSelected(status)
	end
end

function FormationItem:getHeroIcon()
	return self.heroIcon_
end

function FormationItem:getPartnerId()
	return self.partnerId_
end

function FormationItem:setShowActive(canShow)
	self.uiRoot_.gameObject:SetActive(canShow)
end

function FormationItem:getGameObject()
	return self.uiRoot_
end

function FormationItem:getPartner()
	return self.partner_
end

function FormationItem:changeFinishState()
	if self.heroIcon_ then
		self.heroIcon_:setEntranceTestFinish()
	end
end

local EntranceTestPartnerWindowChooseGroup = class("EntranceTestPartnerWindowChooseGroup", import(".BaseComponent"))

function EntranceTestPartnerWindowChooseGroup:ctor(parentGo, params)
	self.params = params
	self.tableID = params.tableID
	self.sort_type = xyd.partnerSortType.LEV

	if params.sort_type then
		self.sort_type = params.sort_type
	end

	self.current_group = params.current_group or 0
	self.partnerParams = params.partnerParams

	EntranceTestPartnerWindowChooseGroup.super.ctor(self, parentGo)
end

function EntranceTestPartnerWindowChooseGroup:getPrefabPath()
	return "Prefabs/Components/entrance_test_partner_window_choose_group"
end

function EntranceTestPartnerWindowChooseGroup:initUI()
	self:getUIComponent()
	EntranceTestPartnerWindowChooseGroup.super.initUI(self)
	self:layout()
end

function EntranceTestPartnerWindowChooseGroup:getGo()
	return self.go.gameObject
end

function EntranceTestPartnerWindowChooseGroup:getUIComponent()
	self.chooseGroup = self.go:NodeByName("choose_group").gameObject
	self.chooseGroupWidget = self.chooseGroup:GetComponent(typeof(UIWidget))

	local height = xyd.Global.getRealHeight()

	self.chooseGroupWidget.height = (height - 1280) / 279 * 169 + 464
	self.fGroup = self.chooseGroup:NodeByName("f_group").gameObject
	self.partnerScrollView = self.chooseGroup:ComponentByName("partner_scroller", typeof(UIScrollView))
	self.partnerRenderPanel = self.chooseGroup:ComponentByName("partner_scroller", typeof(UIPanel))
	self.partnerScroller_uiPanel = self.chooseGroup:ComponentByName("partner_scroller", typeof(UIPanel))
	self.partnerListWarpContent_ = self.chooseGroup:ComponentByName("partner_scroller/partner_container", typeof(MultiRowWrapContent))
	self.heroRoot = self.chooseGroup:NodeByName("hero_root").gameObject
	self.choosePart = self.chooseGroup:NodeByName("choosePart").gameObject
	self.partnerNone = self.chooseGroup:NodeByName("partnerNone").gameObject
	self.labelNoneTips = self.partnerNone:ComponentByName("labelNoneTips", typeof(UILabel))
end

function EntranceTestPartnerWindowChooseGroup:layout()
	self:initPartnerList()

	self.labelNoneTips.text = __("NO_PARTNER_2")
end

function EntranceTestPartnerWindowChooseGroup:initPartnerList()
	local scale = 0.9
	local params = {
		isCanUnSelected = 1,
		gap = 20,
		callback = handler(self, function(self, group)
			self:onSelectGroup(group)
		end),
		width = self.fGroup:GetComponent(typeof(UIWidget)).width,
		scale = scale,
		chosenGroup = self.current_group
	}
	local partnerFilter = import("app.components.PartnerFilter").new(self.fGroup.gameObject, params)

	self.partnerFilter = partnerFilter
	self.partnerMultiWrap_ = require("app.common.ui.FixedMultiWrapContent").new(self.partnerScrollView, self.partnerListWarpContent_, self.heroRoot, FormationItem, self)

	self:iniPartnerData(self.current_group, true)
end

function EntranceTestPartnerWindowChooseGroup:iniPartnerData(groupID, needUpdateTop)
	local partnerDataList = self:initNormalPartnerData(groupID, needUpdateTop)

	self.partnerMultiWrap_:setInfos(partnerDataList, {})
	self.partnerNone.gameObject:SetActive(false)

	if partnerDataList and #partnerDataList == 0 then
		self.partnerNone.gameObject:SetActive(true)
	end
end

function EntranceTestPartnerWindowChooseGroup:onSelectGroup(group)
	if self.selectGroup_ == group then
		return
	end

	self.selectGroup_ = group

	self:iniPartnerData(group, false)
end

function EntranceTestPartnerWindowChooseGroup:initNormalPartnerData(groupID, needUpdateTop)
	local partnerList = self:getPartners()
	local lvSortedList = partnerList[tostring(self.sort_type) .. "_" .. groupID .. "_0"]
	local partnerDataList = {}

	self.power = 0

	for _, partnerId in ipairs(lvSortedList) do
		if partnerId ~= 0 then
			local partnerInfo = partnerId

			partnerInfo.noClick = true

			local isS = self:isSelected(partnerInfo.partnerID or partnerId, self.nowPartnerList, false)
			local data = {
				callbackFunc = handler(self, function(a, callbackPInfo, clickItem)
					self:onClickheroIcon(callbackPInfo, clickItem)
				end),
				partnerInfo = partnerInfo,
				isSelected = isS.isSelected
			}

			table.insert(partnerDataList, data)
		end
	end

	return partnerDataList
end

function EntranceTestPartnerWindowChooseGroup:getPartners()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ENTRANCE_TEST)
	local list = activityData:getSortedPartners()

	return list
end

function EntranceTestPartnerWindowChooseGroup:isSelected(cPartnerId, Plist, isDel)
	return {
		posId = -1,
		isSelected = false
	}
end

function EntranceTestPartnerWindowChooseGroup:onClickheroIcon(partnerInfo, clickItem)
	if self.lastItem then
		self.lastItem:setIsChoose(false)
		self.lastItem:changeFinishState()
	end

	self.lastItem = clickItem
	self.tableID = clickItem:getPartner().tableID

	self.params.onClickPartner(partnerInfo)
end

return EntranceTestPartnerWindowChooseGroup
