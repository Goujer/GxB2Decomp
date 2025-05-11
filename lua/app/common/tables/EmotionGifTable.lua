-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/EmotionGifTable.lua

local EmotionGifTable = class("EmotionGifTable", import("app.common.tables.BaseTable"))

function EmotionGifTable:ctor()
	EmotionGifTable.super.ctor(self, "emoticon_gif")

	self.ids = {}
	self.canUseIds = nil
	self.awardIds = nil

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, self:Number(id))
	end

	table.sort(self.ids)
end

function EmotionGifTable:getIds()
	return self.ids
end

function EmotionGifTable:buildAwardIds()
	if not self.awardIds then
		self.awardIds = {}
	end

	for i = 1, #self.ids do
		local id = self.ids[i]

		if self:getIsAward(id) and self:getIsShow(id) == 1 then
			table.insert(self.awardIds, id)
		end
	end
end

function EmotionGifTable:getCollectionId(id)
	return self:getNumber(id, "collection_id")
end

function EmotionGifTable:getAwardIds()
	if not self.awardIds then
		self:buildAwardIds()
	end

	table.sort(self.awardIds, function(a, b)
		local rankA = -self:getRank(a) or 0
		local rankB = -self:getRank(b) or 0

		if rankA == 0 then
			rankA = a / 100
		end

		if rankB == 0 then
			rankB = b / 100
		end

		return rankB < rankA
	end)

	return self.awardIds
end

function EmotionGifTable:getRank(id)
	return self:getNumber(id, "rank")
end

function EmotionGifTable:getItemId(id)
	return self:getNumber(id, "item_id")
end

function EmotionGifTable:getIsAward(id)
	return self:getNumber(id, "is_award") == 1
end

function EmotionGifTable:getImg(id)
	return self:getString(id, "image")
end

function EmotionGifTable:getGif(id)
	return self:getString(id, "gif")
end

function EmotionGifTable:getIsShow(id)
	return self:getNumber(id, "is_show")
end

function EmotionGifTable:buildCanUseIds()
	if not self.canUseIds then
		self.canUseIds = {}

		for i = 1, #self.ids do
			local id = self.ids[i]

			if self:getIsShow(id) == 1 and not self:getIsAward(id) then
				table.insert(self.canUseIds, id)
			end
		end
	end
end

function EmotionGifTable:getCanUseIds()
	if not self.canUseIds then
		self:buildCanUseIds()
	end

	return self.canUseIds
end

function EmotionGifTable:getLength()
	if not self.canUseIds then
		self:buildCanUseIds()
	end

	return #self.canUseIds
end

function EmotionGifTable:getAllLength()
	return #self.ids
end

function EmotionGifTable:getGifPos(id)
	return self:split2Cost(id, "gif_pos_" .. tostring(xyd.Global.lang), "|")
end

function EmotionGifTable:getScale(id)
	return self:getNumber(id, "gif_scale")
end

return EmotionGifTable
