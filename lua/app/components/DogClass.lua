-- chunkname: @../../../Product/Bundles/Android/src/app/components/DogClass.lua

local DogClass = class("DogClass", import("app.components.CopyComponent"))

function DogClass:ctor(goItem, parent, data)
	self.data = data
	self.parent = parent
	self.borderDogMaterial = data.borderDogMaterial

	DogClass.super.ctor(self, goItem)
end

function DogClass:initUI()
	self:getUIComponent()
	DogClass.super.initUI(self)
	self:register()
	self:layout()
end

function DogClass:getUIComponent()
	self.dog = self.go
	self.dogUISprite = self.go:GetComponent(typeof(UISprite))
	self.borderDogLifePanel = self.go:NodeByName("borderDogLifePanel").gameObject
	self.border_dog_life = self.borderDogLifePanel:NodeByName("border_dog_life").gameObject
	self.dogEffect = self.dog:ComponentByName("dogEffect", typeof(UITexture))
end

function DogClass:register()
	return
end

function DogClass:layout()
	local layer = LayerMask.NameToLayer("DogLife")

	NGUITools.SetLayer(self.borderDogLifePanel.gameObject, layer)

	if not self.effect then
		self.effect = xyd.Spine.new(self.dogEffect.gameObject)

		self.effect:setInfo("fx_minigame_dog", function()
			self.dogUISprite.enabled = false

			self.effect:play("idle", 0)
			self.effect:startAtFrame(0)
		end)
		self.effect:SetLocalPosition(-4.1, -9, 0)
	end
end

function DogClass:getWidth()
	return self.dogUISprite.width
end

function DogClass:getHeight()
	return self.dogUISprite.height
end

function DogClass:startGame(caremaSize)
	if self.dog and not self.dog.gameObject:GetComponent(typeof(UnityEngine.Rigidbody2D)) then
		local dogRigidbody2D = self.dog.gameObject:AddComponent(typeof(UnityEngine.Rigidbody2D))

		dogRigidbody2D.useAutoMass = false
		dogRigidbody2D.mass = 3
		dogRigidbody2D.gravityScale = 0.2 * caremaSize
		dogRigidbody2D.sharedMaterial = self.borderDogMaterial:GetComponent(typeof(UnityEngine.Rigidbody2D)).sharedMaterial
		self.dogGameBox = self.border_dog_life:AddComponent(typeof(DogGameBox))

		self.dogGameBox:addCollisionEnterCallBack(self.onCollisionEnter)
		self.dogGameBox:addTrigerEnterCallBack(self.onTrigerEnter)
	end
end

function DogClass.onCollisionEnter(other, houseIndex, beeIndex)
	local dogMiniGameWd = xyd.WindowManager.get():getWindow("dog_mini_game_window")
	local selfDog = dogMiniGameWd:getDog()

	if other.gameObject.transform.name == "bee" then
		xyd.setUISpriteAsync(selfDog.dogUISprite, nil, "dog_mini_game_gouitou2")
		dogMiniGameWd:setDeath()
	elseif string.find(other.gameObject.transform.name, "death") then
		xyd.setUISpriteAsync(selfDog.dogUISprite, nil, "dog_mini_game_gouitou2")
		dogMiniGameWd:setDeath()
	end
end

function DogClass.onTrigerEnter(other, houseIndex, beeIndex)
	local dogMiniGameWd = xyd.WindowManager.get():getWindow("dog_mini_game_window")
	local selfDog = dogMiniGameWd:getDog()

	if other.gameObject.transform.name == "bee" then
		xyd.setUISpriteAsync(selfDog.dogUISprite, nil, "dog_mini_game_gouitou2")
		dogMiniGameWd:setDeath()
	elseif string.find(other.gameObject.transform.name, "death") then
		xyd.setUISpriteAsync(selfDog.dogUISprite, nil, "dog_mini_game_gouitou2")
		dogMiniGameWd:setDeath()
	end
end

function DogClass:setDeath(isNotPlayDie)
	if self.dog then
		local lineRigidbody2D = self.dog.gameObject:GetComponent(typeof(UnityEngine.Rigidbody2D))

		if lineRigidbody2D then
			lineRigidbody2D.bodyType = UnityEngine.RigidbodyType2D.Static
		end

		if not isNotPlayDie and self.effect then
			self.effect:play("die", 0)
		end
	end
end

function DogClass:setWin()
	if self.dog then
		local lineRigidbody2D = self.dog.gameObject:GetComponent(typeof(UnityEngine.Rigidbody2D))

		if lineRigidbody2D then
			lineRigidbody2D.bodyType = UnityEngine.RigidbodyType2D.Static
		end
	end
end

return DogClass
