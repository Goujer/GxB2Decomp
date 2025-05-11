-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GroupBuffTable.lua

local GroupBuffTable = class("GroupBuffTable", import("app.common.tables.BaseTable"))

function GroupBuffTable:ctor()
	GroupBuffTable.super.ctor(self, "group_buff")

	self.datas_ = {}
	self.ids_ = {}
	self.sortedIds_ = {}
	self.type3Id = 26

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		self.datas_[id] = {}

		for key in pairs(colIndexTable) do
			self.datas_[id][key] = row[colIndexTable[key]]
		end

		table.insert(self.ids_, tonumber(id))
		table.insert(self.sortedIds_, tonumber(id))

		if self:getType(id) == 3 then
			self.type3Id = id
		end
	end

	table.sort(self.sortedIds_, function(a, b)
		return self:getRank(a) < self:getRank(b)
	end)
end

function GroupBuffTable:getData(id)
	return self.datas_[id]
end

function GroupBuffTable:getIds()
	return self.ids_
end

function GroupBuffTable:getName(id)
	return self:getString(id, "name")
end

function GroupBuffTable:getGroupConfig(id)
	return self:getString(id, "group_config")
end

function GroupBuffTable:getEffect(id)
	return self:split(id, "effect", "|")
end

function GroupBuffTable:getEffectShow(id)
	return self:getString(id, "effect_show")
end

function GroupBuffTable:getFx(id)
	return self:getString(id, "fx")
end

function GroupBuffTable:getRank(id)
	return self:getNumber(id, "rank") or 0
end

function GroupBuffTable:getType3BuffData()
	local result = {}
	local showEffects = self:split(self.type3Id, "effect_show", "@")
	local effects = self:split(self.type3Id, "effect", "@")
	local stand = self:getStand(self.type3Id)

	for i = 1, 6 do
		result[i] = {}
		result[i].effectShow = showEffects[i]
		result[i].effect = effects[i]
		result[i].stand = stand
	end

	return result
end

function GroupBuffTable:getBuffIds(groupData)
	local result = {}

	for _, buffId in ipairs(self.sortedIds_) do
		local buffConfig = self:getGroupConfig(tonumber(buffId))
		local configList = xyd.split(buffConfig, "|", false)
		local type = self:getType(buffId)
		local flag = true
		local need7 = 0

		if tonumber(type) == 1 then
			for key, configStr in ipairs(configList) do
				local req = xyd.split(configStr, "#", true)

				if groupData[req[1]] > req[2] then
					flag = false

					break
				elseif groupData[req[1]] < req[2] then
					need7 = need7 + req[2] - groupData[req[1]]
				end
			end
		elseif tonumber(type) == 2 then
			if groupData[5] + groupData[6] > 3 then
				flag = false
			elseif groupData[5] + groupData[6] < 3 then
				need7 = 3 - groupData[5] - groupData[6]
			end

			if groupData[1] + groupData[2] + groupData[3] + groupData[4] > 3 then
				flag = false
			elseif groupData[1] + groupData[2] + groupData[3] + groupData[4] < 3 then
				need7 = need7 + 3 - groupData[1] - groupData[2] - groupData[3] - groupData[4]
			end

			if groupData[1] > 1 or groupData[2] > 1 or groupData[3] > 1 or groupData[4] > 1 then
				flag = false
			end
		else
			flag = false
		end

		if need7 > 0 and need7 ~= groupData[7] then
			flag = false
		end

		if flag then
			table.insert(result, {
				id = buffId
			})

			break
		end
	end

	if groupData[7] > 0 then
		table.insert(result, {
			id = self.type3Id,
			group7Num = groupData[7]
		})
	end

	return result
end

function GroupBuffTable:getEffectAndPos(groupData)
	local result = {
		effect = {},
		pos = {}
	}
	local buffIds = self:getBuffIds(groupData)

	for k, v in ipairs(buffIds) do
		if v.group7Num then
			local type3Data = self:getType3BuffData()

			for i = 1, v.group7Num do
				if not type3Data[i] then
					break
				end

				table.insert(result.effect, type3Data[i].effect)
				table.insert(result.pos, self:getStand(self.type3Id)[1])
			end
		else
			result.effect = self:getEffect(self:Number(v.id))
			result.pos = self:getStand(self:Number(v.id))
		end
	end

	return result
end

function GroupBuffTable:getType(id)
	return self:getString(id, "type")
end

function GroupBuffTable:getStand(id)
	return self:split(id, "effect_stands", "#")
end

function GroupBuffTable:getEffectStands(id)
	return self:split(id, "effect_stands", "#")
end

return GroupBuffTable
