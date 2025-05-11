-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Misc.lua

local Misc = class("Misc")
local sqlite3 = require("sqlite3")

function Misc:ctor()
	local db = xyd.db.openGameData()
end

function Misc:getAll()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM misc WHERE playerID = " .. xyd.Global.playerID)
	local rows = {}

	for row in stmt:nrows() do
		table.insert(rows, row)
	end

	stmt:finalize()

	return rows
end

function Misc:getValue(key, playerId)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT value FROM misc WHERE playerID = ? AND key = ?")
	local r

	if playerId == nil then
		playerId = xyd.Global.playerID
	end

	stmt:bind_values(playerId, key)

	for row in stmt:nrows() do
		r = row.value

		break
	end

	stmt:finalize()

	return r
end

function Misc:setValue(tb)
	self:addOrUpdate(tb)
end

function Misc:addOrUpdate(tb)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO misc (playerID, key, value) VALUES (?, ?, ?)\n    ")
	local playerID = xyd.Global.playerID

	if tb.playerId ~= nil then
		playerID = tb.playerId
	end

	stmt:bind_values(playerID, tb.key, tb.value)
	stmt:step()

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		__TRACE(errorCode)
		__TRACE(db:errmsg(), playerID, tb.key, tb.value)
	end

	stmt:finalize()
end

function Misc:reset()
	self.data = {}

	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM misc;\n    ")
	xyd.close_db(db)
end

return Misc
