-- chunkname: @../../../Product/Bundles/Android/src/app/common/SensitiveFilter.lua

local SensitiveFilter = class("SensitiveFilter")
local INSTANCE = {}

function SensitiveFilter:ctor(filterType)
	self.smap_ = {}
	self.upToLow_ = {}
	self.delimit_ = "__isEnd__"
	self.filterType_ = filterType

	local gap = string.byte("a") - string.byte("A")

	for i = string.byte("A"), string.byte("Z") do
		self.upToLow_[i] = i + gap
	end
end

function SensitiveFilter.get(filterType)
	local filterType = filterType or xyd.FilterType.Normal

	if INSTANCE[filterType] == nil then
		INSTANCE[filterType] = SensitiveFilter.new(filterType)

		INSTANCE[filterType]:init()
	end

	return INSTANCE[filterType]
end

function SensitiveFilter.getResTraderFilter()
	return SensitiveFilter.get(xyd.FilterType.ResTrader)
end

function SensitiveFilter:init()
	if not self.isInit_ then
		import("app.common.tables.TableParser").parse("sensitive", function(row)
			if tonumber(row.filterType) == self.filterType_ then
				self:initMap(string.split(row.word, ","))
			end
		end)

		self.isInit_ = true
	end
end

function SensitiveFilter:lower(ch)
	return self.upToLow_[ch] or ch
end

function SensitiveFilter:initMap(words)
	for _, word in pairs(words) do
		self:addWord(word)
	end
end

function SensitiveFilter:addWord(word)
	word = string.lower(word)

	local nowMap = self.smap_
	local newMap

	for i = 1, #word do
		local keyChar = string.byte(word, i)

		if nowMap[keyChar] ~= nil then
			nowMap = nowMap[keyChar]
		else
			newMap = {}
			nowMap[keyChar] = newMap
			nowMap = newMap
		end

		if i == #word and nowMap[self.delimit_] == nil then
			nowMap[self.delimit_] = true
		end
	end
end

function SensitiveFilter:isContainSensitiveWord(message)
	local nowMap
	local start = 1
	local messageLength = #message

	while start <= messageLength do
		nowMap = self.smap_

		for i = start, messageLength do
			local ch = self:lower(string.byte(message, i))

			if nowMap[ch] ~= nil then
				if nowMap[ch][self.delimit_] == nil then
					nowMap = nowMap[ch]
				else
					start = i

					return true
				end
			else
				break
			end

			if messageLength < i + 1 then
				break
			end
		end

		start = start + 1
	end

	return false
end

function SensitiveFilter:filter(message, repl)
	local ret = {}
	local nowMap
	local start = 1
	local step = 0
	local messageLength = #message

	repl = repl or "*"

	while start <= messageLength do
		nowMap = self.smap_
		step = 0

		for i = start, messageLength do
			local ch = self:lower(string.byte(message, i))

			if nowMap[ch] ~= nil then
				step = step + 1

				if nowMap[ch][self.delimit_] == nil then
					nowMap = nowMap[ch]
				else
					table.insert(ret, string.rep(repl, step))

					start = i

					break
				end
			else
				table.insert(ret, string.char(string.byte(message, start)))

				break
			end

			if messageLength < i + 1 then
				table.insert(ret, string.char(string.byte(message, start)))

				break
			end
		end

		start = start + 1
	end

	return table.concat(ret)
end

function SensitiveFilter:doHotFix(msg)
	if msg == nil then
		return
	end

	for _, word in ipairs(msg.shielding_words) do
		self:addWord(word)
	end
end

return SensitiveFilter
