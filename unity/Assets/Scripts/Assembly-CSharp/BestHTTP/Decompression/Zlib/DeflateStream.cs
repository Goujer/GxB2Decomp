using System.IO;

namespace BestHTTP.Decompression.Zlib
{
	internal class DeflateStream : Stream
	{
		internal ZlibBaseStream _baseStream;

		internal Stream _innerStream;

		private bool _disposed;

		public virtual FlushType FlushMode
		{
			get
			{
				return default(FlushType);
			}
			set
			{
			}
		}

		public int BufferSize
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public CompressionStrategy Strategy
		{
			get
			{
				return default(CompressionStrategy);
			}
			set
			{
			}
		}

		public virtual long TotalIn
		{
			get
			{
				return 0L;
			}
		}

		public virtual long TotalOut
		{
			get
			{
				return 0L;
			}
		}

		public override bool CanRead
		{
			get
			{
				return false;
			}
		}

		public override bool CanSeek
		{
			get
			{
				return false;
			}
		}

		public override bool CanWrite
		{
			get
			{
				return false;
			}
		}

		public override long Length
		{
			get
			{
				return 0L;
			}
		}

		public override long Position
		{
			get
			{
				return 0L;
			}
			set
			{
			}
		}

		public DeflateStream(Stream stream, CompressionMode mode)
		{
		}

		public DeflateStream(Stream stream, CompressionMode mode, CompressionLevel level)
		{
		}

		public DeflateStream(Stream stream, CompressionMode mode, bool leaveOpen)
		{
		}

		public DeflateStream(Stream stream, CompressionMode mode, CompressionLevel level, bool leaveOpen)
		{
		}

		public DeflateStream(Stream stream, CompressionMode mode, CompressionLevel level, bool leaveOpen, int windowBits)
		{
		}

		protected override void Dispose(bool disposing)
		{
		}

		public override void Flush()
		{
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			return 0;
		}

		public override long Seek(long offset, SeekOrigin origin)
		{
			return 0L;
		}

		public override void SetLength(long value)
		{
		}

		public override void Write(byte[] buffer, int offset, int count)
		{
		}

		public static byte[] CompressString(string s)
		{
			return null;
		}

		public static byte[] CompressBuffer(byte[] b)
		{
			return null;
		}

		public static string UncompressString(byte[] compressed)
		{
			return null;
		}

		public static byte[] UncompressBuffer(byte[] compressed)
		{
			return null;
		}
	}
}
