-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowWindowUnlockTextTable.lua

local DressShowWindowUnlockTextTable = class("DressShowWindowUnlockTextTable", import("app.common.tables.BaseTable"))

function DressShowWindowUnlockTextTable:ctor()
	DressShowWindowUnlockTextTable.super.ctor(self, "show_window_slot_unlock_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}
	self.idsByType_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local type = self:getUnlockType(id)

		self.idsByType_[type] = id

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function DressShowWindowUnlockTextTable:getIds()
	return self.ids_
end

function DressShowWindowUnlockTextTable:getUnlockType(id)
	return self:getNumber(id, "unlock_type")
end

function DressShowWindowUnlockTextTable:getText1(unlock_type, value, unlock_num)
	local id = self.idsByType_[unlock_type]

	if unlock_type ~= 5 then
		local text = self:getString(id, "desc1")

		return self:translate(text, value, unlock_num)
	else
		local text = self:getString(id, "desc1")
		local stage = math.floor((unlock_num - 1) / 100) + 1
		local stageShow = math.fmod(unlock_num - 1, 100) + 1

		return self:translate(text, __("DUNGEON_NAME_" .. stage), stageShow)
	end
end

function DressShowWindowUnlockTextTable:getText2(unlock_type, value, unlock_num)
	local id = self.idsByType_[unlock_type]

	print("unlock_type", unlock_type)

	if unlock_type ~= 5 then
		dump(self.idsByType_, "unlock_type   ", unlock_type)
		print("id", id)

		local text = self:getString(id, "desc2")

		print("text", text)

		return self:translate(text, value, unlock_num)
	else
		dump(self.idsByType_, "unlock_type   ", unlock_type)
		print("id", id)

		local text = self:getString(id, "desc2")

		print("text", text)

		local stage = math.floor((unlock_num - 1) / 100) + 1
		local stageShow = math.fmod(unlock_num - 1, 100) + 1

		return self:translate(text, __("DUNGEON_NAME_" .. stage), stageShow)
	end
end

function DressShowWindowUnlockTextTable:translate(text, ...)
	local __args = {
		...
	}
	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(text, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return DressShowWindowUnlockTextTable
