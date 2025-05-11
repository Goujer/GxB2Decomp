using System.Collections.Generic;
using SimpleJSON;

public class XYDConf
{
	private static JSONNode Data { get; set; }

	public static string Name { get; private set; }

	public static Dictionary<string, bool> ABDirs { get; private set; }

	public static Dictionary<string, bool> CacheABs { get; private set; }

	public static string[] PreloadABs { get; private set; }

	public static string[] InitResUrls { get; private set; }

	public static bool IsTest { get; private set; }

	public static string VersionCheckUrl { get; private set; }

	public static string CdnUrl { get; private set; }

	public static string AvatarUrl { get; private set; }

	public static string UploadUrl { get; private set; }

	public static Dictionary<string, bool> SupportLangs { get; private set; }

	public static Dictionary<string, string> SpecialLangs { get; private set; }

	public static string Version { get; private set; }

	public static void InitConfig(string str)
	{
	}

	public static void SetCdnUrl(string url)
	{
	}
}
