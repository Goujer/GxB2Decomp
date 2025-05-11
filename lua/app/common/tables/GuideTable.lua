-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuideTable.lua

local GuideTable = class("GuideTable", import("app.common.tables.BaseTable"))

function GuideTable:ctor()
	if xyd.isDogVersionOpen() then
		GuideTable.super.ctor(self, "guide_" .. tostring(xyd.Global.guideType) .. "_new")
	else
		GuideTable.super.ctor(self, "guide_" .. tostring(xyd.Global.guideType))
	end

	self.ids_ = {}
	self.windowNames_ = {}
	self.names_ = {}
	self.stepNums_ = {}
	self.idMaps_ = {}
	self.forced_ = {}
	self.marks_ = {}
	self.funcIDs = {}

	local colIndexTable = self.TableLua.keys

	self:parseTable(function(id, row)
		local wndName = row[colIndexTable.window_name]

		self.windowNames_[wndName] = self.windowNames_[wndName] or {}

		table.insert(self.windowNames_[wndName], self:Number(id))
	end, true)
end

function GuideTable:getIDByWindowName(name)
	return self.windowNames_[name] or {}
end

function GuideTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function GuideTable:getObjType(id)
	return self:getNumber(id, "obj_type")
end

function GuideTable:getObjID(id)
	local objPath = self:split(id, "obj_id", "|")

	self:exchangeSpecilObjName(objPath)

	return objPath
end

function GuideTable:exchangeSpecilObjName(objPath)
	for i = 1, #objPath do
		local tmpPath = objPath[i]

		if string.find(tmpPath, "___0") then
			local target = xyd.GuideController.get().fiveComposePos

			objPath[i] = string.gsub(tmpPath, "___0", target)
		elseif string.find(tmpPath, "___1") then
			local target = xyd.GuideController.get().fiveShenxuePos

			objPath[i] = string.gsub(tmpPath, "___1", target)
		end
	end
end

function GuideTable:isRecord(id)
	return self:getNumber(id, "record") == 1
end

function GuideTable:getFuncID(id)
	return self:getNumber(id, "func_id")
end

function GuideTable:getName(id)
	return self:getString(id, "name")
end

function GuideTable:getMark(id)
	return self:getNumber(id, "mark")
end

function GuideTable:getDesc(id)
	return xyd.tables.guideTextTable:getDesc(id)
end

function GuideTable:noCilck(id)
	return self:getNumber(id, "no_click") == 1
end

function GuideTable:handType(id)
	return self:split2num(id, "hand_type", "|")
end

function GuideTable:objScale(id)
	return self:split2num(id, "obj_scale", "|")
end

function GuideTable:specialFunc(id)
	return self:getString(id, "special_func")
end

function GuideTable:isBlack(id)
	return self:getNumber(id, "is_black") == 0
end

function GuideTable:getStep(id)
	return self:getNumber(id, "step")
end

function GuideTable:getNames()
	return self.names_
end

function GuideTable:getPosition(id)
	return self:split2num(id, "position", "|")
end

function GuideTable:isFlipX(id)
	return self:getNumber(id, "flip_x") == 1
end

function GuideTable:getFingerFlip(id)
	return self:getNumber(id, "finger_flip")
end

function GuideTable:isForced(id)
	return self:getNumber(id, "forced") == 1
end

function GuideTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function GuideTable:getDuration(id)
	return self:getNumber(id, "duration")
end

function GuideTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function GuideTable:getPause(id)
	return self:split2num(id, "pause", "|")
end

function GuideTable:getDialogType(id)
	return self:getNumber(id, "dialog_type")
end

function GuideTable:getMaskType(id)
	return self:getNumber(id, "mask_type")
end

function GuideTable:getMaskIcon(id)
	return xyd.tables.guideTextTable:getMaskIcon(id)
end

function GuideTable:getMaskIconH5(id)
	return xyd.tables.guideTextTable:getMaskIconH5(id)
end

function GuideTable:isTransition(id)
	return self:getNumber(id, "is_transition") == 1
end

function GuideTable:getIconOffset(id)
	return xyd.tables.guideTextTable:getIconOffset(id)
end

function GuideTable:getIconOffsetH5(id)
	return xyd.tables.guideTextTable:getIconOffsetH5(id)
end

function GuideTable:getSound(id)
	return self:getNumber(id, "sound")
end

function GuideTable:specialArea(id)
	return self:split(id, "special_area", ",")
end

function GuideTable:loadGroup(id)
	return self:split(id, "load_group", "|")
end

function GuideTable:loadEffect(id)
	return self:split(id, "load_effect", "|")
end

function GuideTable:getSoft(id)
	return self:getNumber(id, "soft") == 1
end

function GuideTable:getIDs()
	return self.ids_
end

function GuideTable:init()
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

		if self:indexOf(names, name) == -1 then
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

function GuideTable:getStepFlags(recordMarks)
	local stepFlags = {}

	do
		local i = 0

		while i < #self.names_ do
			local name = self.names_[i + 1]
			local stepFlag = 0

			do
				local j = self.stepNums_[name]

				while j > 0 do
					if self.marks_[name] and self.marks_[name][j] and self:indexOf(recordMarks, self.marks_[name][j]) > -1 then
						stepFlag = j

						break
					end

					j = j - 1
				end
			end

			stepFlags[name] = stepFlag
			i = i + 1
		end
	end

	return stepFlags
end

function GuideTable:getStepNums()
	return self.stepNums_
end

function GuideTable:getIdMaps()
	return self.idMaps_
end

function GuideTable:getForced()
	return self.forced_
end

function GuideTable:getGuideByFuncID(funcID)
	return self.funcIDs[funcID]
end

function GuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

function GuideTable:resetInfo()
	self.names_ = {}
	self.stepNums_ = {}
	self.idMaps_ = {}
	self.forced_ = {}
	self.marks_ = {}
	self.funcIDs = {}
end

return GuideTable
