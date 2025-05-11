using BestHTTP;

public class HttpResponse
{
	private HTTPRequest _request;

	private HTTPResponse _response;

	public int StatusCode
	{
		get
		{
			return 0;
		}
	}

	public bool IsSuccess
	{
		get
		{
			return false;
		}
	}

	public byte[] Data
	{
		get
		{
			return null;
		}
	}

	public string DataAsText
	{
		get
		{
			return null;
		}
	}

	public string Message
	{
		get
		{
			return null;
		}
	}

	public int ReqState
	{
		get
		{
			return 0;
		}
	}

	public HttpResponse(HTTPRequest request, HTTPResponse response)
	{
	}

	public static HttpResponse Response(HTTPRequest request, HTTPResponse response)
	{
		return null;
	}
}
