namespace Org.BouncyCastle.Crypto.Parameters
{
	public class RC5Parameters : KeyParameter
	{
		private readonly int rounds;

		public int Rounds
		{
			get
			{
				return 0;
			}
		}

		public RC5Parameters(byte[] key, int rounds)
			: base(null)
		{
		}
	}
}
