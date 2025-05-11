-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DungeonDrugTable.lua

local DungeonDrugTable = class("DungeonDrugTable", import("app.common.tables.BaseTable"))

function DungeonDrugTable:ctor()
	DungeonDrugTable.super.ctor(self, "dungeon_drug")
end

function DungeonDrugTable:getNumMax(id)
	return self:getNumber(id, "num_max")
end

function DungeonDrugTable:getEffect(id)
	return xyd.split(self:getString(id, "effect"), "|")
end

function DungeonDrugTable:getName(id)
	return xyd.tables.dungeonDrugTextTable:getName(id)
end

function DungeonDrugTable:getDesc(id)
	return xyd.tables.dungeonDrugTextTable:getDesc(id)
end

function DungeonDrugTable:getId(id)
	return self:getNumber(id, "relate_id")
end

function DungeonDrugTable:translate(id, ...)
	local __args = {
		...
	}
	local formatStr = self:getDesc(id)

	if not formatStr then
		return id
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return DungeonDrugTable
