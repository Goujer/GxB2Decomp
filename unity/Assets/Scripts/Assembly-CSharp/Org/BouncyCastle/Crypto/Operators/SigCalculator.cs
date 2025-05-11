using System.IO;

namespace Org.BouncyCastle.Crypto.Operators
{
	internal class SigCalculator : IStreamCalculator
	{
		private readonly ISigner sig;

		private readonly Stream stream;

		public Stream Stream
		{
			get
			{
				return null;
			}
		}

		internal SigCalculator(ISigner sig)
		{
		}

		public object GetResult()
		{
			return null;
		}
	}
}
