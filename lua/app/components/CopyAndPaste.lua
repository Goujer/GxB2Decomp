-- chunkname: @../../../Product/Bundles/Android/src/app/components/CopyAndPaste.lua

local CopyAndPaste = class("CopyAndPaste")

function CopyAndPaste:ctor(inputLabel, UIInput, pressPart, dragPart, btnGroup, updateLineCallBack)
	self.input_ = UIInput
	self.inputLabel_ = inputLabel
	self.pressPart_ = pressPart
	self.dragPart_ = dragPart
	self.btnGroup_ = btnGroup
	self.updateLineCallBack_ = updateLineCallBack

	if not tolua.isnull(self.btnGroup_) then
		self:initBtnGroup()
	end

	local widget = self.pressPart_:GetComponent(typeof(UIWidget))

	if widget then
		widget.onDispose = handler(self, self.dispose)
	end

	self:initEvent()
	self:initMoveTimer()
end

function CopyAndPaste:initBtnGroup()
	self.copyBtn_ = self.btnGroup_:NodeByName("btnCopy").gameObject
	self.copyBtnLabel_ = self.copyBtn_:ComponentByName("button_label", typeof(UILabel))
	self.PasteBtn_ = self.btnGroup_:NodeByName("btnPaste").gameObject
	self.PasteBtnLabel_ = self.PasteBtn_:ComponentByName("button_label", typeof(UILabel))
	self.selectAllBtn_ = self.btnGroup_:NodeByName("btnSelectAll").gameObject
	self.selectAllBtnLabel_ = self.selectAllBtn_:ComponentByName("button_label", typeof(UILabel))
	self.copyBtnLabel_.text = __("COPY")
	self.PasteBtnLabel_.text = __("PASTE")
	self.selectAllBtnLabel_.text = __("SELECT_ALL")
	UIEventListener.Get(self.copyBtn_).onClick = function()
		local text = self.input_:GetSelections()

		if not tostring(text) or #tostring(text) <= 0 then
			text = self.inputLabel_.text
		end

		xyd.alertTips(__("COPY_SELF_ID_SUCCESSFUL"))
		xyd.SdkManager:get():copyToClipboard(tostring(text))
	end
	UIEventListener.Get(self.PasteBtn_).onClick = function()
		dump("======================" .. NGUITools.clipboard)

		local text = NGUITools.clipboard or ""
		local val = xyd.insertStringInUIInput(self.input_, text)

		self.input_.value = val
	end
	UIEventListener.Get(self.selectAllBtn_).onClick = function()
		self.input_:SelectAll()
	end

	self:updateBtns()
end

function CopyAndPaste:initMoveTimer()
	self.timer_ = Timer.New(handler(self, self.onDragout), 0.75, -1, true)
end

function CopyAndPaste:dispose()
	self.timer_:Stop()

	self.timer_ = nil
end

function CopyAndPaste:initEvent()
	UIEventListener.Get(self.pressPart_).onLongPress = function()
		print("========onLongPress=======")

		self.longPress_ = true

		self:updateBtns()

		self.input_.isOnDragLight = true
	end
	UIEventListener.Get(self.pressPart_).onClick = function()
		self.longPress_ = false
		self.input_.isOnDragLight = false

		self:updateBtns()
	end
	UIEventListener.Get(self.pressPart_).onDragEnd = function()
		self.isOutSide_ = false

		self.timer_:Stop()
	end
	UIEventListener.Get(self.pressPart_).onDragOut = function()
		self.isOutSide_ = true
	end
	UIEventListener.Get(self.pressPart_).onDragStart = function()
		self.movePos_ = {
			x = 0,
			y = 0
		}
		self.isOutSide_ = false

		self.timer_:Start()
	end
	UIEventListener.Get(self.pressPart_).onDrag = function(go, delta)
		self.movePos_.x = self.movePos_.x + delta.x
		self.movePos_.y = self.movePos_.y + delta.y
	end
end

function CopyAndPaste:onDragout()
	if self.isOutSide_ and self.updateLineCallBack_ and self.movePos_ then
		if self.movePos_.y > 40 then
			self.updateLineCallBack_(-1)
		elseif self.movePos_.y < -40 then
			self.updateLineCallBack_(1)
		end
	end
end

function CopyAndPaste:updateBtns()
	self.btnGroup_:SetActive(self.longPress_)

	if self.dragPart_ then
		self.dragPart_.enabled = not self.longPress_
	end
end

return CopyAndPaste
