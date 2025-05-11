using System;
using System.Collections;
using System.Diagnostics;
using UnityEngine;

public class AssetsLoader : AbstractLoader
{
	public static AssetsLoader Loader(string url, Type type, LoaderMode loaderMode)
	{
		return null;
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

	private UnityEngine.Object[] LoadInEditor(bool isAysnc = false)
	{
		return null;
	}

	protected override void DoDispose()
	{
	}
}
