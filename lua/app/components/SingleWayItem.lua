-- chunkname: @../../../Product/Bundles/Android/src/app/components/SingleWayItem.lua

local SingleWayItem = class("SingleWayItem", import(".BaseComponent"))
local StageTable = xyd.tables.stageTable
local GetWayTable = xyd.tables.getWayTable
local GambleConfigTable = xyd.tables.gambleConfigTable
local MiscTable = xyd.tables.miscTable
local Backpack = xyd.models.backpack
local ActivityModel = xyd.models.activityModel
local Map = xyd.models.map

function SingleWayItem:ctor(parentGo, params)
	self.data = params

	SingleWayItem.super.ctor(self, parentGo)
	self:setInfo()
end

function SingleWayItem:getPrefabPath()
	return "Prefabs/Components/single_way_item"
end

function SingleWayItem:initUI()
	SingleWayItem.super.initUI(self)

	self.btnSelect_ = self.go:NodeByName("btnSelect_").gameObject
	self.btnSelectLabel = self.btnSelect_:ComponentByName("button_label", typeof(UILabel))
	self.btnIcon = self.btnSelect_:NodeByName("btnIcon").gameObject
	self.maskImg = self.btnSelect_:NodeByName("maskImg").gameObject
	UIEventListener.Get(self.btnSelect_).onClick = function()
		self:onTouch()
	end
end

function SingleWayItem:setInfo()
	local id = self.data.id
	local wndType = self.data.wndType
	local name = ""
	local lev = 0
	local stageID = 0
	local vip = 0
	local function_id = 0

	if wndType == xyd.ItemTipsWndType.SMITHY then
		name = __("GET_WAY_EQUIP", StageTable:getFortID(id), StageTable:getName(id))
		lev = StageTable:getLv(id)
		stageID = id
	elseif id == 24 then
		name = GetWayTable:getName(id)
		vip = GambleConfigTable:needVip(xyd.GambleWindowType.SENIOR)[1]
		lev = GambleConfigTable:needLevel(xyd.GambleWindowType.SENIOR)[1]
		stageID = GetWayTable:getStage(id)
	else
		name = GetWayTable:getName(id)
		lev = GetWayTable:getLvLimit(id)
		stageID = GetWayTable:getStage(id)

		if id == 49 then
			vip = GambleConfigTable:needVip(xyd.GambleWindowType.SENIOR)[1]
			lev = GambleConfigTable:needLevel(xyd.GambleWindowType.SENIOR)[1]
		end

		if self.data.ways_val then
			if self.data.item_id == xyd.ItemID.ICE_SUMMER_COIN or self.data.item_id == xyd.ItemID.SPROUTS_ITEM then
				name = string.gsub(name, "{1}", self.data.ways_val)
			end

			if self.data.use_val then
				name = string.gsub(name, "{1}", self.data.ways_val)
			end
		end
	end

	self.btnSelectLabel.text = name

	local mapInfo = Map:getMapInfo(xyd.MapType.CAMPAIGN)
	local maxStage = mapInfo.max_stage

	if lev > Backpack:getLev() and (vip == 0 or vip > Backpack:getVipLev()) or maxStage < stageID then
		self.maskImg:SetActive(true)
		xyd.setTouchEnable(self.btnSelect_, false)
	else
		self.maskImg:SetActive(false)
		xyd.setTouchEnable(self.btnSelect_, true)
	end
end

function SingleWayItem:smithTouch()
	local id = self.data.id
	local lev = StageTable:getLv(id)
	local stageID = id
	local mapInfo = Map:getMapInfo(xyd.MapType.CAMPAIGN)
	local maxStage = mapInfo.max_stage

	if maxStage < stageID then
		return
	end

	if lev > Backpack:getLev() then
		return
	end

	xyd.WindowManager.get():closeWindow("backpack_window")
	xyd.WindowManager.get():closeWindow("item_tips_window")
	xyd.WindowManager.get():openWindow("campaign_window", {})
	xyd.WindowManager.get():openWindow("campaign_stage_detail_window", {
		needBtn = true,
		no_close = true,
		alpha = 0.7,
		stageId = stageID
	})
end

function SingleWayItem:onTouch()
	local serverId = xyd.models.selfPlayer:getServerID()

	if serverId > 2 and (self.data.item_id == xyd.ItemID.STARRY_ALTAR_COIN or self.data.item_id == xyd.ItemID.STAR_ALTER_MISSION_COIN or self.data.item_id == xyd.ItemID.SKILL_RESONATE_LIGHT_STONE or self.data.item_id == xyd.ItemID.SKILL_RESONATE_DARK_STONE) then
		local openTime = tonumber(xyd.tables.miscTable:getVal("starry_altar_open_time"))
		local nowTime = xyd.getServerTime()

		if nowTime < openTime then
			local leftTime = xyd.getRoughDisplayTime(openTime - nowTime)

			xyd.alertTips(__("OPEN_AFTER_TIME", leftTime))

			return
		end
	end

	local wndType = self.data.wndType

	if wndType == xyd.ItemTipsWndType.SMITHY then
		return self:smithTouch()
	end

	if self.data.wndName then
		local window = xyd.WindowManager.get():getWindow(self.data.wndName)

		if window then
			xyd.WindowManager.get():closeWindow(self.data.wndName)
		end
	end

	if self.data.item_id == xyd.ItemID.LIMIT_GACHA_AWARD_ICON2 then
		xyd.WindowManager.get():closeWindow("activity_limit_gacha_award_window")
	end

	local id = self.data.id
	local function_id = GetWayTable:getFunctionId(id)
	local stageID = GetWayTable:getStage(id)
	local mapInfo = Map:getMapInfo(xyd.MapType.CAMPAIGN)
	local maxStage = mapInfo.max_stage

	if tonumber(id) == 24 then
		local tmp_vip = GambleConfigTable:needVip(xyd.GambleWindowType.SENIOR)[1]
		local tmp_lev = GambleConfigTable:needLevel(xyd.GambleWindowType.SENIOR)[1]
		local fortId = xyd.tables.stageTable:getFortID(tmp_lev)
		local text = tostring(fortId) .. "-" .. tostring(xyd.tables.stageTable:getName(tmp_lev))

		if tmp_vip > Backpack:getVipLev() and tmp_lev > Backpack:getLev() then
			xyd.alertTips(__("GAMBLE_DOOR_TIPS", text, tmp_vip[1]))

			return
		end
	end

	if maxStage <= stageID then
		return
	end

	if id == 131 then
		if xyd.models.oldSchool:isCanOpen(true) then
			xyd.WindowManager.get():closeWindow("partner_detail_window")
			xyd.WindowManager.get():closeWindow("exskill_grade_up_window")
		else
			return
		end
	elseif not xyd.checkFunctionOpen(function_id) then
		return
	end

	local windows = GetWayTable:getGoWindow(id)

	if xyd.arrayIndexOf(windows, "arena_window") > 0 and xyd.models.arena:getIsSettlementing(true) then
		return
	end

	local params = GetWayTable:getGoParam(id)
	local isClose = GetWayTable:isClose(id)
	local close = true

	for i in pairs(windows) do
		if self.data.wndName then
			params[i].closeCallBack = function()
				xyd.WindowManager.get():openWindow(self.data.wndName)
			end
		end

		local windowName = windows[i]

		if windowName == "activity_window" then
			local data = xyd.models.activity:getActivity(params[i].select)

			if not data then
				xyd.showToast(__("ACTIVITY_OPEN_TEXT"))

				close = false
			else
				local win = xyd.WindowManager.get():getWindow(windowName)
				local newParams = xyd.tables.activityTable:getWindowParams(params[i].select)

				if newParams ~= nil then
					params[i].onlyShowList = newParams.activity_ids
					params[i].activity_type = xyd.tables.activityTable:getType(newParams.activity_ids[1])
				end

				local wnd1 = xyd.WindowManager.get():getWindow("activity_equip_level_up_award_window")

				if wnd1 then
					wnd1:close()
				end

				xyd.goToActivityWindowAgain(params[i])
			end
		elseif id == 52 then
			self:activityEquipGachaPurchase()
		elseif id == xyd.getWays.OLD_SCHOOL then
			xyd.models.oldSchool:openOldSchoolMainWindow()
		elseif id == xyd.getWays.TRIAL then
			if xyd.models.trial:checkClose() then
				xyd.alertTips(__("NEW_TRIAL_RESET_TEXT01"))

				return
			end

			xyd.WindowManager.get():openWindow(windowName, params[i])
		else
			xyd.WindowManager.get():openWindow(windowName, params[i])
		end
	end

	if isClose == 1 and close then
		xyd.WindowManager.get():closeWindow("item_tips_window")

		if tonumber(id) ~= 20 and tonumber(id) ~= 40 then
			xyd.WindowManager.get():closeWindow("backpack_window")
		end
	end

	if tonumber(id == 8) then
		xyd.WindowManager.get():closeWindow("summon_window")
		xyd.WindowManager.get():closeWindow("summon_res_window")
	elseif id == xyd.getWays.GUILD_PLAYGROUND or id == xyd.getWays.GUILD_RESTAURANT or id == xyd.getWays.GUILD_SIGN_IN or id == xyd.getWays.GUILD_STADIUM then
		self:onGuild(id)
	end

	xyd.WindowManager.get():closeWindow("summon_result_window")

	if id == 113 then
		local boxNum = xyd.models.backpack:getItemNumByID(43)

		if boxNum > 0 then
			xyd.WindowManager.get():closeWindow("item_tips_window")
			xyd.WindowManager.get():openWindow("item_tips_window", {
				itemID = 43,
				itemNum = boxNum,
				wndType = xyd.ItemTipsWndType.BACKPACK
			})
		else
			xyd.alertTips(__("NOT_ENOUGH", xyd.tables.itemTable:getName(43)))
		end
	end

	if id == 133 then
		local params = {
			main_window = true,
			loading_window = true,
			artifact_shop_warm_up_window = true,
			guide_window = true
		}

		xyd.WindowManager.get():closeAllWindows(params, false)
	else
		xyd.closeWindow("artifact_shop_warm_up_window")
		xyd.closeWindow("artifact_shop_warm_up_award_window")
	end

	local dropProWnd = xyd.WindowManager.get():getWindow("drop_probability_window")

	if dropProWnd then
		dropProWnd:update()
	end

	local closeWnds = GetWayTable:getCloseWindow(id)

	for _, wndName in pairs(closeWnds) do
		local win = xyd.WindowManager.get():getWindow(wndName)

		if win then
			win:close()
		end
	end
end

function SingleWayItem:activityEquipGachaPurchase()
	local total = MiscTable:getVal("activity_equip_gacha_buy_limit")
	local activityData = ActivityModel:getActivity(xyd.ActivityID.EQUIP_GACHA)

	if not activityData or not activityData.detail then
		return
	end

	local hasBuy = activityData.detail.buy_times
	local canBuy = tonumber(total) - hasBuy

	if canBuy <= 0 then
		xyd.alertTips(__("ACTIVITY_WORLD_BOSS_LIMIT"))

		return
	end

	local data = MiscTable:split2Cost("activity_equip_gacha_buy_cost", "value", "#")

	xyd.WindowManager.get():openWindow("limit_purchase_item_window", {
		limitKey = "ACTIVITY_WORLD_BOSS_LIMIT",
		notEnoughKey = "PERSON_NO_CRYSTAL",
		needTips = true,
		buyNum = 1,
		titleKey = "EQUIP_GACHA_BUY_TITLE",
		buyType = xyd.ItemID.EQUIP_GACHA,
		costType = data[0],
		costNum = data[1],
		purchaseCallback = function(evt, num)
			xyd.Backend.get():request(xyd.mid.BOSS_BUY, {
				activity_id = xyd.ActivityID.EQUIP_GACHA,
				num = num
			})
		end,
		limitNum = canBuy,
		eventType = xyd.event.BOSS_BUY,
		showWindowCallback = function()
			xyd.WindowManager.get():openWindow("vip_window")
		end
	})
end

function SingleWayItem:onGuild(id)
	if not xyd.checkFunctionOpen(xyd.FunctionID.GUILD) then
		-- block empty
	elseif xyd.models.guild.guildID > 0 then
		local function callback()
			local params = {
				guild_war_info_window = true,
				loading_window = true,
				guide_window = true,
				guild_window = true,
				guild_dininghall = true,
				guild_territory_window = true,
				guild_lab_window = true,
				main_window = true,
				guild_gym_window = true,
				res_loading_window = true
			}

			xyd.WindowManager.get():closeAllWindows(params, false)
		end

		if id == xyd.getWays.GUILD_PLAYGROUND then
			xyd.WindowManager.get():openWindow("guild_territory_window", {
				specialPlaceType = xyd.guildPlaceType.PLAYGROUND
			}, function()
				callback()
			end)
		elseif id == xyd.getWays.GUILD_SIGN_IN then
			xyd.WindowManager.get():openWindow("guild_territory_window", {
				specialPlaceType = xyd.guildPlaceType.OFFICE
			}, function()
				callback()
			end)
		elseif id == xyd.getWays.GUILD_RESTAURANT then
			xyd.WindowManager.get():openWindow("guild_territory_window", {
				specialPlaceType = xyd.guildPlaceType.RESTAURANT
			}, function()
				callback()
			end)
		elseif id == xyd.getWays.GUILD_STADIUM then
			xyd.WindowManager.get():openWindow("guild_territory_window", {
				specialPlaceType = xyd.guildPlaceType.STADIUM
			}, function()
				callback()
			end)
		end
	else
		xyd.WindowManager.get():openWindow("guild_join_window", {})
	end
end

return SingleWayItem
