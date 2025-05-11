-- chunkname: @../../../Product/Bundles/Android/src/app/components/BaseCost.lua

local BaseCost = class("BaseCost", import(".BaseComponent"))

function BaseCost:ctor(parentGo)
	BaseCost.super.ctor(self, parentGo)
end

function BaseCost:getPrefabPath()
	return "Prefabs/Components/base_cost"
end

function BaseCost:initUI()
	BaseCost.super.initUI(self)

	self.costIcon = self.go:ComponentByName("costImg", typeof(UISprite))
	self.costLable = self.go:ComponentByName("costLable", typeof(UILabel))
end

function BaseCost:setInfo(params)
	self.costLable.text = params.cost[2]

	local imgName = xyd.tables.itemTable:getIcon(params.cost[1])

	xyd.setUISpriteAsync(self.costIcon, nil, imgName)

	if params.localPosition then
		self.go:SetLocalPosition(params.localPosition.x, params.localPosition.y, params.localPosition.z)
	end
end

function BaseCost:setLabelWidth(width)
	self.costLable.width = width
end

return BaseCost
