-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ModelTable.lua

local ModelTable = class("ModelTable", import("app.common.tables.BaseTable"))

function ModelTable:ctor()
	ModelTable.super.ctor(self, "model")

	self.datas_ = {}
end

function ModelTable:getShadePos(id)
	local str = self:getString(id, "shade_pos")

	return xyd.split(str, "|", true)
end

function ModelTable:getBloodPos(id)
	local str = self:getString(id, "blood_pos")

	return xyd.split(str, "|", true)
end

function ModelTable:getScale(id)
	return self:getNumber(id, "scale")
end

function ModelTable:battlePos(id)
	return self:split2num(id, "battle_pos", "|")
end

function ModelTable:getModelName(id)
	return self:getString(id, "model_name")
end

function ModelTable:getAtkTime(id)
	return self:split2num(id, "atk_time", "|")
end

function ModelTable:getSkillTime(id)
	return self:split2num(id, "skill_time", "|")
end

function ModelTable:getPetCardPos(id)
	return self:split2num(id, "pet_card_pos", "|")
end

function ModelTable:getPetDetailPos(id)
	return self:split2num(id, "pet_details_pos", "|")
end

function ModelTable:getPetShowPos(id)
	return self:split2num(id, "pet_show_pos", "|")
end

function ModelTable:getHouseModel(id)
	return self:split2num(id, "house_model", "|")
end

function ModelTable:revive(id)
	return self:getString(id, "revive")
end

function ModelTable:getHouseResetState(id)
	return self:getNumber(id, "house_reset_state")
end

return ModelTable
