-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/PlayerInfo.lua

local PlayerInfo = class("PlayerInfo")

function PlayerInfo:ctor()
	local db = xyd.db.openGameData()
end

function PlayerInfo:get()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM player_info")
	local result = {}

	for row in stmt:nrows() do
		table.insert(result, row)
	end

	stmt:finalize()

	return result
end

function PlayerInfo:addOrUpdate(key, value)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO player_info (key, value) VALUES (?, ?)\n    ")

	stmt:bind_values(key, value)
	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:reset()
end

function PlayerInfo:getValue(key)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM player_info WHERE key = ?")

	stmt:bind_values(key)

	local result = {}

	for row in stmt:nrows() do
		table.insert(result, row)
	end

	stmt:reset()

	local value

	if #result > 0 and result[1].value then
		value = result[1].value
	end

	return value
end

function PlayerInfo:reset()
	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM player_info\n    ")
	xyd.close_db(db)
end

function PlayerInfo:getFirstLevelWinTime()
	local res = self:getValue("first_level_win_time")

	if res == nil then
		return 0
	end

	return res
end

function PlayerInfo:getLastLogTime()
	local res = self:getValue("last_log_time")

	if res == nil then
		return 0
	end

	return res
end

return PlayerInfo
