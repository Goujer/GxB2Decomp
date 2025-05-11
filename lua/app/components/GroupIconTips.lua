-- chunkname: @../../../Product/Bundles/Android/src/app/components/GroupIconTips.lua

local GroupIconTips = class("GroupIconTips", import(".BaseComponent"))

function GroupIconTips:ctor(parentGo)
	GroupIconTips.super.ctor(self, parentGo)
end

function GroupIconTips:getPrefabPath()
	return "Prefabs/Components/group_icon_tips"
end

function GroupIconTips:initUI()
	GroupIconTips.super.initUI(self)

	local go = self.go
	local top = go:NodeByName("top").gameObject

	self.name = top:ComponentByName("name", typeof(UILabel))
	self.iconContainer = top:NodeByName("icon").gameObject
	self.icon = top:ComponentByName("icon/img", typeof(UISprite))
	self.descGroup = top:NodeByName("descGroup").gameObject
	self.clickMask = top:NodeByName("clickMask").gameObject
	self.desc = self.descGroup:ComponentByName("desc", typeof(UILabel))
end

function GroupIconTips:setInfo(id)
	self.name.text = xyd.tables.groupTextTable:getName(id)
	self.desc.text = xyd.tables.groupTextTable:getDesc(id)

	xyd.setUISpriteAsync(self.icon, nil, "img_group" .. id)
end

function GroupIconTips:setClickMask(callback)
	UIEventListener.Get(self.clickMask.gameObject).onClick = function()
		callback()
	end

	self.clickMask:SetActive(true)
end

return GroupIconTips
