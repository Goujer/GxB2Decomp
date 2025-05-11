using System.Collections;
using System.IO;
using Org.BouncyCastle.Crypto.Parameters;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class TlsDHKeyExchange : AbstractTlsKeyExchange
	{
		protected TlsSigner mTlsSigner;

		protected DHParameters mDHParameters;

		protected AsymmetricKeyParameter mServerPublicKey;

		protected TlsAgreementCredentials mAgreementCredentials;

		protected DHPrivateKeyParameters mDHAgreePrivateKey;

		protected DHPublicKeyParameters mDHAgreePublicKey;

		public override bool RequiresServerKeyExchange
		{
			get
			{
				return false;
			}
		}

		protected virtual int MinimumPrimeBits
		{
			get
			{
				return 0;
			}
		}

		public TlsDHKeyExchange(int keyExchange, IList supportedSignatureAlgorithms, DHParameters dhParameters)
			: base(0, null)
		{
		}

		public override void Init(TlsContext context)
		{
		}

		public override void SkipServerCredentials()
		{
		}

		public override void ProcessServerCertificate(Certificate serverCertificate)
		{
		}

		public override void ValidateCertificateRequest(CertificateRequest certificateRequest)
		{
		}

		public override void ProcessClientCredentials(TlsCredentials clientCredentials)
		{
		}

		public override void GenerateClientKeyExchange(Stream output)
		{
		}

		public override void ProcessClientCertificate(Certificate clientCertificate)
		{
		}

		public override void ProcessClientKeyExchange(Stream input)
		{
		}

		public override byte[] GeneratePremasterSecret()
		{
			return null;
		}

		protected virtual DHParameters ValidateDHParameters(DHParameters parameters)
		{
			return null;
		}
	}
}
