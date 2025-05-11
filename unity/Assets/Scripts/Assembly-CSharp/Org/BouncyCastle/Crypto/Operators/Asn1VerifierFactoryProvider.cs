using System.Collections;

namespace Org.BouncyCastle.Crypto.Operators
{
	public class Asn1VerifierFactoryProvider : IVerifierFactoryProvider
	{
		private readonly AsymmetricKeyParameter publicKey;

		public IEnumerable SignatureAlgNames
		{
			get
			{
				return null;
			}
		}

		public Asn1VerifierFactoryProvider(AsymmetricKeyParameter publicKey)
		{
		}

		public IVerifierFactory CreateVerifierFactory(object algorithmDetails)
		{
			return null;
		}
	}
}
