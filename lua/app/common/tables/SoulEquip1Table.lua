-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulEquip1Table.lua

local SoulEquip1Table = class("SoulEquip1Table", import("app.common.tables.BaseTable"))

function SoulEquip1Table:ctor()
	SoulEquip1Table.super.ctor(self, "soul_equip1")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulEquip1Table:getIDs()
	return self.ids_
end

function SoulEquip1Table:getType(id)
	return self:getNumber(id, "type")
end

function SoulEquip1Table:getPos(id)
	return self:getNumber(id, "pos")
end

function SoulEquip1Table:getQlt(id)
	return self:getNumber(id, "qlt")
end

function SoulEquip1Table:getMaxStar(id)
	return self:getNumber(id, "max_star")
end

function SoulEquip1Table:getMaxLvl(id)
	return self:getNumber(id, "max_lvl")
end

function SoulEquip1Table:getBaseSingle(id, index)
	return self:split2Cost(id, "base" .. index, "#", false)
end

function SoulEquip1Table:getBase1(id)
	return self:split2Cost(id, "base1", "#", false)
end

function SoulEquip1Table:getBase2(id)
	return self:split2Cost(id, "base2", "#", false)
end

function SoulEquip1Table:getBase3(id)
	return self:split2Cost(id, "base3", "#", false)
end

function SoulEquip1Table:getGrowSingle(id, index)
	return self:split2Cost(id, "grow" .. index, "#", false)
end

function SoulEquip1Table:getGrow1(id)
	return self:split2Cost(id, "grow1", "#", false)
end

function SoulEquip1Table:getGrow2(id)
	return self:split2Cost(id, "grow2", "#", false)
end

function SoulEquip1Table:getGrow3(id)
	return self:split2Cost(id, "grow3", "#", false)
end

function SoulEquip1Table:getMaterial(id)
	return self:split2Cost(id, "material", "|#", true)
end

function SoulEquip1Table:getStarGrow(id)
	return self:split2Cost(id, "star_grow", "|", true)
end

function SoulEquip1Table:getName(id)
	return "dddd"
end

function SoulEquip1Table:getBase(id)
	local result = {}

	for i = 1, 3 do
		local data = self:split2Cost(id, "base" .. i, "#", false)

		if #data == 2 then
			table.insert(result, data)
		else
			break
		end
	end

	return result
end

function SoulEquip1Table:getGrow(id, index)
	local result = {}

	for i = 1, 3 do
		local data = self:split2Cost(id, "grow" .. i, "#", false)

		if #data == 2 then
			table.insert(result, data)
		else
			break
		end
	end

	return result
end

return SoulEquip1Table
