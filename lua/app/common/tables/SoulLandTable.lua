-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulLandTable.lua

local SoulLandTable = class("SoulLandTable", import("app.common.tables.BaseTable"))

function SoulLandTable:ctor()
	SoulLandTable.super.ctor(self, "soul_land")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulLandTable:getIDs()
	return self.ids_
end

function SoulLandTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function SoulLandTable:getFortFirst(id)
	return self:getNumber(id, "fort_first")
end

function SoulLandTable:getFortId(id)
	return self:getNumber(id, "fort_id")
end

function SoulLandTable:getGodSkill(id)
	return self:getNumber(id, "god_skill")
end

function SoulLandTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function SoulLandTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function SoulLandTable:getDropbox(id)
	return self:getNumber(id, "dropbox")
end

function SoulLandTable:getAwardsShow(id)
	return self:split2Cost(id, "awards_show", "|#", true)
end

function SoulLandTable:getXy(id)
	return self:split2Cost(id, "xy", "|", true)
end

function SoulLandTable:getFortImg(id)
	return self:getString(id, "fort_img")
end

function SoulLandTable:getBattlePassPoint(id)
	return self:getNumber(id, "battle_pass_point")
end

function SoulLandTable:dealFortArr()
	if not self.fortArr then
		self.fortArr = {}
	end

	for i, id in pairs(self.ids_) do
		local fortId = self:getFortId(id)

		if not self.fortArr[fortId] then
			self.fortArr[fortId] = {}

			table.insert(self.fortArr[fortId], id)

			local checkId = id

			while true do
				local nextId = self:getNextId(checkId)

				if nextId and nextId > 0 then
					table.insert(self.fortArr[fortId], nextId)

					checkId = nextId
				else
					break
				end
			end
		end
	end
end

function SoulLandTable:getFortArr()
	if not self.fortArr then
		self:dealFortArr()
	end

	return self.fortArr
end

return SoulLandTable
