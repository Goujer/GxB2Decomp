using System;

namespace Org.BouncyCastle.Security.Certificates
{
	[Serializable]
	public class CertificateParsingException : CertificateException
	{
		public CertificateParsingException()
		{
		}

		public CertificateParsingException(string message)
		{
		}

		public CertificateParsingException(string message, Exception exception)
		{
		}
	}
}
