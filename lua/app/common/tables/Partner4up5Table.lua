-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Partner4up5Table.lua

local Partner4up5Table = class("Partner4up5Table", import("app.common.tables.BaseTable"))

function Partner4up5Table:ctor()
	Partner4up5Table.super.ctor(self, "partner_4up5")

	self.ids_ = {}
	self.fourArr = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local fourId = self:getId4(id)

		self.fourArr[fourId] = tonumber(id)
	end

	table.sort(self.ids_)
end

function Partner4up5Table:getIDs()
	return self.ids_
end

function Partner4up5Table:getId4(id)
	return self:getNumber(id, "id_4")
end

function Partner4up5Table:getId5(id)
	return self.fourArr[id]
end

return Partner4up5Table
