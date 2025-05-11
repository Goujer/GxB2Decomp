using System;
using System.Collections.Generic;
using System.IO;

namespace BestHTTP.Caching
{
	public static class HTTPCacheService
	{
		private const int LibraryVersion = 2;

		private static bool isSupported;

		private static bool IsSupportCheckDone;

		private static Dictionary<Uri, HTTPCacheFileInfo> library;

		private static Dictionary<ulong, HTTPCacheFileInfo> UsedIndexes;

		private static bool InClearThread;

		private static bool InMaintainenceThread;

		private static ulong NextNameIDX;

		public static bool IsSupported
		{
			get
			{
				return false;
			}
		}

		private static Dictionary<Uri, HTTPCacheFileInfo> Library
		{
			get
			{
				return null;
			}
		}

		internal static string CacheFolder { get; private set; }

		private static string LibraryPath { get; set; }

		static HTTPCacheService()
		{
		}

		internal static void CheckSetup()
		{
		}

		internal static void SetupCacheFolder()
		{
		}

		internal static ulong GetNameIdx()
		{
			return 0uL;
		}

		internal static bool HasEntity(Uri uri)
		{
			return false;
		}

		public static bool DeleteEntity(Uri uri, bool removeFromLibrary = true)
		{
			return false;
		}

		internal static bool IsCachedEntityExpiresInTheFuture(HTTPRequest request)
		{
			return false;
		}

		internal static void SetHeaders(HTTPRequest request)
		{
		}

		internal static HTTPCacheFileInfo GetEntity(Uri uri)
		{
			return null;
		}

		internal static HTTPResponse GetFullResponse(HTTPRequest request)
		{
			return null;
		}

		internal static bool IsCacheble(Uri uri, HTTPMethods method, HTTPResponse response)
		{
			return false;
		}

		internal static HTTPCacheFileInfo Store(Uri uri, HTTPMethods method, HTTPResponse response)
		{
			return null;
		}

		internal static Stream PrepareStreamed(Uri uri, HTTPResponse response)
		{
			return null;
		}

		public static void BeginClear()
		{
		}

		private static void ClearImpl(object param)
		{
		}

		public static void BeginMaintainence(HTTPCacheMaintananceParams maintananceParam)
		{
		}

		public static int GetCacheEntityCount()
		{
			return 0;
		}

		public static ulong GetCacheSize()
		{
			return 0uL;
		}

		private static void LoadLibrary()
		{
		}

		internal static void SaveLibrary()
		{
		}

		internal static void SetBodyLength(Uri uri, int bodyLength)
		{
		}

		private static void DeleteUnusedFiles()
		{
		}
	}
}
