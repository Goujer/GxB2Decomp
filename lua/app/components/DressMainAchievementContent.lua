-- chunkname: @../../../Product/Bundles/Android/src/app/components/DressMainAchievementContent.lua

local DressMainAchievementContent = class("DressMainAchievementContent", import("app.components.CopyComponent"))
local DressMainAchievementItem = class("DressMainAchievementItem", import("app.components.CopyComponent"))
local FixedWrapContent = import("app.common.ui.FixedWrapContent")

function DressMainAchievementContent:ctor(goItem, data)
	DressMainAchievementContent.super.ctor(self, goItem)

	self.data = data
end

function DressMainAchievementContent:initUI()
	self:getUIComponent()
	DressMainAchievementContent.super.initUI(self)
	self:initItem(self.data)
	self:initBaseInfo(self.data)
end

function DressMainAchievementContent:getUIComponent()
	self.page3 = self.go.gameObject
	self.page3Bg = self.page3:ComponentByName("page3Bg", typeof(UISprite))
	self.scrollView = self.page3:NodeByName("scrollView").gameObject
	self.scrollView_UIScrollView = self.page3:ComponentByName("scrollView", typeof(UIScrollView))
	self.grid = self.scrollView:NodeByName("grid").gameObject
	self.grid_UIWrapContent = self.scrollView:ComponentByName("grid", typeof(UIWrapContent))
	self.dressMainAchievementItem = self.page3:NodeByName("dressMainAchievementItem").gameObject
	self.wrapContent = FixedWrapContent.new(self.scrollView_UIScrollView, self.grid_UIWrapContent, self.dressMainAchievementItem, DressMainAchievementItem, self)
end

function DressMainAchievementContent:initBaseInfo(itemdata)
	return
end

function DressMainAchievementContent:initItem(itemdata)
	local type_ids = xyd.tables.senpaiDressAchievementTypeTable:getIDs()
	local arr = {}

	for i in pairs(type_ids) do
		local params = {
			type_id = type_ids[i]
		}

		table.insert(arr, params)
	end

	self:waitForFrame(1, function()
		self.wrapContent:setInfos(arr, {})
		self:waitForFrame(1, function()
			self.scrollView_UIScrollView:ResetPosition()
		end)
	end)
end

function DressMainAchievementItem:ctor(go, parent)
	self.go = go
	self.parent = parent
	self.dressMainAchievementItem = self.go
	self.bg = self.dressMainAchievementItem:ComponentByName("bg", typeof(UISprite))
	self.missionDesc = self.dressMainAchievementItem:ComponentByName("missionDesc", typeof(UILabel))
	self.btnAward = self.dressMainAchievementItem:NodeByName("btnAward").gameObject
	self.button_label = self.btnAward:ComponentByName("button_label", typeof(UILabel))
	self.imgAward = self.dressMainAchievementItem:ComponentByName("imgAward", typeof(UISprite))
	self.progress = self.dressMainAchievementItem:ComponentByName("progress", typeof(UISprite))
	self.progressBar = self.dressMainAchievementItem:ComponentByName("progress", typeof(UIProgressBar))
	self.labelDesc = self.progress:ComponentByName("labelDesc", typeof(UILabel))
	self.progressValue = self.progress:ComponentByName("progressValue", typeof(UISprite))
	self.itemCon = self.dressMainAchievementItem:NodeByName("itemCon").gameObject
	self.itemCon_UILayout = self.dressMainAchievementItem:ComponentByName("itemCon", typeof(UILayout))
	self.itemsArr = {}
end

function DressMainAchievementItem:update(index, info)
	dump(info, "放入的數據==========")

	if not info then
		self.go:SetActive(false)

		return
	else
		self.go:SetActive(true)
	end

	local achievement_id = xyd.tables.senpaiDressAchievementTypeTable:getStartAchievement(info.type_id)

	if self.type_id and self.type_id == info.type_id and self.achievement_id and self.achievement_id == achievement_id then
		return
	end

	self.type_id = info.type_id
	self.achievement_id = achievement_id

	local compelete_num = xyd.tables.senpaiDressAchievementTable:getCompleteValue(self.achievement_id)

	self.missionDesc.text = xyd.tables.senpaiDressAchievementTextTable:getDesc(self.type_id, compelete_num)
	self.progressBar.value = 0 / compelete_num
	self.labelDesc.text = "0" .. "/" .. compelete_num

	local awards = xyd.tables.senpaiDressAchievementTable:getAwards(self.achievement_id)

	for i = 1, 2 do
		if awards[i] then
			if not self.itemsArr[i] then
				local params = {
					isAddUIDragScrollView = true,
					scale = 0.7037037037037037,
					itemID = awards[i][1],
					num = awards[i][2],
					uiRoot = self.itemCon.gameObject
				}

				table.insert(self.itemsArr, xyd.getItemIcon(params))
			else
				self.itemsArr[i]:SetActive(true)
				self.itemsArr[i]:setInfo({
					itemID = awards[i][1],
					num = awards[i][2]
				})
			end
		elseif self.itemsArr[i] then
			self.itemsArr[i]:SetActive(false)
		end
	end

	self.itemCon_UILayout:Reposition()
end

return DressMainAchievementContent
