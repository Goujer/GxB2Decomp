-- chunkname: @../../../Product/Bundles/Android/src/app/common/SimpleGraphNode.lua

local SimpleGraphNode = class("SimpleGraphNode")

function SimpleGraphNode:ctor(key, val)
	self.key = key
	self.val = val
	self.parent = {}
	self.children = {}
end

function SimpleGraphNode:addChild(child)
	local dup = false

	for _, v in pairs(self.children) do
		if v.key == child.key then
			dup = true
		end
	end

	if not dup then
		table.insert(self.children, child)
		table.insert(child.parent, self)
	end
end

return SimpleGraphNode
