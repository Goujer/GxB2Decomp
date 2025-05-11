-- chunkname: @../../../Product/Bundles/Android/src/app/components/ThreeAttrComponent.lua

local ThreeAttrComponent = class("ThreeAttrComponent", import(".BaseComponent"))

function ThreeAttrComponent:ctor(go, parent)
	ThreeAttrComponent.super.ctor(self, go, parent)

	self.parent = parent
end

function ThreeAttrComponent:getPrefabPath()
	return "Prefabs/Components/three_attr_component"
end

function ThreeAttrComponent:initUI()
	self:getComponentUI()
	ThreeAttrComponent.super.initUI(self)
end

function ThreeAttrComponent:getComponentUI()
	self.trans = self.go
	self.attrCon = self.go:NodeByName("attrCon").gameObject
	self.attrConBg = self.attrCon:ComponentByName("attrConBg", typeof(UITexture))
	self.attrLabelCon1 = self.attrCon:NodeByName("attrLabelCon1").gameObject
	self.attrLabelName1 = self.attrLabelCon1:ComponentByName("attrLabelName1", typeof(UILabel))
	self.attrLabelNum1 = self.attrLabelCon1:ComponentByName("attrLabelNum1", typeof(UILabel))
	self.attrLabelCon2 = self.attrCon:NodeByName("attrLabelCon2").gameObject
	self.attrLabelName2 = self.attrLabelCon2:ComponentByName("attrLabelName2", typeof(UILabel))
	self.attrLabelNum2 = self.attrLabelCon2:ComponentByName("attrLabelNum2", typeof(UILabel))
	self.attrLabelCon3 = self.attrCon:NodeByName("attrLabelCon3").gameObject
	self.attrLabelName3 = self.attrLabelCon3:ComponentByName("attrLabelName3", typeof(UILabel))
	self.attrLabelNum3 = self.attrLabelCon3:ComponentByName("attrLabelNum3", typeof(UILabel))
	self.radar_shade_texture = self.attrCon:ComponentByName("radar_shade_texture", typeof(UITexture))
	self.pentagonForce = self.radar_shade_texture:ComponentByName("pentagonForce", typeof(Radar))
	self.default_img = self.attrCon:ComponentByName("default_img", typeof(UITexture))

	self.default_img:SetActive(false)
end

function ThreeAttrComponent:setInfo(info)
	self.isSame = true

	if self.isSame and (not self.max_value or self.max_value ~= info.max_value) then
		self.isSame = false
	end

	if self.isSame and not self.max_value then
		self.isSame = false
	end

	if self.isSame and self.value_arr then
		for i in pairs(self.value_arr) do
			if self.value_arr[i] ~= info.value_arr[i] then
				self.isSame = false

				break
			end
		end
	end

	if self.isSame and not self.text_arr then
		self.isSame = false
	end

	if self.isSame and self.text_arr then
		for i in pairs(self.text_arr) do
			if self.text_arr[i] ~= info.text_arr[i] then
				self.isSame = false

				break
			end
		end
	end

	if self.isSame and not self.isCanRender then
		print("return 掉了")

		return
	end

	self.isCanRender = true

	if info.isSureRenderCompelete then
		self.isSureRenderCompelete = info.isSureRenderCompelete
	end

	self.max_value = info.max_value
	self.value_arr = info.value_arr
	self.text_arr = info.text_arr
	self.label_name_size = info.label_name_size

	local all_value = 0

	for i = 1, 3 do
		self["attrLabelName" .. i].text = self.text_arr[i]
		self["attrLabelNum" .. i].text = self.value_arr[i]
		all_value = all_value + self.value_arr[i]

		if self.label_name_size then
			self["attrLabelName" .. i].fontSize = self.label_name_size
		end
	end

	local flag = false

	if UNITY_EDITOR or UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.4.88") >= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "71.3.51") >= 0 then
		flag = true
	end

	if flag and all_value ~= 0 then
		self:initPentagonForce()

		if self.default_img.gameObject.activeSelf then
			self.default_img.gameObject:SetActive(false)
		end
	else
		self.default_img.gameObject:SetActive(true)
	end
end

function ThreeAttrComponent:initPentagonForce()
	local scores = {}
	local totals = {}
	local total = self.max_value

	for i = 1, 3 do
		table.insert(scores, self.value_arr[i])
		table.insert(totals, total)
	end

	local temp = scores[3]

	scores[3] = scores[2]
	scores[2] = temp

	self.radar_shade_texture.gameObject:SetLocalScale(0.01, 0.01, 0.01)
	self:waitForTime(1, function()
		self.pentagonForce:SetInfo(totals, scores, 90, Color.New2(1454897825), self.radar_shade_texture)

		local sequeneNormal = self:getSequence()

		sequeneNormal:Append(self.radar_shade_texture.gameObject.transform:DOScale(Vector3(1, 1, 1), 0.3))
		sequeneNormal:AppendCallback(function()
			sequeneNormal:Kill(true)

			if self.isSureRenderCompelete and self.isSureRenderCompelete() then
				self.isCanRender = false
			end
		end)
	end)
end

return ThreeAttrComponent
