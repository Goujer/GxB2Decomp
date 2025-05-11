-- chunkname: @../../../Product/Bundles/Android/src/app/common/UAtlas.lua

local UAtlas = class("UAtlas")

function UAtlas:ctor(sprites)
	self.sprites_ = {}

	for i = 0, sprites.Length - 1 do
		local sprite = sprites[i]

		if not tolua.isnull(sprite) then
			local name = sprite.name

			self.sprites_[name] = sprite
		end
	end
end

function UAtlas:getSpriteByName(name)
	return self.sprites_[name]
end

function UAtlas:getAllSprites()
	return self.sprites_
end

function UAtlas:dispose()
	self.sprites_ = {}
end

return UAtlas
