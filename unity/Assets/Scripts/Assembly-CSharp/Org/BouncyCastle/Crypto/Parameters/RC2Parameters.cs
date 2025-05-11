namespace Org.BouncyCastle.Crypto.Parameters
{
	public class RC2Parameters : KeyParameter
	{
		private readonly int bits;

		public int EffectiveKeyBits
		{
			get
			{
				return 0;
			}
		}

		public RC2Parameters(byte[] key)
			: base(null)
		{
		}

		public RC2Parameters(byte[] key, int keyOff, int keyLen)
			: base(null)
		{
		}

		public RC2Parameters(byte[] key, int bits)
			: base(null)
		{
		}

		public RC2Parameters(byte[] key, int keyOff, int keyLen, int bits)
			: base(null)
		{
		}
	}
}
