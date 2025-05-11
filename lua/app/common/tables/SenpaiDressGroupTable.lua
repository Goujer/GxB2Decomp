-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressGroupTable.lua

local SenpaiDressGroupTable = class("SenpaiDressGroupTable", import("app.common.tables.BaseTable"))

function SenpaiDressGroupTable:ctor()
	SenpaiDressGroupTable.super.ctor(self, "senpai_dress_group")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressGroupTable:getIDs()
	return self.ids_
end

function SenpaiDressGroupTable:getUnit(id)
	return self:split2Cost(id, "unit", "|")
end

function SenpaiDressGroupTable:getStyleUnit(id)
	return self:split2Cost(id, "style_unit", "|")
end

function SenpaiDressGroupTable:getUnlockStars(id)
	return self:split2Cost(id, "unlock_stars", "|")
end

function SenpaiDressGroupTable:getSkills(id)
	return self:split2Cost(id, "skills", "|")
end

function SenpaiDressGroupTable:getImg(id)
	return self:getString(id, "img")
end

function SenpaiDressGroupTable:getVersion(id)
	return self:getNumber(id, "version")
end

return SenpaiDressGroupTable
