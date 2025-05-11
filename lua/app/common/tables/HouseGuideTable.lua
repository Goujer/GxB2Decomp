-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseGuideTable.lua

local HouseGuideTable = class("HouseGuideTable", import("app.common.tables.BaseTable"))
local HouseGuideTextTable = xyd.tables.houseGuideTextTable

function HouseGuideTable:ctor()
	HouseGuideTable.super.ctor(self, "house_guide")

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

function HouseGuideTable:getIDByWindowName(name)
	return self.windowNames_[name] or {}
end

function HouseGuideTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function HouseGuideTable:getObjType(id)
	return self:getNumber(id, "obj_type")
end

function HouseGuideTable:getObjID(id)
	return self:getString(id, "obj_id")
end

function HouseGuideTable:isRecord(id)
	return self:getNumber(id, "record") == 1
end

function HouseGuideTable:getFuncID(id)
	return self:getNumber(id, "func_id")
end

function HouseGuideTable:getName(id)
	return self:getString(id, "name")
end

function HouseGuideTable:getMark(id)
	return self:getNumber(id, "mark")
end

function HouseGuideTable:getDesc(id)
	return HouseGuideTextTable:getDesc(id)
end

function HouseGuideTable:noCilck(id)
	return self:getNumber(id, "no_click") == 1
end

function HouseGuideTable:handType(id)
	return self:split2num(id, "hand_type", "|")
end

function HouseGuideTable:objScale(id)
	return self:split2num(id, "obj_scale", "|")
end

function HouseGuideTable:specialFunc(id)
	return self:getString(id, "special_func")
end

function HouseGuideTable:isBlack(id)
	return self:getNumber(id, "is_black") == 0
end

function HouseGuideTable:getStep(id)
	return self:getNumber(id, "step")
end

function HouseGuideTable:getNames()
	return self.names_
end

function HouseGuideTable:getPosition(id)
	return self:split2num(id, "position", "|")
end

function HouseGuideTable:isFlipX(id)
	return self:getNumber(id, "flip_x") == 1
end

function HouseGuideTable:isDragonbones(id)
	return self:getNumber(id, "is_dragonbones") == 1
end

function HouseGuideTable:getFingerFlip(id)
	return self:getNumber(id, "finger_flip")
end

function HouseGuideTable:isForced(id)
	return self:getNumber(id, "forced") == 1
end

function HouseGuideTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function HouseGuideTable:getDuration(id)
	return self:getNumber(id, "duration")
end

function HouseGuideTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function HouseGuideTable:getPause(id)
	return self:split2num(id, "pause", "|")
end

function HouseGuideTable:getDialogType(id)
	return self:getNumber(id, "dialog_type")
end

function HouseGuideTable:getMaskType(id)
	return self:getNumber(id, "mask_type")
end

function HouseGuideTable:getMaskIcon(id)
	return self:getString(id, "mask_icon")
end

function HouseGuideTable:isTransition(id)
	return self:getNumber(id, "is_transition") == 1
end

function HouseGuideTable:getIconOffset(id)
	return self:split2num(id, "icon_offset", "|")
end

function HouseGuideTable:getSound(id)
	return self:getNumber(id, "sound")
end

function HouseGuideTable:getIDs()
	return self.ids_
end

function HouseGuideTable:init()
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

function HouseGuideTable:getStepFlags(self, recordMarks)
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

function HouseGuideTable:getStepNums()
	return self.stepNums_
end

function HouseGuideTable:getIdMaps()
	return self.idMaps_
end

function HouseGuideTable:getForced()
	return self.forced_
end

function HouseGuideTable:getGuideByFuncID(self, funcID)
	return self.funcIDs[funcID]
end

function HouseGuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

function HouseGuideTable:getType(id)
	return self:getNumber(id, "type")
end

function HouseGuideTable:getFirstIndex(self, type)
	local ids = self:getIDs()

	for i = 1, #ids do
		local type_ = self:getType(ids[i])

		if type_ == type then
			return ids[i]
		end
	end
end

return HouseGuideTable
