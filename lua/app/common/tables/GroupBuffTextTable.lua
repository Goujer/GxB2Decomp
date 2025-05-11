-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GroupBuffTextTable.lua

local GroupBuffTextTable = class("GroupBuffTextTable", import("app.common.tables.BaseTable"))

function GroupBuffTextTable:ctor()
	GroupBuffTextTable.super.ctor(self, "group_buff_text_" .. tostring(xyd.Global.lang))

	self.datas_ = {}
	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		self.datas_[id] = {}

		for key, _ in pairs(colIndexTable) do
			self.datas_[id][key] = row[colIndexTable[key]]
		end

		table.insert(self.ids_, id)
	end
end

function GroupBuffTextTable:getData(id)
	return self.datas_[id]
end

function GroupBuffTextTable:getIds()
	return self.ids_
end

function GroupBuffTextTable:getName(id)
	return self:getString(id, "name")
end

function GroupBuffTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GroupBuffTextTable
