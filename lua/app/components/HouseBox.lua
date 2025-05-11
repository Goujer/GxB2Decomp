-- chunkname: @../../../Product/Bundles/Android/src/app/components/HouseBox.lua

local HouseBoxItem = class("HouseBoxItem")
local ItemTable = xyd.tables.itemTable

function HouseBoxItem:ctor(go, parent)
	self.go = go
	self.parent = parent

	xyd.setDragScrollView(go, parent.scrollView)
	self:initUI()
	self:registerEvent()
end

function HouseBoxItem:initUI()
	self.labelName_ = self.go:ComponentByName("labelName_", typeof(UILabel))
	self.labelNum_ = self.go:ComponentByName("labelNum_", typeof(UILabel))
	self.imgSelect_ = self.go:NodeByName("imgSelect_").gameObject
	self.img_ = self.go:ComponentByName("img_", typeof(UISprite))
end

function HouseBoxItem:update(index, info)
	if not info then
		self.go:SetActive(false)

		return
	end

	self.data = info

	self.go:SetActive(true)
	self:updateInfo()
end

function HouseBoxItem:refresh()
	self:updateInfo()
end

function HouseBoxItem:getGameObject()
	return self.go
end

function HouseBoxItem:layout()
	return
end

function HouseBoxItem:registerEvent()
	UIEventListener.Get(self.go).onClick = handler(self, self.onClick)
end

function HouseBoxItem:updateInfo()
	xyd.setUISpriteAsync(self.img_, xyd.Atlas.HOUSE_FURNITURE, ItemTable:getIcon(self.data))

	local hasNum = xyd.models.backpack:getItemNumByID(self.data)
	local setNum = xyd.HouseMap.get():getInHouseNum(self.data)
	local name = ItemTable:getName(self.data)

	self.labelNum_.text = tostring(hasNum - setNum) .. "/" .. tostring(hasNum)

	if xyd.Global.lang == "de_de" then
		self.labelName_.fontSize = 20
		name = xyd.autoLineFeed(name, 12)
	end

	self.labelName_.text = name
end

function HouseBoxItem:onClick()
	xyd.WindowManager.get():openWindow("house_item_detail_window", {
		wnd_type = xyd.HouseItemDetailWndType.SET,
		item_id = self.data,
		itemIndex = self.itemIndex
	})
end

local HouseBox = class("HouseBox")
local MiscTable = xyd.tables.miscTable
local FixedWrapContent = import("app.common.ui.FixedWrapContent")
local HouseShopTapItem = import(".HouseShopTapItem")
local HouseFurnitureTable = xyd.tables.houseFurnitureTable

function HouseBox:ctor(go)
	self.go = go
	self.curSelectGroup = -1
	self.sortType = 1
	self.curPage_ = 1

	local types = MiscTable:split2num("dorm_show_furniture_type", "value", "|")

	self.maxPage_ = #types
	self.collections_ = {}

	self:initUI()
end

function HouseBox:initUI()
	local go = self.go

	self.boxScroller_ = go:NodeByName("boxScroller_").gameObject
	self.boxItemList_ = self.boxScroller_:NodeByName("boxItemList_").gameObject
	self.topBtns_ = go:NodeByName("topBtns_").gameObject
	self.btnLeft_ = go:NodeByName("topBtns_/btnLeft_").gameObject
	self.btnRight_ = go:NodeByName("topBtns_/btnRight_").gameObject
	self.topTap_ = go:NodeByName("topBtns_/topTap_").gameObject
	self.groupNum = go:NodeByName("groupNum").gameObject
	self.labelLeft_ = go:ComponentByName("groupNum/labelLeft_", typeof(UILabel))
	self.labelLeftNum_ = go:ComponentByName("groupNum/labelLeftNum_", typeof(UILabel))

	local btnPanel = go:NodeByName("btnPanel").gameObject

	self.btnTheme_ = btnPanel:NodeByName("groupBtn/btnTheme_").gameObject
	self.btnSort_ = btnPanel:NodeByName("groupBtn/btnSort_").gameObject
	self.groupSort_ = btnPanel:NodeByName("groupBtn/groupSort_").gameObject
	self.sort1 = self.groupSort_:NodeByName("sort1").gameObject
	self.sort2 = self.groupSort_:NodeByName("sort2").gameObject
	self.sort3 = self.groupSort_:NodeByName("sort3").gameObject
	self.sort4 = self.groupSort_:NodeByName("sort4").gameObject

	local scrollView = go:ComponentByName("boxScroller_", typeof(UIScrollView))
	local wrapContent = scrollView:ComponentByName("boxItemList_", typeof(UIWrapContent))
	local boxItem = scrollView:NodeByName("box_item").gameObject

	self.boxWrapContent = FixedWrapContent.new(scrollView, wrapContent, boxItem, HouseBoxItem, self)
end

function HouseBox:setInfo(width)
	self.go:GetComponent(typeof(UIWidget)).width = width

	self:layout()
	self:initData()
	self:updateItemList()
	self:updateLabelLeftNum()
	self:registerEvent()
end

function HouseBox:layout()
	self.btnSort_:ComponentByName("button_label", typeof(UILabel)).text = __("HOUSE_TEXT_7")
	self.btnTheme_:ComponentByName("button_label", typeof(UILabel)).text = __("HOUSE_TEXT_1")
	self.labelLeft_.text = __("HOUSE_TEXT_2")
	self.sort1:ComponentByName("labelTips", typeof(UILabel)).text = __("HOUSE_TEXT_3")
	self.sort2:ComponentByName("labelTips", typeof(UILabel)).text = __("HOUSE_TEXT_4")
	self.sort3:ComponentByName("labelTips", typeof(UILabel)).text = __("HOUSE_TEXT_5")
	self.sort4:ComponentByName("labelTips", typeof(UILabel)).text = __("HOUSE_TEXT_59")

	self:updateSortChosen()
	self:initTopTap()
	self:updateBtn()
end

function HouseBox:registerEvent()
	for i = 1, 4 do
		UIEventListener.Get(self["sort" .. i]).onClick = function()
			self:onSortSelectTouch(i)
		end
	end

	UIEventListener.Get(self.btnLeft_).onClick = function()
		self:onBtnTouch(-1)
	end
	UIEventListener.Get(self.btnRight_).onClick = function()
		self:onBtnTouch(1)
	end
	UIEventListener.Get(self.btnSort_).onClick = handler(self, self.onSortTouch)
	UIEventListener.Get(self.btnTheme_).onClick = handler(self, self.onThemeTouch)
end

function HouseBox:onThemeTouch()
	xyd.WindowManager.get():openWindow("house_theme_window", {
		callback = function(id)
			if self.curSelectGroup ~= id then
				self.curSelectGroup = id

				self:initData()
				self:updateItemList()
			end
		end
	})
end

function HouseBox:onSortTouch()
	local img = self.btnSort_:NodeByName("buttom_img").gameObject
	local scale = img.transform.localScale

	img.transform:SetLocalScale(scale.x, -1 * scale.y, scale.z)
	self:moveGroupSort()
end

function HouseBox:onSortSelectTouch(index)
	if self.sortType ~= index then
		self.sortType = index

		self:updateSortChosen()
		self:updateItemList()
		self:onSortTouch()
	end
end

function HouseBox:updateSortChosen()
	for i = 1, 4 do
		local sort = self["sort" .. tostring(i)]
		local btn = sort:GetComponent(typeof(UIButton))
		local label = sort:ComponentByName("labelTips", typeof(UILabel))

		if i == self.sortType then
			btn:SetEnabled(false)

			label.color = Color.New2(4294967295)
			label.effectStyle = UILabel.Effect.Outline
			label.effectColor = Color.New2(1012112383)
		else
			btn:SetEnabled(true)

			label.color = Color.New2(960513791)
			label.effectStyle = UILabel.Effect.None
		end
	end
end

function HouseBox:onBtnTouch(num)
	if self.curPage_ + num < 1 or self.curPage_ + num > self.maxPage_ then
		return
	end

	self.curTopTapBtnIndex_ = self.curTopTapBtnIndex_ + num
	self.curPage_ = self.curPage_ + num

	self:updateTopTapBtnInfo()
	self:updateBtn()
	self:updateItemList()
	self:updateLabelLeftNum()
end

function HouseBox:onBtnTouch2(num, index)
	if self.curPage_ == num then
		return
	end

	self.curTopTapBtnIndex_ = index
	self.curPage_ = num

	self:updateBtn()
	self:updateItemList()
	self:updateLabelLeftNum()
end

function HouseBox:getTypeByPage(page)
	local types = MiscTable:split2num("dorm_show_furniture_type", "value", "|")

	return types[page]
end

function HouseBox:initTopTap()
	self.topTapBtns_ = {}

	local tapBtn = self.topTap_:NodeByName("tapBtn").gameObject

	for i = 1, 4 do
		local go = NGUITools.AddChild(self.topTap_, tapBtn)
		local item = HouseShopTapItem.new(go)

		item:setIndex(i)
		item:setInfo({
			page = i,
			type = self:getTypeByPage(i),
			wnd = self
		})

		self.topTapBtns_[i] = item
	end

	self.curTopTapBtnIndex_ = 1
end

function HouseBox:updateTopTapBtnInfo()
	local num = 0

	if self.curTopTapBtnIndex_ < 1 then
		num = -1
		self.curTopTapBtnIndex_ = 1
	elseif self.curTopTapBtnIndex_ > #self.topTapBtns_ then
		num = 1
		self.curTopTapBtnIndex_ = #self.topTapBtns_
	end

	if num ~= 0 then
		for i = 1, #self.topTapBtns_ do
			local btn = self.topTapBtns_[i]
			local newPage = btn:getPage() + num

			btn:setInfo({
				page = newPage,
				type = self:getTypeByPage(newPage),
				wnd = self
			})
		end
	end
end

function HouseBox:updateBtn()
	local curPage = self.curPage_

	for _, item in pairs(self.topTapBtns_) do
		if item:getPage() == curPage then
			item:setBtn(true)
		else
			item:setBtn(false)
		end
	end

	self.btnLeft_:GetComponent(typeof(UIButton)):SetEnabled(true)
	self.btnRight_:GetComponent(typeof(UIButton)):SetEnabled(true)

	if curPage == 1 then
		self.btnLeft_:GetComponent(typeof(UIButton)):SetEnabled(false)
	elseif curPage == self.maxPage_ then
		self.btnRight_:GetComponent(typeof(UIButton)):SetEnabled(false)
	end
end

function HouseBox:moveGroupSort()
	local w = self.groupSort_:GetComponent(typeof(UIWidget))
	local height = w.height
	local transform = self.groupSort_.transform
	local action = DG.Tweening.DOTween.Sequence()
	local img = self.btnSort_:NodeByName("buttom_img").gameObject
	local scaleY = img.transform.localScale.y

	if scaleY == 1 then
		action:Append(transform:DOLocalMove(Vector3(-56, height + 17, 0), 0.067)):Append(transform:DOLocalMove(Vector3(-56, height - 58, 0), 0.1)):Join(xyd.getTweenAlpha(w, 0.01, 0.1)):AppendCallback(function()
			self.groupSort_:SetActive(false)
			transform:SetLocalPosition(-56, 0, 0)
		end)
	else
		self.groupSort_:SetActive(true)

		w.alpha = 0.01

		transform:SetLocalPosition(-56, height - 58, 0)
		action:Append(transform:DOLocalMove(Vector3(-56, height + 17, 0), 0.1)):Join(xyd.getTweenAlpha(w, 1, 0.1)):Append(transform:DOLocalMove(Vector3(-56, height, 0), 0.2))
	end
end

function HouseBox:setBuyFuniture(flag)
	if flag == true then
		self.needUpdateList_ = true
	end

	self:checkRefresh()
end

function HouseBox:checkRefresh()
	if not self.needUpdateList_ then
		return
	end

	if self.isHide_ then
		return
	end

	self:updateByBuyFuniture()

	self.needUpdateList_ = false
end

function HouseBox:setHide(flag)
	self.isHide_ = flag
end

function HouseBox:updateByBuyFuniture()
	self:initData()
	self:updateItemList()
end

function HouseBox:updateBySetFuniture(itemIndex)
	self:updateLabelLeftNum()

	local type_ = self:getTypeByPage(self.curPage_)
	local key = tostring(self.sortType) .. "|" .. tostring(type_)
	local collection = self.collections_[key] or nil

	if collection then
		self.boxWrapContent:refresh()
	end
end

function HouseBox:initData()
	self.collections_ = {}

	local datas = {}

	datas[0] = {}

	local ids = HouseFurnitureTable:getIDs()
	local backpack = xyd.models.backpack

	for _, id in ipairs(ids) do
		local type_ = HouseFurnitureTable:type(id)
		local group_ = HouseFurnitureTable:groupId(id)
		local num = backpack:getItemNumByID(id)

		if num > 0 and (self.curSelectGroup == -1 or self.curSelectGroup == group_) then
			if not datas[type_] then
				datas[type_] = {}
			end

			table.insert(datas[type_], id)
			table.insert(datas[0], id)
		end
	end

	local types = MiscTable:split2num("dorm_show_furniture_type", "value", "|")

	for sortType = 1, 4 do
		for _, type_ in ipairs(types) do
			local data = xyd.getCopyData(datas[type_] or {})

			self:sortByType(data, sortType)

			local key = tostring(sortType) .. "|" .. tostring(type_)

			self.collections_[key] = data
		end
	end
end

function HouseBox:sortByType(data, type_)
	if type_ == 1 then
		table.sort(data, function(a, b)
			return a < b
		end)
	elseif type_ == 2 then
		table.sort(data, function(a, b)
			local areaA = HouseFurnitureTable:area(a)
			local areaB = HouseFurnitureTable:area(b)
			local areaANum = areaA[1] * areaA[2]
			local areaBNum = areaB[1] * areaB[2]

			if areaANum ~= areaBNum then
				return areaANum < areaBNum
			end

			return a < b
		end)
	elseif type_ == 3 then
		table.sort(data, function(a, b)
			local priceA = HouseFurnitureTable:price(a)
			local priceB = HouseFurnitureTable:price(b)
			local priceANum = priceA[2] or 0
			local priceBNum = priceB[2] or 0

			if priceANum ~= priceBNum then
				return priceANum < priceBNum
			end

			return a < b
		end)
	elseif type_ == 4 then
		table.sort(data, function(a, b)
			local numA = xyd.models.backpack:getItemNumByID(a) - xyd.HouseMap.get():getInHouseNum(a)
			local numB = xyd.models.backpack:getItemNumByID(b) - xyd.HouseMap.get():getInHouseNum(b)

			if numA ~= numB then
				return numB < numA
			end

			return a < b
		end)
	end
end

function HouseBox:updateItemList()
	local type_ = self:getTypeByPage(self.curPage_)
	local key = tostring(self.sortType) .. "|" .. tostring(type_)
	local collection = self.collections_[key] or {}

	if type_ == 0 then
		self.groupNum:SetActive(false)
	else
		self.groupNum:SetActive(true)
	end

	self.boxWrapContent:setInfos(collection, {})
end

function HouseBox:updateLabelLeftNum()
	local type_ = self:getTypeByPage(self.curPage_)
	local typeLimit = MiscTable:split2num("dorm_top_num_by_type", "value", "|")
	local maxTypeNum = typeLimit[type_] or 0
	local curNum = xyd.HouseMap.get():getFurnitureNumByType(type_)

	self.labelLeftNum_.text = tostring(curNum) .. "/" .. tostring(maxTypeNum)
end

return HouseBox
