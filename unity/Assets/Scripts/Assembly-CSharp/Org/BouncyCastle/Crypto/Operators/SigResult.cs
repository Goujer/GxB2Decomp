namespace Org.BouncyCastle.Crypto.Operators
{
	internal class SigResult : IBlockResult
	{
		private readonly ISigner sig;

		internal SigResult(ISigner sig)
		{
		}

		public byte[] Collect()
		{
			return null;
		}

		public int Collect(byte[] destination, int offset)
		{
			return 0;
		}
	}
}
