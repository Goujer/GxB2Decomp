-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/CommonStaticList.lua

local CommonStaticList = class("CommonStaticList")
local AddChild = NGUITools.AddChild
local CommonStaticListItemEg = class("CommonStaticListItemEg", import("app.common.ui.CommonStaticListItem"))

function CommonStaticList:ctor(parentObj, params)
	self.parent = params.parentClass
	self.parentObj = parentObj
	self.items = {}
	self.infos = {}
	self.cloneItem = params.cloneItem or "allCon"
	self.itemClass = params.itemClass or CommonStaticListItemEg
	self.getUIFun = params.getUIFun
	self.updateFun = params.updateFun
	self.listType = parentObj:GetComponent(typeof(UILayout)) or parentObj:GetComponent(typeof(UITable)) or parentObj:GetComponent(typeof(UIGrid))
	self.allConHeight = params.height
	self.allConWidth = params.width

	if params.cloneItem then
		params.cloneItem.gameObject:SetActive(false)
	end
end

function CommonStaticList:getParent()
	return self.parent
end

function CommonStaticList:setInfos(infos, params)
	self.infos = infos

	if #infos > #self.items then
		for i = #self.items + 1, #infos do
			local go = AddChild(self.parentObj.gameObject, self.cloneItem)

			if self.cloneItem == "allCon" then
				local parentUIWidget = self.parentObj.gameObject:GetComponent(typeof(UIWidget))
				local allConUIWidget = go:AddComponent(typeof(UIWidget))

				if parentUIWidget then
					allConUIWidget.depth = parentUIWidget.depth
				end

				allConUIWidget.width = self.allConWidth
				allConUIWidget.height = self.allConHeight
			end

			local tmp = self.itemClass.new(go, self.parent)

			if self.getUIFun then
				tmp.getUIComponent = self.getUIFun

				tmp.getUIComponent(tmp)
			end

			if self.updateFun then
				tmp.update = self.updateFun
			end

			table.insert(self.items, tmp)
		end
	else
		for i = #infos + 1, #self.items do
			self.items[i]:getGameObject():SetActive(false)
		end
	end

	for i, info in pairs(infos) do
		if self.updateFun then
			self.items[i]:update(info)
		else
			self.items[i]:update(info)
		end
	end

	params = params or {}

	if params.rePosition then
		self:rePosition()
	end
end

function CommonStaticList:rePosition()
	self.listType:Reposition()
end

function CommonStaticList:getParent()
	return self.parent
end

function CommonStaticList:getItems()
	local returnItems = {}

	for i in pairs(self.items) do
		if self.items[i]:getGameObject().activeSelf then
			table.insert(returnItems, self.items[i])
		end
	end

	return returnItems
end

function CommonStaticList:getInfos()
	return self.infos
end

return CommonStaticList
