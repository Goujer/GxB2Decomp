-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CommunityTable.lua

local CommunityTable = class("CommunityTable", import("app.common.tables.BaseTable"))

function CommunityTable:ctor()
	CommunityTable.super.ctor(self, "community_" .. xyd.Global.lang)
end

function CommunityTable:getIds()
	local ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(ids, tonumber(id))
	end

	table.sort(ids)

	return ids
end

function CommunityTable:getName(id)
	return self:getString(id, "name")
end

function CommunityTable:getIcon(id)
	return self:getString(id, "icon_image")
end

function CommunityTable:getLink(id)
	return self:getString(id, "link")
end

return CommunityTable
