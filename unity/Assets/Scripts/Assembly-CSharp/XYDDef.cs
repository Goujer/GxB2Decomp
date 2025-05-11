public static class XYDDef
{
	public const string HotResDir = "HotRes";

	public const string ProductDir = "Product";

	public const string ResBuildDir = "Product/Bundles";

	public const string ResBuildLZMADir = "Product/BundlesLZMA";

	public const string ResDir = "Bundles";

	public const string ABExt = ".bytes";

	public const string LazyWebDownloadPrefix = "__lazy_web_download__";

	public const string LazyLz4DownloadPrefix = "__lazy_lz4_download__";

	public const string LazyLuaDownloadPrefix = "__lazy_lua_download__";

	public const string LuaDirectory = "Assets/Lua/";

	public const string AssetRootDirectory = "Assets/HotRes/";

	public const int FrameRate = 60;

	public const string LuaExt = ".lua";

	public const string LangFormat = "{0}.lang";

	public const string PrefLangKey = "moemoe.Lang";

	public const string PrefServerKey = "moemoe.Server";

	public const string LangUS = "en_us";

	public const string LangEN = "en_en";

	public const string LangTW = "zh_tw";

	public static string PkgName
	{
		get
		{
			return null;
		}
	}

	public static string AppPath
	{
		get
		{
			return null;
		}
	}

	public static string StrPath
	{
		get
		{
			return null;
		}
	}

	public static string DataPath
	{
		get
		{
			return null;
		}
	}

	public static string DatabasePath
	{
		get
		{
			return null;
		}
	}

	public static string CrashPath
	{
		get
		{
			return null;
		}
	}

	public static string LogPath
	{
		get
		{
			return null;
		}
	}

	public static string EditorProductFullPath
	{
		get
		{
			return null;
		}
	}

	public static string EditorResFullPath
	{
		get
		{
			return null;
		}
	}

	public static string EditorRawFullPath
	{
		get
		{
			return null;
		}
	}

	public static string RelativeResPath { get; private set; }

	public static string DataResPathNoFileProtocol
	{
		get
		{
			return null;
		}
	}

	public static string DataResPath { get; private set; }

	public static string AppResPathNoFileProtocol { get; private set; }

	public static string AppRawPath { get; private set; }

	public static string AppResPath { get; private set; }

	public static string IsArabic { get; private set; }

	public static string GetFileProtocol()
	{
		return null;
	}

	public static string GetEditorActiveBuildTarget()
	{
		return null;
	}

	public static string GetBuildPlatformName()
	{
		return null;
	}

	public static void InitResSetting()
	{
	}

	public static string GetDefaultLang()
	{
		return null;
	}

	public static string GetSdkLang()
	{
		return null;
	}

	public static int GetGameVersion()
	{
		return 0;
	}

	public static bool isH5()
	{
		return false;
	}
}
