-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/WindowTable.lua

local WindowTable = class("WindowTable", import("app.common.tables.BaseTable"))

function WindowTable:ctor()
	WindowTable.super.ctor(self, "window")
end

function WindowTable:getMask(name)
	return self:getNumber(name, "mask") or 0
end

function WindowTable:hasWindow(name)
	return self:getString(name, "class") ~= nil
end

function WindowTable:getClass(name)
	return self:getString(name, "class")
end

function WindowTable:getLayerType(name)
	return self:getNumber(name, "layer_type") or 0
end

function WindowTable:getResource(name)
	return self:getString(name, "resource")
end

function WindowTable:layoutType(name)
	return self:getNumber(name, "layout_type") or 0
end

function WindowTable:offsetX(name)
	return self:getNumber(name, "off_x") or 0
end

function WindowTable:offsetY(name)
	return self:getNumber(name, "off_y") or 0
end

function WindowTable:forbiddenWindow(name)
	return self:getString(name, "forbidden_window")
end

function WindowTable:visibleFixedWindow(name)
	return self:getString(name, "visible_fixed_window")
end

function WindowTable:hideType(name)
	return self:getNumber(name, "hide_type")
end

function WindowTable:backType(name)
	return self:getNumber(name, "back_type")
end

function WindowTable:getOpenAnimation(name)
	return self:getNumber(name, "open_animation") or 0
end

function WindowTable:getCloseAnimation(name)
	return self:getNumber(name, "close_animation") or 0
end

function WindowTable:getBackground(name)
	return self:getNumber(name, "background") or 0
end

function WindowTable:newbackground(name)
	return self:getNumber(name, "newbackground") or 0
end

function WindowTable:showLoading(name)
	return self:getNumber(name, "show_loading") > 0
end

function WindowTable:windowName(name)
	return self:getString(name, "window_name")
end

function WindowTable:description(name)
	return self:getString(name, "description")
end

function WindowTable:closeSound(name)
	return self:getString(name, "close_sound")
end

function WindowTable:openSound(name)
	return self:getString(name, "open_sound")
end

function WindowTable:bgsSound(name)
	return self:split2num(name, "bgs_sound", "|") or {}
end

function WindowTable:bottomBtnStatus(name)
	return self:getNumber(name, "bottom_btn_status")
end

function WindowTable:isShowResLoading(name)
	return self:getNumber(name, "show_res_loading") == 1
end

function WindowTable:getResLoadingDelay(name)
	return self:getNumber(name, "res_loading_delay")
end

function WindowTable:isShowScene(name)
	return self:getNumber(name, "show_scene") == 1
end

function WindowTable:getRecordID(name)
	return self:getNumber(name, "record_id")
end

function WindowTable:getAnimationPart(name)
	local str = self:getString(name, "animation_part")

	str = str == "" and "groupAction" or str

	return str
end

function WindowTable:canCloseOrOpenImmediately(name)
	local layerType = self:getLayerType(name)

	if layerType ~= xyd.UILayerType.FULL_SCREEN_UI and layerType ~= xyd.UILayerType.FLOATING_UI then
		return true
	end

	if self:backType(name) < 0 then
		return true
	end

	return false
end

function WindowTable:getImgGuide(name)
	return self:getNumber(name, "img_guide")
end

function WindowTable:isAlwaysVisible(name)
	return self:getNumber(name, "always_visible") == 1
end

function WindowTable:revertName(name)
	return name
end

function WindowTable:backClose(name)
	return self:getNumber(name, "back_close")
end

function WindowTable:stackType(name)
	name = self:revertName(name)

	return self:getNumber(name, "stack_type")
end

return WindowTable
