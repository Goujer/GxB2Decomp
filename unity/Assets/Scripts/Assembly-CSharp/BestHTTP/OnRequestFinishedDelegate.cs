using System.Runtime.InteropServices;

namespace BestHTTP
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnRequestFinishedDelegate(HTTPRequest originalRequest, HTTPResponse response);
}
