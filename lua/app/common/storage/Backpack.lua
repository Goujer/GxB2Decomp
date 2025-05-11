-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Backpack.lua

local Backpack = class("Backpack")

function Backpack:ctor()
	local db = xyd.db.openGameData()
end

function Backpack:getAll(playerID)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM backpack")
	local result = {}

	for row in stmt:nrows() do
		table.insert(result, row)
	end

	return result
end

function Backpack:addOrUpdate(itemID, quantity, expire_time)
	local db = xyd.db.openGameData()
	local stmt

	if expire_time == nil then
		stmt = db:prepare("            INSERT OR REPLACE INTO backpack (item_id, quantity) VALUES (?, ?)\n        ")

		stmt:bind_values(itemID, quantity)
	else
		stmt = db:prepare("            INSERT OR REPLACE INTO backpack (item_id, quantity, expire_time) VALUES (?, ?, ?)\n        ")

		stmt:bind_values(itemID, quantity, table.concat(expire_time, "|"))
	end

	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:reset()
end

function Backpack:reset()
	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM backpack\n    ")
	xyd.close_db(db)
end

return Backpack
