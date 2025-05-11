-- chunkname: @../../../Product/Bundles/Android/src/app/components/PartnerSummonEffect.lua

local PartnerSummonEffect = class("PartnerSummonEffect", import(".BaseComponent"))
local Partner = import("app.models.Partner")
local PartnerPictureTable = xyd.tables.partnerPictureTable
local GirlsModelTable = xyd.tables.girlsModelTable
local PartnerTextTable = xyd.tables.partnerTextTable

function PartnerSummonEffect:ctor(parentGo, partnerItem)
	PartnerSummonEffect.super.ctor(self, parentGo)

	self.partnerItem = partnerItem
	self.four_effect = nil
	self.five_effect = nil
	self.effect_name4_ = "fx_ui_newgirl_gainp"
	self.effect_name5_ = "fx_ui_newgirl_gaino"
	self.effect_name6_ = "fx_ui_newskin_gain"
	self.star_effect_name_ = "fx_ui_newgirl_gain_star"
	self.effect_name_ = ""
	self.collect_res_ = {}
	self.destory_res_ = true
	self.wnd_name_ = "summon_effect_res_window"
	self.isSkinNew = false
	self.new_skin_camera = "fx_ui_newskin_show"
end

function PartnerSummonEffect:initUI()
	PartnerSummonEffect.super.initUI(self)

	self.effectGroup = self.go:NodeByName("effectGroup").gameObject
	self.starGroup = self.go:NodeByName("starGroup").gameObject
	self.girlNode = self.go:NodeByName("girl").gameObject
	self.cameraNode = self.go:NodeByName("camera").gameObject
	self.cvNode = self.go:NodeByName("cv").gameObject
	self.nameNode = self.go:NodeByName("name").gameObject
	self.groupNode = self.go:NodeByName("group").gameObject
	self.starNode = self.go:NodeByName("star").gameObject
	self.labelStar = self.starNode:ComponentByName("labelStar", typeof(UILabel))
	self.labelCv = self.cvNode:ComponentByName("labelCv", typeof(UILabel))
	self.labelName = self.nameNode:ComponentByName("labelName", typeof(UILabel))
	self.imgGroup = self.groupNode:ComponentByName("imgGroup", typeof(UISprite))
	self.imgGirl = self.girlNode:ComponentByName("imgGirl", typeof(UITexture))
	self.skinChatNode = self.go:NodeByName("skinChat").gameObject
	self.skinChatLabel = self.skinChatNode:ComponentByName("skinChatLabel", typeof(UILabel))
end

function PartnerSummonEffect:getPrefabPath()
	return "Prefabs/Components/partner_summon_effect"
end

function PartnerSummonEffect:start()
	if self.effect then
		self.effect:resume()
	end

	if self.star_effect then
		self.star_effect:resume()
	end
end

function PartnerSummonEffect:stop()
	if self.effect then
		self.effect:pause()
	end

	if self.star_effect then
		self.star_effect:pause()
	end
end

function PartnerSummonEffect:setInfo(params, callback)
	self.skin_id_ = params.skin_id
	self.table_id_ = params.table_id or self:getTableIDBySkinID(self.skin_id_)
	self.star_ = params.star

	if self.skin_id_ then
		local is_show_by_camera = xyd.tables.partnerPictureTable:getShowByCamera(self.skin_id_)

		if is_show_by_camera and is_show_by_camera == 1 and not self.partnerItem.params_.notShowCamera then
			self.isSkinNew = true
		else
			self.isSkinNew = false
		end
	end

	self:createEffect(callback)
end

function PartnerSummonEffect:createEffect(callback)
	if not self.table_id_ and not self.skin_id_ then
		return
	end

	local partner = Partner.new()
	local noUpdateAttrs = false

	if self.star_ and self.star_ > 0 then
		noUpdateAttrs = true
	end

	partner:populate({
		table_id = self.table_id_,
		star = self.star_,
		noUpdateAttrs = noUpdateAttrs
	})

	self.partner_ = partner

	local star = partner:getStar()

	if self.skin_id_ or star >= 5 then
		self.effect_name_ = self.effect_name5_

		if self.skin_id_ then
			self.effect_name_ = self.effect_name6_
		end

		if not self.skin_id_ or not self.isSkinNew == true then
			xyd.SoundManager.get():playSound(2133)
		end

		if not self.skin_id_ then
			self:waitForFrame(60, function()
				xyd.SoundManager.get():playSound(xyd.SoundID.GAIN_HERO_STAR_5)
			end)
		end
	else
		self.effect_name_ = self.effect_name4_
	end

	local res = self:collectRes(partner)
	local allHasRes = xyd.isAllPathLoad(res)

	local function startEffect()
		if self.effect then
			self.effect:destroy()

			self.effect = nil
		end

		if not self.effect then
			self.effect = xyd.Spine.new(self.effectGroup)

			self.effect:setInfo(self.effect_name_, function()
				self.effect:setSeparatorDuration(21)
				self:initEffect(partner)

				if partner:getStar() < 5 then
					self:addStarEffect(callback)
				else
					if self.star_effect then
						self.star_effect:destroy()

						self.star_effect = nil
					end

					callback()
				end
			end)
		end
	end

	if allHasRes then
		startEffect()

		return
	else
		ResCache.DownloadAssets("partner_summon_effect", res, function(success)
			if tolua.isnull(self.go) then
				return
			end

			startEffect()
		end, function(progress)
			self:showResLoading(progress)
		end, 1)
	end
end

function PartnerSummonEffect:addStarEffect(callback)
	if not self.star_effect then
		self.star_effect = xyd.Spine.new(self.starGroup)

		self.star_effect:setInfo(self.star_effect_name_, function()
			callback()
		end)
	else
		callback()
	end
end

function PartnerSummonEffect:showResLoading(progress)
	local wnd = xyd.WindowManager.get():getWindow("res_loading_window")

	if progress == 1 and not wnd then
		return
	end

	if not wnd then
		wnd = xyd.WindowManager.get():openWindow("res_loading_window", {
			can_touch = true
		})

		wnd:setLoadWndName(self.wnd_name_)
	end

	if not wnd:isCurLoading(self.wnd_name_) then
		return
	end

	wnd:setLoadProgress(self.wnd_name_, progress)
end

function PartnerSummonEffect:replacePartner(partner)
	print("self.isSkinNew    ", self.isSkinNew)

	if self.skin_id_ and self.isSkinNew == true then
		local effect_camera = xyd.Spine.new(self.cameraNode)

		self.effect_camera = effect_camera

		effect_camera:setInfo(self.new_skin_camera, function()
			effect_camera:SetLocalPosition(-360 * xyd.Global.getRealWidth() / 720, 693, 0)

			local scale_camera = xyd.Global.getRealWidth() / 720

			print("realwidth=====================", xyd.Global.getRealWidth())
			effect_camera:SetLocalScale(scale_camera, scale_camera, scale_camera)
			effect_camera:play("idle", 0)
		end)
	end

	local xy = PartnerPictureTable:getPartnerPicXY(self.skin_id_ or self.table_id_)
	local scale = PartnerPictureTable:getShowEffectScale(self.skin_id_ or self.table_id_)
	local girl_id = PartnerPictureTable:getDragonBone(self.skin_id_)

	if self.effectGirl_ then
		self.effectGirl_:destroy()

		self.effectGirl_ = nil
	end

	if girl_id and girl_id ~= 0 then
		local effName = GirlsModelTable:getResource(girl_id)
		local effect = xyd.Spine.new(self.girlNode)

		effect:setInfo(effName, function()
			self.effect:setRenderTarget(self.effectGroup:GetComponent(typeof(UIWidget)), 1)
			print("self.isSkinNew    ", self.isSkinNew)

			if self.skin_id_ and self.isSkinNew == true then
				effect:SetLocalPosition(-360, 693 - 65 * xyd.Global.getRealWidth() / 720, 0)
				self:setBaseViewVisible(false)
				effect:playWithEvent("animation_show", 1, 1, {
					Complete = function()
						if self.effect_camera then
							self.effect_camera:playWithEvent("end", 1, 1, {
								switch = function()
									self:setBaseViewVisible(true)
									effect:play("animation", 0)
									effect:SetLocalPosition(scale * xy.x, -scale * xy.y - 200, 0)
									effect:SetLocalScale(scale, scale, scale)
									xyd.SoundManager.get():playSound(2133)
									xyd.SoundManager.get():playSound(xyd.SoundID.CAMERA_CUT)
									self.effect:setPlayNeedStop(true)
									self.effect:play("texiao01", 1, 1, function()
										self.effect:setPlayNeedStop(false)
										self.effect:play("texiao02", 0)

										local summonEffectRedWin = xyd.WindowManager.get():getWindow("summon_effect_res_window")

										if summonEffectRedWin then
											summonEffectRedWin:setWaitState(true)
										end
									end)

									if self.partnerItem and self.partnerItem.skipBtn then
										xyd.setTouchEnable(self.partnerItem.skipBtn.gameObject, true)
									end
								end
							})
						end
					end,
					cut = function()
						if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.2.56") <= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "1.1.66") <= 0 then
							-- block empty
						else
							self.effect_camera:setPlayNeedStop(true)
						end

						xyd.SoundManager.get():playSound(xyd.SoundID.CAMERA_CUT)
						self.effect_camera:play("cut", 1, 1, function()
							self.effect_camera:setPlayNeedStop(false)
							self.effect_camera:play("idle", 0)
						end)
						self.effect_camera:startAtFrame(0)
					end
				})
				effect:startAtFrame(0)
			else
				effect:SetLocalPosition(scale * xy.x, -scale * xy.y - 200, 0)
				effect:SetLocalScale(scale, scale, scale)
				effect:play(GirlsModelTable:getTexiaoName(girl_id), 0)
			end
		end)

		self.effectGirl_ = effect
	else
		local spriteName = self:getSpriteName(partner)

		xyd.setUITextureByNameAsync(self.imgGirl, spriteName, true)
		self.imgGirl:SetLocalPosition(xy.x, -xy.y + 150, 0)

		local staticImgScale = PartnerPictureTable:getShowScaleSpecial(self.skin_id_ or self.table_id_)

		if staticImgScale and staticImgScale ~= 0 and staticImgScale ~= 1 then
			self.imgGirl:SetLocalScale(staticImgScale, staticImgScale, 1)
		end
	end

	if self.effect then
		self.effect:followBone("juese", self.girlNode)
		self.effect:followSlot("juese", self.girlNode)
	end
end

function PartnerSummonEffect:setBaseViewVisible(visible)
	self.skinChatLabel.gameObject:SetActive(visible)
	self.labelName.gameObject:SetActive(visible)
	self.labelCv.gameObject:SetActive(visible)
	self.imgGroup.gameObject:SetActive(visible)
end

function PartnerSummonEffect:replaceCV(partner)
	if self.effect then
		self.effect:followBone("cv", self.cvNode)
		self.effect:followSlot("cv", self.cvNode)
	end

	local str = ""
	local color = 1244165119

	if self.skin_id_ or partner:getStar() >= 5 then
		color = 1932929279
	end

	if self.skin_id_ then
		str = PartnerTextTable:getName(partner:getTableID())
	else
		local name = PartnerTextTable:getCVName(partner:getTableID())

		str = (not name or name == "") and "" or __("GAIN_PARTNER_CV", name)
	end

	xyd.setLabel(self.labelCv, {
		text = str,
		color = color
	})
end

function PartnerSummonEffect:replaceName(partner)
	local effect = self.effect
	local label = self.labelName

	if self.skin_id_ then
		label.text = xyd.tables.itemTextTable:getName(self.skin_id_)
	else
		label.text = PartnerTextTable:getName(partner:getTableID())
	end

	if effect then
		if self.skin_id_ and (xyd.Global.lang == "fr_fr" or xyd.Global.lang == "de_de" or xyd.Global.lang == "en_en") then
			self.labelName.fontSize = 36

			self.labelName:X(-50)
		end

		effect:followBone("name", self.nameNode)
		effect:followSlot("name", self.nameNode)
	end
end

function PartnerSummonEffect:replaceGroup(partner)
	local effect = self.effect

	if self.skin_id_ then
		xyd.setUISpriteAsync(self.imgGroup, nil, "icon_skin")
	else
		local groupSpriteName = self:getGroupSpriteName(partner)

		xyd.setUISpriteAsync(self.imgGroup, nil, groupSpriteName)
	end

	if effect then
		effect:followBone("zhiye", self.groupNode)
		effect:followSlot("zhiye", self.groupNode)
	end
end

function PartnerSummonEffect:replaceChatLabel(partner)
	local effect = self.effect

	if self.skin_id_ then
		local text = xyd.tables.equipTextTable:getSkinDesc(self.skin_id_)

		self.skinChatLabel.text = text

		if effect then
			effect:followBone("mmp_2", self.skinChatNode)
			effect:followSlot("duihua", self.skinChatNode)
		end
	else
		return
	end
end

function PartnerSummonEffect:replaceStarLabel(partner)
	if self.effect_name_ ~= self.effect_name5_ then
		return
	end

	if self.effect then
		self.effect:followBone("star_num", self.starNode)
		self.effect:followSlot("star_num", self.starNode)
	end

	local star = partner:getStar()

	if star > 10 then
		star = star - 10
		self.labelStar.text = star
	else
		return
	end
end

function PartnerSummonEffect:updateStar(partner)
	local effect = self.effect

	if not effect then
		return
	end

	local star = partner:getStar()
	local sufix = "xing"

	if star <= 5 then
		local keys = {}

		for i = star + 1, 5 do
			local key = i .. sufix

			table.insert(keys, key)
		end

		effect:hideSlots(keys)
	end
end

function PartnerSummonEffect:updateTextImg()
	local effect = self.effect

	if not effect then
		return
	end

	if self.skin_id_ and (self.isSkinNew ~= false or true) then
		-- block empty
	else
		effect:setSlot("skin", "character")
	end
end

function PartnerSummonEffect:initEffect(partner)
	self:replacePartner(partner)
	self:replaceCV(partner)
	self:replaceName(partner)
	self:replaceGroup(partner)
	self:replaceChatLabel(partner)
	self:replaceStarLabel(partner)
	self:updateStar(partner)
	self:updateTextImg()

	if self.effect then
		self.effect:hideSlots({
			"zhiye",
			"cv",
			"name"
		})
	end

	if self.skin_id_ then
		self.effect:hideSlots({
			"duihua"
		})
	end
end

function PartnerSummonEffect:play(animation, count, callback)
	if self.effect:hasAnimationName(animation) == false then
		return
	end

	if self.skin_id_ and self.isSkinNew == true then
		self.effect:play("skin01", 0)

		return
	end

	self.effect:play(animation, count, 1, function()
		if callback and self.partner_:getStar() >= 5 then
			callback()
		end
	end)

	if self.partner_:getStar() < 5 then
		if not self.star_effect:isValid() then
			callback()

			return
		end

		self.star_effect:SetLocalPosition(1500, 0, 0)
		self.star_effect:play("texiao0" .. tostring(self.partner_:getStar()), 1, 1, function()
			if callback then
				callback()
			end
		end)
		self:waitForFrame(12, function()
			if self.partner_:getStar() == 3 then
				xyd.SoundManager.get():playSound(xyd.SoundID.GAIN_HERO_STAR_3)
			elseif self.partner_:getStar() == 4 then
				xyd.SoundManager.get():playSound(xyd.SoundID.GAIN_HERO_STAR_4)
			end
		end)
		self:waitForFrame(1, function()
			self.star_effect:SetLocalPosition(0, 0, 0)
		end)
	end
end

function PartnerSummonEffect:collectRes(partner)
	local res = {}
	local need_clean = {}
	local effect_res = xyd.getEffectFilesByNames({
		self.effect_name_
	})

	if partner:getStar() < 5 then
		local star_effect_res = xyd.getEffectFilesByNames({
			self.star_effect_name_
		})

		res = xyd.arrayMerge(res, star_effect_res)
		need_clean = xyd.arrayMerge(need_clean, res)
	end

	res = xyd.arrayMerge(res, effect_res)
	need_clean = xyd.arrayMerge(need_clean, effect_res)

	local girl_id = PartnerPictureTable:getDragonBone(self.skin_id_)

	if girl_id then
		local res_name = GirlsModelTable:getResource(girl_id)
		local effect_res = xyd.getEffectFilesByNames({
			res_name
		})

		res = xyd.arrayMerge(res, effect_res)

		if self.destory_res_ then
			need_clean = xyd.arrayMerge(need_clean, effect_res)
		end
	else
		local spriteName = self:getSpritePath(partner)

		table.insert(res, spriteName)

		if self.destory_res_ then
			table.insert(need_clean, spriteName)
		end
	end

	if self.skin_id_ and self.isSkinNew == true then
		local effect_res = xyd.getEffectFilesByNames({
			self.new_skin_camera
		})

		res = xyd.arrayMerge(res, effect_res)

		if self.destory_res_ then
			need_clean = xyd.arrayMerge(need_clean, effect_res)
		end

		if self.partnerItem and self.partnerItem.skipBtn then
			xyd.setTouchEnable(self.partnerItem.skipBtn.gameObject, false)
		end
	end

	self:addCollectRes(need_clean)

	return res
end

function PartnerSummonEffect:getSpritePath(partner)
	local res = xyd.getPicturePath(self.skin_id_, partner)

	return res
end

function PartnerSummonEffect:getSpriteName(partner)
	if self.skin_id_ then
		local src = PartnerPictureTable:getPartnerPic(self.skin_id_)

		return src
	end

	return partner:getPartnerPic()
end

function PartnerSummonEffect:getGroupSpriteName(partner)
	local group = partner:getGroup()

	return "img_group" .. group
end

function PartnerSummonEffect:getTableIDBySkinID(skin_id)
	local list = PartnerPictureTable:getSkinPartner(skin_id)

	if not list then
		return nil
	end

	local PartnerTable = xyd.tables.partnerTable

	for i = 1, #list do
		if PartnerTable:getStar(list[i]) == 5 then
			return list[i]
		end
	end

	return list[1]
end

function PartnerSummonEffect:addCollectRes(res)
	for _, r in ipairs(res) do
		if xyd.arrayIndexOf(self.collect_res_, r) == -1 then
			table.insert(self.collect_res_, r)
		end
	end
end

return PartnerSummonEffect
