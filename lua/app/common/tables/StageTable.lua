-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/StageTable.lua

local StageTable = class("StageTable", import("app.common.tables.BaseTable"))

function StageTable:ctor()
	StageTable.super.ctor(self, "stage")

	self.datas_ = {}
	self.battleMap_ = {}
	self.fortStageList = {}
	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		self.datas_[id] = {}

		local fort_id = row[colIndexTable.fort_id]

		for key, _ in pairs(colIndexTable) do
			self.datas_[id][key] = row[colIndexTable[key]]
		end

		if not self.fortStageList[fort_id] then
			self.fortStageList[fort_id] = {}
		end

		table.insert(self.fortStageList[fort_id], tonumber(id))

		self.battleMap_[row[colIndexTable.battle_id]] = row[colIndexTable.battle_map]

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function StageTable:getTipsType(id)
	local t = self:getString(id, "tips_type")

	if not t then
		return {}
	else
		return xyd.split(t, "|", true)
	end
end

function StageTable:getMaxID()
	return self.ids_[#self.ids_]
end

function StageTable:getData(id)
	return self.datas_[id]
end

function StageTable:getName(id)
	return self:getNumber(id, "name")
end

function StageTable:getFortID(id)
	return self:getNumber(id, "fort_id")
end

function StageTable:getLv(id)
	return self:getNumber(id, "lv")
end

function StageTable:getFunctionID(id)
	return self:getNumber(id, "function_id")
end

function StageTable:getPower(id)
	return self:getNumber(id, "power")
end

function StageTable:getMonsterShow(id)
	return self:getString(id, "monsterShow")
end

function StageTable:getMonsterSkin(id)
	return self:split2num(id, "monsterskin", "|")
end

function StageTable:getBattleTime(id)
	return self:getNumber(id, "battle_time")
end

function StageTable:getGold(id)
	return self:getString(id, "gold")
end

function StageTable:getExpPartner(id)
	return self:getString(id, "exp_partner")
end

function StageTable:getExpPlayer(id)
	return self:getString(id, "exp_player")
end

function StageTable:getSetMap(id)
	return self:getString(id, "set_map")
end

function StageTable:getStageImg(id)
	return self:getString(id, "stage_img")
end

function StageTable:getDropShow(id)
	return self:getString(id, "dropbox_show")
end

function StageTable:getDropShowActivity(id)
	return self:getString(id, "dropbox_show_activity")
end

function StageTable:getDropShowActivity2(id)
	return self:getString(id, "dropbox_show_activity2")
end

function StageTable:getDropShowActivity3(id)
	return self:getString(id, "dropbox_show_activity3")
end

function StageTable:getDropShowActivity4(id)
	return self:getString(id, "dropbox_show_activity4")
end

function StageTable:getReward(id)
	return self:getString(id, "reward")
end

function StageTable:getBattleMap(battleID)
	return self.battleMap_[battleID] or {}
end

function StageTable:getStageListByFortId(fort_id)
	table.sort(self.fortStageList[fort_id], function(a, b)
		return a < b
	end)

	return self.fortStageList[fort_id]
end

function StageTable:getNextStage(id)
	return self:getNumber(id, "next")
end

function StageTable:isShowBattleEffect(id)
	return self:getNumber(id, "battle_effect") == 1
end

function StageTable:getFortFinal(id)
	return self:getNumber(id, "fort_final")
end

return StageTable
