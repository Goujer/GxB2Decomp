using SimpleJSON;
using UnityEngine;

public class XYDCore : MonoBehaviour
{
	private static XYDCore _instance;

	private UIRoot _loadingUIRoot;

	private UIRoot _loading3DUIRoot;

	public const string VERSION_FILE = "version.json";

	public const string VERSION_FILE_32 = "version_32.json";

	public const string CONFIG_FILE = "config.json";

	public static XYDCore Instance
	{
		get
		{
			return null;
		}
	}

	public static int FrameRate
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public static string GameLang { get; set; }

	public static bool IsArabic { get; set; }

	public UIRoot loadingUIRoot
	{
		get
		{
			return null;
		}
	}

	public UIRoot loading3DUIRoot
	{
		get
		{
			return null;
		}
	}

	private void Awake()
	{
	}

	public void Reset()
	{
	}

	public void InitEngineConfig()
	{
	}

	private void SetLazyDownload(string version, JSONNode jsonNode)
	{
	}

	private void CheckApkUpdate()
	{
	}

	public void Run()
	{
	}

	public void ReloadManifest()
	{
	}

	public void CheckArabic(string lang)
	{
	}
}
