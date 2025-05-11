-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallengeChessTextTable.lua

local PartnerChallengeChessTextTable = class("PartnerChallengeChessTextTable", import(".PartnerChallengeTextTable"))
local BaseTable = import(".BaseTable")

function PartnerChallengeChessTextTable:ctor()
	BaseTable.ctor(self, "partner_challenge_chess_text_" .. tostring(xyd.Global.lang))
end

return PartnerChallengeChessTextTable
