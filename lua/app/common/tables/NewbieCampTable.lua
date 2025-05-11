-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewbieCampTable.lua

local NewbieCampTable = class("NewbieCampTable", import("app.common.tables.BaseTable"))

function NewbieCampTable:ctor()
	NewbieCampTable.super.ctor(self, "beginner_quest")

	self.ids_ = {}
	self.count_by_phase_ = {}
	self.ids_by_phase_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local phase = self:getPhaseId(id)

		if not self.ids_by_phase_[phase] then
			self.ids_by_phase_[phase] = {}
			self.count_by_phase_[phase] = 0
		end

		table.insert(self.ids_by_phase_[phase], tonumber(id))
		table.insert(self.ids_, tonumber(id))

		if self:getIsHide(id) ~= 1 then
			self.count_by_phase_[phase] = self.count_by_phase_[phase] + 1
		end
	end
end

function NewbieCampTable:getIds()
	return self.ids_
end

function NewbieCampTable:getLimitLev(id)
	return self:getNumber(id, "limit_lev")
end

function NewbieCampTable:getPhaseId(id)
	return self:getNumber(id, "phase_id")
end

function NewbieCampTable:getLimitPhase(id)
	return self:getNumber(id, "limit_phase")
end

function NewbieCampTable:getComplete(id)
	return self:getNumber(id, "complete_value")
end

function NewbieCampTable:getGoId(id)
	return
end

function NewbieCampTable:getCountByPhase(phase_id)
	return self.count_by_phase_[phase_id]
end

function NewbieCampTable:getIdsByPhase(phase_id)
	return self.ids_by_phase_[phase_id] or {}
end

function NewbieCampTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function NewbieCampTable:getRank(id)
	return self:getNumber(id, "rank")
end

function NewbieCampTable:getIsHide(id)
	return self:getNumber(id, "is_hide")
end

function NewbieCampTable:getGoWindow(id)
	return self:getString(id, "go_window")
end

function NewbieCampTable:getGoParams(id)
	local params = {}
	local arr = xyd.split(self:getString(id, "go_params"), "|")

	for _, info in ipairs(arr) do
		local param = xyd.split(info, ":")

		if tonumber(param[2]) then
			param[2] = tonumber(param[2])
		end

		params[param[1]] = param[2]
	end

	return params
end

function NewbieCampTable:getGoLimit(id)
	return self:split2num(id, "lv_limit", "|")
end

return NewbieCampTable
