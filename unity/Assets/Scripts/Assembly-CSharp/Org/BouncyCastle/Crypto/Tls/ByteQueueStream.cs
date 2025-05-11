using System.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class ByteQueueStream : Stream
	{
		private readonly ByteQueue buffer;

		public virtual int Available
		{
			get
			{
				return 0;
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

		public override void Flush()
		{
		}

		public virtual int Peek(byte[] buf)
		{
			return 0;
		}

		public virtual int Read(byte[] buf)
		{
			return 0;
		}

		public override int Read(byte[] buf, int off, int len)
		{
			return 0;
		}

		public override int ReadByte()
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

		public virtual int Skip(int n)
		{
			return 0;
		}

		public virtual void Write(byte[] buf)
		{
		}

		public override void Write(byte[] buf, int off, int len)
		{
		}

		public override void WriteByte(byte b)
		{
		}
	}
}
