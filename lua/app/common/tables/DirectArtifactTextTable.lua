-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DirectArtifactTextTable.lua

local BaseTable = import(".BaseTable")
local DirectArtifactTextTable = class("DirectArtifactTextTable", BaseTable)

function DirectArtifactTextTable:ctor()
	DirectArtifactTextTable.super.ctor(self, "direct_artifact_text_" .. tostring(xyd.Global.lang))
end

function DirectArtifactTextTable:getName(id)
	return self:getString(id, "artifact_name")
end

function DirectArtifactTextTable:getDesc(id)
	return self:getString(id, "artifact_desc")
end

return DirectArtifactTextTable
