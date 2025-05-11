using System.IO;
using Org.BouncyCastle.Asn1.Ocsp;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class CertificateStatus
	{
		protected readonly byte mStatusType;

		protected readonly object mResponse;

		public virtual byte StatusType
		{
			get
			{
				return 0;
			}
		}

		public virtual object Response
		{
			get
			{
				return null;
			}
		}

		public CertificateStatus(byte statusType, object response)
		{
		}

		public virtual OcspResponse GetOcspResponse()
		{
			return null;
		}

		public virtual void Encode(Stream output)
		{
		}

		public static CertificateStatus Parse(Stream input)
		{
			return null;
		}

		protected static bool IsCorrectType(byte statusType, object response)
		{
			return false;
		}
	}
}
