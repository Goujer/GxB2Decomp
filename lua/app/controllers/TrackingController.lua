-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/TrackingController.lua

local TrackingController = class("TrackingController", import(".BaseController"))
local AreaRoadTable = xyd.tables.areaRoad
local AreaVerticesTable = xyd.tables.areaVertices
local RandomActionController = import("app.controllers.RandomActionController")

function TrackingController:ctor()
	TrackingController.super.ctor(self)

	self.verticles = {}
	self.roads = {}
	self.roadnums = 0

	self:initVerticles()
end

function TrackingController:get()
	if TrackingController.INSTANCE == nil then
		TrackingController.INSTANCE = TrackingController.new()
	end

	return TrackingController.INSTANCE
end

function TrackingController:initVerticles()
	local roadID = 1
	local road

	while true do
		road = AreaRoadTable:getTableDataByRoadID(roadID)

		if road == nil then
			break
		end

		self.roads[roadID] = road
		self.roads[roadID].cost = math.sqrt(math.pow(road.start_x - road.end_x, 2) + math.pow(road.start_y - road.end_y, 2))

		local startpos = self:getKey(road.start_x, road.start_y)
		local endpos = self:getKey(road.end_x, road.end_y)

		self.roads[roadID].startpos = startpos
		self.roads[roadID].endpos = endpos

		if not self.verticles[startpos] then
			self.verticles[startpos] = {}
			self.verticles[startpos].x = road.start_x
			self.verticles[startpos].y = road.start_y
			self.verticles[startpos].roads = {}
		end

		table.insert(self.verticles[startpos].roads, roadID)

		if not self.verticles[endpos] then
			self.verticles[endpos] = {}
			self.verticles[endpos].x = road.end_x
			self.verticles[endpos].y = road.end_y
			self.verticles[endpos].roads = {}
		end

		table.insert(self.verticles[endpos].roads, roadID)

		roadID = roadID + 1
	end

	self.roadnums = roadID - 1
end

function TrackingController:checkIfOnRoad(x, y, roadID)
	local road = AreaRoadTable:getTableDataByRoadID(roadID)

	if math.abs((road.start_x - x) * (y - road.end_y) - (road.start_y - y) * (x - road.end_x)) < 0.01 then
		return true
	end

	return false
end

function TrackingController:actorMoveFromTo(actorID, start_x, start_y, end_x, end_y, needdata)
	local startpos = self:getKey(start_x, start_y)
	local endpos = self:getKey(end_x, end_y)
	local t_start_x = start_x
	local t_start_y = start_y
	local t_end_x = end_x
	local t_end_y = end_y
	local nearestStart, nearestEnd
	local curRoadID = xyd.SelfInfo.get().onRoad

	if startpos == endpos then
		return
	end

	if not self.verticles[startpos] and not self.verticles[endpos] then
		return
	end

	if xyd.SelfInfo.get().targetPos and not needdata and xyd.SelfInfo.get().targetPos == endpos then
		return
	end

	if not self.verticles[startpos] then
		nearestStart = AreaVerticesTable:getNearestRoadPoint(start_x, start_y)

		if curRoadID == nil or curRoadID == 0 then
			local road
			local roadID = 1
			local spaths = self:findPath(end_x, end_y, nearestStart.x, nearestStart.y)
			local real_start_x = nearestStart.x
			local real_start_y = nearestStart.y

			while true do
				road = AreaRoadTable:getTableDataByRoadID(roadID)

				if not road then
					break
				end

				if road.start_x == nearestStart.x and road.start_y == nearestStart.y then
					local tmppaths = self:findPath(end_x, end_y, road.end_x, road.end_y)

					if #tmppaths < #spaths then
						real_start_x = road.end_x
						real_start_y = road.end_y
					end
				elseif road.end_x == nearestStart.x and road.end_y == nearestStart.y then
					local tmppaths = self:findPath(end_x, end_y, road.start_x, road.start_y)

					if #tmppaths < #spaths then
						real_start_x = road.start_x
						real_start_y = road.start_y
					end
				end

				roadID = roadID + 1
			end

			nearestStart.x = real_start_x
			nearestStart.y = real_start_y
		else
			local road = AreaRoadTable:getTableDataByRoadID(curRoadID)

			if road ~= nil then
				local tmppaths1 = self:findPath(end_x, end_y, road.start_x, road.start_y)
				local tmppaths2 = self:findPath(end_x, end_y, road.end_x, road.end_y)

				if #tmppaths1 < #tmppaths2 then
					nearestStart.x = road.start_x
					nearestStart.y = road.start_y
				elseif #tmppaths1 > #tmppaths2 then
					nearestStart.x = road.end_x
					nearestStart.y = road.end_y
				elseif math.pow(end_x - road.start_x, 2) + math.pow(end_y - road.start_y, 2) < math.pow(end_x - road.end_x, 2) + math.pow(end_y - road.end_y, 2) then
					nearestStart.x = road.start_x
					nearestStart.y = road.start_y
				else
					nearestStart.x = road.end_x
					nearestStart.y = road.end_y
				end
			end
		end

		start_x = nearestStart.x
		start_y = nearestStart.y
		startpos = self:getKey(start_x, start_y)
	end

	if not needdata then
		xyd.QuestController.get():onSkipStory(false)
		RandomActionController.get():onSkipStory()
	end

	local paths

	paths = self:findPath(start_x, start_y, end_x, end_y)

	if not paths then
		return
	end

	local nowPath = {}
	local nowpos = startpos
	local actions = {}
	local firstRoadID = paths[#paths]

	if nearestStart then
		local act = self:getActionByGrid(actorID, t_start_x, t_start_y, nearestStart.x, nearestStart.y)

		if curRoadID then
			act.roadID = curRoadID
			act.targetpos = endpos
		end

		if curRoadID and self.roads[curRoadID].is_upstair and self.roads[curRoadID].is_upstair > 0 then
			if self.roads[curRoadID].endpos == nearestStart then
				act.animation = "walk_upstair"
			else
				act.animation = "walk_downstair"
			end
		end

		__TS__ArrayPush(actions, act)
	end

	while #paths > 0 do
		local roadID = paths[#paths]

		paths[#paths] = nil

		local road = self.roads[roadID]
		local topos = road.endpos

		if nowpos == road.endpos then
			topos = road.startpos
		end

		local lastaction = self:getActionByGrid(actorID, self.verticles[nowpos].x, self.verticles[nowpos].y, self.verticles[topos].x, self.verticles[topos].y)

		if road.is_upstair and road.is_upstair > 0 then
			if topos == road.endpos then
				lastaction.animation = "walk_upstair"
			else
				lastaction.animation = "walk_downstair"
			end
		end

		lastaction.roadID = roadID
		lastaction.targetpos = endpos
		nowpos = topos

		__TS__ArrayPush(actions, lastaction)
	end

	if needdata then
		return actions
	end

	local finalaction = {}

	finalaction.actor_id = actorID
	finalaction.layer = 0
	finalaction.time = 0
	finalaction.start_grid_x = end_x
	finalaction.start_grid_y = end_y
	finalaction.operation_id = 4
	finalaction.animation = "idle"

	__TS__ArrayPush(actions, finalaction)
	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.QUEST_CALL_ACTION,
		params = {
			ifInstant = true,
			actionlist = actions
		}
	})
end

function TrackingController:getActionByGrid(actorID, x1, y1, x2, y2)
	local lastaction = {}

	lastaction.actor_id = actorID
	lastaction.start_grid_x = x1
	lastaction.start_grid_y = y1
	lastaction.layer = 0
	lastaction.time = 0
	lastaction.end_grid_x = x2
	lastaction.end_grid_y = y2
	lastaction.operation_id = 3

	local xmove = lastaction.end_grid_x - lastaction.start_grid_x
	local ymove = lastaction.end_grid_y - lastaction.start_grid_y

	lastaction.animation = "walk"

	return lastaction
end

function TrackingController:findPath(start_x, start_y, end_x, end_y)
	local startpos = self:getKey(start_x, start_y)
	local endpos = self:getKey(end_x, end_y)
	local line = {}
	local inline = {}
	local dist = {}
	local last = {}

	inline[startpos] = true
	dist[startpos] = 0
	line[1] = startpos

	local head = 1
	local tail = 1

	while head <= tail do
		local nowpos = line[head]

		for _, roadID in ipairs(self.verticles[nowpos].roads) do
			local topos = self.roads[roadID].startpos

			if nowpos == self.roads[roadID].startpos then
				topos = self.roads[roadID].endpos
			end

			if dist[topos] == nil then
				dist[topos] = 99999999
			end

			if dist[nowpos] + self.roads[roadID].cost < dist[topos] then
				dist[topos] = dist[nowpos] + self.roads[roadID].cost
				last[topos] = roadID

				if not inline[topos] then
					inline[topos] = true
					tail = tail + 1
					line[tail] = topos
				end
			end
		end

		inline[nowpos] = false
		head = head + 1
	end

	local paths = {}
	local nowposition = endpos

	if not dist[nowposition] then
		print("没有路径")

		return paths
	end

	while nowposition ~= startpos do
		local roadID = last[nowposition]

		__TS__ArrayPush(paths, roadID)

		if nowposition ~= self.roads[roadID].startpos then
			nowposition = self.roads[roadID].startpos
		else
			nowposition = self.roads[roadID].endpos
		end
	end

	return paths
end

function TrackingController:getRoadByID(roadID)
	return self.roads[roadID]
end

function TrackingController:getKey(x, y)
	local xx = math.floor(x * 100 + 0.5)
	local yy = math.floor(y * 100 + 0.5)

	return xx * 10000 + yy
end

return TrackingController
