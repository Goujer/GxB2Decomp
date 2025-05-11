-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialBossScenesTable.lua

local NewTrialBossScenesTable = class("NewTrialBossScenesTable", import("app.common.tables.BaseTable"))

function NewTrialBossScenesTable:ctor()
	NewTrialBossScenesTable.super.ctor(self, "new_trial_boss_scenes")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function NewTrialBossScenesTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function NewTrialBossScenesTable:getPartnerId(id)
	return self:getNumber(id, "partner_id")
end

function NewTrialBossScenesTable:getStageScene(id)
	return self:getString(id, "stage_scene")
end

function NewTrialBossScenesTable:getStageSceneDetail(id)
	return self:getString(id, "stage_scene_detail")
end

function NewTrialBossScenesTable:getBattleScene(id)
	return self:getString(id, "battle_scene")
end

function NewTrialBossScenesTable:getBattleSceneBoss(id)
	return self:getString(id, "battle_scene_boss")
end

function NewTrialBossScenesTable:getBossImg(id)
	return self:getString(id, "boss_image")
end

return NewTrialBossScenesTable
