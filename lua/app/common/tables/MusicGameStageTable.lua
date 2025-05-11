-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MusicGameStageTable.lua

local MusicGameStageTable = class("MusicGameStageTable", import("app.common.tables.BaseTable"))

function MusicGameStageTable:ctor()
	MusicGameStageTable.super.ctor(self, "activity_music_game_stage")

	self.ids = {}
	self.stageIds = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, self:Number(id))

		local row = self.TableLua.rows[id]
		local stageID = self:Number(row[colIndexTable.stage_id])

		if not self.stageIds[stageID + 1] then
			self.stageIds[stageID + 1] = {}
		end

		table.insert(self.stageIds[stageID + 1], self:Number(id))
	end
end

function MusicGameStageTable:getIDs()
	return self.ids
end

function MusicGameStageTable:getStageIds()
	return self.stageIds
end

function MusicGameStageTable:getIdsByStage(stageID)
	return self.stageIds[stageID + 1] or {}
end

function MusicGameStageTable:getStart(id)
	return self:getNumber(id, "start")
end

function MusicGameStageTable:getEnd(id)
	return self:getNumber(id, "end")
end

function MusicGameStageTable:getType(id)
	return self:getNumber(id, "type")
end

function MusicGameStageTable:getPos(id)
	return self:split2num(id, "pos", "|")
end

function MusicGameStageTable:getTap(id)
	return self:getNumber(id, "tap")
end

function MusicGameStageTable:getColor(id)
	return self:getNumber(id, "color")
end

function MusicGameStageTable:getChara(id)
	return self:getNumber(id, "chara")
end

function MusicGameStageTable:getLine(id)
	return self:getNumber(id, "line")
end

return MusicGameStageTable
