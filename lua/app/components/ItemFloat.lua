-- chunkname: @../../../Product/Bundles/Android/src/app/components/ItemFloat.lua

local ItemFloat = class("ItemFloat", import(".BaseComponent"))

function ItemFloat:ctor(parentGo)
	ItemFloat.super.ctor(self, parentGo)
end

function ItemFloat:initUI()
	ItemFloat.super.initUI(self)

	local go = self.go

	self.baseWi_ = self.go:GetComponent(typeof(UIWidget))
	self.iconRoot_ = go:ComponentByName("iconRoot", typeof(UIWidget))
	self.desc_ = go:ComponentByName("desc", typeof(UILabel))
	self.getItemAni_ = go:GetComponent(typeof(UnityEngine.Animator))
	self.animaEvent_ = go:GetComponent(typeof(LuaAnimationEvent))
	self.getItemAni_.enabled = false
end

function ItemFloat:getPrefabPath()
	return "Prefabs/Components/item_float"
end

function ItemFloat:setInfo(params)
	self.itemID_ = params.itemID
	self.params_ = params
	self.noDestroy_ = params.noDestroy
	self.desc_.text = xyd.tables.itemTable:getName(params.itemID)

	local itemID = self.itemID_
	local iconType
	local type = xyd.tables.itemTable:getType(itemID)

	if type == xyd.ItemType.ACTIVITY_SPACE_EXPLORE then
		iconType = xyd.ItemIconType.ACTIVITY_SPACE_EXPLORE_ICON
		itemID = xyd.tables.miscTable:getNumber("adventure_giftbag_limit_partner", "value")
	end

	if not self.itemIcon_ then
		self.itemIcon_ = xyd.getItemIcon({
			itemID = itemID,
			num = params.num,
			hideText = params.hideText,
			uiRoot = self.iconRoot_.gameObject
		}, iconType)
	else
		for i = 0, self.iconRoot_.transform.childCount - 1 do
			local child = self.iconRoot_.transform:GetChild(i).gameObject

			UnityEngine.Object.Destroy(child)
		end

		self.itemIcon_ = xyd.getItemIcon({
			itemID = params.itemID,
			num = params.num,
			hideText = params.hideText,
			uiRoot = self.iconRoot_.gameObject
		}, iconType)
	end

	self.getItemAni_.enabled = false

	local widthDesc = self.desc_.width
	local widthIcon = self.iconRoot_.width

	self.iconRoot_:X(-widthDesc / 2)
	self.desc_:X(widthIcon / 2 - widthDesc / 2)
end

function ItemFloat:playGetAni()
	function self.animaEvent_.callback(eventName)
		if eventName == "OnFinished" and not self.noDestroy_ then
			self:destroy()
		end
	end

	self.baseWi_.alpha = 1
	self.getItemAni_.enabled = true

	self.getItemAni_:Play("getItemAni")
end

function ItemFloat:destroy()
	if not tolua.isnull(self.go) then
		NGUITools.Destroy(self.go)
	end
end

return ItemFloat
