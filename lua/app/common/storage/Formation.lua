-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Formation.lua

local Formation = class("Formation")
local sqlite3 = require("sqlite3")

function Formation:ctor()
	local db = xyd.db.openGameData()
end

function Formation:getAll()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM formation WHERE key = " .. xyd.Global.playerID)
	local rows = {}

	for row in stmt:nrows() do
		table.insert(rows, row)
	end

	stmt:finalize()

	return rows
end

function Formation:getValue(key)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM formation WHERE key = ?")
	local formationKey = key .. ":" .. xyd.Global.playerID
	local r

	stmt:bind_values(formationKey)

	for row in stmt:nrows() do
		r = row.value

		break
	end

	stmt:finalize()

	return r
end

function Formation:setValue(tb)
	self:addOrUpdate(tb)
end

function Formation:addOrUpdate(tb)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO formation (key, value) VALUES (?, ?)\n    ")
	local formationKey = tb.key .. ":" .. xyd.Global.playerID

	stmt:bind_values(formationKey, tb.value)
	stmt:step()

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		__TRACE(errorCode)
		__TRACE(db:errmsg(), tb.key, tb.value)
	end

	stmt:finalize()
end

function Formation:reset()
	self.data = {}

	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM formation;\n    ")
	xyd.close_db(db)
end

return Formation
