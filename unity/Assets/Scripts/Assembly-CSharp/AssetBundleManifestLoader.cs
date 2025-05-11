using System.Collections;
using System.Diagnostics;
using UnityEngine;

public class AssetBundleManifestLoader : AbstractLoader
{
	private AssetBundle _manifestBundle;

	public AssetBundleManifest Res
	{
		get
		{
			return null;
		}
	}

	public static AssetBundleManifestLoader Loader(string url, LoaderMode loaderMode)
	{
		return null;
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
