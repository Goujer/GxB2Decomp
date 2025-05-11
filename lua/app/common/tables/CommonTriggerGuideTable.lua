-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CommonTriggerGuideTable.lua

local CommonTriggerGuideTable = class("CommonTriggerGuideTable", import("app.common.tables.BaseTable"))
local CommonTriggerGuideTextTable = xyd.tables.commonTriggerGuideTextTable

function CommonTriggerGuideTable:ctor()
	CommonTriggerGuideTable.super.ctor(self, "common_trigger_guide")

	self.ids_ = {}
	self.windowNames_ = {}
	self.names_ = {}
	self.stepNums_ = {}
	self.idMaps_ = {}
	self.forced_ = {}
	self.marks_ = {}
	self.funcIDs = {}
	self.idsWithType = {}

	local colIndexTable = self.TableLua.keys

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	for i in pairs(self.ids_) do
		local type = self:getType(self.ids_[i])

		if not self.idsWithType[type] then
			self.idsWithType[type] = {}
		end

		table.insert(self.idsWithType[type], self.ids_[i])
	end
end

function CommonTriggerGuideTable:getIDByWindowName(name)
	return self.windowNames_[name] or {}
end

function CommonTriggerGuideTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function CommonTriggerGuideTable:getObjType(id)
	return self:getNumber(id, "obj_type")
end

function CommonTriggerGuideTable:getObjID(id)
	return self:getString(id, "obj_id")
end

function CommonTriggerGuideTable:isRecord(id)
	return self:getNumber(id, "record") == 1
end

function CommonTriggerGuideTable:getFuncID(id)
	return self:getNumber(id, "func_id")
end

function CommonTriggerGuideTable:getName(id)
	return self:getString(id, "name")
end

function CommonTriggerGuideTable:getMark(id)
	return self:getNumber(id, "mark")
end

function CommonTriggerGuideTable:getDesc(id)
	return CommonTriggerGuideTextTable:getDesc(id)
end

function CommonTriggerGuideTable:noCilck(id)
	return self:getNumber(id, "no_click") == 1
end

function CommonTriggerGuideTable:getHandType(id)
	local handType = self:getNumber(id, "hand_type")

	handType = handType or 0

	return handType
end

function CommonTriggerGuideTable:getHandPos(id)
	local posArr = self:split2num(id, "hand_pos", "|")

	posArr = posArr or {}

	return posArr
end

function CommonTriggerGuideTable:getObjScale(id)
	local objScale = self:split2num(id, "obj_scale", "|")

	objScale = objScale or {}

	return objScale
end

function CommonTriggerGuideTable:specialFunc(id)
	return self:getString(id, "special_func")
end

function CommonTriggerGuideTable:isBlack(id)
	return self:getNumber(id, "is_black") == 0
end

function CommonTriggerGuideTable:getStep(id)
	return self:getNumber(id, "step")
end

function CommonTriggerGuideTable:getNames()
	return self.names_
end

function CommonTriggerGuideTable:getPosition(id)
	return self:split2num(id, "position", "|")
end

function CommonTriggerGuideTable:isFlipX(id)
	return self:getNumber(id, "flip_x") == 1
end

function CommonTriggerGuideTable:isDragonbones(id)
	return self:getNumber(id, "is_dragonbones") == 1
end

function CommonTriggerGuideTable:getFingerFlip(id)
	return self:getNumber(id, "finger_flip")
end

function CommonTriggerGuideTable:isForced(id)
	return self:getNumber(id, "forced") == 1
end

function CommonTriggerGuideTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function CommonTriggerGuideTable:getDuration(id)
	return self:getNumber(id, "duration")
end

function CommonTriggerGuideTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function CommonTriggerGuideTable:getPause(id)
	return self:split2num(id, "pause", "|")
end

function CommonTriggerGuideTable:getDialogType(id)
	return self:getNumber(id, "dialog_type")
end

function CommonTriggerGuideTable:getMaskType(id)
	local maskType = self:getNumber(id, "mask_type")

	maskType = maskType or 0

	return maskType
end

function CommonTriggerGuideTable:getMaskIcon(id)
	return self:getString(id, "mask_icon")
end

function CommonTriggerGuideTable:isTransition(id)
	return self:getNumber(id, "is_transition") == 1
end

function CommonTriggerGuideTable:getOffset(id)
	local offset = self:split2num(id, "offset", "|")

	if not offset or #offset == 0 then
		offset = {
			0,
			0
		}
	end

	return offset
end

function CommonTriggerGuideTable:getIconOffset(id)
	return self:split2num(id, "icon_offset", "|")
end

function CommonTriggerGuideTable:getSound(id)
	return self:getNumber(id, "sound")
end

function CommonTriggerGuideTable:getIDs()
	return self.ids_
end

function CommonTriggerGuideTable:init()
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

function CommonTriggerGuideTable:getStepFlags(self, recordMarks)
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

function CommonTriggerGuideTable:getStepNums()
	return self.stepNums_
end

function CommonTriggerGuideTable:getIdMaps()
	return self.idMaps_
end

function CommonTriggerGuideTable:getForced()
	return self.forced_
end

function CommonTriggerGuideTable:getGuideByFuncID(self, funcID)
	return self.funcIDs[funcID]
end

function CommonTriggerGuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

function CommonTriggerGuideTable:getType(id)
	return self:getNumber(id, "type")
end

function CommonTriggerGuideTable:getFirstIndex(type)
	return self.idsWithType[type][1]
end

function CommonTriggerGuideTable:getDelayFrame(id)
	return self:getNumber(id, "delay_frame")
end

return CommonTriggerGuideTable
