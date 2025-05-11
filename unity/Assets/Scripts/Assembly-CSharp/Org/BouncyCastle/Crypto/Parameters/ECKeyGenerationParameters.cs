using Org.BouncyCastle.Asn1;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ECKeyGenerationParameters : KeyGenerationParameters
	{
		private readonly ECDomainParameters domainParams;

		private readonly DerObjectIdentifier publicKeyParamSet;

		public ECDomainParameters DomainParameters
		{
			get
			{
				return null;
			}
		}

		public DerObjectIdentifier PublicKeyParamSet
		{
			get
			{
				return null;
			}
		}

		public ECKeyGenerationParameters(ECDomainParameters domainParameters, SecureRandom random)
			: base(null, 0)
		{
		}

		public ECKeyGenerationParameters(DerObjectIdentifier publicKeyParamSet, SecureRandom random)
			: base(null, 0)
		{
		}
	}
}
