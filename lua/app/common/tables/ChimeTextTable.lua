-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ChimeTextTable.lua

local ChimeTextTable = class("ChimeTextTable", import("app.common.tables.BaseTable"))

function ChimeTextTable:ctor()
	ChimeTextTable.super.ctor(self, "chime_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ChimeTextTable:getIDs()
	return self.ids_
end

function ChimeTextTable:getName(id)
	return self:getString(id, "name")
end

function ChimeTextTable:getBuff(id, index)
	if index == 1 then
		return self:getBuff1(id)
	elseif index == 2 then
		return self:getBuff2(id)
	elseif index == 3 then
		return self:getBuff3(id)
	elseif index == 4 then
		return self:getBuff4(id)
	end
end

function ChimeTextTable:getBuff1(id)
	return self:getString(id, "buff1")
end

function ChimeTextTable:getBuff2(id)
	return self:getString(id, "buff2")
end

function ChimeTextTable:getBuff3(id)
	return self:getString(id, "buff3")
end

function ChimeTextTable:getBuff4(id)
	return self:getString(id, "buff4")
end

return ChimeTextTable
