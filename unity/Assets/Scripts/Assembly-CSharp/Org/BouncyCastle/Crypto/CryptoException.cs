using System;

namespace Org.BouncyCastle.Crypto
{
	[Serializable]
	public class CryptoException : Exception
	{
		public CryptoException()
		{
		}

		public CryptoException(string message)
		{
		}

		public CryptoException(string message, Exception exception)
		{
		}
	}
}
