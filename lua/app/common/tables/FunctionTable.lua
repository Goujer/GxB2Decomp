-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FunctionTable.lua

local FunctionTable = class("FunctionTable", import("app.common.tables.BaseTable"))

function FunctionTable:ctor()
	FunctionTable.super.ctor(self, "function")

	self.levels_ = {}
	self.guideName_ = {}
	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.levels_, {
			level = self:getOpenValue(id),
			id = self:Number(id)
		})

		local name_ = row[colIndexTable.guide_name]

		self.guideName_[name_] = self:Number(id)

		table.insert(self.ids_, tonumber(id))
	end
end

function FunctionTable:getName(id)
	return xyd.tables.functionTextTable:getName(id)
end

function FunctionTable:getOpenType(id)
	return self:getNumber(id, "open_type")
end

function FunctionTable:getOpenValue(id)
	return self:getNumber(id, "open_value")
end

function FunctionTable:getDesc(id)
	return xyd.tables.functionTextTable:getDesc(id)
end

function FunctionTable:isGuide(id)
	local isGuide = self:getNumber(id, "is_guide") == 1

	if id == xyd.FunctionID.STARRY_ALTAR then
		local openTime = tonumber(xyd.tables.miscTable:getVal("starry_altar_open_time"))
		local nowTime = xyd.getServerTime()

		if nowTime < openTime then
			isGuide = false
		end
	end

	return isGuide
end

function FunctionTable:getGuideName(id)
	return self:getString(id, "guide_name")
end

function FunctionTable:getFuncIdByName(name_)
	return self.guideName_[name_] or 0
end

function FunctionTable:getGuideFuncIDs(newLev)
	local ids = {}
	local skinFuncID = xyd.FunctionID.SKIN

	for i = 1, #self.ids_ do
		local id = self.ids_[i]

		if xyd.checkFunctionOpen(id, true) or id == skinFuncID and xyd.models.backpack:isHasSkin() and self:isGuide(id) then
			table.insert(ids, id)
		end
	end

	return ids
end

function FunctionTable:getFuncIDsByLev(lev)
	local ids = {}

	for i = 1, #self.ids_ do
		local id = self.ids_[i]

		if xyd.checkFunctionOpen(id, true) then
			table.insert(ids, id)
		end
	end

	return ids
end

function FunctionTable:getIcon(id)
	return self:getString(id, "icon")
end

function FunctionTable:guideRank(id)
	return self:getNumber(id, "guide_rank")
end

function FunctionTable:checkFuncOpen(id)
	local lev = self:getOpenValue(id)
	local flag = false

	if id == xyd.FunctionID.OLD_SCHOOL then
		flag = xyd.models.oldSchool:isCanOpen()
	elseif lev <= xyd.models.backpack:getLev() then
		flag = true
	elseif id == xyd.SKIN_FUNC_ID and xyd.models.backpack:isHasSkin() then
		flag = true
	end

	return flag
end

function FunctionTable:openInReview(id)
	return self:getNumber(id, "is_review") == 1
end

return FunctionTable
