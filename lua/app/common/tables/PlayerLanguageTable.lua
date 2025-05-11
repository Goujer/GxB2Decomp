-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PlayerLanguageTable.lua

local PlayerLanguageTable = class("PlayerLanguageTable", import("app.common.tables.BaseTable"))

function PlayerLanguageTable:ctor()
	PlayerLanguageTable.super.ctor(self, "player_language")

	self.languageCode_ = {}
	self.showIDs_ = {}

	local colIndexTable = self.TableLua.keys

	for id, row in pairs(self.TableLua.rows) do
		local codes = xyd.split(row[colIndexTable.language_code], "|")

		for _, code in pairs(codes) do
			self.languageCode_[string.lower(code)] = id
		end

		local isShow = self:Number(row[colIndexTable.display]) == 1

		if isShow then
			table.insert(self.showIDs_, tonumber(id))
		end
	end

	table.sort(self.showIDs_, function(a, b)
		if a ~= b then
			return a - b < 0
		end

		return false
	end)
end

function PlayerLanguageTable:getIDByName(name)
	return self.languageCode_[string.lower(name)] or -1
end

function PlayerLanguageTable:isShow(id)
	return self:getNumber(id, "display") == 1
end

function PlayerLanguageTable:getShowIDs()
	return self.showIDs_ or {}
end

function PlayerLanguageTable:getTrueName(id)
	return self:getString(id, "true_name")
end

function PlayerLanguageTable:getTrueCode(id)
	return self:getString(id, "true_language_code")
end

function PlayerLanguageTable:getTimeStamp(id)
	return self:getNumber(id, "time_stamp")
end

return PlayerLanguageTable
