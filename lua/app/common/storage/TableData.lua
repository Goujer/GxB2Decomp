-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/TableData.lua

local TableData = class("TableData")
local sqlite3 = require("sqlite3")

function TableData:ctor()
	xyd.db.openGameData()
end

function TableData:getAll()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM table_data")
	local res = {}

	for row in stmt:nrows() do
		table.insert(res, row)
	end

	stmt:finalize()

	return res
end

function TableData:getData(name)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM table_data WHERE table_name  = ?")

	stmt:bind_values(name)

	local res = {}

	for row in stmt:nrows() do
		table.insert(res, row)
	end

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		print(errorCode, db:errmsg())
	end

	stmt:finalize()

	return res
end

function TableData:addOrUpdate(tb)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO table_data (table_name, key, version, rawdata) VALUES (?, ?, ?, ?)\n    ")

	stmt:bind_values(tb.table_name, tb.key, tb.version, tb.rawdata)
	stmt:step()

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		__TRACE(errorCode, db:errmsg())
	end

	stmt:finalize()
end

function TableData:batchInsert(tbs)
	local co

	co = coroutine.start(function()
		local stmtStr = "            INSERT OR REPLACE INTO table_data (table_name, key, version, rawdata) VALUES \n        "
		local values = {}
		local stmtValues = {}
		local totalNum = #tbs

		for k, tb in ipairs(tbs) do
			table.insert(values, "( ?, ?, ?, ?)")
			table.insert(stmtValues, tb)

			if k % 50 == 0 or k == totalNum then
				local db = xyd.db.openGameData()
				local stmtFormatStr = stmtStr .. table.concat(values, ",")
				local stmt = db:prepare(stmtFormatStr)

				for i, v in ipairs(stmtValues) do
					stmt:bind(4 * (i - 1) + 1, v.table_name)
					stmt:bind(4 * (i - 1) + 2, v.key)
					stmt:bind(4 * (i - 1) + 3, v.version)
					stmt:bind(4 * (i - 1) + 4, v.rawdata)
				end

				stmt:step()

				local errorCode = db:errcode()

				if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
					print(errorCode, db:errmsg())
				end

				stmt:finalize()

				values = {}
				stmtValues = {}

				if k < totalNum then
					coroutine.step(10)
				end
			end
		end

		coroutine.stop(co)
	end)
end

function TableData:reset()
	self.data = {}

	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM table_data;\n    ")
	xyd.close_db(db)
end

function TableData:flushExpiredData(tableName, version)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("DELETE FROM table_data WHERE table_name = ? and version < ?;")

	stmt:bind_values(tableName, version)
	stmt:step()

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		print(errorCode, db:errmsg())
	end

	stmt:finalize()
end

function TableData:deletTableData(deleteKeys)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("DELETE FROM table_data WHERE key in (?);")

	stmt:bind_values(table.concat(deleteKeys, ","))
	stmt:step()

	local errorCode = db:errcode()

	if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
		print(errorCode, db:errmsg())
	end

	stmt:finalize()
end

return TableData
