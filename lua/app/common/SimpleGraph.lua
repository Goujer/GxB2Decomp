-- chunkname: @../../../Product/Bundles/Android/src/app/common/SimpleGraph.lua

local SimpleGraph = class("SimpleGraph")
local SimpleGraphNode = import("app.common.SimpleGraphNode")

function SimpleGraph:ctor()
	self._nodesMap = {}
end

function SimpleGraph:addNode(key, val, parentKeys)
	local node = self:getNode(key)

	if node == nil then
		return false
	end

	node.val = val

	for _, parentKey in pairs(parentKeys) do
		parentKey = tonumber(parentKey)

		local parentNode = self:getNode(parentKey)

		if parentNode ~= nil then
			parentNode:addChild(node)
		end
	end

	return true
end

function SimpleGraph:getNode(key)
	if tonumber(key) > 0 then
		local node = self._nodesMap[key]

		if node == nil then
			node = SimpleGraphNode.new(key, nil)
			self._nodesMap[key] = node
		end

		return node
	else
		return nil
	end
end

return SimpleGraph
