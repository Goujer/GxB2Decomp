-- chunkname: @../../../Product/Bundles/Android/src/app/components/PetSkillIcon.lua

local PetSkillIcon = class("PetSkillIcon", import(".BaseIcon"))
local PetSkillIconTips = class("PetSkillIconTips", import(".BaseComponent"))

function PetSkillIcon:ctor(parentGo)
	PetSkillIcon.super.ctor(self, parentGo)

	self.params = {}
	self.needSelect_ = false
	self.isSelect_ = false
end

function PetSkillIcon:getPrefabPath()
	return "Prefabs/Components/pet_skill_icon"
end

function PetSkillIcon:initUI()
	PetSkillIcon.super.initUI(self)

	local go = self.go
	local group = go:NodeByName("group").gameObject

	self.group = group
	self.lock = group:ComponentByName("lock", typeof(UISprite))
	self.imgSkillIcon = group:ComponentByName("imgSkillIcon", typeof(UISprite))
	self.imgSkillIcon_uiWidgt = group:ComponentByName("imgSkillIcon", typeof(UIWidget))
	self.imgSelect = group:ComponentByName("imgSelect", typeof(UISprite))
	self.labelLev = group:ComponentByName("labelLev", typeof(UILabel))
	self.e_image = group:ComponentByName("e:Image", typeof(UISprite))
	self.e_image_uiWidgt = group:ComponentByName("e:Image", typeof(UIWidget))

	xyd.setUISpriteAsync(self.e_image, nil, "pet_skill_icon_1")
	xyd.setUISpriteAsync(self.imgSelect, nil, "pet_skill_icon_2")
	xyd.setUISpriteAsync(self.lock, nil, "pet_skill_icon_3")
end

function PetSkillIcon:getSkillID()
	return self.id
end

function PetSkillIcon:isSelect()
	return self.isSelect_
end

function PetSkillIcon:setScale(scale)
	self.group:SetLocalScale(scale, scale, scale)
end

function PetSkillIcon:resetBorderDepth()
	self.e_image_uiWidgt.depth = self.imgSkillIcon_uiWidgt.depth + 1
	self.imgSkillIcon_uiWidgt.depth = self.e_image_uiWidgt.depth + 1
end

function PetSkillIcon:setIconSource(source)
	xyd.setUISpriteAsync(self.imgSkillIcon, nil, source)
end

function PetSkillIcon:setScale(scale)
	if not scale then
		return
	end

	self:SetLocalScale(scale, scale, scale)
end

function PetSkillIcon:setSelect(flag)
	self.imgSelect:SetActive(flag)

	self.isSelect_ = flag
end

function PetSkillIcon:setLev(lev)
	if lev > 0 then
		local text = "LV." .. tostring(lev)

		if xyd.Global.lang == "fr_fr" then
			text = "Niv." .. tostring(lev)
		end

		if lev == xyd.MAX_PET_PAS_SKILL_LEV then
			text = "LV.MAX"

			if xyd.Global.lang == "fr_fr" then
				text = "Niv.MAX"
			end
		end

		self.labelLev.text = text
	else
		self.labelLev.text = ""
	end
end

function PetSkillIcon:setInfo(id, params)
	params = params or {}
	self.params = params

	local src_from_pet_skill = xyd.tables.petSkillTable:getSkillIcon(id)

	if src_from_pet_skill and src_from_pet_skill ~= "" then
		self:setIconSource(src_from_pet_skill)
	else
		self:setIconSource(xyd.tables.skillTable:getSkillIcon(id))
	end

	if params and params.unlocked == false then
		xyd.applyGrey(self.imgSkillIcon)

		self.unlockGrade = params.unlockGrade

		self.lock:SetActive(true)
	else
		xyd.applyOrigin(self.imgSkillIcon)
		self.lock:SetActive(false)
	end

	if params.showLev then
		self:setLev(params.lev or 0)
	else
		self:setLev(0)
	end

	if params and params.scale and params.scale ~= 0 then
		self:setScale(params.scale)
	end

	self.id = id
	self.unlocked = (params.unlocked ~= nil and function()
		return params.unlocked
	end or function()
		return true
	end)()
end

function PetSkillIcon:showTips(show, container, update)
	if not container then
		return
	end

	if not show then
		self.tips = nil

		NGUITools.DestroyChildren(container.transform)
		container:SetActive(false)

		return
	end

	container:SetActive(true)

	if self.tips == nil then
		self.tips = PetSkillIconTips.new(container)

		self.tips:setInfo(self.id, self.unlocked, self.unlockGrade)
	else
		self.tips:setInfo(self.id, self.unlocked, self.unlockGrade)
	end
end

function PetSkillIconTips:ctor(parentGo)
	PetSkillIconTips.super.ctor(self, parentGo)

	self.icon = PetSkillIcon.new(self.iconContainer)

	self.icon:setScale(0.7037037037037037)
	self.icon:resetBorderDepth()
end

function PetSkillIconTips:getPrefabPath()
	return "Prefabs/Components/pet_skill_icon_tips"
end

function PetSkillIconTips:initUI()
	PetSkillIconTips.super.initUI(self)

	local go = self.go
	local top = go:NodeByName("top").gameObject

	self.skillName = top:ComponentByName("skillName", typeof(UILabel))
	self.iconContainer = top:NodeByName("icon").gameObject
	self.descGroup = top:NodeByName("descGroup").gameObject
	self.desc = self.descGroup:ComponentByName("desc", typeof(UILabel))
	self.unlockDesc = self.descGroup:ComponentByName("unlockDesc", typeof(UILabel))
end

function PetSkillIconTips:setInfo(id, unlocked, unlockGrade)
	local st = xyd.tables.petSkillTable

	self.icon:setInfo(id)

	local skillID = xyd.tables.petSkillTable:getPetSkillID(id)
	local effect = xyd.tables.petSkillTable:getEffect(id)

	self.skillName.text = __(st:getName(skillID))

	local agrs = {}

	for i = 1, #effect do
		local buff = effect[i][1]
		local bt = xyd.tables.dBuffTable
		local value = effect[i][2]

		if bt:isShowPercent(buff) then
			local factor = tonumber(bt:getFactor(buff))

			value = string.format("%.1f", value * 100 / tonumber(bt:getFactor(buff)))
			value = value .. "%"
		end

		table.insert(agrs, value)
	end

	self.desc.text = xyd.stringFormat(st:getDesc(skillID), unpack(agrs))

	self.unlockDesc:SetActive(false)
end

return PetSkillIcon
