using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using BestHTTP;

public abstract class AbstractDownloader
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void DownloaderDelgate(DownloadStatus status, byte[] resultObj);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void DownloaderProgressDelegate(DownloadStatus status, float progress);

	private static readonly Dictionary<Type, Dictionary<string, AbstractDownloader>> _downloadersPool;

	private static float _checkProgressTime;

	private static float _lastCheckProgressTime;

	private readonly List<DownloaderDelgate> _finishCallbacks;

	private readonly List<DownloaderProgressDelegate> _progressCallbacks;

	private string _desc;

	public static float CheckProgressTime
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public string Url { get; private set; }

	public string MD5 { get; private set; }

	public string FilePath { get; private set; }

	public string ABUrl { get; private set; }

	public HTTPRequest HttpRequest { get; private set; }

	public long Downloaded
	{
		get
		{
			return 0L;
		}
	}

	public long DownloadSize
	{
		get
		{
			return 0L;
		}
	}

	public virtual float Progress { get; protected set; }

	public bool IsDownloading { get; private set; }

	public bool IsCompleted { get; private set; }

	public bool IsError { get; private set; }

	public bool IsSuccess
	{
		get
		{
			return false;
		}
	}

	public bool IsDisposed { get; private set; }

	public byte[] ResultObject { get; private set; }

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

	public bool IsWriteFinish { get; private set; }

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

	protected static Dictionary<string, AbstractDownloader> GetTypeDict(Type type)
	{
		return null;
	}

	public static T AutoNew<T>(string url, string md5, string filePath, string abUrl = "") where T : AbstractDownloader, new()
	{
		return null;
	}

	public static void CheckDownloadProgress()
	{
	}

	private static void DoDownloadProgress()
	{
	}

	public static void ReleaseAll()
	{
	}

	protected virtual void Init(string url, string md5, string filePath, string abUrl = "")
	{
	}

	public void Start()
	{
	}

	private void DownloadCallback(HTTPRequest request, HTTPResponse response)
	{
	}

	private void DownloadProgress(HTTPRequest request, long downloaded, long downloadLength)
	{
	}

	[DebuggerHidden]
	private IEnumerator CheckWriteFinish(HTTPResponse response)
	{
		return null;
	}

	public void SetConnectTimeout(int seconds)
	{
	}

	public void SetTimeOut(int seconds)
	{
	}

	public void AddCallback(DownloaderDelgate callback)
	{
	}

	protected void DoCallback(DownloadStatus status, byte[] resultObj)
	{
	}

	public void AddProgressCallback(DownloaderProgressDelegate callback)
	{
	}

	protected void DoProgressCallback()
	{
	}

	protected virtual void OnFinish(byte[] resultObj)
	{
	}

	protected virtual void OnProgress(float progress)
	{
	}

	protected void OnError()
	{
	}

	public void Release()
	{
	}

	private void Dispose()
	{
	}

	protected virtual void DoDispose()
	{
	}

	protected void ForceDispose()
	{
	}
}
