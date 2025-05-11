-- chunkname: @../../../Product/Bundles/Android/src/app/common/Spine.lua

local Spine2 = class("Spine2")
local Destroy = UnityEngine.Object.Destroy

Spine2.resPooll = {}

function Spine2:ctor(parentGo)
	self.parentGo = parentGo
	self.renderTarget = parentGo:GetComponent(typeof(UIWidget))
	self.name = nil
	self.curActionName_ = ""
	self.isDestroy_ = false
	self.isBeforePlayNeedStop_ = false
	self.isNotStopResumeSetupPose_ = false
end

function Spine2:setInfo(effName, callback, isUnique, params)
	self.infoParams = params

	local parentGo = self.parentGo

	self.name = effName
	self.path = xyd.EffectConstants[effName]

	local eff = self:getCache(effName)

	if eff ~= nil and not tolua.isnull(eff) then
		eff:SetActive(true)
		ResCache.AddChild(parentGo, eff)

		self.go = eff
		self.spAnim = eff:GetComponent(typeof(SpineAnim))

		if isUnique == true then
			-- block empty
		end

		if callback then
			callback(self.infoParams)
		end
	else
		if not self.path then
			UnityEngine.Debug.LogError("dont't find the path of spine: " .. effName)

			return
		end

		self.callback = callback

		ResCache.AddGameObjectAsync(parentGo, self.path, function(success, go, loader)
			if success then
				self.go = go

				if self:isDestroy() then
					self:destroy()

					return
				end

				self.spAnim = go:GetComponent(typeof(SpineAnim))

				if isUnique then
					self.spAnim:setMaterialNum()
				end

				if self.localScale then
					self.go.transform.localScale = self.localScale
					self.localScale = nil
				end

				if self.localPosition then
					self.go.transform.localPosition = self.localPosition
					self.localPosition = nil
				end

				if self.visible ~= nil then
					self.go:SetActive(self.visible)

					self.visible = nil
				end

				if self.isGrey_ then
					self:setGrey()
				else
					self:setOrigin()
				end

				if self.callback then
					self.callback(self.infoParams)

					self.callback = nil
				end

				if self.playParams then
					local name, count, timeScale, completeCallback = unpack(self.playParams)

					self:play(name, count, timeScale, completeCallback)

					self.playParams = nil
				elseif self.playWithEventParams then
					local name, count, timeScale, callbacks = unpack(self.playWithEventParams)

					self:playWithEvent(name, count, timeScale, callbacks)

					self.playWithEventParams = nil
				end
			else
				__TRACE(string.format("LOADING SPINE ERROR: %s, path: %s", effName, self.path))
			end
		end)
	end
end

function Spine2:play(name, count, timeScale, completeCallback, playAfterLoaded, syncTime)
	self.curActionName_ = name

	if not playAfterLoaded and not self.spAnim then
		__TRACE(string.format("PLAY SPINE ERROR: %s, path: %s", self.name, self.path))

		return
	end

	if not self.spAnim then
		self.playParams = {
			name,
			count,
			timeScale,
			completeCallback
		}

		return
	end

	self.go:SetActive(true)

	self.spAnim.timeScale = timeScale or 1

	if self.isBeforePlayNeedStop_ then
		self:stop()
	end

	if syncTime and count < 1 then
		local duration = self.spAnim:getAnimationTime(name) * 1000
		local time = (os.clock() - xyd.Global.effectSyncTime) * 1000 % duration

		self.spAnim:playAtTime(name, count, time / 1000)
	else
		self.spAnim:play(name, count)
	end

	if completeCallback then
		self.spAnim:addListener("Complete", completeCallback)
	end

	if self.renderTarget then
		self.spAnim.RenderTarget = self.renderTarget
	end
end

function Spine2:playWithEvent(name, count, timeScale, callbacks, playAfterLoaded)
	self.curActionName_ = name

	if not playAfterLoaded and not self.spAnim then
		__TRACE(string.format("PLAY SPINE ERROR: %s, path: %s", self.name, self.path))

		return
	end

	if not self.spAnim then
		self.playWithEventParams = {
			name,
			count,
			timeScale,
			callbacks
		}

		return
	end

	self.go:SetActive(true)

	self.spAnim.timeScale = timeScale or 1

	if self.isBeforePlayNeedStop_ then
		self:stop()
	end

	self.spAnim:play(name, count)

	if callbacks.Complete then
		self.spAnim:addListener("Complete", callbacks.Complete)
	end

	self.spAnim:addEvent(function(event)
		local k = event.Data.Name

		if callbacks[k] then
			callbacks[k]()
		end
	end)

	if self.renderTarget then
		self.spAnim.RenderTarget = self.renderTarget
	end
end

function Spine2:stop()
	if not self.spAnim then
		self.callback = nil
		self.playParams = nil

		return
	end

	self.spAnim:stop()

	if not self.isNotStopResumeSetupPose_ then
		self:setToSetupPose()
	end
end

function Spine2:setNoStopResumeSetupPose(flag)
	self.isNotStopResumeSetupPose_ = flag
end

function Spine2:setToSetupPose()
	if self.spAnim then
		self.spAnim:setToSetupPose()
	end
end

function Spine2:SetActive(bool)
	if self.go and not tolua.isnull(self.go) then
		self.go:SetActive(bool)
	else
		self.visible = bool
	end
end

function Spine2:hasAnimationName(name)
	if not self:isValid() then
		return false
	end

	return self.spAnim:hasAnimationName(name)
end

function Spine2:getCurAction()
	return self.curActionName_
end

function Spine2:SetLocalPosition(x, y, z)
	if self.go then
		self.go.transform.localPosition = Vector3(x, y, z)
	else
		self.localPosition = Vector3(x, y, z)
	end
end

function Spine2:setLocalEulerAngles(x, y, z)
	if self.go then
		self.go.transform.localEulerAngles = Vector3(x, y, z)
	else
		self.localEulerAngles = Vector3(x, y, z)
	end
end

function Spine2:SetLocalScale(x, y, z)
	y = y or x
	z = z or x

	if self.go then
		self.go.transform.localScale = Vector3(x, y, z)
	else
		self.localScale = Vector3(x, y, z)
	end
end

function Spine2:GetLocalScale()
	if self.localScale then
		return self.localScale.x, self.localScale.y, self.localScale.z
	end

	if not self.go then
		return 1, 1, 1
	end

	return self.go.transform.localScale.x, self.go.transform.localScale.y, self.go.transform.localScale.z
end

function Spine2:flipX()
	if self.localScale then
		self.localScale = Vector3(-self.localScale.x, self.localScale.y, self.localScale.z)
	else
		self.go.transform.localScale = Vector3(-self.go.transform.localScale.x, self.go.transform.localScale.y, self.go.transform.localScale.z)
	end
end

function Spine2:setAlpha(val)
	if self.spAnim then
		self.spAnim.ToAlpha = val
	end
end

function Spine2:setRenderTarget(target, targetDelta)
	if not self.spAnim then
		return
	end

	target = target or self.renderTarget
	self.renderTarget = target

	if not self.renderTarget then
		return
	end

	self.spAnim.RenderTarget = target
	self.spAnim.targetDelta = targetDelta or 0
end

function Spine2:setRenderPanel(panel)
	self.renderPanel = panel
	self.spAnim.RenderPanel = panel
end

function Spine2:getAnim()
	return self.spAnim
end

function Spine2:getBone(boneName)
	if not self.spAnim then
		return nil
	end

	return self.spAnim:getBone(boneName)
end

function Spine2:getSlot(slotName)
	if not self.spAnim then
		return nil
	end

	return self.spAnim:getSlot(slotName)
end

function Spine2:setSlot(slotName, attchName)
	if not self.spAnim then
		return nil
	end

	return self.spAnim:setSlot(slotName, attchName)
end

function Spine2:findEvent(eventName)
	if not self.spAnim then
		return nil
	end

	return self.spAnim:findEvent(eventName)
end

function Spine2:switchAttachment(slotName, attchName, switchAttchName)
	if not self.spAnim then
		return nil
	end

	return self.spAnim:switchAttachment(slotName, attchName, switchAttchName)
end

function Spine2:changeAttachment(slotName, texture, isNewClipShader)
	if not self.spAnim then
		return nil
	end

	if isNewClipShader == nil then
		isNewClipShader = false
	end

	if xyd.models.dress:isNewClipShaderOpen() then
		self.spAnim.isNewClipShaderState = isNewClipShader
	end

	return self.spAnim:changeAttachment(slotName, texture)
end

function Spine2:removeAttachment(slotName)
	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.ANDROID_1_4_88) < 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.IOS_71_3_51) < 0 then
		return
	end

	if not self.spAnim then
		return nil
	end

	return self.spAnim:removeAttachment(slotName)
end

function Spine2:hideSlots(slotNames)
	if not self.spAnim then
		return nil
	end

	for i = 1, #slotNames do
		self.spAnim:hideSlots(slotNames[i])
	end
end

function Spine2:followBone(boneName, obj, params)
	if not self.spAnim then
		return nil
	end

	local follower = obj:GetComponent(typeof(Spine.Unity.BoneFollower))

	follower = follower or obj:AddComponent(typeof(Spine.Unity.BoneFollower))
	follower.enabled = true
	follower.skeletonRenderer = self.spAnim.a
	follower.followLocalScale = true

	if params and params.rotation ~= nil then
		follower.followBoneRotation = params.rotation
	end

	follower:SetBone(boneName)
end

function Spine2:followSlot(slotName, obj, params)
	if not self.spAnim then
		return nil
	end

	local follower = obj:GetComponent(typeof(Spine.Unity.SlotFollower))

	follower = follower or obj:AddComponent(typeof(Spine.Unity.SlotFollower))
	follower.enabled = true
	follower.skeletonRenderer = self.spAnim.a

	follower:SetSlot(slotName)

	if params then
		if params.isClearEvent then
			follower:clearEvent()
		end

		if params.colorCallback then
			follower:addColorEvent(params.colorCallback)
		end

		if params.activeCallback then
			follower:addActiveEvent(params.activeCallback)
		end

		if params.rotation ~= nil then
			follower.followSlotRotation = params.rotation
		end
	end
end

function Spine2:changeSlotTransform(name, pos, scale, rotation)
	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.ANDROID_1_1_86) <= 0 then
		return false
	end

	pos = pos or Vector3.zero
	scale = scale or Vector3.one
	rotation = rotation or 0

	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.ANDROID_1_4_88) < 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.IOS_71_3_51) < 0 then
		self.spAnim:changeRegionAttachmentPosition(name, pos, scale)
	else
		self.spAnim:changeRegionAttachmentPosition(name, pos, scale, rotation)
	end
end

function Spine2:hideFollowBone(obj)
	if not self.spAnim then
		return nil
	end

	local follower = obj:GetComponent(typeof(Spine.Unity.BoneFollower))

	if not follower then
		return
	end

	follower.enabled = false
end

function Spine2:hideFollowSlot(obj)
	if not self.spAnim then
		return nil
	end

	local follower = obj:GetComponent(typeof(Spine.Unity.SlotFollower))

	if not follower then
		return
	end

	follower:clearEvent()

	follower.enabled = false
end

function Spine2:setClip(clipTransform, centerPos, radius)
	if not self.spAnim then
		return
	end

	self.isClip_ = true

	local worldCenter = clipTransform:TransformPoint(Vector3(centerPos.x, centerPos.y, 0))
	local radiusPos = clipTransform:TransformPoint(Vector3(centerPos.x + radius, centerPos.y + radius, 0))
	local worldRadius = Mathf.dist(worldCenter, radiusPos)

	self.spAnim:setClip(worldCenter, worldRadius)
end

function Spine2:updateFirstFrame()
	if not self.spAnim then
		return
	end

	self.spAnim:updateFirstFrame()
end

function Spine2:setClipAreaWithScroller(scrollerObj, scrollerItemObj, firstOne_y, borderNum, topDown)
	if not self.spAnim then
		return
	end

	if borderNum == nil then
		borderNum = Vector4(0, 0, 0, 0)
	end

	if topDown == nil then
		topDown = Vector2(0, 0)
	end

	if scrollerObj == nil or scrollerItemObj == nil then
		return
	end

	self.spAnim:setClipAreaWithScroller(scrollerObj, scrollerItemObj, firstOne_y, borderNum, topDown)
end

function Spine2:clearcClip()
	if not self.spAnim or not self.isClip_ then
		return
	end

	self.isClip_ = false

	self.spAnim:clearClip()
end

function Spine2:setSeparatorDuration(val)
	if not self.spAnim then
		return
	end

	self.spAnim:setSeparatorDuration(val)
end

function Spine2:getGameObject()
	return self.go
end

function Spine2:getName()
	return self.name
end

function Spine2:destroy()
	self.isDestroy_ = true

	Spine2:pushEffect(self.go)
end

function Spine2:isDestroy()
	return self.isDestroy_
end

function Spine2:isValid()
	if self.go then
		return true
	end

	return false
end

function Spine2:setPlayNeedStop(flag)
	self.isBeforePlayNeedStop_ = flag
end

function Spine2:pauseAtFrame(name, frame)
	if not self.spAnim then
		return
	end

	self.spAnim:pauseAtFrame(name, frame)

	if self.renderTarget then
		self.spAnim.RenderTarget = self.renderTarget
	end
end

function Spine2:startAtFrame(frame)
	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.2.56") <= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "1.1.66") <= 0 then
		return
	end

	if not self.spAnim then
		return
	end

	self.spAnim:startAtFrame(frame)
end

function Spine2:playAtTime(name, count, time)
	if not self.spAnim then
		return
	end

	self.spAnim:playAtTime(name, count, time)

	if self.renderTarget then
		self.spAnim.RenderTarget = self.renderTarget
	end
end

function Spine2:pause()
	if not self.spAnim then
		return
	end

	self.spAnim:pause()
end

function Spine2:resume()
	if not self.spAnim then
		return
	end

	self.spAnim:resume()
end

function Spine2:setGrey()
	self.isGrey_ = true

	if not self.spAnim then
		return
	end

	self.spAnim.fillColor = Vector4(0, 0, 0, 1)
end

function Spine2:setOrigin()
	self.isGrey_ = false

	if not self.spAnim then
		return
	end

	self.spAnim.fillColor = Vector4(1, 1, 1, 1)
end

function Spine2:pushEffect(eff)
	if eff == nil or tolua.isnull(eff) then
		return
	end

	local spineAnim = eff:GetComponent(typeof(SpineAnim))
	local effName = spineAnim.effName

	spineAnim:stop()

	spineAnim.ToAlpha = 1
	spineAnim.fillPhase = 0
	spineAnim.RenderPanel = nil
	spineAnim.fillColor = Vector4(1, 1, 1, 1)
	eff.transform.parent = nil

	eff:SetActive(false)

	if Spine2.resPooll[effName] == nil then
		Spine2.resPooll[effName] = {
			eff
		}
	else
		table.insert(Spine2.resPooll[effName], eff)
	end
end

function Spine2:hasCache(effName)
	return Spine2.resPooll[effName] and #Spine2.resPooll[effName] > 0
end

function Spine2:getCache(effName)
	if self:hasCache(effName) then
		local eff = table.remove(Spine2.resPooll[effName], 1)

		return eff
	end
end

function Spine2:cleanUp()
	for effName, _ in pairs(Spine2.resPooll) do
		for _, eff in ipairs(Spine2.resPooll[effName]) do
			if not tolua.isnull(eff) then
				Destroy(eff)
			end
		end

		Spine2.resPooll[effName] = nil
	end
end

function Spine2:downloadAssets(names, callback)
	local paths = xyd.getEffectFilesByNames(names)

	if #paths == 0 then
		callback()

		return
	end

	Spine2.count = (Spine2.count or 0) + 1

	ResCache.DownloadAssets("spine_download_" .. Spine2.count, paths, function(success)
		if not success then
			return
		end

		callback()
	end, nil, 0)
end

return Spine2
