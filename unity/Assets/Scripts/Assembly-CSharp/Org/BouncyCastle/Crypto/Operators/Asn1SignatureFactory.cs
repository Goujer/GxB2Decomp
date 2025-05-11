using System.Collections;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Operators
{
	public class Asn1SignatureFactory : ISignatureFactory
	{
		private readonly AlgorithmIdentifier algID;

		private readonly string algorithm;

		private readonly AsymmetricKeyParameter privateKey;

		private readonly SecureRandom random;

		public object AlgorithmDetails
		{
			get
			{
				return null;
			}
		}

		public static IEnumerable SignatureAlgNames
		{
			get
			{
				return null;
			}
		}

		public Asn1SignatureFactory(string algorithm, AsymmetricKeyParameter privateKey)
		{
		}

		public Asn1SignatureFactory(string algorithm, AsymmetricKeyParameter privateKey, SecureRandom random)
		{
		}

		public IStreamCalculator CreateCalculator()
		{
			return null;
		}
	}
}
