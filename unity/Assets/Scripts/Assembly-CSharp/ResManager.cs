using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public static class ResManager
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void LoadDelegate(bool success, UnityEngine.Object obj, AbstractLoader loader);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void LoadAllDelegate(bool success, UnityEngine.Object[] objs, AbstractLoader loader);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void DownloadDelegate(DownloadStatus status);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void DownloadBytesDelegate(DownloadStatus status, byte[] obj);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void DownloadStringDelegate(DownloadStatus status, string obj);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void DownloadProgressDelegate(DownloadStatus status, float progress);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void DownloadGroupProgressDelegate(float progress);

	private static Dictionary<Type, Dictionary<string, UnityEngine.Object>> _defaultRes;

	private static Dictionary<Type, Dictionary<string, UnityEngine.Object[]>> _defaultAllRes;

	public static bool IsLocalAsset(string path)
	{
		return false;
	}

	public static bool IsLocalAssets(string[] paths)
	{
		return false;
	}

	public static bool IsLocalRes(string abUrl)
	{
		return false;
	}

	public static void PreloadABsAsync(LoadDelegate callback)
	{
	}

	public static void ForceGCCollect()
	{
	}

	public static void DisposeUnusedLoaders()
	{
	}

	public static void PreloadShaders()
	{
	}

	public static void LoadInitRes(DownloadDelegate callback, DownloadGroupProgressDelegate progressCallback, float interval = 0f)
	{
	}

	public static void PreloadABsByPathAsync(string group, string[] paths, LoadDelegate callback, DownloadGroupProgressDelegate progressCallback)
	{
	}

	public static T LoadAsset<T>(string path) where T : UnityEngine.Object
	{
		return null;
	}

	public static void LoadAsset<T>(string path, LoadDelegate callback) where T : UnityEngine.Object
	{
	}

	public static void LoadAssetAsync<T>(string path, LoadDelegate callback) where T : UnityEngine.Object
	{
	}

	public static T[] LoadAllAssets<T>(string path) where T : UnityEngine.Object
	{
		return null;
	}

	public static void LoadAllAssets<T>(string path, LoadAllDelegate callback) where T : UnityEngine.Object
	{
	}

	public static void LoadAllAssetsAsync<T>(string path, LoadAllDelegate callback) where T : UnityEngine.Object
	{
	}

	public static void TryLoadAsset(string url, LoadDelegate callback = null)
	{
	}

	public static void TryLoadRes(string url, LoadDelegate callback = null)
	{
	}

	public static void DownloadRes(string url, string md5, string filePath, DownloadDelegate callback, DownloadProgressDelegate progressCallback = null)
	{
	}

	public static void DownloadFile(string url, string md5, string filePath, DownloadDelegate callback, DownloadProgressDelegate progressCallback = null)
	{
	}

	public static void DownloadBytes(string url, DownloadBytesDelegate callback, DownloadProgressDelegate progressCallback = null)
	{
	}

	public static void DownloadString(string url, DownloadStringDelegate callback, DownloadProgressDelegate progressCallback = null)
	{
	}

	public static void ResPriority(string js, string path)
	{
	}

	public static void GetAllABUrls(string[] paths)
	{
	}
}
