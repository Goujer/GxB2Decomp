using Org.BouncyCastle.Asn1.X509;

namespace Org.BouncyCastle.Crypto.Operators
{
	public class Asn1VerifierFactory : IVerifierFactory
	{
		private readonly AlgorithmIdentifier algID;

		private readonly AsymmetricKeyParameter publicKey;

		public object AlgorithmDetails
		{
			get
			{
				return null;
			}
		}

		public Asn1VerifierFactory(string algorithm, AsymmetricKeyParameter publicKey)
		{
		}

		public Asn1VerifierFactory(AlgorithmIdentifier algorithm, AsymmetricKeyParameter publicKey)
		{
		}

		public IStreamCalculator CreateCalculator()
		{
			return null;
		}
	}
}
