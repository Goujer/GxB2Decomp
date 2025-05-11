-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/LogItem.lua

local LogItem = class("LogItem")

function LogItem:ctor()
	local db = xyd.db.openLogData()
end

function LogItem:getAll(limitNum)
	local db = xyd.db.openLogData()
	local sql = "SELECT rowid, * FROM log_item"

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

function LogItem:add(mid, item_id, item_num, item_change, expire_time)
	local db = xyd.db.openLogData()
	local stmt

	stmt = db:prepare("        INSERT INTO log_item (platform_id, mid, item_id, item_num, item_change, expire_time, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)\n    ")

	stmt:bind_values(1, mid, item_id, item_num, item_change, expire_time, os.time())
	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:reset()
end

function LogItem:delete(limitNum)
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
	local stmt = db:prepare("DELETE FROM log_item WHERE rowid IN " .. idList)

	stmt:step()
	stmt:reset()
	stmt:finalize()
	xyd.close_db(db)
end

function LogItem:reset()
	local db = xyd.db.openLogData()

	db:exec("        DELETE FROM log_item\n    ")
	xyd.close_db(db)
end

return LogItem
