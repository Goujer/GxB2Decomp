-- chunkname: @../../../Product/Bundles/Android/src/app/components/PartnerImg.lua

local PartnerImg = class("PartnerImg", import(".BaseComponent"))
local GirlsModelLite = import("app.components.GirlsModelLite")

function PartnerImg:ctor(partnerGo)
	PartnerImg.super.ctor(self, partnerGo)

	self.showResLoading_ = false
	self.noAddQueen = false
end

function PartnerImg:getPrefabPath()
	return "Prefabs/Components/partner_img"
end

function PartnerImg:initUI()
	PartnerImg.super.initUI(self)

	self.groupPic = self.go:NodeByName("groupPic").gameObject
	self.body_ = self.groupPic:ComponentByName("body_", typeof(UITexture))
	self.face_ = self.groupPic:ComponentByName("face_", typeof(UISprite))
	self.groupModel = self.go:NodeByName("groupModel").gameObject
end

function PartnerImg:setImgSource(pic, face, facePos, faceScale)
	if not pic then
		return
	end

	if pic == self.tar_src_ then
		xyd.setUITextureByNameAsync(self.body_, pic, true, function()
			if not self.body_ then
				return
			end

			if self.setImgCallBack_ then
				self.setImgCallBack_()

				self.setImgCallBack_ = nil
			end

			if self.params.onComplete then
				self.params.onComplete()
			end
		end)

		if face then
			xyd.setUISpriteAsync(self.face_, nil, face, function()
				if not self.face_ then
					return
				end

				self.face_:MakePixelPerfect()
				self.face_:SetLocalScale(faceScale, faceScale, 1)

				if facePos then
					self:setFacePos(facePos.x, facePos.y, faceScale)
				end
			end)
		end
	end
end

function PartnerImg:setImg(params, callback)
	if not params then
		self.groupPic:SetActive(false)
		self.groupModel:SetActive(false)
		NGUITools.DestroyChildren(self.groupModel.transform)

		self.body_.mainTexture = nil
		self.face_.atlas = nil

		return
	end

	self.params = params
	self.noAddQueen = params.noAddQueen
	self.setImgCallBack_ = callback

	if params.showResLoading ~= nil then
		self:setShowResLoading(params.showResLoading)
	end

	self.girl_model_height_ = params.girl_model_height

	local dragonBoneID = params.itemID and xyd.tables.partnerPictureTable:getDragonBone(params.itemID) or params.modelName

	if dragonBoneID and dragonBoneID ~= 0 then
		self:loadModel(dragonBoneID)

		return 1
	else
		self:loadPic(params)

		return 0
	end
end

function PartnerImg:isDragonBone()
	return self.isDragonBone_
end

function PartnerImg:loadModel(id)
	self.isModel_ = true

	NGUITools.DestroyChildren(self.groupModel.transform)
	self.groupPic:SetActive(false)
	self.groupModel:SetActive(true)

	local not_specail = self.params.not_specail

	self.girlModel_ = GirlsModelLite.new(self.groupModel, {
		id = id,
		layer = self.parentGo.layer,
		callback = self.setImgCallBack_,
		not_specail = not_specail
	})

	if self.girl_model_height_ then
		self.girlModel_:setBgHeight(self.girl_model_height_)
	end

	self.isDragonBone_ = true
end

function PartnerImg:playSpecailComeout(callback)
	if self.girlModel_ then
		self.girlModel_:playSpecailComeout(callback)
	end
end

function PartnerImg:effectClickFunction()
	if self.girlModel_ then
		self.girlModel_:playClickAction2()
	end
end

function PartnerImg:loadPic(params)
	self.isDragonBone_ = false

	NGUITools.DestroyChildren(self.groupModel.transform)
	self:waitForFrame(2, function()
		self.groupPic:SetActive(true)
	end)
	self.groupModel:SetActive(false)

	local bodySource, bodySrc, faceSource
	local facePos = {
		x = 0,
		y = 0
	}
	local needLoad = {}

	if params.itemID then
		self.tar_src_ = xyd.tables.partnerPictureTable:getPartnerPic(params.itemID)
		bodySrc = self.tar_src_

		local faceID

		if params.faceID then
			faceID = params.faceID
		else
			faceID = xyd.tables.partnerPictureTable:getFace(params.itemID)
		end

		if faceID and faceID > 0 then
			faceSource = tostring(bodySrc) .. "_emo_" .. tostring(faceID)
			facePos = xyd.tables.partnerPictureTable:getFacePos(params.itemID)
		end
	elseif params.picBody then
		self.tar_src_ = params.picBody
		bodySrc = self.tar_src_

		if params.picFace and params.picFace ~= "" then
			faceSource = tostring(params.picFace)
		end

		if params.facePos then
			facePos = params.facePos
		end
	elseif params.girlImg then
		self.tar_src_ = xyd.tables.girlsImgTable:getResource(params.girlImg)
		bodySrc = self.tar_src_
	end

	bodySource = bodySrc
	self.tar_src_ = bodySource

	table.insert(needLoad, xyd.getTexturePath(bodySource))

	if faceSource then
		local facePath = xyd.getSpritePath(faceSource)

		table.insert(needLoad, facePath)
	end

	ResCache.DownloadAssets("partnerImg" .. xyd.getTimeKey(), needLoad, function(success)
		if not self then
			return
		end

		if bodySource == self.tar_src_ then
			self.facePos = facePos
			self.faceScale = params.faceScale

			self:setImgSource(bodySource, faceSource, facePos, params.faceScale)
		end

		if bodySrc == self.tar_src_ and self.showResLoading_ then
			xyd.WindowManager.get():closeWindow("res_loading_window")
		end
	end, function(progress)
		if not self then
			return
		end

		if self.showResLoading_ then
			self:showResLoading(progress, 500)
		end
	end)
end

function PartnerImg:getFacePos()
	return self.facePos or {
		0,
		0
	}, self.faceScale or 1
end

function PartnerImg:setFacePos(x, y, faceScale)
	local size = xyd.split(xyd.Textures2Config.table_map[self.tar_src_], "|", true)

	self.face_:SetLocalPosition(x + self.face_.width / 2 * faceScale - size[2] / 2, size[3] / 2 - y - self.face_.height / 2 * faceScale, 0)
end

function PartnerImg:showResLoading(progress, timeDelay)
	if not self.params then
		return
	end

	if not xyd.tables.windowTable:isShowResLoading(self.params.windowName or nil) then
		return
	else
		timeDelay = timeDelay or xyd.tables.windowTable:getResLoadingDelay(self.params.windowName)
	end

	local wnd = xyd.WindowManager.get():getWindow("res_loading_window")

	if progress == 1 and not wnd then
		return
	end

	if not wnd then
		wnd = xyd.WindowManager.get():openWindow("res_loading_window", {
			delta_y = -150,
			hide_mask = true,
			can_touch = true,
			timeDelay = timeDelay
		})

		wnd:setLoadWndName(self.params.windowName)
	end

	if not wnd:isCurLoading(self.params.windowName) then
		return
	end

	wnd:setLoadProgress(self.params.windowName, progress)
end

function PartnerImg:setShowResLoading(flag)
	if flag == nil then
		flag = false
	end

	self.showResLoading_ = flag
end

function PartnerImg:getItemID()
	if self.params then
		return self.params.itemID
	end

	return 0
end

function PartnerImg:getBody()
	return self.body_.mainTexture
end

function PartnerImg:setFaceImg(path_, alpha)
	if alpha == nil then
		alpha = 1
	end

	self.face_.mainTexture = path_
	self.face_:GetComponent(typeof(UIWidget)).alpha = alpha
end

function PartnerImg:SetLocalPositionFun(x, y, z)
	self.go:SetLocalPosition(x, y, z)
end

function PartnerImg:getPicSrc()
	return self.tar_src_
end

return PartnerImg
