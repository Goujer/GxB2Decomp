-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Activity.lua

local Activity = class("Activity")

function Activity:ctor()
	local db = xyd.db.openGameData()
end

function Activity:getValue(activityID)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM activity where playerID = ? and activityID = ?")

	stmt:bind_values(xyd.Global.playerID, activityID)

	local result = {}

	for row in stmt:nrows() do
		table.insert(result, row)
	end

	stmt:reset()

	return result
end

function Activity:addOrUpdate(activityID, startTime, endTime, added)
	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO activity (playerID, activityID, startTime, endTime, added) VALUES (?, ?, ?, ?, ?)\n    ")

	stmt:bind_values(xyd.Global.playerID, activityID, startTime, endTime, added)
	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:reset()
end

function Activity:reset()
	self.data = {}

	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM activity;\n    ")
	xyd.close_db(db)
end

return Activity
