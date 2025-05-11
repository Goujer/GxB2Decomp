-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FxTable.lua

local FxTable = class("FxTable", import("app.common.tables.BaseTable"))

function FxTable:ctor()
	FxTable.super.ctor(self, "fx")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, tonumber(id))
	end
end

function FxTable:getType(id)
	return self:getNumber(id, "type")
end

function FxTable:getSpeed(id)
	local speed = self:getNumber(id, "speed")
	local after_speed = speed / 30
	local str_num = string.format("%.2f", after_speed)

	return self:Number(str_num)
end

function FxTable:getSpeedReduce(id)
	local speed = self:getNumber(id, "speed_reduce")
	local after_speed = speed / 30
	local str_num = string.format("%.2f", after_speed)

	return self:Number(str_num)
end

function FxTable:getPosition(id)
	return self:getNumber(id, "position")
end

function FxTable:getLayer(id)
	return self:getNumber(id, "layer")
end

function FxTable:isRetain(id)
	return self:getNumber(id, "retain") == 1
end

function FxTable:isLoop(id)
	return self:getNumber(id, "is_loop") == 1
end

function FxTable:getFxName(id)
	local str = self:getString(id, "texiao_name")

	return str
end

function FxTable:targetPos(id)
	return self:split2num(id, "target_pos", "|")
end

function FxTable:isAoe(id)
	return self:getNumber(id, "is_aoe") == 1
end

function FxTable:getScale(id)
	return self:getNumber(id, "scale")
end

function FxTable:getResName(id)
	return self:getString(id, "res_name")
end

function FxTable:getX(id)
	return self:getNumber(id, "x")
end

function FxTable:getY(id)
	return self:getNumber(id, "y")
end

function FxTable:getDandaoPoint(id)
	return self:getString(id, "dandao_point")
end

function FxTable:isParallel(id)
	return self:getNumber(id, "is_parallel") == 1
end

function FxTable:isPass(id)
	return self:getNumber(id, "is_pass") == 1
end

function FxTable:spUnitPos(id)
	return self:split2num(id, "sp_unit_pos", "|")
end

function FxTable:getNextTexiao(id)
	return self:getNumber(id, "next_texiao")
end

function FxTable:getDandaoXy(id, index)
	index = index or 1

	local strs = self:split(id, "dandao_xy", "#")
	local tmpStr = strs[index]

	tmpStr = tmpStr or strs[1] or ""

	return xyd.split(tmpStr, "|", true)
end

function FxTable:getWidth(id)
	return self:getNumber(id, "width")
end

function FxTable:texiaoIsPos(id)
	return self:getNumber(id, "texiao_is_pos") == 1
end

function FxTable:getSplitPercent(id)
	return self:split2num(id, "hurt_split_percent", "|")
end

function FxTable:getSplitDelay(id)
	return self:split2num(id, "hurt_split_delay", "|")
end

function FxTable:getHurtSecondDelay(id)
	return self:getNumber(id, "hurt_second_delay")
end

function FxTable:getFrameSkip(id)
	return self:getNumber(id, "frameskip")
end

return FxTable
