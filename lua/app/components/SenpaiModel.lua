-- chunkname: @../../../Product/Bundles/Android/src/app/components/SenpaiModel.lua

local SenpaiModel = class("SenpaiModel", import(".BaseComponent"))
local DRESS_STATE = {
	HEAD = 1,
	BODY = 2
}

function SenpaiModel:ctor(partnerGo, params)
	if params then
		self.styleIds = params.ids
		self.initCallback_ = params.callback
	end

	self.timeScale_ = 1
	self.headId = 0
	self.bodyId = 0
	self.footId = 0
	self.lastHeadSlotId = 0
	self.lastBodySlotId = 0
	self.curActionName_ = "idle"

	SenpaiModel.super.ctor(self, partnerGo)

	self.effectInitNum = 0
end

function SenpaiModel.getPrefabPath()
	return "Prefabs/Components/senpai_model"
end

function SenpaiModel:initUI()
	SenpaiModel.super.initUI(self)

	self.groupModel = self.go:NodeByName("modelPanel/groupModel").gameObject
	self.headNode = self.groupModel:NodeByName("headNode").gameObject
	self.bodyNode = self.groupModel:NodeByName("bodyNode").gameObject
	self.footNode = self.groupModel:NodeByName("footNode").gameObject
	self.headNode_UIWidget = self.headNode:GetComponent(typeof(UIWidget))
	self.bodyNode_UIWidget = self.bodyNode:GetComponent(typeof(UIWidget))
	self.footNode_UIWidget = self.footNode:GetComponent(typeof(UIWidget))
	self.headImg = self.go:ComponentByName("headImg", typeof(UITexture))
	self.bodyImg = self.go:ComponentByName("bodyImg", typeof(UITexture))
	self.footImg = self.go:ComponentByName("footImg", typeof(UITexture))
	self.headImgSprite = self.go:ComponentByName("headImgSprite", typeof(UISprite))
end

function SenpaiModel:setModelInfo(params)
	if self.isCanSet == nil then
		self.isCanSet = true
	end

	if self.isCanSet == false then
		return
	end

	if self.isCanSet then
		self.isCanSet = false

		self:waitForFrame(3, function()
			self.isCanSet = true
		end)
	end

	self.styleIds = {}

	local ids = params.ids

	self.headSlotIds = {}
	self.bodySlotIds = {}
	self.footSlotIds = {}

	if params.textureSize then
		self.headNode_UIWidget.width = params.textureSize.x
		self.headNode_UIWidget.height = params.textureSize.y
		self.bodyNode_UIWidget.width = params.textureSize.x
		self.bodyNode_UIWidget.height = params.textureSize.y
		self.footNode_UIWidget.width = params.textureSize.x
		self.footNode_UIWidget.height = params.textureSize.y
	end

	if params.uiPanel then
		self.uiPanel = params.uiPanel
	end

	self.isNewClipShader = params.isNewClipShader

	if params.pos then
		self.pos = params.pos
	else
		self.pos = Vector3(0, 0, 0)
	end

	if params.scale then
		self.go:SetLocalScale(params.scale, params.scale, params.scale)
	end

	if params.isNotCoverMaskTuxture then
		self.isNotCoverMaskTuxture = params.isNotCoverMaskTuxture
	end

	local senpaiDressStyleTable = xyd.tables.senpaiDressStyleTable

	for _, id in ipairs(ids) do
		local pos = senpaiDressStyleTable:getPos(id)

		if pos == 4 then
			table.insert(self.headSlotIds, id)
		elseif pos == 5 then
			table.insert(self.bodySlotIds, id)
		elseif pos == 6 then
			table.insert(self.footSlotIds, id)
		else
			table.insert(self.styleIds, id)
		end
	end

	self.timeScale_ = params.timeScale

	local function initHead(res, id)
		if self.headId == id then
			self:createHeadSlot()

			return
		end

		if self.headModel_ then
			if self.lastHeadSlotId > 0 then
				self:removeAttachment(self.headModel_, DRESS_STATE.HEAD, self.headImg)

				self.lastHeadSlotId = 0
			end

			self.headModel_:destroy()

			self.headModel_ = nil
			self.effectInitNum = self.effectInitNum - 1
		end

		self.headId = id

		self:createHead(res)
	end

	local function initBody(res, id)
		if self.bodyId == id then
			self:createBodySlot()

			return
		end

		if self.bodyModel_ then
			if self.lastBodySlotId > 0 then
				self:removeAttachment(self.bodyModel_, DRESS_STATE.BODY, self.bodyImg)

				self.lastBodySlotId = 0
			end

			self.bodyModel_:destroy()

			self.bodyModel_ = nil
			self.lastBodySlotId = 0
			self.effectInitNum = self.effectInitNum - 1
		end

		self.bodyId = id

		self:createBody(res)
	end

	local function initFoot(res, id)
		if self.footId == id then
			return
		end

		if self.footModel_ then
			self.footModel_:destroy()

			self.footModel_ = nil
			self.effectInitNum = self.effectInitNum - 1
		end

		self.footId = id

		self:createFoot(res)
	end

	local pos2func = {
		initHead,
		initBody,
		initFoot
	}

	for _, id in ipairs(self.styleIds) do
		local pos = senpaiDressStyleTable:getPos(id)
		local res = senpaiDressStyleTable:getResource(id)
		local slotName = senpaiDressStyleTable:getSlot(id)

		if pos and res then
			pos2func[pos](res, id)
		end
	end
end

function SenpaiModel:createFoot(res)
	if not self.footModel_ then
		self.footModel_ = xyd.Spine.new(self.footNode)

		self.footModel_:setInfo(res, function()
			if self.uiPanel then
				self.footModel_:setRenderPanel(self.uiPanel)
			end

			self.footModel_:SetLocalPosition(self.pos.x, self.pos.y, self.pos.z)
			self.footModel_:play(self.curActionName_, 0, self.timeScale_)
			self.footModel_:setRenderTarget(self.footNode:GetComponent(typeof(UIWidget)), 3)

			self.effectInitNum = self.effectInitNum + 1

			self:updatePlayFrame()

			if self.isNotCoverMaskTuxture then
				self.footNode.gameObject:X(4)
				self.footModel_:getGameObject():X(-4)
			end
		end)
	end
end

function SenpaiModel:createBody(res)
	local duration = 5

	if not self.bodyModel_ then
		self.bodyModel_ = xyd.Spine.new(self.bodyNode)

		self.bodyModel_:setInfo(res, function()
			if self.uiPanel then
				self.bodyModel_:setRenderPanel(self.uiPanel)
			end

			self.bodyModel_:SetLocalPosition(self.pos.x, self.pos.y, self.pos.z)
			self.bodyModel_:setSeparatorDuration(duration)
			self.bodyModel_:setToSetupPose()
			self.bodyModel_:play(self.curActionName_, 0, self.timeScale_)
			self.bodyModel_:setRenderTarget(self.bodyNode:GetComponent(typeof(UIWidget)), 2)

			self.effectInitNum = self.effectInitNum + 1

			self:updatePlayFrame()
			self:createBodySlot()

			if self.isNotCoverMaskTuxture then
				self.bodyNode.gameObject:X(-4)
				self.bodyModel_:getGameObject():X(4)
			end
		end)
	end
end

function SenpaiModel:createHead(res)
	local duration = 9

	if not self.headModel_ then
		self.headModel_ = xyd.Spine.new(self.headNode)

		self.headModel_:setInfo(res, function()
			if self.uiPanel then
				self.headModel_:setRenderPanel(self.uiPanel)
			end

			self.headModel_:SetLocalPosition(self.pos.x, self.pos.y, self.pos.z)
			self.headModel_:setSeparatorDuration(duration)
			self.headModel_:setToSetupPose()
			self.headModel_:play(self.curActionName_, 0, self.timeScale_)
			self.headModel_:setRenderTarget(self.headNode:GetComponent(typeof(UIWidget)), 1)

			self.effectInitNum = self.effectInitNum + 1

			self:updatePlayFrame()
			self:createHeadSlot()
		end)
	end
end

function SenpaiModel:createBodySlot()
	if #self.bodySlotIds > 0 then
		local slotId = self.bodySlotIds[1]

		if slotId == self.lastBodySlotId then
			return
		end

		if self.lastBodySlotId > 0 then
			self:removeAttachment(self.bodyModel_, DRESS_STATE.BODY, self.bodyImg)
		end

		self.lastBodySlotId = slotId

		self:waitForFrame(1, function()
			self:initSlot(self.bodyModel_, slotId, self.bodyImg)
		end)
	elseif self.lastBodySlotId > 0 then
		self:removeAttachment(self.bodyModel_, DRESS_STATE.BODY, self.bodyImg)
	end
end

function SenpaiModel:createHeadSlot()
	if #self.headSlotIds > 0 then
		local slotId = self.headSlotIds[1]

		if slotId == self.lastHeadSlotId then
			return
		end

		if self.lastHeadSlotId > 0 then
			self:removeAttachment(self.headModel_, DRESS_STATE.HEAD, self.headImg)
		end

		self.lastHeadSlotId = slotId

		self:waitForFrame(1, function()
			self:initSlot(self.headModel_, slotId, self.headImg)
		end)
	elseif self.lastHeadSlotId > 0 then
		self:removeAttachment(self.headModel_, DRESS_STATE.HEAD, self.headImg)
	end
end

function SenpaiModel:initSlot(spineModel, id, imgNode)
	if spineModel then
		if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.ANDROID_1_4_88) < 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.IOS_71_3_51) < 0 then
			return
		end

		local senpaiDressStyleTable = xyd.tables.senpaiDressStyleTable
		local res = senpaiDressStyleTable:getResource(id)
		local slotName = senpaiDressStyleTable:getSlot(id)
		local offset = senpaiDressStyleTable:getOffset(id)
		local scale = senpaiDressStyleTable:getScale(id)
		local rotation = senpaiDressStyleTable:getRotation(id)

		imgNode:SetActive(true)
		xyd.setUITextureByNameAsync(imgNode, res, true, function()
			self:waitForFrame(1, function()
				spineModel:changeAttachment(slotName, imgNode, self.isNewClipShader)
				spineModel:changeSlotTransform(slotName, Vector3(tonumber(offset[1]) or 0, tonumber(offset[2]) or 0, 0), Vector3(tonumber(scale[1]) or 1, tonumber(scale[2]) or 1, 1), tonumber(rotation) or 0)
			end)
		end)
	end
end

function SenpaiModel:removeAttachment(spineModel, slotName, imgNode)
	local slotId

	if slotName == DRESS_STATE.HEAD then
		slotId = self.lastHeadSlotId
		self.lastHeadSlotId = 0
	elseif slotName == DRESS_STATE.BODY then
		slotId = self.lastBodySlotId
		self.lastBodySlotId = 0
	end

	if not slotId or slotId == 0 then
		return
	end

	local slotName = xyd.tables.senpaiDressStyleTable:getSlot(slotId)

	spineModel:removeAttachment(slotName)
	imgNode:SetActive(false)
end

function SenpaiModel:play(name, count, timeScale, completeCallback, playAfterLoaded, syncTime)
	self.curActionName_ = name
	self.timeScale_ = timeScale

	self:playAction(name, count, completeCallback)
end

function SenpaiModel:idle()
	self:playAction("idle")
end

function SenpaiModel:walk()
	self:playAction("walk")
end

function SenpaiModel:hit()
	self:playAction("hit", 1)
end

function SenpaiModel:lie()
	self:playAction("lie")
end

function SenpaiModel:move()
	self:playAction("move")
end

function SenpaiModel:sit()
	self:playAction("sit")
end

function SenpaiModel:playAction(actionName, num, completeCallback)
	num = tonumber(num) or 0

	if self.headModel_ then
		self.headModel_:play(actionName, num, self.timeScale_, completeCallback)
	end

	if self.bodyModel_ then
		self.bodyModel_:play(actionName, num, self.timeScale_)
	end

	if self.footModel_ then
		self.footModel_:play(actionName, num, self.timeScale_)
	end
end

function SenpaiModel:isValid()
	return self.headModel_:isValid() and self.bodyModel_:isValid() and self.footModel_:isValid()
end

function SenpaiModel:hasAnimationName()
	return true
end

function SenpaiModel:GetLocalScale()
	return self.go.transform.localScale.x, self.go.transform.localScale.y, self.go.transform.localScale.z
end

function SenpaiModel:SetLocalScale(x, y, z)
	y = y or x
	z = z or x
	self.go.transform.localScale = Vector3(x, y, z)
end

function SenpaiModel:SetLocalPosition(x, y, z)
	self.go.gameObject:SetLocalPosition(x, y, z)
end

function SenpaiModel:getCurAction()
	return self.curActionName_
end

function SenpaiModel:destroy()
	self.headModel_:destroy()
	self.bodyModel_:destroy()
	self.footModel_:destroy()

	if self.lastHeadSlotId > 0 then
		self:removeAttachment(self.headModel_, DRESS_STATE.HEAD, self.headImg)
	end

	if self.lastBodySlotId > 0 then
		self:removeAttachment(self.bodyModel_, DRESS_STATE.BODY, self.bodyImg)
	end
end

function SenpaiModel:setRenderTarget(node, targetDelta)
	self.footModel_:setRenderTarget(node:GetComponent(typeof(UIWidget)), targetDelta + 3)
	self.bodyModel_:setRenderTarget(node:GetComponent(typeof(UIWidget)), targetDelta + 2)
	self.headModel_:setRenderTarget(node:GetComponent(typeof(UIWidget)), targetDelta + 1)
end

function SenpaiModel:setAlpha(val)
	self.headModel_:setAlpha(val)
	self.bodyModel_:setAlpha(val)
	self.footModel_:setAlpha(val)
end

function SenpaiModel:setClip(clipTransform, centerPos, radius)
	self.isClip_ = true

	self.headModel_:setClip(clipTransform, centerPos, radius)
	self.bodyModel_:setClip(clipTransform, centerPos, radius)
	self.footModel_:setClip(clipTransform, centerPos, radius)
end

function SenpaiModel:clearcClip()
	self.isClip_ = false

	self.headModel_:clearcClip()
	self.bodyModel_:clearcClip()
	self.footModel_:clearcClip()
end

function SenpaiModel:updatePlayFrame()
	if self.effectInitNum == 3 then
		if self.headModel_ then
			self.headModel_:play(self.curActionName_, 0, self.timeScale_)
		end

		if self.bodyModel_ then
			self.bodyModel_:play(self.curActionName_, 0, self.timeScale_)
		end

		if self.footModel_ then
			self.footModel_:play(self.curActionName_, 0, self.timeScale_)
		end
	end
end

return SenpaiModel
