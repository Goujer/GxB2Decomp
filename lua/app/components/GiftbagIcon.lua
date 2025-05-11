-- chunkname: @../../../Product/Bundles/Android/src/app/components/GiftbagIcon.lua

local GiftbagIcon = class("GiftbagIcon", import(".BaseComponent"))

function GiftbagIcon:ctor(parentGo, params)
	self.data_ = params
	self.icon_src_ = params.icon_src
	self.awards_ = params.awards
	self.title_ = params.title
	self.dragScrollView_ = params.dragScrollView

	GiftbagIcon.super.ctor(self, parentGo)
end

function GiftbagIcon:initUI()
	GiftbagIcon.super.initUI(self)
	self:getComponent()
	print("self.icon_src_")
	print(self.icon_src_)
	xyd.setUISpriteAsync(self.iconImg_, nil, self.icon_src_, function()
		self.iconImg_:MakePixelPerfect()
	end)

	UIEventListener.Get(self.touchGroup_).onClick = function()
		xyd.WindowManager.get():openWindow("activity_award_preview_window", {
			awards = self.awards_,
			title = self.title_
		})
	end

	if self.dragScrollView_ then
		local drag = self.go:AddComponent(typeof(UIDragScrollView))

		drag.scrollView = self.dragScrollView_
	end
end

function GiftbagIcon:setIconSrc(src)
	self.icon_src_ = src
end

function GiftbagIcon:getComponent()
	local goTrans = self.go.transform

	self.iconImg_ = goTrans:ComponentByName("iconImg", typeof(UISprite))
	self.touchGroup_ = goTrans:NodeByName("touchGroup").gameObject
end

function GiftbagIcon:getPrefabPath()
	return "Prefabs/Components/giftbag_icon"
end

return GiftbagIcon
