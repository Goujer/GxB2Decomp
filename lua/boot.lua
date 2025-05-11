-- chunkname: @../../../Product/Bundles/Android/src/boot.lua

xyd = xyd or {}

local boot = {}

function boot.run()
	local pkgName = XYDDef.PkgName

	if UNITY_ANDROID then
		xyd.pkgUpdateURL = "http://play.google.com/store/apps/details?id=" .. pkgName
	elseif UNITY_IOS then
		if pkgName == "com.carolgames.moemoegirls" then
			xyd.pkgUpdateURL = "https://itunes.apple.com/app/id1402944867"
		elseif pkgName == "com.carolgames.moemoegirls.jp" then
			xyd.pkgUpdateURL = "https://itunes.apple.com/app/id1470593250"
		else
			xyd.pkgUpdateURL = "https://itunes.apple.com/app/id1535153682"
		end
	else
		xyd.pkgUpdateURL = "itms-apps://itunes.apple.com/us/app/apple-store/id1163967490"
	end

	xyd.lang = XYDUtils.GetGameLang()

	print("xyd.lang = " .. xyd.lang)
	require("UpdateController"):run()
end

return boot
