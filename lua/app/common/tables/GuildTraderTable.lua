-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildTraderTable.lua

local GuildTraderTable = class("GuildTraderTable", import("app.common.tables.BaseTable"))

function GuildTraderTable:ctor()
	GuildTraderTable.super.ctor(self, "guild_trader")
end

function GuildTraderTable:getFreeAward(lev)
	return self:split2Cost(lev, "free_award", "|#")
end

function GuildTraderTable:getMemberAward(lev)
	return self:split2Cost(lev, "member_award", "|#")
end

function GuildTraderTable:getGuildAward(lev)
	return self:split2Cost(lev, "guild_award", "|#")
end

function GuildTraderTable:getMemberID(lev)
	return self:getNumber(lev, "giftbag_id")
end

function GuildTraderTable:getGuildID(lev)
	return self:getNumber(lev, "giftbag_id2")
end

function GuildTraderTable:getMemberExp(lev)
	return self:getNumber(lev, "guild_exp")
end

function GuildTraderTable:getGuildExp(lev)
	return self:getNumber(lev, "guild_exp2")
end

return GuildTraderTable
