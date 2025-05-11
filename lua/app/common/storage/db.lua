-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/db.lua

local sqlite3 = require("sqlite3")
local PlayerPrefs = UnityEngine.PlayerPrefs

xyd = xyd or {}
xyd.db = xyd.db or {}

function xyd.db.openLogData()
	if xyd.db.LOG_DATA_DB == nil or not xyd.db.LOG_DATA_DB:isopen() then
		local dbfile = XYDDef.DatabasePath .. "log.db"

		xyd.db.LOG_DATA_DB = sqlite3.open(dbfile)
	end

	return xyd.db.LOG_DATA_DB
end

function xyd.db.openUserDefaults()
	if xyd.db.USER_DEFAULTS_DB == nil or not xyd.db.USER_DEFAULTS_DB:isopen() then
		local dbfile = XYDDef.DatabasePath .. "defaults.db"

		xyd.db.USER_DEFAULTS_DB = sqlite3.open(dbfile)
	end

	return xyd.db.USER_DEFAULTS_DB
end

function xyd.db.openGameData()
	if xyd.db.GAME_DATA_DB == nil or not xyd.db.GAME_DATA_DB:isopen() then
		local dbfile = XYDDef.DatabasePath .. "game.db"

		xyd.db.GAME_DATA_DB = sqlite3.open(dbfile)

		if xyd.db.GAME_DATA_DB == nil then
			os.remove(dbfile)

			xyd.db.GAME_DATA_DB = sqlite3.open(dbfile)
		end

		xyd.db.GAME_DATA_DB:exec("            PRAGMA synchronous = OFF;\n            PRAGMA temp_store = 2;\n        ")
	end

	return xyd.db.GAME_DATA_DB
end

function xyd.db.init()
	assert(xyd.db.openLogData():exec("        CREATE TABLE IF NOT EXISTS errorlog (\n            time INT NOT NULL DEFAULT 0,\n            res_v TEXT NOT NULL,\n            app_v TEXT NOT NULL,\n            is_crash INT NOT NULL DEFAULT 0,\n            dump TEXT NOT NULL,\n            log TEXT NOT NULL\n        );\n\n        CREATE TABLE IF NOT EXISTS log_economy (\n            mid INT NOT NULL,\n            currency_type TEXT NOT NULL,\n            currency_value INTEGER NOT NULL,\n            currency_change INTEGER NOT NULL,\n            created_at INT NOT NULL\n        );\n\n        CREATE TABLE IF NOT EXISTS log_item (\n            mid INT NOT NULL,\n            platform_id INT NOT NULL DEFAULT 0,\n            tag INT NOT NULL DEFAULT 0,\n            item_id INT NOT NULL,\n            item_num INTEGER NOT NULL,\n            item_change INTEGER NOT NULL,\n            expire_time TEXT,\n            created_at INT NOT NULL\n        );\n\n    ") == sqlite3.OK)
	assert(xyd.db.openUserDefaults():exec("        CREATE TABLE IF NOT EXISTS settings (\n            id INT NOT NULL PRIMARY KEY\n        );\n    ") == sqlite3.OK)
	assert(xyd.db.openGameData():exec("        CREATE TABLE IF NOT EXISTS player_info (\n            key TEXT NOT NULL,\n            value INT NOT NULL,\n            PRIMARY KEY (key)\n        );\n\n        CREATE TABLE IF NOT EXISTS formation (\n            key TEXT NOT NULL,\n            value TEXT NOT NULL,\n            PRIMARY KEY (key)\n        );\n        \n\n        CREATE TABLE IF NOT EXISTS meta (\n            id INT NOT NULL PRIMARY KEY,\n            sid TEXT NOT NULL,\n            uid TEXT NOT NULL,\n            token TEXT NOT NULL,\n            playerID INT NOT NULL DEFAULT 0,\n            playerName TEXT NOT NULL\n        );\n\n        CREATE TABLE IF NOT EXISTS misc (\n            playerID INT NOT NULL DEFAULT 0,\n            key TEXT NOT NULL,\n            value TEXT NOT NULL,\n            PRIMARY KEY (playerID, key)\n        );\n\n        CREATE TABLE IF NOT EXISTS chat (\n            playerID INT NOT NULL DEFAULT 0,\n            key TEXT NOT NULL,\n            value TEXT NOT NULL,\n            PRIMARY KEY (playerID, key)\n        );\n\n        CREATE TABLE IF NOT EXISTS activity (\n            playerID INT NOT NULL DEFAULT 0,\n            activityID INT NOT NULL DEFAULT 0,\n            startTime INT NOT NULL DEFAULT 0,\n            endTime INT NOT NULL DEFAULT 0,\n            added INT NOT NULL DEFAULT 0,\n            PRIMARY KEY (playerID, activityID)\n        );\n\n        CREATE TABLE IF NOT EXISTS table_data (\n            table_name TEXT NOT NULL,\n            key TEXT NOT NULL,\n            version INT NOT NULL DEFAULT 0,\n            rawdata TEXT NOT NULL,\n            PRIMARY KEY (table_name, key)\n        );\n\n        CREATE TABLE IF NOT EXISTS hot_fix (\n            table_name TEXT NOT NULL,\n            version INT NOT NULL DEFAULT 0,\n            rawdata TEXT NOT NULL,\n            PRIMARY KEY (table_name)\n        );\n\n\n        PRAGMA synchronous = OFF;\n        PRAGMA temp_store = 2;\n    ") == sqlite3.OK)

	xyd.db.errorLog = import("app.common.storage.ErrorLog").new()
	xyd.db.settings = import("app.common.storage.Settings").new()
	xyd.db.meta = import("app.common.storage.Meta").new()
	xyd.db.mail = import("app.common.storage.Mail").new()
	xyd.db.misc = import("app.common.storage.Misc").new()
	xyd.db.chat = import("app.common.storage.Chat").new()
	xyd.db.activity = import("app.common.storage.Activity").new()
	xyd.db.hotFix = import("app.common.storage.HotFix").new()
	xyd.db.arena = import("app.common.storage.Arena").new()
	xyd.db.tableData = import("app.common.storage.TableData").new()
	xyd.db.logEconomy = import("app.common.storage.LogEconomy").new()
	xyd.db.logItem = import("app.common.storage.LogItem").new()
	xyd.db.formation = import("app.common.storage.Formation")

	xyd.close_db(xyd.db.LOG_DATA_DB)
	xyd.close_db(xyd.db.USER_DEFAULTS_DB)
	xyd.close_db(xyd.db.GAME_DATA_DB)
end

function xyd.db.clean()
	xyd.close_db(xyd.db.USER_DEFAULTS_DB)
	xyd.close_db(xyd.db.GAME_DATA_DB)
end

function xyd.db.clearLocal()
	xyd.db.mail:reset()
end

function xyd.init_database()
	xyd.db.init()
end

function xyd.delete_all_databases()
	local logDb = XYDDef.DatabasePath .. "log.db"
	local defaultdDb = XYDDef.DatabasePath .. "defaults.db"
	local gameDb = XYDDef.DatabasePath .. "game.db"

	os.remove(logDb)
	os.remove(defaultdDb)
	os.remove(gameDb)
end

function xyd.close_db(db)
	if db and db:isopen() then
		db:close()
	end
end
