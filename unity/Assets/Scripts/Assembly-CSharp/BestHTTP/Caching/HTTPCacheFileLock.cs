using System;
using System.Collections.Generic;

namespace BestHTTP.Caching
{
	internal sealed class HTTPCacheFileLock
	{
		private static Dictionary<Uri, object> FileLocks;

		private static object SyncRoot;

		internal static object Acquire(Uri uri)
		{
			return null;
		}

		internal static void Remove(Uri uri)
		{
		}

		internal static void Clear()
		{
		}
	}
}
