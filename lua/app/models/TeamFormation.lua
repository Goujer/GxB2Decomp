-- chunkname: @../../../Product/Bundles/Android/src/app/models/TeamFormation.lua

local TeamFormation = class("TeamFormation")

function TeamFormation:ctor(info)
	self.partner_id = info.partner_id
	self.pos = info.pos
end

return TeamFormation
