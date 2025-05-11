-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Chat.lua

local Chat = class("Chat")
local sqlite3 = require("sqlite3")

function Chat:ctor()
	local db = xyd.db.openGameData()
end

function Chat:getAll()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM chat WHERE playerID = " .. xyd.Global.playerID)
	local rows = {}

	for row in stmt:nrows() do
		table.insert(rows, row)
	end

	stmt:finalize()

	return rows
end

function Chat:getValue(key)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT value FROM chat WHERE playerID = ? AND key = ?")
	local r

	stmt:bind_values(xyd.Global.playerID, key)

	for row in stmt:nrows() do
		r = row.value

		break
	end

	stmt:finalize()

	return r
end

function Chat:addOrUpdate(tb)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO chat (playerID, key, value) VALUES (?, ?, ?)\n    ")

	stmt:bind_values(xyd.Global.playerID, tb.key, tb.value)
	stmt:step()

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		__TRACE(errorCode)
		__TRACE(db:errmsg(), xyd.Global.playerID, tb.key, tb.value)
	end

	stmt:finalize()
end

function Chat:setValue(tb)
	self:addOrUpdate(tb)
end

function Chat:reset()
	self.data = {}

	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM chat;\n    ")
	xyd.close_db(db)
end

return Chat
