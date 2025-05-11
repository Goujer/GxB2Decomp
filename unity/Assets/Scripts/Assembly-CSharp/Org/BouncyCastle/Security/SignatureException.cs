using System;

namespace Org.BouncyCastle.Security
{
	[Serializable]
	public class SignatureException : GeneralSecurityException
	{
		public SignatureException()
		{
		}

		public SignatureException(string message)
		{
		}

		public SignatureException(string message, Exception exception)
		{
		}
	}
}
