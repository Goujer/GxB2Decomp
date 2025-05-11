-- chunkname: @../../../Product/Bundles/Android/src/app/components/ReportBtn.lua

local ReportBtn = class("ReportBtn", import(".BaseComponent"))

function ReportBtn:ctor(parentGo, params)
	self.data = params.data
	self.open_type_ = params.open_type
	self.currentState_ = xyd.Global.lang
	self.timeData_ = params.time
	self.offsetDepth = 10

	ReportBtn.super.ctor(self, parentGo)
end

function ReportBtn:getPrefabPath()
	return "Prefabs/Components/report_btn"
end

function ReportBtn:initUI()
	self:getUIComponent()
	self:layout()
end

function ReportBtn:getUIComponent()
	self.reportIcon1 = self.go:NodeByName("report_icon1").gameObject
	self.reportIcon2 = self.go:NodeByName("report_icon2").gameObject
	self.btnLabel_ = self.go:ComponentByName("btnLabel", typeof(UILabel))
end

function ReportBtn:SetLocalPosition(x, y, z)
	self.go.transform.localPosition = Vector3(x, y, z)
end

function ReportBtn:setPosition(position, offset)
	if position then
		self:SetLocalPosition(position.x, position.y, position.z)
	end

	if offset then
		local localPosition = self.go.transform.localPosition

		self.go.transform.localPosition = Vector3(localPosition.x + offset.x, localPosition.y + offset.y, localPosition.z + offset.z)
	end
end

function ReportBtn:layout()
	self.btnLabel_.text = __("REPORT")

	if self.open_type_ and self.open_type_ <= 2 then
		self["reportIcon" .. self.open_type_]:SetActive(true)
	end

	UIEventListener.Get(self.go).onClick = handler(self, self.onTap)
end

function ReportBtn:onTap()
	if self.open_type_ == 1 then
		xyd.WindowManager.get():openWindow("report_window", {
			data = self.data
		})
	elseif self.data.player_id == xyd.Global.playerID then
		xyd.alertTips(__("CANT_REPORT_SELF"))
	else
		local tips = __("CONFIRM_REPORT")

		if self.data.report_type == xyd.Report_Type.SIGNATURE then
			tips = __("PERSON_SIGNATURE_TEXT_3")
		end

		xyd.alertYesNo(tips, function(flag)
			if flag then
				if not self.data.hasReported then
					local msg = self:getMsg()

					xyd.models.chat:reportMessage(self.data.player_id, self.data.report_type, msg)
					xyd.alertTips(__("REPORT_SUCCESS"))

					self.data.hasReported = true
				else
					xyd.alertTips(__("REPORT_SUCCESS"))
					xyd.EventDispatcher.inner():dispatchEvent({
						name = xyd.event.REPORT_MESSAGE
					})
				end
			end
		end, __("REPORT"))
	end
end

function ReportBtn:getMsg()
	local chapter_id = self.data.chapter_id
	local msg = ""

	if self.data.report_type == xyd.Report_Type.SLOT_COMMENT then
		chapter_id = tostring(chapter_id)
		chapter_id = string.sub(chapter_id, 2, #chapter_id)

		local partner_name = xyd.tables.partnerTable:getName(chapter_id)

		if xyd.Global.lang == "en_en" then
			local zh_name = xyd.tables.partnerNameTrasTable:getZWnamesByENnames(partner_name)

			partner_name = xyd.checkCondition(zh_name, zh_name, partner_name)
		end

		msg = "comment_id: " .. self.data.comment_id .. ",comment_partner:" .. partner_name .. ",comment:" .. self.data.msg
	elseif self.data.report_type == xyd.Report_Type.SIGNATURE then
		msg = self.data.msg
	elseif self.data.report_type == xyd.Report_Type.ACTIVITY_POPULARITY_VOTE then
		msg = "comment:" .. self.data.msg .. ",player_id:" .. self.data.player_id .. ",partner_tableid:" .. self.data.partner_table_id
	else
		msg = "comment_id: " .. self.data.comment_id .. ",comic_chapter:" .. chapter_id .. ",comment:" .. self.data.msg
	end

	return msg
end

return ReportBtn
