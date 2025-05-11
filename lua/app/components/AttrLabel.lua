-- chunkname: @../../../Product/Bundles/Android/src/app/components/AttrLabel.lua

local AttrLabel = class("AttrLabel", import(".BaseComponent"))

function AttrLabel:ctor(parentGo, state, params, attrs)
	self.state = state

	AttrLabel.super.ctor(self, parentGo)
	self:setValue(params, attrs)
end

function AttrLabel:getPrefabPath()
	return "Prefabs/Components/attr_label_" .. self.state
end

function AttrLabel:initUI()
	AttrLabel.super.initUI(self)

	self.imgBg = self.go:ComponentByName("imgBg", typeof(UISprite))
	self.labelName = self.go:ComponentByName("labelName", typeof(UILabel))
	self.imgDot = self.go:ComponentByName("imgDot", typeof(UISprite))
	self.labelValue = self.go:ComponentByName("labelValue", typeof(UILabel))
	self.depthObjs_ = {
		self.imgBg,
		self.labelName,
		self.imgDot,
		self.labelValue
	}

	if self.state == "change" or self.state == "soulEquipChange" then
		self.img = self.go:ComponentByName("e:Image", typeof(UISprite))
		self.labelBefore = self.go:ComponentByName("labelBefore", typeof(UILabel))

		table.insert(self.depthObjs_, self.img)
		table.insert(self.depthObjs_, self.labelBefore)
	end
end

function AttrLabel:setValue(params, attrs)
	local valLimitList = {
		allHarmDec = 70,
		decDmg = 70,
		critTime = 150
	}

	self.labelName.text = __(params[1])

	local attrName = string.lower(params[1])
	local valText = params[2]

	if attrs and attrName == "crittime" and attrs[xyd.BUFF_CRIT_TIME_LIMIT] ~= 0 then
		local bt = xyd.tables.dBuffTable

		valLimitList.critTime = valLimitList.critTime + attrs[xyd.BUFF_CRIT_TIME_LIMIT] * 100 / bt:getFactor(xyd.BUFF_CRIT_TIME_LIMIT)
	end

	for key, limitVal in pairs(valLimitList) do
		if attrName == string.lower(key) then
			local val = tonumber(string.sub(valText, 1, -2))

			if limitVal < val then
				valText = tostring(limitVal) .. "%"
			end

			break
		end
	end

	self.labelValue.text = valText

	if params[3] and (self.state == "change" or self.state == "soulEquipChange") then
		self.labelBefore.text = params[3]
	end

	if xyd.Global.lang == "fr_fr" and (self.state == "soulEquipChange" or self.state == "soulEquip1LevelUp" or self.state == "asoulEquip1Lock" or self.state == "soulEquip1Show" or self.state == "soulEquip2Lock" or self.state == "soulEquipChange" or self.state == "soulEquip2Show") then
		self.labelName.fontSize = 19
	end
end

return AttrLabel
