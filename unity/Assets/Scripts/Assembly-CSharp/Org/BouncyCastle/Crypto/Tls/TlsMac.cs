namespace Org.BouncyCastle.Crypto.Tls
{
	public class TlsMac
	{
		protected readonly TlsContext context;

		protected readonly byte[] secret;

		protected readonly IMac mac;

		protected readonly int digestBlockSize;

		protected readonly int digestOverhead;

		protected readonly int macLength;

		public virtual byte[] MacSecret
		{
			get
			{
				return null;
			}
		}

		public virtual int Size
		{
			get
			{
				return 0;
			}
		}

		public TlsMac(TlsContext context, IDigest digest, byte[] key, int keyOff, int keyLen)
		{
		}

		public virtual byte[] CalculateMac(long seqNo, byte type, byte[] message, int offset, int length)
		{
			return null;
		}

		public virtual byte[] CalculateMacConstantTime(long seqNo, byte type, byte[] message, int offset, int length, int fullLength, byte[] dummyData)
		{
			return null;
		}

		protected virtual int GetDigestBlockCount(int inputLength)
		{
			return 0;
		}

		protected virtual byte[] Truncate(byte[] bs)
		{
			return null;
		}
	}
}
