-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/HotFix.lua

local HotFix = class("HotFix")
local sqlite3 = require("sqlite3")

function HotFix:ctor()
	xyd.db.openGameData()
end

function HotFix:getAll()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM hot_fix")
	local res = {}

	for row in stmt:nrows() do
		table.insert(res, row)
	end

	stmt:finalize()

	return res
end

function HotFix:addOrUpdate(tb)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO hot_fix (table_name, version, rawdata) VALUES (?, ?, ?)\n    ")

	stmt:bind_values(tb.table_name, tb.version, tb.rawdata)
	stmt:step()

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		__TRACE(errorCode)
		__TRACE(db:errmsg(), tb.table_name, tb.version)
	end

	stmt:finalize()
	__TRACE("HotFix:addOrUpdate(tb)", tb.table_name, tb.version)
end

function HotFix:reset()
	self.data = {}

	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM hot_fix;\n    ")
	xyd.close_db(db)
end

return HotFix
