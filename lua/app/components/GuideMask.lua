-- chunkname: @../../../Product/Bundles/Android/src/app/components/GuideMask.lua

local GuideMask2 = class("GuideMask2")

function GuideMask2:ctor(parentGo)
	self.parentGo = parentGo
	self.bgs_ = {}
end

function GuideMask2:init(stageWidth, stageHeight, alpha)
	self._stageWidth = stageWidth
	self._stageHeight = stageHeight
	self.alpha_ = alpha or 0.5

	self:initObj()
end

function GuideMask2:initObj()
	if not self.textureMask_ then
		local obj = NGUITools.AddChild(self.parentGo, "guideMask")
		local sp = obj:AddComponent(typeof(UITexture))

		obj:AddComponent(typeof(GuideMask))
		obj:AddComponent(typeof(GuideHitCheck))

		local boxCollider = obj:AddComponent(typeof(UnityEngine.BoxCollider))

		boxCollider.size = Vector3(self._stageWidth, self._stageHeight, 0)
		self.guideMask_ = obj:GetComponent(typeof(GuideMask))

		self.guideMask_:SetDefaultColor(0, 0, 0, self.alpha_)

		self.textureMask_ = obj
	end

	local w = self.textureMask_:GetComponent(typeof(UIWidget))

	w.width = self._stageWidth
	w.height = self._stageHeight

	self:initTexture()
end

function GuideMask2:updateMask2(marks, iphoneXFixY)
	self:clearMask()

	self.iphoneXFixY_ = iphoneXFixY or 0

	local halfW = self._stageWidth / 2
	local halfH = self._stageHeight / 2
	local spriteObjs = {}

	for i = 1, #marks do
		local obj = self:getImg(i, marks[i])
		local pos = obj.transform.localPosition
		local w2 = obj:GetComponent(typeof(UIWidget))
		local x_ = math.round(pos.x + halfW - w2.width / 2)
		local y_ = math.round(pos.y + halfH - w2.height / 2)

		self.guideMask_:AddMask(x_, y_, obj:GetComponent(typeof(UISprite)))
	end

	self:drawSpriteMask()
end

function GuideMask2:getImg(index, data)
	local obj = NGUITools.AddChild(self.textureMask_, "mask_" .. index)
	local sp = obj:AddComponent(typeof(UISprite))

	xyd.setUISprite(sp, nil, data.icon)
	sp:MakePixelPerfect()

	local x_ = data.pos.x + (data.iconOffset[1] or 0)
	local y_ = data.pos.y + (data.iconOffset[2] or 0) + self.iphoneXFixY_

	obj:SetLocalPosition(x_, y_, 0)
	obj:SetActive(false)

	return obj
end

function GuideMask2:SetLocalPosition(x, y, z)
	self.parentGo:SetLocalPosition(x, y, z)
end

function GuideMask2:initTexture()
	self.guideMask_:InitTexture()
end

function GuideMask2:drawSpriteMask()
	self.guideMask_:DrawSpriteMask()
end

function GuideMask2:clearMask()
	self.guideMask_:ClearMask()
end

function GuideMask2:SetAlpha(alpha)
	local w = self.textureMask_:GetComponent(typeof(UIWidget))

	w.alpha = alpha
end

function GuideMask2:getObj()
	return self.textureMask_
end

function GuideMask2:getWidget()
	return self.textureMask_:GetComponent(typeof(UIWidget))
end

function GuideMask2:SetActive(flag)
	self.textureMask_:SetActive(flag)
end

function GuideMask2:ChangeParent(newParentGo)
	ResCache.AddChild(newParentGo, self.textureMask_)

	self.parentGo = newParentGo
end

function GuideMask2:removeFromParent()
	self.textureMask_.transform.parent = nil

	self.textureMask_:SetActive(false)

	self.parentGo = nil
end

function GuideMask2:destroy()
	NGUITools.Destroy(self.textureMask_)
end

function GuideMask2:setTouchEnable(flag)
	xyd.setTouchEnable(self:getObj(), flag)
end

function GuideMask2:addTouchEvent(flag, callback)
	if flag then
		UIEventListener.Get(self:getObj()).onClick = callback
	else
		UIEventListener.Get(self:getObj()).onClick = nil
	end
end

return GuideMask2
