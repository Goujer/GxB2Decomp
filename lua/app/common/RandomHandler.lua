-- chunkname: @../../../Product/Bundles/Android/src/app/common/RandomHandler.lua

local RandomHandler = class("RandomHandler")

function RandomHandler:ctor(randomSeed)
	if randomSeed == nil or randomSeed == 0 then
		self._randomSeed = math.floor(xyd.random(1, 230000))
	else
		self._randomSeed = randomSeed
	end

	print("RandomSeed: ", self._randomSeed)
end

function RandomHandler:next(min, max)
	max = max or 0
	min = min or 0
	self._randomSeed = (self._randomSeed * 9301 + 49297) % 233280

	local rnd = self._randomSeed / 233280

	return min + rnd * (max - min + 0.999999999)
end

function RandomHandler:nextInt(min, max)
	return math.floor(self:next(min, max))
end

function RandomHandler:nextDouble()
	self._randomSeed = (self._randomSeed * 9301 + 49297) % 233280

	return self._randomSeed / 233280
end

function RandomHandler:getSeed()
	return self._randomSeed
end

return RandomHandler
