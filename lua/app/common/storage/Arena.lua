-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Arena.lua

local Arena = class("ArenaDB")

function Arena:ctor()
	xyd.db.openGameData()
end

function Arena:getArenaRecords()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM arena_record WHERE playerID = ? ORDER BY time DESC LIMIT 20")

	stmt:bind_values(xyd.Global.playerID)

	local result = {}

	for row in stmt:nrows() do
		table.insert(result, row)
	end

	stmt:reset()

	return result
end

function Arena:addArenaRecord(time, attackerId)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("\t    INSERT OR REPLACE INTO arena_record (playerID, time, attacker_id) VALUES (?, ?, ?)\n\t")

	stmt:bind_values(xyd.Global.playerID, time, attackerId)
	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:reset()
end

return Arena
