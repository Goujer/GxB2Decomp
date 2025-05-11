namespace Org.BouncyCastle.Crypto.Tls
{
	public class ByteQueue
	{
		private const int DefaultCapacity = 1024;

		private byte[] databuf;

		private int skipped;

		private int available;

		public int Available
		{
			get
			{
				return 0;
			}
		}

		public ByteQueue()
		{
		}

		public ByteQueue(int capacity)
		{
		}

		public static int NextTwoPow(int i)
		{
			return 0;
		}

		public void Read(byte[] buf, int offset, int len, int skip)
		{
		}

		public void AddData(byte[] data, int offset, int len)
		{
		}

		public void RemoveData(int i)
		{
		}

		public void RemoveData(byte[] buf, int off, int len, int skip)
		{
		}

		public byte[] RemoveData(int len, int skip)
		{
			return null;
		}
	}
}
