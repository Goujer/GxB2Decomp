-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/soundTable.lua

local SoundTable = class("SoundTable", import("app.common.tables.BaseTable"))

function SoundTable:ctor()
	SoundTable.super.ctor(self, "sound")
end

function SoundTable:getRes(id)
	return self:getString(id, "res")
end

function SoundTable:getLoops(id)
	return self:getNumber(id, "loops")
end

function SoundTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function SoundTable:getType(id)
	return self:getNumber(id, "type")
end

function SoundTable:getVolume(id)
	if self:getNumber(id, "volume") then
		return self:getNumber(id, "volume") / 100
	end
end

function SoundTable:isDestroy(id)
	return self:getNumber(id, "destroy") == 1
end

function SoundTable:isOgg(id)
	return self:getNumber(id, "is_ogg") == 1
end

function SoundTable:isPauseBg(id)
	return self:getNumber(id, "pause_bg")
end

function SoundTable:getLength(id)
	local length = self:getNumber(id, "length")

	return length
end

function SoundTable:isPlaySelf(id)
	return self:getNumber(id, "is_play_self")
end

return SoundTable
