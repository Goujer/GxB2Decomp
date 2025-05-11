-- chunkname: @../../../Product/Bundles/Android/src/app/components/SummonButton.lua

local SummonButton = class("SummonButton", import(".CopyComponent"))

function SummonButton:ctor(go)
	SummonButton.super.ctor(self, go)
	self:initUI()
end

function SummonButton:initUI()
	local go = self.go

	self.itemIcon = go:ComponentByName("itemIcon", typeof(UISprite))
	self.labelItemCost = go:ComponentByName("itemIcon/labelItemCost", typeof(UILabel))
	self.label = go:ComponentByName("button_label", typeof(UILabel))
end

function SummonButton:touchCallback(callback, this)
	xyd.setDarkenBtnBehavior(self.go, this, callback)
end

function SummonButton:SetEnabled(bool)
	if bool then
		local widget = self.go:GetComponent(typeof(UIWidget))

		if not widget then
			return
		end

		local boxCollider = self.go:GetComponent(typeof(UnityEngine.BoxCollider))

		if not boxCollider then
			boxCollider = self.go:AddComponent(typeof(UnityEngine.BoxCollider))
			boxCollider.size = Vector3(widget.width, widget.height, 0)
		end

		boxCollider.enabled = true
	else
		local boxCollider = self.go:GetComponent(typeof(UnityEngine.BoxCollider))

		if boxCollider then
			boxCollider.enabled = false
		end
	end
end

function SummonButton:setLabel(text)
	self.label.text = text
end

function SummonButton:setCostIcon(cost)
	if not cost then
		self.label.gameObject:X(0)

		self.label.width = 160

		self.itemIcon:SetActive(false)
	else
		self.itemIcon:SetActive(true)
		self.label.gameObject:X(20)

		self.label.width = 125

		local sp = xyd.tables.itemTable:getSmallIconNew(cost[1])

		xyd.setUISprite(self.itemIcon, nil, sp)

		if cost[1] == xyd.ItemID.CRYSTAL then
			self.labelItemCost.text = tostring(cost[2])
		else
			self.labelItemCost.text = xyd.getRoughDisplayNumber(cost[2], 1000)
		end
	end
end

return SummonButton
