-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Meta.lua

local Meta = class("Meta")

function Meta:ctor()
	self:load_()
end

function Meta:persist()
	if not self.loaded_ then
		return
	end

	local db = xyd.db.openGameData()
	local stmt = db:prepare("        INSERT OR REPLACE INTO meta (id, sid, uid, token, playerID, playerName) VALUES (0, ?, ?, ?, ?, ?)\n    ")

	stmt:bind_values(self.sid, self.uid, self.token, self.playerID, self.playerName)
	stmt:step()
	stmt:reset()
	stmt:finalize()
	xyd.close_db(db)
end

function Meta:load_()
	self.sid = ""
	self.uid = ""
	self.token = ""
	self.playerID = 0
	self.playerName = ""

	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM meta")

	for row in stmt:nrows() do
		self.sid = row.sid
		self.uid = row.uid
		self.token = row.token
		self.playerID = tonumber(row.playerID)
		self.playerName = row.playerName

		break
	end

	stmt:finalize()
	xyd.close_db(db)

	self.loaded_ = true
end

return Meta
