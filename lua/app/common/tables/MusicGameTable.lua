-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MusicGameTable.lua

local MusicGameTable = class("MusicGameTable", import("app.common.tables.BaseTable"))

function MusicGameTable:ctor()
	MusicGameTable.super.ctor(self, "activity_music_game")

	self.ids = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, self:Number(id))
	end
end

function MusicGameTable:getIDs()
	return self.ids
end

function MusicGameTable:getMusic(id)
	return self:getString(id, "music")
end

function MusicGameTable:getMusicName(id)
	return xyd.tables.activityMusicGameTextTable:getName(id)
end

function MusicGameTable:getAuthor(id)
	return xyd.tables.activityMusicGameTextTable:getAuthor(id)
end

function MusicGameTable:difficulty(id)
	return self:getNumber(id, "difficulty")
end

function MusicGameTable:getBpm(id)
	return self:getNumber(id, "bpm")
end

function MusicGameTable:getBg(id)
	return self:getString(id, "background")
end

function MusicGameTable:defaultHero(id)
	return self:getNumber(id, "default_hero")
end

function MusicGameTable:availableHero(id)
	return self:split2num(id, "available_hero", "|")
end

function MusicGameTable:endTime(id)
	return self:getNumber(id, "end_time")
end

function MusicGameTable:getAwards(id)
	return self:split2num(id, "awards", "#")
end

function MusicGameTable:getMaxHits(id)
	return self:getNumber(id, "max_hit")
end

function MusicGameTable:getNextUnlock(id)
	return self:getNumber(id, "next_unlock")
end

return MusicGameTable
