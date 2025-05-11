-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Mail.lua

local Mail = class("Mail")
local sqlite3 = require("sqlite3")
local SimpleQueue = import("app.common.SimpleQueue")

function Mail:ctor()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("PRAGMA table_info(mail)")

	for row in stmt:nrows() do
		if row.name == "playerID" and row.pk == 0 then
			stmt:finalize()
			db:exec("                    DROP TABLE mail;\n                    CREATE TABLE IF NOT EXISTS mail (\n                        id TEXT NOT NULL,\n                        playerID INT NOT NULL DEFAULT 0,\n                        type INT NOT NULL DEFAULT 0,\n                        read INT NOT NULL DEFAULT 0,\n                        lock INT NOT NULL DEFAULT 0,\n                        time INT NOT NULL DEFAULT 0,\n                        sender TEXT NOT NULL,\n                        status INT NOT NULL DEFAULT 0,\n                        rawdata TEXT NOT NULL,\n                        PRIMARY KEY (id, playerID)\n                    );\n                ")

			break
		end
	end

	self.actionQueue_ = SimpleQueue.new()
	self.timer_ = Timer.New(handler(self, self.onTimer), 0.1, -1, false)
end

function Mail:getAll()
	local db = xyd.db.openGameData()
	local stmt = db:prepare("SELECT * FROM mail where playerID = " .. xyd.Global.playerID)
	local mails = {}

	for row in stmt:nrows() do
		table.insert(mails, row)
	end

	stmt:finalize()

	return mails
end

function Mail:insertAction(act, params)
	if (act == "add" or act == "update") and params[1]:getRawdata() == nil then
		return
	end

	self.actionQueue_:push({
		act = act,
		params = params
	})

	if not self.timer_.running then
		self.timer_:Start()
	end
end

function Mail:onTimer()
	local action = self.actionQueue_:pop()

	if action == nil then
		return
	end

	if action.act == "add" then
		local allActions = {
			action
		}

		for i = 1, 100 do
			local nextAction = self.actionQueue_:front()

			if nextAction == nil or nextAction.act ~= "add" then
				break
			end

			self.actionQueue_:pop()
			table.insert(allActions, nextAction)
		end

		local stmtStr = "INSERT OR REPLACE INTO mail (id, playerID, type, read, lock, time, sender, status, rawdata) VALUES "

		for i = 1, #allActions do
			if i > 1 then
				stmtStr = stmtStr .. ", (?, ?, ?, ?, ?, ?, ?, ?, ?)"
			else
				stmtStr = stmtStr .. "(?, ?, ?, ?, ?, ?, ?, ?, ?)"
			end
		end

		local db = xyd.db.openGameData()
		local stmt = db:prepare(stmtStr)
		local count = 0

		for i = 1, #allActions do
			local mailInfo = allActions[i].params[1]
			local tb = {
				mailInfo:getID(),
				xyd.Global.playerID,
				mailInfo:getDetailType(),
				mailInfo:isRead(),
				mailInfo:isMarked(),
				mailInfo.time_,
				mailInfo.sender_,
				mailInfo:rewardStatus(),
				mailInfo:getRawdata()
			}
			local size = #tb

			for j = 1, size do
				stmt:bind(count + j, tb[j])
			end

			count = count + size
		end

		stmt:step()

		local errorCode = db:errcode()

		if errorCode ~= sqlite3.OK and errorCode ~= sqlite3.DONE then
			__TRACE(errorCode)
			__TRACE(db:errmsg())
		end

		stmt:finalize()
	elseif action.act == "update" then
		self:updateHelper(action.params[1])
	elseif action.act == "delete" then
		self:deleteHelper(action.params[1])
	end

	if self.actionQueue_:size() == 0 then
		self.timer_:Stop()
	end
end

function Mail:add(mailInfo)
	if mailInfo:getRawdata() == nil then
		return
	end

	self:insertAction("add", {
		mailInfo
	})
end

local addStmt

function Mail:addHelper(mailInfo)
	if mailInfo:getRawdata() == nil then
		return
	end

	local db = xyd.db.openGameData()

	if addStmt == nil then
		addStmt = db:prepare("            INSERT OR REPLACE INTO mail (id, playerID, type, read, lock, time, sender, status, rawdata) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)\n        ")
	end

	local stmt = addStmt

	stmt:bind_values(mailInfo:getID(), xyd.Global.playerID, mailInfo:getDetailType(), mailInfo:isRead(), mailInfo:isMarked(), mailInfo.time_, mailInfo.sender_, mailInfo:rewardStatus(), mailInfo:getRawdata())
	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:reset()
end

function Mail:update(mailInfo)
	if mailInfo:getRawdata() == nil then
		return
	end

	self:insertAction("update", {
		mailInfo
	})
end

function Mail:updateHelper(mailInfo)
	if mailInfo:getRawdata() == nil then
		return
	end

	local db = xyd.db.openGameData()
	local stmt = db:prepare("        UPDATE mail SET read = ?, lock = ?, status = ? WHERE id = ? AND playerID = ?\n    ")

	stmt:bind_values(mailInfo:isRead(), mailInfo:isMarked(), mailInfo:rewardStatus(), mailInfo:getID(), xyd.Global.playerID)
	stmt:step()

	if db:errcode() ~= 101 then
		__TRACE(db:errcode())
		__TRACE(db:errmsg())
	end

	stmt:finalize()
end

function Mail:delete(mails)
	if mails == nil or #mails <= 0 then
		return
	end

	self:insertAction("delete", {
		mails
	})
end

function Mail:deleteHelper(mails)
	if mails == nil or #mails <= 0 then
		return
	end

	local first = true
	local idList = "("

	for _, id in ipairs(mails) do
		if first then
			first = false
			idList = idList .. " \"" .. id .. "\""
		else
			idList = idList .. ", \"" .. id .. "\""
		end
	end

	idList = idList .. " )"

	local sql = "DELETE FROM mail WHERE id IN " .. idList .. " AND playerID = " .. xyd.Global.playerID

	__TRACE(sql)

	local db = xyd.db.openGameData()
	local stmt = db:prepare(sql)

	stmt:step()
	stmt:finalize()
end

function Mail:reset()
	self.actionQueue_ = SimpleQueue.new()

	if self.timer_.running then
		self.timer_:Stop()
	end

	self.data = {}

	local db = xyd.db.openGameData()

	db:exec("        DELETE FROM mail;\n    ")
	xyd.close_db(db)
end

return Mail
