-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/RandomNameTextTable.lua

local RandomNameTextTable = class("RandomNameTextTable", import("app.common.tables.BaseTable"))

function RandomNameTextTable:ctor()
	RandomNameTextTable.super.ctor(self, "random_name_text_" .. tostring(xyd.Global.lang))

	self.nameTypes = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]
		local type = row[colIndexTable.name_type]
		local text = row[colIndexTable.text]

		if not self.nameTypes[type + 1] then
			self.nameTypes[type + 1] = {}
		end

		table.insert(self.nameTypes[type + 1], text)
	end
end

function RandomNameTextTable:getDataByType(type)
	return self.nameTypes[type + 1] or {}
end

function RandomNameTextTable:getRandomName(lastRandomName)
	local randomName = ""
	local random

	function random()
		math.randomseed(os.time())

		local randomName = ""
		local firstName = ""
		local lastName = {}
		local middleName = {}
		local firstNameTable = {}
		local middleNameTable = {}
		local lastNameTable = {}
		local lastNameType = 0
		local nationalityType = math.ceil(math.random() * 2)

		firstNameTable = self:getDataByType(nationalityType)
		firstName = firstNameTable[math.floor(math.random() * #firstNameTable) + 1] or ""

		if nationalityType == xyd.EditPlayerName.CHINESE then
			lastNameType = math.floor(math.random() * 2) + xyd.EditPlayerName.CHINESE_FEMALE
			lastNameTable = self:getDataByType(lastNameType)
			middleNameTable = self:getDataByType(xyd.EditPlayerName.MIDDLE)
			middleName = middleNameTable[math.floor(math.random() * #middleNameTable) + 1]
			lastName = lastNameTable[math.floor(math.random() * #lastNameTable) + 1]
			randomName = tostring(firstName) .. tostring(middleName) .. tostring(lastName)
		elseif nationalityType == xyd.EditPlayerName.JANPANESE then
			lastNameType = math.floor(math.random() * 2) + xyd.EditPlayerName.JANPANESE_FEMALE
			lastNameTable = self:getDataByType(lastNameType)
			lastName = lastNameTable[math.floor(math.random() * #lastNameTable) + 1]
			randomName = tostring(firstName) .. tostring(lastName)
		end

		return randomName
	end

	local count = 100

	while randomName == "" or randomName == lastRandomName do
		randomName = random(_G)

		if randomName ~= lastRandomName then
			break
		end

		count = count - 1

		if count <= 0 then
			break
		end
	end

	return randomName
end

return RandomNameTextTable
