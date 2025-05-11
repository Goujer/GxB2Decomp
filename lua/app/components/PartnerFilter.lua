-- chunkname: @../../../Product/Bundles/Android/src/app/components/PartnerFilter.lua

local PartnerFilter = class("PartnerFilter", import(".BaseComponent"))
local PartnerPartlyFilter = class("PartnerPartlyFilter", PartnerFilter)

function PartnerFilter:ctor(parentGo, params)
	self.groupNum = xyd.GROUP_NUM
	self.callback = nil
	self.isCanUnSelected_ = 1
	self.skinName = "PartnerFilterSkin"
	self.chosenGroup = params.chosenGroup or 0
	self.skinWidth = params.width or self.width
	self.scale = params.scale or 1
	self.callback = params.callback
	self.gap = params.gap or 0
	self.horizontalAlign = params.horizontalAlign

	if params.isCanUnSelected == 0 then
		self.isCanUnSelected_ = params.isCanUnSelected
	end

	PartnerFilter.super.ctor(self, parentGo)
end

function PartnerFilter:getPrefabPath()
	return "Prefabs/Components/partner_filter"
end

function PartnerFilter:getPartnerPartlyFilter()
	return PartnerPartlyFilter
end

function PartnerFilter:initUI()
	PartnerFilter.super.initUI(self)

	self.groupLayout = self.go:NodeByName("groupLayout").gameObject
	self.groupLayoutGrid = self.groupLayout:GetComponent(typeof(UIGrid))

	for i = 1, self.groupNum do
		local filterGroup = self.groupLayout:NodeByName("filterGroup" .. i).gameObject

		self["filterGroup" .. i] = filterGroup
		self["group" .. i .. "_chosen"] = filterGroup:NodeByName("group" .. i .. "_chosen").gameObject
	end

	if UNITY_EDITOR then
		local testObj = NGUITools.AddChild(self.go, "test")
		local testObjUISprite = testObj:AddComponent(typeof(UISprite))

		xyd.setUISpriteAsync(testObjUISprite, nil, "alert_icon", nil, nil, nil)

		testObjUISprite.depth = self.groupLayout:GetComponent(typeof(UIWidget)).depth + 3
		testObjUISprite.height = 20

		testObjUISprite.gameObject:X(300)
	end

	self:setLayout()
	self:registerEvent()
end

function PartnerFilter:setLayout()
	self.groupLayoutGrid.cellWidth = 62 * self.scale + self.gap

	self.groupLayoutGrid:Reposition()

	if self.scale ~= 1 then
		for i = 1, self.groupNum do
			self["filterGroup" .. tostring(i)].transform:SetLocalScale(self.scale, self.scale, 0)
		end
	end

	self.groupLayoutGrid:Reposition()
end

function PartnerFilter:registerEvent()
	for i = 1, self.groupNum do
		local btn = self["filterGroup" .. tostring(i)]

		if btn then
			self["group" .. i .. "_chosen"]:SetActive(false)

			UIEventListener.Get(btn).onClick = function()
				if self.chosenGroup == i then
					if self.isCanUnSelected_ == 1 then
						self.chosenGroup = 0
					else
						return
					end
				else
					self.chosenGroup = i
				end

				self:updateIconState()

				if self.callback then
					self.callback(self.chosenGroup)
				end
			end
		end
	end

	self:updateIconState()
end

function PartnerFilter:updateIconState()
	for i = 1, self.groupNum do
		self["group" .. i .. "_chosen"]:SetActive(i == self.chosenGroup)
	end
end

function PartnerFilter:updateChooseGroup(group)
	self.chosenGroup = group

	self:updateIconState()
end

function PartnerFilter:hideEvilAngel()
	self.groupNum = 4

	self.filterGroup5:SetActive(false)
	self.filterGroup6:SetActive(false)
	self.filterGroup7:SetActive(false)

	self.groupLayoutGrid.cellWidth = 62 * self.scale + self.gap

	self.groupLayoutGrid:Reposition()
end

function PartnerFilter:changePositionX(x)
	self.go.transform:X(x)
end

function PartnerFilter:reset()
	for i = 1, self.groupNum do
		local btn = self["filterGroup" .. i]

		if btn then
			self["group" .. i .. "_chosen"]:SetActive(false)
		end
	end
end

function PartnerPartlyFilter:registerEvent()
	for i = 1, self.groupNum do
		local btn = self["filterGroup" .. tostring(i)]

		if btn then
			self["group" .. i .. "_chosen"]:SetActive(false)

			UIEventListener.Get(btn).onClick = function()
				local origin_select = self.chosenGroup

				if self.chosenGroup == i then
					if self.isCanUnSelected_ == 1 then
						self.chosenGroup = 0
					else
						return
					end
				else
					self.chosenGroup = i
				end

				if self.callback then
					local flag = self.callback(self.chosenGroup)

					if not flag then
						self.chosenGroup = origin_select
					else
						self:updateIconState()
					end
				else
					self:updateIconState()
				end
			end
		end
	end
end

function PartnerFilter:setGap(width, height)
	if width then
		self.groupLayoutGrid.cellWidth = width
	end

	if height then
		self.groupLayoutGrid.cellHeight = height
	end

	self.groupLayoutGrid:Reposition()
end

function PartnerFilter:hideGroup(index)
	self["filterGroup" .. index].gameObject:SetActive(false)
	self.groupLayoutGrid:Reposition()
end

return PartnerFilter
