-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/BattleController.lua

local BattleController = class("BattleController", import("app.controllers.BaseController"))
local cjson = require("cjson")
local battleMID = {
	[xyd.mid.MAP_FIGHT] = 1,
	[xyd.mid.DUNGEON_FIGHT] = 2,
	[xyd.mid.TOWER_FIGHT] = 3,
	[xyd.mid.TOWER_REPORT] = 4,
	[xyd.mid.QUIZ_FIGHT] = 5,
	[xyd.mid.ARENA_FIGHT] = 6,
	[xyd.mid.FRIEND_FIGHT_BOSS] = 7,
	[xyd.mid.FRIEND_FIGHT_FRIEND] = 8,
	[xyd.mid.TRIAL_FIGHT] = 9,
	[xyd.mid.GUILD_BOSS_FIGHT] = 10,
	[xyd.mid.ARENA_3v3_FIGHT] = 11,
	[xyd.mid.ARENA_TEAM_FIGHT] = 12,
	[xyd.mid.PARTNER_CHALLENGE_FIGHT] = 13,
	[xyd.mid.PARTNER_CHALLENGE_GET_REPORT] = 14,
	[xyd.mid.FRIEND_TEAM_BOSS_FIGHT] = 15,
	[xyd.mid.FIGHT_CHESS] = 16,
	[xyd.mid.GUILD_COMPETITION_BATTLE] = 17,
	[xyd.mid.GUILD_NEW_WAR_FIGHT] = 18,
	[xyd.mid.SOUL_LAND_REPORT] = 19
}
local MainPlotListTable = xyd.tables.mainPlotListTable
local StageTable = xyd.tables.stageTable
local MiscTable = xyd.tables.miscTable
local ReportHero = import("lib.battle.ReportHero")
local ReportPet = import("lib.battle.ReportPet")
local BattleCreateReport = import("lib.battle.BattleCreateReport")
local battleReportDes = import("lib.battle.BattleReportDes")
local newVerTypeList = {
	xyd.BattleType.CAMPAIGN,
	xyd.BattleType.TOWER,
	xyd.BattleType.TOWER_PRACTICE,
	xyd.BattleType.FRIEND_BOSS,
	xyd.BattleType.DAILY_QUIZ,
	xyd.BattleType.GUILD_BOSS,
	xyd.BattleType.WORLD_BOSS,
	xyd.BattleType.ACADEMY_ASSESSMENT,
	xyd.BattleType.HERO_CHALLENGE,
	xyd.BattleType.HERO_CHALLENGE_CHESS,
	xyd.BattleType.HERO_CHALLENGE_REPORT,
	xyd.BattleType.HERO_CHALLENGE_SPEED,
	xyd.BattleType.ACTIVITY_SCHOOL_EXPLORE,
	xyd.BattleType.EXPLORE_OLD_CAMPUS,
	xyd.BattleType.EXPLORE_ADVENTURE,
	xyd.BattleType.GUILD_COMPETITION,
	xyd.BattleType.BEACH_ISLAND,
	xyd.BattleType.ENCOUNTER_STORY,
	xyd.BattleType.TIME_CLOISTER_BATTLE,
	xyd.BattleType.TIME_CLOISTER_EXTRA,
	xyd.BattleType.ENTRANCE_TEST_REPORT
}

function BattleController:ctor(...)
	BattleController.super.ctor(self, ...)

	self.battleData_ = nil

	self:onRegister()

	self.isNeedControllerOverCard = {
		[xyd.BattleType.ARENA] = "ARENA_OVER_CARD",
		[xyd.BattleType.ARENA_3v3] = "ARENA_3v3_OVER_CARD",
		[xyd.BattleType.ARENA_ALL_SERVER] = "ARENA_ALL_SERVER_OVER_CARD"
	}
end

function BattleController.get()
	if BattleController.INSTANCE == nil then
		BattleController.INSTANCE = BattleController.new()
	end

	return BattleController.INSTANCE
end

function BattleController:onRegister()
	BattleController.super.onRegister(self)
	self:registerEvent(xyd.event.ERROR_MESSAGE, handler(self, self.onError))
	self:registerEvent(xyd.event.REQUEST_INFO, handler(self, self.onRequest))
	self:registerEvent(xyd.event.START_BATTLE, handler(self, self.onBattleStart))
	self:registerEvent(xyd.event.BATTLE_END, handler(self, self.onBattleEnd))
	self:registerEvent(xyd.event.MAP_FIGHT, handler(self, self.onBattleStart))
	self:registerEvent(xyd.event.DUNGEON_FIGHT, handler(self, self.onDungeonBattle))
	self:registerEvent(xyd.event.TOWER_FIGHT, handler(self, self.onTowerStart))
	self:registerEvent(xyd.event.TOWER_PRACTICE, handler(self, self.onTowerPractice))
	self:registerEvent(xyd.event.TOWER_REPORT, function(event)
		self:onTowerStart(event, true)
	end)
	self:registerEvent(xyd.event.SOUL_LAND_REPORT, function(event)
		self:onSoulLandStart(event, true)
	end)
	self:registerEvent(xyd.event.TOWER_SELF_REPORT, handler(self, self.onTowerSelfReport))
	self:registerEvent(xyd.event.QUIZ_FIGHT, handler(self, self.onDailyQuizBattle))
	self:registerEvent(xyd.event.ARENA_FIGHT, handler(self, self.onArenaBattle))
	self:registerEvent(xyd.event.ARENA_3v3_FIGHT, handler(self, self.onArena3v3Battle))
	self:registerEvent(xyd.event.ARENA_TEAM_FIGHT, handler(self, self.onArenaTeamBattle))
	self:registerEvent(xyd.event.FRIEND_FIGHT_BOSS, handler(self, self.onFriendBossBattle))
	self:registerEvent(xyd.event.FRIEND_FIGHT_FRIEND, handler(self, self.onFriendBattle))
	self:registerEvent(xyd.event.NEW_TRIAL_FIGHT, handler(self, self.onNewTrialFight))
	self:registerEvent(xyd.event.GET_ACTIVITY_AWARD, handler(self, self.onActivityFight))
	self:registerEvent(xyd.event.GUILD_BOSS_FIGHT, handler(self, self.onGuildBossFight))
	self:registerEvent(xyd.event.BOSS_FIGHT, handler(self, self.onBossFight))
	self:registerEvent(xyd.event.BOSS_NEW_FIGHT, handler(self, self.onBossNewFight))
	self:registerEvent(xyd.event.PARTNER_CHALLENGE_FIGHT, handler(self, self.onHeroChallengeFight))
	self:registerEvent(xyd.event.FIGHT_CHESS, handler(self, self.onHeroChallengeChessFight))
	self:registerEvent(xyd.event.PARTNER_CHALLENGE_GET_REPORT, handler(self, self.onHeroChallengeReport))
	self:registerEvent(xyd.event.FAIRY_CHALLENGE, handler(self, self.onFairyTaleBattle))
	self:registerEvent(xyd.event.ARENA_GET_REPORT, function(event)
		self:onArenaBattle(event, true)
	end)
	self:registerEvent(xyd.event.FRIEND_TEAM_BOSS_FIGHT, handler(self, self.onFriendTeamBossFight))
	self:registerEvent(xyd.event.FRIEND_TEAM_BOSS_GET_REPORT, handler(self, self.onFriendTeamBossReport))
	self:registerEvent(xyd.event.SCHOOL_PRACTICE_FIGHT, handler(self, self.onSchoolPracticeFight))
	self:registerEvent(xyd.event.FRIEND_BOSS_FIGHT, handler(self, self.onFriendBossFight))
	self:registerEvent(xyd.event.PARTNER_DATA_FIGHT, handler(self, self.onPartnerDataFight))
	self:registerEvent(xyd.event.NEW_PARTNER_WARMUP_FIGHT, handler(self, self.onNewPartnerWarmUpFight))
	self:registerEvent(xyd.event.SPORTS_FIGHT, handler(self, self.onSportsFight))
	self:registerEvent(xyd.event.OLD_BUILDING_FIGHT, handler(self, self.onOldBuildingFight))
	self:registerEvent(xyd.event.EXPLORE_ADVENTURE_COST, handler(self, self.onAdventureBattle))
	self:registerEvent(xyd.event.GUILD_COMPETITION_BATTLE, handler(self, self.onGuildCometitionBattleFight))
	self:registerEvent(xyd.event.FAIR_ARENA_BATTLE, handler(self, self.onFairArenaBattle))
	self:registerEvent(xyd.event.FAIR_ARENA_BATTLE_REPORT, handler(self, self.onFairArenaBattleReport1))
	self:registerEvent(xyd.event.FAIR_ARENA_GET_REPORT, handler(self, self.onFairArenaBattleReport2))
	self:registerEvent(xyd.event.ACTIVITY_BEACH_ISLAND_BATTLE, handler(self, self.onBeachIslandBattle))
	self:registerEvent(xyd.event.ENCOUNTER_FIGHT, handler(self, self.onEncounterBattle))
	self:registerEvent(xyd.event.TIME_CLOISTER_FIGHT, handler(self, self.onTimeCloisterBattle))
	self:registerEvent(xyd.event.TIME_CLOISTER_EXTRA, handler(self, self.onTimeCloisterExtra))
	self:registerEvent(xyd.event.GET_ALL_SEVER_FIGHT, handler(self, self.onArenaScoreBattle))
	self:registerEvent(xyd.event.ACADEMY_ASSESSMENT_REPORT, handler(self, self.onAcademyAssessmentReport))
	self:registerEvent(xyd.event.GALAXY_TRIP_GRID_BATTLE, handler(self, self.onGalayTripGridBattleBack))
	self:registerEvent(xyd.event.GALAXY_TRIP_SPECIAL_BOSS_BATTLE, handler(self, self.onGalayTripSpecialBossBattleBack))
	self:registerEvent(xyd.event.GUILD_NEW_WAR_FIGHT, handler(self, self.onGuildNewWarFight))
	self:registerEvent(xyd.event.GUILD_NEW_WAR_FIGHT_RECORD, function(event)
		self:onGuildNewWarFight(event, true)
	end)
	self:registerEvent(xyd.event.SOUL_LAND_FIGHT, handler(self, self.onSoulLandFightBack))
end

function BattleController:onRequest(event)
	local mid = tonumber(event.data.mid)

	if battleMID[mid] and battleMID[mid] > 0 then
		xyd.Global.playReport = true

		self:openBattleLoading(mid, event.data.msg)
	end
end

function BattleController:openBattleLoading(mid, params)
	local flag = true

	if mid == xyd.mid.DUNGEON_FIGHT and xyd.models.dungeon:isSkipReport() then
		flag = false
	end

	if mid == xyd.mid.ARENA_FIGHT and xyd.models.arena:isSkipReport() then
		flag = false
	end

	if mid == xyd.mid.ARENA_3v3_FIGHT and xyd.models.arena3v3:isSkipReport() then
		flag = false
	end

	if mid == xyd.mid.ARENA_TEAM_FIGHT and xyd.models.arenaTeam:isSkipReport() then
		flag = false
	end

	if mid == xyd.mid.QUIZ_FIGHT and xyd.models.dailyQuiz:isSkipReport() then
		flag = false
	end

	if mid == xyd.mid.TRIAL_FIGHT and xyd.models.trial:isSkipReport() then
		flag = false
	end

	if mid == xyd.mid.PARTNER_CHALLENGE_FIGHT and xyd.models.heroChallenge:isSkipReport() then
		flag = false
	end

	if mid == xyd.mid.NEW_TRIAL_FIGHT and xyd.models.trial:isSkipReport() then
		flag = false
	end

	if mid == xyd.mid.TOWER_FIGHT and xyd.models.towerMap:isSkipReport(xyd.BattleType.TOWER) then
		flag = false
	end

	if mid == xyd.mid.TOWER_PRACTICE and xyd.models.towerMap:isSkipReport(xyd.BattleType.TOWER_PRACTICE) then
		flag = false
	end

	if mid == xyd.mid.GUILD_BOSS_FIGHT and xyd.getWindow("game_assistant_result_window") then
		flag = false
	end

	if mid == xyd.mid.GUILD_NEW_WAR_FIGHT then
		local modelData = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR)
		local wnd = xyd.getWindow("guild_new_war_record_window")

		if xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR):isSkipReport() or wnd or xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR).isDestroyFight or xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR):getLeftFightTime() and xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR):getLeftFightTime() >= 0 then
			flag = false
		end

		if modelData.leftFightTime and modelData.leftFightTime == 0 then
			modelData.leftFightTime = nil
		end
	end

	if mid == xyd.mid.MAP_FIGHT then
		local stageId = params.stage_id
		local plotIds = MainPlotListTable:getPlotIDsByStageID(stageId)
		local isFinal = xyd.tables.stageTable:getFortFinal(stageId)

		if isFinal and tonumber(isFinal) > 0 then
			self.needUpdateAchieve_ = true
		end

		if plotIds and plotIds[1] > 0 then
			flag = false
		end
	end

	if flag then
		ResManager.ForceGCCollect()
		xyd.WindowManager.get():openWindow("battle_loading_window")
	end
end

function BattleController:onBattleStart(event)
	local data = event.data

	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.CAMPAIGN
	})

	if self.needUpdateAchieve_ then
		self.needUpdateAchieve_ = false

		xyd.models.achievement:getData()
	end
end

function BattleController:onPartnerDataFight(event)
	local data = event.data
	local wndName = {
		"partner_data_station_window",
		"partner_station_battle_formation_window",
		"guide_detail_window"
	}

	for _, name in ipairs(wndName) do
		local wnd = xyd.WindowManager.get():getWindow(name)

		if wnd then
			wnd:hide()
		end
	end

	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.PARTNER_STATION
	})
end

function BattleController:onGuildwarBattle(event)
	local data = event.data

	data = xyd.decodeProtoBuf(data)

	local battleReport = data.battle_report

	if battleReport and battleReport.random_seed and battleReport.random_seed > 0 then
		local report = xyd.BattleController.get():createReport(data.battle_report)

		data.battle_report = report
	end

	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.GUILD_WAR
	})
end

function BattleController:ArenaTeamSingleBattle(data, isReport)
	isReport = isReport or false

	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.ARENA_TEAM,
		isReport = isReport,
		is_last = data.is_last
	}

	if isReport then
		tmpData.is_last = true
	end

	local battleReport = data.battle_report

	tmpData.event_data.battle_report_backend = battleReport

	if battleReport and battleReport.random_seed and battleReport.random_seed > 0 then
		local report = xyd.BattleController.get():createReport(data.battle_report)

		tmpData.event_data.battle_report = report

		if self:diffReport(battleReport, report, data.record_id) then
			tmpData.diffReport = true

			xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
				xyd.closeWindow("battle_loading_window")
				self:onArenaTeamBattleResult(tmpData)
			end))

			return
		end
	end

	self:startBattle(tmpData)
end

function BattleController:arcticExpeditionSingleBattle(data, cell_id, self_info)
	local tmpData = {
		isReport = true,
		event_data = data,
		battle_type = xyd.BattleType.ARCTIC_EXPEDITION,
		self_info = self_info
	}
	local battleReport = data.battle_report

	tmpData.event_data.battle_report_backend = battleReport
	tmpData.event_data.self_info = self_info
	tmpData.event_data.cell_id = cell_id

	if battleReport and battleReport.random_seed and battleReport.random_seed > 0 then
		local report = xyd.BattleController.get():createReport(data.battle_report)

		tmpData.event_data.battle_report = report
	end

	self:startBattle(tmpData)
end

function BattleController:onArenaTeamBattle(event, isReport, battleIndex)
	if isReport == nil then
		isReport = false
	end

	local arenaTeam = xyd.models.arenaTeam
	local data = xyd.decodeProtoBuf(event.data)
	local battleData = {
		is_win = data.is_win,
		enemy_info = data.enemy_info,
		battle_report = data.battle_report,
		self_info = data.self_info,
		items = data.items,
		index = data.index,
		record_id = data.record_id,
		self_change = data.self_change,
		enemy_change = data.enemy_change,
		battle_reports = data.battle_reports,
		matchNum = battleIndex
	}

	arenaTeam:setTmpReports(data)

	if not isReport then
		local oldRank = arenaTeam:getRank()

		arenaTeam:updateRank(data.rank)
		arenaTeam:updateScore(data.score)
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.GET_ARENA_TEAM_INFO,
			data = {}
		})

		if data.rank <= xyd.TOP_ARENA_NUM then
			arenaTeam:reqRankList()
		elseif oldRank and oldRank <= xyd.TOP_ARENA_NUM then
			arenaTeam:reqRankList()
		end
	else
		arenaTeam:resetTmpReports(battleIndex)

		battleData.battle_report = data.battle_report

		self:ArenaTeamSingleBattle(battleData, true)

		return
	end

	if not arenaTeam:isSkipReport() then
		battleData.battle_report = data.battle_reports[1]

		function battleData.onOpenCallback()
			xyd.WindowManager.get():closeWindow("arena_team_choose_player_window")
			xyd.WindowManager.get():closeWindow("arena_team_record_window")
		end

		battleData.is_last = arenaTeam:isLastReport()

		self:ArenaTeamSingleBattle(battleData)
	else
		xyd.WindowManager.get():closeWindow("arena_team_choose_player_window")
		xyd.WindowManager.get():closeWindow("arena_team_record_window")

		battleData.battle_type = xyd.BattleType.ARENA_TEAM

		xyd.WindowManager.get():openWindow("arena_3v3_result_window", {
			battleParams = battleData,
			battle_type = xyd.BattleType.ARENA_TEAM
		})
	end
end

function BattleController:Arena3v3SingleBattle(data)
	local battleReport = data.battle_report
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.ARENA_3v3,
		is_last = data.is_last,
		isReport = data.isReport,
		battle_report = data.battle_report,
		onOpenCallback = data.onOpenCallback
	}

	tmpData.event_data = {
		is_win = data.is_win,
		enemy_info = data.enemy_info,
		self_info = data.self_info,
		battle_report_backend = data.battle_report,
		items = data.items,
		index = data.index,
		record_id = data.record_id
	}

	local battleReport = data.battle_report

	if battleReport and battleReport.random_seed and battleReport.random_seed > 0 then
		local report = xyd.BattleController.get():createReport(data.battle_report)

		tmpData.event_data.battle_report = report

		if self:diffReport(battleReport, report, data.record_id) then
			tmpData.diffReport = true
			tmpData.isReport = data.isReport

			xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
				xyd.closeWindow("battle_loading_window")
				self:onArena3v3BattleResult(tmpData)
			end))

			return
		end
	end

	self:startBattle(tmpData)
end

function BattleController:ArenaAllServerSingleBattle(data)
	local battleReport = data.battle_report
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.ARENA_ALL_SERVER,
		is_last = data.is_last,
		isReport = data.isReport,
		battle_report = data.battle_report,
		onOpenCallback = data.onOpenCallback
	}

	tmpData.event_data.battle_report_backend = data.battle_report

	if battleReport and battleReport.random_seed and battleReport.random_seed > 0 then
		local report = xyd.BattleController.get():createReport(data.battle_report)

		tmpData.event_data.battle_report = report

		if self:diffReport(battleReport, report, data.record_id) then
			tmpData.diffReport = true

			xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
				xyd.closeWindow("battle_loading_window")
				self:onArenaAllServerBattleResult(tmpData)
			end))

			return
		end
	end

	self:startBattle(tmpData)
end

function BattleController:GuildNewWarSingleBattle(data)
	local battleReport = data.battle_report
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.GUILD_NEW_WAR,
		is_last = data.is_last,
		isReport = data.isReport,
		battle_report = data.battle_report,
		onOpenCallback = data.onOpenCallback
	}

	tmpData.event_data = {
		battle_report_backend = data.battle_report,
		items = data.items,
		record_id = data.record_id
	}

	local battleReport = data.battle_report

	if battleReport and battleReport.random_seed and battleReport.random_seed > 0 then
		local report = xyd.BattleController.get():createReport(data.battle_report)

		tmpData.event_data.battle_report = report

		if self:diffReport(battleReport, report, data.record_id) then
			tmpData.diffReport = true
			tmpData.isReport = data.isReport

			xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
				xyd.closeWindow("battle_loading_window")
				self:onGuildNewWarFightResult(tmpData)
			end))

			return
		end
	end

	dump(tmpData)
	self:startBattle(tmpData)
end

function BattleController:sportShowsBattle(data)
	local params = {
		event_data = data,
		battle_type = xyd.BattleType.SPORTS_SHOW,
		is_last = data.is_last,
		isReport = data.isReport,
		battle_report = data.battle_report,
		onOpenCallback = data.onOpenCallback
	}

	self:startBattle(params)
end

function BattleController:onArena3v3Battle(event, isReport)
	if isReport == nil then
		isReport = false
	end

	local arena = xyd.models.arena3v3
	local data = event.data
	local battleData = {
		self_change = data.self_change,
		enemy_change = data.enemy_change,
		index = data.index,
		items = data.items,
		is_win = data.is_win,
		rank = data.rank,
		score = data.score,
		enemy_info = data.enemy_info,
		battle_reports = data.battle_reports,
		self_info = data.self_info,
		record_ids = data.record_ids
	}

	xyd.models.arena3v3:setTmpReports(data)

	if not isReport then
		local oldRank = arena:getRank()

		arena:updateRank(data.rank)
		arena:updateScore(data.score)
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.GET_ARENA_3v3_INFO
		})

		if data.rank <= xyd.TOP_ARENA_NUM then
			arena:reqRankList()
		elseif oldRank and oldRank <= xyd.TOP_ARENA_NUM then
			arena:reqRankList()
		end
	else
		arena:resetTmpReports()

		battleData.is_last = true
		battleData.isReport = true
		battleData.battle_report = data.battle_report
		battleData.record_id = event.record_id

		self:Arena3v3SingleBattle(battleData)

		return
	end

	local record_id = -1

	if data.record_ids then
		record_id = data.record_ids[1]
	end

	if not arena:isSkipReport() then
		battleData.battle_report = data.battle_reports[1]

		function battleData:onOpenCallback()
			xyd.WindowManager.get():closeWindow("arena_3v3_choose_player_window")
			xyd.WindowManager.get():closeWindow("arena_3v3_record_window")
		end

		battleData.is_last = xyd.models.arena3v3:isLastReport()
		battleData.record_id = record_id

		self:Arena3v3SingleBattle(battleData)
	else
		self:Arena3v3BattleSkip(record_id, battleData)
	end
end

function BattleController:Arena3v3BattleSkip(record_id, battleData)
	xyd.WindowManager.get():closeWindow("arena_3v3_choose_player_window")
	xyd.WindowManager.get():closeWindow("arena_3v3_record_window")
	xyd.WindowManager.get():openWindow("arena_3v3_result_window", {
		battleParams = battleData,
		battle_type = xyd.BattleType.ARENA_3v3,
		record_id = record_id,
		onOpenCallback = function()
			local win = xyd.WindowManager.get():getWindow("arena_3v3_window")
			local winTop

			if win then
				winTop = win:getWindowTop()
			end

			if self:checkShowOverCardWindow(xyd.BattleType.ARENA_3v3) then
				xyd.WindowManager.get():openWindow("arena_battle_award_window", {
					items = battleData.items,
					index = battleData.index,
					delayedTop = winTop,
					isCheckShowType = xyd.BattleType.ARENA_3v3
				})
			else
				xyd.models.itemFloatModel:pushNewItems({
					battleData.items[battleData.index]
				})
			end
		end
	})
end

function BattleController:GuildNewWarSkip(record_id, battleData)
	return
end

function BattleController:onArenaScoreBattle(event, isReport)
	if isReport == nil then
		isReport = false
	end

	local arena = xyd.models.arenaAllServerScore
	local data = event.data
	local battleData = {
		self_change = data.self_change,
		enemy_change = data.enemy_change,
		index = data.index,
		items = data.items,
		is_win = data.is_win,
		rank = data.rank,
		score = data.score,
		enemy_info = data.enemy_info,
		battle_reports = data.battle_reports,
		self_info = data.self_info,
		record_ids = data.record_ids,
		isReport = isReport
	}

	if data.is_win and tonumber(data.is_win) == -1 and not isReport then
		xyd.alertTips(__("NEW_ARENA_ALL_MATCH_ERROR"))

		local msg = messages_pb:get_match_all_sever_infos_req()

		xyd.Backend.get():request(xyd.mid.GET_MATCH_ALL_SEVER_INFOS, msg)

		return
	end

	xyd.models.arenaAllServerScore:setTmpReports(data)

	if not isReport then
		if data.rank and data.rank > 0 then
			arena:updateRank(data.rank)
		end

		if data.score and data.score >= 0 then
			arena:updateScore(data.score)
		end
	else
		arena:resetTmpReports()

		battleData.is_last = true
		battleData.isReport = true
		battleData.battle_report = data.battle_report
		battleData.battle_report_backend = data.battle_report
		battleData.record_id = event.record_id

		self:ArenaAllServerSingleBattle(battleData)

		return
	end

	local record_id = -1

	if data.record_ids then
		record_id = data.record_ids[1]
	end

	if not arena:isSkipReport() then
		battleData.battle_report = data.battle_reports[1]

		function battleData:onOpenCallback()
			xyd.WindowManager.get():closeWindow("arena_3v3_choose_player_window")
			xyd.WindowManager.get():closeWindow("arena_3v3_record_window")
		end

		battleData.is_last = xyd.models.arenaAllServerScore:isLastReport()
		battleData.record_id = record_id

		self:ArenaAllServerSingleBattle(battleData)
	else
		xyd.WindowManager.get():closeWindow("arena_3v3_choose_player_window")
		xyd.WindowManager.get():closeWindow("arena_3v3_record_window")
		xyd.WindowManager.get():openWindow("arena_3v3_result_window", {
			battleParams = battleData,
			battle_type = xyd.BattleType.ARENA_ALL_SERVER,
			onOpenCallback = function()
				local win = xyd.WindowManager.get():getWindow("arena_all_server_window")
				local winTop

				if win then
					win:updateScorePartInfo()

					winTop = win:getWindowTop()
				end

				if self:checkShowOverCardWindow(xyd.BattleType.ARENA_ALL_SERVER) then
					xyd.WindowManager.get():openWindow("arena_battle_award_window", {
						items = data.items,
						index = data.index,
						delayedTop = winTop,
						isCheckShowType = xyd.BattleType.ARENA_ALL_SERVER
					})
				else
					xyd.models.itemFloatModel:pushNewItems({
						data.items[data.index]
					})
				end
			end
		})
	end
end

function BattleController:onArenaBattle(event, isReport)
	if isReport == nil then
		isReport = false
	end

	local arena = xyd.models.arena
	local data = xyd.decodeProtoBuf(event.data)

	if arena.needCheck then
		arena.needCheck = false

		xyd.models.arena:checkDefFormation()
	end

	if not isReport then
		local oldRank = arena:getRank()

		arena:updateRank(data.rank)
		arena:updateScore(data.score)
		xyd.EventDispatcher:inner():dispatchEvent({
			name = xyd.event.GET_ARENA_INFO,
			data = {}
		})

		if data.rank <= xyd.TOP_ARENA_NUM then
			arena:reqRankList()
		elseif oldRank and oldRank <= xyd.TOP_ARENA_NUM then
			arena:reqRankList()
		end
	end

	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.ARENA
	}

	tmpData.event_data.battle_report_backend = data.battle_report

	local activity_entrance_test_window_wd = xyd.WindowManager.get():getWindow("activity_entrance_test_window")

	if activity_entrance_test_window_wd then
		tmpData.battle_type = xyd.BattleType.ENTRANCE_TEST
	end

	local battleReport = data.battle_report
	local needCreateReport = battleReport and battleReport.random_seed and battleReport.random_seed > 0

	if arena:isSkipReport() and not isReport then
		needCreateReport = false
	end

	if needCreateReport then
		if not xyd.checkReportVer(data.battle_report) then
			xyd.closeWindow("battle_loading_window")

			return
		end

		local report = xyd.BattleController.get():createReport(data.battle_report)

		tmpData.event_data.battle_report = report

		if self:diffReport(battleReport, report, data.record_id) then
			tmpData.diffReport = true
			tmpData.isReport = isReport

			xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
				xyd.closeWindow("battle_loading_window")
				xyd.WindowManager.get():closeWindow("arena_choose_player_window")
				xyd.WindowManager.get():closeWindow("arena_record_window")
				self:onArenaBattleResult(tmpData)
			end))

			return
		end
	end

	if not arena:isSkipReport() or isReport then
		if not isReport then
			function tmpData.onOpenCallback()
				local win = xyd.WindowManager.get():getWindow("arena_window")
				local winTop

				if win then
					winTop = win:getWindowTop()
				end

				if self:checkShowOverCardWindow(xyd.BattleType.ARENA) then
					xyd.WindowManager.get():openWindow("arena_battle_award_window", {
						items = data.items,
						index = data.index,
						delayedTop = winTop,
						isCheckShowType = xyd.BattleType.ARENA
					})
				else
					xyd.models.itemFloatModel:pushNewItems({
						data.items[data.index]
					})
				end

				xyd.WindowManager.get():closeWindow("arena_choose_player_window")
				xyd.WindowManager.get():closeWindow("arena_record_window")

				if tmpData.event_data.is_win == 1 then
					local evaluate_have_closed = xyd.db.misc:getValue("evaluate_have_closed") or false
					local lastTime = xyd.db.misc:getValue("evaluate_last_time") or 0

					if not evaluate_have_closed and lastTime and xyd.getServerTime() - lastTime > 3 * xyd.DAY_TIME then
						local win = xyd.getWindow("main_window")

						win:setHasEvaluateWindow(true, xyd.EvaluateFromType.ARENA)
					end
				end
			end
		end

		self:startBattle(tmpData)
	else
		xyd.WindowManager.get():closeWindow("arena_choose_player_window")
		xyd.WindowManager.get():closeWindow("arena_record_window")
		self:onArenaBattleResult(tmpData)
	end
end

function BattleController:entranceBattle(event)
	local data = xyd.decodeProtoBuf(event.data)
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.ENTRANCE_TEST_REPORT
	}

	tmpData.event_data.battle_report_backend = data.battle_report

	local battleReport = data.battle_report
	local needCreateReport = battleReport and battleReport.random_seed and battleReport.random_seed > 0

	if needCreateReport then
		if not xyd.checkReportVer(data.battle_report) then
			xyd.closeWindow("battle_loading_window")

			return
		end

		local report = xyd.BattleController.get():createReport(data.battle_report)

		tmpData.event_data.battle_report = report

		if self:diffReport(battleReport, report, data.record_id) then
			tmpData.diffReport = true
			tmpData.isReport = isReport

			xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
				xyd.closeWindow("battle_loading_window")
			end))

			return
		end
	end

	self:startBattle(tmpData)
end

function BattleController:diffReport(backReport, report, record_id)
	if backReport.isWin ~= report.isWin then
		local log = "BATTLE DIFF: " .. "Player ID: " .. tostring(xyd.Global.playerID) .. " record ID: " .. tostring(record_id) .. "\n"

		xyd.db.errorLog:add(log, 0, "", true)

		return true
	end

	return false
end

function BattleController:onDungeonBattle(event)
	local dungeon = xyd.models.dungeon
	local data = event.data
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.DUNGEON
	}

	xyd.models.dressShow:onUseBuffTimes(xyd.FunctionID.DUNGEON)

	if not dungeon:isSkipReport() then
		local wnd = xyd.getWindow("dungeon_window")

		if wnd then
			wnd:beforeBattle()
		end

		self:startBattle(tmpData)
	else
		self:onDungeonBattleResult(tmpData)
	end
end

function BattleController:onDailyQuizBattle(event)
	local data = event.data

	if xyd.models.dailyQuiz:isSkipReport() then
		self:normalBattleResult({
			event_data = data,
			battle_type = xyd.BattleType.DAILY_QUIZ
		})
	else
		self:startBattle({
			event_data = data,
			battle_type = xyd.BattleType.DAILY_QUIZ
		})
	end
end

function BattleController:onSportsShowBattleResult(data)
	data.map_type = xyd.MapType.SPORTS_PVP

	self:openBaseBattleResult({
		event_data = data
	}, function()
		if not data.is_win or data.is_win == 0 then
			return
		end
	end)
end

function BattleController:onHeroChallengeFight(event)
	local data = event.data
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.HERO_CHALLENGE
	}

	if xyd.models.heroChallenge:isSkipReport() then
		self:onHeroChallengeBattleResult(tmpData)
	elseif false and UNITY_EDITOR and xyd.db.misc:getValue("test_index", -1) == "1" then
		if type(data.ListFields) ~= "nil" then
			data = xyd.decodeProtoBuf(data)
		end

		data.battle_report.random_seed = math.random(1, 10000)
		data.battle_report.battle_type = xyd.ReportBattleType.HERO_CHALLENGE

		local report = xyd.BattleController.get():createReport(data.battle_report)
		local params = {}

		params.event_data = {}

		for key, _ in pairs(data) do
			params.event_data[key] = _
		end

		params.battle_type = xyd.ReportBattleType.HERO_CHALLENGE
		params.event_data.battle_report = report

		reportLog2("test_local")
		self:startBattle(params)
	else
		self:startBattle(tmpData)
	end
end

function BattleController:onHeroChallengeChessFight(event)
	local data = event.data
	local fortID = data.fort_info.base_info.fort_id
	local baseInfo = data.fort_info.base_info
	local decCoin = 0

	if baseInfo.coin and xyd.models.heroChallenge.chessCoin_[fortID] ~= baseInfo.coin then
		decCoin = baseInfo.coin - xyd.models.heroChallenge.chessCoin_[fortID]
		xyd.models.heroChallenge.chessCoin_[fortID] = baseInfo.coin
	end

	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.HERO_CHALLENGE_CHESS,
		decCoin = decCoin
	}

	if xyd.models.heroChallenge:isSkipReport() then
		self:onHeroChallengeBattleResult(tmpData)
	else
		self:startBattle(tmpData)
	end
end

function BattleController:onHeroChallengeReport(event)
	local data = event.data

	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.HERO_CHALLENGE_REPORT
	})
end

function BattleController:onFriendBossBattle(event)
	local data = event.data

	local function onOpenCallback()
		xyd.WindowManager.get():openWindow("arena_battle_award_window", {
			items = data.items,
			index = data.index
		})
	end

	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.FRIEND_BOSS,
		onOpenCallback = onOpenCallback
	})
end

function BattleController:onFriendBattle(event)
	local data = event.data

	if UNITY_EDITOR and xyd.db.misc:getValue("test_index", -1) == "1" then
		if type(data.ListFields) ~= "nil" then
			data = xyd.decodeProtoBuf(data)
		end

		local report = xyd.BattleController.get():createReport(data.battle_report, 1)
		local params = {}

		params.event_data = {}

		for key, _ in pairs(data) do
			params.event_data[key] = _
		end

		params.battle_type = xyd.BattleType.FRIEND
		params.event_data.battle_report = report

		battleReportDes:randomRecord(report.random_log, data.battle_report.random_log)
		reportLog2("test_local")
		self:startBattle(params)
	else
		self:startBattle({
			event_data = data,
			battle_type = xyd.BattleType.FRIEND
		})
	end
end

function BattleController:onFriendBossFight(event)
	local data = event.data
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.FRIEND_BOSS
	}
	local selectedBossLevel = xyd.models.friend:getSelectedBossLevel()

	if xyd.models.friend:canJumpBattle(selectedBossLevel) and xyd.models.friend:isSkipBattle() then
		self:normalBattleResult(tmpData)
	else
		self:startBattle(tmpData)
	end
end

function BattleController:onNewPartnerWarmUpFight(event)
	local data = event.data
	local report = self:createBattleReport(data.stage_id)

	if report.battle_report.info.battle_id == 0 then
		return
	end

	self:startBattle({
		event_data = report,
		battle_type = xyd.BattleType.NEW_PARTNER_WARMUP
	})
end

function BattleController:onSportsFight(event)
	local data = event.data

	if not data.battle_report then
		return
	end

	local isSkipReport = xyd.checkCondition(tonumber(xyd.db.misc:getValue("sports_skip_report")) == 1, true, false)

	if not isSkipReport then
		self:startBattle({
			event_data = data,
			battle_type = xyd.BattleType.SPORTS_PVP
		})
	else
		self:onSportsBattleResult({
			event_data = data,
			battle_type = xyd.BattleType.SPORTS_PVP
		})
	end
end

function BattleController:onOldBuildingFight(event)
	xyd.models.activity:exploreOldCampusFightTime()
	xyd.WindowManager.get():closeWindow("battle_window")

	local data = event.data
	local isSkipReport = xyd.checkCondition(tonumber(xyd.db.misc:getValue("explore_old_campus_skip_fight")) == 1, true, false)

	if type(data.ListFields) ~= "nil" then
		data = xyd.decodeProtoBuf(data)
	end

	if not data.battle_result then
		self:startBattle({
			event_data = data,
			battle_type = xyd.BattleType.EXPLORE_OLD_CAMPUS
		})

		return
	end

	local params = {}
	local isChange, beforeScore = xyd.models.oldSchool:checkScoreChange(data.stage_id, data.floor_info)

	params.battle_report = data.battle_result.battle_report
	params.is_win = data.battle_result.is_win
	params.buff_ids = data.buff_ids
	params.battle_type = xyd.BattleType.EXPLORE_OLD_CAMPUS
	params.is_score_up = isChange
	params.beforeScore = beforeScore
	params.floor_info = data.floor_info
	params.stage_id = data.stage_id

	local floor_id = xyd.tables.oldBuildingStageTable:getFloor(params.stage_id)

	if floor_id >= 11 then
		params.is_win = 1
		params.isWin = 1
		params.battle_report.isWin = 1
	end

	xyd.models.dressShow:onUseBuffTimes(xyd.FunctionID.OLD_SCHOOL)

	if not isSkipReport then
		self:startBattle({
			event_data = params,
			battle_type = xyd.BattleType.EXPLORE_OLD_CAMPUS
		})
	else
		self:onOldBuildingBattleResult({
			event_data = params,
			battle_type = xyd.BattleType.EXPLORE_OLD_CAMPUS
		})
	end
end

function BattleController:onTowerStart(event, isReport)
	local data = event.data
	local isRecord = false

	if data.battle_report and data.battle_report.random_seed and data.battle_report.random_seed > 0 then
		if not xyd.checkReportVer(data.battle_report) then
			return
		end

		data = xyd.models.towerMap:getTowerReport(data.stage_id, data.record_id)
	end

	if data.record_id or isReport == true then
		isRecord = true
	end

	if not isReport then
		xyd.models.dressShow:onUseBuffTimes(xyd.FunctionID.TOWER)
	end

	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.TOWER,
		isRecord = isRecord
	}

	if xyd.models.towerMap:isSkipReport(xyd.BattleType.TOWER) and not isRecord then
		self:onTowerBattleResult(tmpData)
	else
		xyd.closeWindow("tower_window", nil, nil, true)
		self:startBattle(tmpData)
	end
end

function BattleController:onSoulLandStart(event, isReport)
	local data = event.data
	local isRecord = false

	if data.battle_report and data.battle_report.random_seed and data.battle_report.random_seed > 0 then
		if not xyd.checkReportVer(data.battle_report) then
			return
		end

		data = xyd.models.towerMap:getTowerReport(data.stage_id, data.record_id)
	end

	if data.record_id or isReport == true then
		isRecord = true
	end

	if not isReport then
		xyd.models.dressShow:onUseBuffTimes(xyd.FunctionID.SOUL_LAND)
	end

	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.SOUL_LAND_REPORT,
		isRecord = isRecord
	}

	self:startBattle(tmpData)
end

function BattleController:onAdventureBattle(event)
	local data = xyd.decodeProtoBuf(event.data)

	if data.battle_result then
		local wnd = xyd.WindowManager.get():getWindow("explore_adventure_window")

		if wnd and wnd.onAutoAdven then
			return
		end

		xyd.closeWindow("explore_adventure_prepare_window")
		xyd.models.exploreModel:setBattleAwards(data.items)

		local tmpData = {
			event_data = event.data.battle_result,
			battle_type = xyd.BattleType.EXPLORE_ADVENTURE
		}

		if xyd.models.exploreModel:isSkipReport() then
			self:normalBattleResult(tmpData)
		else
			self:startBattle(tmpData)
		end
	end
end

function BattleController:onTowerPractice(event)
	local data = event.data

	if data.battle_report and data.battle_report.random_seed and data.battle_report.random_seed > 0 then
		data = xyd.models.towerMap:getTowerReport(data.stage_id, data.record_id)
	end

	local tmpData = {
		isRecord = true,
		event_data = data,
		battle_type = xyd.BattleType.TOWER_PRACTICE
	}

	if xyd.models.towerMap:isSkipReport(xyd.BattleType.TOWER_PRACTICE) then
		self:onTowerPracticeResult(tmpData)
	else
		xyd.closeWindow("tower_window", nil, nil, true)
		self:startBattle(tmpData)
	end
end

function BattleController:onTowerSelfReport(event)
	local data = event.data

	if not data.battle_report.teamA[1] then
		xyd.alertTips(__("BATTLE_VERSION_TIPS"))

		return
	end

	if not data.battle_report then
		local wnd = xyd.WindowManager.get():getWindow("tower_record_window")

		if wnd then
			wnd:showNoReportTips()
		end
	else
		if data.battle_report and data.battle_report.random_seed and data.battle_report.random_seed > 0 then
			if not xyd.checkReportVer(data.battle_report) then
				return
			end

			data = xyd.models.towerMap:getMyTowerReport(data.stage_id)
		end

		xyd.closeWindow("tower_window", nil, nil, true)
		self:startBattle({
			isRecord = true,
			event_data = data,
			battle_type = xyd.BattleType.TOWER
		})
	end
end

function BattleController:onFriendTeamBossFight(event)
	local data = event.data

	xyd.models.dressShow:onUseBuffTimes(xyd.FunctionID.FRIEND_TEAM_BOSS)
	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.FRIEND_TEAM_BOSS
	})
end

function BattleController:onFriendTeamBossReport(event)
	local data = event.data
	local team_info = xyd.models.friendTeamBoss:getTeamInfo()

	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.FRIEND_TEAM_BOSS_REPORT,
		team_info = team_info
	})
end

function BattleController:onTrialFight(event)
	local data = event.data
	local onOpenCallback

	if data.is_win and data.items then
		local win = xyd.WindowManager.get():getWindow("trial_window")

		if win then
			local winTop = win:getWindowTop()
			local resItem = winTop:getResItems()[1]
			local currentStage = xyd.models.trial:currentStage() - 1
			local awards = xyd.tables.trialTable:getAward(xyd.models.backpack:getLev(), currentStage)

			for i = 1, #awards do
				if awards[i][1] == resItem.itemID then
					resItem:setItemNum(resItem:getTrueNum() + awards[i][2])

					break
				end
			end
		end

		function onOpenCallback()
			local win = xyd.WindowManager.get():getWindow("trial_window")
			local winTop

			if win then
				winTop = win:getWindowTop()
			end

			xyd.WindowManager.get():openWindow("arena_battle_award_window", {
				items = data.items,
				index = data.index,
				delayedTop = winTop
			})
		end
	end

	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.TRIAL,
		onOpenCallback = onOpenCallback
	}

	if not xyd.models.trial:isSkipReport() then
		self:startBattle(tmpData)
	else
		self:onTrialBattleResult(tmpData)
	end
end

function BattleController:onNewTrialFight(event)
	local data = event.data

	if not data.battle_report or tostring(data.battle_report) == "" then
		return
	end

	if data.battle_report.isWin == 1 and data.battle_report.items then
		-- block empty
	end

	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.TRIAL,
		stage_id = data.info.current_stage
	}

	if not xyd.models.trial:isSkipReport() or xyd.models.trial:getIsReport() then
		if xyd.models.trial:getIsReport() then
			tmpData.isReport = true

			xyd.models.trial:setIsReport(false)
		end

		self:startBattle(tmpData)
	else
		self:onTrialBattleResult(tmpData)
	end
end

function BattleController:onFairyTaleBattle(event)
	local data = event.data

	if not data.battle_result or tostring(data.battle_result) == "" and data.is_video then
		local result = event.data

		result.items = data.items or {}
		result.battle_report.hasDecoded = true
		result.battle_report.isWin = 1

		local tmpData = {
			event_data = result,
			battle_type = xyd.BattleType.FAIRY_TALE
		}

		self:startBattle(tmpData)
	elseif data.battle_result and tostring(data.battle_result) ~= "" then
		data.battle_result.is_win = 1

		local result = xyd.decodeProtoBuf(data.battle_result)

		result.items = data.items or {}
		result.battle_report.hasDecoded = true
		result.battle_report.isWin = 1

		local tmpData = {
			event_data = result,
			battle_type = xyd.BattleType.FAIRY_TALE
		}

		self:startBattle(tmpData)
	end
end

function BattleController:onSchoolPracticeFight(event)
	local data = event.data

	xyd.WindowManager.get():closeWindow("academy_assessment_battle_formation_window")

	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.ACADEMY_ASSESSMENT
	}

	xyd.models.dressShow:onUseBuffTimes(xyd.FunctionID.ACADEMY_ASSESSMENT)

	local isSkipReport = xyd.checkCondition(tonumber(xyd.db.misc:getValue("academy_assessment_skip_report")) == 1, true, false)

	if not isSkipReport then
		self:startBattle(tmpData)
	else
		self:openBaseBattleResult(tmpData)
	end
end

function BattleController:onGuildBossFight(event)
	local wnd = xyd.getWindow("game_assistant_result_window")
	local wnd2 = xyd.getWindow("guild_window")

	if wnd then
		return
	end

	local data = event.data

	xyd.WindowManager.get():closeWindow("guild_boss_window")
	xyd.WindowManager.get():closeWindow("guild_final_boss_window")
	xyd.WindowManager.get():closeWindow("guild_gym_window")

	local boss_id = data.boss_id

	if boss_id and boss_id <= 60 then
		xyd.models.guild:setGuildBossTime(1)
	else
		xyd.models.guild:setGuildBossTime(2)
	end

	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.GUILD_BOSS
	})
end

function BattleController:onGalayTripGridBattleBack(event)
	local data = xyd.decodeProtoBuf(event.data)
	local gridId = data.id
	local items = {}
	local ballId = xyd.models.galaxyTrip:getGalaxyTripGetCurMap()
	local posId = xyd.models.galaxyTrip:getPosIdFromGridId(ballId, gridId)
	local ballMapInfo = xyd.models.galaxyTrip:getBallInfo(ballId)
	local ballMap = ballMapInfo.map
	local eventArr = xyd.split(ballMap[posId].info, "#", true)
	local eventId = eventArr[1]
	local award1 = xyd.tables.galaxyTripEventTable:getAward1(eventId)
	local award2 = xyd.tables.galaxyTripEventTable:getAward2(eventId)
	local award3 = xyd.tables.galaxyTripEventTable:getAward3(eventId)

	for i, awardInfo in pairs(award1) do
		local awardNum = xyd.models.galaxyTrip:getAwardNumWithBuff(awardInfo[2], 1)

		table.insert(items, {
			item_id = awardInfo[1],
			item_num = awardNum
		})
	end

	for i, awardInfo in pairs(award2) do
		local awardNum = xyd.models.galaxyTrip:getAwardNumWithBuff(awardInfo[2], 2)

		table.insert(items, {
			item_id = awardInfo[1],
			item_num = awardNum
		})
	end

	for i, awardInfo in pairs(award3) do
		local awardNum = awardInfo[2]

		table.insert(items, {
			item_id = awardInfo[1],
			item_num = awardNum
		})
	end

	xyd.models.galaxyTrip:useGalaxyTripGetMainTicket()

	data.battle_result.items = items
	data.battle_result.gridId = gridId

	local tmpData = {
		event_data = data.battle_result,
		battle_type = xyd.BattleType.GALAXY_TRIP_BATTLE
	}

	for i, info in pairs(data.battle_result.battle_report) do
		dump(info, i)
	end

	local isSkipReport = xyd.checkCondition(tonumber(xyd.db.misc:getValue("galaxy_trip_fight_skip_report")) == 1, true, false)

	if not isSkipReport then
		self:startBattle(tmpData)
	else
		self:openBaseBattleResult(tmpData)
	end

	local isWin = data.battle_result.is_win

	if isWin == 1 then
		xyd.models.galaxyTrip:removeGalaxyTripEnemiesHpInfo(gridId)
		xyd.models.galaxyTrip:setFightWin(gridId)
	else
		local eventType = xyd.tables.galaxyTripEventTable:getType(eventId)

		if eventType == xyd.GalaxyTripGridEventType.ELITE_ENEMY or eventType == xyd.GalaxyTripGridEventType.COMMON_ENEMY then
			local hpArr = data.battle_result.battle_report.hp

			for i in pairs(hpArr) do
				local tempHpArr = xyd.cloneTable(hpArr[i])

				if tonumber(tempHpArr.pos) >= 7 then
					tempHpArr.pos = tempHpArr.pos - 6

					xyd.models.galaxyTrip:setGalaxyTripEnemiesHpInfo(gridId, tempHpArr.pos, tempHpArr)
				end
			end
		end
	end

	xyd.models.galaxyTrip:updateMapShow()
end

function BattleController:onGalayTripGridBattleReport(data)
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.GALAXY_TRIP_BATTLE
	}

	self:startBattle(tmpData)
end

function BattleController:onSoulLandFightBack(event)
	local data = xyd.decodeProtoBuf(event.data)

	local function battleFun()
		local tmpData = {
			event_data = {
				battle_report = data.battle_report,
				fortId = data.fort_info.fort_id,
				items = data.items
			},
			battle_type = xyd.BattleType.SOUL_LAND
		}
		local isSkipReport = xyd.checkCondition(tonumber(xyd.db.misc:getValue("soul_land_skip_report")) == 1, true, false)

		xyd.WindowManager.get():closeWindow("soul_land_fight_window")

		if not isSkipReport then
			self:startBattle(tmpData)
		else
			self:openBaseBattleResult(tmpData)
		end
	end

	local isHasNewEquip = false

	if data.items then
		for i, item in pairs(data.items) do
			local type = xyd.tables.itemTable:getType(item.item_id)

			if type == xyd.ItemType.SOUL_EQUIP1 or type == xyd.ItemType.SOUL_EQUIP2_POS1 or type == xyd.ItemType.SOUL_EQUIP2_POS2 or type == xyd.ItemType.SOUL_EQUIP2_POS3 or type == xyd.ItemType.SOUL_EQUIP2_POS4 then
				isHasNewEquip = true

				break
			end
		end
	end

	if isHasNewEquip then
		local function equipDealFun()
			local equipIdPushBackWithMid = xyd.models.slot:getEquipIdPushBackWithMid()

			if equipIdPushBackWithMid and equipIdPushBackWithMid.mid == xyd.mid.SOUL_LAND_FIGHT then
				local pushItems = equipIdPushBackWithMid.items

				for i, item in pairs(data.items) do
					for k in pairs(pushItems) do
						if item.item_id == pushItems[k].table_id then
							item.soulEquipInfo = pushItems[k]

							table.remove(pushItems, k)

							break
						end
					end
				end

				battleFun()
				xyd.models.slot:clearEquipIdPushBackWithMid()
			end
		end

		local equipIdPushBackWithMid = xyd.models.slot:getEquipIdPushBackWithMid()

		if equipIdPushBackWithMid and equipIdPushBackWithMid.mid == xyd.mid.SOUL_LAND_FIGHT then
			equipDealFun()
		else
			local info = {
				equipDealFun = equipDealFun,
				mid = xyd.mid.SOUL_LAND_FIGHT
			}

			xyd.models.slot:setWaitEquipIdPushBackWithMid(info)
		end
	else
		battleFun()
	end
end

function BattleController:onSoulLandFightReport(data)
	local tmpData = {
		event_data = {
			battle_report = data.battle_report,
			fortId = data.fortId,
			items = data.items
		},
		battle_type = xyd.BattleType.SOUL_LAND
	}

	self:startBattle(tmpData)
end

function BattleController:onGalayTripSpecialBossBattleBack(event)
	local data = xyd.decodeProtoBuf(event.data)
	local id = data.id
	local isWin = data.battle_result.is_win
	local ballId = xyd.models.galaxyTrip:getBossMapId()
	local ballMapInfo = xyd.models.galaxyTrip:getBallInfo(ballId)
	local ballMap = ballMapInfo.map
	local award1 = {}
	local award2 = {}
	local eventId
	local award3 = {}

	if data.is_boss and data.is_boss == 1 and isWin == 1 then
		local ballInfo = xyd.models.galaxyTrip:getBallInfo(ballId)

		if ballInfo then
			local galaxy_trip_boss_max_level = xyd.tables.miscTable:split2num("galaxy_trip_boss_max_level", "value", "|")
			local items = {}
			local addScore = 0

			if id > ballInfo.diff then
				local events = xyd.tables.galaxyTripMapTable:getEvents(ballId)

				for i = ballInfo.diff + 1, id do
					addScore = addScore + xyd.tables.galaxyTripEventTable:getExplorePoints(events[i])

					local award = xyd.tables.galaxyTripEventTable:getAward3(events[i])

					for j, awardInfo in pairs(award) do
						local awardNum = awardInfo[2]
						local isSearch = false

						for k, info in pairs(items) do
							if info.item_id == awardInfo[1] then
								info.item_num = info.item_num + awardNum
								isSearch = true

								break
							end
						end

						if not isSearch then
							table.insert(items, {
								item_id = awardInfo[1],
								item_num = awardNum
							})
						end
					end
				end
			end

			award3 = items

			if addScore > 0 then
				xyd.models.galaxyTrip:setAddCurSeasonScore(addScore)
			end

			if data.items and #data.items > 0 then
				data.battle_result.items = data.items

				for i, awardInfo in pairs(award3) do
					local awardNum = awardInfo.item_num

					table.insert(data.battle_result.items, {
						item_id = awardInfo.item_id,
						item_num = awardNum
					})
				end

				local dealArr = {}

				for i, awardInfo in pairs(data.battle_result.items) do
					local isSearch = false

					for k, info in pairs(dealArr) do
						if info.item_id == awardInfo.item_id then
							info.item_num = info.item_num + awardInfo.item_num
							isSearch = true

							break
						end
					end

					if not isSearch then
						table.insert(dealArr, {
							item_id = awardInfo.item_id,
							item_num = awardInfo.item_num
						})
					end
				end

				data.battle_result.items = dealArr
			end
		end
	elseif data.is_boss and data.is_boss == 0 and isWin == 1 then
		eventId = xyd.models.galaxyTrip:getRobberEnemyEventId()

		xyd.models.galaxyTrip:setAddCurSeasonScore(xyd.tables.galaxyTripEventTable:getExplorePoints(eventId))

		award3 = xyd.tables.galaxyTripEventTable:getAward3(eventId)

		if data.items and #data.items > 0 then
			data.battle_result.items = data.items

			for i, awardInfo in pairs(award3) do
				local awardNum = awardInfo[2]

				table.insert(data.battle_result.items, {
					item_id = awardInfo[1],
					item_num = awardNum
				})
			end
		end
	end

	local tmpData = {
		event_data = data.battle_result,
		battle_type = xyd.BattleType.GALAXY_TRIP_SPECIAL_BOSS_BATTLE
	}
	local isSkipReport = xyd.checkCondition(tonumber(xyd.db.misc:getValue("galaxy_trip_special_boss_fight_skip_report")) == 1, true, false)

	if not isSkipReport then
		self:startBattle(tmpData)
	else
		self:openBaseBattleResult(tmpData)
	end

	if isWin == 1 then
		if data.is_boss and data.is_boss == 1 then
			xyd.models.galaxyTrip:checkSpecialBossDiff(id)
		elseif data.is_boss and data.is_boss == 0 then
			xyd.models.galaxyTrip:checkSpecialBossRobberEnemyRemove(id)
		end
	end

	xyd.models.galaxyTrip:updateMapShow()
end

function BattleController:onGalayTripSpecialBossBattleReport(data)
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.GALAXY_TRIP_SPECIAL_BOSS_BATTLE
	}

	self:startBattle(tmpData)
end

function BattleController:onGuildCometitionBattleFight(event)
	local data = xyd.decodeProtoBuf(event.data)

	data.battle_result.is_win = 1
	data.battle_result.battle_report.isWin = 1
	data.battle_result.items = data.items
	data.battle_result.self_harm = data.self_harm
	data.battle_result.type = data.type
	data.battle_result.battle_lv = data.battle_lv
	data.battle_result.boss_id = data.boss_id

	local guildCompetitionFightWn = xyd.WindowManager.get():getWindow("guild_competition_fight_window")

	if guildCompetitionFightWn then
		guildCompetitionFightWn:hideEffect()
		xyd.WindowManager.get():closeWindow("guild_competition_fight_window")
	end

	if data.type == 1 then
		xyd.models.guild:guildCometitionBattleBack(data)

		if data.super and data.super > 0 then
			xyd.models.guild:clearCompetitionSpecialPartner()

			local activityData = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_COMPETITION)

			activityData:addUsedPrs(data.super)
		end

		xyd.models.guild:setCanUpdateCompetitionActiveMissionCheck(true)
		xyd.models.guild:checkCanUpdateCompetitionActiveMissionWithTime()
	end

	local point = 0

	print("self_control_times==============:", data.battle_result.battle_report.self_control_times)
	print("enemy_control_times=================:", data.battle_result.battle_report.enemy_control_times)

	if data.point then
		point = data.point
		point = math.floor((point + 0.001) * 100) / 100
	else
		local bossTable = xyd.tables.guildCompetitionBossTable
		local battle_round = data.battle_lv

		if data.battle_lv > #bossTable:getIds() then
			battle_round = #bossTable:getIds()
		end

		local allBlood = 0
		local battleId = bossTable["getBattleId" .. data.boss_id](bossTable, battle_round)
		local monsters = xyd.tables.battleTable:getMonsters(battleId)

		for i in pairs(monsters) do
			allBlood = allBlood + xyd.tables.monsterTable:getHp(monsters[i])
		end

		point = tonumber(data.self_harm) / allBlood * bossTable:getPoint(battle_round)

		local targetArr = data.battle_result.battle_report.purposes
		local targetCompleteNum = 0

		if targetArr then
			for i in pairs(targetArr) do
				if targetArr[i] == 1 then
					targetCompleteNum = targetCompleteNum + 1
				end
			end
		end

		point = point * (1 + targetCompleteNum * 0.1)
		point = math.floor((point + 0.001) * 100) / 100
	end

	data.battle_result.point = point

	if data.battle_result.battle_report.teamB then
		for i, enemyData in pairs(data.battle_result.battle_report.teamB) do
			if enemyData and enemyData.status and enemyData.status.hp and enemyData.status.true_hp and data.battle_lv then
				local bossTable = xyd.tables.guildCompetitionBossTable
				local battleId = bossTable["getBattleId" .. data.boss_id](bossTable, data.battle_lv)
				local monsters = xyd.tables.battleTable:getMonsters(battleId)
				local all_hp = xyd.tables.monsterTable:getHp(monsters[i])
			end
		end
	end

	self:startBattle({
		event_data = data.battle_result,
		battle_type = xyd.BattleType.GUILD_COMPETITION
	})
end

function BattleController:onFairArenaBattle(event)
	local data = event.data
	local tmpData = {
		battle_type = xyd.BattleType.FAIR_ARENA
	}

	function tmpData.onOpenCallback()
		local win = xyd.WindowManager.get():getWindow("fair_arena_explore_window")
		local winTop

		if win then
			winTop = win:getWindowTop()
		end

		xyd.WindowManager.get():openWindow("arena_battle_award_window", {
			items = data.battle_result.items,
			index = data.battle_result.index,
			delayedTop = winTop
		})
	end

	tmpData.event_data = {
		battle_report = data.battle_result.battle_report,
		is_win = data.battle_result.is_win,
		enemy_info = xyd.models.fairArena:getOldEnemyInfo(),
		self_info = xyd.models.fairArena:getSelfInfo()
	}

	self:startBattle(tmpData)
	xyd.WindowManager.get():closeWindow("fair_arena_explore_window")
end

function BattleController:onFairArenaBattleResult(data)
	self:openBaseBattleResult(data, function(isOpen)
		if isOpen and not xyd.WindowManager.get():isOpen("fair_arena_explore_window") then
			xyd.WindowManager.get():openWindow("fair_arena_explore_window", {})
		end
	end)
end

function BattleController:onAcademyAssessmentReport(event)
	local data = event.data
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.ACADEMY_ASSESSMENT
	}

	self:startBattle(tmpData)
end

function BattleController:onFairArenaBattleReport1(event)
	local data = event.data
	local tmpData = {
		event_data = data,
		battle_type = xyd.BattleType.FAIR_ARENA
	}

	self:startBattle(tmpData)
end

function BattleController:onFairArenaBattleReport2(event)
	local data = event.data
	local tmpData = {
		battle_type = xyd.BattleType.FAIR_ARENA
	}

	tmpData.event_data = {
		battle_report = data.battle_result.battle_report,
		is_win = data.battle_result.is_win,
		enemy_info = xyd.models.fairArena:getReportEnemyInfo(),
		self_info = xyd.models.fairArena:getSelfInfo()
	}

	self:startBattle(tmpData)
end

function BattleController:onBeachIslandBattle(event)
	local data = xyd.decodeProtoBuf(event.data)
	local tmpData = {
		battle_type = xyd.BattleType.BEACH_ISLAND
	}

	tmpData.event_data = {
		battle_report = data.battle_result.battle_report,
		is_win = data.battle_result.is_win,
		items = data.items
	}

	self:startBattle(tmpData)
end

function BattleController:onEncounterBattle(event)
	local data = xyd.decodeProtoBuf(event.data)
	local tmpData = {
		battle_type = xyd.BattleType.ENCOUNTER_STORY
	}

	tmpData.event_data = {
		battle_report = data.battle_result.battle_report,
		is_win = data.battle_result.is_win,
		items = data.items
	}

	self:startBattle(tmpData)
end

function BattleController:onTimeCloisterBattle(event)
	local data = xyd.decodeProtoBuf(event.data)
	local tmpData = {
		battle_type = xyd.BattleType.TIME_CLOISTER_BATTLE
	}
	local stage = data.stage_id
	local next_id = xyd.tables.timeCloisterBattleTable:getNext(stage)

	tmpData.event_data = {
		battle_report = data.battle_result.battle_report,
		is_win = data.battle_result.is_win,
		items = data.items
	}

	if next_id == -1 then
		tmpData.event_data.total_harm = data.battle_result.total_harm
		data.battle_result.battle_report.isWin = 1
	end

	local isSkipReport = xyd.db.misc:getValue("time_cloister_battle_skip_report")

	isSkipReport = isSkipReport or 0

	local isSkipReport = xyd.checkCondition(tonumber(isSkipReport) == 1, true, false)

	if not isSkipReport then
		self:startBattle(tmpData)
	else
		self:openBaseBattleResult(tmpData)
	end
end

function BattleController:onTimeCloisterExtra(event)
	local data = xyd.decodeProtoBuf(event.data)

	if not data.battle_result then
		return
	end

	dump(data, "onTimeCloisterExtraBttleBack")

	local tmpData = {
		battle_type = xyd.BattleType.TIME_CLOISTER_EXTRA
	}
	local items = {}
	local event_id = data.event_id

	if event_id and tonumber(event_id) > 0 then
		event_id = tonumber(event_id)

		local awards = xyd.tables.timeCloisterCardTable:getAwards(event_id)

		for i in pairs(awards) do
			table.insert(items, {
				item_id = awards[i][1],
				item_num = awards[i][2]
			})
		end
	end

	tmpData.event_data = {
		battle_report = data.battle_result.battle_report,
		is_win = data.battle_result.is_win,
		items = items
	}

	local isSkipReport = xyd.db.misc:getValue("Time_cloister_encounter_skip_report")

	isSkipReport = isSkipReport or 0

	local isSkipReport = xyd.checkCondition(tonumber(isSkipReport) == 1, true, false)

	if not isSkipReport then
		self:startBattle(tmpData)
	else
		self:openBaseBattleResult(tmpData)
	end
end

function BattleController:onBossFight(event)
	local data = event.data

	xyd.WindowManager.get():closeWindow("battle_formation_window")
	self:startBattle({
		event_data = data,
		battle_type = xyd.BattleType.WORLD_BOSS
	})
end

function BattleController:onBossNewFight(event)
	local data = xyd.decodeProtoBuf(event.data)

	xyd.WindowManager.get():closeWindow("battle_formation_window")

	if data.boss_info and data.boss_info.boss_id then
		xyd.models.activity:getActivity(xyd.ActivityID.MONTHLY_HIKE):updateBossInfo(data.boss_info)
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.MONTHLY_HIKE)

	if not data.battle_report or activityData.detail.isSweep then
		activityData.detail.isSweep = false

		local activityContent = xyd.WindowManager.get():getWindow("activity_window"):getCurContent()

		if activityContent:getActivityContentID() == xyd.ActivityID.MONTHLY_HIKE then
			activityContent:onSweepBoss(data)
		end
	else
		self:startBattle({
			event_data = data,
			battle_type = xyd.BattleType.WORLD_BOSS
		})
	end
end

function BattleController:startBattle(data)
	local canPlayPlot = true

	if not data then
		canPlayPlot = false
		data = self.battleData_
	else
		self.battleData_ = data
	end

	if data.event_data and data.event_data.battle_report and UNITY_EDITOR then
		local battle_report

		if type(data.event_data.battle_report.ListFields) ~= "nil" then
			battle_report = xyd.decodeProtoBuf(data.event_data.battle_report)
		elseif type(data.event_data.ListFields) == "nil" then
			battle_report = data.event_data.battle_report
		else
			battle_report = xyd.decodeProtoBuf(data.event_data).battle_report
		end

		battleReportDes:des(battle_report)
	end

	local wnd = xyd.WindowManager.get():getWindow("battle_loading_window")

	if not wnd then
		ResManager.ForceGCCollect()

		wnd = xyd.WindowManager.get():openWindow("battle_loading_window", {})
	end

	xyd.WindowManager.get():hideAllWindow({
		"battle_loading_window",
		"battle_window"
	})
	wnd:setBattleData(data)
end

function BattleController:playFirstStory(storyID)
	xyd.WindowManager.get():openWindow("story_window", {
		story_id = storyID,
		story_type = xyd.StoryType.MAIN,
		callback = function()
			xyd.BattleController.get():startBattle()
		end
	})
end

function BattleController:playThirdStory(stageId, data, battleType)
	local plotIds = {}
	local storyType = xyd.StoryType.MAIN
	local callback

	if battleType == xyd.BattleType.CAMPAIGN then
		local fort_id = StageTable:getFortID(stageId)

		if fort_id and fort_id > 10 then
			local timestamp = MiscTable:getNumber("new_story_lock_time", "value")

			if timestamp > xyd.getServerTime() then
				plotIds = nil
			else
				plotIds = MainPlotListTable:getPlotIDsByStageID(stageId)
			end
		else
			plotIds = MainPlotListTable:getPlotIDsByStageID(stageId)
		end
	elseif battleType == xyd.BattleType.HERO_CHALLENGE and xyd.models.heroChallenge:checkPlayStory(stageId) then
		plotIds = xyd.tables.partnerChallengeTable:plotId(stageId)
		storyType = xyd.StoryType.PARTNER
	elseif battleType == xyd.BattleType.HERO_CHALLENGE_CHESS and xyd.models.heroChallenge:checkPlayChessStory(stageId) then
		plotIds = xyd.tables.partnerChallengeChessTable:plotId(stageId)
		storyType = xyd.StoryType.PARTNER
	elseif battleType == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT then
		plotIds = xyd.tables.activityNewStoryTable:getPlotIds(stageId)
		storyType = xyd.StoryType.MAIN
	elseif battleType == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT2 then
		plotIds = xyd.tables.ativityThermStoryTable:getPlotIds(stageId)
		storyType = xyd.StoryType.ACTIVITY

		function callback()
			local win = xyd.WindowManager.get():getWindow("activity_window")
			local content = win:getCurContent()

			content:updateLayout()
		end
	end

	if (data.event_data and data.event_data.is_win and data.event_data.is_win == 1 or data.is_win and data.is_win == 1) and plotIds and plotIds[3] and plotIds[3] > 0 then
		XYDCo.WaitForTime(1, function()
			xyd.WindowManager.get():openWindow("story_window", {
				story_id = plotIds[3],
				story_type = storyType,
				callback = function()
					xyd.EventDispatcher:inner():dispatchEvent({
						name = xyd.event.BATTLE_END,
						data = data
					})

					if callback then
						callback()
					end
				end
			})
		end, nil)

		return
	else
		xyd.EventDispatcher:inner():dispatchEvent({
			name = xyd.event.BATTLE_END,
			data = data
		})
	end
end

function BattleController:onBattleEnd(event)
	local data = event.data
	local type_ = data.battle_type

	if type_ == xyd.BattleType.DUNGEON then
		self:onDungeonBattleResult(data)
	elseif type_ == xyd.BattleType.TOWER then
		self:onTowerBattleResult(data)
	elseif type_ == xyd.BattleType.TOWER_PRACTICE then
		self:onTowerPracticeResult(data)
	elseif type_ == xyd.BattleType.TRIAL then
		self:onTrialBattleResult(data)
	elseif type_ == xyd.BattleType.GUILD_BOSS then
		self:onGuildBossResult(data)
	elseif type_ == xyd.BattleType.ARENA_3v3 then
		self:onArena3v3BattleResult(data)
	elseif type_ == xyd.BattleType.ARENA_ALL_SERVER then
		self:onArenaAllServerBattleResult(data)
	elseif type_ == xyd.BattleType.ARENA_TEAM then
		self:onArenaTeamBattleResult(data)
	elseif type_ == xyd.BattleType.WORLD_BOSS then
		self:onWorldBossResult(data)
	elseif type_ == xyd.BattleType.GUILD_WAR then
		self:onGuildWarBattleResult(data)
	elseif type_ == xyd.BattleType.HERO_CHALLENGE then
		self:onHeroChallengeBattleResult(data)
	elseif type_ == xyd.BattleType.HERO_CHALLENGE_CHESS then
		self:onHeroChallengeChessBattleResult(data)
	elseif type_ == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT then
		self:onLibraryWatcherStageBattleResult(data)
	elseif type_ == xyd.BattleType.PARTNER_STATION then
		self:onPartnerStationBattleResult(data)
	elseif type_ == xyd.BattleType.SPORTS_SHOW then
		self:onSportsShowBattleResult(data)
	elseif type_ == xyd.BattleType.SPORTS_PVP then
		self:onSportsBattleResult(data)
	elseif type_ == xyd.BattleType.EXPLORE_OLD_CAMPUS then
		self:onOldBuildingBattleResult(data)
	elseif type_ == xyd.BattleType.FAIR_ARENA then
		self:onFairArenaBattleResult(data)
	elseif type_ == xyd.BattleType.BEACH_ISLAND then
		self:onBeachIslandResult(data)
	elseif type_ == xyd.BattleType.ENCOUNTER_STORY then
		self:onEncounterResult(data)
	elseif type_ == xyd.BattleType.SHRINE_HURDLE then
		self:onShrineHurdleBalleResult(data)
	elseif type_ == xyd.BattleType.ACTIVITY_SPFARM then
		self:onSpfarmBattleResult(data)
	elseif type_ == xyd.BattleType.GUILD_NEW_WAR then
		self:onGuildNewWarFightResult(data)
	else
		self:normalBattleResult(data)
	end

	if type_ ~= xyd.BattleType.SKIN_PLAY then
		xyd.WindowManager.get():resumeHideAllWindow()
	end
end

function BattleController:normalBattleResult(data)
	local callback
	local isWin = data.event_data.battle_report.isWin

	if data.battle_type == xyd.BattleType.CAMPAIGN then
		function callback(isOpen)
			if not xyd.Global.isInStart and isOpen and not xyd.WindowManager.get():isOpen("campaign_window") then
				xyd.WindowManager.get():openWindow("campaign_window", {
					noDelay = true,
					is_win = isWin
				})
			end

			if isWin ~= 1 then
				local win = xyd.WindowManager.get():getWindow("main_window")

				if win then
					win:updateStoryDialogData(data.event_data.stage_id, nil, 1)
				end
			end

			local stage_id = data.event_data.stage_id
			local stageFlag = false
			local checkStages = xyd.tables.miscTable:split2Cost("new_pingfen_stage_id", "value", "|")

			for k = 1, #checkStages do
				if tonumber(checkStages[k]) == tonumber(stage_id) then
					stageFlag = true
				end
			end

			if isWin == 1 and stageFlag then
				local evaluate_have_closed = xyd.db.misc:getValue("evaluate_have_closed") or false
				local lastTime = xyd.db.misc:getValue("evaluate_last_time") or 0

				if not evaluate_have_closed and lastTime and xyd.getServerTime() - lastTime > 3 * xyd.DAY_TIME then
					local win = xyd.getWindow("main_window")

					win:setHasEvaluateWindow(true, xyd.EvaluateFromType.CAMPAIGN)
				end
			end
		end
	elseif data.battle_type == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT2 and isWin then
		function callback()
			local win = xyd.WindowManager.get():getWindow("activity_window")
			local content = win:getCurContent()

			content:updateLayout()
		end
	end

	self:openBaseBattleResult(data, callback)
end

function BattleController:openBaseBattleResult(data, callback, onOpenCallback)
	if xyd.Global.playReport then
		xyd.Global.playReport = false
	end

	dump(data)

	local battleParams = data.event_data
	local isRecord = data.isRecord or false
	local recordID = data.record_id or -1
	local report = battleParams.battle_report

	report = report or data.battle_report
	onOpenCallback = onOpenCallback or data.onOpenCallback

	local isWin = report.isWin

	if data.battle_type == xyd.BattleType.GUILD_BOSS then
		isWin = battleParams.is_win
	elseif data.battle_type == xyd.BattleType.WORLD_BOSS then
		isWin = battleParams.is_win
	elseif data.battle_type == xyd.BattleType.ARENA or data.battle_type == xyd.BattleType.ARENA_3v3 or data.battle_type == xyd.BattleType.ARENA_TEAM or data.battle_type == xyd.BattleType.ARENA_ALL_SERVER then
		isWin = battleParams.battle_report_backend.isWin
	elseif data.battle_type == xyd.BattleType.SHRINE_HURDLE and (xyd.models.shrineHurdleModel:checkIsBoss() and xyd.models.shrineHurdleModel:checkIsBoss() > 0 or data.isBoss) then
		isWin = 1
	elseif data.battle_type == xyd.BattleType.SHRINE_HURDLE then
		isWin = battleParams.is_win
	elseif data.battle_type == xyd.BattleType.GUILD_NEW_WAR and data.is_last and battleParams.battle_report.info.battle_id then
		local battleID = battleParams.battle_report.info.battle_id
		local activityData = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR)
		local info = activityData:getShowInfoByBattleID(battleID)
		local winTime = info.winTime or 0
		local lostTime = info.lostTime or 0

		isWin = lostTime < winTime and 1 or 0
	end

	local showMVP = xyd.db.misc:getValue("abbr_setting_up_battle_result")
	local abbr = false

	if not showMVP or tonumber(showMVP) == 1 then
		abbr = true
	end

	local isNew = false

	if xyd.arrayIndexOf(newVerTypeList, data.battle_type) > 0 then
		isNew = true
	end

	if isWin == 1 then
		local name = "battle_win_window"

		if isNew and abbr then
			name = "battle_win_v2_window"
		end

		xyd.WindowManager.get():openWindow(name, {
			battleParams = battleParams,
			listener = callback,
			onOpenCallback = onOpenCallback,
			map_type = data.map_type,
			battle_type = data.battle_type,
			is_last = data.is_last,
			stage_id = data.stage_id,
			is_new = isNew and abbr,
			real_battle_report = data.real_battle_report,
			isRecord = isRecord,
			record_id = recordID
		})
	else
		local name = "battle_fail_window"

		if isNew and abbr then
			name = "battle_fail_v2_window"
		end

		xyd.WindowManager.get():openWindow(name, {
			battleParams = battleParams,
			listener = callback,
			onOpenCallback = onOpenCallback,
			map_type = data.map_type,
			battle_type = data.battle_type,
			is_last = data.is_last,
			stage_id = data.stage_id,
			is_new = isNew and abbr,
			real_battle_report = data.real_battle_report,
			isRecord = isRecord,
			record_id = recordID
		})
	end
end

function BattleController:onGuildWarBattleResult(data)
	data.map_type = xyd.MapType.GUILD_WAR
	data.battle_type = xyd.BattleType.GUILD_WAR

	self:openBaseBattleResult(data)
end

function BattleController:onArenaBattleResult(data)
	data.battle_type = xyd.BattleType.ARENA

	self:openBaseBattleResult(data, nil, function()
		if data.isReport then
			return
		end

		local win = xyd.WindowManager.get():getWindow("arena_window")
		local winTop

		if win then
			winTop = win:getWindowTop()
		end

		if data.event_data.is_win == 1 then
			xyd.models.background:addBackgroundCount(xyd.ParticularBackground.DaoChang)
		end

		if self:checkShowOverCardWindow(xyd.BattleType.ARENA) then
			xyd.WindowManager.get():openWindow("arena_battle_award_window", {
				items = data.event_data.items,
				index = data.event_data.index,
				delayedTop = winTop,
				isCheckShowType = xyd.BattleType.ARENA
			})
		else
			xyd.models.itemFloatModel:pushNewItems({
				data.event_data.items[data.event_data.index]
			})
		end

		if data.event_data.is_win == 1 then
			local evaluate_have_closed = xyd.db.misc:getValue("evaluate_have_closed") or false
			local lastTime = xyd.db.misc:getValue("evaluate_last_time") or 0

			if not evaluate_have_closed and lastTime and xyd.getServerTime() - lastTime > 3 * xyd.DAY_TIME then
				local win = xyd.getWindow("main_window")

				win:setHasEvaluateWindow(true, xyd.EvaluateFromType.ARENA)
			end
		end
	end)
end

function BattleController:onDungeonBattleResult(data)
	data.map_type = xyd.MapType.DUNGEON
	data.battle_type = xyd.BattleType.DUNGEON

	self:openBaseBattleResult(data, function()
		local wnd = xyd.WindowManager.get():getWindow("dungeon_window")

		if wnd then
			wnd:playBattleResult(data.event_data)
		end
	end)
end

function BattleController:onTowerBattleResult(data)
	if xyd.models.towerMap:isSkipReport(xyd.BattleType.TOWER) then
		local win = xyd.getWindow("tower_window")

		if win then
			win:onTowerUpdate(data)
		end
	end

	data.map_type = xyd.MapType.TOWER
	data.battle_type = xyd.BattleType.TOWER

	self:openBaseBattleResult(data, function(isOpen)
		if isOpen and not xyd.WindowManager.get():isOpen("tower_window") then
			local wnd = xyd.WindowManager.get():getWindow("tower_window")

			if data.isRecord then
				xyd.WindowManager.get():openWindow("tower_window")
			else
				xyd.WindowManager.get():openWindow("tower_window", {
					isWin = data.event_data.battle_report.isWin
				})
			end
		end
	end)
end

function BattleController:onBeachIslandResult(data)
	data.battle_type = xyd.BattleType.BEACH_ISLAND

	self:openBaseBattleResult(data, function()
		xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_BEACH_SUMMER)
	end)
end

function BattleController:onEncounterResult(data)
	data.battle_type = xyd.BattleType.ENCOUNTER_STORY

	self:openBaseBattleResult(data, function()
		xyd.models.activity:reqActivityByID(xyd.ActivityID.ENCONTER_STORY)
	end)
end

function BattleController:onTowerPracticeResult(data)
	data.map_type = xyd.MapType.TOWER
	data.battle_type = xyd.BattleType.TOWER_PRACTICE

	self:openBaseBattleResult(data, function(isOpen)
		if isOpen and not xyd.WindowManager.get():isOpen("tower_window") then
			local wnd = xyd.WindowManager.get():getWindow("tower_window")

			xyd.WindowManager.get():openWindow("tower_window")
		end
	end)
end

function BattleController:onTrialBattleResult(data)
	data.map_type = xyd.MapType.TRIAL
	data.battle_type = xyd.BattleType.TRIAL

	local function openCallback()
		local params = {
			info = data.event_data.info
		}

		xyd.WindowManager.get():openWindow("activity_new_trial_fight_award_window", params)
	end

	if data.event_data.info.buff_rewards and #data.event_data.info.buff_rewards <= 0 then
		openCallback = nil
		self.newTrialInfo = data.event_data.info
	end

	if data.isReport then
		openCallback = nil
	end

	self:openBaseBattleResult(data, function()
		local isWin = data.event_data.battle_report.isWin

		if isWin and isWin == 0 and self.newTrialInfo.current_stage ~= 1 then
			if self.newTrialInfo then
				xyd.models.trial:updateData(self.newTrialInfo)
			end

			return
		end

		local wnd = xyd.WindowManager.get():getWindow("trial_window")

		if wnd then
			wnd:onNextPoint({
				data = self.newTrialInfo
			})
		end
	end, openCallback)
end

function BattleController:onArenaTeamBattleResult(data)
	data.map_type = xyd.MapType.ARENA_TEAM
	data.battle_type = xyd.BattleType.ARENA_TEAM

	if data.isReport then
		self:openBaseBattleResult(data)
	else
		self:openBaseBattleResult(data, function()
			local arenaTeam = xyd.models.arenaTeam
			local data = arenaTeam:getTmpReports()
			local battleData = {
				is_win = data.is_win,
				enemy_info = data.enemy_info,
				self_info = data.self_info,
				items = data.items,
				index = data.index,
				record_id = data.record_id,
				self_change = data.self_change,
				enemy_change = data.enemy_change,
				battle_reports = data.battle_reports
			}

			battleData.battle_report = arenaTeam:getNextReport()
			battleData.is_last = arenaTeam:isLastReport()

			if battleData.battle_report then
				xyd.WindowManager.get():closeWindow("battle_window")
				self:ArenaTeamSingleBattle(battleData)
			else
				xyd.WindowManager.get():openWindow("arena_3v3_result_window", {
					battleParams = battleData,
					battle_type = xyd.BattleType.ARENA_TEAM
				})
				arenaTeam:resetTmpReports()
			end
		end)
	end
end

function BattleController:onArena3v3BattleResult(data)
	data.map_type = xyd.MapType.ARENA_3v3
	data.battle_type = xyd.BattleType.ARENA_3v3

	if data.isReport then
		self:openBaseBattleResult(data)
	else
		self:openBaseBattleResult(data, function()
			local arena3v3 = xyd.models.arena3v3
			local tmpReports = arena3v3:getTmpReports()
			local battleData = {
				self_change = tmpReports.self_change,
				enemy_change = tmpReports.enemy_change,
				index = tmpReports.index,
				items = tmpReports.items,
				is_win = tmpReports.is_win,
				rank = tmpReports.rank,
				score = tmpReports.score,
				enemy_info = tmpReports.enemy_info,
				battle_reports = tmpReports.battle_reports,
				self_info = tmpReports.self_info,
				record_ids = tmpReports.record_ids
			}

			battleData.battle_report = arena3v3:getNextReport()
			battleData.is_last = arena3v3:isLastReport()
			battleData.record_id = arena3v3:getRecordId()

			if battleData.battle_report then
				xyd.WindowManager.get():closeWindow("battle_window")
				self:Arena3v3SingleBattle(battleData)
			else
				self:Arena3v3BattleSkip(battleData.record_id, battleData)
				arena3v3:resetTmpReports()
			end
		end)
	end
end

function BattleController:onArenaAllServerBattleResult(data)
	data.map_type = xyd.MapType.ARENA_3v3
	data.battle_type = xyd.BattleType.ARENA_ALL_SERVER

	if data.isReport then
		self:openBaseBattleResult(data)
	else
		self:openBaseBattleResult(data, function()
			local arenaAs = xyd.models.arenaAllServerScore
			local tmpReports = arenaAs:getTmpReports()
			local battleData = {
				self_change = tmpReports.self_change,
				enemy_change = tmpReports.enemy_change,
				index = tmpReports.index,
				items = tmpReports.items,
				is_win = tmpReports.is_win,
				rank = tmpReports.rank,
				score = tmpReports.score,
				enemy_info = tmpReports.enemy_info,
				battle_reports = tmpReports.battle_reports,
				self_info = tmpReports.self_info,
				record_ids = tmpReports.record_ids
			}

			battleData.battle_report = arenaAs:getNextReport()
			battleData.is_last = arenaAs:isLastReport()
			battleData.record_id = arenaAs:getRecordId()

			if battleData.battle_report then
				xyd.WindowManager.get():closeWindow("battle_window")
				self:ArenaAllServerSingleBattle(battleData)
			else
				xyd.WindowManager.get():openWindow("arena_3v3_result_window", {
					battleParams = battleData,
					battle_type = xyd.BattleType.ARENA_ALL_SERVER,
					onOpenCallback = function()
						local win = xyd.WindowManager.get():getWindow("arena_all_server_window")
						local winTop

						if win then
							win:updateScorePartInfo()

							winTop = win:getWindowTop()
						end

						if self:checkShowOverCardWindow(xyd.BattleType.ARENA_ALL_SERVER) then
							xyd.WindowManager.get():openWindow("arena_battle_award_window", {
								items = data.event_data.items,
								index = data.event_data.index,
								delayedTop = winTop,
								isCheckShowType = xyd.BattleType.ARENA_ALL_SERVER
							})
						else
							xyd.models.itemFloatModel:pushNewItems({
								data.event_data.items[data.event_data.index]
							})
						end
					end
				})
				arenaAs:resetTmpReports()
			end
		end)
	end
end

function BattleController:onGuildBossResult(data)
	data.map_type = xyd.MapType.GUILD_BOSS
	data.battle_type = xyd.BattleType.GUILD_BOSS

	local guildModel = xyd.models.guild

	self:openBaseBattleResult(data, function()
		guildModel:updateBossInfo(data)

		local gymWnd = xyd.WindowManager.get():getWindow("guild_gym_window")

		if not gymWnd then
			xyd.WindowManager.get():openWindow("guild_gym_window")
		end

		if guildModel.bossID <= xyd.tables.guildBossTable:getMaxID() then
			if guildModel.bossID == xyd.GUILD_FINAL_BOSS_ID then
				local bossWnd = xyd.WindowManager.get():getWindow("guild_final_boss_window")

				if not bossWnd then
					xyd.WindowManager.get():openWindow("guild_final_boss_window", {
						bossId = guildModel.bossID
					})
				end
			else
				local bossWnd = xyd.WindowManager.get():getWindow("guild_boss_window")

				if not bossWnd then
					xyd.WindowManager.get():openWindow("guild_boss_window", {
						bossId = guildModel.bossID
					})
				end
			end
		end
	end)
end

function BattleController:onWorldBossResult(data)
	data.battle_type = xyd.BattleType.WORLD_BOSS

	if data.event_data.boss_info and data.event_data.boss_info.boss_type and tonumber(data.event_data.boss_info.boss_type) > 0 then
		self:openBaseBattleResult(data, function()
			data = data.event_data

			if data == nil or data.boss_info == nil then
				return
			end

			local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_WORLD_BOSS)
			local type = data.boss_info.boss_type

			if data.is_win and data.is_win == 1 then
				local cur_id = activityData.detail.boss_infos[type].boss_id

				activityData.detail.boss_infos[type].boss_id = xyd.tables.activityBossTable:getNext(cur_id)

				activityData:setDataNodecode(activityData)
			end

			local info = data.boss_info

			if activityData.detail then
				activityData.detail.boss_infos[type].enemies = info.enemies

				activityData:setDataNodecode(activityData)
			else
				activityData:reqActivityList()
			end

			local bossID = info.boss_id or 0
			local win = xyd.WindowManager.get():getWindow("activity_world_boss_window")

			if bossID > 0 and win then
				win:updateStatus()
			end

			if data.is_win == 1 then
				xyd.showToast(__("WORLD_BOSS_KILL"))

				if win then
					xyd.WindowManager.get():closeWindow("activity_world_boss_window")
				end
			end
		end)
	else
		self:openBaseBattleResult(data, function()
			if data.event_data.is_fake then
				return
			end

			if data.event_data.is_win == 1 then
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.MONTHLY_HIKE)
				local curID = activityData.detail.cur_stage_id

				if curID > 0 then
					xyd.showToast(__("WORLD_BOSS_KILL"))

					activityData.detail.cur_stage_id = xyd.tables.activityMonthlyStageTable:getNextID(curID)
					activityData.detail.skill_point = activityData.detail.skill_point + xyd.tables.activityMonthlyStageTable:getSkillPoint(curID)

					local activityContent = xyd.WindowManager.get():getWindow("activity_window"):getCurContent()

					if activityContent:getActivityContentID() == xyd.ActivityID.MONTHLY_HIKE then
						activityContent:onNextStage()
					end
				end
			end
		end)
	end
end

function BattleController:onHeroChallengeBattleResult(data)
	data.battle_type = xyd.BattleType.HERO_CHALLENGE

	local fortID = 0
	local eventData = data.event_data

	if eventData and eventData.fort_info then
		fortID = eventData.fort_info.base_info.fort_id
	end

	if data.decCoin and data.decCoin == 0 then
		fortID = 0
	end

	local function openCallback()
		xyd.WindowManager.get():openWindow("hero_challenge_fight_award_window")
	end

	local rewards = xyd.models.heroChallenge:getRewards(fortID)

	if not rewards then
		openCallback = nil
	end

	self:openBaseBattleResult(data, nil, openCallback)
end

function BattleController:onHeroChallengeChessBattleResult(data)
	data.battle_type = xyd.BattleType.HERO_CHALLENGE_CHESS

	local fortID = 0

	if data.event_data and data.event_data.fort_info then
		fortID = data.event_data.fort_info.base_info.fort_id
	end

	if data.decCoin and data.decCoin == 0 then
		fortID = 0
	end

	local function openCallback()
		local curAward = xyd.models.heroChallenge:getAwardItemInfo()

		if tonumber(curAward.num) > 0 then
			local item = {
				item_num = tonumber(curAward.num),
				item_id = xyd.ItemID.HERO_CHALLENGE_CHESS
			}
			local isWin = data.event_data.is_win

			if isWin == 0 then
				local hp = xyd.models.heroChallenge:getFailhp(fortID)
				local message = __("CHESS_FAIL_COST") .. hp

				item.item_num = xyd.tables.miscTable:getVal("partner_challenge_chess_award2")

				xyd.alertItems({
					item
				})
				xyd.alertTips(message)
			else
				xyd.alertItems({
					item
				})
			end
		end
	end

	local rewards = xyd.models.heroChallenge:getRewards(fortID)

	if not rewards then
		openCallback = nil
	end

	self:openBaseBattleResult(data, nil, openCallback)
end

function BattleController:onLibraryWatcherStageBattleResult(data)
	data.battle_type = xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT

	self:openBaseBattleResult(data, function()
		local win = xyd.WindowManager.get():getWindow("activity_window")
		local content = win:getCurContent()

		content:updateLayout()
	end)
end

function BattleController:onPartnerStationBattleResult(data)
	data.battle_type = xyd.BattleType.PARTNER_STATION

	self:openBaseBattleResult(data, function()
		local wndName = {
			"partner_data_station_window",
			"partner_station_battle_formation_window",
			"guide_detail_window"
		}

		for _, name in ipairs(wndName) do
			local wnd = xyd.WindowManager.get():getWindow(name)

			if wnd then
				wnd:show()
			end
		end
	end)
end

function BattleController:onError(event)
	local mid = event.data.error_mid
	local code = event.data.error_code

	if mid and self:checkIsBattle(mid) then
		xyd.WindowManager.get():closeWindow("battle_loading_window")

		local tips = "BATTLE_ERROR"

		if code == xyd.ErrorCode.ARENA_NO_TEAM then
			tips = "ARENA_NO_TEAM"
		end

		if code == xyd.ErrorCode.BOSS_NO_EXIST or code == xyd.ErrorCode.REVENGE_CD then
			tips = xyd.tables.errorInfoTextTable:getText(code)
		end

		if code == xyd.ErrorCode.GUILD_COMPETITION_NO_TIMES then
			tips = xyd.tables.errorInfoTextTable:getText(code)

			xyd.models.guild:getGuildCompetitionServerData()
		end

		if mid == xyd.mid.GUILD_NEW_WAR_FIGHT then
			local activityData = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR)

			activityData.leftFightTime = nil

			local wnd = xyd.getWindow("guild_new_war_record_window")

			if wnd then
				wnd:cancelMask()
			end
		end

		xyd.alert(xyd.AlertType.TIPS, __(tips))

		xyd.Global.playReport = false
	end
end

function BattleController:resourceLoadError()
	xyd.WindowManager.get():closeWindow("battle_loading_window")
	xyd.alert(xyd.AlertType.TIPS, __("BATTLE_LOAD_ERROR"))

	xyd.Global.playReport = false

	xyd.WindowManager.get():resumeHideAllWindow()
end

function BattleController:checkIsBattle(mid)
	if battleMID[mid] and battleMID[mid] > 0 then
		return true
	end

	return false
end

function BattleController:createBattleReport(stageID)
	local battleId = xyd.tables.newPartnerWarmUpStageTable:getBattleID(stageID)
	local initPartners = xyd.tables.newPartnerWarmUpStageTable:getInitPartner(stageID)
	local herosA = {}
	local herosB = {}
	local str = xyd.tables.battleTable:getMonsters(battleId)
	local pos = xyd.tables.battleTable:getStands(battleId)
	local posA = xyd.tables.newPartnerWarmUpStageTable:getPoses(stageID)

	for i = 1, #str do
		local hero = ReportHero.new()

		hero:populateWithTableID(str[i], {
			pos = pos[i]
		})
		table.insert(herosB, hero)
	end

	for i = 1, #initPartners do
		local hero = ReportHero.new()

		hero:populateWithTableID(initPartners[i], {
			pos = posA[i]
		})
		table.insert(herosA, hero)
	end

	local random_seeds = xyd.split(xyd.tables.miscTable:getVal("partner_warmup_random_seed"), "|", true)
	local random_seed = random_seeds[math.floor(math.random() * #random_seeds) + 1]
	local params = {
		battle_type = xyd.BattleType.NEW_PARTNER_WARMUP,
		herosA = herosA,
		herosB = herosB,
		guildSkillsA = xyd.models.guild:getGuildSkills(),
		guildSkillsB = {},
		battleID = battleId,
		random_seed = random_seed
	}
	local reporter = BattleCreateReport.new(params)

	reporter:run()

	local result = {}

	result.battle_report = reporter:getReport()
	result.stage_id = stageID

	return result
end

function BattleController:frontBattleBy2BattleId(battleId1, battleId2, battleType, isWin)
	local monsterA = xyd.tables.battleTable:getMonsters(battleId1)
	local standsA = xyd.tables.battleTable:getStands(battleId1)
	local herosA = self:createHeros(monsterA, standsA)
	local monsterB = xyd.tables.battleTable:getMonsters(battleId2)
	local standsB = xyd.tables.battleTable:getStands(battleId2)
	local herosB = self:createHeros(monsterB, standsB)
	local params = {
		random_seed = 0,
		battle_type = battleType,
		herosA = herosA,
		herosB = herosB,
		battleID = battleId1
	}
	local reporter = BattleCreateReport.new(params)

	reporter:run()

	local report = reporter:getReport()

	report.isWin = isWin

	local battleParams = {
		battle_report = report
	}

	self:startBattle({
		event_data = battleParams,
		battle_type = battleType
	})
end

function BattleController:createHeros(monsters, stands)
	local heros = {}

	for i = 1, #monsters do
		local hero = ReportHero.new()

		hero:populateWithTableID(monsters[i], {
			pos = stands[i]
		})
		table.insert(heros, hero)
	end

	return heros
end

function BattleController:createReport(data, has_random)
	local herosA = {}
	local herosB = {}

	for i = 1, #data.teamA do
		local hero = ReportHero.new()

		if data.teamA[i].isMonster then
			hero:populateWithTableID(data.teamA[i].table_id, data.teamA[i])
		else
			hero:populate(data.teamA[i])
		end

		table.insert(herosA, hero)
	end

	for i = 1, #data.teamB do
		local hero = ReportHero.new()

		if data.teamB[i].isMonster then
			hero:populateWithTableID(data.teamB[i].table_id, data.teamB[i])
		else
			hero:populate(data.teamB[i])
		end

		table.insert(herosB, hero)
	end

	local petA, petB

	if data.petA and tostring(data.petA) ~= "" and data.petA.pet_id ~= nil then
		local pet = ReportPet.new()

		pet:populate(data.petA)

		petA = pet
	end

	if data.petB and tostring(data.petB) ~= "" and data.petB.pet_id ~= nil then
		local pet = ReportPet.new()

		pet:populate(data.petB)

		petB = pet
	end

	local params = {
		battle_type = data.battle_type,
		herosA = herosA,
		herosB = herosB,
		petA = petA,
		petB = petB,
		guildSkillsA = data.guildSkillsA,
		guildSkillsB = data.guildSkillsB or {},
		god_skills = data.god_skills or {},
		battleID = data.info.battle_id,
		random_seed = data.random_seed,
		has_random = has_random,
		dressAttrsA = data.dressAttrsA,
		dressAttrsB = data.dressAttrsB,
		chimeBonusA = data.chimeBonusA,
		chimeBonusB = data.chimeBonusB,
		shrineId = data.shrineId,
		galaxy_info = data.galaxy_info,
		skinBonusA = data.skinBonusA,
		skinBonusB = data.skinBonusB,
		insertPosSkills = data.insertPosSkills
	}
	local reporter = BattleCreateReport.new(params)

	reporter:run()

	local report = reporter:getReport()

	return report
end

function BattleController:onActivityFight(event)
	if event.data.activity_id == xyd.ActivityID.ENTRANCE_TEST then
		local data = event.data
		local detaildata, detail

		if event.data.isReview then
			detaildata = event.data.detail
			detail = detaildata
		else
			detaildata = xyd.decodeProtoBuf(event.data).detail
			detail = cjson.decode(detaildata)
		end

		local activitydata = xyd.models.activity:getActivity(xyd.ActivityID.ENTRANCE_TEST)
		local hasParner = false
		local isWin = detail.battle_report.isWin
		local rank = activitydata:getLevel()

		xyd.WindowManager.get():closeWindow("activity_entrance_test_pve_window")

		local testWin = xyd.WindowManager.get():getWindow("activity_entrance_test_window")

		if testWin then
			testWin:battleBack(detail)
		end

		if event.data.isReview then
			-- block empty
		else
			local isFirstPass = false
			local isShowNewHarm = false

			if not detail.is_fake then
				if not activitydata:getPvePartnerIsLock(detail.boss_id) and detail.total_harm > activitydata:getMyHightHarm(detail.boss_id) then
					isShowNewHarm = true
				end

				activitydata:subFreeTimes()

				isFirstPass = activitydata:addBossHarm(detail.boss_id, detail.total_harm)

				activitydata:setUpdateRankState(detail.boss_id, true)
			end

			print("detail.total_harm:", detail.total_harm)

			detail.is_win = 1
			detail.battle_report.isWin = 1
			detail.isFirstPass = isFirstPass
			detail.isShowNewHarm = isShowNewHarm
			detail.boss_id = detail.boss_id
		end

		if detail.battle_report then
			detail.battle_type = xyd.BattleType.ENTRANCE_TEST

			local isSkipReport = xyd.checkCondition(tonumber(xyd.db.misc:getValue("entrance_test_skip_pve_report")) == 1, true, false)

			if event.data.isReview then
				isSkipReport = false
			end

			if not isSkipReport then
				self:startBattle({
					event_data = detail,
					battle_type = xyd.BattleType.ENTRANCE_TEST,
					battle_report = detail.battle_report
				})
			else
				self:openBaseBattleResult({
					event_data = detail,
					battle_type = xyd.BattleType.ENTRANCE_TEST,
					battle_report = detail.battle_report
				})
			end
		end

		return
	end

	if event.data.activity_id == xyd.ActivityID.ICE_SECRET_BOSS_CHALLENGE then
		local detaildata = xyd.decodeProtoBuf(event.data).detail
		local detail = require("cjson").decode(detaildata).battle_result

		if detail.battle_report then
			detail.battle_report.isWin = 1

			local items = {}
			local item
			local damage = detail.total_harm
			local ids = xyd.tables.activityIceSecretBossRewardTable:getIds()

			for i = 1, #ids do
				if damage >= xyd.tables.activityIceSecretBossRewardTable:getDamage(ids[i]) then
					item = xyd.tables.activityIceSecretBossRewardTable:getReward(ids[i])
				else
					break
				end
			end

			if not item then
				detail.battle_report.isWin = 0
			end

			table.insert(items, item)

			detail.battle_report.items = items
			detail.battle_type = xyd.BattleType.ICE_SECRET_BOSS

			self:startBattle({
				event_data = detail,
				battle_type = xyd.BattleType.ICE_SECRET_BOSS,
				battle_report = detail.battle_report
			})
		end

		return
	end

	if event.data.activity_id == xyd.ActivityID.LIMIT_CALL_BOSS then
		local detaildata = xyd.decodeProtoBuf(event.data).detail
		local detail = require("cjson").decode(detaildata).battle_result

		if detail.battle_report then
			detail.battle_report.isWin = 1

			local items
			local damage = detail.total_harm
			local awardTable = xyd.tables.activityLimitBossAwardTable
			local ids = awardTable:getIds()

			for i = 1, #ids do
				if damage >= awardTable:getDamage(ids[i]) then
					items = awardTable:getReward(ids[i])
				else
					break
				end
			end

			if not items then
				detail.battle_report.isWin = 0
			end

			detail.battle_report.items = items
			detail.battle_type = xyd.BattleType.LIMIT_CALL_BOSS

			self:startBattle({
				event_data = detail,
				battle_type = xyd.BattleType.LIMIT_CALL_BOSS,
				battle_report = detail.battle_report
			})
		end

		return
	end
end

function BattleController:onSportsBattleResult(data)
	data.map_type = xyd.MapType.SPORTS_PVP
	data.battle_type = xyd.BattleType.SPORTS_PVP

	self:openBaseBattleResult(data, function()
		if not data.is_win then
			return
		end
	end)
end

function BattleController:onOldBuildingBattleResult(data)
	data.battle_type = xyd.BattleType.EXPLORE_OLD_CAMPUS

	self:openBaseBattleResult(data)
end

function BattleController:checkShowOverCardWindow(id)
	if not self.isNeedControllerOverCard[id] then
		return true
	else
		local localTime = xyd.db.misc:getValue(self.isNeedControllerOverCard[id])

		if not localTime then
			return true
		elseif xyd.isSameDay(tonumber(localTime), xyd.getServerTime()) then
			return false
		else
			return true
		end
	end
end

function BattleController:getIsNeedControllerOverCardArr()
	return self.isNeedControllerOverCard
end

function BattleController:onShrineHurdleBattle(event, isReport, notDcode)
	if isReport == nil then
		isReport = false
	end

	local data

	if not notDcode then
		data = xyd.decodeProtoBuf(event.data)
	else
		data = {
			battle_result = event
		}
	end

	local tmpData = {
		event_data = data.battle_result,
		battle_type = xyd.BattleType.SHRINE_HURDLE
	}
	local battleReport = data.battle_result.battle_report
	local needCreateReport = battleReport and battleReport.random_seed and battleReport.random_seed > 0
	local isBoss = xyd.models.shrineHurdleModel:checkIsBoss()

	if xyd.models.shrineHurdleModel:isSkipReport() and not isReport then
		needCreateReport = false
	end

	if needCreateReport and not isReport or isBoss and isBoss > 0 then
		if not xyd.checkReportVer(data.battle_result.battle_report) then
			xyd.closeWindow("battle_loading_window")

			return
		end

		tmpData.event_data.isBoss = xyd.checkCondition(isBoss and isBoss > 0, true, false)

		local report = xyd.BattleController.get():createReport(data.battle_result.battle_report)

		tmpData.event_data.battle_report = report

		if self:diffReport(battleReport, report, data.record_id) then
			tmpData.diffReport = true
			tmpData.isReport = isReport

			xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
				xyd.closeWindow("battle_loading_window")
				xyd.WindowManager.get():closeWindow("arena_choose_player_window")
				xyd.WindowManager.get():closeWindow("arena_record_window")
			end))

			return
		end
	end

	tmpData.event_data.score = data.score or 0
	tmpData.event_data.gold = data.gold or 0

	if not xyd.models.shrineHurdleModel:isSkipReport() or isReport or xyd.models.shrineHurdleModel:checkIsBoss() then
		self:startBattle(tmpData)
	else
		self:onShrineHurdleBalleResult(tmpData)
	end
end

function BattleController:onShrineHurdleReport(data, isBoss)
	local tmpData = {
		isRecord = true,
		event_data = data,
		battle_type = xyd.BattleType.SHRINE_HURDLE,
		isBoss = isBoss
	}

	tmpData.event_data.isRecord = true

	local battleReport = data.battle_report
	local needCreateReport = battleReport and battleReport.random_seed and battleReport.random_seed > 0

	if not xyd.checkReportVer(data.battle_report) then
		xyd.closeWindow("battle_loading_window")

		return
	elseif needCreateReport then
		tmpData.event_data.isBoss = isBoss

		local battleReport = data.battle_report
		local report = xyd.BattleController.get():createReport(data.battle_report)

		tmpData.event_data.battle_report = report

		if self:diffReport(battleReport, report, data.record_id) then
			tmpData.diffReport = true
			tmpData.isReport = true

			xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
				xyd.closeWindow("battle_loading_window")
				xyd.WindowManager.get():closeWindow("arena_choose_player_window")
				xyd.WindowManager.get():closeWindow("arena_record_window")
			end))

			return
		end
	end

	self:startBattle(tmpData)
end

function BattleController:onShrineHurdleBalleResult(data)
	data.battle_type = xyd.BattleType.SHRINE_HURDLE

	local isReport = data.isRecord
	local isBoss = data.isBoss or xyd.models.shrineHurdleModel:checkIsBoss()
	local reportBoss = data.isBoss

	if tonumber(isBoss) and isBoss > 0 or isBoss or reportBoss then
		self:openBaseBattleResult(data, function()
			if not isReport then
				xyd.WindowManager.get():openWindow("shrine_hurdle_info_window", {
					type = 1
				})
			end

			local win = xyd.WindowManager.get():getWindow("shrine_hurdle_window")

			if win and not isReport and data.event_data.battle_report.isWin == 1 then
				win:showPartnerDead()
			end
		end)
	else
		local autoData = xyd.models.shrineHurdleModel:getAutoInfo()

		self:openBaseBattleResult(data, function()
			local win = xyd.WindowManager.get():getWindow("shrine_hurdle_window")

			if win and not isReport then
				if data.event_data.battle_report.isWin == 1 then
					win:showPartnerDead()
				end

				if autoData and tonumber(autoData.is_auto) == 1 then
					win:autoNext(1)
				end

				xyd.models.shrineHurdleModel:setFlag(nil, 4)

				local guideIndex = xyd.models.shrineHurdleModel:checkInGuide()

				if guideIndex then
					win:onGuideUpdate(false)
				end
			end
		end)
	end
end

function BattleController:onSpfarmBattle(battle_result)
	local battleReport = battle_result.save_data

	if battleReport and battleReport.random_seed and tonumber(battleReport.random_seed) > 0 then
		local report = xyd.BattleController.get():createReport(battleReport)

		battle_result.battle_report = report
	end

	self:startBattle({
		event_data = battle_result,
		battle_type = xyd.BattleType.ACTIVITY_SPFARM
	})
end

function BattleController:onSpfarmBattleResult(data)
	data.battle_type = xyd.BattleType.ACTIVITY_SPFARM

	self:openBaseBattleResult(data)
end

function BattleController:onGuildNewWarFight(event, isReport)
	if isReport == nil then
		isReport = false
	end

	local model = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR)

	dump(model:getLeftFightTime())

	local wnd = xyd.getWindow("guild_new_war_record_window")

	if not isReport and (model:getLeftFightTime() and model:getLeftFightTime() > 0 or model.isDestroyFight or wnd) then
		return
	end

	local data = event.data

	dump(data)

	local battleData = {
		self_change = data.self_change,
		enemy_change = data.enemy_change,
		index = data.index,
		items = data.items,
		is_win = data.is_win,
		rank = data.rank,
		score = data.score,
		enemy_info = data.enemy_info,
		battle_reports = data.battle_reports,
		self_info = data.self_info,
		record_ids = data.record_ids
	}

	model:setTmpReports(data)

	local record_id = -1

	if data.record_ids then
		record_id = data.record_ids[1]
	end

	if isReport or not model:isSkipReport() then
		battleData.battle_report = data.battle_reports[1]

		function battleData:onOpenCallback()
			xyd.WindowManager.get():closeWindow("arena_3v3_choose_player_window")
			xyd.WindowManager.get():closeWindow("arena_3v3_record_window")
		end

		battleData.is_last = model:isLastReport()
		battleData.record_id = record_id

		self:GuildNewWarSingleBattle(battleData)
	else
		battleData.is_last = true
		battleData.isReport = true
		battleData.battle_report = data.battle_reports[#data.battle_reports]

		if data.record_ids then
			battleData.record_id = data.record_ids[#data.record_ids]
		else
			battleData.record_id = -1
		end

		for l = 1, 2 do
			if not model:isLastReport() then
				model:getNextReport()
			end
		end

		local tmpData = {
			event_data = battleData,
			battle_type = xyd.BattleType.GUILD_NEW_WAR,
			is_last = battleData.is_last,
			isReport = battleData.isReport,
			battle_report = data.battle_reports[#data.battle_reports],
			onOpenCallback = battleData.onOpenCallback
		}

		tmpData.event_data = {
			battle_report_backend = tmpData.battle_report,
			items = battleData.items,
			record_id = battleData.record_id
		}

		local battleReport = tmpData.battle_report

		if battleReport and battleReport.random_seed and battleReport.random_seed > 0 then
			local report = xyd.BattleController.get():createReport(tmpData.battle_report)

			tmpData.event_data.battle_report = report

			if self:diffReport(battleReport, report, data.record_id) then
				tmpData.diffReport = true
				tmpData.isReport = data.isReport

				xyd.alertConfirm(__("BATTLE_RECORD_ERROR"), handler(self, function()
					xyd.closeWindow("battle_loading_window")
					self:onGuildNewWarFightResult(tmpData)
				end))

				return
			end
		end

		self:onGuildNewWarFightResult(tmpData)
	end
end

function BattleController:onGuildNewWarFightResult(data)
	data.battle_type = xyd.BattleType.GUILD_NEW_WAR

	if data.isReport then
		self:openBaseBattleResult(data, function()
			return
		end)
	else
		self:openBaseBattleResult(data, function()
			local model = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR)
			local tmpReports = model:getTmpReports()
			local battleData = {
				self_change = tmpReports.self_change,
				enemy_change = tmpReports.enemy_change,
				index = tmpReports.index,
				items = tmpReports.items,
				is_win = tmpReports.is_win,
				rank = tmpReports.rank,
				score = tmpReports.score,
				enemy_info = tmpReports.enemy_info,
				battle_reports = tmpReports.battle_reports,
				self_info = tmpReports.self_info,
				record_ids = tmpReports.record_ids
			}

			battleData.battle_report = model:getNextReport()
			battleData.is_last = model:isLastReport()
			battleData.record_id = model:getRecordId()

			if battleData.battle_report then
				xyd.WindowManager.get():closeWindow("battle_window")
				self:GuildNewWarSingleBattle(battleData)
			else
				self:GuildNewWarSkip(battleData.record_id, battleData)
				model:resetTmpReports()
			end
		end)
	end
end

return BattleController
