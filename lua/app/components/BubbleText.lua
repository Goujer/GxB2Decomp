-- chunkname: @../../../Product/Bundles/Android/src/app/components/BubbleText.lua

local BubbleText = class("BubbleText", import(".BaseComponent"))
local ANCHOR = {
	251,
	9
}

function BubbleText:ctor(parentGo)
	BubbleText.super.ctor(self, parentGo)
	self.go:SetActive(false)
end

function BubbleText:getPrefabPath()
	return "Prefabs/Components/bubble_text"
end

function BubbleText:initUI()
	BubbleText.super.initUI(self)

	local go = self.go

	self.bgImg_ = go:ComponentByName("bg", typeof(UISprite))
	self.label_ = go:ComponentByName("text", typeof(UILabel))
	self.width_ = self.bgImg_.width
end

function BubbleText:setPosition(pos)
	self.go.transform.localPosition = Vector3(pos.x, pos.y, pos.z)
end

function BubbleText:setText(text)
	self.text_ = text
	self.label_.text = __(self.text_)
end

function BubbleText:setSize(w, h, fontSize)
	self.width_ = w
	self.height_ = h
	self.label_.width = 0.75 * w
	self.bgImg_.width = w
	self.bgImg_.height = h
	self.go.transform.localPosition = Vector3(0.8275862068965517 * h, 0, 0)
end

function BubbleText:setBgVector(isRight)
	local Vectorx = xyd.checkCondition(isRight, 1, -1)

	self.bgImg_.gameObject.transform:SetLocalScale(Vectorx, 1, 1)
end

function BubbleText:setBubbleFlipX(ifFlip)
	if ifFlip then
		self.go.transform.localPosition.x = Vector3(ANCHOR[2] / 260 * self.width_, 0, 0)
	else
		self.go.transform.localPosition.x = Vector3(ANCHOR[1] / 260 * self.width_, 0, 0)
	end
end

function BubbleText:setPositionY(posY)
	self.go.transform.localPosition = Vector3(self.go.transform.localPosition.x, posY, self.go.transform.localPosition.z)
end

function BubbleText:playDialogAction(text)
	self.text_ = text
	self.label_.text = __(self.text_)
	self.go.transform.localScale = Vector3(0, 0, 0)

	self.go:SetActive(true)
	self.bgImg_:SetAnchor(self.label_.gameObject, 0, -30, 0, -60, 1, 30, 1, 50)

	local sq = self:getSequence()

	sq:Append(self.go.transform:DOScale(Vector3(1.1, 1.1, 1.1), 0.3))
	sq:Append(self.go.transform:DOScale(Vector3(1, 1, 1), 0.16))
	sq:AppendCallback(function()
		sq:Kill(false)

		sq = nil
	end)
end

function BubbleText:playDisappear()
	local gameObject = self.go.gameObject

	if gameObject ~= nil and not gameObject:Equals(nil) then
		gameObject:SetActive(false)
	end
end

function BubbleText:setBubble(size, textColor, stroke, strokeColor)
	if size then
		self.label_.fontSize = size
	end

	if textColor then
		self.label_.color = textColor
	end

	if stroke then
		self.label_.effectDistance = Vector2(stroke, stroke)
	end

	if strokeColor then
		self.label_.effectColor = strokeColor
	end
end

return BubbleText
