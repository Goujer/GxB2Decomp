-- chunkname: @../../../Product/Bundles/Android/src/app/components/SoulEquipInfoContent1Con.lua

local SoulEquipInfoContent1Con = class("SoulEquipInfoContent1Con", import("app.components.CopyComponent"))
local BaseComponent = import("app.components.BaseComponent")
local AttrLabel = import("app.components.AttrLabel")

function SoulEquipInfoContent1Con:ctor(goItem, parent)
	self.parent = parent
	self.groupAllAttrLables = {}
	self.indexArr = {}
	self.indexHelpArr = {}

	local ids = xyd.tables.soulEquip2BaseBuffTable:getIDs()

	for i = 1, #ids do
		local id = ids[i]
		local buff = xyd.tables.soulEquip2BaseBuffTable:getBuff(id)

		if not self.indexHelpArr[buff] then
			self.indexHelpArr[buff] = 1

			table.insert(self.indexArr, buff)
		end
	end

	ids = xyd.tables.soulEquip2ExBuffTable:getIDs()

	for i = 1, #ids do
		local id = ids[i]
		local buff = xyd.tables.soulEquip2ExBuffTable:getBuff(id)

		if not self.indexHelpArr[buff] then
			self.indexHelpArr[buff] = 1

			table.insert(self.indexArr, buff)
		end
	end

	SoulEquipInfoContent1Con.super.ctor(self, goItem)
end

function SoulEquipInfoContent1Con:initUI()
	self:getUIComponent()
	SoulEquipInfoContent1Con.super.initUI(self)
	self:register()
	self:layout()
end

function SoulEquipInfoContent1Con:getUIComponent()
	self.content1 = self.go
	self.labelContent1Title = self.content1:ComponentByName("labelContent1Title", typeof(UILabel))
	self.groupAllAttrShow = self.content1:NodeByName("groupAllAttrShow").gameObject
	self.groupAllAttr = self.groupAllAttrShow:NodeByName("groupAllAttr").gameObject
	self.groupAllAttrTable = self.groupAllAttr:ComponentByName("", typeof(UITable))
	self.bg2 = self.content1:ComponentByName("bg2", typeof(UISprite))
	self.descScroller = self.content1:NodeByName("descScroller").gameObject
	self.descScrollView = self.content1:ComponentByName("descScroller", typeof(UIScrollView))
	self.labelSkillDesc = self.descScroller:ComponentByName("labelSkillDesc", typeof(UILabel))
end

function SoulEquipInfoContent1Con:register()
	return
end

function SoulEquipInfoContent1Con:layout()
	self.labelContent1Title.text = __("SOUL_EQUIP_TEXT05")

	self:updateAllAttr()
end

function SoulEquipInfoContent1Con:updateAllAttr()
	local equips = self.parent.partner:getSoulEquips()
	local attrs = self.parent.partner:culSoulEquipAttr() or {}
	local attrsHelpArr = {}

	for _, buff in pairs(attrs) do
		attrsHelpArr[buff[1]] = buff[2]
	end

	local i = 1

	for i = 1, #xyd.SoulEquipShowAttr do
		local key = xyd.SoulEquipShowAttr[i]
		local value = attrsHelpArr[key] or 0
		local params = {
			xyd.tables.dBuffTable:getDesc(key),
			xyd.getBuffValue(key, value)
		}

		if xyd.Global.lang == "fr_fr" and (key == "unCrit" or key == "unfree") then
			params[1] = __(string.upper(key))
		end

		local label = self.groupAllAttrLables[i]

		if label == nil then
			label = AttrLabel.new(self.groupAllAttr, "soulEquip1Show", params)
			self.groupAllAttrLables[i] = label
		else
			label:setValue(params)
		end

		if xyd.Global.lang == "de_de" then
			label.labelName.fontSize = 15
		end
	end

	self.groupAllAttrTable:Reposition()

	local curSkillID = self.parent.partner:getSoulEquipSkill()

	if curSkillID then
		self.labelSkillDesc.text = xyd.tables.skillTextTable:getDesc(curSkillID)
	else
		self.labelSkillDesc.text = ""
	end
end

return SoulEquipInfoContent1Con
