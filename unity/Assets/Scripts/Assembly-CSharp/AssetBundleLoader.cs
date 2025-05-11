using System;
using System.Collections;
using System.Diagnostics;
using UnityEngine;

public class AssetBundleLoader : AbstractLoader
{
	private static AssetBundleManifest _manifest;

	public static AssetBundleLoader Loader(string url, LoaderMode loaderMode)
	{
		return null;
	}

	public static bool ReloadManifest()
	{
		return false;
	}

	public static bool LoadManifest(bool reload = false)
	{
		return false;
	}

	public static string[] GetABDependencies(string url)
	{
		return null;
	}

	public static string[] GetAllABDependencies(string url)
	{
		return null;
	}

	public static void Clear()
	{
	}

	protected override void Init(string url, Type type, LoaderMode loaderMode)
	{
	}

	protected override void Load()
	{
	}

	protected override void LoadAsync()
	{
	}

	[DebuggerHidden]
	private IEnumerator LoadAsyncEnumerator()
	{
		return null;
	}

	protected override void DoDispose()
	{
	}
}
