-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FilterWordTable.lua

local FilterWordTable = class("FilterWordTable", import("app.common.tables.BaseTable"))
local MARK_ARR = {
	"—",
	"；",
	"┆",
	"｀",
	"◎",
	"⑸",
	"±",
	"ℓ",
	"―",
	"〕",
	"△",
	"⑹",
	":",
	"㊣",
	"｜",
	"①",
	"┄",
	"┤",
	"]",
	"︷",
	"|",
	"●",
	"~",
	"｝",
	"#",
	"ˇ",
	"④",
	"━",
	"∝",
	"∽",
	"▽",
	"‘",
	"︶",
	"'",
	"┮",
	"⑼",
	"③",
	"∷",
	"⊥",
	"▼",
	"︵",
	"+",
	"╆",
	"⑽",
	"㎡",
	"•",
	"︴",
	"┯",
	"╇",
	"/",
	"⑤",
	"．",
	"┠",
	"‡",
	"▲",
	"╊",
	"○",
	"⑧",
	"／",
	"∑",
	"“",
	"┎",
	"∪",
	"²",
	"〃",
	"⑦",
	"｛",
	"㈩",
	"②",
	"∩",
	"╂",
	"。",
	"＋",
	">",
	"⑨",
	"＊",
	"￥",
	"∴",
	"╅",
	"￠",
	"、",
	"}",
	"∶",
	"™",
	"º",
	"┉",
	"∫",
	"∵",
	"－",
	"†",
	"⅞",
	"┶",
	"∮",
	"℡",
	"(",
	"¾",
	"★",
	"㏄",
	"⒌",
	"╮",
	"⑥",
	",",
	"≒",
	"㎜",
	"⊙",
	"⒍",
	"∈",
	"∨",
	"∏",
	"^",
	"℃",
	"«",
	"々",
	"┗",
	"┷",
	"㎝",
	"♂",
	"￣",
	"）",
	"↓",
	"㎞",
	"←",
	"┖",
	"Θ",
	"㈢",
	"┲",
	"♀",
	"》",
	"卐",
	"■",
	"﹎",
	"⑩",
	"┵",
	"→",
	"<",
	"[",
	"＃",
	"□",
	"﹉",
	"└",
	"÷",
	"Å",
	"!",
	"·",
	"╭",
	"＄",
	"〉",
	"_",
	"ˉ",
	"╋",
	"╈",
	"%",
	"㈣",
	"％",
	"Š",
	"┳",
	"〈",
	"»",
	"♡",
	"╄",
	"㈧",
	"½",
	"【",
	"…",
	"⌒",
	"┴",
	"┒",
	"∧",
	")",
	"⅝",
	"⒉",
	"︾",
	"』",
	"╯",
	"《",
	"‖",
	"！",
	"≠",
	"﹏",
	"＆",
	"㈥",
	"┱",
	"㈦",
	"≈",
	"┕",
	"-",
	"╁",
	"╀",
	"『",
	"¨",
	"︻",
	"┿",
	"┾",
	"﹍",
	"┐",
	"﹂",
	"@",
	"∠",
	"㈠",
	"┼",
	"╉",
	"┰",
	"┭",
	"┬",
	"」",
	"┊",
	"⑶",
	"│",
	"┣",
	"┢",
	"⒐",
	"⒋",
	"⑷",
	"┟",
	"┈",
	"卍",
	"┺",
	"Õ",
	"≯",
	"╲",
	"「",
	"⒈",
	"﹊",
	"┞",
	"─",
	"℉",
	"┓",
	"┑",
	"┏",
	"┍",
	"┌",
	"°",
	"↹",
	"↑",
	"︹",
	"㈨",
	"㈤",
	"㈡",
	"§",
	"⑺",
	"：",
	"╳",
	"`",
	"＂",
	"㎎",
	"┝",
	"┽",
	"≌",
	"＝",
	"⒊",
	"’",
	"〗",
	"︸",
	"=",
	"（",
	"≡",
	"＇",
	"﹁",
	"\\",
	"├",
	"{",
	"⅜",
	"︿",
	"≥",
	"︼",
	"＼",
	"＜",
	"⒏",
	"〓",
	"┛",
	"┻",
	"≮",
	"\"",
	";",
	"］",
	"﹀",
	"⑻",
	"?",
	"┥",
	"┚",
	"＿",
	".",
	"”",
	"［",
	"‰",
	"$",
	"®",
	"⅛",
	"┦",
	"◇",
	"⑴",
	"☆",
	"≦",
	"﹃",
	"¼",
	"＞",
	"√",
	"&",
	"︽",
	"Ｆ",
	"】",
	"囍",
	"㈱",
	"‥",
	"￡",
	"×",
	"*",
	"Ψ",
	"⑵",
	"┙",
	"┹",
	"╰",
	"≤",
	"⒎",
	"≧",
	"Ω",
	"〖",
	"∞",
	"⊕",
	"©",
	"◆",
	"¤",
	"∥",
	"┘",
	"┸",
	"？",
	"﹌",
	"№",
	"︺",
	"╱",
	"⒑",
	"〔",
	"※",
	"，",
	"┧",
	"▪",
	"′",
	"″",
	"㎏",
	"﹄",
	"³",
	"┅",
	"┡",
	"～",
	"\n"
}

function FilterWordTable:ctor()
	FilterWordTable.super.ctor(self, "filterword")

	self.words = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]
		local word = row[colIndexTable.word]
		local ignoreCase = self:Number(row[colIndexTable.ignore_case])

		self.words[word] = ignoreCase == 1 and 2 or 1
	end
end

function FilterWordTable:getWord(id)
	return self:getString(id, "word")
end

function FilterWordTable:isIgnoreCase(id)
	return self:getNumber(id, "ignore_case") == 1
end

function FilterWordTable:isInWords(str)
	local word = str

	if self.words[word] then
		return true
	end

	local flag = false

	for key, _ in pairs(self.words) do
		key = string.gsub(key, "%[", "%%[")
		key = string.gsub(key, "%]", "%%]")
		key = string.gsub(key, "%)", "%%)")
		key = string.gsub(key, "%(", "%%(")

		if string.find(word, key) ~= nil or self.words[key] == 2 and string.find(string.lower(word), string.lower(key)) ~= nil then
			flag = true

			break
		end
	end

	return flag
end

function FilterWordTable:isInMarks(str)
	local word = tostring(str)

	if self.words[word] then
		return true
	end

	local flag = false

	for i, key in pairs(MARK_ARR) do
		if string.find(word, key, 1, true) ~= nil then
			flag = true

			break
		end
	end

	return flag
end

function FilterWordTable:illegalReplace(str)
	local word = str

	if self.words[word] then
		local l = string.len(word) > 3 and 3 or string.len(word)

		word = string.rep("*", l)

		return word
	end

	for key, _ in pairs(self.words) do
		key = string.gsub(key, "%[", "%%[")
		key = string.gsub(key, "%]", "%%]")
		key = string.gsub(key, "%)", "%%)")
		key = string.gsub(key, "%(", "%%(")

		local l = string.len(word) > 3 and 3 or string.len(word)
		local con = string.rep("*", l)

		if string.find(word, key) ~= nil or self.words[key] == 2 and string.find(string.lower(word), string.lower(key)) ~= nil then
			word = string.gsub(word, key, con)

			while string.find(string.lower(word), string.lower(key)) do
				local tag = string.sub(word, string.find(string.lower(word), string.lower(key)))

				word = string.gsub(word, tag, con)
			end
		end
	end

	return word
end

return FilterWordTable
