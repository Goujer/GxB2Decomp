-- chunkname: @../../../Product/Bundles/Android/src/app/components/DressStyleIcon.lua

local DressStyleIcon = class("DressStyleIcon", import(".BaseIcon"))

function DressStyleIcon:ctor(parentGo)
	DressStyleIcon.super.ctor(self, parentGo)
end

function DressStyleIcon:getPrefabPath()
	return "Prefabs/Components/dress_style_icon"
end

function DressStyleIcon:initUI()
	DressStyleIcon.super.initUI(self)

	self.bg = self.go:ComponentByName("bg", typeof(UISprite))
	self.icon = self.go:ComponentByName("icon", typeof(UISprite))
	self.upCon = self.go:NodeByName("upCon").gameObject
	self.upConBg = self.upCon:ComponentByName("upConBg", typeof(UISprite))
	self.upIcon = self.upCon:ComponentByName("upIcon", typeof(UISprite))
	self.upLabel = self.upCon:ComponentByName("upLabel", typeof(UILabel))
	self.imgMask_ = self.go:NodeByName("imgMask_").gameObject
	self.imgChoose_ = self.go:NodeByName("imgChoose_").gameObject
end

function DressStyleIcon:setInfo(params)
	self.styleID = params.styleID
	self.params = params
	self.noClick = params.noClick
	self.showUpMax = params.showUpMax

	if self.callback and not params.callback then
		-- block empty
	else
		self.callback = params.callback
	end

	if params.qlt then
		xyd.setUISpriteAsync(self.bg, nil, "lead_skin_border_" .. params.qlt, nil, nil, nil)
	else
		xyd.setUISpriteAsync(self.bg, nil, "lead_skin_bg4", nil, nil, nil)
	end

	if not self.noClick then
		self:setTouchListener(handler(self, self.onClickIcon))
	end

	self:updateIcon()
	self:updateUpConActive()

	if params.isAddUIDragScrollView ~= nil and params.isAddUIDragScrollView == true then
		self:AddUIDragScrollView()
	end
end

function DressStyleIcon:setNoClick(flag)
	self.noClick = flag
end

function DressStyleIcon:onClickIcon()
	if self.noClick then
		return
	end

	if self.callback then
		self:callback()
	else
		print("点到了==========")
	end
end

function DressStyleIcon:setShowStyleNumState(flag)
	self.upCon:SetActive(flag)
end

function DressStyleIcon:updateUpConActive()
	local dress_id = xyd.tables.senpaiDressStyleTable:getDressId(self.styleID)
	local has_all_styles = xyd.models.dress:getHasStyles(dress_id)
	local table_all_styles = xyd.tables.senpaiDressTable:getStyles(dress_id)

	if #table_all_styles <= 1 then
		self.upCon:SetActive(false)
	elseif self.showUpMax then
		self.upLabel.text = #table_all_styles .. "/" .. #table_all_styles

		self.upCon:SetActive(true)
	elseif #has_all_styles == 0 then
		self.upCon:SetActive(false)
	else
		self.upLabel.text = #has_all_styles .. "/" .. #table_all_styles

		self.upCon:SetActive(true)
	end
end

function DressStyleIcon:getStyleID()
	return self.styleID
end

function DressStyleIcon:AddUIDragScrollView()
	self.go:AddComponent(typeof(UIDragScrollView))
end

function DressStyleIcon:setChoose(flag)
	if flag == self.imgChoose_.gameObject.activeSelf then
		return
	end

	self.imgMask_.gameObject:SetActive(flag)
	self.imgChoose_.gameObject:SetActive(flag)
end

function DressStyleIcon:updateShowStyle(styleID)
	self.styleID = styleID

	self:updateIcon()
end

function DressStyleIcon:updateIcon()
	local image = xyd.tables.senpaiDressStyleTable:getImage(self.styleID)

	xyd.setUISpriteAsync(self.icon, nil, image, nil, nil, nil)
end

return DressStyleIcon
