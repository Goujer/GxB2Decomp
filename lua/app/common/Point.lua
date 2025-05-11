-- chunkname: @../../../Product/Bundles/Android/src/app/common/Point.lua

local Point = class("Point")

function Point:ctor(x, y)
	self.x = x or 0
	self.y = y or 0
end

function Point:equals(toCompare)
	return self.x == toCompare.x and self.y == toCompare.y
end

function Point:distance(p1, p2)
	return math.sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y))
end

return Point
