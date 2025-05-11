-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GirlsModelTable.lua

local GirlsModelTable = class("GirlsModelTable", import("app.common.tables.BaseTable"))

function GirlsModelTable:ctor()
	GirlsModelTable.super.ctor(self, "girls_model")
end

function GirlsModelTable:getResource(id)
	return self:getString(id, "resource")
end

function GirlsModelTable:getTexiaoName(id)
	return self:getString(id, "texiao_name")
end

function GirlsModelTable:getSize(id)
	local size = self:split2num(id, "size", "|")

	if not size[1] then
		size = {
			400,
			400
		}
	end

	return size
end

function GirlsModelTable:getTouchDialog(id, index)
	return self:getString(id, "click_dialog" .. tostring(index))
end

function GirlsModelTable:getTouchSound(id, index)
	return self:getString(id, "click_sound" .. tostring(index))
end

function GirlsModelTable:getSoundTime(id, index)
	return self:getNumber(id, "click_time" .. tostring(index))
end

function GirlsModelTable:ClickEffect(id, index)
	return self:getString(id, "click_texiao" .. tostring(index))
end

function GirlsModelTable:getEnterSound(id)
	return self:getString(id, "enter_sound")
end

function GirlsModelTable:getEnterSoundTime(id)
	return self:getNumber(id, "enter_time")
end

function GirlsModelTable:getEnterDialog(id)
	return self:getString(id, "enter_dialog")
end

function GirlsModelTable:getEnterEffect(id)
	return self:getString(id, "enter_texiao")
end

function GirlsModelTable:getChooseSound(id)
	return self:getString(id, "chosen_sound1")
end

function GirlsModelTable:getChooseSoundTime(id)
	return self:getNumber(id, "chosen_time1")
end

function GirlsModelTable:getChooseDialog(id)
	return self:getString(id, "chosen_dialog1")
end

function GirlsModelTable:getChooseEffect(id)
	return self:getString(id, "chosen_texiao1")
end

function GirlsModelTable:getSpecialActCameout(id)
	return self:getString(id, "special_lihui_cameout")
end

function GirlsModelTable:getSpecialActIdle(id)
	return self:getString(id, "special_lihui_idle")
end

function GirlsModelTable:getSpecialActHit(id)
	return self:split2Cost(id, "special_lihui_hit", "|", false)
end

function GirlsModelTable:getIsSpecail(id)
	return self:getNumber(id, "special_lihui")
end

return GirlsModelTable
