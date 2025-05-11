-- chunkname: @../../../Product/Bundles/Android/src/app/common/SoundManager.lua

local PlayerPrefs = UnityEngine.PlayerPrefs
local AudioClip = UnityEngine.AudioClip
local AudioSource = UnityEngine.AudioSource
local AudioListener = UnityEngine.AudioListener
local Destroy = UnityEngine.Object.Destroy
local MappingData = xyd.MappingData
local SoundTable = xyd.tables.soundTable
local AudioConf = {
	[xyd.AudioType.MUSIC] = {
		loop = true,
		priority = 1,
		endfunc = false,
		num = 1,
		oneShot = false
	},
	[xyd.AudioType.EFFECT] = {
		loop = false,
		priority = 4,
		endfunc = true,
		num = 20,
		oneShot = false
	},
	[xyd.AudioType.BGS] = {
		loop = true,
		priority = 4,
		endfunc = false,
		num = 10,
		oneShot = false
	}
}
local MyAudio = class("MyAudio")

function MyAudio:ctor(node, audioType)
	local conf = AudioConf[audioType]
	local audio = node:AddComponent(typeof(AudioSource))

	audio.priority = conf.priority
	audio.loop = conf.loop
	self.audio = audio
	self.audioType = audioType
	self.oneShot = conf.oneShot
	self.canSeize = conf.canSeize
	self.sameIgnore = conf.sameIgnore
	self.endfunc = conf.endfunc
	self.id_ = nil
	self.sequenceKey = nil
	self.groupType = nil
	self.nextSoundName = nil
	self.nextGroupType = nil
	self.nextCalLback = nil
	self.nextVolume = nil
	self.originalVolume_ = 1
	self.isPlaying_ = false
end

function MyAudio:Play(id, clip, sequenceKey, speed)
	local volume = SoundTable:getVolume(id) or 1

	self.originalVolume_ = volume

	local scale
	local pitch = speed or 1

	if self.audioType == xyd.AudioType.MUSIC or self.audioType == xyd.AudioType.BGS then
		scale = xyd.SoundManager.get():getMusicVolume()
	else
		scale = xyd.SoundManager.get():getSoundVolume()
	end

	volume = volume * scale
	self.audio.pitch = pitch

	if self.oneShot then
		self.audio:PlayOneShot(clip, volume)
	else
		self.audio:Stop()

		self.audio.volume = volume
		self.audio.clip = clip

		self.audio:Play()
	end

	self.id_ = id

	if self.sequenceKey then
		XYDCo.StopWait(self.sequenceKey)
	end

	self.sequenceKey = sequenceKey
	self.isPlaying_ = true
end

function MyAudio:Stop()
	if tolua.isnull(self.audio) then
		return
	end

	self.audio:Stop()

	self.id_ = nil

	if self.sequenceKey then
		XYDCo.StopWait(self.sequenceKey)

		self.sequenceKey = nil
	end

	if not tolua.isnull(self.audio.clip) then
		self.audio.clip = nil
	end

	self.isPlaying_ = false
end

function MyAudio:playEnd()
	self.isPlaying_ = false
	self.id_ = nil

	if self.audio and not tolua.isnull(self.audio) and not tolua.isnull(self.audio.clip) then
		self.audio.clip = nil
	end

	self.sequenceKey = nil
end

function MyAudio:canPlay(id)
	if tolua.isnull(self.audio) then
		return false
	end

	if self.audioType == xyd.AudioType.MUSIC and self.id_ == id then
		return false
	end

	return true
end

function MyAudio:refreshVolume()
	local scale

	if self.audioType == xyd.AudioType.MUSIC or self.audioType == xyd.AudioType.BGS then
		scale = xyd.SoundManager.get():getMusicVolume()
	else
		scale = xyd.SoundManager.get():getSoundVolume()
	end

	if self.volumeIs0 then
		return
	end

	self.audio.volume = self.originalVolume_ * scale
end

function MyAudio:getTime()
	return self.audio.time
end

function MyAudio:isPlaying()
	return self.isPlaying_
end

function MyAudio:setVolumeTo0(isZero)
	self.volumeIs0 = isZero
end

function MyAudio:setVolume(num)
	if self.volumeIs0 then
		return
	end

	self.audio.volume = num
end

local SoundManager = class("SoundManager")

function SoundManager.get()
	if SoundManager.INSTANCE == nil then
		SoundManager.INSTANCE = SoundManager.new()
	end

	return SoundManager.INSTANCE
end

function SoundManager:ctor()
	local go = XYDUtils.FindGameObject("CameraManager")

	self.audioNode_ = go.transform:Find("AudioSources").gameObject
	self.myAudiosPoolIndex_ = {}
	self.myAudios_ = {}
	self.soundCaches_ = {}
	self.sequence_ = 0
	self.soundLength = {}
	self.bgStack = {}
	self.curBgID_ = 0
end

function SoundManager:clear()
	for key, list in pairs(self.myAudios_) do
		for i = 1, #list do
			local myAudio = list[i]

			myAudio:Stop()
		end
	end

	local audioSources = self.audioNode_:GetComponentsInChildren(typeof(AudioSource))

	for i = 0, audioSources.Length - 1 do
		local audioSource = audioSources[i]

		Destroy(audioSource)
	end

	self.myAudios_ = {}
	self.soundCaches_ = {}
	self.sequence_ = 1
	self.myAudiosPoolIndex_ = {}
	self.curBgID_ = 0

	local recordBg = PlayerPrefs.GetString("Mafia.Music.Home_Bg", "")

	if recordBg and recordBg ~= "" then
		xyd.Global.bgMusic = recordBg
	end
end

function SoundManager:initAudio()
	for audioType, item in pairs(AudioConf) do
		self.myAudios_[audioType] = {}

		for i = 1, item.num do
			local myAudio = MyAudio.new(self.audioNode_, audioType)

			self.myAudios_[audioType][i] = myAudio
		end
	end
end

function SoundManager:reset()
	self:clear()
	self:initAudio()
	self:resetSoundStatus()
	self:resetMusicStatus()
end

function SoundManager:resetSoundStatus()
	self.isSoundOn_ = self:getSoundVolume() > 0
end

function SoundManager:resetMusicStatus(isChange)
	self.isMusicOn_ = self:getMusicVolume() > 0

	if isChange then
		local isPlayMusic = false
		local list = self.myAudios_[xyd.AudioType.MUSIC] or {}
		local bgsList = self.myAudios_[xyd.AudioType.BGS] or {}

		for _, audio in pairs(list) do
			if audio:isPlaying() then
				isPlayMusic = true
			end

			if not self.isMusicOn_ then
				audio:Stop()
			else
				audio:refreshVolume()
			end
		end

		for _, audio in pairs(bgsList) do
			if not self.isMusicOn_ then
				audio:Stop()
			else
				audio:refreshVolume()
			end
		end

		if not isPlayMusic and self.isMusicOn_ then
			self:playBg(xyd.Global.bgMusic)
		elseif not self.isMusicOn_ then
			self.bgStack = {}
			self.curBgID_ = 0
		end
	end
end

function SoundManager:nexSequence()
	self.sequence_ = (self.sequence_ + 1) % 500

	return self.sequence_
end

function SoundManager:playSoundByType(audioType, id, onOverCallback, speed)
	if not id or id == "" then
		return
	end

	if (UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.ANDROID_1_5_138) < 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.IOS_71_3_204) < 0) and SoundTable:isOgg(id) then
		return
	end

	self:loadAudioClip(id, xyd.scb(self, function(clip)
		if tolua.isnull(clip) then
			return
		end

		local myAudio = self:getEmptyAudio(audioType)

		if myAudio and myAudio:canPlay(id) then
			local sequenceKey = audioType .. id .. self:nexSequence()

			self.soundLength[id] = clip.length

			myAudio:Play(id, clip, sequenceKey, speed)

			if myAudio.endfunc then
				XYDCo.WaitForTime(clip.length, xyd.scb(self, function()
					self:onStopPlaySound(myAudio, id, onOverCallback)
				end), myAudio.sequenceKey)
			end
		end
	end))
end

function SoundManager:getEmptyAudio(audioType)
	local list = self.myAudios_[audioType]

	if not list then
		return
	end

	if #list == 1 then
		return list[1]
	end

	local poolIndex = self.myAudiosPoolIndex_[audioType] or 1
	local index = 1
	local num = 0
	local markKey = -1

	while list[poolIndex]:isPlaying() do
		if poolIndex == markKey then
			poolIndex = index

			break
		end

		if markKey == -1 then
			markKey = poolIndex
		end

		if num < list[poolIndex]:getTime() then
			num = list[poolIndex]:getTime()
			index = poolIndex
		end

		poolIndex = poolIndex + 1

		if poolIndex > #list then
			poolIndex = 1
		end
	end

	self.myAudiosPoolIndex_[audioType] = poolIndex

	return list[poolIndex]
end

function SoundManager:onStartPlaySound(myAudio, soundName, callback)
	if callback then
		callback(soundName)
	end
end

function SoundManager:onStopPlaySound(myAudio, id, callback)
	if myAudio then
		myAudio:playEnd()
	end

	if callback then
		callback(id)
	end
end

function SoundManager:loadAudioClip(id, callback)
	local function complete(clip)
		if callback ~= nil then
			callback(clip)
		end
	end

	local clip = self.soundCaches_[id]

	if not tolua.isnull(clip) then
		complete(clip)
	else
		local needCache = not SoundTable:isDestroy()
		local path = xyd.getSoundPath(id)

		AudioManager.Instance:LoadAudioClipAsync(path, function(isSuccess, audioClip)
			if tolua.isnull(audioClip) then
				return
			end

			if needCache and tolua.isnull(self.soundCaches_[id]) then
				self.soundCaches_[id] = audioClip
			end

			complete(audioClip)
		end)
	end
end

function SoundManager:getMusicVolume()
	if self.musicVolume_ == nil then
		self.musicVolume_ = PlayerPrefs.GetFloat("Mafia.Music.Volume", 1)
	end

	if self.mainWindowVolume_ == nil then
		self.mainWindowVolume_ = 1
	end

	return self.musicVolume_ * self.mainWindowVolume_
end

function SoundManager:setMusicVolume(value)
	if self.musicVolume_ ~= value and type(value) == "number" then
		self.musicVolume_ = value

		PlayerPrefs.SetFloat("Mafia.Music.Volume", Mathf.Clamp(value, 0, 1))
		self:resetMusicStatus(true)
	end
end

function SoundManager:setMainWindowBg(value)
	if not self.mainWindowVolume_ or value ~= self.mainWindowVolume_ then
		self.mainWindowVolume_ = value

		self:resetMusicStatus(true)
	end
end

function SoundManager:getSoundVolume()
	return NGUITools.soundVolume
end

function SoundManager:setSoundVolume(value)
	if type(value) == "number" then
		NGUITools.soundVolume = Mathf.Clamp(value, 0, 1)
	end

	self:resetSoundStatus()
end

function SoundManager:playSound(id, callback, speed)
	if not id or id == "" or xyd.isIosTest() then
		return
	end

	local assetPath = SoundTable:getRes(id)

	if not assetPath or assetPath == "" then
		return
	end

	local soundType = SoundTable:getType(id)
	local delay = SoundTable:getDelay(id)

	local function playSoundFun()
		if soundType == xyd.AudioType.MUSIC then
			self:playBg(id)
		elseif soundType == xyd.AudioType.BGS then
			self:playBGS(id)
		else
			self:playEffect(id, callback, speed)
		end
	end

	if delay > 0 then
		XYDCo.WaitForTime(delay, function()
			playSoundFun()
		end, nil)
	else
		playSoundFun()
	end
end

function SoundManager:playBg(id)
	if not self.isMusicOn_ then
		return
	end

	if self.curBgID_ and self.curBgID_ == id then
		return
	end

	if self.bgStack and self.bgStack[#self.bgStack] == id then
		-- block empty
	else
		table.insert(self.bgStack, id)
	end

	self.curBgID_ = id

	self:playSoundByType(xyd.AudioType.MUSIC, id)
end

function SoundManager:playBGS(id)
	if not self.isMusicOn_ then
		return
	end

	self:playSoundByType(xyd.AudioType.BGS, id)
end

function SoundManager:getCurBgID()
	return self.curBgID_
end

function SoundManager:stopBg()
	local audio = self.myAudios_[xyd.AudioType.MUSIC][1]

	audio:Stop()
end

function SoundManager:stopBg2()
	local audio = self.myAudios_[xyd.AudioType.MUSIC][1]

	audio:setVolume(0)
end

function SoundManager:playAudioBg()
	local audio = self.myAudios_[xyd.AudioType.MUSIC][1]
	local volume = (SoundTable:getVolume(xyd.Global.bgMusic) or 1) * xyd.SoundManager.get():getMusicVolume()

	audio:setVolume(volume)
end

function SoundManager:isPlayBg()
	return tonumber(self.curBgID_) ~= 0
end

function SoundManager:playEffect(id, callback, speed)
	if not self.isSoundOn_ then
		return
	end

	self:playSoundByType(xyd.AudioType.EFFECT, id, callback, speed)
end

function SoundManager:stopSound(id)
	local soundType = SoundTable:getType(id)

	if soundType == xyd.AudioType.MUSIC then
		self:popBg(id)
	else
		self:stopEffect(id)
	end
end

function SoundManager:suspendBGS()
	local list = self.myAudios_[xyd.AudioType.BGS]

	if list then
		for i = 1, #list do
			list[i]:setVolumeTo0(true)
			list[i]:setVolume(0)
		end
	end
end

function SoundManager:resumeBGS()
	local list = self.myAudios_[xyd.AudioType.BGS]

	if list then
		for i = 1, #list do
			list[i]:setVolumeTo0(false)
			list[i]:setVolume(xyd.SoundManager.get():getMusicVolume() * list[i].originalVolume_)
		end
	end
end

function SoundManager:stopBGS()
	local list = self.myAudios_[xyd.AudioType.BGS]

	if list then
		for i = 1, #list do
			list[i]:Stop()
		end
	end
end

function SoundManager:stopEffect(id)
	local soundType = SoundTable:getType(id)
	local list = self.myAudios_[soundType]

	if list then
		for i = 1, #list do
			if list[i].id_ == id then
				list[i]:Stop()

				break
			end
		end
	end
end

function SoundManager:popBg(id)
	if not self.isMusicOn_ then
		return
	end

	local soundType = SoundTable:getType(id)

	if soundType ~= xyd.AudioType.MUSIC then
		return
	end

	for i = #self.bgStack, 1, -1 do
		if self.bgStack[i] == id then
			table.remove(self.bgStack, i)

			break
		end
	end

	if self.bgStack[#self.bgStack] then
		self:playBg(self.bgStack[#self.bgStack])
	else
		self:playBg(xyd.Global.bgMusic)
	end
end

function SoundManager:isEffectOn()
	return self.isSoundOn_
end

function SoundManager:homeBGSwitch()
	self.bgStack = {}

	self:playBg(xyd.Global.bgMusic)
end

return SoundManager
