-- chunkname: @../../../Product/Bundles/Android/src/app/common/ActivityEffectPlayer.lua

local ActivityEffectPlayer = class("ActivityEffectPlayer")

function ActivityEffectPlayer:ctor(params)
	self.effectList = {
		self.fadeIn,
		self.leftSlideIn,
		self.rightSlideIn,
		self.jumpIn,
		self.fadeInAndShake,
		self.fadeOut,
		self.leftSlideOut,
		self.rightSlideOut,
		self.shrinkOut,
		self.shake,
		self.actionIn,
		self.out,
		self.leftRightSlowShake,
		self.leftRightQuickShake,
		self.leftRightSlowShakeAfterFirst,
		self.leftRightQuickShakeAfterFirst,
		self.dashOut,
		self.mirror,
		self.colorFlip,
		self.shenWei,
		self.leftSlideInWithHorVer,
		self.constantlyShake,
		self.constantlyQuickShake,
		self.upDownShake,
		self.upDownQuickShake,
		self.downSlideIn,
		self.upSlideIn,
		self.showPartnerPicture,
		self.downSlideOut
	}

	if params == nil then
		params = {}
	end
end

function ActivityEffectPlayer:play(type, obj, timelinelite, params, timeScale, needClear)
	if params == nil then
		params = {}
	end

	if timeScale == nil then
		timeScale = 1
	end

	if needClear == nil then
		needClear = true
	end

	if needClear then
		-- block empty
	end

	if type <= 0 or type == nil then
		local callback = params.callback

		if callback then
			callback()
		end

		return
	end

	self.sequence = timelinelite

	self.effectList[type](self, obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:fadeIn(obj, timelinelite, timeScale, params)
	local x, y
	local transform = obj.transform

	if params.x == nil then
		x = transform.localPosition.x
	else
		obj:SetLocalPosition(params.x, transform.localPosition.y, 0)

		x = params.x
	end

	if params.y == nil then
		y = transform.localPosition.y
	else
		y = params.y
	end

	local final_alpha = params.alpha or 1
	local callback = params.callback
	local w = obj:GetComponent(typeof(UIWidget))

	timelinelite:Append(transform:DOLocalMove(Vector3(x, y, 0), 0.5 * timeScale)):Join(xyd.getTweenAlpha(w, final_alpha, 0.5 * timeScale))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:leftSlideIn(obj, timelinelite, timeScale, params)
	local x, y
	local transform = obj.transform

	if params.x == nil then
		x = transform.localPosition.x
	else
		x = params.x
	end

	if params.y == nil then
		y = transform.localPosition.y
	else
		y = params.y
	end

	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = 1

	local callback = params.callback

	timelinelite:Append(transform:DOLocalMove(Vector3(x, y, 0), 0.5 * timeScale))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:rightSlideIn(obj, timelinelite, timeScale, params)
	self:leftSlideIn(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:jumpIn(obj, timelinelite, timeScale, params)
	local callback = params.callback
	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = 1

	local transform = obj.transform
	local curScaleX = transform.localScale.x
	local curScaleY = transform.localScale.y

	timelinelite:Append(transform:DOScale(Vector3(curScaleX * 1.7, curScaleY * 1.7, 1), 0.17)):Append(transform:DOScale(Vector3(curScaleX * 0.8, curScaleY * 0.8, 1), 0.25)):Append(transform:DOScale(Vector3(curScaleX * 1.7, curScaleY * 1.7, 1), 0.11)):Append(transform:DOScale(Vector3(curScaleX * 1.1, curScaleY * 1.1, 1), 0.09)):Append(transform:DOScale(Vector3(curScaleX * 0.9, curScaleY * 0.9, 1), 0.09)):Append(transform:DOScale(Vector3(curScaleX, curScaleY, 1), 0.09))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:fadeInAndShake(obj, timelinelite, timeScale, params)
	local x, y
	local transform = obj.transform

	if params.x == nil then
		x = transform.localPosition.x
	else
		x = params.x
	end

	if params.y == nil then
		y = transform.localPosition.y
	else
		y = params.y
	end

	local fade_in_alpha = params.alpha or 1
	local callback = params.callback
	local fade_in_callback

	function fade_in_callback()
		self:shake(obj, timelinelite, timeScale, {
			callback = callback
		})
	end

	self:fadeIn(obj, timelinelite, timeScale, {
		x = x,
		y = y,
		alpha = fade_in_alpha,
		callback = fade_in_callback
	})
end

function ActivityEffectPlayer:fadeOut(obj, timelinelite, timeScale, params)
	local x, y
	local transform = obj.transform
	local w = obj:GetComponent(typeof(UIWidget))
	local alpha = params.alpha

	alpha = alpha or 0

	local callback = params.callback

	timelinelite:Append(xyd.getTweenAlpha(w, alpha, 0.5))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:leftSlideOut(obj, timelinelite, timeScale, params)
	self:leftSlideIn(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:rightSlideOut(obj, timelinelite, timeScale, params)
	self:leftSlideIn(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:shrinkOut(obj, timelinelite, timeScale, params)
	return
end

function ActivityEffectPlayer:shake(obj, timelinelite, timeScale, params)
	local transform = obj.transform
	local callback = params.callback
	local src_x = transform.localPosition.x
	local src_y = transform.localPosition.y
	local w = obj:GetComponent(typeof(UIWidget))
	local y_ = src_y - w.height * 0.02

	w.alpha = 1

	timelinelite:Append(transform:DOLocalMove(Vector3(src_x, y_, 0), 0.15)):Append(transform:DOLocalMove(Vector3(src_x, src_y, 0), 0.15))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:actionIn(obj, timelinelite, timeScale, params)
	local x, y
	local transform = obj.transform

	if params.x == nil then
		x = transform.localPosition.x
	else
		x = params.x
	end

	if params.y == nil then
		y = transform.localPosition.y
	else
		y = params.y
	end

	local w = obj:GetComponent(typeof(UIWidget))
	local final_alpha = params.alpha or 1
	local callback = params.callback

	transform.localPosition = Vector3(x, y, 0)
	w.alpha = final_alpha

	if callback then
		callback()
	end
end

function ActivityEffectPlayer:out(obj, timelinelite, timeScale, params)
	local x, y
	local transform = obj.transform

	x = transform.localPosition.x

	if params.y == nil then
		y = transform.localPosition.y
	else
		y = params.y
	end

	local w = obj:GetComponent(typeof(UIWidget))
	local alpha = params.alpha

	alpha = alpha or 1
	transform.localPosition = Vector3(x, y, 0)
	w.alpha = alpha

	local callback = params.callback

	if callback then
		callback()
	end
end

function ActivityEffectPlayer:leftRightSlowShake(obj, timelinelite, timeScale, params)
	local x, y, delta
	local transform = obj.transform

	delta = params.x == nil and 5 or math.abs(transform.localPosition.x - params.x)

	local callback = params.callback
	local origin_x = params.x
	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = 1

	timelinelite:Append(transform:DOLocalMove(Vector3(origin_x + delta, transform.localPosition.y, 0), 0.15)):Append(transform:DOLocalMove(Vector3(origin_x, transform.localPosition.y, 0), 0.075))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:leftRightQuickShake(obj, timelinelite, timeScale, params)
	local x, y, delta
	local transform = obj.transform

	delta = params.x == nil and 5 or math.abs(transform.localPosition.x - params.x)

	local callback = params.callback
	local origin_x = params.x
	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = 1

	timelinelite:Append(transform:DOLocalMove(Vector3(origin_x + delta, transform.localPosition.y, 0), 0.075)):Append(transform:DOLocalMove(Vector3(origin_x, transform.localPosition.y, 0), 0.0375))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:leftRightSlowShakeAfterFirst(obj, timelinelite, timeScale, params)
	local x, y, delta

	delta = params.x == nil and -50 or params.x

	local callback = params.callback
	local transform = obj.transform
	local origin_x = transform.localPosition.x
	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = 1

	timelinelite:Append(transform:DOLocalMove(Vector3(origin_x + delta, transform.localPosition.y, 0), 0.075)):Append(transform:DOLocalMove(Vector3(origin_x, transform.localPosition.y, 0), 0.0375))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:leftRightQuickShakeAfterFirst(obj, timelinelite, timeScale, params)
	local x, y, delta

	delta = params.x == nil and -50 or params.x

	local callback = params.callback
	local origin_x = params.x
	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = 1

	local transform = obj.transform

	timelinelite:Append(transform:DOLocalMove(Vector3(origin_x + delta, transform.localPosition.y, 0), 0.075)):Append(transform:DOLocalMove(Vector3(origin_x, transform.localPosition.y, 0), 0.0375))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:dashOut(obj, timelinelite, timeScale, params)
	local transform = obj.transform
	local x, y, delta

	x = params.x or 0

	local src_x = transform.localPosition.x
	local src_y = transform.localPosition.y
	local callback = params.callback
	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = 1
	transform.localPosition = Vector3(src_x, -20, 0)
	transform.localScale = Vector3(0.5, 0.5, 1)

	timelinelite:Append(transform:DOLocalMove(Vector3(x, src_y, 0), 0.3)):Join(transform:DOScale(Vector3(1.2, 1.2, 1), 0.3)):AppendInterval(0.1):Append(transform:DOLocalMove(Vector3(src_x, src_y, 0), 0.2)):Join(transform:DOScale(Vector3(1, 1, 1), 0.2))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:mirror(obj, timelinelite, timeScale, params)
	local transform = obj.transform
	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = 1
	transform.localPosition = Vector3(params.x or 0, transform.localPosition.y, 0)
	transform.localScale = Vector3(-1, 1, 1)

	local callback = params.callback

	if callback then
		callback()
	end
end

function ActivityEffectPlayer:colorFlip(obj, timelinelite, timeScale, params)
	local callback = params.callback

	do
		local i = 0

		while i < 2 do
			timelinelite:to(obj, 0.1, {}):call(function()
				Shader:get():createColorFlip(obj)
			end):to(obj, 0.1, {}):call(function()
				obj.filters = {}
			end)

			i = i + 1
		end
	end

	if callback then
		timelinelite:call(function()
			callback(_G)
		end)
	end
end

function ActivityEffectPlayer:shenWei(obj, timelinelite, timeScale, params)
	local callback = params.callback

	Shader:get():createShenWeiShader(obj, {
		callback = function()
			obj.filters = {}

			if callback then
				callback(_G)
			end
		end,
		time = timeScale
	})
end

function ActivityEffectPlayer:leftSlideInWithHorVer(obj, timelinelite, timeScale, params)
	local pos = obj.transform.localPosition
	local x = pos.x
	local y = pos.y
	local callback = params.callback
	local w = obj:GetComponent(typeof(UIWidget))
	local trans = obj.transform

	w.alpha = 1

	timelinelite:Append(trans:DOLocalMove(Vector3(x, y, 0), 0.5 * timeScale))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:constantlyShake(obj, timelinelite, timeScale, params)
	params.shakeTime = 4
	params.shakeTimeScale = 0.075
	params.isLeftRight = true

	self:baseShake(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:constantlyQuickShake(obj, timelinelite, timeScale, params)
	params.shakeTime = 3
	params.shakeTimeScale = 0.15
	params.isLeftRight = false

	self:baseShake(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:upDownShake(obj, timelinelite, timeScale, params)
	params.shakeTime = 3
	params.shakeTimeScale = 0.15
	params.isLeftRight = false

	self:baseShake(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:upDownQuickShake(obj, timelinelite, timeScale, params)
	params.shakeTime = 5
	params.shakeTimeScale = 0.075
	params.isLeftRight = false

	self:baseShake(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:baseShake(obj, timelinelite, timeScale, params)
	local x, y
	local delta = 5
	local shakeTime = params.shakeTime
	local shakeTimeScale = params.shakeTimeScale
	local callback = params.callback

	obj:SetLocalPosition(params.x, obj.transform.localPosition.y, 0)

	local origin_x = params.x or 0

	obj:GetComponent(typeof(UIWidget)).alpha = 1

	local trans = obj.transform
	local pos = trans.localPosition
	local origin_y = pos.y

	if params.isLeftRight then
		for i = shakeTime, 0, -1 do
			timelinelite:Append(trans:DOLocalMove(Vector3(origin_x + delta, pos.y, 0), shakeTimeScale))
			timelinelite:Append(trans:DOLocalMove(Vector3(origin_x - delta, pos.y, 0), shakeTimeScale))
		end

		timelinelite:Append(trans:DOLocalMove(Vector3(origin_x, pos.y, 0), shakeTimeScale))
	else
		for i = shakeTime, 0, -1 do
			timelinelite:Append(trans:DOLocalMove(Vector3(pos.x, origin_y + delta, 0), shakeTimeScale))
			timelinelite:Append(trans:DOLocalMove(Vector3(pos.x, origin_y - delta, 0), shakeTimeScale))
		end

		timelinelite:Append(trans:DOLocalMove(Vector3(pos.x, origin_y, 0), shakeTimeScale))
	end

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:baseUpDownSlideIn(obj, timelinelite, timeScale, params)
	local trans = obj.transform
	local pos = trans.localPosition
	local original_y = pos.y

	obj:SetLocalPosition(pos.x, pos.y - params.startY, 0)

	local callback = params.callback

	obj:GetComponent(typeof(UIWidget)).alpha = 1

	timelinelite:Append(trans:DOLocalMove(Vector3(pos.x, original_y, 0), 0.5 * timeScale))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:baseUpDownSlideOut(obj, timelinelite, timeScale, params)
	local trans = obj.transform
	local pos = trans.localPosition
	local original_y = pos.y
	local callback = params.callback

	obj:GetComponent(typeof(UIWidget)).alpha = 1

	timelinelite:Append(trans:DOLocalMove(Vector3(pos.x, original_y - params.endY, 0), timeScale))

	if callback then
		timelinelite:AppendCallback(function()
			callback()
		end)
	end
end

function ActivityEffectPlayer:downSlideIn(obj, timelinelite, timeScale, params)
	params.startY = 1024

	self:baseUpDownSlideIn(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:upSlideIn(obj, timelinelite, timeScale, params)
	params.startY = -1024

	self:baseUpDownSlideIn(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:showPartnerPicture(obj, timelinelite, timeScale, params)
	local w = obj:GetComponent(typeof(UIWidget))
	local trans = obj.transform
	local pos = trans.localPosition
	local original_x = pos.x
	local original_y = pos.y
	local callback = params.callback

	local function setter(value)
		w.alpha = value
	end

	w.alpha = 1

	obj:SetLocalPosition(pos.x, -2048, 0)
	obj:SetLocalScale(1.5, 1.5, 1)
	timelinelite:Append(trans:DOLocalMove(Vector3(pos.x, -718, 0), 5))
	timelinelite:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), 1, 0, 1))
	timelinelite:AppendCallback(function()
		obj:SetLocalPosition(original_x, original_y, 0)
		obj:SetLocalScale(1, 1, 1)
	end)
	timelinelite:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), 0, 1, 1))
end

function ActivityEffectPlayer:downSlideOut(obj, timelinelite, timeScale, params)
	params.endY = 1024

	self:baseUpDownSlideOut(obj, timelinelite, timeScale, params)
end

function ActivityEffectPlayer:stop()
	if self.sequence then
		self.sequence:Kill(false)

		self.sequence = nil
	end
end

return ActivityEffectPlayer
