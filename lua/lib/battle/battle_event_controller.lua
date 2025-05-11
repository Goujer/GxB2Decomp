-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/battle_event_controller.lua

local modules = {
	"lib.battle.battle_buffs.teleishaSealBuff",
	"lib.battle.battle_buffs.kaixiHurtDmgBuff",
	"lib.battle.battle_buffs.critHalfHpBuff",
	"lib.battle.battle_buffs.fateWheelBuff",
	"lib.battle.battle_buffs.naturalLawBuff",
	"lib.battle.battle_buffs.futureObserveBuff",
	"lib.battle.battle_buffs.dianaDieBuff",
	"lib.battle.battle_buffs.deathMarkBuff",
	"lib.battle.battle_buffs.dmgRateSpreadBuff"
}
local _M = {}

function _M:reg_evt()
	for _, v in ipairs(modules) do
		local lib = require(v)

		lib:reg_evt()
	end
end

return _M
