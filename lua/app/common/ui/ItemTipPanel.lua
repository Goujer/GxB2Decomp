-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/ItemTipPanel.lua

local ItemTipPanel = class("ItemTipPanel", import(".BaseTipPanel"))
local ItemIcon = import(".ItemIcon")
local ItemTable = xyd.tables.item
local BuffTable = xyd.tables.buff
local HeroTable = xyd.tables.hero
local HeroSkillTable = xyd.tables.heroSkill
local MiscTable = xyd.tables.misc
local HeightLimit = 156
local BgDelta = 251
local MargineLimit = 70

function ItemTipPanel.get()
	if not ItemTipPanel.INSTANCE then
		ItemTipPanel.INSTANCE = ItemTipPanel.new()
	end

	return ItemTipPanel.INSTANCE
end

function ItemTipPanel:initUI()
	self.prefab_ = "Prefabs/Common/item_tip_panel"

	ItemTipPanel.super.initUI(self)

	local info = self.offset_:NodeByName("info")

	self.widgetInfo_ = info:GetComponent(typeof(UIWidget))
	self.labelName_ = info:ComponentByName("label_name", typeof(UILabel))
	self.labelDesc1_ = info:ComponentByName("label_desc_1", typeof(UILabel))
	self.labelDesc2_ = info:ComponentByName("label_desc_2", typeof(UILabel))
	self.labelDesc3_ = info:ComponentByName("label_desc_3", typeof(UILabel))
	self.labelHaveNum_ = info:ComponentByName("label_have_num", typeof(UILabel))
	self.labelNum_ = info:ComponentByName("label_num", typeof(UILabel))

	local goIcon = info:NodeByName("widget_icon").gameObject

	self.icon_ = ItemIcon.new(goIcon)
	self.goView_ = goIcon:NodeByName("sprite_view").gameObject
	self.colliderIcon_ = goIcon:GetComponent(typeof(UnityEngine.BoxCollider))
end

local ItemConf = {
	[xyd.ItemType.PLUNDER] = {
		hero = true,
		price = true,
		level = true,
		desc2 = __("HERO_BAG_TROPHY")
	},
	[xyd.ItemType.BLUEPRINT] = {
		price = true,
		desc2 = __("HERO_BAG_TROPHY")
	},
	[xyd.ItemType.SHARD] = {
		price = true,
		desc2 = __("HERO_BAG_TROPHY")
	},
	[xyd.ItemType.BADGE] = {
		price = true,
		badge = true,
		desc2 = __("HERO_BAG_BADGE")
	},
	[xyd.ItemType.MATERIAL] = {
		desc2 = __("MATERIAL")
	}
}

function ItemTipPanel:setContent(go, params)
	local itemID = params.itemID

	self.icon_:show(itemID, {
		color = params.color
	})

	self.labelName_.text = xyd.getBBCodeString(ItemTable:getName(itemID), "e8951e")

	local itemColor = params.color
	local itemNum = 0
	local itemType = ItemTable:getType(itemID)

	if itemType == xyd.ItemType.MATERIAL then
		itemNum = xyd.models.equipment:getMaterialNum(itemID, itemColor)
	elseif itemType == xyd.ItemType.JEWEL then
		itemNum = xyd.models.equipment:getGemNum(itemID, itemColor)
	else
		itemNum = xyd.models.backpack:getItemNum(itemID)
	end

	self.labelHaveNum_.text = __("HAVE_NUM_2", xyd.getDisplayNumber(itemNum or 0))

	self.goView_:SetActive(false)

	self.colliderIcon_.enabled = false

	local itemType = ItemTable:getType(itemID)
	local param1 = ItemTable:getParams(itemID, 1)
	local itemLevel = ItemTable:getLevel(itemID)

	self.labelDesc3_.overflowMethod = UILabel.Overflow.ResizeHeight

	local conf = ItemConf[itemType] or {}

	self.labelDesc2_.text = conf.desc2 or ""

	if conf.hero then
		self.labelDesc1_.text = __("HERO_TROPHY_LEVEL_NEED", itemLevel)

		local str = ""
		local buffIDs = ItemTable:getParams(itemID, 2)
		local values = ItemTable:getParams(itemID, 3)

		for i, buffID in ipairs(buffIDs) do
			local buffValue = values[i]
			local str2 = string.format("%s[fce579]+%s[-]", __(BuffTable:getContent(buffID)), xyd.getDisplayNumber(buffValue))

			if i == 1 then
				str = str2
			else
				str = str .. "\n" .. str2
			end
		end

		self.labelDesc3_.text = "[e5e5e5]" .. str
	elseif conf.badge then
		self.colliderIcon_.enabled = true

		self.goView_:SetActive(true)

		local crafts = ItemTable:getCrafts(itemID)
		local craft1 = crafts[1]
		local heroID = craft1[1]

		UIEventListener.Get(self.colliderIcon_.gameObject).onClick = function()
			xyd.WindowManager.get():openWindow("hero_detail_window", {
				preview = true,
				heroID = heroID
			}, function()
				xyd.WindowManager.get():closeWindow("hero_item_window")
			end)
		end
		self.labelDesc1_.text = ""

		local desc = ItemTable:getDesc(itemID)
		local desc2 = __("TRAP_KIND_" .. HeroTable:getSoldierType(heroID))
		local grade = xyd.HeroGradeLimit
		local landSkills = HeroTable:getLandSkills(heroID)
		local levels = MiscTable:getData("hero_skill_level_per_color", 1)
		local desc3s = {}

		for index = 2, 4 do
			local sid = landSkills[index]
			local buffID = HeroSkillTable:getHurtAddition(sid)
			local baseValue = HeroSkillTable:getHurtValue(sid)
			local incrValue = HeroSkillTable:getHurtIncreaseValue(sid)
			local buffName = BuffTable:getName(buffID)
			local level = levels[grade]
			local value = baseValue + incrValue * level
			local displayValue = xyd.getBuffDisplayValue(buffID, value)
			local desc = __(buffName) .. displayValue

			table.insert(desc3s, desc)
		end

		self.labelDesc3_.text = "[e5e5e5]" .. __("BADGE_DETAIL_DESC", desc, desc2, desc3s[1], desc3s[2], desc3s[3])
	else
		self.labelDesc1_.text = ""
		self.labelDesc3_.text = "[e5e5e5]" .. ItemTable:getDesc(itemID)
	end

	if conf.price then
		self.labelNum_.gameObject:SetActive(true)

		self.labelNum_.text = xyd.getDisplayNumber(ItemTable:getPrice(itemID))
	else
		self.labelNum_.gameObject:SetActive(false)
	end

	if self.labelDesc3_.height <= HeightLimit then
		self.labelDesc3_.overflowMethod = UILabel.Overflow.ShrinkContent
		self.labelDesc3_.height = HeightLimit
	end

	self.spriteBg_.height = self.labelDesc3_.height + BgDelta

	self.widgetInfo_:ResetAndUpdateAnchors()
end

function ItemTipPanel:getPositionSize(go, offsetX, offsetY)
	return self:getPositionSize2(go, offsetX, offsetY)
end

return ItemTipPanel
