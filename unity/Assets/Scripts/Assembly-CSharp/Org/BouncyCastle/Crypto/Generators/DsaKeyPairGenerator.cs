using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Math;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Generators
{
	public class DsaKeyPairGenerator : IAsymmetricCipherKeyPairGenerator
	{
		private static readonly BigInteger One;

		private DsaKeyGenerationParameters param;

		public void Init(KeyGenerationParameters parameters)
		{
		}

		public AsymmetricCipherKeyPair GenerateKeyPair()
		{
			return null;
		}

		private static BigInteger GeneratePrivateKey(BigInteger q, SecureRandom random)
		{
			return null;
		}

		private static BigInteger CalculatePublicKey(BigInteger p, BigInteger g, BigInteger x)
		{
			return null;
		}
	}
}
