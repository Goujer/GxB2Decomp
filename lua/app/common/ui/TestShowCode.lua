-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/TestShowCode.lua

local TestShowCode = class("TestShowCode")
local AddChild = NGUITools.AddChild
local CommonStaticListItemEg = class("CommonStaticListItemEg", import("app.common.ui.CommonStaticListItem"))
local AdvanceIcon = import("app.components.AdvanceIcon")
local ItemIcon = import("app.components.ItemIcon")
local HeroIcon = import("app.components.HeroIcon")

function TestShowCode:ctor(parentObj)
	self.parentObj = parentObj

	self:initUI()
end

function TestShowCode:initUI()
	self.go = AddChild(self.parentObj.gameObject, "testShowCon")

	self:showAdvanceIcon()
end

local CommonStaticList = import("app.common.ui.CommonStaticList")

function TestShowCode:showCommonStaticList()
	local test1 = AddChild(self.go.gameObject, "showCommonStaticList1")

	test1.gameObject:Y(110)
	test1:AddComponent(typeof(UILayout))

	test1:AddComponent(typeof(UIWidget)).depth = 20

	local testArr1_1 = {
		{
			item_num = 2,
			item_id = 1
		},
		{
			item_num = 4,
			item_id = 3
		},
		{
			item_num = 6,
			item_id = 5
		}
	}
	local params1 = {
		width = 86,
		height = 86,
		parentClass = self,
		updateFun = function(itemSelf, info)
			xyd.getItemIcon({
				scale = 0.7962962962962963,
				uiRoot = itemSelf:getGameObject(),
				itemID = info.item_id,
				num = info.item_num
			})
		end
	}
	local staticList1 = CommonStaticList.new(test1.gameObject, params1)

	staticList1:setInfos(testArr1_1, {
		rePosition = true
	})

	local testArr1_2 = {
		{
			item_num = 8,
			item_id = 7
		},
		{
			item_num = 10,
			item_id = 9
		}
	}

	staticList1:setInfos(testArr1_2, {
		rePosition = true
	})

	local test2 = AddChild(self.go.gameObject, "showCommonStaticList2")

	test2.gameObject:SetLocalPosition(-220, -40, 0)
	test2:AddComponent(typeof(UIGrid))

	test2:AddComponent(typeof(UIWidget)).depth = 30

	local item2 = ResCache.AddGameObject(self.go, "Prefabs/Components/mid_autumn_activity_item")
	local testArr2_1 = {
		{
			item_num = 12,
			item_id = 11
		},
		{
			item_num = 13,
			item_id = 12
		},
		{
			item_num = 15,
			item_id = 14
		}
	}
	local params2 = {
		cloneItem = item2,
		parentClass = self,
		getUIFun = function(itemSelf)
			itemSelf.itemGroup = itemSelf:getGameObject():NodeByName("itemGroup").gameObject
		end,
		updateFun = function(itemSelf, info)
			xyd.getItemIcon({
				scale = 0.7962962962962963,
				uiRoot = itemSelf.itemGroup,
				itemID = info.item_id,
				num = info.item_num
			})
		end
	}
	local staticList2 = CommonStaticList.new(test2, params2)

	staticList2:setInfos(testArr2_1, {
		rePosition = true
	})

	local test3 = AddChild(self.go.gameObject, "showCommonStaticList3")

	test3.gameObject:SetLocalPosition(-300, -146, 0)
	test3:AddComponent(typeof(UITable))

	test3:AddComponent(typeof(UIWidget)).depth = 50

	local testArr3_1 = {
		{
			item_num = 17,
			item_id = 16
		}
	}
	local item3 = ResCache.AddGameObject(self.go, "Prefabs/Components/mid_autumn_activity_item")
	local params3 = {
		cloneItem = item3,
		parentClass = self,
		itemClass = CommonStaticListItemEg
	}
	local staticList3 = CommonStaticList.new(test3, params3)

	staticList3:setInfos(testArr3_1, {
		rePosition = true
	})

	local testArr3_2 = {
		{
			item_num = 18,
			item_id = 17
		},
		{
			item_num = 20,
			item_id = 19
		}
	}

	staticList3:setInfos(testArr3_2, {
		rePosition = true
	})
end

function CommonStaticListItemEg:getUIComponent()
	self.itemGroup = self.go:NodeByName("itemGroup").gameObject
end

function CommonStaticListItemEg:update(info)
	xyd.getItemIcon({
		scale = 0.7962962962962963,
		uiRoot = self.itemGroup,
		itemID = info.item_id,
		num = info.item_num
	})
end

function TestShowCode:showCommonTriggerGuide()
	xyd.addGlobalTimer(function()
		xyd.WindowManager.get():closeAllWindows({
			main_window = true
		})
		xyd.WindowManager:get():openWindow("common_trigger_guide_window", {
			guide_type = xyd.CommonTriggerGuideType.MAIN_WINDOW_TEST2
		})
	end, 3, 1)
end

function TestShowCode:aboutAdvanceIcon()
	function wrapcontentItem:updateInfo()
		self.data = {
			itemDatas = {
				{
					item_num = 1,
					item_id = 1
				},
				{
					item_num = 1,
					item_id = 1
				}
			}
		}

		local itemDatas = self.data.itemDatas

		for i = 1, #itemDatas do
			local itemData = itemDatas[i]

			if not self.itemIconList then
				self.itemIconList = {}
			end

			if not self.heroIconList then
				self.heroIconList = {}
			end

			local params = {}
			local type = xyd.tables.itemTable:getType(itemData.item_id)

			if type == xyd.ItemType.HERO or type == xyd.ItemType.HERO_DEBRIS or type == xyd.ItemType.HERO_RANDOM_DEBRIS then
				if not self.itemIconList[i] then
					params.uiRoot = self.iconRoot

					local icon = xyd.getItemIcon(params)

					table.insert(self.itemIconList, icon)
					self.itemIconList[i]:SetActive(true)
				else
					self.itemIconList[i]:SetActive(true)
					self.itemIconList[i]:setInfo(params)
				end

				self.nowIconList[i] = self.itemIconList[i]
			else
				if not self.heroIconList[i] then
					params.uiRoot = self.iconRoot

					local icon = xyd.getItemIcon(params)

					table.insert(self.heroIconList, icon)
					self.heroIconList[i]:SetActive(true)
				else
					self.heroIconList[i]:SetActive(true)
					self.heroIconList[i]:setInfo(params)
				end

				self.nowIconList[i] = self.heroIconList[i]
			end

			self.nowIconList[i]:setChoose(false)
			self.nowIconList[i]:setMask(false)
		end

		for i = 1, #itemDatas do
			local itemData = itemDatas[i]

			if not self.advanceIconList then
				self.advanceIconList = {}
			end

			local parmas = itemData

			if not self.advanceIconList[i] then
				params.uiRoot = self.iconRoot

				local icon = AdvanceIcon.new(params)

				table.insert(self.advanceIconList, icon)
				self.advanceIconList[i]:SetActive(true)
			else
				self.advanceIconList[i]:SetActive(true)
				self.advanceIconList[i]:setInfo(params)
			end

			self.advanceIconList[i]:setChoose(false)
			self.advanceIconList[i]:setMask(false)
		end
	end

	local icon = AdvanceIcon.new(params)

	icon:setChoose(true)
	icon:getCurIcon()
end

function TestShowCode:showAdvanceIcon()
	local testAdvanceIcon = AddChild(self.go.gameObject, "testAdvanceIcon")

	testAdvanceIcon.gameObject:Y(110)

	testAdvanceIcon:AddComponent(typeof(UIWidget)).depth = 20

	local params1 = {
		num = 2,
		itemID = 1,
		uiRoot = testAdvanceIcon
	}
	local params2 = {
		num = 2,
		itemID = 51014,
		uiRoot = testAdvanceIcon
	}
	local params3 = {
		num = 1,
		avatarFrameID = 8014,
		uiRoot = testAdvanceIcon
	}
	local icon = AdvanceIcon.new(params1)

	XYDCo.WaitForTime(5, function()
		icon:setInfo(params2)
	end, nil)
	XYDCo.WaitForTime(8, function()
		icon:setInfo(params3)
	end, nil)
	XYDCo.WaitForTime(11, function()
		icon:setInfo(params1)
	end, nil)
end

return TestShowCode
