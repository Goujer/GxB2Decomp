using System;
using System.Collections.Generic;
using System.IO;
using BestHTTP.Caching;
using BestHTTP.Cookies;
using BestHTTP.Decompression.Zlib;
using UnityEngine;

namespace BestHTTP
{
	public class HTTPResponse : IDisposable
	{
		internal const byte CR = 13;

		internal const byte LF = 10;

		public const int MinBufferSize = 4096;

		protected string dataAsText;

		protected Texture2D texture;

		internal HTTPRequest baseRequest;

		protected Stream Stream;

		protected List<byte[]> streamedFragments;

		protected object SyncRoot;

		protected byte[] fragmentBuffer;

		protected int fragmentBufferDataLength;

		protected Stream cacheStream;

		protected int allFragmentSize;

		private MemoryStream decompressorInputStream;

		private MemoryStream decompressorOutputStream;

		private GZipStream decompressorGZipStream;

		private byte[] copyBuffer;

		private const int MinLengthToDecompress = 256;

		public int VersionMajor { get; protected set; }

		public int VersionMinor { get; protected set; }

		public int StatusCode { get; protected set; }

		public bool IsSuccess
		{
			get
			{
				return false;
			}
		}

		public string Message { get; protected set; }

		public bool IsStreamed { get; protected set; }

		public bool IsStreamingFinished { get; internal set; }

		public bool IsFromCache { get; internal set; }

		public HTTPCacheFileInfo CacheFileInfo { get; internal set; }

		public bool IsCacheOnly { get; private set; }

		public Dictionary<string, List<string>> Headers { get; protected set; }

		public byte[] Data { get; internal set; }

		public bool IsUpgraded { get; protected set; }

		public List<Cookie> Cookies { get; internal set; }

		public string DataAsText
		{
			get
			{
				return null;
			}
		}

		public Texture2D DataAsTexture2D
		{
			get
			{
				return null;
			}
		}

		public bool IsClosedManually { get; protected set; }

		public HTTPResponse(HTTPRequest request, Stream stream, bool isStreamed, bool isFromCache)
		{
		}

		public virtual bool Receive(int forceReadRawContentLength = -1, bool readPayloadData = true)
		{
			return false;
		}

		protected bool ReadPayload(int forceReadRawContentLength)
		{
			return false;
		}

		protected void ReadHeaders(Stream stream)
		{
		}

		protected void AddHeader(string name, string value)
		{
		}

		public List<string> GetHeaderValues(string name)
		{
			return null;
		}

		public string GetFirstHeaderValue(string name)
		{
			return null;
		}

		public bool HasHeaderWithValue(string headerName, string value)
		{
			return false;
		}

		public bool HasHeader(string headerName)
		{
			return false;
		}

		public HTTPRange GetRange()
		{
			return null;
		}

		public static string ReadTo(Stream stream, byte blocker)
		{
			return null;
		}

		public static string ReadTo(Stream stream, byte blocker1, byte blocker2)
		{
			return null;
		}

		public static string NoTrimReadTo(Stream stream, byte blocker1, byte blocker2)
		{
			return null;
		}

		protected int ReadChunkLength(Stream stream)
		{
			return 0;
		}

		protected void ReadChunked(Stream stream)
		{
		}

		internal void ReadRaw(Stream stream, long contentLength)
		{
		}

		protected void ReadUnknownSize(Stream stream)
		{
		}

		protected byte[] DecodeStream(MemoryStream streamToDecode)
		{
			return null;
		}

		private byte[] Decompress(byte[] data, int offset, int count, bool forceDecompress = false)
		{
			return null;
		}

		protected void BeginReceiveStreamFragments()
		{
		}

		protected void FeedStreamFragment(byte[] buffer, int pos, int length)
		{
		}

		protected void FlushRemainingFragmentBuffer()
		{
		}

		protected void AddStreamedFragment(byte[] buffer)
		{
		}

		protected void WaitWhileHasFragments()
		{
		}

		private bool HasFragmentsInQueue()
		{
			return false;
		}

		public List<byte[]> GetStreamedFragments()
		{
			return null;
		}

		internal bool HasStreamedFragments()
		{
			return false;
		}

		internal void FinishStreaming()
		{
		}

		private void VerboseLogging(string str)
		{
		}

		public void Dispose()
		{
		}
	}
}
