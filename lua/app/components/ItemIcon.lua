-- chunkname: @../../../Product/Bundles/Android/src/app/components/ItemIcon.lua

local ItemIcon = class("ItemIcon", import(".BaseIcon"))
local ItemTable = xyd.tables.itemTable
local EquipTable = xyd.tables.equipTable

function ItemIcon:ctor(parentGO, offsetDepth)
	if tonumber(offsetDepth) then
		self.offsetDepth = offsetDepth
	end

	ItemIcon.super.ctor(self, parentGO)

	self.itemID_ = 0
	self.itemNum_ = 0
	self.hideText = false
	self.smallTips_ = ""
	self.callback = nil
	self.attach_callback = nil
	self.noClick = false
	self.job_ = -1
	self.itemWndType_ = xyd.ItemTipsWndType.NORMAL
	self.labelNumDefaultSize = 20
	self.activeStates = {}
	self.group_ = -1
end

local partValuePath = {
	groupOrangeStars_ = {
		name = "groupOrangeStars_",
		pos = {
			0,
			-36.7,
			0
		}
	},
	groupStars_ = {
		name = "groupStars_",
		pos = {
			-41,
			0,
			0
		}
	},
	imgGroupBg_ = {
		name = "imgGroupBg_",
		pos = {
			54,
			54,
			0
		}
	},
	imgJobBg_ = {
		name = "imgJobBg_",
		pos = {
			54,
			54,
			0
		}
	},
	groupSelect_ = {
		name = "groupSelect_",
		pos = {
			0,
			0,
			0
		}
	},
	redMark = {
		name = "redMark",
		pos = {
			59,
			59,
			0
		}
	},
	newIcon_ = {
		name = "newIcon_",
		pos = {
			25,
			52,
			0
		}
	},
	switchIcon_ = {
		name = "switchIcon_",
		pos = {
			48,
			48,
			0
		}
	},
	heroAvatar = {
		name = "heroAvatar",
		pos = {
			26,
			-26,
			0
		}
	},
	gEffect = {
		name = "gEffect",
		pos = {
			0,
			0,
			0
		}
	},
	gBackEffect = {
		name = "gBackEffect",
		pos = {
			0,
			0,
			0
		}
	},
	groupStars2_ = {
		name = "groupStars2_",
		pos = {
			0,
			-36.7,
			0
		}
	},
	imgMask_ = {
		name = "imgMask_",
		pos = {
			0,
			0,
			0
		}
	},
	imgLock_ = {
		name = "imgLock_",
		pos = {
			0,
			0,
			0
		}
	},
	imgChoose_ = {
		name = "imgChoose_",
		pos = {
			0,
			0,
			0
		}
	},
	itemTimeLabel_ = {
		name = "itemTimeLabel_",
		path = "imgIcon_/itemTimeLabel_",
		pos = {
			0,
			34.2,
			0
		}
	},
	belowLabel = {
		name = "belowLabel",
		pos = {
			0,
			-71,
			0
		}
	},
	imgActivityTag = {
		name = "imgActivityTag",
		pos = {
			45,
			42,
			0
		}
	},
	imgDebris_ = {
		name = "imgDebris_",
		pos = {
			47,
			47,
			0
		}
	},
	imgAdd_ = {
		name = "imgAdd_",
		pos = {
			0,
			28,
			0
		}
	},
	labelStyle1_ = {
		name = "labelStyle1_",
		pos = {
			61,
			46,
			0
		}
	},
	labelLevel_ = {
		name = "labelLevel_",
		pos = {
			-46,
			46,
			0
		}
	},
	imgPos_ = {
		name = "imgPos_",
		pos = {
			0,
			0,
			0
		}
	},
	imgFront_ = {
		name = "imgFront_",
		pos = {
			0,
			0,
			0
		}
	}
}

function ItemIcon:getPartExample(name)
	if not self[name] then
		local parentGo

		if name == "itemTimeLabel_" then
			parentGo = self.imgIcon_
		end

		self[name] = self:addPartObj(partValuePath[name], parentGo)

		if name == "groupOrangeStars_" then
			self.imgStar_ = self.groupOrangeStars_:ComponentByName("imgStar_", typeof(UISprite))
			self.labelStar_ = self.groupOrangeStars_:ComponentByName("labelStar_", typeof(UILabel))
		elseif name == "groupStars_" then
			for i = 1, 6 do
				self["stars" .. i] = self.groupStars_:ComponentByName("star" .. i, typeof(UISprite))

				table.insert(self.stars, self["stars" .. i])
			end
		elseif name == "imgGroupBg_" then
			self.imgGroupBg_ = self.imgGroupBg_:GetComponent(typeof(UISprite))
			self.imgCamp_ = self.imgGroupBg_:ComponentByName("imgCamp_", typeof(UISprite))
		elseif name == "imgJobBg_" then
			self.imgJobBg_ = self.imgJobBg_:GetComponent(typeof(UISprite))
			self.imgJob_ = self.imgJobBg_:ComponentByName("imgJob_", typeof(UISprite))
		elseif name == "groupSelect_" then
			for i = 1, 4 do
				self["selectImgs" .. i] = self.groupSelect_:ComponentByName("imgSelefct_" .. i, typeof(UISprite))

				table.insert(self.selectImgs, self["selectImgs" .. i])
			end
		elseif name == "imgMask_" then
			self.imgMask_ = self.imgMask_:GetComponent(typeof(UISprite))
		elseif name == "imgLock_" then
			self.imgLock_ = self.imgLock_:GetComponent(typeof(UISprite))
		elseif name == "itemTimeLabel_" then
			self.itemTimeLabel_ = self.itemTimeLabel_:GetComponent(typeof(UILabel))
		elseif name == "imgActivityTag" then
			self.imgActivityTag:SetLocalScale(0.85, 0.85, 0.85)
		elseif name == "imgPos_" then
			self.imgPos_ = self.imgPos_:GetComponent(typeof(UISprite))
		elseif name == "imgFront_" then
			self.imgFront_ = self.imgFront_:GetComponent(typeof(UISprite))
		end

		if self[name .. "state"] ~= nil and self[name .. "state"] ~= self[name].gameObject.activeSelf then
			self[name]:SetActive(self[name .. "state"])
		end
	end

	return self[name]
end

function ItemIcon:setPartExampleVisible(name, visible)
	if visible then
		self:setPartVisible(self:getPartExample(name), true)
	else
		self:setPartVisible(self[name], false, name)
	end
end

function ItemIcon:setPartVisible(obj, visible, name)
	if obj then
		if self[obj.name .. "state"] == nil then
			if visible ~= obj.gameObject.activeSelf then
				obj:SetActive(visible)
			end

			self[obj.name .. "state"] = visible
		elseif self[obj.name .. "state"] ~= visible then
			self[obj.name .. "state"] = visible

			obj:SetActive(visible)
		end
	elseif name then
		self[name .. "state"] = visible
	end
end

function ItemIcon:getPartVisible(name)
	if self[name .. "state"] ~= nil then
		return self[name .. "state"]
	else
		return false
	end
end

function ItemIcon:addPartObj(partInfo, objParent)
	return ItemIcon.super.addPartObj(self, "item_icon", partInfo, objParent)
end

function ItemIcon:initUI()
	ItemIcon.super.initUI(self)

	local go = self.go

	self.imgBorder_ = go:ComponentByName("imgBorder_", typeof(UISprite))
	self.imgQuality_ = go:ComponentByName("imgQuality_", typeof(UISprite))
	self.imgIcon_ = go:ComponentByName("imgIcon_", typeof(UISprite))
	self.labelNum_ = go:ComponentByName("labelNum_", typeof(UILabel))
	self.stars = {}
	self.selectImgs = {}
end

function ItemIcon:getPrefabPath()
	return "Prefabs/Components/item_icon"
end

function ItemIcon:updateActive(params)
	for k, v in pairs(params) do
		local curActive = self.activeStates[k]

		if curActive ~= v then
			self[k]:SetActive(v)

			self.activeStates[k] = v
		end
	end
end

function ItemIcon:getDefaultActiveStates()
	local params = {}

	params.imgBorder_ = true
	params.imgQuality_ = true
	params.imgIcon_ = true

	return params
end

function ItemIcon:setInfo(params)
	local changeParams = self:getDefaultActiveStates()

	if not params or not params.itemID then
		self:setNum(0)

		self.itemID_ = 0
		changeParams.imgQuality_ = false
		changeParams.labelNum_ = false
		changeParams.imgIcon_ = false

		self:updateActive(changeParams)

		self.noClick = true

		return
	end

	local itemID = params.itemID

	self.params = params

	self:initParterId()

	self.notSciNotation = params.notSciNotation or false

	if params.num and ItemTable:getType(itemID) ~= xyd.ItemType.AVATAR then
		changeParams.labelNum_ = true

		self:setNum(params.num, itemID)
	else
		changeParams.labelNum_ = false
	end

	self.itemID_ = itemID
	self.itemNum_ = params.num or 0
	self.hideText = params.hideText or false
	self.callback = params.callback
	self.noClick = params.noClick

	if self.itemID_ == 399 or self.itemID_ == 400 or self.itemID_ == 401 then
		self.noClick = true
	end

	self.itemWndType_ = params.wndType
	self.smallTips_ = params.smallTips
	self.showHasNum = params.show_has_num
	self.attach_callback = params.attach_callback
	self.dragCallback = params.dragCallback
	self.effectPos_ = params.effectPos
	self.panel_ = params.panel
	self.target_ = params.target
	self.showGetWays = false
	self.longPressCallBackFun = params.longPressCallBackFun
	self.soulEquipInfo = params.soulEquipInfo or {}

	if params.showGetWays ~= nil then
		self.showGetWays = params.showGetWays
	end

	if params.scale then
		if type(params.scale) == "number" then
			self:setScale(params.scale)
		else
			self.go:SetLocalScale(params.scale.x, params.scale.y, params.scale.z)
		end
	end

	if params.labelNumScale then
		self:setLabelNumScale(params.labelNumScale)
	end

	if params.effect then
		self.effectName_ = params.effect

		self:setEffectState(true)
	elseif ItemTable:lightEffect(itemID) == 1 or params.showLightEffect and params.showLightEffect == true then
		self:showEffect(true)
	else
		self:showEffect(false)
	end

	local showInBagType_ = ItemTable:showInBagType(itemID)

	self:setPartExampleVisible("imgPos_", false)
	self:setPartExampleVisible("labelLevel_", false)

	local item_type = ItemTable:getType(itemID)

	if showInBagType_ == xyd.BackpackShowType.EQUIP or showInBagType_ == xyd.BackpackShowType.ARTIFACT or ItemTable:getType(itemID) == xyd.ItemType.CRYSTAL then
		self:initEquip()
	elseif item_type == xyd.ItemType.DRESS or item_type == xyd.ItemType.DRESS_FRAGMENT or item_type == xyd.ItemType.DRESS_FRAGMENT_COMMON then
		self:initDress(item_type)
	elseif item_type == xyd.ItemType.SOUL_EQUIP1 or item_type == xyd.ItemType.SOUL_EQUIP2_POS1 or item_type == xyd.ItemType.SOUL_EQUIP2_POS2 or item_type == xyd.ItemType.SOUL_EQUIP2_POS3 or item_type == xyd.ItemType.SOUL_EQUIP2_POS4 then
		self:initSoulEquip(item_type)
	else
		self:setPartExampleVisible("groupStars_", false)

		changeParams.imgQuality_ = false

		local isChangeBorder = ItemTable:getIsChangeBorder(itemID)

		if isChangeBorder and isChangeBorder == 1 then
			changeParams.imgQuality_ = true

			self:setQuality(ItemTable:getQuality(itemID))
		end

		local tmpIconSource = params.source or ItemTable:getIcon(itemID)

		if xyd.Global.lang == "ja_jp" and itemID == xyd.ItemID.CRYSTAL and not params.hideText then
			tmpIconSource = tmpIconSource .. "_ja_jp"
		end

		self:iconSource(tmpIconSource)

		changeParams.imgBorder_ = true

		self:setJob(0)

		if params.group then
			self:setGroup(params.group)
		elseif xyd.tables.itemTable:getType(self.itemID_) == xyd.ItemType.OPTIONAL_TREASURE_CHEST and xyd.tables.itemTable:getGroup(self.itemID_) and xyd.tables.itemTable:getGroup(self.itemID_) ~= "" then
			self:setGroup(xyd.tables.itemTable:getGroup(self.itemID_))
		else
			self:setPartExampleVisible("imgGroupBg_", false)
		end
	end

	if ItemTable:getType(itemID) == xyd.ItemType.AVATAR_FRAME then
		self.imgIcon_.width = xyd.DEFAULT_ITEM_SIZE
		self.imgIcon_.height = xyd.DEFAULT_ITEM_SIZE
		changeParams.imgBorder_ = false
		changeParams.labelNum_ = false
	elseif ItemTable:getType(itemID) == xyd.ItemType.EMOTIONICON then
		self.imgIcon_.width = 130
		self.imgIcon_.height = 94
	elseif item_type == xyd.ItemType.SOUL_EQUIP2_POS1 or item_type == xyd.ItemType.SOUL_EQUIP2_POS2 or item_type == xyd.ItemType.SOUL_EQUIP2_POS3 or item_type == xyd.ItemType.SOUL_EQUIP2_POS4 or item_type == xyd.ItemType.SOUL_EQUIP_GROUP_ICON then
		self.imgIcon_.width = 68
		self.imgIcon_.height = 68
	else
		self.imgIcon_.width = 90
		self.imgIcon_.height = 90
	end

	if params.dragScrollView then
		local drag = self.go:GetComponent(typeof(UIDragScrollView))

		drag = drag or self.go:AddComponent(typeof(UIDragScrollView))
		drag.scrollView = params.dragScrollView
	end

	self:setPartExampleVisible("groupSelect_", false)

	if not self.noClick then
		self:setTouchListener(handler(self, self.onClickIcon))
	end

	if self.dragCallback then
		self:setTouchDragListener(self.dragCallback.startCallback, self.dragCallback.dragCallback, self.dragCallback.endCallback)
	end

	if self.longPressCallBackFun then
		UIEventListener.Get(self.go).onLongPress = function()
			self.longPressCallBackFun()
		end
	end

	self:setPartExampleVisible("itemTimeLabel_", false)

	if xyd.tables.itemTable:getType(itemID) == xyd.ItemType.CONSUMABLE_HANGUP then
		self:setPartExampleVisible("itemTimeLabel_", true)

		self:getPartExample("itemTimeLabel_").text = tostring(xyd.getRoughDisplayHTime(xyd.tables.dynamicGiftItemTable:getTimes(itemID)))
	end

	if params.itemIconSpecil and params.itemIconSpecil == xyd.ItemIconSpecil.BATTLE_PASS then
		changeParams.imgBorder_ = true

		xyd.setUISpriteAsync(self.imgBorder_, nil, "battle_pass_item_frame")

		changeParams.imgQuality_ = false
	end

	self:setPartExampleVisible("groupStars2_", false)

	if item_type == xyd.ItemType.SOUL_EQUIP2_POS1 or item_type == xyd.ItemType.SOUL_EQUIP2_POS2 or item_type == xyd.ItemType.SOUL_EQUIP2_POS3 or item_type == xyd.ItemType.SOUL_EQUIP2_POS4 then
		self:setPartExampleVisible("groupOrangeStars_", true)
	else
		self:setPartExampleVisible("groupOrangeStars_", false)
	end

	if item_type == xyd.ItemType.SOUL_EQUIP_GROUP_ICON then
		self:setPartExampleVisible("imgFront_", true)
		xyd.setUISprite(self:getPartExample("imgFront_"), nil, "soul_equip_bg_zonglan_4")
	else
		self:setPartExampleVisible("imgFront_", false)
	end

	if ItemTable:getType(itemID) == xyd.ItemType.OPTIONAL_TREASURE_CHEST then
		local starNum = xyd.tables.giftBoxOptionalTable:getStars(itemID)

		if starNum > 0 then
			self:setPartExampleVisible("groupStars2_", true)
			self:initGroupStar(starNum)
		end
	end

	if params.noFrame then
		changeParams.imgBorder_ = false
	end

	if params.activityTag and params.activityTag > 0 then
		self:setActivityTag(true)
	end

	self:initNewIcon()
	self:updateActive(changeParams)

	if self:getPartVisible("groupStars2_") then
		self:getPartExample("groupStars2_"):GetComponent(typeof(UILayout)):Reposition()
	end

	if params.isAddUIDragScrollView ~= nil and params.isAddUIDragScrollView == true then
		self:AddUIDragScrollView()
	end

	self:initSwitchIcon()
	self:initWhiteMask()

	if xyd.isIosTest() then
		self:iosTestChangeUI1()
	end
end

function ItemIcon:initParterId()
	local changeParams = {}

	if (self.params.partner_id or self.params.avatar_src) and self.params.partner_id and self.params.partner_id > 0 then
		local src = self.params.avatar_src

		if self.params.partner_id and self.params.partner_id > 0 then
			local partner = xyd.models.slot:getPartner(self.params.partner_id)

			src = xyd.tables.partnerTable:getAvatar(partner:getTableID())
		end

		changeParams.labelNum_ = false

		local itemID = self.params.itemID

		NGUITools.DestroyChildren(self:getPartExample("heroAvatar").transform)

		local imgAvatar = NGUITools.AddChild(self:getPartExample("heroAvatar").gameObject, self.imgQuality_.gameObject)
		local imgBg = NGUITools.AddChild(self:getPartExample("heroAvatar").gameObject, self.imgQuality_.gameObject)
		local imgAvatar_uiSprite = imgAvatar:GetComponent(typeof(UISprite))
		local imgBg_uiSprite = imgBg:GetComponent(typeof(UISprite))

		xyd.setUISpriteAsync(imgAvatar_uiSprite, nil, tostring(src))
		xyd.setUISpriteAsync(imgBg_uiSprite, nil, "hero_quality_" .. tostring(xyd.tables.itemTable:getQuality(itemID)))

		imgAvatar_uiSprite.width = 36
		imgAvatar_uiSprite.height = 36
		imgAvatar_uiSprite.depth = self:getPartExample("heroAvatar"):GetComponent(typeof(UIWidget)).depth + 6
		imgBg_uiSprite.width = 42
		imgBg_uiSprite.height = 42
		imgBg_uiSprite.depth = self:getPartExample("heroAvatar"):GetComponent(typeof(UIWidget)).depth + 5

		self:setPartExampleVisible("heroAvatar", true)
	else
		self:setPartExampleVisible("heroAvatar", false)
	end

	self:updateActive(changeParams)
end

function ItemIcon:initEquip()
	local itemID = self.params.itemID
	local star = EquipTable:getStar(itemID)

	self:setPartExampleVisible("groupStars_", true)

	for i = 1, 6 do
		self:setPartExampleVisible("stars" .. i, i > 6 - star)
	end

	self:iconSource(ItemTable:getIcon(itemID))
	self:setQuality(ItemTable:getQuality(itemID))

	local job = EquipTable:getJob(itemID)

	self:setJob(job)

	local qlt = ItemTable:getQuality(self.itemID_)

	if job > 0 and self:getPartExample("imgJobBg_") then
		if tonumber(qlt) == 7 then
			xyd.setUISprite(self:getPartExample("imgJobBg_"), nil, "job_bg7")
		elseif tonumber(qlt) == 6 then
			xyd.setUISprite(self:getPartExample("imgJobBg_"), nil, "job_bg6")
		else
			xyd.setUISprite(self:getPartExample("imgJobBg_"), nil, "job_bg5")
		end
	end

	if self.params.group then
		self:setGroup(self.params.group)
	else
		local groupEquip = xyd.tables.equipTable:getGroup(self.itemID_)

		if groupEquip then
			self:setGroup(groupEquip)
		else
			self:setPartExampleVisible("imgGroupBg_", false)
		end
	end
end

function ItemIcon:initDress(item_type)
	local itemID = self.params.itemID

	if item_type == xyd.ItemType.DRESS and item_type == xyd.ItemType.DRESS then
		local star = xyd.tables.senpaiDressItemTable:getStar(itemID)

		self:setPartExampleVisible("groupStars_", true)

		for i = 1, 6 do
			self:setPartExampleVisible("stars" .. i, i > 6 - star)
		end
	end

	if item_type == xyd.ItemType.DRESS_FRAGMENT or item_type == xyd.ItemType.DRESS_FRAGMENT_COMMON then
		self:setPartExampleVisible("imgDebris_", true)
	end

	self:setQuality(ItemTable:getQuality(itemID))
	self:iconSource(ItemTable:getIcon(itemID))
	self:setPartExampleVisible("imgJobBg_", false)
	self:setPartExampleVisible("imgGroupBg_", false)
end

function ItemIcon:initSoulEquip(item_type)
	local itemID = self.params.itemID

	self:iconSource(ItemTable:getIcon(itemID))
	self:setPartExampleVisible("groupStars_", false)
	self:setPartExampleVisible("groupOrangeStars_", false)
	self:setPartExampleVisible("imgJobBg_", false)
	self:setPartExampleVisible("imgGroupBg_", false)

	if self.soulEquipInfo.lev then
		self:setLabelLevel(true, {
			text = "+" .. self.soulEquipInfo.lev
		})
	end

	if item_type == xyd.ItemType.SOUL_EQUIP1 then
		local star = self.soulEquipInfo.star or 1

		self:setPartExampleVisible("groupStars_", true)

		for i = 1, 6 do
			self:setPartExampleVisible("stars" .. i, i > 6 - star)
		end

		self:setQuality(ItemTable:getQuality(itemID), "lead_skin_border_")
	else
		self:setPartExampleVisible("groupOrangeStars_", true)
		self:setPartExampleVisible("imgPos_", true)

		local star = self.soulEquipInfo.star or xyd.tables.soulEquip2Table:getStar(itemID)

		if star > 0 then
			self.labelStar_.text = ""

			xyd.setUISpriteAsync(self.imgStar_, nil, "pub_star_require" .. star, function()
				self.imgStar_:MakePixelPerfect()
			end)
		end

		local qlt = self.soulEquipInfo.qlt or ItemTable:getQuality(itemID)

		self:setQuality(qlt, "lead_skin_border_")
		xyd.setUISprite(self:getPartExample("imgPos_"), nil, "soul_equip_icon_pos_" .. qlt)

		if item_type == xyd.ItemType.SOUL_EQUIP2_POS4 then
			self:getPartExample("imgPos_").gameObject.transform.localRotation = Vector3(0, 180, 0)
		elseif item_type == xyd.ItemType.SOUL_EQUIP2_POS3 then
			self:getPartExample("imgPos_").gameObject.transform.localRotation = Vector3(0, 0, 0)
		elseif item_type == xyd.ItemType.SOUL_EQUIP2_POS1 then
			self:getPartExample("imgPos_").gameObject.transform.localRotation = Vector3(180, 0, 0)
		elseif item_type == xyd.ItemType.SOUL_EQUIP2_POS2 then
			self:getPartExample("imgPos_").gameObject.transform.localRotation = Vector3(1, 1, 180)
		end
	end
end

function ItemIcon:initNewIcon()
	if self.params.isNew then
		self:setPartExampleVisible("newIcon_", true)
	else
		self:setPartExampleVisible("newIcon_", false)
	end
end

function ItemIcon:setAddText(text, scale)
	self:setPartExampleVisible("imgAdd_", true)

	local label = self.imgAdd_.gameObject:ComponentByName("label", typeof(UILabel))

	self.imgAdd_.transform:SetLocalScale(scale, scale, scale)

	label.text = text
end

function ItemIcon:setLabelStyle1(flag, params)
	self:setPartExampleVisible("labelStyle1_", flag)

	if flag then
		local label = self.labelStyle1_:GetComponent(typeof(UILabel))

		if params.text then
			label.text = params.text
		end

		if params.color then
			label.color = params.color
		end
	end
end

function ItemIcon:setLabelLevel(flag, params)
	self:setPartExampleVisible("labelLevel_", flag)

	if flag then
		local label = self.labelLevel_:GetComponent(typeof(UILabel))

		if params.text then
			label.text = params.text
		end

		if params.color then
			label.color = params.color
		end
	end
end

function ItemIcon:initSwitchIcon()
	if self.params.switch then
		if self.params.switch_func then
			self:setSwitchIcon(self.params.switch_func)
		else
			xyd.setTouchEnable(self:getPartExample("switchIcon_"), false)
		end

		self:setPartExampleVisible("switchIcon_", self.params.switch)
	end
end

function ItemIcon:initWhiteMask()
	if self.params.whiteMask ~= nil then
		local whiteMaskAlpha = self.params.whiteMaskAlpha

		whiteMaskAlpha = whiteMaskAlpha or 0

		self:setWhiteMask(self.params.whiteMask, whiteMaskAlpha)
	end
end

function ItemIcon:initGroupStar(starNum)
	NGUITools.DestroyChildren(self:getPartExample("groupStars2_").transform)

	local changeParams = {}

	if starNum < 10 then
		self:setPartExampleVisible("groupOrangeStars_", false)

		local starIcon = "star"

		if starNum > 5 then
			starNum = starNum - 5
			starIcon = "star_red"
		end

		for i = 1, starNum do
			local star = NGUITools.AddChild(self:getPartExample("groupStars2_"), "star_" .. i)
			local sprite = star:AddComponent(typeof(UISprite))

			xyd.setUISpriteAsync(sprite, nil, starIcon, function()
				sprite:MakePixelPerfect()
			end)

			sprite.depth = self:getPartExample("groupStars2_"):GetComponent(typeof(UIWidget)).depth + 2

			table.insert(self.stars, star)
		end
	else
		self:setPartExampleVisible("groupOrangeStars_", true)

		local starNum = starNum - 10

		if starNum > 0 then
			self.labelStar_.text = starNum

			xyd.setUISpriteAsync(self.imgStar_, nil, "potentiality_avatar_star", function()
				self.imgStar_:MakePixelPerfect()
			end)
		else
			self.labelStar_.text = ""

			xyd.setUISpriteAsync(self.imgStar_, nil, "star_orange_2", function()
				self.imgStar_:MakePixelPerfect()
			end)
		end
	end

	self:waitForFrame(1, function()
		self:getPartExample("groupStars2_"):GetComponent(typeof(UILayout)):Reposition()
	end)
	self:updateActive(changeParams)
end

function ItemIcon:showEffect(status)
	if status then
		self:setPartExampleVisible("gEffect", true)

		if not self.saoguangEffect then
			self.saoguangEffect = xyd.Spine.new(self:getPartExample("gEffect"))

			self.saoguangEffect:setInfo("fx_ui_txsaoguang", function()
				self.saoguangEffect:SetLocalScale(0.85, 0.85, 0.85)
				self.saoguangEffect:play("texiao01", 0, 1)
			end)
		else
			self.saoguangEffect:play("texiao01", 0, 1)
		end
	else
		self:setPartExampleVisible("gEffect", false)
	end
end

function ItemIcon:setNoClick(flag)
	self.noClick = flag

	xyd.setTouchEnable(self.go, not flag)
end

function ItemIcon:setLabelNumColor(color)
	self.labelNum_.color = color
end

function ItemIcon:onClickIcon()
	local changeParams = {}

	if self.params and self.params.noClickSelected then
		self:setPartExampleVisible("groupSelect_", false)
	end

	if self.callback then
		self.callback()
	else
		local params = {
			itemID = self.itemID_,
			itemNum = self.itemNum_,
			wndType = self.itemWndType_,
			callback = function()
				self:setSelected(false)
			end,
			smallTips = self.smallTips_,
			hideText = self.hideText,
			show_has_num = self.showHasNum,
			showGetWays = self.showGetWays,
			levelUp = self.params.levelUp,
			notShowGetWayBtn = self.params.notShowGetWayBtn,
			activityTag = self.params.activityTag,
			upArrowCallback = self.params.upArrowCallback,
			soulEquipInfo = self.soulEquipInfo
		}

		xyd.WindowManager.get():openWindow("item_tips_window", params)
	end

	if self.attach_callback then
		self.attach_callback()
	end
end

function ItemIcon:iconSource(source, isMustUpdate)
	if not source then
		return
	end

	local changeParams = {}

	changeParams.imgIcon_ = true

	if not isMustUpdate and self.imgIconSrouce and self.imgIconSrouce == source then
		return
	end

	local item_type = xyd.tables.itemTable:getType(self.itemID_)

	if item_type == xyd.ItemType.DRESS then
		local dress_id = xyd.tables.senpaiDressItemTable:getDressId(self.itemID_)
		local local_choice = xyd.models.dress:getLocalChoice(dress_id)
		local image = xyd.tables.senpaiDressItemTable:getIcon(self.itemID_)[1]

		if local_choice then
			local all_styles = xyd.tables.senpaiDressTable:getStyles(dress_id)

			for i in pairs(all_styles) do
				if all_styles[i] == local_choice then
					image = xyd.tables.senpaiDressItemTable:getIcon(self.itemID_)[i]

					break
				end
			end
		end

		self.imgIconSrouce = image

		xyd.setUISpriteAsync(self.imgIcon_, nil, image, function()
			if image ~= self.imgIconSrouce then
				self:iconSource(self.imgIconSrouce, true)
			end
		end, true)
	else
		self.imgIconSrouce = source

		xyd.setUISpriteAsync(self.imgIcon_, nil, source, function()
			if source ~= self.imgIconSrouce then
				self:iconSource(self.imgIconSrouce, true)
			end
		end, true)
	end

	self:updateActive(changeParams)
end

function ItemIcon:setQuality(quality, imgName)
	local changeParams = {}

	changeParams.imgQuality_ = true

	local source

	if tonumber(quality) then
		if imgName then
			source = imgName .. quality
		else
			source = "quality_" .. quality
		end
	else
		source = quality
	end

	if self.imgQualitySource and source == self.imgQualitySource then
		return
	end

	self.imgQualitySource = source

	xyd.setUISprite(self.imgQuality_, xyd.Atlas.COMMON_UI, source)
	self:updateActive(changeParams)
end

function ItemIcon:setNum(num, itemID)
	local changeParams = {}
	local showNum = self.params and self.params.showNum

	if num and (num ~= 0 or showNum) then
		changeParams.labelNum_ = true
		self.itemNum_ = num

		if tonumber(itemID) == xyd.ItemID.CRYSTAL or self.notSciNotation then
			self.labelNum_.text = num
		else
			self.labelNum_.text = xyd.getRoughDisplayNumber(tonumber(num))
		end
	else
		changeParams.labelNum_ = false
		self.labelNum_.text = ""
	end

	self:updateActive(changeParams)
end

function ItemIcon:getNum()
	return self.itemNum_
end

function ItemIcon:getItemID()
	return self.itemID_
end

function ItemIcon:getIconType()
	return "item_icon"
end

function ItemIcon:setSelected(select)
	self:setPartExampleVisible("groupSelect_", select)
end

function ItemIcon:setScale(scale)
	self.go:SetLocalScale(scale, scale, scale)
end

function ItemIcon:setGrey()
	return
end

function ItemIcon:setMask(visible)
	self:setPartExampleVisible("imgMask_", visible)
end

function ItemIcon:setLabelNumScale(scale)
	if type(scale) == "number" then
		self.labelNumDefaultSize = self.labelNumDefaultSize or 20
		self.labelNum_.fontSize = self.labelNumDefaultSize * scale
	elseif type(scale) == "table" then
		self.labelNum_:SetLocalScale(scale.x, scale.y, scale.z)
	end
end

function ItemIcon:iconSize(margin)
	return
end

function ItemIcon:showRedMark(flag)
	self:setPartExampleVisible("redMark", flag)
end

function ItemIcon:setChoose(flag)
	self:setPartExampleVisible("imgMask_", flag)
	self:setPartExampleVisible("imgChoose_", flag)
end

function ItemIcon:setBackground(flag)
	self:setPartExampleVisible("imgBorder_", flag)
end

function ItemIcon:setImgMaskSource(sprite_name)
	if self.imgMask_ then
		xyd.setUISpriteAsync(self.imgMask_, nil, sprite_name)
	end
end

function ItemIcon:setEffectState(isShow)
	if self.effect ~= nil then
		self.effect:destroy()

		self.effect = nil
	end

	if isShow then
		self.effect = xyd.Spine.new(self:getPartExample("gEffect"))

		self.effect:setInfo(self.effectName_, function()
			if self.panel_ then
				self.effect:setRenderPanel(self.panel_)
			end

			if self.effectPos_ then
				self.effect:SetLocalPosition(self.effectPos_.x, self.effectPos_.y, self.effectPos_.z)
			end

			if self.target_ then
				self.effect:setRenderTarget(self.target_, 5)
			else
				self.effect:setRenderTarget(self:getPartExample("gEffect"):GetComponent(typeof(UITexture)), 5)
			end

			if self.effectName_ == "hunqiui" then
				self.effect:play("animation", 0)
			else
				self.effect:play("texiao01", 0)
			end
		end)
	end
end

function ItemIcon:getChoose()
	return self:getPartVisible("imgChoose_")
end

function ItemIcon:setBelowLabel(flag, text, color)
	self:setPartExampleVisible("belowLabel", flag)

	if self:getPartExample("belowLabel") then
		if text then
			self:getPartExample("belowLabel"):GetComponent(typeof(UILabel)).text = text
		end

		if color then
			self:getPartExample("belowLabel"):GetComponent(typeof(UILabel)).color = color
		end
	end
end

function ItemIcon:setLabelNumRed()
	self.labelNum_.color = Color.New2(4288124927)
	self.labelNum_.effectColor = Color.New2(1027558655)
	self.labelNum_.effectStyle = UILabel.Effect.Outline
end

function ItemIcon:setLabelNumRed()
	self.labelNum_.color = Color.New2(4288124927)
	self.labelNum_.effectColor = Color.New2(1027558655)
	self.labelNum_.effectStyle = UILabel.Effect.Outline
end

function ItemIcon:setLock(flag, width, height)
	if not self.lockSource_ and flag == true then
		xyd.setUISprite(self:getPartExample("imgLock_"), xyd.Atlas.COMMON_UI, "lock_icon")

		self:getPartExample("imgLock_").width = width or 49
		self:getPartExample("imgLock_").height = 43
		self.imgLockSource = "lock_icon"
	elseif self.lockSource_ and flag == true then
		xyd.setUISprite(self:getPartExample("imgLock_"), nil, self.lockSource_)

		self:getPartExample("imgLock_").width = width or 64
		self:getPartExample("imgLock_").height = height or 69
	end

	self:setPartExampleVisible("imgLock_", flag)
	self:setPartExampleVisible("imgMask_", flag)
end

function ItemIcon:setLockLowerRight(flag)
	if flag then
		if not self.lockSource_ then
			xyd.setUISprite(self:getPartExample("imgLock_"), nil, "lock_icon_2")

			self.imgLockSource = "lock_icon_2"
		else
			xyd.setUISprite(self:getPartExample("imgLock_"), nil, self.lockSource_)
		end

		self:getPartExample("imgLock_").width = 23
		self:getPartExample("imgLock_").height = 28

		self:getPartExample("imgLock_"):SetLocalPosition(36, -32, 0)
	end

	self:setPartExampleVisible("imgLock_", flag)
end

function ItemIcon:setLockScale(scale)
	self:getPartExample("imgLock_").transform.localScale = Vector3(scale, scale, scale)
end

function ItemIcon:getLock()
	return self:getPartVisible(self.imgLock_)
end

function ItemIcon:setLockSource(source, source2)
	self.lockSource_ = source

	if source2 then
		local changeParams = {}

		changeParams.imgQuality_ = true

		xyd.setUISpriteAsync(self.imgQuality_, nil, source2)
		self:updateActive(changeParams)
	end
end

function ItemIcon:setMaskSource(source)
	xyd.setUISpriteAsync(self:getPartExample("imgMask_"), nil, source)
end

function ItemIcon:setJob(num)
	if self.job_ == num then
		self:setPartExampleVisible("imgJobBg_", num > 0)

		return
	end

	self.job_ = num

	if num > 0 and self:getPartExample("imgJobBg_") then
		xyd.setUISprite(self.imgJob_, xyd.Atlas.COMMON_UI2, "pub_job_icon" .. num)
	end

	self:setPartExampleVisible("imgJobBg_", num > 0)
end

function ItemIcon:getJob()
	return self.job_
end

function ItemIcon:setGroup(num)
	if self.group_ == num then
		self:setPartExampleVisible("imgGroupBg_", num > 0)

		return
	end

	self.group_ = num

	if num > 0 then
		if self:getPartExample("imgGroupBg_") then
			local qlt = ItemTable:getQuality(self.itemID_)

			if tonumber(qlt) == 7 then
				xyd.setUISprite(self:getPartExample("imgGroupBg_"), nil, "job_bg7")
			elseif tonumber(qlt) == 6 then
				xyd.setUISprite(self:getPartExample("imgGroupBg_"), nil, "job_bg6")
			else
				xyd.setUISprite(self:getPartExample("imgGroupBg_"), nil, "job_bg5")
			end
		end

		if xyd.tables.itemTable:getType(self.itemID_) == xyd.ItemType.OPTIONAL_TREASURE_CHEST then
			xyd.setUISprite(self:getPartExample("imgGroupBg_"), nil, "job_bg27")
		end

		if self.imgCamp_ and num > 0 then
			xyd.setUISprite(self.imgCamp_, xyd.Atlas.COMMON_UI2, "img_group" .. num)
		end
	end

	self:setPartExampleVisible("imgGroupBg_", num > 0)
end

function ItemIcon:getGroup()
	return self.group_
end

function ItemIcon:getIconRoot()
	return self.go
end

function ItemIcon:getIconSprite()
	return self.imgIcon_
end

function ItemIcon:getBorder()
	return self.imgBorder_
end

function ItemIcon:labelNumScale(scale)
	self.labelNumDefaultSize = self.labelNumDefaultSize or self.labelNum_.fontSize
	self.labelNum_.fontSize = math.floor(self.labelNumDefaultSize * scale)
end

function ItemIcon:AddUIDragScrollView()
	if not self.go:GetComponent(typeof(UIDragScrollView)) then
		self.go:AddComponent(typeof(UIDragScrollView))
	end
end

function ItemIcon:setItemIconSize(w, h)
	self.go:GetComponent(typeof(UIWidget)).width = w
	self.go:GetComponent(typeof(UIWidget)).height = h
end

function ItemIcon:setAlpha(alpha)
	self.go:GetComponent(typeof(UIWidget)).alpha = alpha
end

function ItemIcon:setItemIconDepth(depth)
	local selfDepth = self.go:GetComponent(typeof(UIWidget)).depth
	local depthDis = depth - selfDepth

	self:setDepth(depthDis)
end

function ItemIcon:setRedMark(flag)
	self:showRedMark(flag)
end

function ItemIcon:setEffect(flag, effectName, params)
	local playname = "texiao01"
	local playCount = 0

	if effectName and not self.effect then
		self.effectName_ = effectName
		self.effect = xyd.Spine.new(self:getPartExample("gEffect"))

		self.effect:setInfo(self.effectName_, function()
			if effectName == "fx_ui_bp_available" and not params then
				params = {}
				params.effectPos = Vector3(3, 6, 0)
				params.effectScale = Vector3(1.1, 1.1, 1.1)
			end

			if params then
				if params.panel_ then
					self.effect:setRenderPanel(params.panel_)
				end

				if params.effectPos then
					self.effect:SetLocalPosition(params.effectPos.x, params.effectPos.y, params.effectPos.z)
				end

				if params.effectScale then
					self.effect:SetLocalScale(params.effectScale.x, params.effectScale.y, params.effectScale.z)
				end

				if params.target_ then
					self.effect:setRenderTarget(params.target_, 5)
				else
					self.effect:setRenderTarget(self:getPartExample("gEffect"):GetComponent(typeof(UITexture)), 5)
				end

				if params.playname then
					playname = params.playname
				end

				if params.playCount then
					playCount = params.playCount
				end
			end

			self.effect:play(playname, playCount, 1, params.callback)
		end)
	end

	self:setPartExampleVisible("gEffect", flag)

	if self.effect then
		return self.effect
	end
end

function ItemIcon:setBackEffect(flag, effectName, playName, params)
	local playCount = 0

	if effectName and not self.backEffect then
		self.backEffect = xyd.Spine.new(self:getPartExample("gBackEffect"))

		self.backEffect:setInfo(effectName, function()
			if params then
				if params.panel_ then
					self.backEffect:setRenderPanel(params.panel_)
				end

				if params.effectPos then
					self.backEffect:SetLocalPosition(params.effectPos.x, params.effectPos.y, params.effectPos.z)
				end

				if params.target_ then
					self.backEffect:setRenderTarget(params.target_, 5)
				else
					self.backEffect:setRenderTarget(self:getPartExample("gBackEffect"):GetComponent(typeof(UITexture)), 5)
				end

				if params.scale then
					self.backEffect:SetLocalScale(params.scale.x, params.scale.y, params.scale.z)
				end

				if params.playCount then
					playCount = params.playCount
				end
			end

			self.backEffect:play(playName, playCount)
		end)
	end

	self:setPartExampleVisible("gBackEffect", flag)

	if self.setBackEffect then
		return self.setBackEffect
	end
end

function ItemIcon:iosTestChangeUI1()
	xyd.setUISprite(self.imgBorder_, nil, "item_bg_ios_test")

	if self.imgQualitySource then
		xyd.setUISprite(self.imgQuality_, nil, self.imgQualitySource .. "_ios_test")
	end

	xyd.setUISprite(self:getPartExample("imgJobBg_"), nil, "job_bg_ios_test")
	xyd.setUISprite(self:getPartExample("imgMask_"), nil, "mask_ios_test")
end

function ItemIcon:setSwitchIcon(callback, source)
	self:setPartExampleVisible("switchIcon_", true)
	xyd.setTouchEnable(self:getPartExample("switchIcon_"), true)

	UIEventListener.Get(self:getPartExample("switchIcon_")).onClick = function()
		callback()
	end

	if source then
		local sprite = self:getPartExample("switchIcon_"):GetComponent(typeof(UISprite))

		xyd.setUISpriteAsync(sprite, nil, source)
	end
end

function ItemIcon:setWhiteMask(visible, alpha)
	self:getPartExample("imgMask_").alpha = alpha

	self:setPartExampleVisible("imgMask_", visible)
	xyd.setUISpriteAsync(self:getPartExample("imgMask_"), nil, "9gongge45", nil, nil)
end

function ItemIcon:setBlueMask(visible)
	self:setPartExampleVisible("imgMask_", visible)
	xyd.setUISpriteAsync(self:getPartExample("imgMask_"), nil, "9gongge46", nil, nil)

	self:getPartExample("imgMask_").depth = 70
end

function ItemIcon:setLockImgVisible(visible)
	self:setPartExampleVisible("imgLock_", visible)
end

function ItemIcon:setImgBorder_(sprite, depth)
	if self.imgBorder_ then
		xyd.setUISpriteAsync(self.imgBorder_, nil, sprite)

		if depth then
			self.imgBorder_.depth = depth
		end

		self.imgBorder_:SetActive(true)
	end
end

function ItemIcon:setActivityTag(flag)
	self:setPartExampleVisible("imgActivityTag", flag)
end

function ItemIcon:getImgIconSrouce()
	return self.imgIconSrouce
end

function ItemIcon:showBorderBg(flag)
	if self.imgBorder_ then
		self.imgBorder_:SetActive(flag)
	end
end

function ItemIcon:showQualityBg(flag)
	if self.imgQuality_ then
		self.imgQuality_:SetActive(flag)
	end
end

function ItemIcon:setCallBack(fun)
	self.callback = fun
end

function ItemIcon:setGEffectShow(flag)
	self:setPartExampleVisible("gEffect", flag)
end

return ItemIcon
