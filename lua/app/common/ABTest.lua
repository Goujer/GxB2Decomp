-- chunkname: @../../../Product/Bundles/Android/src/app/common/ABTest.lua

local ABTest = class("ABTest")

ABTest.INSTANCE = nil
ABTest.EXTRA_EDGE_SPACE = "extra_edge_space"
ABTest.EASIER_LEVEL_SEVEN = "easier_level_seven"
ABTest.EASIER_SCORE_TARGETS = "easier_score_targets"
ABTest.CANNOT_SKIP_GUIDE = "cannot_skip_guide"
ABTest.CAN_ENTER_HOME_MAP = "can_enter_home_map"
ABTest.is_ITEMS_GUIDE = "is_items_guide"
ABTest.TEST_GROUP = "A"
ABTest.CONTROL_GROUP = "B"
ABTest.ab_tests = {
	ABTest.CANNOT_SKIP_GUIDE,
	ABTest.CAN_ENTER_HOME_MAP,
	ABTest.is_ITEMS_GUIDE
}

function ABTest:ctor()
	self._setting = {}
	self._setting[ABTest.EXTRA_EDGE_SPACE] = true
	self._setting[ABTest.EASIER_LEVEL_SEVEN] = true
	self._setting[ABTest.EASIER_SCORE_TARGETS] = true
	self._setting[ABTest.CANNOT_SKIP_GUIDE] = false
	self._setting[ABTest.CAN_ENTER_HOME_MAP] = false
	self._setting[ABTest.is_ITEMS_GUIDE] = false
end

function ABTest:get()
	if ABTest.INSTANCE == nil then
		ABTest.INSTANCE = ABTest.new()
	end

	return ABTest.INSTANCE
end

function ABTest:setData(data)
	if not data then
		return
	end

	local ____TS_array = ABTest.ab_tests

	for ____TS_index = 1, #____TS_array do
		local testName = ____TS_array[____TS_index]
		local group = data[testName]

		if group then
			if group == ABTest.TEST_GROUP then
				self._setting[testName] = true
			elseif group == ABTest.CONTROL_GROUP then
				self._setting[testName] = false
			end
		end
	end
end

function ABTest:getSetting(key)
	if self._setting[key] then
		return self._setting[key]
	end

	return false
end

return ABTest
