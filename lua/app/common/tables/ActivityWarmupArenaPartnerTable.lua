-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWarmupArenaPartnerTable.lua

local BaseTable = import(".BaseTable")
local ActivityWarmupArenaPartnerTable = class("ActivityWarmupArenaPartnerTable", BaseTable)

function ActivityWarmupArenaPartnerTable:ctor()
	BaseTable.ctor(self, "activity_warmup_arena_partner")

	self.ids_ = {}
	self.periodArr = {}

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)

	for i, id in pairs(self.ids_) do
		local periodType = self:getPeriod(id)

		if periodType and periodType > 0 then
			if not self.periodArr[periodType] then
				self.periodArr[periodType] = {}
			end

			table.insert(self.periodArr[periodType], id)
		end
	end
end

function ActivityWarmupArenaPartnerTable:getIds()
	return self.ids_
end

function ActivityWarmupArenaPartnerTable:getPartnerId(id)
	return self:getNumber(id, "partner_id")
end

function ActivityWarmupArenaPartnerTable:getIsNewPartner(id)
	return self:getNumber(id, "is_newpartner")
end

function ActivityWarmupArenaPartnerTable:getEquips(id)
	return self:split2num(id, "equips", "|")
end

function ActivityWarmupArenaPartnerTable:getEquipSkill(id)
	return self:getNumber(id, "equip_skill")
end

function ActivityWarmupArenaPartnerTable:getPeriod(id)
	return self:getNumber(id, "period")
end

function ActivityWarmupArenaPartnerTable:getPeriodByPartnerId(partnerId)
	for i, id in pairs(self.ids_) do
		local partner_id = self:getPartnerId(id)

		if partner_id == partnerId then
			return self:getNumber(id, "period")
		end
	end

	return 0
end

function ActivityWarmupArenaPartnerTable:getPeriodArrWithType(type)
	if not self.periodArr[type] then
		return {}
	end

	return self.periodArr[type]
end

return ActivityWarmupArenaPartnerTable
