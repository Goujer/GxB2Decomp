using System.Collections.Generic;
using System.Runtime.InteropServices;
using BestHTTP;

public class HttpRequest
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void FinishDelegate(HttpResponse response);

	private static Dictionary<string, HTTPMethods> _methods;

	private HTTPRequest _request;

	private readonly List<FinishDelegate> _finishCallbacks;

	public int State
	{
		get
		{
			return 0;
		}
	}

	public HttpRequest(string url, string method)
	{
	}

	public static HttpRequest Request(string url, string method)
	{
		return null;
	}

	public static HttpRequest Request(string url, string method, int formUsage = 0)
	{
		return null;
	}

	public void SetConnectTimeout(int sec)
	{
	}

	public void SetTimeout(int sec)
	{
	}

	public void SetDisableCache(bool val)
	{
	}

	public void AddField(string fieldName, string value)
	{
	}

	public void AddBinaryData(string fieldName, byte[] content)
	{
	}

	public void AddBinaryData(string fieldName, byte[] content, string fileName)
	{
	}

	public void AddBinaryData(string fieldName, byte[] content, string fileName, string mimeType)
	{
	}

	public void AddCallback(FinishDelegate callback)
	{
	}

	private void DoCallback(HttpResponse response)
	{
	}

	public void Send()
	{
	}
}
