-- chunkname: @../../../Product/Bundles/Android/src/app/components/PartnerCG.lua

local PartnerCG = class("PartnerCG", import(".BaseComponent"))
local Partner = import("app.models.Partner")
local PartnerImg = import(".PartnerImg")

function PartnerCG:ctor(parentGO, offsetDepth)
	PartnerCG.super.ctor(self, parentGO, offsetDepth)
end

function PartnerCG:initUI()
	PartnerCG.super.initUI(self)

	local go = self.go

	self.groupImg = go:ComponentByName("groupMain_/topGroup/leftGroup/labelGroup/groupImg", typeof(UISprite))
	self.labelGroup = go:ComponentByName("groupMain_/topGroup/leftGroup/labelGroup", typeof(UIWidget))
	self.groupRightImg = go:ComponentByName("groupMain_/topGroup/rightGroup/labelRightGroup/groupRightImg", typeof(UISprite))
	self.labelName = go:ComponentByName("groupMain_/topGroup/leftGroup/labelGroup/labelName", typeof(UILabel))
	self.labelRightName = go:ComponentByName("groupMain_/topGroup/rightGroup/labelRightGroup/labelRightName", typeof(UILabel))
	self.labelRightGroup = go:ComponentByName("groupMain_/topGroup/rightGroup/labelRightGroup", typeof(UIWidget))
	self.starGroup = go:ComponentByName("groupMain_/topGroup/leftGroup/starGroup", typeof(UIWidget))
	self.starRightGroup = go:ComponentByName("groupMain_/topGroup/rightGroup/starRightGroup", typeof(UIWidget))
	self.cvGroup = go:ComponentByName("groupMain_/topGroup/leftGroup/cvGroup", typeof(UIWidget))
	self.cvLabel = go:ComponentByName("groupMain_/topGroup/leftGroup/cvGroup/cvInfoGroup/cvLabel", typeof(UILabel))
	self.cvNameLabel = go:ComponentByName("groupMain_/topGroup/leftGroup/cvGroup/cvInfoGroup/cvNameLabel", typeof(UILabel))
	self.cvInfoGroup = go:ComponentByName("groupMain_/topGroup/leftGroup/cvGroup/cvInfoGroup", typeof(UIWidget))
	self.cvBg = go:ComponentByName("groupMain_/topGroup/leftGroup/cvGroup/cvBg", typeof(UISprite))
	self.cvRightGroup = go:ComponentByName("groupMain_/topGroup/rightGroup/cvRightGroup", typeof(UIWidget))
	self.cvRightLabel = go:ComponentByName("groupMain_/topGroup/rightGroup/cvRightGroup/cvRightInfoGroup/cvRightLabel", typeof(UILabel))
	self.cvRightNameLabel = go:ComponentByName("groupMain_/topGroup/rightGroup/cvRightGroup/cvRightInfoGroup/cvRightNameLabel", typeof(UILabel))
	self.cvRightInfoGroup = go:ComponentByName("groupMain_/topGroup/rightGroup/cvRightGroup/cvRightInfoGroup", typeof(UIWidget))
	self.cvRightBg = go:ComponentByName("groupMain_/topGroup/rightGroup/cvRightGroup/cvRightBg", typeof(UISprite))
	self.leftGroup = go:ComponentByName("groupMain_/topGroup/leftGroup", typeof(UIWidget))
	self.rightGroup = go:ComponentByName("groupMain_/topGroup/rightGroup", typeof(UIWidget))
	self.topGroup = go:ComponentByName("groupMain_/topGroup", typeof(UIWidget))

	local cg = go:NodeByName("groupMain_/topGroup/CGImg").gameObject

	self.CGImg = PartnerImg.new(cg)
end

function PartnerCG:getPrefabPath()
	return "Prefabs/Components/partner_cg"
end

function PartnerCG:setInfo(tableID)
	self.tableID_ = tableID
	self.partner_ = Partner.new()

	self.partner_:populate({
		table_id = self.tableID_
	})
	self.CGImg:setImg({
		itemID = self.partner_:getTableID()
	})
	xyd.setUISprite(self.groupImg, nil, "img_group" .. tostring(self.partner_:getGroup()))
	xyd.setUISprite(self.groupRightImg, nil, "img_group" .. tostring(self.partner_:getGroup()))

	local star_num = self.partner_:getStar()
	local frontend_star = star_num
	local prefix = "yellow"

	if star_num > 5 then
		frontend_star = star_num - 5
		prefix = "red"
	end

	for i = 1, frontend_star do
		local star = NGUITools.AddChild(self.starGroup.gameObject, "star_" .. i)
		local sp = star:AddComponent(typeof(UISprite))

		xyd.setUISprite(sp, nil, "partner_star_" .. prefix)

		sp:GetComponent(typeof(UIWidget)).width = 50
		sp:GetComponent(typeof(UIWidget)).height = 50
		sp.depth = self.starGroup:GetComponent(typeof(UIWidget)).depth + 2

		local star2 = NGUITools.AddChild(self.starRightGroup.gameObject, "star_" .. i)
		local sp2 = star2:AddComponent(typeof(UISprite))

		xyd.setUISprite(sp2, nil, "partner_star_" .. prefix)

		sp2:GetComponent(typeof(UIWidget)).width = 50
		sp2:GetComponent(typeof(UIWidget)).height = 50
		sp2.depth = self.starRightGroup:GetComponent(typeof(UIWidget)).depth + 2
	end

	self.labelName.text = __(self.partner_:getName())
	self.labelRightName.text = __(self.partner_:getName())

	self:updateCV(false)
	self:updateCV(true)
end

function PartnerCG:updateCV(isLeft)
	local name = self.partner_:getCVName()
	local pre = isLeft and "cv" or "cvRight"

	if name then
		local w = self[pre .. "Label"].width + self[pre .. "NameLabel"].width + 5

		self[pre .. "Group"]:SetActive(true)

		self[pre .. "Label"].text = __("CV")
		self[pre .. "NameLabel"].text = name
		self[pre .. "InfoGroup"]:GetComponent(typeof(UIWidget)).width = w

		self[pre .. "Label"]:SetLocalPosition(-w / 2, 0, 0)
		self[pre .. "NameLabel"]:SetLocalPosition(w / 2, 0, 0)

		self[pre .. "Bg"].width = math.max(w + 30, 200)

		if isLeft then
			self.cvInfoGroup:SetLocalPosition((self.cvBg.width - 200) / 2, 0, 0)
		else
			self.cvRightInfoGroup:SetLocalPosition(-(self.cvRightBg.width - 200) / 2, 0, 0)
		end
	else
		self[pre .. "Group"]:SetActive(false)
	end
end

function PartnerCG:getStarGroup()
	return self.starGroup
end

function PartnerCG:getLabelGroup()
	return self.labelGroup
end

function PartnerCG:getLeftGroup()
	return self.leftGroup
end

function PartnerCG:getStarRightGroup()
	return self.starRightGroup
end

function PartnerCG:getLabelRightGroup()
	return self.labelRightGroup
end

function PartnerCG:getRightGroup()
	return self.rightGroup
end

function PartnerCG:getCGImg()
	return self.CGImg
end

function PartnerCG:getTopGroup()
	return self.topGroup
end

function PartnerCG:getCVGroup()
	return self.cvGroup
end

function PartnerCG:getCVRightGroup()
	return self.cvRightGroup
end

function PartnerCG:destroy()
	UnityEngine.Object.Destroy(self.go)
end

function PartnerCG:getWidth()
	return self.go:GetComponent(typeof(UIWidget)).width
end

function PartnerCG:getHeight()
	return self.go:GetComponent(typeof(UIWidget)).height
end

return PartnerCG
