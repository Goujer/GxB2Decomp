-- chunkname: @../../../Product/Bundles/Android/src/app/components/BeeClass.lua

local BeeClass = class("BeeClass", import("app.components.CopyComponent"))
local PARAM_LEVEL = {
	NINE = 9,
	THIRTEEN = 13,
	EIGHT = 8,
	fIVE = 5,
	NINETEEN = 19,
	FOUR = 4,
	FOURTEEN = 14,
	EIGHTEEN = 18
}

function BeeClass:ctor(goItem, parent, data)
	self.data = data
	self.parent = parent
	self.dog = data.dog
	self.houseIndex = data.houseIndex
	self.speed = 0
	self.acceleration = 5
	self.isFirstBee = data.isFirstBee
	self.level = data.level
	self.arrowState = data.arrowState

	BeeClass.super.ctor(self, goItem)
end

function BeeClass:initUI()
	self:getUIComponent()
	BeeClass.super.initUI(self)
	self:register()
	self:layout()
end

function BeeClass:getUIComponent()
	self.bee = self.go
	self.beeUISprite = self.bee:GetComponent(typeof(UISprite))
	self.beeRigidbody = self.bee:GetComponent(typeof(UnityEngine.Rigidbody2D))
	self.beeEffect = self.bee:ComponentByName("beeEffect", typeof(UITexture))
end

function BeeClass:register()
	return
end

function BeeClass:layout()
	if not self.effect then
		self.effect = xyd.Spine.new(self.beeEffect.gameObject)

		self.effect:setInfo("fx_minigame_bee", function()
			self.effect:play("idle", 0)

			self.beeUISprite.enabled = false
		end)
		self.effect:SetLocalPosition(6.7, -8.2, 0)
		self.effect:SetLocalScale(-1, 1, 1)
	end
end

function BeeClass:setBeeIndex(index)
	self.beeIndex = index
end

function BeeClass:startGame()
	self.dogGameBox = self.bee:AddComponent(typeof(DogGameBox))

	self.dogGameBox:addCollisionEnterCallBack(self.onCollisionEnter)

	self.dogGameBox.houseIndex = self.houseIndex
	self.dogGameBox.beeIndex = self.beeIndex

	self.dogGameBox:addUpdateCallBack(self.updateCallBack)

	self.beeRigidbody.mass = 7
	self.targetDisX = 0 + math.random() * 8

	if math.random() > 0.5 then
		self.targetDisX = -1 * self.targetDisX
	end

	self.targetDisY = 12 + math.random() * 12

	if math.random() > 0.5 then
		self.targetDisY = -1 * self.targetDisY
	end

	if self.arrowState and self.arrowState == 1 then
		self.targetDisY = 12 + math.random() * 12
	elseif self.arrowState and self.arrowState == 2 then
		self.targetDisY = -(12 + math.random() * 12)
	end

	local flyDirectionRandom = 0.5

	if self.level == PARAM_LEVEL.EIGHT then
		flyDirectionRandom = 0.1
	elseif self.level == PARAM_LEVEL.THIRTEEN then
		flyDirectionRandom = 0
	end

	if flyDirectionRandom < math.random() then
		self.flyDirection = 1
	else
		self.flyDirection = -1
	end

	self.flyInitFrame = 8 + math.ceil(math.random() * 12)
	self.flyInitFrameCount = 0
	self.flyInitPosIsLeft = 1

	local leftRandom = 0.5

	if self.level == PARAM_LEVEL.EIGHT then
		leftRandom = 0.1
	elseif self.level == PARAM_LEVEL.THIRTEEN then
		leftRandom = 1
	end

	if leftRandom < math.random() then
		self.flyInitPosIsLeft = -1

		if self.level == PARAM_LEVEL.EIGHT then
			self.flyInitFrame = 40
		end
	end

	self.deviationX = 0.3 + math.random() * 0.25

	if self.level == PARAM_LEVEL.EIGHT then
		self.deviationX = 0 + math.random() * 0.25
	end

	if self.isFirstBee then
		self.deviationX = 0.2 + math.random() * 0.1
	end

	self.beeLastY = xyd.tables.dogMiniGameLevelTable:getBeeLastY(self.level)
	self.isLowestToUp = false

	if math.random() > 0.5 then
		self.isLowestToUp = true
	end
end

function BeeClass:getMass()
	return self.beeRigidbody.mass
end

function BeeClass:resetWaitOneSecondOpenDisperSed()
	if self.waitOneSecondOpenDisperSedKey then
		XYDCo.StopWait(self.waitOneSecondOpenDisperSedKey)

		self.waitOneSecondOpenDisperSedKey = nil
	end

	self.waitOneSecondOpenDisperSedKey = "dog_mini_game_bee_class_wait_one_second"

	self:waitForTime(1, function()
		self.isWaitOneSecondOpenDisperSed = false
	end, self.waitOneSecondOpenDisperSedKey)
end

function BeeClass.updateCallBack(no, houseIndex, beeIndex)
	local dogMiniGameWd = xyd.WindowManager.get():getWindow("dog_mini_game_window")

	if not dogMiniGameWd then
		return
	end

	local selfHouse = dogMiniGameWd:getHouseByIndex(houseIndex)

	if not selfHouse then
		return
	end

	local selfBee = selfHouse:getBeeByIndex(beeIndex)

	if not selfBee then
		return
	end

	if selfBee.isDeath or selfBee.isWin then
		return
	end

	if not selfBee.updateCount then
		selfBee.updateCount = 0
	end

	selfBee.updateCount = selfBee.updateCount + 1
	selfBee.speed = selfBee.speed + selfBee.acceleration

	if selfBee.speed > selfBee:getMass() * 6.5 then
		selfBee.speed = selfBee:getMass() * 6.5

		if selfBee.isWaitOneSecondOpenDisperSed then
			selfBee.speed = selfBee:getMass() * 5.5
		end
	end

	local dogPos = selfBee.dog:getGameObject().transform.localPosition
	local nowPos = selfBee:getGameObject().transform.localPosition

	if selfBee.level == PARAM_LEVEL.EIGHTEEN then
		dogPos.x = dogPos.x + 40
	end

	local dis = Vector2.Distance(nowPos, dogPos)
	local rad2Deg = 57.295779513082
	local angle = math.atan2((dogPos - nowPos).y, (dogPos - nowPos).x) * rad2Deg

	if angle > 90 or angle < -90 then
		selfBee:getGameObject():SetLocalScale(1, -1, 1)
	else
		selfBee:getGameObject():SetLocalScale(1, 1, 1)
	end

	selfBee:getGameObject().transform.localEulerAngles = Vector3(0, 0, angle)

	if not selfBee.isInitFly then
		if selfBee.flyInitFrameCount <= selfBee.flyInitFrame then
			if selfBee.flyDirection == 1 then
				if selfBee.flyInitPosIsLeft == 1 then
					selfBee.beeRigidbody.velocity = Vector3(selfBee.speed, 0, 0)
				else
					selfBee.beeRigidbody.velocity = Vector3(-selfBee.speed, 0, 0)
				end
			else
				selfBee.beeRigidbody.velocity = Vector3(0, -selfBee.speed, 0)
			end

			if selfBee.arrowState then
				if selfBee.arrowState == 1 then
					selfBee.beeRigidbody.velocity = Vector3(0, selfBee.speed, 0)
				elseif selfBee.arrowState == 2 then
					selfBee.beeRigidbody.velocity = Vector3(0, -selfBee.speed, 0)
				elseif selfBee.arrowState == 3 then
					selfBee.beeRigidbody.velocity = Vector3(-selfBee.speed, 0, 0)
				elseif selfBee.arrowState == 4 then
					selfBee.beeRigidbody.velocity = Vector3(selfBee.speed, 0, 0)
				end
			end
		else
			selfBee.isInitFly = true
		end

		selfBee.flyInitFrameCount = selfBee.flyInitFrameCount + 1
	end

	if not selfBee.isInitFly then
		return
	end

	local speedX = (dogPos.x - nowPos.x) / dis * selfBee.speed
	local speedY = (dogPos.y - nowPos.y) / dis * selfBee.speed

	if selfBee.isDisperSed then
		local disx = math.abs(dogPos.x - nowPos.x)

		if disx / dis < selfBee.deviationX then
			speedX = speedX + selfBee.targetDisX
		else
			speedY = speedY + selfBee.targetDisY
		end

		local beeAreaPart

		if selfBee.level == PARAM_LEVEL.FOUR then
			beeAreaPart = {
				4,
				-545,
				-500
			}
		end

		if beeAreaPart and #beeAreaPart > 0 then
			local direction = beeAreaPart[1]

			if direction == 1 then
				-- block empty
			elseif direction == 2 then
				-- block empty
			elseif direction == 3 then
				-- block empty
			elseif direction == 4 and nowPos.x > beeAreaPart[2] and nowPos.y < beeAreaPart[3] then
				if nowPos.x > dogPos.x then
					if speedX > 0 then
						speedX = -speedX
					end
				elseif speedX < 0 then
					speedX = -speedX
				end
			end
		end

		local beeBothBottom

		if selfBee.level == PARAM_LEVEL.fIVE then
			beeBothBottom = {
				-72,
				-125,
				125,
				-1
			}
		elseif selfBee.level == PARAM_LEVEL.EIGHT then
			beeBothBottom = {
				-166,
				-135,
				-69,
				1.5
			}
		elseif selfBee.level == PARAM_LEVEL.NINE then
			beeBothBottom = {
				-242,
				-2000,
				-217,
				-1
			}
		end

		if beeBothBottom and #beeBothBottom > 0 and nowPos.y < beeBothBottom[1] and nowPos.x > beeBothBottom[2] and nowPos.x < beeBothBottom[3] then
			local leftDis = math.abs(nowPos.x - beeBothBottom[2])
			local rightDis = math.abs(nowPos.x - beeBothBottom[3])

			if leftDis < rightDis then
				speedX = -5
			else
				speedX = 5

				if selfBee.level == 8 then
					speedX = -5
				end
			end

			if beeBothBottom[4] ~= -1 then
				speedY = speedY * beeBothBottom[4]
			end
		end
	end

	if selfBee.level == PARAM_LEVEL.EIGHTEEN then
		if (nowPos.x > 100 and nowPos.y > 189 or nowPos.x > 100 and nowPos.y < -173) and nowPos.x > 135 then
			speedX = -30
			selfBee.isChangeEighteenSpeedX = true
		end

		if selfBee.isChangeEighteenSpeedX and nowPos.x > 50 then
			speedX = -30
		end
	end

	if selfBee.level == PARAM_LEVEL.NINETEEN and selfBee.isCollisionBorder and selfBee.isCollisionBorder > 0 then
		speedY = selfBee.isCollisionBorder
		selfBee.isCollisionBorder = selfBee.isCollisionBorder - 1
	end

	if selfBee.level == PARAM_LEVEL.FOURTEEN then
		if nowPos.y < -700 then
			speedX = -10
		end

		if nowPos.x < -365 and nowPos.y < -95 then
			speedY = 20
		end
	end

	if selfBee:getGameObject().transform.localPosition.y < selfBee.beeLastY then
		selfBee.isFlyToUpCount = 20
	end

	if selfBee.isFlyToUpCount and selfBee.isFlyToUpCount > 0 then
		if selfBee.isLowestToUp then
			selfBee.isFlyToUpCount = selfBee.isFlyToUpCount - 1
			speedY = 5
		else
			selfBee.isFlyToUpCount = selfBee.isFlyToUpCount - 2
			speedY = 1
		end
	end

	selfBee.beeRigidbody.velocity = Vector3(speedX, speedY, 0)
end

function BeeClass.onCollisionEnter(collision, houseIndex, beeIndex)
	local dogMiniGameWd = xyd.WindowManager.get():getWindow("dog_mini_game_window")

	if not dogMiniGameWd then
		return
	end

	local selfHouse = dogMiniGameWd:getHouseByIndex(houseIndex)

	if not selfHouse then
		return
	end

	local selfBee = selfHouse:getBeeByIndex(beeIndex)

	if not selfBee then
		return
	end

	if selfBee.speed > 0 then
		selfBee.speed = selfBee:getMass() * 8

		if not selfBee.isDisperSed then
			selfBee.speed = selfBee:getMass() * 5
		end

		selfBee.speed = selfBee.speed * -1

		if not selfBee.isDisperSed then
			selfBee.isDisperSed = true
		end

		if selfBee.lastCollisionCount and selfBee.updateCount and selfBee.lastCollisionCount ~= selfBee.updateCount then
			local countDis = selfBee.updateCount - selfBee.lastCollisionCount

			if countDis > 1 and countDis < 7 then
				selfBee.isWaitOneSecondOpenDisperSed = true

				selfBee:resetWaitOneSecondOpenDisperSed()
			end
		end

		if selfBee.isWaitOneSecondOpenDisperSed then
			selfBee.isDisperSed = false
		end
	end

	selfBee.lastCollisionCount = selfBee.updateCount
	selfBee.isInitFly = true

	if selfBee.level == PARAM_LEVEL.EIGHTEEN and selfBee.isChangeEighteenSpeedX then
		selfBee.isChangeEighteenSpeedX = false
	end

	if selfBee.level == PARAM_LEVEL.NINETEEN and string.find(collision.gameObject.transform.name, "border") then
		selfBee.isCollisionBorder = 17
	end
end

function BeeClass.onTailCollisionEnter(collision, houseIndex, beeIndex)
	return
end

function BeeClass.onTailTrigerEnter(collision, houseIndex, beeIndex)
	return
end

function BeeClass.onTailTrigerStay(collision, houseIndex, beeIndex)
	return
end

function BeeClass.onTailTrigerExit(collision, houseIndex, beeIndex)
	return
end

function BeeClass:setDeath()
	self.isDeath = true

	if self.bee then
		local lineRigidbody2D = self.bee.gameObject:GetComponent(typeof(UnityEngine.Rigidbody2D))

		if lineRigidbody2D then
			lineRigidbody2D.bodyType = UnityEngine.RigidbodyType2D.Static
		end
	end
end

function BeeClass:setWin()
	self.isWin = true

	if self.bee then
		local lineRigidbody2D = self.bee.gameObject:GetComponent(typeof(UnityEngine.Rigidbody2D))

		if lineRigidbody2D then
			lineRigidbody2D.bodyType = UnityEngine.RigidbodyType2D.Static
		end
	end
end

return BeeClass
