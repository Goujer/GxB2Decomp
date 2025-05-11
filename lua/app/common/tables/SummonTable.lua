-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SummonTable.lua

local SummonTable = class("SummonTable", import("app.common.tables.BaseTable"))

function SummonTable:ctor()
	SummonTable.super.ctor(self, "summon")

	self.getCostArr = {}
end

function SummonTable:getSummonNum(id)
	id = tostring(id)

	return self:getNumber(id, "summon_num")
end

function SummonTable:getAward(id)
	id = tostring(id)

	return xyd.split(self:getString(id, "award"), "#", true)
end

function SummonTable:getCost(id)
	id = tostring(id)

	if self.getCostArr[id] == nil then
		self.getCostArr[id] = xyd.split(self:getString(id, "cost"), "#", true)
	end

	return self.getCostArr[id]
end

function SummonTable:getVipNeed(id)
	id = tostring(id)

	return self:getNumber(id, "vip_need")
end

function SummonTable:getFreeTimeInterval(id)
	id = tostring(id)

	return self:getNumber(id, "freetime_interval")
end

function SummonTable:getIsPartner(id)
	id = tostring(id)

	return self:getNumber(id, "is_partner")
end

function SummonTable:isUseFragment(id)
	id = tostring(id)

	return self:getNumber(id, "is_use_fragment")
end

function SummonTable:getAwakeLv(id)
	return self:getNumber(id, "awaken_lv")
end

function SummonTable:getDropboxId(id)
	return self:getNumber(id, "dropbox_id")
end

return SummonTable
