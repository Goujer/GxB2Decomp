-- chunkname: @../../../Product/Bundles/Android/src/app/components/IconClasses.lua

local iconClass = {
	[xyd.ItemIconType.PLAYER_ICON] = require("app.components.PlayerIcon"),
	[xyd.ItemIconType.ITEM_ICON] = require("app.components.ItemIcon"),
	[xyd.ItemIconType.HERO_ICON] = require("app.components.HeroIcon"),
	[xyd.ItemIconType.ACTIVITY_SPACE_EXPLORE_ICON] = require("app.components.ActivitySpaceExploreHeroIcon"),
	[xyd.ItemIconType.DRESS_STYLE_ICON] = require("app.components.DressStyleIcon"),
	[xyd.ItemIconType.ADVANCE_ICON] = require("app.components.AdvanceIcon")
}

return iconClass
