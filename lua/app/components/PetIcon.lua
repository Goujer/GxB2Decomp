-- chunkname: @../../../Product/Bundles/Android/src/app/components/PetIcon.lua

local PetIcon = class("PetIcon", import(".BaseIcon"))
local PetTable = xyd.tables.petTable

function PetIcon:ctor(parentGo)
	PetIcon.super.ctor(self, parentGo)
end

function PetIcon:getPrefabPath()
	return "Prefabs/Components/pet_icon"
end

function PetIcon:initUI()
	PetIcon.super.initUI(self)

	local go = self.go

	self.gEffect = go:ComponentByName("bgEffectCon", typeof(UITexture))
	self.imgBorder_ = go:ComponentByName("imgBorder_", typeof(UISprite))
	self.imgBorder2_ = go:ComponentByName("imgBorder2_", typeof(UISprite))
	self.imgIcon_ = go:ComponentByName("imgIcon_", typeof(UISprite))
	self.labelLev_ = go:ComponentByName("labelLev_", typeof(UILabel))
	self.imgMask_ = go:ComponentByName("imgMask_", typeof(UISprite))
	self.imgChoose_ = go:ComponentByName("imgChoose_", typeof(UISprite))
end

function PetIcon:setInfo(petInfo)
	self.petInfo = petInfo

	if petInfo.lev then
		self.labelLev_.text = petInfo.lev
	else
		self.labelLev_:SetActive(false)
	end

	self.iconSource = PetTable:getAvatar(petInfo.pet_id) .. tostring(petInfo.grade)

	xyd.setUISpriteAsync(self.imgIcon_, nil, self.iconSource, nil, true)

	if petInfo.scale then
		local scale = petInfo.scale

		self.go:SetLocalScale(scale, scale, scale)
	end

	self.noClick = self.petInfo.noClick
	self.callback = self.petInfo.callback

	if not self.noClick then
		self:setTouchListener(handler(self, self.onClickIcon))
	end

	if petInfo.scrollView then
		xyd.setDragScrollView(self.go, petInfo.scrollView)
	end
end

function PetIcon:updatePetInfo(petInfo)
	for key, _ in pairs(petInfo) do
		self.petInfo[key] = petInfo[key]
	end
end

function PetIcon:onClickIcon()
	if self.noClick then
		return
	end

	if self.callback then
		xyd.SoundManager.get():playSound(xyd.SoundID.BUTTON)
		self.callback()
	end
end

function PetIcon:setMask(flag)
	if flag then
		self.imgMask_:SetActive(true)
	else
		self.imgMask_:SetActive(false)
	end
end

function PetIcon:setChosen(flag)
	if flag then
		self.imgChoose_:SetActive(true)
	else
		self.imgChoose_:SetActive(false)
	end
end

function PetIcon:getPetInfo()
	return self.petInfo
end

return PetIcon
