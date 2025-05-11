-- chunkname: @../../../Product/Bundles/Android/src/app/components/ActivityExploreOldCampusWayAlert.lua

local ActivityExploreOldCampusWayAlert = class("ActivityExploreOldCampusWayAlert", import(".BaseComponent"))

function ActivityExploreOldCampusWayAlert:ctor(parentGo, params)
	self.params = params
	self.buffId_ = params.id

	ActivityExploreOldCampusWayAlert.super.ctor(self, parentGo, params)
end

function ActivityExploreOldCampusWayAlert:initUI()
	ActivityExploreOldCampusWayAlert.super.initUI(self)
	self:getUIComponent()
	self:updateInfo()
end

function ActivityExploreOldCampusWayAlert:getPrefabPath()
	return "Prefabs/Components/activity_explore_old_campus_way_alert"
end

function ActivityExploreOldCampusWayAlert:getUIComponent()
	local winTrans = self.go:NodeByName("groupAction")

	self.groupAction_widget = winTrans:GetComponent(typeof(UIWidget))
	self.bg = winTrans:ComponentByName("bg", typeof(UIWidget))
	self.skillImg_ = winTrans:ComponentByName("skillImg", typeof(UISprite))
	self.skillName_ = winTrans:ComponentByName("skillName", typeof(UILabel))
	self.skillDesc_ = winTrans:ComponentByName("skillDesc", typeof(UILabel))
	self.scoreLabel_ = winTrans:ComponentByName("scoreCon/scoreLabel", typeof(UILabel))
	self.extraLabel = winTrans:ComponentByName("extraLabel", typeof(UILabel))
end

function ActivityExploreOldCampusWayAlert:setInfo(params)
	self.buffId_ = params.id

	self:updateInfo()
end

function ActivityExploreOldCampusWayAlert:updateInfo()
	print("self.buffId_", self.buffId_)

	local skillIconName = xyd.tables.oldBuildingBuffTable:getIconName(self.buffId_)
	local point = xyd.tables.oldBuildingBuffTable:getPoint(self.buffId_)

	xyd.setUISpriteAsync(self.skillImg_, nil, skillIconName)

	local skillName = xyd.tables.oldBuildingBuffTextTable:getBuffName(self.buffId_)
	local skillDesc = xyd.tables.oldBuildingBuffTextTable:getBuffDesc(self.buffId_)

	self.skillName_.text = skillName
	self.skillDesc_.text = skillDesc
	self.scoreLabel_.text = point

	local isLock = false
	local buffTable = xyd.tables.oldBuildingBuffTable
	local lockState = buffTable:needUnlock(tonumber(self.buffId_))
	local needPoint = buffTable:getUnlockCost(tonumber(self.buffId_))[1]
	local type = buffTable:getType(tonumber(self.buffId_))

	if lockState and lockState == 1 and needPoint > tonumber(xyd.models.oldSchool:getAllInfo().max_score) then
		isLock = true
	end

	if type == 4 then
		self.extraLabel.text = __("OLD_SCHOOL_FLOOR_11_TEXT09")
		self.skillDesc_.text = self.skillDesc_.text .. "\n\n"
	elseif isLock == true then
		self.extraLabel.text = __("OLD_SCHOOL_BUFF_LOCK_TEXT", needPoint)
		self.skillDesc_.text = self.skillDesc_.text .. "\n\n"
	else
		self.extraLabel.text = " "
	end
end

function ActivityExploreOldCampusWayAlert:getActionHeight()
	return 135 + self.skillDesc_.height
end

return ActivityExploreOldCampusWayAlert
