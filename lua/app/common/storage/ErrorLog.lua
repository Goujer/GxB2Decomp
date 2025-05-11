-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/ErrorLog.lua

local ErrorLog = class("ErrorLog")
local json = require("cjson")
local md5 = require("md5")

function ErrorLog:ctor()
	self.recordLog_ = {}
end

function ErrorLog:getAll(limitNum)
	local db = xyd.db.openLogData()
	local sql = "SELECT rowid, * FROM errorlog"

	if limitNum and limitNum > 0 then
		sql = sql .. " limit " .. limitNum
	end

	local stmt = db:prepare(sql)
	local logs = {}

	for row in stmt:nrows() do
		table.insert(logs, row)
	end

	stmt:reset()
	stmt:finalize()
	xyd.close_db(db)

	return logs
end

function ErrorLog:add(log, isCrash, dumpFile, isBattleLog)
	if not self:checkAdd(log) then
		return
	end

	local time = os.time()
	local app_v = UnityEngine.Application.version
	local res_v = xyd.res_version or ""

	isCrash = isCrash and 1 or 0
	dumpFile = dumpFile or ""

	if isBattleLog then
		isCrash = 3
	end

	local db = xyd.db.openLogData()
	local stmt = db:prepare("        INSERT INTO errorlog (time, res_v, app_v, is_crash, dump, log) VALUES (?, ?, ?, ?, ?, ?)\n    ")
	local extraFormation = ""

	extraFormation = extraFormation .. "\nreocrdOpenWindows: " .. json.encode(xyd.Global.recordOpenWindows)
	extraFormation = extraFormation .. "\nrecordCloseWindows: " .. json.encode(xyd.Global.recordCloseWindows)
	extraFormation = extraFormation .. "\ncurWindows: " .. json.encode(xyd.Global.recordCurWindows)
	extraFormation = extraFormation .. "\nrecordTime: " .. os.time() - xyd.Global.recordTime
	log = log .. extraFormation

	stmt:bind_values(time, res_v, app_v, isCrash, dumpFile, log)
	stmt:step()
	stmt:reset()
	stmt:finalize()
	xyd.close_db(db)
end

function ErrorLog:delete(logs)
	if logs == nil or #logs <= 0 then
		return
	end

	local first = true
	local idList = "("

	for _, log in ipairs(logs) do
		if first then
			first = false
		else
			idList = idList .. ","
		end

		idList = idList .. log.rowid
	end

	idList = idList .. ")"

	local db = xyd.db.openLogData()
	local stmt = db:prepare("DELETE FROM errorlog WHERE rowid IN " .. idList)

	stmt:step()
	stmt:reset()
	stmt:finalize()
	xyd.close_db(db)
end

function ErrorLog:checkAdd(log)
	local hex = md5.sumhexa(log)

	if hex and self.recordLog_[hex] then
		return false
	end

	self.recordLog_[hex] = 1

	return true
end

return ErrorLog
