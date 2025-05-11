-- chunkname: @../../../Product/Bundles/Android/src/app/common/SimpleQueue.lua

local SimpleQueue = class("SimpleQueue")

function SimpleQueue:ctor()
	self.data_ = {}
	self.headIndex_ = 1
	self.size_ = 0
end

function SimpleQueue:push(node)
	self.data_[self.headIndex_ + self.size_] = node
	self.size_ = self.size_ + 1
end

function SimpleQueue:pop()
	if self.size_ <= 0 then
		return nil
	end

	self.size_ = self.size_ - 1
	self.headIndex_ = self.headIndex_ + 1

	local res = self.data_[self.headIndex_ - 1]

	self.data_[self.headIndex_ - 1] = nil

	return res
end

function SimpleQueue:front()
	return self.data_[self.headIndex_]
end

function SimpleQueue:size()
	return self.size_
end

return SimpleQueue
