-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/LogLevel.lua

local LogLevel = class("LogLevel")

function LogLevel:ctor()
	local db = xyd.db.openLogData()
end

function LogLevel:getAll(limitNum)
	local db = xyd.db.openLogData()
	local sql = "SELECT rowid, * FROM log_level"

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

function LogLevel:add(mid, level, stars, score)
	local db = xyd.db.openLogData()
	local stmt
	local created_at = os.time()

	stmt = db:prepare("        INSERT INTO log_level (mid, level, stars, score, created_at) VALUES (?, ?, ?, ?, ?)\n    ")

	stmt:bind_values(mid, level, stars, score, created_at)
	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:reset()

	if level == 1 and mid == xyd.mid.LOG_GAME_WIN then
		xyd.db.playerInfo:addOrUpdate("first_level_win_time", created_at)
	end
end

function LogLevel:delete(limitNum)
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
	local stmt = db:prepare("DELETE FROM log_level WHERE rowid IN " .. idList)

	stmt:step()
	stmt:reset()
	stmt:finalize()
	xyd.close_db(db)
end

function LogLevel:reset()
	local db = xyd.db.openLogData()

	db:exec("        DELETE FROM log_level\n    ")
	xyd.close_db(db)
end

return LogLevel
