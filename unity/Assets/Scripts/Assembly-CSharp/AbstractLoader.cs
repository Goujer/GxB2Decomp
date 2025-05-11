using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;

public abstract class AbstractLoader
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void LoaderDelgate(bool isSuccess, object resultObj);

	private static readonly Dictionary<Pool, Dictionary<Type, Dictionary<Type, Dictionary<string, AbstractLoader>>>> _loadersPool;

	private static readonly Dictionary<AbstractLoader, LinkedListNode<AbstractLoader>> _unusedLoaders;

	private static readonly LinkedList<AbstractLoader> _lruList;

	private static readonly Dictionary<AbstractLoader, LinkedListNode<AbstractLoader>> _unusedABLoaders;

	private static readonly LinkedList<AbstractLoader> _abLruList;

	private static readonly List<AbstractLoader> _cacheLoaderToRemoveFromUnused;

	private static float _lastGCTime;

	private static uint _currUID;

	private readonly List<LoaderDelgate> _finishCallbacks;

	private string _desc;

	private static int LoaderDisposeThreshold;

	private static int ABLoaderDisposeThreshold;

	public static float GCIntervalTime
	{
		get
		{
			return 0f;
		}
	}

	public uint UID { get; private set; }

	public string Url { get; private set; }

	public Type Type { get; private set; }

	public LoaderMode LoaderMode { get; private set; }

	public int RefCount { get; protected set; }

	public Pool Pool { get; private set; }

	public Dependency Dependency { get; protected set; }

	public Dependency[] Dependencies { get; protected set; }

	public virtual float Progress { get; protected set; }

	public bool IsLoading { get; private set; }

	public bool IsCompleted { get; private set; }

	public bool IsError { get; private set; }

	public bool IsSuccess
	{
		get
		{
			return false;
		}
	}

	public bool IsTrulySuccess
	{
		get
		{
			return false;
		}
	}

	public bool IsAbandon { get; private set; }

	public bool IsDisposed { get; private set; }

	public object ResultObject { get; private set; }

	public virtual string Desc
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public float InitTiming { get; private set; }

	public float FinishTiming { get; private set; }

	public float FinishUsedTime
	{
		get
		{
			return 0f;
		}
	}

	public event Action<string> SetDescEvent
	{
		add
		{
		}
		remove
		{
		}
	}

	public event Action DisposeEvent
	{
		add
		{
		}
		remove
		{
		}
	}

	protected static Dictionary<string, AbstractLoader> GetTypeDict(Pool pool, Type type, Type type2)
	{
		return null;
	}

	public static void InitDisposeThreshold()
	{
	}

	public static T AutoNew<T>(string url, Type type, LoaderMode loaderMode) where T : AbstractLoader, new()
	{
		return null;
	}

	public static T GetCacheLoader<T>(string url, Type type) where T : AbstractLoader
	{
		return null;
	}

	public static void ReleaseByDependency(Dependency dependency)
	{
	}

	public static void ForceDisposeByDependency(Dependency dependency)
	{
	}

	public static void CheckGCCollect()
	{
	}

	public static void ForceGCCollect()
	{
	}

	private static void DoGarbageCollect()
	{
	}

	public static void DisposeUnusedLoaders()
	{
	}

	public static void ReleaseAll()
	{
	}

	public static void ReleasePool(Pool pool)
	{
	}

	protected virtual void Init(string url, Type type, LoaderMode loaderMode)
	{
	}

	public void Start()
	{
	}

	protected virtual void Load()
	{
	}

	protected virtual void LoadAsync()
	{
	}

	public void AddCallback(LoaderDelgate callback)
	{
	}

	protected void DoCallback(bool isSuccess, object resultObj)
	{
	}

	protected virtual void OnFinish(object resultObj)
	{
	}

	private void OnError()
	{
	}

	private void OnRelease(bool gcNow = false)
	{
	}

	private static bool IsNeedCached(string url)
	{
		return false;
	}

	private void OnDebug(object resultObj)
	{
	}

	private void Retain()
	{
	}

	private void Revive()
	{
	}

	public virtual void Release(bool gcNow)
	{
	}

	public virtual void ReleaseSpine()
	{
	}

	public virtual void Release()
	{
	}

	private void ReleaseDependency(Dependency dependency)
	{
	}

	private void ReleaseDependencies()
	{
	}

	protected virtual void OnReadyDisposed()
	{
	}

	private void Dispose()
	{
	}

	protected virtual void DoDispose()
	{
	}

	protected Dependency ToDependency()
	{
		return null;
	}

	protected void ForceDispose()
	{
	}
}
