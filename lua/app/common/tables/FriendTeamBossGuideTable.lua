-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendTeamBossGuideTable.lua

local FriendTeamBossGuideTable = class("FriendTeamBossGuideTable", import("app.common.tables.BaseTable"))

function FriendTeamBossGuideTable:ctor()
	FriendTeamBossGuideTable.super.ctor(self, "govern_guide")

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

function FriendTeamBossGuideTable:getIDByWindowName(name)
	return self.windowNames_[name + 1] or {}
end

function FriendTeamBossGuideTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function FriendTeamBossGuideTable:getObjType(id)
	return self:getNumber(id, "obj_type")
end

function FriendTeamBossGuideTable:getObjID(id)
	return self:getString(id, "obj_id")
end

function FriendTeamBossGuideTable:isRecord(id)
	return self:getNumber(id, "record") == 1
end

function FriendTeamBossGuideTable:getFuncID(id)
	return self:getNumber(id, "func_id")
end

function FriendTeamBossGuideTable:getName(id)
	return self:getString(id, "name")
end

function FriendTeamBossGuideTable:getMark(id)
	return self:getNumber(id, "mark")
end

function FriendTeamBossGuideTable:getDesc(id)
	return xyd.tables.friendTeamBossGuideTextTable:getDesc(id)
end

function FriendTeamBossGuideTable:noCilck(id)
	return self:getNumber(id, "no_click") == 1
end

function FriendTeamBossGuideTable:handType(id)
	return self:split2num(id, "hand_type", "|")
end

function FriendTeamBossGuideTable:objScale(id)
	return self:split2num(id, "obj_scale", "|")
end

function FriendTeamBossGuideTable:specialFunc(id)
	return self:getString(id, "special_func")
end

function FriendTeamBossGuideTable:isBlack(id)
	return self:getNumber(id, "is_black") == 0
end

function FriendTeamBossGuideTable:getStep(id)
	return self:getNumber(id, "step")
end

function FriendTeamBossGuideTable:getNames()
	return self.names_
end

function FriendTeamBossGuideTable:getPosition(id)
	return self:split2num(id, "position", "|")
end

function FriendTeamBossGuideTable:isFlipX(id)
	return self:getNumber(id, "flip_x") == 1
end

function FriendTeamBossGuideTable:isDragonbones(id)
	return self:getNumber(id, "is_dragonbones") == 1
end

function FriendTeamBossGuideTable:getFingerFlip(id)
	return self:getNumber(id, "finger_flip")
end

function FriendTeamBossGuideTable:isForced(id)
	return self:getNumber(id, "forced") == 1
end

function FriendTeamBossGuideTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function FriendTeamBossGuideTable:getDuration(id)
	return self:getNumber(id, "duration")
end

function FriendTeamBossGuideTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function FriendTeamBossGuideTable:getPause(id)
	return self:split2num(id, "pause", "|")
end

function FriendTeamBossGuideTable:getDialogType(id)
	return self:getNumber(id, "dialog_type")
end

function FriendTeamBossGuideTable:getMaskType(id)
	return self:getNumber(id, "mask_type")
end

function FriendTeamBossGuideTable:getMaskIcon(id)
	return self:getString(id, "mask_icon")
end

function FriendTeamBossGuideTable:isTransition(id)
	return self:getNumber(id, "is_transition") == 1
end

function FriendTeamBossGuideTable:getIconOffset(id)
	return self:split2num(id, "icon_offset", "|")
end

function FriendTeamBossGuideTable:getSound(id)
	return self:getNumber(id, "sound")
end

function FriendTeamBossGuideTable:getIDs()
	return self.ids_
end

function FriendTeamBossGuideTable:init()
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

function FriendTeamBossGuideTable:getStepFlags(recordMarks)
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

function FriendTeamBossGuideTable:getStepNums()
	return self.stepNums_
end

function FriendTeamBossGuideTable:getIdMaps()
	return self.idMaps_
end

function FriendTeamBossGuideTable:getForced()
	return self.forced_
end

function FriendTeamBossGuideTable:getGuideByFuncID(funcID)
	return self.funcIDs[funcID]
end

function FriendTeamBossGuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

function FriendTeamBossGuideTable:getType(id)
	return self:getNumber(id, "type")
end

function FriendTeamBossGuideTable:getFirstIndex(type)
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

return FriendTeamBossGuideTable
