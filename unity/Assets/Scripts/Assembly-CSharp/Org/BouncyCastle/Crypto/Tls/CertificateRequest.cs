using System.Collections;
using System.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class CertificateRequest
	{
		protected readonly byte[] mCertificateTypes;

		protected readonly IList mSupportedSignatureAlgorithms;

		protected readonly IList mCertificateAuthorities;

		public virtual byte[] CertificateTypes
		{
			get
			{
				return null;
			}
		}

		public virtual IList SupportedSignatureAlgorithms
		{
			get
			{
				return null;
			}
		}

		public virtual IList CertificateAuthorities
		{
			get
			{
				return null;
			}
		}

		public CertificateRequest(byte[] certificateTypes, IList supportedSignatureAlgorithms, IList certificateAuthorities)
		{
		}

		public virtual void Encode(Stream output)
		{
		}

		public static CertificateRequest Parse(TlsContext context, Stream input)
		{
			return null;
		}
	}
}
