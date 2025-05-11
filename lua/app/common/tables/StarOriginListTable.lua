-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StarOriginListTable.lua

local StarOriginListTable = class("StarOriginListTable", import("app.common.tables.BaseTable"))

function StarOriginListTable:ctor()
	StarOriginListTable.super.ctor(self, "star_origin_list")

	self.ids_ = {}
	self.idByPartner = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function StarOriginListTable:getIDs()
	return self.ids_
end

function StarOriginListTable:getStarIDs(id)
	return self:split2Cost(id, "start_ids", "|", true) or {}
end

function StarOriginListTable:getStarIDByNodeID(id, nodeID)
	local nodeIDs = self:getNode(id)
	local starIDs = self:getStarIDs(id)

	for i = 1, #nodeIDs do
		if nodeIDs[i] == nodeID then
			return starIDs[i]
		end
	end

	return nil
end

function StarOriginListTable:getLimits(id)
	return self:split2Cost(id, "limits", "|#", true)
end

function StarOriginListTable:getNode(id)
	return self:split2Cost(id, "node_ids", "|", true)
end

function StarOriginListTable:getStartIDs(id)
	return self:split2Cost(id, "start_ids", "|", true)
end

function StarOriginListTable:getEndIDs(id)
	return self:split2Cost(id, "end_ids", "|", true)
end

function StarOriginListTable:getXY(id)
	return self:split2Cost(id, "xy", "|", true)
end

function StarOriginListTable:getNodeType(id)
	return self:split2Cost(id, "node_type", "#", true)
end

return StarOriginListTable
