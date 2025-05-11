-- chunkname: @../../../Product/Bundles/Android/src/app/components/PngNum.lua

local PngNum = class("PngNum", import(".BaseComponent"), true)

function PngNum:ctor(go)
	PngNum.super.ctor(self, go)

	self.gap = Vector2(0, 0)
	self.data = {}
end

function PngNum:getPrefabPath()
	return "Prefabs/Components/png_num"
end

function PngNum:initUI()
	PngNum.super.initUI(self)

	self.goTrans = self.go.transform

	self.goTrans:SetActive(false)

	self.mainGroup = self.goTrans:Find("group_main")
	self.uiTable = self.goTrans:ComponentByName("group_main", typeof(UILayout))
	self.numImg = self.goTrans:Find("num_img")

	self.numImg:SetActive(false)

	self.depthObjs_ = {}
end

function PngNum.____setters:num(num)
	local params = self.data

	if params ~= nil then
		params.num = num
	else
		params = {
			num = num
		}
	end

	self.num_ = params.num

	self:setInfo(params)
end

function PngNum.____setters:scale(scale)
	self.goTrans.localScale = Vector3(scale, scale, scale)
end

function PngNum:setInfo(params)
	self.data = params

	local num = params.num or 0

	if not self.numArr then
		self.numArr = {}
	end

	self.num_ = num

	local iconName = params.iconName or "battle_normal"
	local iconAtlas = params.atlas
	local isShowAdd = params.isShowAdd or false
	local numArrIndex = 0

	if num < 0 then
		numArrIndex = numArrIndex + 1

		if self.numArr[numArrIndex] then
			self.numArr[numArrIndex]:SetActive(true)
			xyd.setUISpriteAsync(self.numArr[numArrIndex]:GetComponent(typeof(UISprite)), iconAtlas, tostring(iconName) .. "_del", nil, nil, true)
		else
			local imgGo = NGUITools.AddChild(self.mainGroup.gameObject, self.numImg.gameObject)

			imgGo:SetActive(true)
			xyd.setUISpriteAsync(imgGo:GetComponent(typeof(UISprite)), iconAtlas, tostring(iconName) .. "_del", nil, nil, true)

			self.numArr[numArrIndex] = imgGo
		end
	elseif isShowAdd then
		numArrIndex = numArrIndex + 1

		if self.numArr[numArrIndex] then
			self.numArr[numArrIndex]:SetActive(true)
			xyd.setUISpriteAsync(self.numArr[numArrIndex]:GetComponent(typeof(UISprite)), iconAtlas, tostring(iconName) .. "_del", nil, nil, true)
		else
			local imgGo = NGUITools.AddChild(self.mainGroup.gameObject, self.numImg.gameObject)

			imgGo:SetActive(true)
			xyd.setUISpriteAsync(imgGo:GetComponent(typeof(UISprite)), iconAtlas, tostring(iconName) .. "_add", nil, nil, true)

			self.numArr[numArrIndex] = imgGo
		end
	end

	local absNum = math.abs(num)
	local strNum = tostring(absNum)

	if params.isAbbr then
		strNum = xyd.getRoughDisplayNumber(absNum)
	end

	for i = 1, string.len(strNum) do
		local tmpNum = string.sub(strNum, i, i)
		local iconMaterial = tostring(iconName) .. "_num_" .. tostring(tmpNum)

		numArrIndex = numArrIndex + 1

		if self.numArr[numArrIndex] then
			-- block empty
		else
			local imgGo = NGUITools.AddChild(self.mainGroup.gameObject, self.numImg.gameObject)

			self.numArr[numArrIndex] = imgGo
		end

		self.numArr[numArrIndex]:SetActive(true)

		local imgComp = self.numArr[numArrIndex]:GetComponent(typeof(UISprite))

		if xyd.isIosTest() then
			iconMaterial = iconMaterial .. "_ios_test"

			xyd.setUISprite(imgComp, nil, iconMaterial)
		end

		xyd.setUISpriteAsync(imgComp, iconAtlas, iconMaterial, nil, nil, true)
	end

	for i = numArrIndex + 1, #self.numArr do
		self.numArr[i]:SetActive(false)
	end

	if params.scale then
		self.scale = params.scale
	end

	if params.gap then
		self.gap = params.gap
		self.uiTable.padding = params.gap
	end

	self.goTrans:SetActive(true)
	self:waitForFrame(1, function()
		self.uiTable:Reposition()
	end)
end

function PngNum:getWidth()
	local transform = self.mainGroup.transform
	local width = 0

	for i = 1, transform.childCount do
		local child = transform:GetChild(i - 1).gameObject
		local widget = child:GetComponent(typeof(UIWidget))

		if widget then
			width = width + widget.width
		end
	end

	return width
end

function PngNum:getHeight()
	local transform = self.mainGroup.transform
	local maxHeight = 0

	for i = 1, transform.childCount do
		local child = transform:GetChild(i - 1).gameObject
		local widget = child:GetComponent(typeof(UIWidget))

		if widget then
			maxHeight = xyd.checkCondition(maxHeight < widget.height, widget.height, maxHeight)
		end
	end

	return maxHeight
end

function PngNum:getMainGroup()
	return self.mainGroup.gameObject
end

function PngNum:getNum()
	return self.num_
end

function PngNum:setTimeNum(params)
	local num = params.num or "0"
	local iconName = params.iconName or "battle_normal"
	local iconAtlas = params.atlas

	self.gap = params.gap or 0

	for i = 1, string.len(num) do
		local tmpNum = string.sub(num, i, i)
		local iconMaterial = tostring(iconName) .. "_num_" .. tostring(tmpNum)

		if xyd.isIosTest() then
			iconMaterial = tostring(iconName) .. "_num_" .. tostring(tmpNum) .. "_ios_test"
		end

		local imgGo = NGUITools.AddChild(self.mainGroup.gameObject, self.numImg.gameObject)

		imgGo:SetActive(true)

		local imgComp = imgGo:GetComponent(typeof(UISprite))

		xyd.setUISprite(imgComp, nil, iconMaterial)
		imgComp:MakePixelPerfect()
	end

	self.data = params

	if params.scale then
		self.scale = params.scale
	end

	if params.gap then
		self.gap = params.gap
		self.uiTable.padding = params.gap
	end

	if params.gap2 then
		self.uiTable.gap = params.gap2
	end

	self.goTrans:SetActive(true)
	self.uiTable:Reposition()
end

function PngNum:Reposition()
	self.uiTable:Reposition()
end

return PngNum
