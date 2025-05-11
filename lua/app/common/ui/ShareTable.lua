-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/ShareTable.lua

local ShareTable = class("ShareTable")

function ShareTable:ctor(node, params)
	self.node_ = node
	params = params or {}
	self.msgList_ = params.msgList
	self.window_ = params.window
	self.panelWidth_ = params.width

	self:initSelfComponents()
	self:update()
end

function ShareTable:initSelfComponents()
	local go = self.node_
	local prefab = xyd.AssetsLoader.get():loadPrefab("Prefabs/Common/share_table")
	local go = NGUITools.AddChild(self.node_, prefab)
	local panelBg = go:ComponentByName("bg", typeof(UISprite))

	panelBg.width = self.panelWidth_
	self.uiPanel_ = go:ComponentByName("panel", typeof(UIPanel))

	local maxDepth = XYDUtils.GetMaxTargetDepth(self.window_)

	self.uiPanel_.depth = maxDepth + 1
	self.uiTable1_ = go:ComponentByName("panel/table1", typeof(UITable))
	self.uiTable2_ = go:ComponentByName("panel/table2", typeof(UITable))
	self.tweenPos1_ = self.uiTable1_:GetComponent(typeof(TweenPosition))
	self.tweenPos2_ = self.uiTable2_:GetComponent(typeof(TweenPosition))
	self.msgItem_ = go:NodeByName("panel/msg").gameObject

	self.msgItem_:SetActive(false)
end

function ShareTable:update(msgList)
	msgList = msgList or self.msgList_
	self.labelWidth_ = 0

	if #msgList == 0 then
		self.node_:SetActive(false)

		return
	end

	self.node_:SetActive(true)

	local childCount = self.uiTable1_.transform.childCount

	for i = childCount, 1, -1 do
		local t = self.uiTable1_.transform:GetChild(i - 1)
		local go = t.gameObject

		go:SetActive(false)
	end

	for i, msg in ipairs(msgList) do
		local go

		if i <= childCount then
			go = self.uiTable1_.transform:GetChild(i - 1).gameObject
		else
			go = NGUITools.AddChild(self.uiTable1_.gameObject, self.msgItem_)
		end

		go:SetActive(true)

		local label = go:GetComponent(typeof(UILabel))

		label.text = msg
		self.labelWidth_ = self.labelWidth_ + label.width + 50
	end

	for i = childCount, 1, -1 do
		local t = self.uiTable2_.transform:GetChild(i - 1)
		local go = t.gameObject

		go:SetActive(false)
	end

	for i, msg in ipairs(msgList) do
		local go

		if i <= childCount then
			go = self.uiTable2_.transform:GetChild(i - 1).gameObject
		else
			go = NGUITools.AddChild(self.uiTable2_.gameObject, self.msgItem_)
		end

		go:SetActive(true)

		go:GetComponent(typeof(UILabel)).text = msg
	end

	local endToEnd = self.labelWidth_ <= self.panelWidth_ - 20

	self.tweenPos1_.from = Vector3(-self.panelWidth_ / 2, 0, 0)
	self.tweenPos1_.to = self.tweenPos1_.from + Vector3(-self.panelWidth_, 0, 0)

	if endToEnd then
		self.tweenPos2_.from = Vector3(self.panelWidth_ / 2, 0, 0)
	else
		self.tweenPos2_.from = self.tweenPos1_.from + Vector3(self.labelWidth_ + 200, 0, 0)
	end

	self.tweenPos2_.to = self.tweenPos2_.from + Vector3(-self.panelWidth_, 0, 0)
	self.tweenPos1_.duration = #msgList * 10

	self.tweenPos1_:ResetToBeginning()
	self.tweenPos1_:PlayForward()

	self.tweenPos2_.duration = #msgList * 10

	self.tweenPos2_:ResetToBeginning()
	self.tweenPos2_:PlayForward()
end

return ShareTable
