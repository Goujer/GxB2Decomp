-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCrystalBallTextTable.lua

local ActivityCrystalBallTextTable = class("ActivityCrystalBallTextTable", import("app.common.tables.BaseTable"))

function ActivityCrystalBallTextTable:ctor()
	ActivityCrystalBallTextTable.super.ctor(self, "activity_crystal_ball_text_" .. tostring(xyd.Global.lang))
end

function ActivityCrystalBallTextTable:getText(id)
	print("getText   id:", id)

	return self:getString(id, "text")
end

return ActivityCrystalBallTextTable
