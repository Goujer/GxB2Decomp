-- chunkname: @../../../Product/Bundles/Android/src/app/components/PotentialityComponent.lua

local PotentialityComponent = class("PotentialityComponent", import(".BaseComponent"))
local PotentialIcon = import(".PotentialIcon")

function PotentialityComponent:ctor(parentGo, isGuest)
	self.currentState = "normal"
	self.skillItemList_ = {}
	self.is_guest = isGuest

	PotentialityComponent.super.ctor(self, parentGo)
end

function PotentialityComponent:getPrefabPath()
	return "Prefabs/Components/potentiality_component2"
end

function PotentialityComponent:initUI()
	PotentialityComponent.super.initUI(self)
	self:getCompoent()
	self:layoutUI()
end

function PotentialityComponent:hideBtn()
	self.switchPotentialityBtn_:SetActive(false)
end

function PotentialityComponent:getCompoent()
	local goTrans = self.go.transform

	self.starImg_ = goTrans:ComponentByName("starImg", typeof(UISprite))
	self.starLabel_ = goTrans:ComponentByName("starLabel", typeof(UILabel))
	self.skillGroup_ = goTrans:NodeByName("skillGroup").gameObject
	self.backBtn_ = goTrans:NodeByName("backBtn").gameObject
	self.backBtnLabel_ = goTrans:ComponentByName("backBtn/label", typeof(UILabel))
	self.exchangeBtn_ = goTrans:NodeByName("exchangeBtn").gameObject
	self.exchangeBtnLabel_ = goTrans:ComponentByName("exchangeBtn/label", typeof(UILabel))
	self.switchPotentialityBtn_ = goTrans:NodeByName("switchPotentialityBtn").gameObject
	self.switchPotentialityBtnLabel_ = goTrans:ComponentByName("switchPotentialityBtn/label", typeof(UILabel))
	self.skillDescGroup_ = goTrans:NodeByName("skillDescGroup").gameObject
	self.unlockAllGroup_ = goTrans:NodeByName("unlockAllGroup").gameObject
	self.starEffectGroup = goTrans:NodeByName("starEffectGroup").gameObject

	for i = 1, 4 do
		self["line" .. i] = self.skillGroup_:ComponentByName("line" .. i, typeof(UISprite))
	end

	for i = 1, 5 do
		self["skillGroup" .. i] = self.skillGroup_:NodeByName("skillGroup" .. i).gameObject
	end
end

function PotentialityComponent:layoutUI()
	self.exchangeBtnLabel_.text = __("EXCHANGE2")
	self.switchPotentialityBtnLabel_.text = __("SWITCH_POTENTIALITY")
	self.backBtnLabel_.text = __("POTENTIALITY_BACK")
	UIEventListener.Get(self.exchangeBtn_).onClick = function()
		if self:checkLongTouch() then
			return
		end

		xyd.WindowManager.get():openWindow("ten_star_exchange_window", {
			partner = self.partner_
		})
	end
	UIEventListener.Get(self.switchPotentialityBtn_).onClick = function()
		local params = {
			partner = self.partner_,
			isEntrance = self.currentState == "entrance",
			quickItem = self.quickItem_,
			isGuildCompetitionSpecial = self.currentState == "guild_competition_special"
		}

		if self.isShrineHurdle_ then
			xyd.showToast(__("IS_IN_SHRINE_FORMATION"))

			return
		end

		xyd.WindowManager.get():openWindow("potentiality_switch_window", params)
	end
	UIEventListener.Get(self.backBtn_).onClick = function()
		if self:checkLongTouch() then
			return
		end

		xyd.WindowManager.get():openWindow("potentiality_back_window", {
			partner = self.partner_
		})
	end
end

function PotentialityComponent:initSkillIconLineLayout()
	local star = self.partner_:getStar()

	for i = 1, 4 do
		if i < star - 10 then
			xyd.setUISpriteAsync(self["line" .. i], nil, "partner_potential_light_big")
		else
			xyd.setUISpriteAsync(self["line" .. i], nil, "partner_potential_dark_big")
		end
	end
end

function PotentialityComponent:setEntranceState()
	self.currentState = "entrance"

	self.backBtn_:SetActive(false)
	self.exchangeBtn_:SetActive(false)
	self.switchPotentialityBtn_:SetLocalPosition(0, -158, 0)
end

function PotentialityComponent:setGuildCompetitionSpecialState()
	self.currentState = "guild_competition_special"

	self.backBtn_:SetActive(false)
	self.exchangeBtn_:SetActive(false)
	self.switchPotentialityBtn_:SetLocalPosition(0, -158, 0)
end

function PotentialityComponent:setInfo(partner)
	self.partner_ = partner

	self:initData()
	self:showStarEffect()
	self:initSkill()
	self:initSkillIconLineLayout()
	self:checkGroupBtnShow()
end

function PotentialityComponent:initData()
	self.cur_star_ = self.partner_:getStar()
	self.skill_list_ = self.partner_:getPotentialByOrder()
	self.active_status = self.partner_:getActiveIndex()
end

function PotentialityComponent:showStarEffect()
	local star = self.cur_star_

	if star == 10 then
		local str = "potentiality_ten_star"
		local isMaxStar = false
		local group = self.partner_:getGroup()

		if group and group > 0 then
			str = xyd.checkPartnerGroupImgStr(group, str, isMaxStar)
		end

		xyd.setUISpriteAsync(self.starImg_, nil, str, function()
			self.starImg_:MakePixelPerfect()
		end)
		self.starLabel_.gameObject:SetActive(false)

		if self.ten_star_effect then
			self.ten_star_effect:stop()
			self.ten_star_effect:SetActive(false)
		end

		if self.ten_star_effect_tianyi then
			self.ten_star_effect_tianyi:stop()
			self.ten_star_effect_tianyi:SetActive(false)
		end
	else
		local str = "potentiality_star_icon"
		local isMaxStar = false

		if not self.partner_.star_origin or self.partner_.star_origin == {} then
			isMaxStar = false
		else
			local starOrigin = self.partner_.star_origin
			local partnerTableID = self.partner_:getTableID()
			local listTableID = xyd.tables.partnerTable:getStarOrigin(partnerTableID)
			local beginIDs = xyd.tables.starOriginListTable:getStartIDs(listTableID)

			for i, lv in pairs(starOrigin) do
				local maxLev = xyd.tables.starOriginTable:getMaxLevByBeginID(beginIDs[i])

				if lv ~= maxLev then
					isMaxStar = false

					break
				end

				isMaxStar = true
			end
		end

		local group = self.partner_:getGroup()

		if group and group > 0 then
			str = xyd.checkPartnerGroupImgStr(group, str, isMaxStar)
		end

		xyd.setUISpriteAsync(self.starImg_, nil, str, function()
			self.starImg_.height = 57
			self.starImg_.width = 189
		end)
		self.starLabel_.gameObject:SetActive(true)

		self.starLabel_.text = tostring(star - 10)

		if self.is_guest then
			return
		end

		local group = xyd.tables.partnerTable:getGroup(self.partner_:getTableID())

		if group and group == xyd.PartnerGroup.TIANYI then
			if self.ten_star_effect then
				self.ten_star_effect:stop()
				self.ten_star_effect:SetActive(false)
			end

			if not self.ten_star_effect_tianyi then
				self.ten_star_effect_tianyi = xyd.Spine.new(self.starEffectGroup)

				self.ten_star_effect_tianyi:SetLocalScale(0.8, 0.8, 1)
				self.ten_star_effect_tianyi:setInfo("fx_ui_tianyixingxing", function()
					self.ten_star_effect_tianyi:play("texiao01", 0, 1)
				end)
			else
				self.ten_star_effect_tianyi:SetActive(true)
				self.ten_star_effect_tianyi:play("texiao01", 0, 1)
			end
		else
			if self.ten_star_effect_tianyi then
				self.ten_star_effect_tianyi:stop()
				self.ten_star_effect_tianyi:SetActive(false)
			end

			if not self.ten_star_effect then
				self.ten_star_effect = xyd.Spine.new(self.starEffectGroup)

				self.ten_star_effect:SetLocalScale(0.8, 0.8, 1)
				self.ten_star_effect:setInfo("fx_ui_13xingxing", function()
					self.ten_star_effect:play("texiao01", 0, 1)
				end)
			else
				self.ten_star_effect:SetActive(true)
				self.ten_star_effect:play("texiao01", 0, 1)
			end
		end
	end
end

function PotentialityComponent:initSkill()
	local skills = self.skill_list_
	local active_status = self.active_status
	local star = self.cur_star_
	local unlock_num = 0

	for i = 1, 5 do
		local iconItem

		if not self.skillItemList_[i] then
			iconItem = PotentialIcon.new(self["skillGroup" .. i], self.is_guest)

			iconItem:setTouchListener(function()
				if self.isShrineHurdle_ then
					xyd.showToast(__("IS_IN_SHRINE_FORMATION"))

					return
				end

				if self.is_guest then
					return
				end

				local cur_star_ = self.partner_:getStar()

				if cur_star_ + 2 <= i + 10 then
					xyd.showToast(__("POTENTIALITY_LOCK", i))

					return
				elseif cur_star_ + 1 == i + 10 then
					if xyd.models.guild:isChangeCompetitionSpecialPartnering() then
						xyd.showToast(__("POTENTIALITY_LOCK", i))

						return
					end

					if self.isQuickFormation_ then
						xyd.showToast(__("QUICK_FORMATION_TEXT02"))

						return
					end

					local params = {
						partner = self.partner_
					}

					xyd.WindowManager.get():openWindow("potentiality_unlock_window", params)
				elseif not self.active_status[i] or self.active_status[i] == 0 then
					xyd.WindowManager.get():openWindow("potentiality_choose_window", {
						skill_list = skills[i],
						awake_index = i,
						partner = self.partner_,
						isEntrance = self.currentState == "entrance",
						quickItem = self.quickItem_
					})
				else
					iconItem:showTips(true, self.skillDescGroup_, true)
				end
			end)

			self.skillItemList_[i] = iconItem
		else
			iconItem = self.skillItemList_[i]
		end

		local params = {}
		local id = -1
		local flag = 0
		local ind = star - 9

		if ind < i then
			params.is_lock = true
			params.is_mask = true
		elseif i == ind then
			params.is_mask = true
			params.is_next = true
			flag = 1

			if xyd.models.guild:isChangeCompetitionSpecialPartnering() then
				params.is_next = false
				params.is_lock = true
			end
		else
			flag = 2
			unlock_num = unlock_num + 1

			if active_status[i] and active_status[i] ~= 0 then
				id = skills[i][active_status[i]]
				params.show_effect = false
			else
				params.is_next = true
				params.show_red = true
			end
		end

		iconItem:setInfo(id, params)
	end

	if unlock_num == 3 then
		self:showUnlockAllEffect()
	else
		self:hideUnlockAllEffect()
	end
end

function PotentialityComponent:showUnlockAllEffect()
	self.unlockAllGroup_:SetActive(true)

	if not self.unlock_all_effect then
		self.unlock_all_effect = xyd.Spine.new(self.unlockAllGroup_)

		self.unlock_all_effect:setInfo("fx_ui_13xing_allunlock", function()
			self.unlock_all_effect:play("texiao01", 0, 1)
		end)
	else
		self.unlock_all_effect:play("texiao01", 0, 1)
	end
end

function PotentialityComponent:hideUnlockAllEffect()
	if self.unlock_all_effect then
		self.unlock_all_effect:stop()
	end

	self.unlockAllGroup_:SetActive(false)
end

function PotentialityComponent:setLongTouch(flag)
	self.isLongTouch = flag
end

function PotentialityComponent:setQuickItem(quickItem)
	self.quickItem_ = quickItem
end

function PotentialityComponent:checkLongTouch()
	if self.isLongTouch then
		xyd.showToast(__("IS_IN_BATTLE_FORMATION"))

		return true
	end

	return false
end

function PotentialityComponent:checkGroupBtnShow()
	local group = xyd.tables.partnerTable:getGroup(self.partner_:getTableID())

	if group and group == xyd.PartnerGroup.TIANYI then
		self.exchangeBtn_.gameObject:SetActive(false)
		self.backBtn_.gameObject:SetActive(false)
		self.switchPotentialityBtn_.gameObject:X(0)
	else
		self.exchangeBtn_.gameObject:SetActive(true)
		self.backBtn_.gameObject:SetActive(true)
		self.switchPotentialityBtn_.gameObject:X(213)
	end
end

return PotentialityComponent
