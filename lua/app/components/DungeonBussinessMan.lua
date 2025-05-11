-- chunkname: @../../../Product/Bundles/Android/src/app/components/DungeonBussinessMan.lua

local DungeonBussinessMan = class("DungeonBussinessMan", import(".BaseComponent"))

function DungeonBussinessMan:ctor(parentGo)
	DungeonBussinessMan.super.ctor(self, parentGo)

	self.DEFAULT_SCALE_NUM = 1.05
end

function DungeonBussinessMan:getPrefabPath()
	return "Prefabs/Components/dungeon_bussiness_man"
end

function DungeonBussinessMan:initUI()
	DungeonBussinessMan.super.initUI(self)

	self.textGroup = self.go:NodeByName("textGroup").gameObject
	self.descLabel = self.textGroup:ComponentByName("e:Group/descLabel", typeof(UILabel))
	self.itemLabel = self.textGroup:ComponentByName("e:Group/itemGroup/itemLabel", typeof(UILabel))
	self.iconGroup = self.textGroup:NodeByName("e:Group/itemGroup/iconGroup").gameObject
	self.modelGroup = self.go:NodeByName("modelGroup").gameObject
	self.heroShadow = self.go:NodeByName("heroShadow").gameObject
	self.animation_ = self.go:GetComponent(typeof(UnityEngine.Animation))
	self.bgImg = self.textGroup:NodeByName("bgImg").gameObject
end

function DungeonBussinessMan:init(fx_name, type, cur_item, fx_callback)
	NGUITools.DestroyChildren(self.modelGroup.transform)

	self.fx_ = xyd.Spine.new(self.modelGroup)

	self.fx_:setInfo(fx_name, function()
		self.fx_:SetLocalScale(-1, 1, 1)

		if fx_callback then
			fx_callback(self.fx_)
		end
	end)

	self.descLabel.text = __("DUNGEON_BUSSINESS_MAN_TEXT" .. type)

	local cost = xyd.tables.dungeonShopTable:getCost(cur_item)
	local item = xyd.tables.dungeonShopTable:getItem(cur_item)

	NGUITools.DestroyChildren(self.iconGroup.transform)

	self.icon_ = xyd.getItemIcon({
		noClick = true,
		itemID = item[1],
		num = item[2],
		uiRoot = self.iconGroup
	})

	self.icon_:setScale(0.7)

	self.itemLabel.text = tostring(xyd.tables.itemTextTable:getName(item[1])) .. "*" .. tostring(item[2])

	self.textGroup:SetActive(false)
	self.bgImg:SetActive(false)
end

function DungeonBussinessMan:playAction()
	local shadow = self:getModelShader()

	self:playBubble()
	self.fx_:play("idle", 0, 1, nil, true)
end

function DungeonBussinessMan:playBubble()
	self.textGroup:SetActive(true)
	self.bgImg:SetActive(true)
	self.animation_:Play("dungeonManAni")
end

function DungeonBussinessMan:playDisappear(callback)
	XYDCo.WaitForTime(0.3, function()
		self.textGroup:SetActive(false)
	end, nil)
	self.animation_:Play("dungeonMan2Ani")

	local event = self.go:GetComponent(typeof(LuaAnimationEvent))

	function event.callback(eventName)
		if eventName == "hit" and callback then
			callback()
		end
	end
end

function DungeonBussinessMan:getModelShader(modelID, direct)
	if modelID == nil then
		modelID = 1100101
	end

	if direct == nil then
		direct = 1
	end

	local shade = xyd.tables.modelTable:getShadePos(modelID)

	self.heroShadow:SetLocalPosition(100 + shade[1] * direct, -196 + shade[2], 1)

	local scale = shade[3] * self.DEFAULT_SCALE_NUM * 0.7

	self.heroShadow:SetLocalScale(scale, scale, 1)
end

return DungeonBussinessMan
