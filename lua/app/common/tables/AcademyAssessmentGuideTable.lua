-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AcademyAssessmentGuideTable.lua

local BaseTable = import(".BaseTable")
local AcademyAssessmentGuideTable = class("AcademyAssessmentGuideTable", BaseTable)

function AcademyAssessmentGuideTable:ctor()
	BaseTable.ctor(self, "school_practise_guide")

	self.ids_ = {}
	self.windowNames_ = {}
	self.names_ = {}
	self.stepNums_ = {}
	self.idMaps_ = {}
	self.forced_ = {}
	self.marks_ = {}
	self.funcIDs = {}

	local colIndexTable = self.TableLua.rows

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function AcademyAssessmentGuideTable:getIDByWindowName(name)
	return self.windowNames_[name] or {}
end

function AcademyAssessmentGuideTable:getWindowName(id)
	id = tostring(id)

	return self:getString(id, "window_name")
end

function AcademyAssessmentGuideTable:getObjType(id)
	id = tostring(id)

	return self:getNumber(id, "obj_type")
end

function AcademyAssessmentGuideTable:getObjID(id)
	id = tostring(id)

	return self:getString(id, "obj_id")
end

function AcademyAssessmentGuideTable:isRecord(id)
	id = tostring(id)

	return self:getNumber(id, "record") == 1
end

function AcademyAssessmentGuideTable:getFuncID(id)
	id = tostring(id)

	return self:getNumber(id, "func_id")
end

function AcademyAssessmentGuideTable:getName(id)
	id = tostring(id)

	return self:getString(id, "name")
end

function AcademyAssessmentGuideTable:getMark(id)
	id = tostring(id)

	return self:getNumber(id, "mark")
end

function AcademyAssessmentGuideTable:getDesc(id)
	id = tostring(id)

	return xyd.tables.academyAssessmentGuideTextTable:getDesc(id)
end

function AcademyAssessmentGuideTable:noCilck(id)
	id = tostring(id)

	return self:getNumber(id, "no_click") == 1
end

function AcademyAssessmentGuideTable:handType(id)
	id = tostring(id)

	return self:split2num(id, "hand_type", "|")
end

function AcademyAssessmentGuideTable:objScale(id)
	id = tostring(id)

	return self:split2num(id, "obj_scale", "|")
end

function AcademyAssessmentGuideTable:specialFunc(id)
	id = tostring(id)

	return self:getString(id, "special_func")
end

function AcademyAssessmentGuideTable:isBlack(id)
	id = tostring(id)

	return self:getNumber(id, "is_black") == 0
end

function AcademyAssessmentGuideTable:getStep(id)
	id = tostring(id)

	return self:getNumber(id, "step")
end

function AcademyAssessmentGuideTable:getNames()
	return self.names_
end

function AcademyAssessmentGuideTable:getPosition(id)
	id = tostring(id)

	return self:split2num(id, "position", "|")
end

function AcademyAssessmentGuideTable:isFlipX(id)
	id = tostring(id)

	return self:getNumber(id, "flip_x") == 1
end

function AcademyAssessmentGuideTable:isDragonbones(id)
	id = tostring(id)

	return self:getNumber(id, "is_dragonbones") == 1
end

function AcademyAssessmentGuideTable:getFingerFlip(id)
	id = tostring(id)

	return self:getNumber(id, "finger_flip")
end

function AcademyAssessmentGuideTable:isForced(id)
	id = tostring(id)

	return self:getNumber(id, "forced") == 1
end

function AcademyAssessmentGuideTable:getCondition(id)
	id = tostring(id)

	return self:getNumber(id, "condition")
end

function AcademyAssessmentGuideTable:getDuration(id)
	id = tostring(id)

	return self:getNumber(id, "duration")
end

function AcademyAssessmentGuideTable:getDelay(id)
	id = tostring(id)

	return self:getNumber(id, "delay")
end

function AcademyAssessmentGuideTable:getPause(id)
	id = tostring(id)

	return self:split2num(id, "pause", "|")
end

function AcademyAssessmentGuideTable:getDialogType(id)
	id = tostring(id)

	return self:getNumber(id, "dialog_type")
end

function AcademyAssessmentGuideTable:getMaskType(id)
	id = tostring(id)

	return self:getNumber(id, "mask_type")
end

function AcademyAssessmentGuideTable:getMaskIcon(id)
	id = tostring(id)

	return self:getString(id, "mask_icon")
end

function AcademyAssessmentGuideTable:isTransition(id)
	id = tostring(id)

	return self:getNumber(id, "is_transition") == 1
end

function AcademyAssessmentGuideTable:getIconOffset(id)
	id = tostring(id)

	return self:split2num(id, "icon_offset", "|")
end

function AcademyAssessmentGuideTable:getSound(id)
	id = tostring(id)

	return self:getNumber(id, "sound")
end

function AcademyAssessmentGuideTable:getIDs()
	return self.ids_
end

function AcademyAssessmentGuideTable:init()
	local names = {}
	local stepNums = {}
	local idMaps = {}
	local forced = {}
	local marks = {}
	local stepFlags = {}
	local ids = self:getIDs()

	for i = 1, #ids do
		local id = ids[i]
		local name = self:getName(id)

		if xyd.arrayIndexOf(names, name) == -1 then
			table.insert(names, name)
		end

		local step = self:getStep(id)

		if not stepNums[name] or step > stepNums[name] then
			stepNums[name] = step
		end

		idMaps[name] = idMaps[name] or {}
		idMaps[name][step] = idMaps[name][step] or {}

		table.insert(idMaps[name][step], id)

		local mark = self:getMark(id)

		if mark then
			marks[name] = marks[name] or {}
			marks[name][step] = mark
		end

		if self:isForced(id) then
			forced[name] = true
		end

		local funcID = self:getFuncID(id)

		if funcID > 0 then
			self.funcIDs[funcID] = id
		end
	end

	self.names_ = names
	self.stepNums_ = stepNums
	self.idMaps_ = idMaps
	self.forced_ = forced
	self.marks_ = marks
end

function AcademyAssessmentGuideTable:getStepFlags(recordMarks)
	local stepFlags = {}

	for i = 1, #self.names_ do
		local name = self.names_[i]
		local stepFlag = 0

		for j = self.stepNums_[name], 1, -1 do
			if self.marks_[name] and self.marks_[name][j] and xyd.arrayIndexOf(recordMarks, self.marks_[name][j]) > -1 then
				stepFlag = j

				break
			end
		end

		stepFlags[name] = stepFlag
	end

	return stepFlags
end

function AcademyAssessmentGuideTable:getStepNums()
	return self.stepNums_
end

function AcademyAssessmentGuideTable:getIdMaps()
	return self.idMaps_
end

function AcademyAssessmentGuideTable:getForced()
	return self.forced_
end

function AcademyAssessmentGuideTable:getGuideByFuncID(funcID)
	return self.funcIDs[funcID]
end

function AcademyAssessmentGuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

function AcademyAssessmentGuideTable:getWndName(id)
	return self:getString(id, "wnd_name")
end

return AcademyAssessmentGuideTable
