-- chunkname: @../../../Product/Bundles/Android/src/app/common/network/NetworkConf.lua

local NetworkConf = class("NetworkConf")

function NetworkConf.get()
	if NetworkConf.INSTANCE == nil then
		NetworkConf.INSTANCE = NetworkConf.new()
	end

	return NetworkConf.INSTANCE
end

function NetworkConf:ctor()
	self:setupMidToConfMappings_()
end

function NetworkConf:getConf(mid)
	return self.confs_[mid] or {}
end

function NetworkConf:setupMidToConfMappings_()
	self.confs_ = {
		[xyd.mid.BUY_ITEM] = {
			event = xyd.event.BUY_ITEM,
			protos = messages_pb.buy_item_res()
		}
	}
end

return NetworkConf
