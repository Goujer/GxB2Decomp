using System;

namespace Org.BouncyCastle.Crypto
{
	[Serializable]
	public class MaxBytesExceededException : CryptoException
	{
		public MaxBytesExceededException()
		{
		}

		public MaxBytesExceededException(string message)
		{
		}

		public MaxBytesExceededException(string message, Exception e)
		{
		}
	}
}
