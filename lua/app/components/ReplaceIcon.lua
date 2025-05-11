-- chunkname: @../../../Product/Bundles/Android/src/app/components/ReplaceIcon.lua

local ReplaceIcon = class("ReplaceIcon", import(".BaseIcon"))

function ReplaceIcon:ctor(parentGo, params)
	self.params = params or {}

	ReplaceIcon.super.ctor(self, parentGo)
end

function ReplaceIcon:getPrefabPath()
	return "Prefabs/Components/replace_icon"
end

function ReplaceIcon:initUI()
	ReplaceIcon.super.initUI(self)

	local groupMain = self.go:NodeByName("groupMain_").gameObject

	self.groupIcon = groupMain:NodeByName("groupIcon").gameObject
	self.replaceIcon = groupMain:NodeByName("replaceIcon").gameObject
	self.selectedFrame = groupMain:NodeByName("selectedFrame").gameObject

	self.replaceIcon:SetActive(false)

	if self.params.callback then
		xyd.setDarkenBtnBehavior(self.replaceIcon, self, self.params.callback)
	end
end

function ReplaceIcon:setIcon(id, num, noClick, notShowGetWayBtn)
	self.itemID = id

	NGUITools.DestroyChildren(self.groupIcon.transform)

	if id then
		local icon = xyd.getItemIcon({
			wndType = 5,
			show_has_num = true,
			itemID = tonumber(id),
			num = num,
			noClick = noClick,
			uiRoot = self.groupIcon,
			notShowGetWayBtn = notShowGetWayBtn
		})

		icon:setDragScrollView(self.params.scrollView)

		local type_ = xyd.tables.itemTable:getType(self.itemID)

		if type_ ~= xyd.ItemType.AVATAR_FRAME then
			icon:setNoClick(noClick)
		end
	end

	self:setReplaceBtn(id and true or false)
end

function ReplaceIcon:setReplaceBtn(flag)
	if flag and self.params.callback then
		self.replaceIcon:SetActive(true)
	else
		self.replaceIcon:SetActive(false)
	end
end

function ReplaceIcon:selected(value)
	self.selectedFrame:SetActive(value)
end

return ReplaceIcon
