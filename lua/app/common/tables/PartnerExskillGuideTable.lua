-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerExskillGuideTable.lua

local PartnerExskillGuideTable = class("PartnerExskillGuideTable", import("app.common.tables.BaseTable"))

function PartnerExskillGuideTable:ctor()
	PartnerExskillGuideTable.super.ctor(self, "partner_exskill_guide")

	self.ids_ = {}
	self.windowNames_ = {}
	self.names_ = {}
	self.stepNums_ = {}
	self.idMaps_ = {}
	self.forced_ = {}
	self.marks_ = {}
	self.funcIDs = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function PartnerExskillGuideTable:getIDByWindowName(name)
	return self.windowNames_[name + 1] or {}
end

function PartnerExskillGuideTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function PartnerExskillGuideTable:getObjType(id)
	return self:getNumber(id, "obj_type")
end

function PartnerExskillGuideTable:getObjID(id)
	return self:getString(id, "obj_id")
end

function PartnerExskillGuideTable:isRecord(id)
	return self:getNumber(id, "record") == 1
end

function PartnerExskillGuideTable:getFuncID(id)
	return self:getNumber(id, "func_id")
end

function PartnerExskillGuideTable:getName(id)
	return self:getString(id, "name")
end

function PartnerExskillGuideTable:getMark(id)
	return self:getNumber(id, "mark")
end

function PartnerExskillGuideTable:getDesc(id)
	return xyd.tables.partnerExskillGuideTextTable:getDesc(id)
end

function PartnerExskillGuideTable:noCilck(id)
	return self:getNumber(id, "no_click") == 1
end

function PartnerExskillGuideTable:handType(id)
	return self:split2num(id, "hand_type", "|")
end

function PartnerExskillGuideTable:objScale(id)
	return self:split2num(id, "obj_scale", "|")
end

function PartnerExskillGuideTable:specialFunc(id)
	return self:getString(id, "special_func")
end

function PartnerExskillGuideTable:isBlack(id)
	return self:getNumber(id, "is_black") == 0
end

function PartnerExskillGuideTable:getStep(id)
	return self:getNumber(id, "step")
end

function PartnerExskillGuideTable:getNames()
	return self.names_
end

function PartnerExskillGuideTable:getPosition(id)
	return self:split2num(id, "position", "|")
end

function PartnerExskillGuideTable:isFlipX(id)
	return self:getNumber(id, "flip_x") == 1
end

function PartnerExskillGuideTable:isDragonbones(id)
	return self:getNumber(id, "is_dragonbones") == 1
end

function PartnerExskillGuideTable:getFingerFlip(id)
	return self:getNumber(id, "finger_flip")
end

function PartnerExskillGuideTable:isForced(id)
	return self:getNumber(id, "forced") == 1
end

function PartnerExskillGuideTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function PartnerExskillGuideTable:getDuration(id)
	return self:getNumber(id, "duration")
end

function PartnerExskillGuideTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function PartnerExskillGuideTable:getPause(id)
	return self:split2num(id, "pause", "|")
end

function PartnerExskillGuideTable:getDialogType(id)
	return self:getNumber(id, "dialog_type")
end

function PartnerExskillGuideTable:getMaskType(id)
	return self:getNumber(id, "mask_type")
end

function PartnerExskillGuideTable:getMaskIcon(id)
	return self:getString(id, "mask_icon")
end

function PartnerExskillGuideTable:isTransition(id)
	return self:getNumber(id, "is_transition") == 1
end

function PartnerExskillGuideTable:getIconOffset(id)
	return self:split2num(id, "icon_offset", "|")
end

function PartnerExskillGuideTable:getSound(id)
	return self:getNumber(id, "sound")
end

function PartnerExskillGuideTable:getIDs()
	return self.ids_
end

function PartnerExskillGuideTable:init()
	local names = {}
	local stepNums = {}
	local idMaps = {}
	local forced = {}
	local marks = {}
	local stepFlags = {}
	local ids = self:getIDs()

	do
		local i = 0

		while i < #ids do
			local id = ids[i + 1]
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

			i = i + 1
		end
	end

	self.names_ = names
	self.stepNums_ = stepNums
	self.idMaps_ = idMaps
	self.forced_ = forced
	self.marks_ = marks
end

function PartnerExskillGuideTable:getStepFlags(recordMarks)
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

function PartnerExskillGuideTable:getStepNums()
	return self.stepNums_
end

function PartnerExskillGuideTable:getIdMaps()
	return self.idMaps_
end

function PartnerExskillGuideTable:getForced()
	return self.forced_
end

function PartnerExskillGuideTable:getGuideByFuncID(funcID)
	return self.funcIDs[funcID]
end

function PartnerExskillGuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

function PartnerExskillGuideTable:getType(id)
	return self:getNumber(id, "type")
end

function PartnerExskillGuideTable:getFirstIndex(type)
	local ids = self:getIDs()
	local i = 0

	while i < #ids do
		local type_ = self:getType(ids[i + 1])

		if type_ == type then
			return ids[i + 1]
		end

		i = i + 1
	end
end

function PartnerExskillGuideTable:getDelayFrame(id)
	return self:getNumber(id, "delay_frame")
end

return PartnerExskillGuideTable
