-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Situation.lua

local Situation = class("Situation")
local sqlite3 = require("sqlite3")

function Situation:ctor()
	local db = xyd.db.openGameData()
end

function Situation:getAll()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM situation WHERE playerID = " .. xyd.Global.playerID)
	local rows = {}

	for row in stmt:nrows() do
		table.insert(rows, row)
	end

	stmt:finalize()

	return rows
end

function Situation:getTime(key)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT value FROM situation WHERE playerID = ? AND key = ?")
	local r

	stmt:bind_values(xyd.Global.playerID, key)

	for row in stmt:nrows() do
		r = tonumber(row.value)

		break
	end

	stmt:finalize()

	return r
end

function Situation:setTime(tb)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO situation (playerID, key, value) VALUES (?, ?, ?)\n    ")

	stmt:bind_values(xyd.Global.playerID, tb.key, tb.value)
	stmt:step()

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		__TRACE(errorCode)
		__TRACE(db:errmsg(), xyd.Global.playerID, tb.key, tb.value)
	end

	stmt:finalize()
end

function Situation:reset()
	self.data = {}

	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM situation;\n    ")
	xyd.close_db(db)
end

function Situation:deleteHelper(keys)
	if keys == nil or #keys <= 0 then
		return
	end

	local first = true
	local idList = "("

	for _, id in ipairs(keys) do
		if first then
			first = false
			idList = idList .. " \"" .. id .. "\""
		else
			idList = idList .. ", \"" .. id .. "\""
		end
	end

	idList = idList .. " )"

	local sql = "DELETE FROM situation WHERE key IN " .. idList .. " AND playerID = " .. xyd.Global.playerID

	__TRACE(sql)

	local db = xyd.db.openGameData()
	local stmt = db:prepare(sql)

	stmt:step()
	stmt:finalize()
end

return Situation
