-- chunkname: @../../../Product/Bundles/Android/src/app/record/BDRecordManager.lua

local BDRecordManager = class("BDRecordManager")
local cjson = require("cjson")
local SendTimeThreshold = 5
local SendNumThreshold = 8

function BDRecordManager.get()
	if BDRecordManager.INSTANCE == nil then
		BDRecordManager.INSTANCE = BDRecordManager.new()
	end

	return BDRecordManager.INSTANCE
end

function BDRecordManager:ctor()
	self.records_ = {}
	self.lastSendTime_ = 0
	self.isInit_ = nil
	self.bigDataRecordFlag_ = nil
	self.lastRecordTime_ = -1

	if xyd.Global.isVersionUp00_58() then
		coroutine.start(function()
			coroutine.step()
			xyd.BDRecordManager.get():add(xyd.BigDataType.APP, xyd.BigDataAction.START_APP)
			coroutine.stop(coroutine.running())
		end)
	end
end

function BDRecordManager:add(type, actType, ...)
	if not xyd.Global.isVersionUp00_58() then
		return
	end

	local time = XYDUtils.GetNowTicks() + xyd.Global.serverDeltaTime * 1000

	if time == self.lastRecordTime_ then
		time = time + 1
	end

	self.lastRecordTime_ = time

	local params = {
		time,
		type,
		actType,
		...
	}

	table.insert(self.records_, params)

	if self.bigDataRecordFlag_ == nil then
		local selfPlayer = xyd.models.selfPlayer

		if selfPlayer:isInit() then
			self.bigDataRecordFlag_ = selfPlayer:getABTestGroup(xyd.ABTestUniqueKey.BigDataRecord) == "B"
		else
			return
		end
	end

	if self.bigDataRecordFlag_ ~= true then
		return
	end

	if self.isInit_ == nil then
		if xyd.Global.playerID > 0 then
			xyd.SdkManager.get():trackStart(xyd.Global.playerID)

			self.isInit_ = true
		else
			return
		end
	end

	self:checkSend()
end

function BDRecordManager:checkSend()
	local size = #self.records_

	if size < SendNumThreshold then
		return
	end

	local curTime = os.time()

	if curTime < self.lastSendTime_ + SendTimeThreshold and size < SendNumThreshold * 2 then
		return
	end

	xyd.SdkManager.get():logEvent(cjson.encode(self.records_))

	self.records_ = {}
	self.lastSendTime_ = curTime
end

return BDRecordManager
