-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PetExskillGuideTable.lua

local PetExskillGuideTable = class("PetExskillGuideTable", import("app.common.tables.BaseTable"))
local PetExskillGuideTextTable = xyd.tables.petExskillGuideTextTable

function PetExskillGuideTable:ctor()
	PetExskillGuideTable.super.ctor(self, "pet_exskill_guide")

	self.ids_ = {}
	self.windowNames_ = {}
	self.names_ = {}
	self.stepNums_ = {}
	self.idMaps_ = {}
	self.forced_ = {}
	self.marks_ = {}
	self.funcIDs = {}

	local colIndexTable = self.TableLua.keys

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function PetExskillGuideTable:getIDByWindowName(name)
	return self.windowNames_[name] or {}
end

function PetExskillGuideTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function PetExskillGuideTable:getObjType(id)
	return self:getNumber(id, "obj_type")
end

function PetExskillGuideTable:getObjID(id)
	return self:getString(id, "obj_id")
end

function PetExskillGuideTable:isRecord(id)
	return self:getNumber(id, "record") == 1
end

function PetExskillGuideTable:getFuncID(id)
	return self:getNumber(id, "func_id")
end

function PetExskillGuideTable:getName(id)
	return self:getString(id, "name")
end

function PetExskillGuideTable:getMark(id)
	return self:getNumber(id, "mark")
end

function PetExskillGuideTable:getDesc(id)
	return PetExskillGuideTextTable:getDesc(id)
end

function PetExskillGuideTable:noCilck(id)
	return self:getNumber(id, "no_click") == 1
end

function PetExskillGuideTable:handType(id)
	return self:split2num(id, "hand_type", "|")
end

function PetExskillGuideTable:objScale(id)
	return self:split2num(id, "obj_scale", "|")
end

function PetExskillGuideTable:specialFunc(id)
	return self:getString(id, "special_func")
end

function PetExskillGuideTable:isBlack(id)
	return self:getNumber(id, "is_black") == 0
end

function PetExskillGuideTable:getStep(id)
	return self:getNumber(id, "step")
end

function PetExskillGuideTable:getNames()
	return self.names_
end

function PetExskillGuideTable:getPosition(id)
	return self:split2num(id, "position", "|")
end

function PetExskillGuideTable:isFlipX(id)
	return self:getNumber(id, "flip_x") == 1
end

function PetExskillGuideTable:isDragonbones(id)
	return self:getNumber(id, "is_dragonbones") == 1
end

function PetExskillGuideTable:getFingerFlip(id)
	return self:getNumber(id, "finger_flip")
end

function PetExskillGuideTable:isForced(id)
	return self:getNumber(id, "forced") == 1
end

function PetExskillGuideTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function PetExskillGuideTable:getDuration(id)
	return self:getNumber(id, "duration")
end

function PetExskillGuideTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function PetExskillGuideTable:getPause(id)
	return self:split2num(id, "pause", "|")
end

function PetExskillGuideTable:getDialogType(id)
	return self:getNumber(id, "dialog_type")
end

function PetExskillGuideTable:getMaskType(id)
	return self:getNumber(id, "mask_type")
end

function PetExskillGuideTable:getMaskIcon(id)
	return self:getString(id, "mask_icon")
end

function PetExskillGuideTable:isTransition(id)
	return self:getNumber(id, "is_transition") == 1
end

function PetExskillGuideTable:getIconOffset(id)
	return self:split2num(id, "icon_offset", "|")
end

function PetExskillGuideTable:getSound(id)
	return self:getNumber(id, "sound")
end

function PetExskillGuideTable:getIDs()
	return self.ids_
end

function PetExskillGuideTable:init()
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

		idMaps[name][step]:push(id)

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

function PetExskillGuideTable:getStepFlags(self, recordMarks)
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

function PetExskillGuideTable:getStepNums()
	return self.stepNums_
end

function PetExskillGuideTable:getIdMaps()
	return self.idMaps_
end

function PetExskillGuideTable:getForced()
	return self.forced_
end

function PetExskillGuideTable:getGuideByFuncID(self, funcID)
	return self.funcIDs[funcID]
end

function PetExskillGuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

function PetExskillGuideTable:getType(id)
	return self:getNumber(id, "type")
end

function PetExskillGuideTable:getFirstIndex(self, type)
	local ids = self:getIDs()

	for i = 1, #ids do
		local type_ = self:getType(ids[i])

		if type_ == type then
			return ids[i]
		end
	end
end

return PetExskillGuideTable
