-- chunkname: @../../../Product/Bundles/Android/src/app/components/GirlsModelLite.lua

local GirlsModelLite = class("GirlsModelLite", import(".BaseComponent"))
local SPECIAL_IDLE_TIME = 15

function GirlsModelLite:ctor(partnerGo, params)
	if params then
		self.id_ = params.id
		self.layer_ = params.layer
		self.initCallback_ = params.callback
	end

	self.spHitCount_ = 0
	self.spIdleCount_ = 1

	GirlsModelLite.super.ctor(self, partnerGo)
end

function GirlsModelLite.getPrefabPath()
	return "Prefabs/Components/girls_model"
end

function GirlsModelLite:initUI()
	GirlsModelLite.super.initUI(self)

	self.groupModel_ = self.go:NodeByName("groupModel").gameObject
	self.modelBg_ = self.go:ComponentByName("groupModel/bgSprite", typeof(UISprite))
	self.groupBubble_ = self.go:NodeByName("groupBubble").gameObject
	UIEventListener.Get(self.modelBg_.gameObject).onClick = function()
		self:playClickAction()
	end

	if self.id_ then
		self:setModelInfo({
			id = self.id_
		})
	end
end

function GirlsModelLite:setModelInfo(params)
	self.id_ = params.id
	self.timeScale_ = params.timeScale
	self.notSpecail_ = params.not_specail

	if self.id_ then
		local res = xyd.tables.girlsModelTable:getResource(self.id_)
		local texiaoName = xyd.tables.girlsModelTable:getTexiaoName(self.id_)
		local specialName = xyd.tables.girlsModelTable:getSpecialActCameout(self.id_)

		if self.model_ and self.model_:getName() == texiaoName then
			return
		elseif self.model_ then
			self.model_:destroy()

			self.model_ = nil
		end

		self.model_ = xyd.Spine.new(self.groupModel_)

		self.model_:setInfo(res, function()
			self.model_:SetLocalPosition(0, -200, 0)

			if self.layer_ then
				self.model_:getGameObject().layer = self.layer_
			end

			if specialName and specialName ~= "" and not self.notSpecail_ then
				self.isPlayCameout_ = true

				self.model_:play(specialName, 1, self.timeScale_, function()
					self.isPlayCameout_ = false

					self.model_:play(texiaoName, 0, self.timeScale_)
				end)
				self:randSpecialIdle()
			else
				self.model_:play(texiaoName, 0, self.timeScale_)
			end

			self:waitForFrame(5, function()
				self.model_:setAlpha(1)
			end)

			if self.initCallback_ then
				self.initCallback_()

				self.initCallback_ = nil
			end
		end)
	end
end

function GirlsModelLite:playSpecailComeout(callback)
	local texiaoName = xyd.tables.girlsModelTable:getTexiaoName(self.id_)
	local specialName = xyd.tables.girlsModelTable:getSpecialActCameout(self.id_)

	if specialName and specialName ~= "" then
		self.isPlayCameout_ = true

		self.model_:play(specialName, 1, self.timeScale_, function()
			self.isPlayCameout_ = false

			if callback then
				callback()
			end

			self.model_:play(texiaoName, 0, self.timeScale_)
		end)
		self:randSpecialIdle()
	end
end

function GirlsModelLite:randSpecialIdle()
	local time = math.floor(math.random(SPECIAL_IDLE_TIME * 2) + SPECIAL_IDLE_TIME)

	self:waitForTime(time, function()
		local specialIdleName = xyd.tables.girlsModelTable:getSpecialActIdle(self.id_)
		local texiaoName = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

		self.isPlayCameout_ = true

		self.model_:play(specialIdleName, 1, self.timeScale_, function()
			self.isPlayCameout_ = false

			self.model_:play(texiaoName, 0, self.timeScale_)
			self:randSpecialIdle()
		end)
	end)
end

function GirlsModelLite:playClickAction()
	return
end

function GirlsModelLite:setBgHeight(value)
	self.groupModel_:GetComponent(typeof(UIWidget)).height = value
end

function GirlsModelLite:playClickAction2()
	if not self.go or tolua.isnull(self.go) then
		return
	end

	if not self.model_ or not self.model_:isValid() then
		return
	end

	if self.clickCheck_ and not self.clickCheck_() then
		return
	end

	if self.isPlayCameout_ then
		return
	end

	if self.isPlayHit_ then
		return
	end

	local rank = math.random(6)

	self.isPlayClickAction_ = true

	if next(self.waitForTimeKeys_) then
		for i = 1, #self.waitForTimeKeys_ do
			XYDCo.StopWait(self.waitForTimeKeys_[i])
		end

		self.waitForTimeKeys_ = {}
	end

	local effectName = xyd.tables.girlsModelTable:ClickEffect(self.id_, rank)
	local spHitName = xyd.tables.girlsModelTable:getSpecialActHit(self.id_)

	if spHitName and spHitName[1] ~= "" and (rank > self.spHitCount_ and spHitName[2] ~= "" or not spHitName[2] or spHitName[2] == "") then
		self.spHitCount_ = self.spHitCount_ + 1
		self.isPlayHit_ = true

		if not self.model_ then
			return
		end

		self.model_:play(spHitName[1], 1, 1, function()
			self.isPlayHit_ = false

			local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

			if not self.model_ then
				return
			end

			self.model_:play(cur_name, 0)
		end)
	elseif spHitName and spHitName[2] ~= "" and rank <= self.spHitCount_ then
		self.spHitCount_ = 0
		self.isPlayHit_ = true

		if not self.model_ then
			return
		end

		self.model_:play(spHitName[2], 1, 1, function()
			self.isPlayHit_ = false

			local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

			if not self.model_ then
				return
			end

			self.model_:play(cur_name, 0)
		end)
	elseif effectName and effectName ~= "" then
		self.spHitCount_ = self.spHitCount_ + 1
		self.isPlayHit_ = true

		self.model_:play(effectName, 1, 1, function()
			self.isPlayHit_ = false

			local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

			self.model_:play(cur_name, 0)
		end)
	else
		local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

		self.model_:play(cur_name, 0)
	end
end

function GirlsModelLite:setBubble(bubble)
	return
end

return GirlsModelLite
