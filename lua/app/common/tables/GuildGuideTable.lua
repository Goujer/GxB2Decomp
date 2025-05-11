-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildGuideTable.lua

local GuildGuideTable = class("GuildGuideTable", import("app.common.tables.BaseTable"))

function GuildGuideTable:ctor()
	GuildGuideTable.super.ctor(self, "guild_guide")

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
end

function GuildGuideTable:getIDByWindowName(name)
	return self.windowNames_[name + 1] or {}
end

function GuildGuideTable:getWindowName(id)
	return self:getString(id, "window_name")
end

function GuildGuideTable:getObjType(id)
	return self:getNumber(id, "obj_type")
end

function GuildGuideTable:getObjID(id)
	return self:getString(id, "obj_id")
end

function GuildGuideTable:isRecord(id)
	return self:getNumber(id, "record") == 1
end

function GuildGuideTable:getFuncID(id)
	return self:getNumber(id, "func_id")
end

function GuildGuideTable:getName(id)
	return self:getString(id, "name")
end

function GuildGuideTable:getMark(id)
	return self:getNumber(id, "mark")
end

function GuildGuideTable:getDesc(id)
	return xyd.tables.guildGuideTextTable:getDesc(id)
end

function GuildGuideTable:noCilck(id)
	return self:getNumber(id, "no_click") == 1
end

function GuildGuideTable:handType(id)
	return self:split2num(id, "hand_type", "|")
end

function GuildGuideTable:objScale(id)
	return self:split2num(id, "obj_scale", "|")
end

function GuildGuideTable:specialFunc(id)
	return self:getString(id, "special_func")
end

function GuildGuideTable:isBlack(id)
	return self:getNumber(id, "is_black") == 0
end

function GuildGuideTable:getStep(id)
	return self:getNumber(id, "step")
end

function GuildGuideTable:getNames()
	return self.names_
end

function GuildGuideTable:getPosition(id)
	return self:split2num(id, "position", "|")
end

function GuildGuideTable:isFlipX(id)
	return self:getNumber(id, "flip_x") == 1
end

function GuildGuideTable:isDragonbones(id)
	return self:getNumber(id, "is_dragonbones") == 1
end

function GuildGuideTable:getFingerFlip(id)
	return self:getNumber(id, "finger_flip")
end

function GuildGuideTable:isForced(id)
	return self:getNumber(id, "forced") == 1
end

function GuildGuideTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function GuildGuideTable:getDuration(id)
	return self:getNumber(id, "duration")
end

function GuildGuideTable:getDelay(id)
	return self:getNumber(id, "delay")
end

function GuildGuideTable:getPause(id)
	return self:split2num(id, "pause", "|")
end

function GuildGuideTable:getDialogType(id)
	return self:getNumber(id, "dialog_type")
end

function GuildGuideTable:getMaskType(id)
	return self:getNumber(id, "mask_type")
end

function GuildGuideTable:getMaskIcon(id)
	return self:getString(id, "mask_icon")
end

function GuildGuideTable:isTransition(id)
	return self:getNumber(id, "is_transition") == 1
end

function GuildGuideTable:getIconOffset(id)
	return self:split2num(id, "icon_offset", "|")
end

function GuildGuideTable:getSound(id)
	return self:getNumber(id, "sound")
end

function GuildGuideTable:getIDs()
	return self:sort(self.ids_, function(self, a, b)
		return self:Number(a) > self:Number(b) and 1 or -1
	end)
end

function GuildGuideTable:init()
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

			i = i + 1
		end
	end

	self.names_ = names
	self.stepNums_ = stepNums
	self.idMaps_ = idMaps
	self.forced_ = forced
	self.marks_ = marks
end

function GuildGuideTable:getStepFlags(recordMarks)
	local stepFlags = {}

	do
		local i = 0

		while i < #self.names_ do
			local name = self.names_[i + 1]
			local stepFlag = 0

			do
				local j = self.stepNums_[name]

				while j > 0 do
					if self.marks_[name] and self.marks_[name][j] and recordMarks:indexOf(self.marks_[name][j]) > -1 then
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

function GuildGuideTable:getStepNums()
	return self.stepNums_
end

function GuildGuideTable:getIdMaps()
	return self.idMaps_
end

function GuildGuideTable:getForced()
	return self.forced_
end

function GuildGuideTable:getGuideByFuncID(funcID)
	return self.funcIDs[funcID]
end

function GuildGuideTable:getAllData()
	return {
		names = self.names_,
		stepNums = self.stepNums_,
		idMaps = self.idMaps_,
		marks = self.marks_
	}
end

return GuildGuideTable
