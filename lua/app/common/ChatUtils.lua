-- chunkname: @../../../Product/Bundles/Android/src/app/common/ChatUtils.lua

xyd = xyd or {}

local cjson = require("cjson")

function xyd.checkChatContent(str)
	if string.len(str) == 0 then
		xyd.openTipWindow("CHAT_ALL_BLANK_SPACE")

		return false
	end

	local res = string.find(str, "[%S]")

	if res == nil then
		xyd.openTipWindow("CHAT_ALL_BLANK_SPACE")

		return false
	end

	if string.len(str) > xyd.tables.misc:getData("chat_char_limit", 5) then
		xyd.openTipWindow("CHAT_TOO_MANY_LETTER")

		return false
	end

	local blankCount = 0

	for blank in string.gmatch(str, "\n") do
		blankCount = blankCount + 1
	end

	if blankCount > xyd.tables.misc:getData("chat_char_limit", 6) then
		xyd.openTipWindow("CAHT_TOO_MANY_LINE")

		return false
	end

	return true
end

function xyd.parseChatPosition(htmlStr)
	local first, last, str
	local tb = {}
	local count = 0

	if htmlStr ~= nil and htmlStr ~= "" then
		htmlStr = string.gsub(htmlStr, "：", ":")
	end

	first, last, str = string.find(htmlStr, "(C:%d+ X:%d+ Y:%d+)")

	if str ~= nil then
		local pos = string.split(str, " ")
		local posK = tonumber(string.split(pos[1], ":")[2])
		local posX = tonumber(string.split(pos[2], ":")[2])
		local posY = tonumber(string.split(pos[3], ":")[2])

		if posX < xyd.KINGDOM_MIN_X or posX > xyd.KINGDOM_MAX_X or posY < xyd.KINGDOM_MIN_Y or posY > xyd.KINGDOM_MAX_Y then
			first = nil
			last = nil

			table.insert(tb, first)
			table.insert(tb, last)
		end
	end

	if first and last then
		local res = ""
		local posStr = string.format("(%s)", string.sub(htmlStr, first, last))

		res = res .. string.sub(htmlStr, 1, first - 1)
		res = res .. "<font color=#000BB0FF size=" .. xyd.DefaultSetting.CHAT_FONT_SIZE .. ">" .. posStr .. "</font></a>"
		res = res .. "<font color=#000000FF size=" .. xyd.DefaultSetting.CHAT_FONT_SIZE .. ">" .. string.sub(htmlStr, last + 1) .. "</font></a>"

		return res, str
	else
		return htmlStr, nil
	end
end

function xyd.parseEmoji(htmlStr, size)
	size = size or {
		x = 50,
		y = 50
	}

	return string.gsub(htmlStr, "(%[#%d+%])", function(w)
		local EmojiConf = xyd.tables.emoji
		local id = tonumber(string.sub(w, 3, -2))
		local spriteName = EmojiConf:getSpriteName(id)

		if spriteName and EmojiConf:isResourrcePrepared(id) then
			return string.format("<img src='%s/%s' width=%d height=%d>", EmojiConf:getAtlas(id), spriteName, size.x, size.y)
		else
			return w
		end
	end)
end

function xyd.hasEmoji(htmlStr)
	local subString = string.match(htmlStr, "(%[#%d+%])")

	subString = subString or ""

	local id = tonumber(string.sub(subString, 3, -2))

	if id then
		return true
	else
		return false
	end
end

function xyd.HandleHtmlStr(str, changeSpace, leftLine, bbcode)
	local leftLine = leftLine or 20
	local baseLevel = 0

	if bbcode then
		baseLevel = Bidi.BidiInterface.GetBBCodeBaseLevel(str)
		str = Bidi.BidiInterface.GetBBCodeDisplay(str, 2)
	else
		baseLevel = Bidi.BidiInterface.GetBaseLevel(str)
		str = Bidi.BidiInterface.GetDisplay(str, 2)
	end

	local res = string.gsub(string.gsub(string.gsub(string.gsub(str or "", "<", "&lt;"), ">", "&gt;"), "\\n", "\n"), "\n", "<br>", leftLine)

	if changeSpace then
		res = string.gsub(res, " ", "&nbsp;")
	end

	return res, baseLevel
end

function xyd.HandleHtmlStr2(str, baseLevel, bbcode)
	local baseLevel = baseLevel or 2

	if bbcode then
		str = Bidi.BidiInterface.GetBBCodeDisplay(str, baseLevel)
	else
		str = Bidi.BidiInterface.GetDisplay(str, baseLevel)
	end

	local res = string.gsub(string.gsub(string.gsub(string.gsub(str or "", "<", "&lt;"), ">", "&gt;"), "\\n", "\n"), "\n", "<br>", 20)

	return res
end

function xyd.HandleBidiStr(str)
	local baseLevel = 0

	baseLevel = Bidi.BidiInterface.GetBaseLevel(str)
	str = Bidi.BidiInterface.GetDisplay(str, 2)

	return str, baseLevel
end

function xyd.sendChatMsg(mid, msg, info)
	if not xyd.SensitiveFilter.getResTraderFilter():isContainSensitiveWord(msg.content or msg.message) then
		xyd.Backend.get():request(mid, msg)
	elseif info then
		info:setIsHideStatusBtn(true)
	end
end

function xyd.isAutoTranslationOpened()
	return false
end

function xyd.setClipboard(str)
	UniClipBoard.SetText(str)
end

function xyd.getClipboard()
	return UniClipBoard.GetText()
end

function xyd.insertStringInUIInput(inputSp, insertStr, selectionStart, selectionEnd)
	insertStr = insertStr or ""

	if not inputSp.inputShouldBeHidden then
		inputSp.value = inputSp.value .. insertStr

		return inputSp.value, inputSp.selectionEnd
	end

	local tmp1 = selectionStart or inputSp.selectionStart
	local tmp2 = selectionEnd or inputSp.selectionEnd
	local cursorStart = math.min(tmp1, tmp2)
	local cursorEnd = math.max(tmp1, tmp2)

	if selectionStart == nil and selectionEnd == nil and UNITY_IOS then
		local highlight = inputSp.transform:Find("label/Input Highlight")

		if not tolua.isnull(highlight) then
			if not highlight:GetComponent(typeof(UITexture)).enabled then
				cursorStart = cursorEnd
			end
		else
			cursorStart = cursorEnd
		end
	end

	local str = inputSp.value
	local leftStr = string.utf8sub(str, 1, cursorStart)
	local rightStr = string.utf8sub(str, cursorEnd + 1, -1)
	local resStr = leftStr .. insertStr .. rightStr

	inputSp.value = resStr

	local newCursorPos = cursorStart + string.utf8len(insertStr)

	inputSp.selectionEnd = newCursorPos

	if not UNITY_IOS then
		inputSp.selectionStart = newCursorPos
	end

	return resStr, newCursorPos
end

function xyd.displayChatTime(sendTime)
	local deltaTime = math.max(0, xyd.getServerTime() - sendTime)

	if deltaTime < xyd.MINUTE then
		return __("SECOND_BEFORE", deltaTime)
	elseif deltaTime < xyd.HOUR then
		return __("MINUTE_BEFORE", math.floor(deltaTime / xyd.MINUTE))
	elseif deltaTime < xyd.DAY then
		return __("HOUR_BEFORE", math.floor(deltaTime / xyd.HOUR))
	else
		return __("DAY_BEFORE", math.floor(deltaTime / xyd.DAY))
	end
end

function xyd.sendChatNotice(noticeType, params)
	params = params or {}

	local msg = messages_pb.send_alliance_chat_req()

	if noticeType == xyd.AllianceChatNotice.MEMBER_JOIN then
		local tb = {
			translation = "CHAT_ENTER_CLAN",
			params = {
				params.playerName
			}
		}

		msg.content = cjson.encode(tb)
	elseif noticeType == xyd.AllianceChatNotice.MEMBER_LEAVE then
		local tb = {
			translation = "CHAT_QUIT_CLAN",
			params = {
				params.playerName
			}
		}

		msg.content = cjson.encode(tb)
	elseif noticeType == xyd.AllianceChatNotice.MEMBER_KICKED then
		local tb = {
			translation = "CHAT_EXPEL_CLAN",
			params = {
				params.playerName
			}
		}

		msg.content = cjson.encode(tb)
	elseif noticeType == xyd.AllianceChatNotice.MEMBER_JOB_CHANGE then
		local tb = {
			translation = "CHAT_CHANGE_RANK",
			params = {
				params.playerName,
				params.oldJob,
				params.newJob
			}
		}

		msg.content = cjson.encode(tb)
	end

	msg.type = xyd.ChatContentType.ALLIANCE_NOTICE

	xyd.Backend.get():request(xyd.mid.SEND_ALLIANCE_CHAT, msg)
end
