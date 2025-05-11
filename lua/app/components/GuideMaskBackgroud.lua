-- chunkname: @../../../Product/Bundles/Android/src/app/components/GuideMaskBackgroud.lua

local GuideMaskBackgroud = class("GuideMaskBackgroud")

function GuideMaskBackgroud:ctor(parentGo)
	self.parentGo = parentGo
	self.bgs_ = {}
end

function GuideMaskBackgroud:init(stageWidth, stageHeight, alpha)
	self._stageWidth = stageWidth
	self._stageHeight = stageHeight
	self.alpha_ = alpha
end

function GuideMaskBackgroud:draw(x, y, width, height)
	local halfStageH = self._stageHeight / 2
	local halfStageW = self._stageWidth / 2

	self:addBg(0, y + height / 2, self._stageWidth, halfStageH - y, UIWidget.Pivot.Bottom)
	self:addBg((x - halfStageW - width) / 2, y, halfStageW + x, height)
	self:addBg((halfStageW + x + width) / 2, y, halfStageW - x, height)
	self:addBg(0, y - height / 2, self._stageWidth, halfStageH + y, UIWidget.Pivot.Top)
end

function GuideMaskBackgroud:addBg(x_, y_, w_, h_, pivot)
	local mask_ = NGUITools.AddChild(self.parentGo, "bg_mask")
	local sp = mask_:AddComponent(typeof(UISprite))

	xyd.setUISprite(sp, nil, "guide_mask")

	sp:GetComponent(typeof(UIWidget)).width = w_
	sp:GetComponent(typeof(UIWidget)).height = h_

	if pivot then
		sp.pivot = pivot
	end

	sp.depth = self.parentGo:GetComponent(typeof(UIWidget)).depth

	sp:SetLocalPosition(x_, y_, 0)

	sp.color = Color.New(1, 1, 1, self.alpha_)
	sp.type = UIBasicSprite.Type.Sliced
	sp.autoResizeBoxCollider = true

	xyd.setUISpriteOffsetType(sp, xyd.SpriteOffsetType.Both)

	local boxCollider = mask_:AddComponent(typeof(UnityEngine.BoxCollider))

	sp:ResizeCollider()
	table.insert(self.bgs_, mask_)
end

function GuideMaskBackgroud:destroy()
	for i = 1, #self.bgs_ do
		NGUITools.Destroy(self.bgs_[i])
	end

	self.bgs_ = {}
end

function GuideMaskBackgroud:SetLocalPosition(x, y, z)
	self.parentGo:SetLocalPosition(x, y, z)
end

function GuideMaskBackgroud:addTouchEvent(flag, callback)
	for i = 1, #self.bgs_ do
		if self.bgs_[i] and not tolua.isnull(self.bgs_[i]) then
			if flag then
				UIEventListener.Get(self.bgs_[i]).onClick = callback
			else
				UIEventListener.Get(self.bgs_[i]).onClick = nil
			end
		end
	end
end

return GuideMaskBackgroud
