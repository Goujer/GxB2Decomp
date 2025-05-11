using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

public class ResModule : MonoBehaviour
{
	private static ResModule _instance;

	private List<AbstractLoader> _preloadLoaders;

	private Dictionary<string, List<AbstractLoader>> _preloadRefs;

	private Dictionary<string, List<ResDownloader>> _downloadRefs;

	private Dictionary<string, ResManager.DownloadDelegate> _downloadCallbacks;

	private Dictionary<string, ResManager.DownloadGroupProgressDelegate> _downloadProgressCallbacks;

	private Dictionary<string, ResManager.DownloadGroupProgressDelegate> _preloadAbsProgressCallbacks;

	public static ResModule Instance
	{
		get
		{
			return null;
		}
	}

	private void Awake()
	{
	}

	private void Update()
	{
	}

	public static void ForceGCCollect()
	{
	}

	public static void Reset()
	{
	}

	public static void Run()
	{
	}

	public static void SetCheckDownloadProgressTime(float interval)
	{
	}

	public static void ReleaseByDependency(Dependency dependency)
	{
	}

	public static void ForceDisposeByDependency(Dependency dependency)
	{
	}

	public static ResInfo GetResInfo(string url, bool withFileProtocol, bool isLua)
	{
		return null;
	}

	public static ResInfo GetInDataResInfo(string url, bool withFileProtocol)
	{
		return null;
	}

	public static ResInfo GetInAppResInfo(string url, bool withFileProtocol, bool isLua)
	{
		return null;
	}

	public static string GetABUrl(string url, bool isAB = false)
	{
		return null;
	}

	public static string[] GetABUrls(string[] urls, bool isAB = false)
	{
		return null;
	}

	public static string[] GetAllABUrl(string url, bool isAB = false)
	{
		return null;
	}

	public static string[] GetAllABUrls(string[] urls, bool isAB = false)
	{
		return null;
	}

	public static string GetResName(string url)
	{
		return null;
	}

	public static bool IsFileExistsWithDifferentCase(string filePath)
	{
		return false;
	}

	public static bool IsDirExistsWithDifferentCase(string dirPath)
	{
		return false;
	}

	public void PreloadABsAsync(ResManager.LoadDelegate callback)
	{
	}

	[DebuggerHidden]
	private IEnumerator PreloadAbsAsyncEnumerator(ResManager.LoadDelegate callback)
	{
		return null;
	}

	public void PreloadABsByPathAsync(string group, string[] paths, ResManager.LoadDelegate callback, ResManager.DownloadGroupProgressDelegate progressCallback)
	{
	}

	public void PreloadABsAsync(string group, string[] abUrls, ResManager.LoadDelegate callback)
	{
	}

	[DebuggerHidden]
	private IEnumerator PreloadABsAsyncEnumerator(string group, string[] abUrls, ResManager.LoadDelegate callback)
	{
		return null;
	}

	public void ReleasePreloadLoaders()
	{
	}

	public void ReleasePreloadLoaders(string group)
	{
	}

	public void ReleaseDownloads()
	{
	}

	public void DownloadABsAsync(string group, string[] abUrls, ResManager.DownloadDelegate callback, ResManager.DownloadGroupProgressDelegate progressCallback, float interval)
	{
	}

	[DebuggerHidden]
	private IEnumerator DownloadABsAsyncEnumerator(string group, string[] abUrls, float interval)
	{
		return null;
	}

	private bool CheckLoadersComplete(List<ResDownloader> loaders, out long downloadedSize)
	{
		downloadedSize = default(long);
		return false;
	}

	public void RemoveDownloadCallback(string group)
	{
	}
}
