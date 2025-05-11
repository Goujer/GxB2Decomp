-- chunkname: @../../../Product/Bundles/Android/src/app/components/GirlsModel.lua

local GirlsModel = class("GirlsModel", import(".BaseComponent"))
local bigModelId = {
	nil,
	nil,
	true,
	nil,
	nil,
	true,
	nil,
	true,
	[9] = true,
	[40] = true,
	[45] = true,
	[44] = true,
	[47] = true,
	[31] = true,
	[32] = true
}
local specialPosModel = {
	[4] = 220
}

function GirlsModel:ctor(partnerGo, params)
	self.modelScale_ = 1
	self.modelPos_ = {}
	self.modelPos_.x = 0
	self.modelPos_.y = 0
	self.modelPos_.z = 0
	self.spHitCount_ = 0

	if params then
		self.id_ = params.id
		self.clickCheck_ = params.clickCheck
		self.panel_ = params.panel
	end

	self.timeKey_ = 1

	GirlsModel.super.ctor(self, partnerGo)
end

function GirlsModel:getPrefabPath()
	return "Prefabs/Components/girls_model"
end

function GirlsModel:initUI()
	GirlsModel.super.initUI(self)

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

function GirlsModel:setBgHeight(value)
	self.groupModel_:GetComponent(typeof(UIWidget)).height = value
end

function GirlsModel:setModelInfo(params, callback)
	self.id_ = params.id

	if params.timeScale then
		self.timeScale_ = params.timeScale
	end

	if params.bg then
		self.bgSprite_ = params.bg
	end

	if params.panel then
		self.panel_ = params.panel
	end

	if self.id_ then
		local res = xyd.tables.girlsModelTable:getResource(self.id_)
		local texiaoName = xyd.tables.girlsModelTable:getTexiaoName(self.id_)
		local specialName = xyd.tables.girlsModelTable:getSpecialActCameout(self.id_)
		local bgSize = xyd.tables.girlsModelTable:getSize(self.id_)

		print("self.id_   ", self.id_)
		dump(bgSize, "bgSize")

		self.modelBg_.width = bgSize[1]
		self.modelBg_.height = bgSize[2]

		local boxCollider = self.modelBg_:GetComponent(typeof(UnityEngine.BoxCollider))

		boxCollider.size = Vector3(bgSize[1], bgSize[2], 0)
		self.modelBg_.transform.localPosition = Vector3(0, bgSize[2] * 0.5, 0)

		if not self.model_ then
			self.model_ = xyd.Spine.new(self.groupModel_, true)
		else
			self.model_:destroy()

			self.model_ = xyd.Spine.new(self.groupModel_, true)
		end

		self.model_:setInfo(res, function()
			self.model_:SetLocalScale(self.modelScale_, math.abs(self.modelScale_), self.modelScale_)

			if self.scaleArr ~= nil then
				self:setModelScaleXYZ(self.scaleArr[1], self.scaleArr[2], self.scaleArr[3])
			end

			self.model_:SetLocalPosition(self.modelPos_.x, self.modelPos_.y, self.modelPos_.z)

			if self.panel_ then
				self.model_:setRenderPanel(self.panel_)
			end

			if self.bgSprite_ then
				self.model_:setRenderTarget(self.bgSprite_, 1)
			end

			local enterEffect = xyd.tables.girlsModelTable:getEnterEffect(self.id_)

			if not self.bubbleText_ or not enterEffect or enterEffect == "" then
				self.model_:setToSetupPose()

				if specialName and tostring(specialName) ~= "" then
					self.isPlayCameout_ = true

					self.model_:play(specialName, 1, self.timeScale_, function()
						self.isPlayCameout_ = false

						self.model_:play(texiaoName, 0, self.timeScale_)
					end)
				else
					self.model_:play(texiaoName, 0, self.timeScale_)
				end
			end

			if callback then
				callback()
			end
		end)

		local size = xyd.tables.girlsModelTable:getSize(self.id_)

		self.width_ = size[1]
		self.height_ = size[2]
	end
end

function GirlsModel:playEnterAction()
	local enterSound = xyd.tables.girlsModelTable:getEnterSound(self.id_)

	if enterSound and enterSound ~= "" and xyd.GuideController.get():isGuideComplete() then
		self.currentSound_ = xyd.tables.girlsModelTable:getEnterSound(self.id_)

		if self.bubbleText_ then
			local text = xyd.tables.girlsModelTextTable:getEnterDialog(self.id_)

			self.bubbleText_:playDialogAction(text)
		end

		self.isPlayEnterAction_ = true

		xyd.SoundManager.get():playSound(self.currentSound_)

		local beforeId = self.id_

		self:setTimeout(function()
			if not self.isPlayEnterAction_ then
				if self.bubbleText_ then
					self.bubbleText_:playDisappear()
				end

				return
			end

			self.currentSound_ = nil

			if not self.bubbleText_ or beforeId ~= self.id_ then
				self.isPlayEnterAction_ = false

				if self.bubbleText_ then
					self.bubbleText_:playDisappear()
				end

				return
			end

			if self.bubbleText_ then
				self.bubbleText_:playDisappear()
			end

			self:setTimeout(function()
				self.isPlayEnterAction_ = false
			end, self, 300)
		end, self, xyd.tables.soundTable:getLength(self.currentSound_) * 1000)
	else
		if self.bubbleText_ then
			local text = xyd.tables.girlsModelTextTable:getEnterDialog(self.id_)

			self.bubbleText_:playDialogAction(text)
		end

		local beforeId = self.id_

		self.isPlayEnterAction_ = true

		self:setTimeout(function()
			if not self.bubbleText_ or beforeId ~= self.id_ or not self.isPlayEnterAction_ then
				self.isPlayEnterAction_ = false

				if self.bubbleText_ then
					self.bubbleText_:playDisappear()
				end

				return
			end

			if self.bubbleText_ then
				self.bubbleText_:playDisappear()
			end

			self:setTimeout(function()
				self.isPlayEnterAction_ = false
			end, self, 300)
		end, self, xyd.tables.miscTable:getNumber("girls_model_bubble_time", "value"))
	end

	local specialName = xyd.tables.girlsModelTable:getSpecialActCameout(self.id_)
	local effect = xyd.tables.girlsModelTable:getEnterEffect(self.id_)
	local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

	if specialName and tostring(specialName) ~= "" then
		self.isPlayCameout_ = true

		self.model_:play(specialName, 1, self.timeScale_, function()
			self.isPlayCameout_ = false

			self.model_:play(cur_name, 0, self.timeScale_)
		end)
	elseif effect and effect ~= "" then
		self:setTimeout(function()
			self.model_:play(effect, 1, nil, function()
				self.model_:play(cur_name, 0)
			end)
		end, self, 300)
	end
end

function GirlsModel:playClickAction()
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

	local rank = math.random(6)
	local index = rank

	if index ~= tonumber(self.currentSound_) then
		self:stopSound()
	end

	if xyd.tables.girlsModelTextTable:getTouchDialog(self.id_, index) == "" then
		for i = 1, 5 do
			index = i + rank

			if index > 6 then
				index = index - 6
			end

			if xyd.tables.girlsModelTextTable:getTouchDialog(self.id_, index) ~= "" then
				break
			end
		end
	end

	self.isPlayClickAction_ = true
	self.currentSound_ = xyd.tables.girlsModelTable:getTouchSound(self.id_, index)

	if next(self.waitForTimeKeys_) then
		for i = 1, #self.waitForTimeKeys_ do
			XYDCo.StopWait(self.waitForTimeKeys_[i])
		end

		self.waitForTimeKeys_ = {}
	end

	if self.currentSound_ and self.currentSound_ ~= "" then
		xyd.SoundManager.get():playSound(self.currentSound_)
		self:setTimeout(function()
			if not self.isPlayClickAction_ then
				return
			end

			self.currentSound_ = nil

			if self.bubbleText_ then
				self.bubbleText_:playDisappear()
			end

			self:setTimeout(function()
				self.isPlayClickAction_ = false
			end, self, 300)
		end, self, xyd.tables.soundTable:getLength(self.currentSound_) * 1000)
	else
		self:setTimeout(function()
			if not self.isPlayClickAction_ then
				return
			end

			if self.bubbleText_ then
				self.bubbleText_:playDisappear()
			end

			self:setTimeout(function()
				self.isPlayClickAction_ = false
			end, self, 300)
		end, self, xyd.tables.miscTable:getNumber("girls_model_bubble_time", "value"))
	end

	if self.bubbleText_ then
		local text = xyd.tables.girlsModelTextTable:getTouchDialog(self.id_, index)

		self.bubbleText_:playDialogAction(text)
	end

	local effectName = xyd.tables.girlsModelTable:ClickEffect(self.id_, index)
	local spHitName = xyd.tables.girlsModelTable:getSpecialActHit(self.id_)

	if spHitName and spHitName[1] ~= "" and (rank > self.spHitCount_ and spHitName[2] ~= "" or not spHitName[2] or spHitName[2] == "") then
		self.spHitCount_ = self.spHitCount_ + 1

		self.model_:play(spHitName[1], 1, 1, function()
			local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

			self.model_:play(cur_name, 0)
		end)
	elseif spHitName and spHitName[2] ~= "" and rank <= self.spHitCount_ then
		self.spHitCount_ = 0

		self.model_:play(spHitName[2], 1, 1, function()
			local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

			self.model_:play(cur_name, 0)
		end)
	elseif effectName and effectName ~= "" then
		self.spHitCount_ = self.spHitCount_ + 1

		self.model_:play(effectName, 1, 1, function()
			local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

			self.model_:play(cur_name, 0)
		end)
	else
		local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

		self.model_:play(cur_name, 0)
	end
end

function GirlsModel:playChooseAction()
	self.isPlayChooseAction_ = true

	self:stopSound()

	local chooseSound = xyd.tables.girlsModelTable:getChooseSound(self.id_)

	self.currentSound_ = chooseSound

	if next(self.waitForTimeKeys_) then
		for i = 1, #self.waitForTimeKeys_ do
			XYDCo.StopWait(self.waitForTimeKeys_[i])
		end

		self.waitForTimeKeys_ = {}
	end

	if chooseSound and chooseSound ~= "" then
		if self.bubbleText_ then
			local text = xyd.tables.girlsModelTextTable:getChooseDialog(self.id_)

			self.bubbleText_:playDialogAction(text)
		end

		self.currentSound_ = xyd.tables.girlsModelTable:getChooseSound(self.id_)

		xyd.SoundManager.get():playSound(self.currentSound_)

		local beforeId = self.id_

		self:setTimeout(function()
			self.currentSound_ = nil

			if not self.bubbleText_ or beforeId ~= self.id_ or not self.isPlayChooseAction_ then
				self.isPlayChooseAction_ = false

				return
			end

			if self.bubbleText_ then
				self.bubbleText_:playDisappear()
			end

			self:setTimeout(function()
				self.isPlayChooseAction_ = false
			end, self, 300)
		end, self, xyd.tables.soundTable:getLength(self.currentSound_) * 1000)
	else
		if self.bubbleText_ then
			local text = xyd.tables.girlsModelTextTable:getChooseDialog(self.id_)

			self.bubbleText_:playDialogAction(text)
		end

		local beforeId = self.id_

		self:setTimeout(function()
			if not self.bubbleText_ or beforeId ~= self.id_ or not self.isPlayChooseAction_ then
				self.isPlayChooseAction_ = false

				return
			end

			if self.bubbleText_ then
				self.bubbleText_:playDisappear()
			end

			self:setTimeout(function()
				self.isPlayChooseAction_ = false
			end, self, 300)
		end, self, xyd.tables.miscTable:getNumber("girls_model_bubble_time", "value"))
	end

	local effectName = xyd.tables.girlsModelTable:getChooseEffect(self.id_)

	if effectName and effectName ~= "" then
		self.model_:play(effectName, 1, 1, function()
			local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

			self.model_:play(cur_name, 0)
		end)
	else
		local cur_name = xyd.tables.girlsModelTable:getTexiaoName(self.id_)

		self.model_:play(cur_name, 0)
	end
end

function GirlsModel:setMask(maskGameObject)
	self.maskRect_ = maskGameObject

	self.maskRect_.gameObject:SetActive(true)

	local widget = self.go:GetComponent(typeof(UIWidget))

	if widget then
		self.maskRect_:GetComponent(typeof(UIWidget)).depth = widget.depth + 100
	end
end

function GirlsModel:setBubble(bubble)
	if bubble then
		self.bubbleText_ = bubble
	else
		if not self.bubbleText_ then
			self.bubbleText_ = import("app.components.BubbleText").new(self.groupBubble_)
		end

		self.bubbleText_:setBubbleFlipX(true)

		if bigModelId[self.id_] then
			self.bubbleText_:setPositionY(100)
		elseif specialPosModel[self.id_] then
			self.bubbleText_:setPositionY(specialPosModel[self.id_])
		else
			self.bubbleText_:setPositionY(140)
		end

		self.bubbleText_:setBubbleFlipX(true)
	end

	self:playEnterAction()
end

function GirlsModel:dispose()
	self:stopSound()
	GirlsModel.super.dispose(self)
end

function GirlsModel:setTimeout(callback, object, microSecond)
	local second = microSecond / 1000

	self:waitForTime(second, function()
		if callback then
			callback(object)
		end
	end, tostring(self.timeKey_))

	self.timeKey_ = self.timeKey_ + 1
end

function GirlsModel:SetActive(bool)
	self.go:SetActive(bool)
end

function GirlsModel:isPlayChooseSound()
	return self.isPlayChooseAction_
end

function GirlsModel:stopSound()
	if self.currentSound_ then
		xyd.SoundManager.get():stopSound(self.currentSound_)

		if self.bubbleText_ then
			self.bubbleText_:SetActive(false)
		end

		self.isPlayClickAction_ = false
		self.isPlayChooseAction_ = false
		self.isPlayEnterAction_ = false
		self.currentSound_ = nil
	end
end

function GirlsModel:setModelScale(scale)
	self.modelScale_ = scale

	if self.model_ then
		self.model_:SetLocalScale(self.modelScale_, math.abs(self.modelScale_), self.modelScale_)
	end
end

function GirlsModel:setModelScaleXYZ(scalex, scaley, scalez)
	if self.model_ then
		self.model_:SetLocalScale(scalex, scaley, scalez)
	end

	self.scaleArr = {
		scalex,
		scaley,
		scalez
	}
end

function GirlsModel:setModelPosition(x, y, z)
	self.modelPos_.x = x
	self.modelPos_.y = y
	self.modelPos_.z = z

	if self.model_ then
		self.model_:SetLocalPosition(self.modelPos_.x, self.modelPos_.y, self.modelPos_.z)
	end
end

function GirlsModel:setModelBgPosition(x, y, z)
	self.modelBg_.transform.localPosition = Vector3(x, y, z)
end

return GirlsModel
