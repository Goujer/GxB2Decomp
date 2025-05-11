-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerReturnRule2Table.lua

local PartnerReturnRule2Table = class("PartnerReturnRule2Table", import(".BaseTable"))
local slotModel = xyd.models.slot

function PartnerReturnRule2Table:ctor()
	PartnerReturnRule2Table.super.ctor(self, "partner_return_rule2")
end

function PartnerReturnRule2Table:getReturnPartner(partnerID)
	local partner = slotModel:getPartner(partnerID)

	return self:getReturnPartnerByPartner(partner)
end

function PartnerReturnRule2Table:getReturnPartnerInfo(partnerID)
	local partner = slotModel:getPartner(partnerID)
	local star = partner:getStar()
	local group = partner:getGroup()
	local sp = xyd.split(self.TableLua.rows[tostring(star)][self.TableLua.keys["group_" .. group]], "|")
	local tmp = {}
	local data = {}

	for i = 1, #sp do
		data[i] = {}
		tmp = xyd.split(sp[i], "#")

		for j = 1, #tmp do
			data[i][j] = xyd.split(tmp[j], "@", true)
		end
	end

	return data
end

function PartnerReturnRule2Table:getReturnPartnerByPartner(partner)
	local partner = partner
	local star = partner:getStar()
	local group = partner:getGroup()
	local level = partner:getLevel()
	local isVowed = partner:isVowed()
	local num = 0
	local items = {}
	local sp = xyd.split(self.TableLua.rows[tostring(star)][self.TableLua.keys["group_" .. group]], "|")
	local tmp = {}
	local data = {}

	for i = 1, #sp do
		data[i] = {}
		tmp = xyd.split(sp[i], "#")

		for j = 1, #tmp do
			data[i][j] = xyd.split(tmp[j], "@", true)
		end
	end

	for _, v in ipairs(data) do
		local item = v

		if item[1][1] ~= 0 then
			items[#items + 1] = {
				table_id = item[1][1],
				num = item[2][1]
			}
			num = num + item[2][1]
		end
	end

	local self_num = self:getNumber(star, "award_self")

	num = num + self_num

	if not xyd.tables.partnerTable:getMaterial1(partner.tableID) then
		return {}
	end

	if xyd.tables.partnerTable:getStar(partner.tableID) > 5 then
		if isVowed then
			if self_num <= 1 then
				items[#items + 1] = {
					is_vowed = 1,
					table_id = xyd.tables.partnerTable:getMaterial1(partner.tableID)[1],
					num = self_num
				}
			else
				items[#items + 1] = {
					table_id = xyd.tables.partnerTable:getMaterial1(partner.tableID)[1],
					num = self_num - 1
				}
				items[#items + 1] = {
					is_vowed = 1,
					num = 1,
					table_id = xyd.tables.partnerTable:getMaterial1(partner.tableID)[1]
				}
			end
		else
			items[#items + 1] = {
				table_id = xyd.tables.partnerTable:getMaterial1(partner.tableID)[1],
				num = self_num
			}
		end
	elseif isVowed then
		if self_num <= 1 then
			items[#items + 1] = {
				is_vowed = 1,
				table_id = partner.tableID,
				num = self_num
			}
		else
			items[#items + 1] = {
				table_id = partner.tableID,
				num = self_num - 1
			}
			items[#items + 1] = {
				is_vowed = 1,
				num = 1,
				table_id = partner.tableID
			}
		end
	else
		items[#items + 1] = {
			table_id = partner.tableID,
			num = self_num
		}
	end

	return items, num
end

function PartnerReturnRule2Table:getCost(star)
	return self:split2Cost(star, "cost", "#")
end

function PartnerReturnRule2Table:getAllItems(partnerID)
	local partner = slotModel:getPartner(partnerID)

	return self:getAllItemsByPartner(partner)
end

function PartnerReturnRule2Table:getAllItemsByPartner(partner, returnAllItem)
	local items = {}
	local partner = partner
	local star = partner:getStar()
	local group = partner:getGroup()
	local level = partner:getLevel()

	dump(partner.grade)
	dump(partner.awake)

	for i = 1, #partner.equipments do
		local equip = partner.equipments[i]

		if equip ~= 0 then
			if i == xyd.EquipPos.TREASURE then
				local base_cost
				local factor = returnAllItem and 1 or self:getNumber(star, "crystal")
				local equip_lv = xyd.tables.equipTable:getItemLev(equip)
				local cost_data = xyd.tables.costReturnTreasureTable:getCost(equip_lv)

				cost_data[#cost_data + 1] = base_cost

				for _, v in ipairs(cost_data) do
					items[v[1]] = (items[v[1]] or 0) + math.ceil(v[2] * factor)
				end
			else
				items[equip] = 1
			end
		end
	end

	local exp_ratio = returnAllItem and 1 or self:getNumber(star, "exp")
	local exp_cost = xyd.tables.expPartnerTable:getAllExp(level)

	if exp_cost > 0 then
		items[xyd.ItemID.PARTNER_EXP] = (items[xyd.ItemID.PARTNER_EXP] or 0) + math.ceil(exp_cost * exp_ratio)
	end

	local gold_grade_ratio = returnAllItem and 1 or self:getNumber(star, "gold_grade")
	local gold_grade_cost = xyd.tables.expPartnerTable:getAllMoney(level)

	if gold_grade_cost > 0 and gold_grade_ratio ~= 0 then
		items[xyd.ItemID.MANA] = (items[xyd.ItemID.MANA] or 0) + math.ceil(gold_grade_cost * gold_grade_ratio)
	end

	if self:split2Cost(star, "bento_num", "#") ~= nil and self:split2Cost(star, "bento_num", "#")[1] ~= nil and self:split2Cost(star, "bento_num", "#")[1] ~= 0 then
		local awake_cost = self:split2Cost(star, "bento_num", "#")

		items[awake_cost[1]] = (items[awake_cost[1]] or 0) + awake_cost[2]
	elseif self:getNumber(star, "bento_ratio") ~= nil and self:getNumber(star, "bento_ratio") ~= 0 then
		local grade_id = partner.grade + partner.awake
		local cost_data_cost = xyd.tables.costTotalGradeTable:getCost(grade_id)
		local cost_data_gold = xyd.tables.costTotalGradeTable:getGold(grade_id)

		if cost_data_cost then
			items[cost_data_cost[1]] = (items[cost_data_cost[1]] or 0) + cost_data_cost[2] * self:getNumber(star, "bento_ratio")
		end

		if cost_data_gold then
			items[cost_data_gold[1]] = (items[cost_data_gold[1]] or 0) + cost_data_gold[2] * self:getNumber(star, "gold_grade")
		end
	end

	if not partner.ex_skills then
		return {}
	end

	for _, lv in ipairs(partner.ex_skills) do
		for id = 1, lv do
			local cost_data = xyd.tables.partnerExSkillCostTable:getCost(id)

			for _, cost in ipairs(cost_data) do
				items[cost[1]] = (items[cost[1]] or 0) + cost[2]
			end
		end
	end

	local star_origin = partner:getStarOrigin()

	if star_origin then
		local flag = false

		for i = 1, #star_origin do
			if star_origin[i] > 0 then
				flag = true

				break
			end
		end

		if flag then
			local partnerTableID = partner:getTableID()
			local listTableID = xyd.tables.partnerTable:getStarOrigin(partnerTableID)
			local startIDs = xyd.tables.starOriginListTable:getStarIDs(listTableID)

			for i = 1, #startIDs do
				local beginID = startIDs[i]
				local lev = partner.star_origin[i]

				if lev and lev > 0 then
					local starOriginTableID = xyd.tables.starOriginTable:getIdByBeginIDAndLev(beginID, lev)
					local totalCost = xyd.tables.starOriginTable:getCostTotal(starOriginTableID)

					for _, cost in ipairs(totalCost) do
						items[cost[1]] = (items[cost[1]] or 0) + cost[2]
					end
				end
			end
		end
	end

	local result = {}

	for key, value in pairs(items) do
		local temp = {
			key,
			value
		}

		if value ~= 0 then
			table.insert(result, temp)
		end
	end

	return result
end

function PartnerReturnRule2Table:getCrystalByPartnerID(partnerID)
	local partner = slotModel:getPartner(partnerID)
	local id = partner:getStar()

	return self:getNumber(id, "crystal")
end

function PartnerReturnRule2Table:getCrystalByPartner(partner)
	local id = partner:getStar()

	return self:getNumber(id, "crystal")
end

return PartnerReturnRule2Table
