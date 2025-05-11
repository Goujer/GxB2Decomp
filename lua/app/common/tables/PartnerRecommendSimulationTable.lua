-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerRecommendSimulationTable.lua

local PartnerRecommendSimulationTable = class("PartnerRecommendSimulationTable", import("app.common.tables.BaseTable"))

function PartnerRecommendSimulationTable:ctor()
	PartnerRecommendSimulationTable.super.ctor(self, "partner_recommend_simulation")

	self.partnerIDs = {}

	for id, v in pairs(self.TableLua.rows) do
		local partnerID = self:getNumber(id, "partner_id")

		table.insert(self.partnerIDs, partnerID)
	end
end

function PartnerRecommendSimulationTable:checkIsRecommend(partnerID)
	local index = xyd.arrayIndexOf(self.partnerIDs, partnerID)

	if index > -1 then
		return true
	else
		return false
	end
end

return PartnerRecommendSimulationTable
