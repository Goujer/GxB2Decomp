using System;
using System.Runtime.InteropServices;

namespace BestHTTP
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate bool OnBeforeRedirectionDelegate(HTTPRequest originalRequest, HTTPResponse response, Uri redirectUri);
}
