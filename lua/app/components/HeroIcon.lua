-- chunkname: @../../../Product/Bundles/Android/src/app/components/HeroIcon.lua

local HeroIcon = class("HeroIcon", import(".BaseIcon"), true)
local Destroy = UnityEngine.Object.Destroy
local PartnerTable = xyd.tables.partnerTable
local EquipTable = xyd.tables.equipTable
local ItemTable = xyd.tables.itemTable
local PetTable = xyd.tables.petTable

function HeroIcon:ctor(parentGO, renderPanel)
	HeroIcon.super.ctor(self, parentGO)

	self.callback = nil
	self.attach_callback = nil
	self.noClick = false
	self.smallTips_ = ""
	self.needRedPoint = false
	self.frames = {}
	self.stars = {}
	self.redStars = {}
	self.star2ItemId = {
		nil,
		nil,
		940003,
		940001,
		940002
	}
	self.renderPanel = renderPanel
	self.activeStates = {}
end

function HeroIcon:getIconType()
	return "hero_icon"
end

local partValuePath = {
	imgStarBg = {
		name = "imgStarBg",
		pos = {
			0,
			0,
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
	gBackEffect = {
		name = "gBackEffect",
		pos = {
			0,
			0,
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
	finishImg = {
		name = "finishImg",
		pos = {
			36,
			38.6,
			0
		}
	},
	imgQuality_ = {
		name = "imgQuality_",
		pos = {
			0,
			0,
			0
		}
	},
	redPointImg = {
		name = "redPointImg",
		pos = {
			64,
			64,
			0
		}
	},
	imgLove = {
		name = "imgLove",
		pos = {
			0,
			-31,
			0
		}
	},
	labelNum_ = {
		name = "labelNum_",
		pos = {
			45,
			-45,
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
	imgMask_ = {
		name = "imgMask_",
		pos = {
			0,
			0,
			0
		}
	},
	labelLev_ = {
		name = "labelLev_",
		pos = {
			45,
			45,
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
	imgOneStar_ = {
		name = "imgOneStar_",
		pos = {
			0,
			-51,
			0
		}
	},
	groupRedStars_ = {
		name = "groupRedStars_",
		pos = {
			0,
			-41,
			0
		}
	},
	groupStars_ = {
		name = "groupStars_",
		pos = {
			0,
			-39,
			0
		}
	},
	imgJob_ = {
		name = "imgJob_",
		pos = {
			-51,
			18,
			0
		}
	},
	progress = {
		name = "progress",
		pos = {
			0,
			-66,
			0
		}
	},
	progressWithIcon = {
		name = "progressWithIcon",
		pos = {
			0,
			-66,
			0
		}
	},
	stateImg = {
		name = "stateImg",
		pos = {
			45,
			-45,
			0
		}
	},
	equipAvatar = {
		name = "equipAvatar",
		pos = {
			30,
			-30,
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
	floorLabel = {
		name = "floorLabel",
		pos = {
			0,
			0,
			0
		}
	}
}

function HeroIcon:getPartExample(name)
	if not self[name] then
		self[name] = self:addPartObj(partValuePath[name])

		if name == "labelLev_" then
			self.labelLev_ = self.labelLev_:GetComponent(typeof(UILabel))
		elseif name == "imgChoose_" then
			self.imgChoose_ = self.imgChoose_:GetComponent(typeof(UISprite))
		elseif name == "imgLock_" then
			self.imgLock_ = self.imgLock_:GetComponent(typeof(UISprite))
		elseif name == "groupSelect_" then
			for i = 1, 4 do
				self["selectImgs" .. i] = self.groupSelect_:ComponentByName("imgSelefct_" .. i, typeof(UISprite))

				table.insert(self.selectImgs, self["selectImgs" .. i])
			end
		elseif name == "labelNum_" then
			self.labelNum_ = self.labelNum_:GetComponent(typeof(UILabel))
		elseif name == "imgLove" then
			self.labelLove = self.imgLove:ComponentByName("labelLove", typeof(UILabel))
		elseif name == "imgQuality_" then
			self.imgQuality_ = self.imgQuality_:GetComponent(typeof(UISprite))
		elseif name == "finishImg" then
			self.finishImg = self.finishImg:GetComponent(typeof(UITexture))
		elseif name == "imgStarBg" then
			self.imgStarBg = self.imgStarBg:GetComponent(typeof(UISprite))
		elseif name == "imgDebris_" then
			self.imgDebris_ = self.imgDebris_:GetComponent(typeof(UISprite))
		elseif name == "imgOneStar_" then
			self.imgOneStar_ = self.imgOneStar_:GetComponent(typeof(UISprite))
			self.labelStar_ = self.imgOneStar_:ComponentByName("labelStar_", typeof(UILabel))
		elseif name == "imgJob_" then
			self.imgJob_ = self.imgJob_:GetComponent(typeof(UISprite))
		elseif name == "progress" then
			self.progress = self.progress:GetComponent(typeof(UIProgressBar))
		elseif name == "progressWithIcon" then
			self.progressWithIcon = self.progressWithIcon:GetComponent(typeof(UIProgressBar))
			self.progressIcon = self.progressWithIcon:ComponentByName("iconImg", typeof(UISprite))
		elseif name == "stateImg" then
			self.stateImg = self.stateImg:GetComponent(typeof(UISprite))
		elseif name == "imgMask_" then
			self.imgMask_ = self.imgMask_:GetComponent(typeof(UISprite))
		end

		if self[name .. "state"] ~= nil and self[name .. "state"] ~= self[name].gameObject.activeSelf then
			self[name]:SetActive(self[name .. "state"])
		end
	end

	return self[name]
end

function HeroIcon:setPartExampleVisible(name, visible)
	if visible then
		self:setPartVisible(self:getPartExample(name), true)
	else
		self:setPartVisible(self[name], false, name)
	end
end

function HeroIcon:updateStateValue(value)
	if self.progressWithIcon then
		self.progressWithIcon.value = value
	end
end

function HeroIcon:updateStateImg(state)
	self.arcticState_ = state

	local imgName = "expedition_partner_state_icon_small_" .. state

	if self.stateImg then
		xyd.setUISpriteAsync(self.stateImg, nil, imgName)
	end

	if self.progressIcon then
		xyd.setUISpriteAsync(self.progressIcon, nil, imgName)
	end
end

function HeroIcon:showStateImgChangeAni(state)
	if not self.progressIcon then
		return
	end

	local seq = self:getSequence(nil, true)

	self:waitForTime(0.3333333333333333, function()
		self:updateStateImg(state)
	end)

	local function setter1(value)
		self.progressIcon.alpha = value
	end

	seq:Insert(0, self.progressIcon.transform:DOScale(Vector3(1.1, 1.1, 1), 0.1))
	seq:Insert(0.2, self.progressIcon.transform:DOScale(Vector3(0.5, 0.5, 1), 0.13333333333333333))
	seq:Insert(0.2, DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter1), 1, 0, 0.13333333333333333))
	seq:Insert(0.43333333333333335, self.progressIcon.transform:DOScale(Vector3(1.05, 1.05, 1), 0.13333333333333333))
	seq:Insert(0.5666666666666667, self.progressIcon.transform:DOScale(Vector3(0.99, 0.98, 1), 0.1))
	seq:Insert(0.6666666666666666, self.progressIcon.transform:DOScale(Vector3(1, 1, 1), 0.1))
	seq:Insert(0.43333333333333335, DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter1), 0, 1, 0.13333333333333333))
end

function HeroIcon:setClickStateImg(callback)
	self.arcticCallback_ = callback

	if self.stateImg then
		UIEventListener.Get(self.stateImg.gameObject).onClick = function()
			self.arcticCallback_(self.arcticState_ or 1)
		end
	end

	if self.progressIcon then
		UIEventListener.Get(self.progressIcon.gameObject).onClick = function()
			self.arcticCallback_(self.arcticState_ or 1)
		end
	end
end

function HeroIcon:getBorder()
	return self.imgBorder_
end

function HeroIcon:setPartVisible(obj, visible, name)
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

function HeroIcon:getPartVisible(name)
	if self[name .. "state"] ~= nil then
		return self[name .. "state"]
	else
		return false
	end
end

function HeroIcon:addPartObj(partInfo, objParent)
	return HeroIcon.super.addPartObj(self, "hero_icon", partInfo, objParent)
end

function HeroIcon:getPrefabPath()
	return "Prefabs/Components/hero_icon"
end

function HeroIcon:initUI()
	HeroIcon.super.initUI(self)

	local go = self.go

	self.imgIcon_ = go:NodeByName("imgIcon_").gameObject
	self.imgBorder_ = go:ComponentByName("imgBorder_", typeof(UISprite))
	self.imgBorder2_ = go:ComponentByName("imgBorder2_", typeof(UISprite))
	self.imgGroupBg_ = go:ComponentByName("imgGroupBg_", typeof(UISprite))
	self.imgCamp_ = go:ComponentByName("imgCamp_", typeof(UISprite))
	self.imgIconSprite_ = self.imgIcon_:GetComponent(typeof(UIWidget))
	self.selectImgs = {}
end

function HeroIcon:updateActive(params)
	for k, v in pairs(params) do
		local curActive = self.activeStates[k]

		if curActive ~= v then
			self[k]:SetActive(v)

			self.activeStates[k] = v
		end
	end
end

function HeroIcon.____getters:selected()
	if self.groupSelect_ == nil then
		return nil
	end

	if self.isShowSelected ~= nil and self.isShowSelected == false then
		return nil
	end

	if self.partnerInfo.noClickSelected then
		self:setPartExampleVisible("groupSelect_", false)
	end

	return self:getPartVisible("groupSelect_")
end

function HeroIcon.____getters:choose()
	if self.imgChoose_ == nil then
		return nil
	end

	return self:getPartVisible("imgChoose_")
end

function HeroIcon.____getters:lock()
	if self.imgLock_ == nil then
		return nil
	end

	return self:getPartVisible("imgLock_")
end

function HeroIcon:setLockSource(source, source2)
	self.lockSource_ = source

	if source2 then
		xyd.setUISpriteAsync(self:getPartExample("imgQuality_"), nil, source2)
		self:setPartExampleVisible("imgQuality_", true)
	end
end

function HeroIcon:setMaskSource(source)
	xyd.setUISpriteAsync(self:getPartExample("imgMask_"), nil, source)
end

function HeroIcon:setIconSource(source, isMustUpdate)
	if not source then
		return
	end

	if not isMustUpdate and self.iconSource and self.iconSource == source then
		return
	end

	if source then
		self.iconSource = source

		local changeParams = {}

		changeParams.imgIcon_ = true

		local depth = self.imgIconSprite_.depth

		if not self.uisprite then
			self.uisprite = self.imgIcon_:GetComponent(typeof(UISprite))
		end

		if not self.uisprite then
			self.uisprite = self.imgIcon_:AddComponent(typeof(UISprite))

			local uisprite = self.uisprite

			uisprite.depth = depth
			uisprite.width = 90
			uisprite.height = 90
		end

		xyd.setUISpriteAsync(self.uisprite, nil, source, function()
			if self.iconSource ~= source then
				self:setIconSource(self.iconSource, true)
			end
		end, true)
		self:updateActive(changeParams)
	end
end

function HeroIcon.____setters:lev(level)
	if level ~= nil then
		self:setPartExampleVisible("labelLev_", true)

		self:getPartExample("labelLev_").text = xyd.getDisplayNumber(level)
	else
		self:setPartExampleVisible("labelLev_", false)
	end
end

function HeroIcon.____setters:num(num1)
	if num1 then
		self:setPartExampleVisible("labelNum_", true)

		self:getPartExample("labelNum_").text = num1
	else
		self:setPartExampleVisible("labelNum_", false)
	end
end

function HeroIcon:setNum(num1)
	self.num = num1
end

function HeroIcon.____setters:selected(select)
	if self.isShowSelected ~= nil and self.isShowSelected == false then
		return nil
	end

	self:setPartExampleVisible("groupSelect_", select)

	if self.partnerInfo.noClickSelected then
		self:setPartExampleVisible("groupSelect_", false)
	end
end

function HeroIcon:setSelected(select)
	if self.isShowSelected ~= nil and self.isShowSelected == false then
		return nil
	end

	self:setPartExampleVisible("groupSelect_", select)

	if self.partnerInfo.noClickSelected then
		self:setPartExampleVisible("groupSelect_", false)
	end
end

function HeroIcon.____setters:choose(flag)
	self:setPartExampleVisible("imgMask_", flag)
	self:setPartExampleVisible("imgChoose_", flag)
end

function HeroIcon:getChoose()
	return self:getPartVisible("imgChoose_")
end

function HeroIcon:setChoose(flag)
	self:setPartExampleVisible("imgMask_", flag)
	self:setPartExampleVisible("imgChoose_", flag)
end

function HeroIcon:setBackground(flag)
	self:setPartExampleVisible("imgBorder_", flag)
	self:setPartExampleVisible("imgBorder2_", flag)
end

function HeroIcon.____setters:scale(scale)
	if self.iconScale ~= scale then
		self.iconScale = scale

		self.go:SetLocalScale(scale, scale, scale)
	end
end

function HeroIcon:setScale(scale)
	self.go:SetLocalScale(scale, scale, scale)
end

function HeroIcon.____setters:lock(flag)
	if not self.lockSource_ and flag == true then
		xyd.setUISprite(self:getPartExample("imgLock_"), xyd.Atlas.COMMON_UI, "lock_icon")

		self:getPartExample("imgLock_").width = 56
		self:getPartExample("imgLock_").height = 36
		self.imgLockSource = "lock_icon"
	elseif self.lockSource_ and flag == true then
		xyd.setUISprite(self:getPartExample("imgLock_"), nil, self.lockSource_)

		self:getPartExample("imgLock_").width = 64
		self:getPartExample("imgLock_").height = 69
	end

	self:setPartExampleVisible("imgLock_", flag)
	self:setPartExampleVisible("imgMask_", flag)
end

function HeroIcon:setLock(flag, width, height)
	if not self.lockSource_ and flag == true then
		xyd.setUISprite(self:getPartExample("imgLock_"), xyd.Atlas.COMMON_UI, "lock_icon")

		self:getPartExample("imgLock_").width = width or 56
		self:getPartExample("imgLock_").height = height or 36
		self.imgLockSource = "lock_icon"
	elseif self.lockSource_ and flag == true then
		xyd.setUISprite(self:getPartExample("imgLock_"), nil, self.lockSource_)

		self:getPartExample("imgLock_").width = width or 64
		self:getPartExample("imgLock_").height = height or 69
	end

	self:setPartExampleVisible("imgLock_", flag)
	self:setPartExampleVisible("imgMask_", flag)
end

function HeroIcon:setLockScale(scale)
	self:getPartExample("imgLock_").transform.localScale = Vector3(scale, scale, scale)
end

function HeroIcon:setNoClick(flag)
	self.noClick = flag

	xyd.setTouchEnable(self.go, not flag)
end

function HeroIcon.____setters:bigLock(flag)
	if self.imgLockSource ~= "memory_list_lock" and flag == true then
		xyd.setUISprite(self:getPartExample("imgLock_"), xyd.Atlas.COMMON_UI, "memory_list_lock")

		self:getPartExample("imgLock_").width = 46
		self:getPartExample("imgLock_").height = 54
		self.imgLockSource = "memory_list_lock"
	end

	self:setPartExampleVisible("imgLock_", flag)
	self:setPartExampleVisible("imgMask_", flag)
end

function HeroIcon.____setters:labelNumScale(scale)
	if self.labelNumDefaultSize ~= scale then
		self.labelNumDefaultSize = scale

		self:getPartExample("labelNum_"):SetLocalScale(scale, scale, scale)
	end
end

function HeroIcon:setLabelNumColor(color)
	self:getPartExample("labelNum_").color = color
end

function HeroIcon:setBelowLabel(flag, text, color)
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

function HeroIcon:initSwitchIcon()
	if self.partnerInfo and self.partnerInfo.switch then
		if self.partnerInfo.switch_func then
			self:setSwitchIcon(self.partnerInfo.switch_func)
		else
			xyd.setTouchEnable(self:getPartExample("switchIcon_"), false)
		end

		self:setPartExampleVisible("switchIcon_", self.partnerInfo.switch)
	end
end

function HeroIcon:setFloorLabel(flag, text, color)
	self:setPartExampleVisible("floorLabel", flag)
	self:setPartExampleVisible("imgMask_", flag)

	if self:getPartExample("floorLabel") then
		if text then
			self:getPartExample("floorLabel"):GetComponent(typeof(UILabel)).text = text
		end

		if color then
			self:getPartExample("floorLabel"):GetComponent(typeof(UILabel)).color = color
		end
	end
end

function HeroIcon:setInfo(partnerInfo, petFrame, partner)
	local changeParams = {}

	self.petFrame = petFrame
	self.partnerInfo = partnerInfo

	local heroIcon = partnerInfo.heroIcon
	local partnerGroup = partnerInfo.group
	local hideLev = partnerInfo.hideLev
	local hideStar = partnerInfo.hideStar

	self.effectName_ = partnerInfo.effect
	self.hide_attr = partnerInfo.hide_attr
	self.isShowSelected = partnerInfo.isShowSelected

	if self.partnerInfo.panel then
		self.panel_ = self.partnerInfo.panel
	end

	self.isUnique_ = self.partnerInfo.isUnique
	self.effectPos_ = partnerInfo.effectPos
	self.target_ = partnerInfo.target
	self.isEntrance = partnerInfo.isEntrance
	self.longPressCallBackFun = partnerInfo.longPressCallBackFun

	if partnerInfo.lev ~= nil and partnerInfo.lev ~= 0 or partnerInfo.lv ~= nil and partnerInfo.lv ~= 0 then
		self.lev = partnerInfo.lev or partnerInfo.level or partnerInfo.lv

		if self.lev ~= nil then
			self:getPartExample("labelLev_").text = self.lev
		end
	else
		self:setPartExampleVisible("labelLev_", false)
	end

	if hideLev then
		self:setPartExampleVisible("labelLev_", false)
	end

	local type_ = ItemTable:getType(partnerInfo.itemID)

	if partnerInfo.num and (type_ ~= xyd.ItemType.HERO or partnerInfo.heroShowNum) then
		self.num = partnerInfo.num
	else
		self:setPartExampleVisible("labelNum_", false)
	end

	if partnerInfo.needRedPoint ~= nil then
		self.needRedPoint = partnerInfo.needRedPoint
	end

	if partnerInfo.hideStar then
		self:setPartExampleVisible("groupStars_", false)
	end

	if partnerInfo.scale then
		if type(partnerInfo.scale) == "number" then
			if partnerInfo.scale ~= self.goScale then
				self.go:SetLocalScale(partnerInfo.scale, partnerInfo.scale, partnerInfo.scale)
			end
		elseif partnerInfo.scale.x ~= self.goScale then
			self.go:SetLocalScale(partnerInfo.scale.x, partnerInfo.scale.y, partnerInfo.scale.z)
		end
	end

	if partnerInfo.labelNumScale then
		self.labelNumScale = partnerInfo.labelNumScale
	end

	self:setJob(partnerInfo.job or 0)

	self.show_has_num = partnerInfo.show_has_num

	local heroID = partnerInfo.itemID or partnerInfo.tableID or partnerInfo.table_id

	if partnerInfo.isMonster_ then
		heroID = xyd.tables.monsterTable:getPartnerLink(heroID)
		self.partnerInfo.tableID = heroID
	end

	local star = partnerInfo.star

	xyd.setUISprite(self:getPartExample("imgDebris_"), xyd.Atlas.COMMON_UI, "debris_icon")

	self.imgDebrisSource = "debris_icon"

	self:setPartExampleVisible("imgDebris_", true)

	if type_ == xyd.ItemType.HERO_DEBRIS then
		local partnerCost = ItemTable:partnerCost(heroID)

		heroID = partnerCost[1]

		self:setPartExampleVisible("labelLev_", false)
	elseif type_ == xyd.ItemType.HERO_RANDOM_DEBRIS then
		self:setPartExampleVisible("labelLev_", false)

		partnerGroup = ItemTable:getGroup(heroID)
		heroIcon = ItemTable:getIcon(heroID)

		if not partnerInfo.notChangeStar then
			star = ItemTable:getQuality(heroID)
		end

		if partnerGroup and partnerGroup > 0 and partnerGroup == xyd.PartnerGroup.TIANYI then
			star = 10
		end
	elseif type_ == xyd.ItemType.SKIN then
		self:setPartExampleVisible("labelLev_", false)

		partnerGroup = ItemTable:getGroup(heroID)
		heroIcon = ItemTable:getIcon(heroID)

		if self.imgDebrisSource ~= "icon_skin" then
			xyd.setUISprite(self:getPartExample("imgDebris_"), xyd.Atlas.COMMON_UI, "icon_skin")

			self.imgDebrisSource = "icon_skin"
		end
	else
		self:setPartExampleVisible("imgDebris_", false)
	end

	self.partnerGroup = partnerGroup

	if partnerGroup and partnerGroup > 0 then
		if self.imgCampSource ~= "img_group" .. tostring(partnerGroup) then
			self.imgCampSource = "img_group" .. tostring(partnerGroup)

			xyd.setUISprite(self.imgCamp_, xyd.Atlas.COMMON_UI, "img_group" .. tostring(partnerGroup))
		end

		changeParams.imgCamp_ = true
		changeParams.imgGroupBg_ = true
	elseif partnerGroup and partnerGroup == 0 then
		changeParams.imgCamp_ = false
		changeParams.imgGroupBg_ = false
	else
		local camp = PartnerTable:getGroup(heroID)

		if camp and camp > 0 then
			changeParams.imgGroupBg_ = true
			changeParams.imgCamp_ = true

			if self.imgCampSource ~= "img_group" .. tostring(camp) then
				self.imgCampSource = "img_group" .. tostring(camp)

				xyd.setUISprite(self.imgCamp_, xyd.Atlas.COMMON_UI, "img_group" .. tostring(camp))
			end
		else
			changeParams.imgGroupBg_ = false
			changeParams.imgCamp_ = false
		end
	end

	if partnerInfo.icon_frame then
		self.frames = partnerInfo.icon_frame
	end

	local skinID = partnerInfo.skin_id

	if not heroIcon and skinID and skinID > 0 then
		heroIcon = EquipTable:getSkinAvatar(skinID)
	elseif not heroIcon then
		heroIcon = PartnerTable:getAvatar(heroID)
		heroIcon = self:checkTianyiAvatar(heroIcon, heroID)
	end

	if heroIcon then
		self:setIconSource(heroIcon)
	end

	if type_ == xyd.ItemType.SKIN then
		self:setPartExampleVisible("groupStars_", false)
		self:setPartExampleVisible("groupRedStars_", false)
		self:setPartExampleVisible("imgOneStar_", false)
	else
		local group = self:getCheckGroup()

		if group and group == xyd.PartnerGroup.TIANYI and star == nil and partnerInfo.awake then
			star = PartnerTable:getStar(heroID) + partnerInfo.awake
		end

		star = star or PartnerTable:getStar(heroID)

		local summonId = xyd.tables.itemTable:getSummonID(partnerInfo.itemID)

		if summonId and summonId ~= 0 then
			star = star + xyd.tables.summonTable:getAwakeLv(summonId)
		end

		if not hideStar then
			self:initStar(star)
		end

		if star and star > 9 then
			if not partnerInfo.icon_frame then
				if partnerInfo.is_vowed == 1 or partnerInfo.isVowed == 1 then
					self.frames = {
						"hero_frame3",
						"hero_group3"
					}
				else
					self.frames = {
						"hero_frame2",
						"hero_group2"
					}
				end
			end

			if star == 10 then
				-- block empty
			else
				self:getPartExample("imgOneStar_"):SetBottomAnchor(self.go, 0, -4)
				self:getPartExample("imgOneStar_"):SetTopAnchor(self.go, 0, 26)
			end

			local isSaoguang = not partnerInfo.notPlaySaoguang

			self:initEffect(star, isSaoguang)
		else
			if not partnerInfo.icon_frame then
				if partnerInfo.is_vowed == 1 or partnerInfo.isVowed == 1 then
					self.frames = {
						"hero_frame3",
						"hero_group3"
					}
				else
					self.frames = {
						"hero_frame",
						"hero_group"
					}
				end
			end

			if self.effect then
				changeParams.effect = false

				self.effect:stop()
			end

			if self.bgEffect then
				changeParams.bgEffect = false

				self.bgEffect:stop()
			end

			if self.effect_tianyi then
				changeParams.effect_tianyi = false

				self.effect_tianyi:stop()
			end

			if self.bgEffect_tianyi then
				changeParams.bgEffect_tianyi = false

				self.bgEffect_tianyi:stop()
			end
		end
	end

	if partnerInfo.needStarBg then
		local source = ItemTable:getIcon(self.star2ItemId[star])

		if self.imgStarBgSource ~= source then
			xyd.setUISprite(self:getPartExample("imgStarBg"), xyd.Atlas.ICON, source)

			self.imgStarBgSource = source
		end

		self:setPartExampleVisible("imgStarBg", true)
	else
		self:setPartExampleVisible("imgStarBg", false)
	end

	self.selected = false
	self.noClick = self.partnerInfo.noClick
	self.callback = self.partnerInfo.callback
	self.smallTips_ = self.partnerInfo.smallTips
	self.attach_callback = self.partnerInfo.attach_callback
	self.dragCallback = self.partnerInfo.dragCallback
	self.notShowGetWayBtn = partnerInfo.notShowGetWayBtn

	if self.needRedPoint then
		self:setPartExampleVisible("redPointImg", true)
	else
		self:setPartExampleVisible("redPointImg", false)
	end

	if partnerInfo.hideDebris then
		self:setPartExampleVisible("imgDebris_", false)
	end

	if partnerInfo.isShowLovePoint then
		local lovePoint = partnerInfo.love_point or partnerInfo.lovePoint

		if lovePoint and lovePoint >= 100 then
			self:setPartExampleVisible("imgLove", true)

			if self.lovePoint ~= lovePoint then
				self.labelLove.text = tostring(math.floor(lovePoint / 100))
				self.lovePoint = lovePoint
			end
		else
			self:setPartExampleVisible("imgLove", false)
		end
	else
		self:setPartExampleVisible("imgLove", false)
	end

	if partnerInfo.dragScrollView then
		local drag = self.go:GetComponent(typeof(UIDragScrollView))

		drag = drag or self.go:AddComponent(typeof(UIDragScrollView))
		drag.scrollView = partnerInfo.dragScrollView
	end

	if partnerInfo.isAddUIDragScrollView ~= nil and partnerInfo.isAddUIDragScrollView == true then
		self:AddUIDragScrollView()
	end

	if self.petFrame then
		self:setPetFrame(self.petFrame)
	elseif #self.frames > 0 then
		self:setIconFrame(self.frames[1], self.frames[2])
	end

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

	if self.effectName_ and self.effectName_ ~= "" then
		self:setEffectState(true)
	end

	if partnerInfo.isNew then
		self:setPartExampleVisible("newIcon_", true)
	else
		self:setPartExampleVisible("newIcon_", false)
	end

	self:initEquipId(partnerInfo.equip_id)
	self:updateActive(changeParams)

	if xyd.isIosTest() then
		self.camp = PartnerTable:getGroup(heroID)

		self:iosTestChangeUI1()
	end

	if partnerInfo.showLightEffect and partnerInfo.showLightEffect == true then
		self:showLightEffect()
	end

	if partnerInfo.notShowNum then
		self:setPartExampleVisible("labelNum_", false)
	end

	if partner then
		self.partnerInfoPartner = partner
	end

	if partnerInfo.anotherBorderImg then
		self:changeBorderImg(partnerInfo.anotherBorderImg)
	elseif self.anotherImgBorder then
		self:changeBorderImg()
	end

	self:initSwitchIcon()
end

function HeroIcon:showDebris(state)
	if state == nil then
		state = true
	end

	self:setPartExampleVisible("imgDebris_", state)
end

function HeroIcon:setEffectState(isShow)
	if self.targetEffect_ ~= nil then
		self.targetEffect_:destroy()

		self.targetEffect_ = nil
	end

	if isShow then
		self.targetEffect_ = xyd.Spine.new(self:getPartExample("gEffect"))

		self.targetEffect_:setInfo(self.effectName_, function()
			if self.panel_ then
				self.targetEffect_:setRenderPanel(self.panel_)
			end

			if self.effectPos_ then
				self.targetEffect_:SetLocalPosition(self.effectPos_.x, self.effectPos_.y, self.effectPos_.z)
			end

			if self.target_ then
				self.targetEffect_:setRenderTarget(self.target_, 5)
			else
				self.targetEffect_:setRenderTarget(self:getPartExample("gEffect"):GetComponent(typeof(UITexture)), 5)
			end

			self.targetEffect_:play("texiao01", 0)
		end)
	end
end

function HeroIcon:initEffect(star, isSaoguang)
	local ainimation_name = star == 10 and "texiao01" or "texiao02"
	local posY = xyd.checkCondition(star == 10, -2, 5)

	if isSaoguang then
		local group = self:getCheckGroup()

		if group and group == xyd.PartnerGroup.TIANYI then
			local changeParams = {}

			if self.effect then
				changeParams.effect = false

				self.effect:stop()
			end

			if self.bgEffect then
				changeParams.bgEffect = false

				self.bgEffect:stop()
			end

			self:updateActive(changeParams)

			if not self.effect_tianyi then
				self.effect_tianyi = xyd.Spine.new(self.go)

				self.effect_tianyi:setInfo("shiziui_touxiang_tianyi", function()
					if self.panel_ == nil then
						self.effect_tianyi:setRenderPanel(self.renderPanel)
					else
						self.effect_tianyi:setRenderPanel(self.panel_)
					end

					self.effect_tianyi:SetLocalPosition(0, posY, 0)
					self.effect_tianyi:setRenderTarget(self:getPartExample("imgOneStar_"):GetComponent(typeof(UIWidget)), 2)
				end, self.isUnique_)
			end

			if not self.bgEffect_tianyi then
				self.bgEffect_tianyi = xyd.Spine.new(self.go)

				self.bgEffect_tianyi:setInfo("shiziui_touxiang_tianyi", function()
					if self.panel_ == nil then
						self.bgEffect_tianyi:setRenderPanel(self.renderPanel)
					else
						self.bgEffect_tianyi:setRenderPanel(self.panel_)
					end

					self.bgEffect_tianyi:setRenderTarget(self:getPartExample("imgOneStar_"):GetComponent(typeof(UIWidget)), 2)
				end, self.isUnique_)
			end

			self.effect_tianyi:play(ainimation_name, 0, 1, nil, true, true)
			self.bgEffect_tianyi:play("texiao03", 0, 1, nil, true, true)
		else
			local changeParams = {}

			if self.effect_tianyi then
				changeParams.effect_tianyi = false

				self.effect_tianyi:stop()
			end

			if self.bgEffect_tianyi then
				changeParams.bgEffect_tianyi = false

				self.bgEffect_tianyi:stop()
			end

			self:updateActive(changeParams)

			if not self.effect then
				self.effect = xyd.Spine.new(self.go)

				self.effect:setInfo("shiziui_touxiang", function()
					if self.panel_ == nil then
						self.effect:setRenderPanel(self.renderPanel)
					else
						self.effect:setRenderPanel(self.panel_)
					end

					self.effect:SetLocalPosition(0, posY, 0)
					self.effect:setRenderTarget(self:getPartExample("imgOneStar_"):GetComponent(typeof(UIWidget)), 2)
				end, self.isUnique_)
			end

			if not self.bgEffect then
				self.bgEffect = xyd.Spine.new(self.go)

				self.bgEffect:setInfo("shiziui_touxiang", function()
					if self.panel_ == nil then
						self.bgEffect:setRenderPanel(self.renderPanel)
					else
						self.bgEffect:setRenderPanel(self.panel_)
					end

					self.bgEffect:setRenderTarget(self:getPartExample("imgOneStar_"):GetComponent(typeof(UIWidget)), 2)
				end, self.isUnique_)
			end

			self.effect:play(ainimation_name, 0, 1, nil, true, true)
			self.bgEffect:play("texiao03", 0, 1, nil, true, true)
		end
	else
		local changeParams = {}

		if self.effect then
			changeParams.effect = false

			self.effect:stop()
		end

		if self.bgEffect then
			changeParams.bgEffect = false

			self.bgEffect:stop()
		end

		if self.effect_tianyi then
			changeParams.effect_tianyi = false

			self.effect_tianyi:stop()
		end

		if self.bgEffect_tianyi then
			changeParams.bgEffect_tianyi = false

			self.bgEffect_tianyi:stop()
		end

		self:updateActive(changeParams)
	end
end

function HeroIcon:initStar(star)
	if not star then
		return
	end

	if star <= 5 and #self.stars == 0 then
		local i = 1

		while i <= 5 do
			local star = NGUITools.AddChild(self:getPartExample("groupStars_"), "star_" .. i)
			local sp = star:AddComponent(typeof(UISprite))

			xyd.setUISprite(sp, xyd.Atlas.COMMON_UI, "star")

			sp:GetComponent(typeof(UIWidget)).width = 22
			sp:GetComponent(typeof(UIWidget)).height = 22
			sp.depth = self:getPartExample("groupStars_"):GetComponent(typeof(UIWidget)).depth + 2
			i = i + 1

			table.insert(self.stars, star)
		end
	end

	if star > 5 and star < 10 and #self.redStars == 0 then
		local i = 1

		while i <= 4 do
			local star = NGUITools.AddChild(self:getPartExample("groupRedStars_"), "star_red_" .. i)
			local sp = star:AddComponent(typeof(UISprite))

			xyd.setUISprite(sp, xyd.Atlas.COMMON_UI, "star_red")

			sp:GetComponent(typeof(UIWidget)).width = 22
			sp:GetComponent(typeof(UIWidget)).height = 22
			sp.depth = self:getPartExample("groupRedStars_"):GetComponent(typeof(UIWidget)).depth + 2
			i = i + 1

			table.insert(self.redStars, star)
		end
	end

	if star < 10 then
		self:setPartExampleVisible("imgOneStar_", false)

		if star > 5 then
			for i = 1, 4 do
				self.redStars[i]:SetActive(i <= star - 5)
			end

			self:setPartExampleVisible("groupStars_", false)
			self:setPartExampleVisible("groupRedStars_", true)
			self:getPartExample("groupRedStars_"):GetComponent(typeof(UIGrid)):Reposition()
		else
			for i = 1, 5 do
				self.stars[i]:SetActive(i <= star)
			end

			self:setPartExampleVisible("groupStars_", true)
			self:setPartExampleVisible("groupRedStars_", false)
			self:getPartExample("groupStars_"):GetComponent(typeof(UIGrid)):Reposition()
		end
	else
		self:setPartExampleVisible("groupStars_", false)
		self:setPartExampleVisible("groupRedStars_", false)
		self:setPartExampleVisible("imgOneStar_", true)

		star = star - 10

		local group = self:getCheckGroup()
		local heroID = self.partnerInfo.itemID or self.partnerInfo.tableID or self.partnerInfo.table_id
		local type = xyd.tables.itemTable:getType(heroID)
		local partnerInfo
		local isMaxStar = false

		if type == xyd.ItemType.HERO then
			isMaxStar = xyd.isMaxStarOrigin(self.partnerInfo, nil)
		else
			isMaxStar = false
		end

		if star > 0 then
			local str = "potentiality_avatar_star"

			if group and group > 0 then
				str = xyd.checkPartnerGroupImgStr(group, str, isMaxStar)
			end

			xyd.setUISprite(self:getPartExample("imgOneStar_"), xyd.Atlas.COMMON_UI, str)

			self.labelStar_.text = star
		else
			local str = "star_orange_2"

			if group and group > 0 then
				str = xyd.checkPartnerGroupImgStr(group, str, isMaxStar)
			end

			local heroID = self.partnerInfo.itemID or self.partnerInfo.tableID or self.partnerInfo.table_id

			xyd.setUISprite(self:getPartExample("imgOneStar_"), xyd.Atlas.COMMON_UI, str)

			self.labelStar_.text = ""
		end

		self:getPartExample("imgOneStar_"):MakePixelPerfect()
	end
end

function HeroIcon:isMaxStarOrigin()
	local heroID = self.partnerInfo.itemID or self.partnerInfo.tableID or self.partnerInfo.table_id
	local type = xyd.tables.itemTable:getType(heroID)
	local partnerInfo
	local isMaxStar = false

	if type == xyd.ItemType.HERO then
		if self.partnerInfo.star_origin then
			partnerInfo = self.partnerInfo

			local starOrigin = partnerInfo.star_origin
			local partnerTableID = partnerInfo.tableID or partnerInfo.table_id

			if not partnerTableID then
				isMaxStar = false
			else
				local listTableID = xyd.tables.partnerTable:getStarOrigin(partnerTableID)
				local beginIDs = xyd.tables.starOriginListTable:getStartIDs(listTableID)

				if not listTableID or not beginIDs or beginIDs == {} then
					isMaxStar = false
				else
					for i, lv in pairs(starOrigin) do
						local maxLev = xyd.tables.starOriginTable:getMaxLevByBeginID(beginIDs[i])

						if lv ~= maxLev then
							isMaxStar = false

							break
						end

						isMaxStar = true
					end
				end
			end
		elseif self.partnerInfo.partnerID then
			partnerInfo = xyd.models.slot:getPartner(self.partnerInfo.partnerID)

			if partnerInfo then
				isMaxStar = false

				local starOrigin = partnerInfo.star_origin

				if not starOrigin then
					isMaxStar = false
				else
					local partnerTableID = partnerInfo:getTableID()
					local listTableID = xyd.tables.partnerTable:getStarOrigin(partnerTableID)
					local beginIDs = xyd.tables.starOriginListTable:getStartIDs(listTableID)

					if not listTableID or not beginIDs or beginIDs == {} then
						isMaxStar = false
					else
						for i, lv in pairs(starOrigin) do
							local maxLev = xyd.tables.starOriginTable:getMaxLevByBeginID(beginIDs[i])

							if lv ~= maxLev then
								isMaxStar = false

								break
							end

							isMaxStar = true
						end
					end
				end
			else
				isMaxStar = false
			end
		else
			isMaxStar = false
		end
	else
		isMaxStar = false
	end

	return isMaxStar
end

function HeroIcon:updatePartnerInfo(partnerInfo)
	for key in pairs(partnerInfo) do
		self.partnerInfo[key] = partnerInfo[key]
	end
end

function HeroIcon:onClickIcon()
	if self.noClick then
		return
	end

	self.selected = true

	if self.partnerInfo.noClickSelected then
		self.selected = false
	end

	local heroID = self.partnerInfo.itemID or self.partnerInfo.tableID or self.partnerInfo.table_id

	if self.callback ~= nil then
		xyd.SoundManager.get():playSound(xyd.SoundID.BUTTON)
		self:callback()
	elseif ItemTable:getType(heroID) == xyd.ItemType.HERO then
		self.selected = false

		if self.partnerInfoPartner then
			xyd.WindowManager.get():openWindow("partner_info", {
				partner = self.partnerInfoPartner,
				noWays = self.partnerInfo.noWays,
				isEntrance = self.isEntrance,
				isHideAttr = self.hide_attr
			})
		else
			xyd.WindowManager.get():openWindow("partner_info", {
				table_id = heroID,
				noWays = self.partnerInfo.noWays,
				star = self.partnerInfo.star,
				isEntrance = self.isEntrance,
				isHideAttr = self.hide_attr
			})
		end
	else
		local params = {
			itemID = heroID,
			itemNum = self.partnerInfo.itemNum or 0,
			wndType = self.partnerInfo.wndType,
			callback = function()
				if tolua.isnull(self.go) then
					return
				end

				self.selected = false
			end,
			smallTips = self.smallTips_,
			show_has_num = self.show_has_num,
			notShowGetWayBtn = self.notShowGetWayBtn
		}

		xyd.WindowManager.get():openWindow("item_tips_window", params)
	end

	if self.attach_callback then
		self:attach_callback()
	end
end

function HeroIcon:getPartnerInfo()
	return self.partnerInfo
end

function HeroIcon:setGrey()
	local uisprite = self.imgIcon_:GetComponent(typeof(UISprite))
	local uiTexture = self.imgIcon_:GetComponent(typeof(UITexture))

	xyd.applyGrey(uisprite or uiTexture)
	xyd.applyGrey(self.imgCamp_)
	xyd.applyGrey(self.imgGroupBg_)
	xyd.applyGrey(self.imgBorder_)
	xyd.applyGrey(self.imgBorder2_)

	if self.effect then
		self.effect:setGrey()
	end

	if self.bgEffect then
		self.bgEffect:setGrey()
	end

	if self.effect_tianyi then
		self.effect_tianyi:setGrey()
	end

	if self.bgEffect_tianyi then
		self.bgEffect_tianyi:setGrey()
	end

	for _, v in ipairs(self.stars) do
		xyd.applyGrey(v:GetComponent(typeof(UISprite)))
	end

	for _, v in ipairs(self.redStars) do
		xyd.applyGrey(v:GetComponent(typeof(UISprite)))
	end

	xyd.applyGrey(self:getPartExample("imgOneStar_"))
end

function HeroIcon:setOrigin()
	local uisprite = self.imgIcon_:GetComponent(typeof(UISprite))
	local uiTexture = self.imgIcon_:GetComponent(typeof(UITexture))

	xyd.applyOrigin(uisprite or uiTexture)
	xyd.applyOrigin(self.imgCamp_)
	xyd.applyOrigin(self.imgGroupBg_)
	xyd.applyOrigin(self.imgBorder_)
	xyd.applyOrigin(self.imgBorder2_)
	self:waitForFrame(5, function()
		if self.effect then
			self.effect:setOrigin()
		end

		if self.bgEffect then
			self.bgEffect:setOrigin()
		end

		if self.effect_tianyi then
			self.effect_tianyi:setOrigin()
		end

		if self.bgEffect_tianyi then
			self.bgEffect_tianyi:setOrigin()
		end
	end)

	for _, v in ipairs(self.stars) do
		xyd.applyOrigin(v:GetComponent(typeof(UISprite)))
	end

	for _, v in ipairs(self.redStars) do
		xyd.applyOrigin(v:GetComponent(typeof(UISprite)))
	end

	xyd.applyOrigin(self:getPartExample("imgOneStar_"))
end

function HeroIcon:setMask(visible)
	self:setPartExampleVisible("imgMask_", visible)
end

function HeroIcon:setSwitchIcon(callback, source)
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

function HeroIcon:showLovePoint(lovePoint)
	if self.lovePoint ~= lovePoint then
		self.lovePoint = lovePoint

		if lovePoint and lovePoint >= 100 then
			self:setPartExampleVisible("imgLove", true)

			self.labelLove.text = tostring(math.floor(lovePoint / 100))
		else
			self:setPartExampleVisible("imgLove", false)
		end
	end
end

function HeroIcon:showRedMark(flag)
	if self:getPartVisible("redPointImg") ~= flag then
		if flag then
			self:setPartExampleVisible("redPointImg", true)
		else
			self:setPartExampleVisible("redPointImg", false)
		end
	end
end

function HeroIcon:setIconFrame(frame1, frame2, showEffect)
	if self.imgBorderSource ~= frame1 then
		xyd.setUISprite(self.imgBorder_, xyd.Atlas.COMMON_UI, frame1)
		xyd.setUISprite(self.imgBorder2_, xyd.Atlas.COMMON_UI, frame1)
		self.imgBorder_:MakePixelPerfect()
		self.imgBorder2_:MakePixelPerfect()

		self.imgBorderSource = frame1
	end

	if self.imgGroupBgSource ~= frame2 then
		xyd.setUISprite(self.imgGroupBg_, xyd.Atlas.COMMON_UI, frame2)

		self.imgGroupBgSource = frame2
	end

	if showEffect then
		self:showPetEffect()
	else
		self:hidePetEffect()
	end
end

function HeroIcon:setPetFrame(petID)
	if not petID or petID == 0 then
		if self.frames then
			self:setIconFrame(self.frames[1], self.frames[2])
		end

		return
	end

	local frame, group

	if self.frames[1] ~= "hero_frame3" and self.frames[2] ~= "hero_frame3" then
		frame = PetTable:getPetFrame(petID)
		group = PetTable:getPetFrameGroup(petID)
	else
		frame = self.frames[1]
		group = self.frames[2]
	end

	self:setIconFrame(frame, group, true)
end

function HeroIcon:showPetEffect()
	self.isShowPetEffect = true

	if not self.petEffect then
		self.petEffect = xyd.Spine.new(self.go)

		self.petEffect:setInfo("ui_pet_head", function()
			self.petEffect:setRenderTarget(self.imgGroupBg_, 1)

			if self.panel_ == nil then
				self.petEffect:setRenderPanel(self.renderPanel)
			else
				self.petEffect:setRenderPanel(self.panel_)
			end

			if not self.isShowPetEffect then
				local changeParams = {}

				changeParams.petEffect = false

				self:updateActive(changeParams)
				self.petEffect:stop()

				return
			end
		end)
	end

	self.petEffect:SetLocalScale(1.03, 1.03, 1)
	self.petEffect:play("texiao_01", 0, 1, nil, true, true)
end

function HeroIcon:hidePetEffect()
	self.isShowPetEffect = false

	if self.petEffect then
		local changeParams = {}

		changeParams.petEffect = false

		self:updateActive(changeParams)
		self.petEffect:stop()
	end
end

function HeroIcon:removeGroup()
	local changeParams = {}

	changeParams.imgCamp_ = false
	changeParams.imgGroupBg_ = false

	self:updateActive(changeParams)
end

function HeroIcon:showGroup()
	local changeParams = {}

	changeParams.imgCamp_ = true
	changeParams.imgGroupBg_ = true

	self:updateActive(changeParams)
end

function HeroIcon:setJob(num)
	if self.job_ == num then
		return
	end

	self.job_ = num

	if num > 0 then
		xyd.setUISprite(self:getPartExample("imgJob_"), xyd.Atlas.COMMON_UI, "job_icon" .. num)
	end

	self:setPartExampleVisible("imgJob_", num > 0)
end

function HeroIcon:getJob()
	return self.job_
end

function HeroIcon:getIconRoot()
	return self.go
end

function HeroIcon:getIconSprite()
	return self.imgIconSprite_
end

function HeroIcon:labelNumScale(scale)
	self.labelNumDefaultSize = self.labelNumDefaultSize or self:getPartExample("labelNum_").fontSize
	self:getPartExample("labelNum_").fontSize = math.floor(self.labelNumDefaultSize * scale)
end

function HeroIcon:AddUIDragScrollView()
	if not self.go:GetComponent(typeof(UIDragScrollView)) then
		self.go:AddComponent(typeof(UIDragScrollView))
	end
end

function HeroIcon:setDargScrollView(dragScrollView)
	local drag = self.go:GetComponent(typeof(UIDragScrollView))

	drag = drag or self.go:AddComponent(typeof(UIDragScrollView))
	drag.scrollView = dragScrollView
end

function HeroIcon:setItemIconSize(w, h)
	self.go:GetComponent(typeof(UIWidget)).width = w
	self.go:GetComponent(typeof(UIWidget)).height = h
end

function HeroIcon:setItemIconDepth(depth)
	local selfDepth = self.go:GetComponent(typeof(UIWidget)).depth
	local depthDis = depth - selfDepth

	self:setDepth(depthDis)
end

function HeroIcon:setEntranceTestFinish()
	if self:checkEntranceTestFinish() then
		xyd.setUITextureAsync(self:getPartExample("finishImg"), "Textures/activity_text_web/activity_entrance_test_finish_" .. xyd.Global.lang)
		self:setPartExampleVisible("finishImg", true)
	else
		self:setPartExampleVisible("finishImg", false)
	end
end

function HeroIcon:checkEntranceTestFinish()
	local activityData

	activityData = xyd.models.activity:getActivity(xyd.ActivityID.ENTRANCE_TEST)

	if activityData:checkIsFinish(self.partnerInfo) == true then
		return true
	else
		return false
	end
end

function HeroIcon:setEffect(flag, effectName, params)
	local playname = "texiao01"
	local playCount = 0
	local group = self:getCheckGroup()

	if effectName and not self.effect and not self.effect_tianyi then
		self.effectName_ = effectName

		local tempEffect

		tempEffect = xyd.Spine.new(self:getPartExample("gEffect").gameObject)

		tempEffect:setInfo(self.effectName_, function()
			if params then
				if params.panel_ then
					tempEffect:setRenderPanel(params.panel_)
				end

				if effectName == "fx_ui_bp_available" and not params.effectPos then
					params.effectPos = Vector3(3, 7, 0)
					params.effectScale = Vector3(1.1, 1.1, 1.1)
				end

				if params.effectPos then
					tempEffect:SetLocalPosition(params.effectPos.x, params.effectPos.y, params.effectPos.z)
				end

				if params.effectScale then
					tempEffect:SetLocalScale(params.effectScale.x, params.effectScale.y, params.effectScale.z)
				end

				if params.target_ then
					tempEffect:setRenderTarget(params.target_, 5)
				else
					tempEffect:setRenderTarget(self:getPartExample("gEffect"):GetComponent(typeof(UITexture)), 5)
				end

				if params.playname then
					playname = params.playname
				end

				if params.playCount then
					playCount = params.playCount
				end
			end

			tempEffect:play(playname, playCount)
		end)

		if group and group == xyd.PartnerGroup.TIANYII then
			self.effect_tianyi = tempEffect
		else
			self.effect = tempEffect
		end
	end

	if group and group == xyd.PartnerGroup.TIANYII then
		if self.effect_tianyi then
			self.effect_tianyi:SetActive(true)

			if params and params.playname then
				playname = params.playname
			end

			if params and params.playCount then
				playCount = params.playCount
			end

			self.effect_tianyi:play(playname, playCount)
		end
	elseif self.effect then
		self.effect:SetActive(true)

		if params and params.playname then
			playname = params.playname
		end

		if params and params.playCount then
			playCount = params.playCount
		end

		self.effect:play(playname, playCount)
	end

	self:setPartExampleVisible("gEffect", flag)

	if group and group == xyd.PartnerGroup.TIANYII and self.effect_tianyi then
		return self.effect
	end

	if self.effect then
		return self.effect
	end
end

function HeroIcon:setBackEffect(flag, effectName, playName, params)
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

	if self.backEffect then
		return self.backEffect
	end
end

function HeroIcon:iosTestChangeUI1()
	xyd.setUISprite(self.imgBorder_, nil, self.frames[1] .. "_ios_test")
	xyd.setUISprite(self.imgBorder2_, nil, self.frames[1] .. "_ios_test")
	xyd.setUISprite(self.imgGroupBg_, nil, self.frames[2] .. "_ios_test")
	xyd.setUISprite(self.imgCamp_, nil, "img_group" .. tostring(self.camp) .. "_ios_test")
	xyd.setUISprite(self:getPartExample("imgJob_"), nil, "job_icon" .. self.job_ .. "_ios_test")
	xyd.setUISprite(self:getPartExample("imgDebris_"), nil, "debris_icon_ios_test")
	xyd.setUISprite(self:getPartExample("imgChoose_"), nil, "select_ios_test")
	xyd.setUISprite(self:getPartExample("imgLock_"), nil, "lock_icon_ios_test")
end

function HeroIcon:setStarsState(flag)
	self:setPartExampleVisible("groupStars_", flag)
end

function HeroIcon:showLightEffect()
	if not self.saoguangEffect then
		self.saoguangEffect = xyd.Spine.new(self:getPartExample("gEffect").gameObject)

		self.saoguangEffect:setInfo("fx_ui_txsaoguang", function()
			self.saoguangEffect:SetLocalScale(0.85, 0.85, 0.85)
			self.saoguangEffect:play("texiao01", 0, 1)
		end)
	else
		self.saoguangEffect:play("texiao01", 0, 1)
	end
end

function HeroIcon:setLockImgVisible(visible)
	self:setPartExampleVisible("imgLock_", visible)
end

function HeroIcon:setBlueMask(visible)
	self:setPartExampleVisible("imgMask_", visible)
	xyd.setUISpriteAsync(self:getPartExample("imgMask_"), nil, "9gongge46", nil, nil)

	self:getPartExample("imgMask_").depth = 70
end

function HeroIcon:setPartValueVisible(name, visible)
	self:setPartExampleVisible(name, visible)
end

function HeroIcon:setLabelNumScale(scale)
	self:labelNumScale(scale)
end

function HeroIcon:getGEffectObj()
	return self:getPartExample("gEffect")
end

function HeroIcon:initEquipId(equip_id)
	if equip_id and equip_id > 0 then
		local src = xyd.tables.itemTable:getIcon(equip_id)

		if not self.imgAvatar_uiSprite then
			NGUITools.DestroyChildren(self:getPartExample("equipAvatar").transform)

			self.imgAvatar = NGUITools.AddChild(self:getPartExample("equipAvatar").gameObject, self.imgIcon_.gameObject)
			self.imgAvatar_imgBg = NGUITools.AddChild(self:getPartExample("equipAvatar").gameObject, self.imgIcon_.gameObject)
			self.imgAvatar_uiSprite = self.imgAvatar:GetComponent(typeof(UISprite))
			self.imgAvatar_imgBg_uiSprite = self.imgAvatar_imgBg:GetComponent(typeof(UISprite))
		end

		local imgBg_uiSprite_img = "quality_" .. xyd.tables.itemTable:getQuality(equip_id)

		if self.imgAvatar_uiSprite_src and self.imgBg_uiSprite_src and self.imgAvatar_uiSprite_src == src and self.imgBg_uiSprite_src == imgBg_uiSprite_img then
			-- block empty
		else
			self.imgAvatar_uiSprite_src = src
			self.imgBg_uiSprite_src = imgBg_uiSprite_img

			xyd.setUISpriteAsync(self.imgAvatar_uiSprite, nil, tostring(src), nil, nil)
			xyd.setUISpriteAsync(self.imgAvatar_imgBg_uiSprite, nil, imgBg_uiSprite_img, nil, nil)
		end

		self.imgAvatar_uiSprite.width = 36
		self.imgAvatar_uiSprite.height = 36
		self.imgAvatar_uiSprite.depth = self:getPartExample("equipAvatar"):GetComponent(typeof(UIWidget)).depth + 6
		self.imgAvatar_imgBg_uiSprite.width = 42
		self.imgAvatar_imgBg_uiSprite.height = 42
		self.imgAvatar_imgBg_uiSprite.depth = self:getPartExample("equipAvatar"):GetComponent(typeof(UIWidget)).depth + 5

		self:setPartExampleVisible("equipAvatar", true)
	else
		self:setPartExampleVisible("equipAvatar", false)
	end
end

function HeroIcon:showBorderBg(flag)
	if self.imgBorder_ then
		self.imgBorder_:SetActive(flag)
	end

	if self.imgBorder2_ then
		self.imgBorder2_:SetActive(flag)
	end

	if self.imgGroupBg_ then
		self.imgGroupBg_:SetActive(flag)
	end
end

function HeroIcon:setCallBack(fun)
	self.callback = fun
end

function HeroIcon:getCheckGroup()
	local group = self.partnerGroup

	if group == nil or group == 0 then
		local heroID = self.partnerInfo.itemID or self.partnerInfo.tableID or self.partnerInfo.table_id

		heroID = heroID and tonumber(heroID)

		if heroID and heroID > 0 then
			group = xyd.tables.partnerTable:getGroup(heroID)
		end

		if group == nil and heroID and heroID > 0 then
			group = xyd.tables.itemTable:getGroup(heroID)
		end
	end

	return group
end

function HeroIcon:checkTianyiAvatar(heroIcon, heroID)
	local group = self:getCheckGroup()

	if group and group > 0 and group == xyd.PartnerGroup.TIANYI then
		local star = self.partnerInfo.star or PartnerTable:getStar(heroID)
		local showIDs = xyd.tables.partnerTable:getShowIdsWithNum(heroID)

		if star >= 15 then
			heroIcon = EquipTable:getSkinAvatar(showIDs[3])
		elseif star >= 13 then
			heroIcon = EquipTable:getSkinAvatar(showIDs[2])
		end
	end

	return heroIcon
end

function HeroIcon:changeBorderImg(imgName)
	if not imgName then
		if self.anotherImgBorder then
			self.anotherImgBorder:SetActive(false)
		end

		self.imgBorder_:SetActive(true)
		self.imgBorder2_:SetActive(true)

		return
	end

	if not self.anotherImgBorder then
		self.anotherImgBorder = NGUITools.AddChild(self.go.gameObject, self.imgBorder_.gameObject).gameObject
		self.anotherImgBorderUISprite = self.anotherImgBorder:GetComponent(typeof(UISprite))

		xyd.setUISpriteAsync(self.anotherImgBorderUISprite, nil, imgName)

		self.anotherImgBorderUISprite.width = 108
		self.anotherImgBorderUISprite.height = 108
		self.anotherImgBorder:GetComponent(typeof(UIWidget)).pivot = UIWidget.Pivot.Center

		self.anotherImgBorder:X(0)
	end

	self.imgBorder_:SetActive(false)
	self.imgBorder2_:SetActive(false)
end

function HeroIcon:setGEffectShow(flag)
	self:setPartExampleVisible("gEffect", flag)
end

return HeroIcon
