using System;
using System.IO;

namespace BestHTTP
{
	internal static class HTTPProtocolFactory
	{
		public static HTTPResponse Get(SupportedProtocols protocol, HTTPRequest request, Stream stream, bool isStreamed, bool isFromCache)
		{
			return null;
		}

		public static SupportedProtocols GetProtocolFromUri(Uri uri)
		{
			return default(SupportedProtocols);
		}

		public static bool IsSecureProtocol(Uri uri)
		{
			return false;
		}
	}
}
