-- chunkname: @../../../Product/Bundles/Android/src/app/modules/HotFixManager.lua

local HotFixManager = class("HotFixManager")
local TableInfo = class("TableInfo")
local Name2Proto = {}

function TableInfo:ctor()
	return
end

function TableInfo:populateFromRow(row)
	self.name_ = row.table_name
	self.version_ = row.version
	self.rawdata_ = row.rawdata

	local msg = Name2Proto[self.name_] or messages_pb.frontend_table_list()

	if msg then
		msg:ParseFromString(self.rawdata_)
	end

	self.msg_ = msg
end

function TableInfo:populateFromMsg(table_name, version, msg, rawdata)
	self.name_ = table_name
	self.version_ = version
	self.msg_ = msg
	self.rawdata_ = rawdata
end

function TableInfo:saveDB()
	xyd.db.hotFix:addOrUpdate({
		table_name = self.name_,
		version = self.version_,
		rawdata = self.rawdata_
	})
end

function TableInfo:getName()
	return self.name_
end

function TableInfo:getRawdata()
	return self.rawdata_
end

function TableInfo:getMsg()
	return self.msg_
end

function TableInfo:getVersion()
	return self.version_
end

function HotFixManager.get()
	if HotFixManager.INSTANCE == nil then
		HotFixManager.INSTANCE = HotFixManager.new()
	end

	return HotFixManager.INSTANCE
end

function HotFixManager:ctor()
	self.tableInfos_ = {}

	self:initFromLocal()
	self:registEvents()
end

function HotFixManager:initFromLocal()
	local rows = xyd.db.hotFix:getAll()

	for _, row in ipairs(rows) do
		local info = TableInfo.new()

		info:populateFromRow(row)

		self.tableInfos_[info:getName()] = info
	end
end

function HotFixManager:registEvents()
	self.eventProxy_ = xyd.EventProxy.new(xyd.EventDispatcher.inner(), self)

	self.eventProxy_:addEventListener(xyd.event.FIVE_SECOND_AFTER_LOGIN, handler(self, self.onFiveSecondAfterLogin))
end

function HotFixManager:onFiveSecondAfterLogin(event)
	return
end

function HotFixManager:onSensitiveWords(event)
	local params = event.params
	local info = self:getInfoByName("sensitive")
	local rawdata

	self:resetRequestSensitiveTimer()

	if info then
		rawdata = params:SerializeToString()

		if info:getRawdata() == rawdata then
			return
		end

		info:populateFromMsg("sensitive", self:resVersion2Int(), params, rawdata)
	else
		rawdata = params:SerializeToString()
		info = TableInfo.new()

		info:populateFromMsg("sensitive", self:resVersion2Int(), params, rawdata)

		self.tableInfos_.sensitive = info
	end

	info:saveDB()
	self:doSensitiveFilterHotFix()
end

function HotFixManager:resetRequestSensitiveTimer()
	if self.reqSenTimer_ ~= nil and self.reqSenTimer_.running then
		self.reqSenTimer_:Stop()
	end

	self.reqSenTimer_ = Timer.New(function()
		local msg = messages_pb.get_shielding_words_by_version()

		msg.res_version = xyd.res_version

		xyd.Backend.get():request(xyd.mid.GET_SHIELDING_WORDS_BY_VERSION, msg)
	end, 1800, 1, false)

	self.reqSenTimer_:Start()
end

function HotFixManager:onTableData(event)
	local params = event.params

	for _, entry in ipairs(params.table_list) do
		local tableName = entry.table_name
		local info = self:getInfoByName(tableName)
		local rawdata

		if info then
			rawdata = entry:SerializeToString()

			if info:getRawdata() == rawdata then
				return
			end

			info:populateFromMsg(tableName, self:resVersion2Int(), entry, rawdata)
		else
			rawdata = entry:SerializeToString()
			info = TableInfo.new()

			info:populateFromMsg(tableName, self:resVersion2Int(), entry, rawdata)

			self.tableInfos_[tableName] = info
		end

		info:saveDB()

		if tableName == "translation_" .. string.lower(xyd.lang) then
			self:doTranslationHotFix()
		end
	end
end

function HotFixManager:doHotFix()
	if xyd.res_version == nil then
		return
	end

	self:doSensitiveFilterHotFix()
	self:doTranslationHotFix()
end

function HotFixManager:doSensitiveFilterHotFix()
	local info = self:getInfoByName("sensitive")

	if not info then
		return
	end

	if info:getVersion() >= self:resVersion2Int() then
		local status, res = pcall(xyd.SensitiveFilter.doHotFix, xyd.SensitiveFilter.get(xyd.FilterType.ResTrader), info:getMsg())

		if not status then
			print("error:doSensitiveFilterHotFix2===============", res)
		end
	end
end

function HotFixManager:doTranslationHotFix()
	local tableName = "translation_" .. string.lower(xyd.lang)
	local info = self:getInfoByName(tableName)

	if not info then
		return
	end

	if info:getVersion() == self:resVersion2Int() then
		local status, res = pcall(xyd.tables.translation.doHotFix, xyd.tables.translation, info:getMsg())

		if not status then
			print("doTranslationHotFix===============", res)
		end
	end
end

function HotFixManager:getInfoByName(table_name)
	return self.tableInfos_[table_name]
end

function HotFixManager:resVersion2Int()
	if self.resVersion2Int_ == nil then
		local tmp = string.split(xyd.res_version, ".")

		for i = 1, #tmp do
			tmp[i] = tonumber(tmp[i])
		end

		self.resVersion2Int_ = tmp[1] * math.pow(10, 8) + tmp[2] * math.pow(10, 5) + tmp[3]
	end

	return self.resVersion2Int_
end

return HotFixManager
