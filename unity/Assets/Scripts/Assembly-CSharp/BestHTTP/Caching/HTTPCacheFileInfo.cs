using System;
using System.IO;

namespace BestHTTP.Caching
{
	public class HTTPCacheFileInfo : IComparable<HTTPCacheFileInfo>
	{
		internal Uri Uri { get; set; }

		internal DateTime LastAccess { get; set; }

		public int BodyLength { get; set; }

		private string ETag { get; set; }

		private string LastModified { get; set; }

		private DateTime Expires { get; set; }

		private long Age { get; set; }

		private long MaxAge { get; set; }

		private DateTime Date { get; set; }

		private bool MustRevalidate { get; set; }

		private DateTime Received { get; set; }

		private string ConstructedPath { get; set; }

		internal ulong MappedNameIDX { get; set; }

		internal HTTPCacheFileInfo(Uri uri)
		{
		}

		internal HTTPCacheFileInfo(Uri uri, DateTime lastAcces, int bodyLength)
		{
		}

		internal HTTPCacheFileInfo(Uri uri, BinaryReader reader, int version)
		{
		}

		internal void SaveTo(BinaryWriter writer)
		{
		}

		public string GetPath()
		{
			return null;
		}

		public bool IsExists()
		{
			return false;
		}

		internal void Delete()
		{
		}

		private void Reset()
		{
		}

		private void SetUpCachingValues(HTTPResponse response)
		{
		}

		internal bool WillExpireInTheFuture()
		{
			return false;
		}

		internal void SetUpRevalidationHeaders(HTTPRequest request)
		{
		}

		public Stream GetBodyStream(out int length)
		{
			length = default(int);
			return null;
		}

		internal HTTPResponse ReadResponseTo(HTTPRequest request)
		{
			return null;
		}

		internal void Store(HTTPResponse response)
		{
		}

		internal Stream GetSaveStream(HTTPResponse response)
		{
			return null;
		}

		public int CompareTo(HTTPCacheFileInfo other)
		{
			return 0;
		}
	}
}
