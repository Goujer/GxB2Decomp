-- chunkname: @../../../Product/Bundles/Android/src/app/maps/HomeCharSprite.lua

local HomeCharSprite = class("HomeCharSprite", import(".BaseHomeSprite"))

function HomeCharSprite:ctor(building)
	HomeCharSprite.super.ctor(self, building)

	self._nowDir = 0
	self.ANIMATION_SCALE = 1
	self.WALK_ANIMATION_SCALE = 1.2
	self.isNotStoryChar = false
	self.isEastWest = false
	self.is3dModel = false
	self._waitAnimation = true
	self.DIR_NONE = 0
	self.DIR_WEST = 1
	self.DIR_EAST = 2
	self.DIR_FRONT = 3
	self._id = building._charID
	self._dressIndex = 0
	self._zOrder = 0
	self._layerIndex = 0
	self._dir_map = {
		"_west",
		"_east",
		"_front"
	}
	self.actionTab = {}
	self.actionTab[101] = {
		"shuihu",
		"baozhi",
		"mabu",
		"saoba",
		"denglong",
		"penshuihu",
		"shouji",
		"shu01",
		"beizi",
		"chahu",
		"doumanbang",
		"zhijin",
		"shizi"
	}
	self.actionTab[102] = {
		"shoutao_L002",
		"shoutao_R002",
		"shoutao_R",
		"fangdajing",
		"shoudiantong",
		"shoutao_L",
		"beizi",
		"chahu"
	}
	self.actionTab[103] = {
		"jiexika2",
		"beizi"
	}
	self.actionTab[106] = {
		"Jim_box"
	}
	self.actionTab[107] = {
		"ailun_bujian",
		"beizi"
	}
	self.actionTab[108] = {
		"daoju"
	}
	self.actionTab[109] = {}
	self.actionTab[110] = {
		"maoqiu"
	}
	self.actionTab[104] = {}
	self.actionTab[105] = {}
end

function HomeCharSprite:getX()
	if self.is3dModel then
		return self._model3D.transform.localPosition.x
	else
		return self.position.x
	end
end

function HomeCharSprite:getY()
	if self.is3dModel then
		return self._model3D.transform.localPosition.y
	else
		return self.position.y
	end
end

function HomeCharSprite:getZ()
	if self.is3dModel then
		return self._model3D.transform.localPosition.z
	else
		return self.position.z
	end
end

function HomeCharSprite:setX(val)
	if self.is3dModel then
		self._model3D.transform.localPosition.x = val
	else
		self.position.x = val
	end
end

function HomeCharSprite:setY(val)
	if self.is3dModel then
		self._model3D.transform.localPosition.y = val
	else
		self.position.y = val
	end
end

function HomeCharSprite:setZ(val)
	if self.is3dModel then
		self._model3D.transform.localPosition.z = val
	else
		self.position.z = val
	end
end

function HomeCharSprite:disableAllPart()
	if self.actionTab[self._id] then
		for k, v in ipairs(self.actionTab[self._id]) do
			if self._fbxModel:NodeByName(v) then
				local mabu = self._fbxModel:NodeByName(v).gameObject
				local skinRender = mabu:GetComponent(typeof(UnityEngine.SkinnedMeshRenderer))

				skinRender.enabled = false
			end
		end
	end
end

function HomeCharSprite:updateDisplay(char, scense)
	self._char = char

	if self._id == 109 and xyd.SelfInfo.get():getPetInfo().pet_index == 2 then
		self._id = 110
	end

	local charTblData = xyd.tables.char:getTableDataByCharID(self._id)
	local eff_name = charTblData.eff_name

	self._effName = eff_name

	if charTblData.model_type == 3 then
		self.is3dModel = true
	else
		self.is3dModel = false
	end

	if charTblData.isstorychar == 1 then
		self.isNotStoryChar = true
	end

	if charTblData.east_west == 1 then
		self.isEastWest = true
	end

	if self.is3dModel then
		local function callback(success, go, loader)
			if success == false or success == nil or tolua.isnull(go) then
				self:onAnimComplete()

				return
			end

			if not self._model3D or tolua.isnull(self._model3D) then
				return
			end

			local shadow = self._model3D
			local renders = go:GetComponentsInChildren(typeof(UnityEngine.SkinnedMeshRenderer))

			if xyd.CityMap.get().homeSceneState == xyd.HOME_SCENE_STATE.NORMAL then
				for i = 0, renders.Length - 1 do
					local render = renders[i]

					render.sharedMaterial:SetInt("_CustomType", xyd.HOME_SCENE_STATE.NORMAL)
				end
			elseif xyd.CityMap.get().homeSceneState == xyd.HOME_SCENE_STATE.DARK then
				for i = 0, renders.Length - 1 do
					local render = renders[i]

					render.sharedMaterial:SetInt("_CustomType", xyd.HOME_SCENE_STATE.DARK)
				end
			end

			self._model3D = go
			self._model3D.transform.parent = scense.transform
			self._model3D.transform.localPosition = shadow.transform.localPosition

			UnityEngine.Object.Destroy(shadow)

			local model = self._model3D:NodeByName("model").gameObject

			self._fbxModel = model:NodeByName("rotation").gameObject
			self.animatorModel_ = self._model3D:GetComponent(typeof(UnityEngine.Animator))

			self:disableAllPart()

			if self._nowDir ~= 0 then
				self:setDir(self._nowDir)
			else
				self:setDir(1)
			end

			if self.currClipName and xyd.isRepeateAnimation(self.currClipName) then
				for k, attachName in ipairs(xyd.tables.charAttach:getTableDataByCharIDAnimation(self._id, self.currClipName)) do
					if attachName ~= nil and not tolua.isnull(self._fbxModel:NodeByName(attachName)) then
						local model = self._fbxModel:NodeByName(attachName).gameObject
						local skinRender = model:GetComponent(typeof(UnityEngine.SkinnedMeshRenderer))

						skinRender.enabled = true
					end
				end

				self.animatorModel_:Play(self.currClipName)
			else
				self.animatorModel_:Play("idle")

				self.currClipName = "idle"
			end

			local animationEvent = self._model3D:GetComponent(typeof(LuaAnimationEvent))

			function animationEvent.callback(eventName)
				if eventName == "animationComplete" or eventName == "AnimationComplete" then
					self:onAnimComplete()
				end
			end
		end

		self._model3D = ResCache.AddGameObject(scense, "Char/Shadow_char/shadow_char")
		self._model3D.transform.localPosition = Vector3(4040, -1920, -1200)

		local model = self._model3D:NodeByName("model").gameObject

		self._fbxModel = model:NodeByName("rotation").gameObject
		self.currClipName = "idle"

		ResCache.LoadInstanceGameObjectAsync("Char_web/" .. charTblData.eff_name .. "/" .. charTblData.eff_name .. "PB", callback)
	else
		self._scale = charTblData.scale

		local anchorGridPosition = char:getGridPos()
		local gridWidth = charTblData.width
		local gridHeight = charTblData.height
		local anchorXY = xyd.CameraManager:get():gridToWorldPoint(anchorGridPosition)

		self.x = anchorXY.x
		self.y = anchorXY.y

		self:playCharAnimationSub(eff_name, "idle", 3, nil)
	end
end

function HomeCharSprite:setRotationY(angle)
	if not self._model3D or self._model3D.name == "shadow_char" then
		return
	end

	angle = angle + 180

	while angle < 0 do
		angle = angle + 360
	end

	while angle >= 360 do
		angle = angle - 360
	end

	if self.lastAngle ~= nil and self.lastAngle == angle then
		return
	end

	local model = self._model3D:NodeByName("model").gameObject
	local rotationObj = model:NodeByName("rotation").gameObject

	if self.rotationTw then
		self.rotationTw:Kill(false)

		self.lastAngle = rotationObj.transform.localEulerAngles.y
		self.rotationTw = nil
	end

	local newAngle

	if self.lastAngle == nil then
		newAngle = angle
	elseif math.abs(angle - self.lastAngle) > 180 then
		if angle > self.lastAngle then
			newAngle = angle - 360
		else
			newAngle = angle + 360
		end
	else
		newAngle = angle
	end

	self.lastAngle = angle

	local function getter()
		return rotationObj.transform.localEulerAngles.y
	end

	local function setter(value)
		local rad = value / 180 * math.pi
		local rx = -math.cos(rad) * 18.4
		local rz = -math.sin(rad) * 18.4

		rotationObj.transform.localEulerAngles = Vector3(rx, value, rz)
	end

	self.rotationTw = DG.Tweening.DOTween.Sequence()

	self.rotationTw:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOGetter_float(getter), DG.Tweening.Core.DOSetter_float(setter), newAngle, (function()
		if not self.rotateCnt then
			self.rotateCnt = 0
		end

		if self.rotateCnt < 2 then
			self.rotateCnt = self.rotateCnt + 1

			return 0.001
		else
			return 0.3
		end
	end)()))
end

function HomeCharSprite:getNewDir(dir)
	local newDir = self.DIR_EAST

	if dir == xyd.DIR_LEFT_UP then
		newDir = self.DIR_EAST
	end

	if dir == xyd.DIR_RIGHT_UP then
		newDir = self.DIR_EAST
	end

	if dir == xyd.DIR_LEFT_DOWN then
		newDir = self.DIR_WEST
	end

	if dir == xyd.DIR_RIGHT_DOWN then
		newDir = self.DIR_WEST
	end

	if dir == xyd.DIR_FRONT then
		newDir = self.DIR_FRONT
	end

	return newDir
end

function HomeCharSprite:getScaleYByDir(dir)
	if self.is3dModel then
		local ret = xyd.DEFAULT_CHUNK_SCALE * self._scale

		return ret
	else
		local ret = xyd.DEFAULT_CHUNK_SCALE * self._scale / 2

		return ret
	end
end

function HomeCharSprite:getScaleXByDir(dir)
	if self.is3dModel then
		local ret = xyd.DEFAULT_CHUNK_SCALE * self._scale

		return ret
	else
		local ret = self._scale * xyd.DEFAULT_CHUNK_SCALE

		if dir == xyd.DIR_LEFT_UP then
			ret = -xyd.DEFAULT_CHUNK_SCALE * self._scale
		end

		if dir == xyd.DIR_RIGHT_UP then
			ret = xyd.DEFAULT_CHUNK_SCALE * self._scale
		end

		if dir == xyd.DIR_LEFT_DOWN then
			ret = xyd.DEFAULT_CHUNK_SCALE * self._scale
		end

		if dir == xyd.DIR_RIGHT_DOWN then
			ret = -xyd.DEFAULT_CHUNK_SCALE * self._scale
		end

		if dir == xyd.DIR_FRONT then
			ret = xyd.DEFAULT_CHUNK_SCALE * self._scale
		end

		return ret / 2
	end
end

function HomeCharSprite:setRotation(angle)
	if self._model3D then
		self:setRotationY(angle)
	end
end

function HomeCharSprite:playCharAnimationSub(effName, animName, dir, callBack)
	if self.is3dModel then
		self:setDir(dir)
	else
		local newDir = self:getNewDir(dir)
		local eff_name = self._effName

		if self.isEastWest then
			eff_name = eff_name + self._dir_map[newDir]
		end

		self._animationNameToPlay = animName

		local scaleX = self:getScaleXByDir(dir)
		local scaleY = self:getScaleYByDir(dir)

		if eff_name ~= nil then
			self._effNameToPlay = eff_name

			if callBack then
				self._loadTimeOut = egret:setTimeout(function()
					if callBack then
						callBack(_G)
					end
				end, self, 10000)
			end

			if xyd.isRepeateAnimation(animName) then
				self._waitAnimation = false
			else
				self._waitAnimation = true
			end

			SpineEffectFactory:get():newEffect(eff_name, __TS__FunctionBind(function(self, eff)
				if self._effNameToPlay ~= eff_name then
					SpineEffectFactory:get():pushBackEffect(eff)
					self:onAnimComplete()

					return
				end

				if self._eff then
					self._eff.state:clearTracks()
					SpineEffectFactory:get():pushBackEffect(self._eff)

					if self._eff.parent then
						self._eff.parent:remove(self._eff)
					end

					self._eff = nil
				end

				self._nowDir = newDir
				self._eff = eff
				eff.scale.x = scaleX
				eff.scale.y = scaleY

				eff.state:addAnimation(0, self._animationNameToPlay, false, 0)
				self:add(eff)

				if animName == "walk" or animName == "walk_east" or animName == "walknight_east" then
					self._eff.state.timeScale = self.WALK_ANIMATION_SCALE
				else
					self._eff.state.timeScale = self.ANIMATION_SCALE
				end

				if xyd.isRepeateAnimation(animName) then
					eff.state:addAnimation(0, self._animationNameToPlay, true, 0)
				else
					eff.state:addAnimation(0, self._animationNameToPlay, false, 0)
				end

				if callBack then
					if self._loadTimeOut then
						egret:clearTimeout(self._loadTimeOut)
					end

					callBack(_G)

					callBack = nil
				end
			end, self))
		end
	end
end

function HomeCharSprite:hitTest(position)
	return false
end

function HomeCharSprite:onAnimComplete()
	if self._waitAnimation then
		if self._model3D then
			self:disableAllPart()

			if self.animatorModel_ then
				self.animatorModel_:Play("idle")
			end

			self.currClipName = "idle"
		end

		if not self.isNotStoryChar then
			xyd.EventDispatcher:inner():dispatchEvent({
				name = xyd.event.ANIMAION_COMPELETE,
				params = self._id
			})
		end
	end
end

function HomeCharSprite:playIdel()
	if self._model3D and self.currClipName == "walk" then
		if self.animatorModel_ then
			self.animatorModel_:Play("idle")
		end

		self.currClipName = "idle"
	else
		self._animationNameToPlay = ""
	end
end

function HomeCharSprite:resetAnimation()
	self._animationNameToPlay = ""
end

function HomeCharSprite:playAnimation(anim, dir, call, timeScale)
	if self.is3dModel then
		self:disableAllPart()

		for k, attachName in ipairs(xyd.tables.charAttach:getTableDataByCharIDAnimation(self._id, anim)) do
			if attachName ~= nil and not tolua.isnull(self._fbxModel:NodeByName(attachName)) then
				local model = self._fbxModel:NodeByName(attachName).gameObject
				local skinRender = model:GetComponent(typeof(UnityEngine.SkinnedMeshRenderer))

				skinRender.enabled = true
			end
		end

		if (string.find(anim, "_east") or 0) - 1 ~= -1 then
			anim = string.sub(anim, 1, (string.find(anim, "_east") or 0) - 1)
		end

		if (string.find(anim, "_west") or 0) - 1 ~= -1 then
			anim = string.sub(anim, 1, (string.find(anim, "_west") or 0) - 1)
		end

		if anim == "holdup" then
			anim = "hold_up"
		end

		if anim == "holddown" then
			anim = "hold_down"
		end

		local idx, temp

		idx, temp = string.find(anim, "walk")

		if idx == nil then
			self:setDir(dir)
		end

		if anim == "walk" and self._animationNameToPlay == "walk" then
			if call then
				call(_G)
			end

			return
		end

		if timeScale == nil then
			timeScale = 1
		end

		if self.animatorModel_ then
			self.animatorModel_.speed = timeScale
		end

		self.currClipName = anim
		self._animationNameToPlay = anim

		if xyd.isRepeateAnimation(anim) then
			if self.animatorModel_ then
				self.animatorModel_:Play(anim)
			end

			self._waitAnimation = false
		else
			self._waitAnimation = true

			if self.animatorModel_ then
				self.animatorModel_:Play(anim)
			else
				XYDCo.WaitForTime(0.5, function()
					self:onAnimComplete()
				end, nil)
			end
		end

		if call then
			call(_G)
		end
	else
		if anim == "good_west" then
			if call then
				call(_G)
			end

			return
		end

		if self.isNotStoryChar then
			if self._eff and self._eff.state then
				local scaleX = self:getScaleXByDir(dir)
				local scaleY = self:getScaleYByDir(dir)

				self._eff.scale.x = scaleX
				self._eff.scale.y = scaleY

				self._eff.state:addAnimation(0, anim, true, 0)

				if call then
					call(_G)
				end
			else
				self:playCharAnimationSub(self._effName, anim, dir, call)
			end

			return
		end

		local newDir = self:getNewDir(dir)

		if self._eff and self._eff.state then
			if newDir ~= self._nowDir then
				local eff_name = self._effName

				if self.isEastWest then
					eff_name = eff_name + self._dir_map[newDir]

					if anim == "walk" then
						anim = tostring(anim) .. tostring(self._dir_map[newDir])
					end
				end

				self._eff.state:addAnimation(0, "idle", true, 0)

				self._effNameToPlay = eff_name
				self._animationNameToPlay = anim

				self:playCharAnimationSub(self._effName, anim, dir, call)
			else
				if self.isEastWest and anim == "walk" then
					anim = tostring(anim) .. tostring(self._dir_map[newDir])
				end

				if anim == "walk" or anim == "walk_east" then
					self._eff.state.timeScale = self.WALK_ANIMATION_SCALE
				else
					self._eff.state.timeScale = self.ANIMATION_SCALE
				end

				local scaleX = self:getScaleXByDir(dir)
				local scaleY = self:getScaleYByDir(dir)

				self._eff.scale.x = scaleX
				self._eff.scale.y = scaleY

				self._eff.state:clearTracks()

				if xyd.isRepeateAnimation(anim) then
					local state

					self._waitAnimation = false

					self._eff.state:addAnimation(0, anim, true, 0)
					self._eff.state:clearListeners()
				else
					self._waitAnimation = true

					self._eff.state:addAnimation(0, anim, false, 0)
				end

				if call then
					call(_G)
				end
			end
		else
			self:playCharAnimationSub(self._effName, anim, dir, call)
		end
	end
end

function HomeCharSprite:reset()
	if self._eff then
		self._eff.state:clearTracks()
		self._eff.state:clearListeners()
		SpineEffectFactory:get():pushBackEffect(self._eff)

		if self._eff.parent then
			self._eff.parent:remove(self._eff)
		end

		self._eff = nil
	end

	self._animationNameToPlay = ""
	self._char = nil
end

function HomeCharSprite:getdir()
	return self._nowDir
end

function HomeCharSprite:setDir(dir, callBack)
	if callBack == nil then
		callBack = nil
	end

	if self.is3dModel then
		self._nowDir = dir

		if dir then
			self:setRotationY(-dir + 45)
		end

		if callBack then
			callBack(_G)
		end
	else
		if self.isNotStoryChar then
			return
		end

		self:playAnimation("idle", dir, callBack)
	end
end

function HomeCharSprite:updateAnimation(renderer)
	if self.is3dModel then
		self._model3D:updateAnimation(renderer)
	end
end

function HomeCharSprite:dispose()
	if self.is3dModel and not tolua.isnull(self._model3D) then
		self._model3D.transform.parent = nil

		UnityEngine.Object.Destroy(self._model3D)

		self._model3D = nil
	elseif self._eff then
		SpineEffectFactory:get():pushBackEffect(self._eff)

		if self._eff.parent then
			self._eff.parent:remove(self._eff)
		end

		self._eff = nil
	end
end

return HomeCharSprite
