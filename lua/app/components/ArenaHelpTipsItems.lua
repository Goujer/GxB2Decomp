-- chunkname: @../../../Product/Bundles/Android/src/app/components/ArenaHelpTipsItems.lua

local ArenaHelpTipsItems = class("ArenaHelpTipsItems")
local ArenaHelpTipsItem1 = class("ArenaHelpTipsItem1", import("app.components.BaseComponent"))

function ArenaHelpTipsItems:ctor()
	self.ArenaHelpTipsItem1 = ArenaHelpTipsItem1
end

function ArenaHelpTipsItem1:ctor(parentGo, params)
	ArenaHelpTipsItem1.super.ctor(self, parentGo)
end

function ArenaHelpTipsItem1:getPrefabPath()
	return "Prefabs/Components/arena_help_tips_item1"
end

function ArenaHelpTipsItem1:initUI()
	self:getUIComponent()
	ArenaHelpTipsItem1.super.initUI(self)
	self:layout()
end

function ArenaHelpTipsItem1:getUIComponent()
	self.trans = self.go
	self.allImg = self.trans:ComponentByName("allImg", typeof(UITexture))

	for i = 1, 4 do
		self["group" .. i] = self.allImg:NodeByName("group" .. i).gameObject
		self["icon" .. i] = self["group" .. i]:ComponentByName("icon" .. i, typeof(UISprite))
		self["label" .. i] = self["group" .. i]:ComponentByName("label" .. i, typeof(UILabel))
		self["labelBg" .. i] = self["group" .. i]:ComponentByName("labelBg" .. i, typeof(UISprite))
	end
end

function ArenaHelpTipsItem1:layout()
	for i = 1, 4 do
		self["label" .. i].text = __("ARENA_HELP_TIPS_ITEM_TEXT" .. i)

		if i == 3 or i == 4 then
			xyd.setUISpriteAsync(self["icon" .. i], nil, "arena_help_tips_" .. i)
		else
			xyd.setUISpriteAsync(self["icon" .. i], nil, "arena_help_tips_" .. i .. "_" .. xyd.Global.lang)
		end
	end

	if xyd.Global.lang == "fr_fr" then
		self["label" .. 2].width = 236
		self["label" .. 4].width = 236
	end
end

return ArenaHelpTipsItems
