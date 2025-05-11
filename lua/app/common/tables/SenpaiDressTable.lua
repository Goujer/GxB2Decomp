-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressTable.lua

local SenpaiDressTable = class("SenpaiDressTable", import("app.common.tables.BaseTable"))

function SenpaiDressTable:ctor()
	SenpaiDressTable.super.ctor(self, "senpai_dress")

	self.ids_ = {}
	self.show_ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		local isShow = self:getShowInGuide(id)

		if isShow and isShow ~= 0 then
			table.insert(self.show_ids_, tonumber(id))
		end
	end

	table.sort(self.ids_)
end

function SenpaiDressTable:getIDs()
	return self.ids_
end

function SenpaiDressTable:getShowIDs()
	return self.show_ids_
end

function SenpaiDressTable:getItems(id)
	return self:split2Cost(id, "items", "|", true)
end

function SenpaiDressTable:getPos(id)
	return self:getNumber(id, "pos")
end

function SenpaiDressTable:getGroup(id)
	return self:getNumber(id, "group")
end

function SenpaiDressTable:getStyles(id)
	return self:split2Cost(id, "styles", "|", true)
end

function SenpaiDressTable:getUnlockStyleType(id)
	return self:getNumber(id, "unlock_style_type")
end

function SenpaiDressTable:getUnlockStyles(id)
	return self:split2Cost(id, "unlock_styles", "|", true)
end

function SenpaiDressTable:getDressHand(id)
	return self:split2Cost(id, "dress_shard", "#")
end

function SenpaiDressTable:getShowInGuide(id)
	return self:getNumber(id, "show_in_guide")
end

return SenpaiDressTable
