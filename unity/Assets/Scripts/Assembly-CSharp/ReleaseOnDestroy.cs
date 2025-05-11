using System.Collections.Generic;
using UnityEngine;

public class ReleaseOnDestroy : MonoBehaviour
{
	protected Dictionary<uint, AbstractLoader> _loaders;

	public static void Cache(AbstractLoader loader)
	{
	}

	public static void UnCache(AbstractLoader loader)
	{
	}

	public static void UnCacheSpine(AbstractLoader loader)
	{
	}

	public static void Register<T>(Component comp, AbstractLoader loader) where T : ReleaseOnDestroy
	{
	}

	public static void Register<T>(GameObject go, AbstractLoader loader) where T : ReleaseOnDestroy
	{
	}

	public static void Register<T>(Transform trans, AbstractLoader loader) where T : ReleaseOnDestroy
	{
	}

	public static void ClearAll()
	{
	}

	protected virtual void Register(AbstractLoader loader)
	{
	}

	protected virtual void Clear()
	{
	}

	private void OnDestroy()
	{
	}
}
