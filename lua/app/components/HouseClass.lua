-- chunkname: @../../../Product/Bundles/Android/src/app/components/HouseClass.lua

local HouseClass = class("HouseClass", import("app.components.CopyComponent"))
local BeeClass = import("app.components.BeeClass")
local PARAM_LEVEL = {
	NINE = 9,
	THIRTEEN = 13,
	EIGHT = 8,
	fIVE = 5,
	FOUR = 4,
	EIGHTEEN = 18
}

function HouseClass:ctor(goItem, parent, data)
	self.data = data
	self.parent = parent
	self.bee = data.bee
	self.beeArr = {}
	self.beeCon = data.beeCon
	self.dog = data.dog
	self.beeNum = data.beeNum
	self.timeKeyCount = 0
	self.level = data.level
	self.waitTimeNum = 0.2

	HouseClass.super.ctor(self, goItem)
end

function HouseClass:initUI()
	self:getUIComponent()
	HouseClass.super.initUI(self)
	self:register()
	self:layout()
end

function HouseClass:getUIComponent()
	self.house = self.go
	self.houseUISprite = self.house:GetComponent(typeof(UISprite))
	self.housePolygonCollider2D = self.house:GetComponent(typeof(UnityEngine.PolygonCollider2D))
end

function HouseClass:register()
	return
end

function HouseClass:layout()
	return
end

function HouseClass:startGame()
	self.housePolygonCollider2D.enabled = false

	self:creatBee()
end

function HouseClass:creatBee()
	if self.isDeath or self.isWin then
		return
	end

	self.timeKeyCount = self.timeKeyCount + 1
	self.waitKey = "dog_bee_house_time_" .. self.houseIndex .. "_" .. self.timeKeyCount

	self:waitForTime(self.waitTimeNum, function()
		if self.isDeath or self.isWin then
			return
		end

		if self.beeNum > 0 then
			local tmp = NGUITools.AddChild(self.beeCon.gameObject, self.bee.gameObject)

			if not self.isFirstBee then
				self.isFirstBee = true
			end

			local params = {
				dog = self.dog,
				houseIndex = self.houseIndex,
				isFirstBee = self.isFirstBee,
				level = self.level
			}

			if self.level == PARAM_LEVEL.EIGHTEEN then
				if self.beeNum > 2 then
					if self.beeNum % 2 == 0 then
						params.arrowState = 1
					else
						params.arrowState = 2
					end
				else
					params.arrowState = 4
				end
			end

			local beeItem = BeeClass.new(tmp, self, params)
			local randomNumX = math.random() * 40
			local randomNumY = math.random() * 40

			if math.random() > 0.5 then
				randomNumY = -1 * randomNumX
			end

			local x = 0

			if math.random() > 0.5 then
				beeItem:SetLocalPosition(self.go.transform.localPosition.x, self.go.transform.localPosition.y, 0)
			else
				beeItem:SetLocalPosition(self.go.transform.localPosition.x, self.go.transform.localPosition.y, 0)
			end

			table.insert(self.beeArr, beeItem)
			beeItem:setBeeIndex(#self.beeArr)
			beeItem:startGame()

			self.beeNum = self.beeNum - 1

			if self.beeNum > 0 then
				if self.level == PARAM_LEVEL.EIGHTEEN and not self.isEighteenWaitCreate and self.beeNum <= 2 then
					self.isEighteenWaitCreate = true
					self.waitTimeNum = 6.4

					self:creatBee()
				else
					self.waitTimeNum = 0.2

					self:creatBee()
				end
			end
		end
	end, self.waitKey)
end

function HouseClass:setHouseIndex(houseIndex)
	self.houseIndex = houseIndex
end

function HouseClass:getBeeByIndex(beeIndex)
	return self.beeArr[beeIndex]
end

function HouseClass:setDeath()
	self.isDeath = true

	for i in pairs(self.beeArr) do
		self.beeArr[i]:setDeath()
	end

	if self.waitKey then
		XYDCo.StopWait(self.waitKey)

		self.waitKey = nil
	end
end

function HouseClass:setWin()
	if self.waitKey then
		XYDCo.StopWait(self.waitKey)

		self.waitKey = nil
	end

	self.isWin = true

	for i in pairs(self.beeArr) do
		self.beeArr[i]:setWin()
	end
end

function HouseClass:destroyBee()
	if self.waitKey then
		XYDCo.StopWait(self.waitKey)

		self.waitKey = nil
	end

	if self.beeArr and #self.beeArr > 0 then
		for i in pairs(self.beeArr) do
			UnityEngine.Object.Destroy(self.beeArr[i]:getGameObject())
		end
	end

	self.beeArr = {}
end

function HouseClass:reStart()
	if self.waitKey then
		XYDCo.StopWait(self.waitKey)

		self.waitKey = nil
	end

	self.isWin = false
	self.isDeath = false
end

return HouseClass
