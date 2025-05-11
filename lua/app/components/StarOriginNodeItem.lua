-- chunkname: @../../../Product/Bundles/Android/src/app/components/StarOriginNodeItem.lua

local StarOriginNodeItem = class("StarOriginNodeItem", import("app.components.CopyComponent"))

function StarOriginNodeItem:ctor(go, parent)
	StarOriginNodeItem.super.ctor(self, go, parent)

	self.parent = parent
	self.icons = {}
	self.starImgNameByState = {
		"star_origin_bg_xy_zh",
		"star_origin_bg_xy_kq",
		"star_origin_bg_xy_dl"
	}
	self.lineImgNameByState = {
		"star_origin_bg_xy_zh_1",
		"star_origin_bg_xy_kq_1",
		"star_origin_bg_xy_dl_1"
	}
end

function StarOriginNodeItem:initUI()
	self.icon = self.go:ComponentByName("icon", typeof(UISprite))
	self.line = self.go:ComponentByName("line", typeof(UISprite))
	self.line2 = self.go:ComponentByName("line2", typeof(UISprite))
end

function StarOriginNodeItem:setInfo(data)
	self.state = data.state
	self.nodeTableID = data.nodeTableID
	self.lev = data.lev

	local starImgName = self.starImgNameByState[self.state]
	local lineImgName = self.lineImgNameByState[self.state]

	if self.state == 2 and self.lev == 0 then
		starImgName = self.starImgNameByState[2]
		lineImgName = self.lineImgNameByState[2]
	elseif self.lev > 0 then
		starImgName = self.starImgNameByState[3]
		lineImgName = self.lineImgNameByState[3]
	end

	xyd.setUISpriteAsync(self.icon, nil, starImgName)
	xyd.setUISpriteAsync(self.line, nil, lineImgName)

	local xy = xyd.tables.starOriginNodeTable:getXy(self.nodeTableID)
	local preNodeTableID = xyd.tables.starOriginNodeTable:getPreId(self.nodeTableID)

	self.go:X(xy[1] * 0.66)
	self.go:Y(xy[2] * 0.66)

	if preNodeTableID and preNodeTableID > 0 then
		local preNodeXY = xyd.tables.starOriginNodeTable:getXy(preNodeTableID)

		self.line:X((preNodeXY[1] - xy[1]) / 2 * 0.66)
		self.line:Y((preNodeXY[2] - xy[2]) / 2 * 0.66)

		local angle = math.atan2(preNodeXY[2] - xy[2], preNodeXY[1] - xy[1]) * 180 / math.pi

		self.line.gameObject.transform.localEulerAngles = Vector3(0, 0, angle + 90)
		self.line.height = math.sqrt((preNodeXY[1] - xy[1]) * 0.66 * (preNodeXY[1] - xy[1]) * 0.66 + (preNodeXY[2] - xy[2]) * 0.66 * (preNodeXY[2] - xy[2]) * 0.66)

		self.line:SetActive(true)
	else
		self.line:SetActive(false)
	end

	if self.line2 then
		self.line2:SetActive(false)
	end
end

function StarOriginNodeItem:setLineByPreNodeID(preNodeTableID, state)
	local lineImgName = self.lineImgNameByState[state]

	xyd.setUISpriteAsync(self.line, nil, lineImgName)

	self.icon = self.go:ComponentByName("icon", typeof(UISprite))
	self.line = self.go:ComponentByName("line", typeof(UISprite))

	local xy = xyd.tables.starOriginNodeTable:getXy(self.nodeTableID)

	xyd.setUISpriteAsync(self.line2, nil, lineImgName, function()
		local preNodeXY = xyd.tables.starOriginNodeTable:getXy(preNodeTableID)

		self.line2:X((preNodeXY[1] - xy[1]) / 2 * 0.66)
		self.line2:Y((preNodeXY[2] - xy[2]) / 2 * 0.66)

		local angle = math.atan2(preNodeXY[2] - xy[2], preNodeXY[1] - xy[1]) * 180 / math.pi

		self.line2.gameObject.transform.localEulerAngles = Vector3(0, 0, angle + 90)
		self.line2.height = math.sqrt((preNodeXY[1] - xy[1]) * 0.66 * (preNodeXY[1] - xy[1]) * 0.66 + (preNodeXY[2] - xy[2]) * 0.66 * (preNodeXY[2] - xy[2]) * 0.66)

		self.line2:SetActive(true)
	end, nil, true)
end

return StarOriginNodeItem
