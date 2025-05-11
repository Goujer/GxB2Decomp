-- chunkname: @../../../Product/Bundles/Android/src/app/common/BattleTest.lua

local BattleTest = class("BattleTest")
local json = require("cjson")

function BattleTest.get()
	if BattleTest.INSTANCE == nil then
		BattleTest.INSTANCE = BattleTest.new()
	end

	return BattleTest.INSTANCE
end

function BattleTest:ctor()
	return
end

function BattleTest:setParams(params)
	if params.inputA == "pressure" then
		if self.timer_ then
			self.timer_:Stop()

			self.timer_ = nil

			return
		end

		local delay = 1
		local second = 30
		local times = second / delay

		self.timer_ = Timer.New(function()
			xyd.models.gMcommand:request("json_fight " .. params.gmStr)

			local msg = messages_pb.get_login_info_req()

			xyd.Backend.get():request(xyd.mid.GET_LOGIN_INFO, msg)
		end, delay, -1)

		self.timer_:Start()
		xyd.WindowManager.get():closeWindow("battle_test_window")
	else
		self:localFun(params)
	end
end

function BattleTest:localFun(params)
	return
end

function BattleTest:startClick(index)
	local path = "../clickPlans.json"
	local jsonData = io.readfile(path)

	jsonData = jsonData or io.readfile("doc/clickPlans.json")

	if not jsonData then
		return
	end

	local rp = json.decode(jsonData)
	local planData = rp["plan" .. index]

	if not planData then
		return
	end

	local totalTime = 0

	for k, v in ipairs(planData) do
		local waitTime = v.time or 0
		local timer = Timer.New(function()
			LuaManager.Instance:SetClickPos(v.x / 1000 .. "|" .. v.y / 1000 + 1000)

			local logStr = "x:" .. v.x .. " y:" .. v.y

			if v.des then
				logStr = logStr .. " des: " .. v.des
			end

			reportLog2(logStr)
		end, totalTime, 0)

		totalTime = totalTime + waitTime

		timer:Start()
	end
end

return BattleTest
