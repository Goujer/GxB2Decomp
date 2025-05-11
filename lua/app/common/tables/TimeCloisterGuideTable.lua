-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterGuideTable.lua

local TimeCloisterGuideTable = class("TimeCloisterGuideTable", import("app.common.tables.BaseTable"))
local TimeCloisterGuideTextTable = xyd.tables.timeCloisterGuideTextTable

function TimeCloisterGuideTable:ctor()
	TimeCloisterGuideTable.super.ctor(self, "time_cloister_guide")

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

function TimeCloisterGuideTable:getIDByWindowName(name)
	return self.windowNames_[name] or {}
end

function TimeCloisterGuideTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function TimeCloisterGuideTable:getObjType(id)
	return self:getNumber(id, "obj_type")
end

function TimeCloisterGuideTable:getObjID(id)
	return self:getString(id, "obj_id")
end

function TimeCloisterGuideTable:isRecord(id)
	return self:getNumber(id, "record") == 1
end

function TimeCloisterGuideTable:getFuncID(id)
	return self:getNumber(id, "func_id")
end

function TimeCloisterGuideTable:getName(id)
	return self:getString(id, "name")
end

function TimeCloisterGuideTable:getMark(id)
	return self:getNumber(id, "mark")
end

function TimeCloisterGuideTable:getDesc(id)
	return TimeCloisterGuideTextTable:getDesc(id)
end

function TimeCloisterGuideTable:noCilck(id)
	return self:getNumber(id, "no_click") == 1
end

function TimeCloisterGuideTable:getHandType(id)
	local handType = self:getNumber(id, "hand_type")

	handType = handType or 0

	return handType
end

function TimeCloisterGuideTable:getHandPos(id)
	local posArr = self:split2num(id, "hand_pos", "|")

	posArr = posArr or {}

	return posArr
end

function TimeCloisterGuideTable:getObjScale(id)
	local objScale = self:split2num(id, "obj_scale", "|")

	objScale = objScale or {}

	return objScale
end

function TimeCloisterGuideTable:specialFunc(id)
	return self:getString(id, "special_func")
end

function TimeCloisterGuideTable:isBlack(id)
	return self:getNumber(id, "is_black") == 0
end

function TimeCloisterGuideTable:getStep(id)
	return self:getNumber(id, "step")
end

function TimeCloisterGuideTable:getNames()
	return self.names_
end

function TimeCloisterGuideTable:getPosition(id)
	return self:split2num(id, "position", "|")
end

function TimeCloisterGuideTable:isFlipX(id)
	return self:getNumber(id, "flip_x") == 1
end

function TimeCloisterGuideTable:isDragonbones(id)
	return self:getNumber(id, "is_dragonbones") == 1
end

function TimeCloisterGuideTable:getFingerFlip(id)
	return self:getNumber(id, "finger_flip")
end

function TimeCloisterGuideTable:isForced(id)
	return self:getNumber(id, "forced") == 1
end

function TimeCloisterGuideTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function TimeCloisterGuideTable:getDuration(id)
	return self:getNumber(id, "duration")
end

function TimeCloisterGuideTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function TimeCloisterGuideTable:getPause(id)
	return self:split2num(id, "pause", "|")
end

function TimeCloisterGuideTable:getDialogType(id)
	return self:getNumber(id, "dialog_type")
end

function TimeCloisterGuideTable:getMaskType(id)
	local maskType = self:getNumber(id, "mask_type")

	maskType = maskType or 0

	return maskType
end

function TimeCloisterGuideTable:getMaskIcon(id)
	return self:getString(id, "mask_icon")
end

function TimeCloisterGuideTable:isTransition(id)
	return self:getNumber(id, "is_transition") == 1
end

function TimeCloisterGuideTable:getOffset(id)
	local offset = self:split2num(id, "offset", "|")

	if not offset or #offset == 0 then
		offset = {
			0,
			0
		}
	end

	return offset
end

function TimeCloisterGuideTable:getIconOffset(id)
	return self:split2num(id, "icon_offset", "|")
end

function TimeCloisterGuideTable:getSound(id)
	return self:getNumber(id, "sound")
end

function TimeCloisterGuideTable:getIDs()
	return self.ids_
end

function TimeCloisterGuideTable:init()
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

function TimeCloisterGuideTable:getStepFlags(self, recordMarks)
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

function TimeCloisterGuideTable:getStepNums()
	return self.stepNums_
end

function TimeCloisterGuideTable:getIdMaps()
	return self.idMaps_
end

function TimeCloisterGuideTable:getForced()
	return self.forced_
end

function TimeCloisterGuideTable:getGuideByFuncID(self, funcID)
	return self.funcIDs[funcID]
end

function TimeCloisterGuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

function TimeCloisterGuideTable:getType(id)
	return self:getNumber(id, "type")
end

function TimeCloisterGuideTable:getFirstIndex(type)
	local ids = self:getIDs()

	for i in pairs(ids) do
		local type_ = self:getType(ids[i])

		if type_ == type then
			return ids[i]
		end
	end
end

function TimeCloisterGuideTable:getDelayFrame(id)
	return self:getNumber(id, "delay_frame")
end

return TimeCloisterGuideTable
