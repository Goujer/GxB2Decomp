-- chunkname: @../../../Product/Bundles/Android/src/app/components/CountDown.lua

local CountDown = class("CountDown", import(".CopyComponent"))
local Object = UnityEngine.Object

function CountDown:ctor(labelComp, params)
	self.go = labelComp.gameObject

	CountDown.super.ctor(self, self.go)

	self.labelComp = labelComp
	self.params = params

	if params then
		self.duration = params.duration
		self.callback = params.callback
		self.secType = params.secondStrType
		self.doOnTime = params.doOnTime
		self.key = params.key

		self:judgeStrType()

		if self.key then
			self.labelComp.text = __(self.key, xyd.secondsToString(self.duration, self.secType))
		else
			self.labelComp.text = xyd.secondsToString(self.duration, self.secType)
		end

		self:init()
	else
		self.labelComp.text = ""
	end
end

function CountDown:init()
	if not self.timer_ then
		self.timer_ = Timer.New(handler(self, self.onTime), 1, -1, false)

		self.timer_:Start()
	else
		self.timer_:Stop()
		self.timer_:Start()
	end
end

function CountDown:onTime()
	if tolua.isnull(self.labelComp) then
		if self.timer_ then
			self.timer_:Stop()
		end

		return
	end

	self.duration = self.duration - 1

	if self.duration <= 0 then
		self.duration = 0

		if self.labelComp then
			if self.key then
				self.labelComp.text = __(self.key, xyd.secondsToString(self.duration, self.secType))
			else
				self.labelComp.text = xyd.secondsToString(self.duration, self.secType)
			end
		end

		if self.timer_ then
			self.timer_:Stop()

			self.timer_ = nil
		end

		if self.callback then
			self.callback()
		end
	elseif self.labelComp then
		if self.key then
			self.labelComp.text = __(self.key, xyd.secondsToString(self.duration, self.secType))
		else
			self.labelComp.text = xyd.secondsToString(self.duration, self.secType)
		end
	end

	if self.doOnTime then
		self.doOnTime()
	end
end

function CountDown:setInfo(params)
	self.params = params

	if params.callback ~= nil then
		self.callback = params.callback
	end

	if params.doOnTime ~= nil then
		self.doOnTime = params.doOnTime
	end

	self.duration = params.duration

	if params.secondStrType then
		self.secType = params.secondStrType
	end

	self:judgeStrType()

	self.key = params.key

	if self.labelComp then
		if self.key then
			self.labelComp.text = __(self.key, xyd.secondsToString(self.duration, self.secType))
		else
			self.labelComp.text = xyd.secondsToString(self.duration, self.secType)
		end
	end

	if params.duration ~= nil then
		self.duration = params.duration
	end

	if self.duration ~= nil then
		if self.labelComp then
			if self.key then
				self.labelComp.text = __(self.key, xyd.secondsToString(self.duration, self.secType))
			else
				self.labelComp.text = xyd.secondsToString(self.duration, self.secType)
			end
		end

		self:init()
	end
end

function CountDown:setCountDownTime(duration)
	local params = {
		duration = duration
	}

	self:setInfo(params)
end

function CountDown:stopTimeCount()
	if self.timer_ then
		self.timer_:Stop()

		self.timer_ = nil
	end
end

function CountDown:setLayout(params)
	if params and params.textColor then
		self.labelComp.color = params.textColor
	end

	if params and params.effectColor then
		self.labelComp.effectColor = params.effectColor
	end
end

function CountDown:dispose()
	CountDown.super.dispose(self)

	if self.timer_ then
		self.timer_:Stop()

		self.timer_ = nil
	end
end

function CountDown:judgeStrType()
	if not self.secType then
		local hour = self.duration / 3600

		if hour > 48 then
			self.secType = xyd.SecondsStrType.NOMINU
		else
			self.secType = xyd.SecondsStrType.NORMAL
		end
	end
end

return CountDown
