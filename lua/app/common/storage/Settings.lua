-- chunkname: @../../../Product/Bundles/Android/src/app/common/storage/Settings.lua

local Settings = class("Settings")

function Settings:ctor()
	local db = xyd.db.openUserDefaults()

	self:reset()
	xyd.close_db(db)
end

function Settings:reset()
	self:load_()
end

function Settings:persist()
	if not self.loaded_ then
		return
	end

	local db = xyd.db.openUserDefaults()
	local stmt = db:prepare("        INSERT OR REPLACE INTO settings (id) VALUES (0)\n    ")

	stmt:bind_values(self.battleSpeed, self.playBattleSpeed, self.isAutoBattle, self.isAutoBoss, self.isAutoPlayBattle, self.backgroundMusicOn, self.soundEffectOn, self.screenRotation, self.powerSavingMode, self.peopleSound, self.scheduleSettingTable.TILI, self.scheduleSettingTable.WENQUAN, self.scheduleSettingTable.TUTIANMAX, self.scheduleSettingTable.SUMMONFREE, self.autoSellRuneRarity, self.needKingLevelUpNotice)
	stmt:step()
	stmt:reset()
	stmt:finalize()
	xyd.close_db(db)
end

function Settings:load_()
	local db = xyd.db.openUserDefaults()
	local stmt = db:prepare("SELECT * FROM settings")

	for row in stmt:nrows() do
		break
	end

	stmt:finalize()

	self.loaded_ = true
end

return Settings
