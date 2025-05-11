-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallengeBuffTable.lua

local PartnerChallengeBuffTable = class("PartnerChallengeBuffTable", import("app.common.tables.BaseTable"))

function PartnerChallengeBuffTable:ctor()
	PartnerChallengeBuffTable.super.ctor(self, "partner_challenge_buff")

	self.datas_ = {}
	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		self.datas_[id] = {}

		for key, _ in pairs(colIndexTable) do
			self.datas_[id][key] = row[colIndexTable[key]]
		end

		table.insert(self.ids_, id)
	end
end

function PartnerChallengeBuffTable:getData(id)
	return self.datas_[id]
end

function PartnerChallengeBuffTable:getIds()
	return self.ids_
end

function PartnerChallengeBuffTable:getName(id)
	return xyd.tables.partnerChallengeBuffTextTable:getName(id)
end

function PartnerChallengeBuffTable:getDesc(id)
	return xyd.tables.partnerChallengeBuffTextTable:getDesc(id)
end

function PartnerChallengeBuffTable:getEffect(id)
	return self:split(id, "effect", "|")
end

function PartnerChallengeBuffTable:getEffectShow(id)
	return self:getString(id, "effect_show")
end

function PartnerChallengeBuffTable:getFx(id)
	return self:getString(id, "fx")
end

return PartnerChallengeBuffTable
