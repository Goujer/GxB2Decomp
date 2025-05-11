-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/LogEconomy.lua

local LogEconomy = class("LogEconomy")

function LogEconomy:ctor()
	local db = xyd.db.openLogData()
end

function LogEconomy:getAll(limitNum)
	local db = xyd.db.openLogData()
	local sql = "SELECT rowid, * FROM log_economy"

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

function LogEconomy:add(mid, currency_type, currency_value, currency_change)
	local db = xyd.db.openLogData()
	local stmt

	stmt = db:prepare("        INSERT INTO log_economy (mid, currency_type, currency_value, currency_change, created_at) VALUES (?, ?, ?, ?, ?)\n    ")

	stmt:bind_values(mid, currency_type, currency_value, currency_change, os.time())
	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:reset()
end

function LogEconomy:delete(limitNum)
	local logs = self:getAll(limitNum)

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
	local stmt = db:prepare("DELETE FROM log_economy WHERE rowid IN " .. idList)

	stmt:step()
	stmt:reset()
	stmt:finalize()
	xyd.close_db(db)
end

function LogEconomy:reset()
	local db = xyd.db.openLogData()

	db:exec("        DELETE FROM log_economy\n    ")
	xyd.close_db(db)
end

return LogEconomy
