using System;

namespace Org.BouncyCastle.Security.Certificates
{
	[Serializable]
	public class CertificateExpiredException : CertificateException
	{
		public CertificateExpiredException()
		{
		}

		public CertificateExpiredException(string message)
		{
		}

		public CertificateExpiredException(string message, Exception exception)
		{
		}
	}
}
